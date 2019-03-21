import groovy.xml.*
import java.util.logging.Logger
import groovy.transform.ToString
import groovy.json.*

@Grab( 'org.apache.poi:poi:3.9' )
@Grab( 'org.apache.poi:poi-ooxml:3.9' )
import static org.apache.poi.ss.usermodel.CellStyle.*
import static org.apache.poi.ss.usermodel.IndexedColors.*
import org.apache.poi.ss.usermodel.*
import org.apache.poi.hssf.usermodel.*
import org.apache.poi.xssf.usermodel.*
import org.apache.poi.ss.util.*
import java.nio.charset.StandardCharsets


// http://metadataconsulting.github.io/spreadsheet-builder/


/*

 metodo: Hay que cargar los datos de fila de la Excel y agrupar por fichero y proceso...
 
 
 x Cada diagrama que salga en la excel:
 
 parsear el xml
 updateFlowNodePortalName (xml, processName, Flownode, FlowNodePortalname)
 guardar el xml

*/


flowNodeEntries =  parseExcelFile()

println "We've got ${flowNodeEntries.size()} rows of data"

//Ahora vamos fichero por fichero a modificar
def fileList = flowNodeEntries.collect { f -> f.diagramFile }

fileList.unique()

fileList.each {
    fileName ->
    try {
        fixFileFlowNodePortalnamesFile(fileName, flowNodeEntries.findAll { e -> e.diagramFile == fileName })
    } catch(Exception ex) {
        ex.printStackTrace();
    }    
}



void fixFileFlowNodePortalnamesFile(fileName, flowNodeEntries) {

    def myFolder = new File('C:/BonitaBPMSubscription-7.2.2/workspace_17_1_17/repositorio-angola-telecom/diagrams')

    //----------------- Tema XML
    def file = new File(myFolder, fileName)
    
    def xml = new XmlSlurper(false,true).parse(file)
    
    assert xml instanceof groovy.util.slurpersupport.GPathResult
    
    //println "fixing the file ${fileName}"
    
    num_entries = fixFlowNodePortalNames(xml, flowNodeEntries)
    
   
    
    if (num_entries > 0) {
        println "${num_entries} where updated on  the file ${fileName}"
        updateFile(file, xml)
    }

}

void updateFile(file, xml) {
       //Save File
    //def writer = new FileWriter(file)
    
    def writer = new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8);
    
    
    //Option 2: Pretty print XML
    /*
    XmlUtil.serialize(xml, writer)
    
    xml = new XmlParser().parse(file)
    XmlUtil.serialize(xml, writer)
    */
    
    /*
    xmlns:connectorconfiguration="http://wwww.bonitasoft.org/model/connector/configuration" 
    xmlns:decision="http://www.bonitasoft.org/ns/studio/process/decision" 
    xmlns:definition="http://www.bonitasoft.org/ns/connector/definition/6.1" 
    xmlns:expression="http://www.bonitasoft.org/ns/studio/expression" 
    xmlns:notation="http://www.eclipse.org/gmf/runtime/1.0.2/notation"
    xmlns:parameter="http://www.bonitasoft.org/ns/studio/parameter" 
    xmlns:process="http://www.bonitasoft.org/ns/studio/process" 
    ? Faltara alguno??
    */
    
    def outputBuilder = new StreamingMarkupBuilder()
    String result = XmlUtil.serialize(outputBuilder.bind {
        mkp.declareNamespace('connectorconfiguration' : "http://wwww.bonitasoft.org/model/connector/configuration")
        mkp.declareNamespace('decision':"http://www.bonitasoft.org/ns/studio/process/decision")
        mkp.declareNamespace('definition':"http://www.bonitasoft.org/ns/connector/definition/6.1") 
        mkp.declareNamespace('expression':"http://www.bonitasoft.org/ns/studio/expression")
        mkp.declareNamespace('notation':"http://www.eclipse.org/gmf/runtime/1.0.2/notation")
        mkp.declareNamespace('parameter':"http://www.bonitasoft.org/ns/studio/parameter") 
        mkp.declareNamespace('process':"http://www.bonitasoft.org/ns/studio/process") 
        mkp.declareNamespace('transitions':"http://www.bonitasoft.org/ns/studio/process/decision/transitions") 
        
         mkp.yield xml }, writer
     )
 
     writer.close();
}    

