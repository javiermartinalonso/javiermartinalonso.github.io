package com.alvatross.socp.jms.event;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.util.Map;

import org.apache.kafka.common.serialization.Deserializer;

import com.alvatross.socp.model.notification.ServiceOrderNotification;

public class CustomDesSerializer implements Deserializer<ServiceOrderNotification> {

	@Override
	public void configure(Map<String, ?> configs, boolean isKey) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ServiceOrderNotification deserialize(String topic, byte[] data) {
		ByteArrayInputStream bis = new ByteArrayInputStream(data);
		ObjectInput in = null;
		ServiceOrderNotification o=null;
		  try {
			in = new ObjectInputStream(bis);
			o = (ServiceOrderNotification) in.readObject(); 
			  
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return o;
		
	}

	@Override
	public void close() {
		// TODO Auto-generated method stub
		
	}

}
