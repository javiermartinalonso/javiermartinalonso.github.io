import groovy.xml.*
import java.util.logging.Logger
import groovy.transform.ToString
import groovy.json.*

@Grab( 'org.apache.poi:poi:3.9' )
import static org.apache.poi.ss.usermodel.CellStyle.*
import static org.apache.poi.ss.usermodel.IndexedColors.*
import org.apache.poi.hssf.usermodel.HSSFWorkbook


// http://metadataconsulting.github.io/spreadsheet-builder/

def myFolder = new File('C:/BonitaBPMSubscription-7.2.2/workspace-2018-07-13/repositorio-angola-telecom/diagrams')

def diagrams = getFolderInfo(myFolder)

new HSSFWorkbook().with { workbook ->
  def styles = [ LIGHT_BLUE, LIGHT_GREEN, LIGHT_ORANGE ].collect { color ->
    createCellStyle().with { style ->
      fillForegroundColor = color.index
      fillPattern = SOLID_FOREGROUND
      style
    }
  }



      createSheet( 'Diagrama - Procesos' ).with { sheet ->
      // [diagrama, proceso, version]
      def processRows = []
      diagrams.each { dia ->
          processRows.addAll(
              dia.processes.collect {
                  proc -> 
                  [dia.name, dia.file, proc.name, proc.version]
              }
          )
      }

      //Header row
      createRow( 0 ).with { row ->
        ['Diagram name','Diagram file','Process name','Process version'].eachWithIndex { hd, colnum ->
            createCell( colnum ).with { cell ->
                    setCellValue( hd )
                }
        }
    }

      processRows.eachWithIndex { rowData, rownum ->
          createRow( rownum+1 ).with { row -> 
              rowData.eachWithIndex { colValue, colnum ->
                  createCell( colnum ).with { cell ->
                      setCellValue( colValue.toString() )
                  }
              }
          }    
      }





      //Sacar el llama a de los procesos y el llamado por...

      /*
    (0..4).each { rownum ->
      createRow( rownum ).with { row ->
        (0..4).each { colnum ->
          createCell( colnum ).with { cell ->
            setCellValue( "[$colnum,$rownum]" )
            cellStyle = styles[ ( ( rownum * 5 ) + colnum ) % styles.size() ]
          }
        }
      }
    }
    */
   
  }

  createSheet( 'Proceso - Llamado por' ).with { sheet ->
      def processRows = []
      diagrams.each { dia ->
              dia.processes.each {
                  proc ->
                      processRows.addAll(
                          proc.callActivities.collect {
                              callAct ->
                                [callAct.calledActivityName, callAct.calledActivityVersion, proc.name, proc.version, callAct.name]
                          }
                      )
              }
          
      }

      //Header row
      createRow( 0 ).with { row ->
        ['Process name','Process version','Caller process name','Caller process version','Caller Task name'].eachWithIndex { hd, colnum ->
            createCell( colnum ).with { cell ->
                    setCellValue( hd )
                }
        }
    }

      processRows.eachWithIndex { rowData, rownum ->
          createRow( rownum+1 ).with { row -> 
              rowData.eachWithIndex { colValue, colnum ->
                  createCell( colnum ).with { cell ->
                      setCellValue( colValue.toString() )
                  }
              }
          }    
      }
   
  }

  createSheet( 'Proceso - Llama a' ).with { sheet ->
      // [diagrama, proceso, version]
      def processRows = []
      diagrams.each { dia ->
              dia.processes.each {
                  proc ->
                      processRows.addAll(
                          proc.callActivities.collect {
                              callAct ->
                                [proc.name, proc.version, callAct.name, callAct.calledActivityName, callAct.calledActivityVersion]
                          }
                      )
              }
          
      }

      //Header row
      createRow( 0 ).with { row ->
        ['Process name','Process version','Task name','Called process name','Called process version'].eachWithIndex { hd, colnum ->
            createCell( colnum ).with { cell ->
                    setCellValue( hd )
                }
        }
    }

      processRows.eachWithIndex { rowData, rownum ->
          createRow( rownum+1 ).with { row -> 
              rowData.eachWithIndex { colValue, colnum ->
                  createCell( colnum ).with { cell ->
                      setCellValue( colValue.toString() )
                  }
              }
          }    
      }
   
  }
  
  //Creamos una hoja para los flowNodes y las traducciones.
  createSheet( 'Proceso - FlowNodes' ).with { sheet ->
     
      def processRows = []
      diagrams.each { dia ->
              dia.processes.each {
                  proc ->
                      processRows.addAll(
                          proc.flowNodes.collect {
                              flowNode ->
                                [dia.name, dia.file, proc.name, '', proc.version, flowNode.name, flowNode.type, flowNode.portalName]
                          }
                      )
              }
          
      }

      //Header row
      createRow( 0 ).with { row ->
        ['Diagram Name', 'Diagram file', 'Process name','Process portal name','Process version','FlowNode Name','FlowNode Type','FlowNode PortalName'].eachWithIndex { hd, colnum ->
            createCell( colnum ).with { cell ->
                    setCellValue( hd )
                }
        }
    }

      processRows.eachWithIndex { rowData, rownum ->
          createRow( rownum+1 ).with { row -> 
              rowData.eachWithIndex { colValue, colnum ->
                  createCell( colnum ).with { cell ->
                      setCellValue( colValue.toString() )
                  }
              }
          }    
      }
   
  }

  new File( 'C:/99-BORRAR/dependencias_entre_procesos_2019_03_14.xls' ).withOutputStream { os ->
      write( os )
  }

}