// el xml es el diagrama donde se encuentran los procesos referenciados por flowNodeEntries
int fixFlowNodePortalNames(xml, flowNodeEntries) {

    //println "Corrigiendo ${flowNodeEntries.size()} entradas para el xml"
    
    count = 0;

    flowNodeEntries.each {
        entry -> 
        
        //Hay que buscar el pool correspondiente
        // xmi:type == 'process:Pool' name == 'processName'
    
        // Buscamos en los hijos por xmi:type y por name y hacemos el replace... 
       
        //Desde el nodo raiz del diagrama buscamos el proceso
        xml.MainProcess.'**'.findAll {
    
            node -> node.name() == 'elements' & node.@'name' == entry.processName & node.@'xmi:type' == 'process:Pool'
    
        }
        .each {
            
            process -> 
            
            //println "Estoy en el proceso ${process.@'name'}"
            
            process.'**'.findAll {
                
                node -> node.name() == 'elements' & node.@'name' == entry.flowNodeName & node.@'xmi:type' == entry.flowNodeType
                
            }.each {
                
                flowNode ->
                
                
            
                def dynLabel = flowNode.'**'.find { node -> node.name() == 'dynamicLabel' }
        
                //De momento solo actializamos los que estabam vacios y tienen valor en la Excel
                if (entry.flowNodePortalName != null && entry.flowNodePortalName.trim() &&  entry.flowNodePortalName != 'null') {
                    //TODO estudiar si es interesante corregir tambien los nombres de las tareas. Para que este traducido tambien 
                    //flowNode.@'name' = entry.flowNodePortalName
                    if ( dynLabel && ! dynLabel.@'name'.text()?.trim()) {   
                        println "-----------------------------------------------------------------"
                        println "Estoy en el flowNode ${process.@'name'} - ${flowNode.@'name'}"
                        println "Dynlabel encontrada cambiando el valor actual ${dynLabel.@'name'} por ${entry.flowNodePortalName}"
                        dynLabel.@'name' = entry.flowNodePortalName
                        dynLabel.@'content' = entry.flowNodePortalName
                        println "-----------------------------------------------------------------"
                        count++
                    } else {
                       println "WARN: dynLabel not found for ${entry.processName} - ${entry.flowNodeName} - ${entry.flowNodePortalName}"
                    }   
                } 
           }
        }
   }
   
   count
  
} 


FlownodeEntry[] parseExcelFile() {
    def excelFile = new File('C:/Proyectos/Angola Telecom/Consultas/trad_10_08_PT.xls')
    def workbook = WorkbookFactory.create(excelFile);



    def ws = workbook.getSheet("Proceso - FlowNodes")
    
    ws.removeRow(ws[0])
    
    ws.collect {
        row ->
        
        flowNodeEntry  = new FlownodeEntry()
        flowNodeEntry.diagramName = row[0].getStringCellValue()
        flowNodeEntry.diagramFile = row[1].getStringCellValue()
        flowNodeEntry.processName = row[2].getStringCellValue()
        flowNodeEntry.processPortalName = row[3].getStringCellValue()
        flowNodeEntry.processVersion = row[4].getStringCellValue()
        flowNodeEntry.flowNodeName = row[5].getStringCellValue()
        flowNodeEntry.flowNodeType = row[6].getStringCellValue()
        flowNodeEntry.flowNodePortalName = row[7].getStringCellValue()
        
        flowNodeEntry
    }

    
}

@ToString
class FlownodeEntry {
    def diagramName
    def diagramFile
    def processName
    def processPortalName
    def processVersion
    def flowNodeName
    def flowNodeType
    def flowNodePortalName
}