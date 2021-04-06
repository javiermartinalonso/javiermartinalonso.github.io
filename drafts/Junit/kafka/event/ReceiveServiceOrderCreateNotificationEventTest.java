
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.listener.ContainerProperties;
import org.springframework.kafka.listener.KafkaMessageListenerContainer;
import org.springframework.kafka.listener.MessageListener;
import org.springframework.kafka.test.EmbeddedKafkaBroker;
import org.springframework.kafka.test.context.EmbeddedKafka;
import org.springframework.kafka.test.utils.ContainerTestUtils;
import org.springframework.kafka.test.utils.KafkaTestUtils;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;

import com.alvatross.socp.model.notification.Event;
import com.alvatross.socp.model.notification.ServiceOrder;
import com.alvatross.socp.model.notification.ServiceOrderNotification;
import com.alvatross.socp.service.ServiceOrderExecutionPlanService;

@EmbeddedKafka
@RunWith(SpringRunner.class)
@DirtiesContext
@SpringBootTest(classes = {ReceiveServiceOrderCreateNotificationEvent.class}) // Specify @KafkaListener class if its not the same class, or not loaded with test config
public class ReceiveServiceOrderCreateNotificationEventTest {

	@Value(value = "${kafka.service.order.topic:serviceOrderTopic}")
	private static final String TOPIC = "serviceOrderTopic";
	
	@Value(value = "${kafka.service.order.groupid:serviceOrderPlannerConsumer}")
	private static final String GROUPID = "serviceOrderPlannerConsumer";
	
    @Autowired
    private EmbeddedKafkaBroker embeddedKafkaBroker;
    
	@MockBean
	private ServiceOrderExecutionPlanService planService;

	private BlockingQueue<ConsumerRecord<String, ServiceOrderNotification>> records;

	private KafkaMessageListenerContainer<String, ServiceOrderNotification> container;
        
    @Before
    public void setUp() {	
    	//Configuramos el consumidor 	
        Map<String, Object> consumerConfigs = KafkaTestUtils.consumerProps(GROUPID, "false", embeddedKafkaBroker);
        DefaultKafkaConsumerFactory<String, ServiceOrderNotification> consumerFactory = new DefaultKafkaConsumerFactory<>(consumerConfigs, new StringDeserializer(), new CustomDesSerializer());
        
        //suscribir al consumidor a un tema
        ContainerProperties containerProperties = new ContainerProperties(TOPIC);
        container = new KafkaMessageListenerContainer<>(consumerFactory, containerProperties);

        //Mensajes que leemos de la cola
        records = new LinkedBlockingQueue<>();
        
        //Este contenedor tiene un escucha de mensajes y los escribe tan pronto como se reciben en una cola
        container.setupMessageListener((MessageListener<String, ServiceOrderNotification>) records::add);
                
        container.start();
        
        //estamos esperando la asignación inicial        
        ContainerTestUtils.waitForAssignment(container, embeddedKafkaBroker.getPartitionsPerTopic());
    }

    @After
    public void tearDown() {
    	//asegurarnos de tener un contexto limpio en un escenario de prueba múltiple
        container.stop();
    }

    @Test
    public void kafkaSetup_withTopic_ensureSendMessageIsReceived() throws Exception {
        // Configuracion del productor kafka   
        Map<String, Object> configs = KafkaTestUtils.producerProps(embeddedKafkaBroker);
        
        Producer<String, ServiceOrderNotification> producer = new DefaultKafkaProducerFactory<>(configs, new StringSerializer(), new CustomSerializer()).createProducer();

        //Contenido del mensaje
        ServiceOrderNotification son = new ServiceOrderNotification();
        son.setEventId("test_event_uuid_test");
        ServiceOrder so= new ServiceOrder();
        Event event = new Event();
        event.setServiceOrder(so);
		son.setEvent(event);
			
        producer.send(new ProducerRecord<>(TOPIC, "test_event_uuid_test", son));
        producer.flush();
                
        //Consumir mensaje
        ConsumerRecord<String, ServiceOrderNotification> singleRecord = records.poll(100, TimeUnit.MILLISECONDS);
        ServiceOrderNotification sonRecived=singleRecord.value();
        
        // Assert
        assertThat(singleRecord).isNotNull();
        assertThat(singleRecord.key()).isEqualTo("test_event_uuid_test");
        assertThat(sonRecived.getEventId().equals(son.getEventId()));
        assertThat(sonRecived).isEqualTo(son);
    }