Diagram[] getFolderInfo(folder) {
    def diagrams = []

    folder.eachFile() { file ->
        diagrams.add(getFileInfo(file))
    }

    diagrams
}

Diagram getFileInfo(file) {

    //println file.name
    def diagram = new Diagram() 
    
    def xmi = new XmlSlurper().parse(file)


    assert xmi instanceof groovy.util.slurpersupport.GPathResult

    diagram.name = xmi.MainProcess.@name
    diagram.file = file.name

    diagram.processes =  xmi.MainProcess.'*'.findAll {

        node -> node.name() == 'elements' & node.@'xmi:type' == 'process:Pool'

    }.collect {

        node -> 

        def process = new Process()
        
        process.name = node.@name
        process.version = node.@version

        process.callActivities = node.'*'.findAll {
            it -> it.name() == 'elements' & it.@'xmi:type' == 'process:CallActivity'            
        }.collect{
            callAct -> 

            def call = new CallActivity()

            call.name = callAct.@name
            call.calledActivityName = callAct.calledActivityName.@name
            call.calledActivityVersion =callAct.calledActivityVersion.@name

            call
        }
        
        // Nos guardamos tareas y gateways
        process.flowNodes = node.'*'.findAll {
            it -> it.name() == 'elements' 
            //& it.@'xmi:type' != 'process:CallActivity'            
        }.collect{
            myNode -> 

            def flowNode = new FlowNode()

            flowNode.name = myNode.@name
            flowNode.type = myNode.@'xmi:type'
        
            //TODO esto busca solo en los hijos inmediatoe parece
            dynamicLabel = myNode.'*'.find { it -> it.name() == 'dynamicLabel'}
          
            if (dynamicLabel) {
                flowNode.portalName = dynamicLabel.@content
                
                //println "${flowNode.name} - ${flowNode.type}"  + dynamicLabel.@'name'           
            }
        
            flowNode
        }

        process
    }
    
    diagram
}

@ToString
class Diagram {
    def name
    def file
    def version
    def processes
}

@ToString
class Process {
    def name
    def version
    def callActivities
    def flowNodes
}

@ToString
class CallActivity {
    def name
    def calledActivityName
    def calledActivityVersion
}

@ToString
class FlowNode {
    def name
    def type
    def portalName
}