-------------------------------------------------------------------------------------------------------------------------------------------------
--- -cambiar de schema
-------------------------------------------------------------------------------------------------------------------------------------------------
ALTER SESSION SET CURRENT_SCHEMA = bpm;

-------------------------------------------------------------------------------------------------------------------------------------------------
--- ver las tareas que se han ejecutado y en que orden
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT id, SOURCEOBJECTID, name, PARENTCONTAINERID 
FROM BPM.ARCH_FLOWNODE_INSTANCE fw 
WHERE fw.ROOTCONTAINERID=58854 
ORDER BY fw.LASTUPDATEDATE asc;

-------------------------------------------------------------------------------------------------------------------------------------------------
--- ver los datos historicos de un caso.
-------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM  BPM.ARCH_DATA_INSTANCE di WHERE di.CONTAINERID = 58857 ORDER BY ARCHIVEDATE desc;

SELECT * FROM ACTIVATION.ACTIVATION_TASK_EXECUTION ORDER BY FINISH_DATE  DESC;


-------------------------------------------------------------------------------------------------------------------------------------------------
--- Instancias de un proceso por nombre de proceso
-------------------------------------------------------------------------------------------------------------------------------------------------
select p.id, p.name, fw.* from BPM.PROCESS_INStance p
left join BPM.FLOWNODE_INSTANCE fw on fw.ROOTCONTAINERID = p.id
where p.name like '%POTS%' and p.name != 'Alta POTS' order by p.id, fw.REACHEDSTATEDATE;


-------------------------------------------------------------------------------------------------------------------------------------------------
--- Obtener numero de Instancias y de casos archivados
--- Como administrador, vamos a BPM/Procesos y buscamos el proceso en cuestion, pinchamos en él y de la url resultante nos quedamos con el Id.
--- 
--- ejemplo:
--- http://srv-bprosigossbpm.sigo.angolatelecom.ao/bonita/portal/homepage#?_p=processlistingadmin&_pf=2&_f=enabledprocesses&_id=6686430409344616598
--- 
--- Id = 6686430409344616598
-------------------------------------------------------------------------------------------------------------------------------------------------

-- Instancias de proceso
SELECT count(*) FROM BPM.PROCESS_INSTANCE pi WHERE pi.PROCESSDEFINITIONID =6686430409344616598; 

-- Instancias de Procesos archivadas
SELECT count(*) FROM BPM.ARCH_PROCESS_INSTANCE pi WHERE pi.PROCESSDEFINITIONID =6686430409344616598; 

-------------------------------------------------------------------------------------------------------------------------------------------------
--- buscar casos archivados directamente en bbdd
-------------------------------------------------------------------------------------------------------------------------------------------------
select * from bpm.arch_process_instance pi where pi.sourceobjectid = 24172;

-------------------------------------------------------------------------------------------------------------------------------------------------
--- cuando el provisionmonitoring no encuentra provisiones por feasibility_id:
-------------------------------------------------------------------------------------------------------------------------------------------------
select * from CRM_MEDIATOR.PROVISION_ORDER po where po.feasibility_id = '69debd96-0c45-4ff9-b5bf-7a15007af3a0';

-------------------------------------------------------------------------------------------------------------------------------------------------
--- Para jugar con los datos de los procesos/subprocesos y ver el contenido de los datos
--- aqui estan los datos --> BPM.DATA_INSTANCE
--- aqui esta la instancia del proceso o subproceso --> BPM.PROCESS_INSTANCE
--- aqui se puede consultar la info sobre una tarea  --> BPM.FLOWNODE_INSTANCE
--- 	aqui el rootcontainerid es el numero del caso del proceso padre, el parentcontainerid es el id del subproceso.
--- con esta query vemos como identificar el registro a actualizar:
--- 
--- donde 25012 es el id del proceso que quermos consultar ya sea el padre o el subproceso, el id del caso. 
---BPM.DATA_INSTANCE
---BPM.ARCH_DATA_INSTANCE
---PROVISION.TASK_EXECUTIONKPI
-------------------------------------------------------------------------------------------------------------------------------------------------

select * from BPM.PROCESS_INSTANCE  pi
left join BPM.DATA_INSTANCE di on pi.id = di.containerid 
where PI.ID = 25012

select * from BPM.DATA_INSTANCE di 
where di.containerid  = 25012 and di.name = 'serviceId';

UPDATE BPM.DATA_INSTANCE
SET    CLOBVALUE      = 104853
WHERE  di.containerid  = 25012 and di.name = 'serviceId';


-------------------------------------------------------------------------------------------------------------------------------------------------
--- instancias de procesos de pots, informacion general
-------------------------------------------------------------------------------------------------------------------------------------------------
select p.id, p.name, p.callerid, TO_CHAR(di.CLOBVALUE) as provisioningId, pord.STATUS, pord.start_date, 
pord.customer_name, 
sda.value as sales_reference, sda1.value as service_name2, sda2.value as service_action,
wo.service_request_id, wo.service_request_status_code, wo.summary,
inct.incident_id, inct.INCIDENT_STATUS_CODE, inct.message from BPM.PROCESS_INSTANCE p 
left join BPM.DATA_INSTANCE di on p.id = di.CONTAINERID and di.name = 'provisioningId'
left join CRM_MEDIATOR.PROVISION_ORDER pord on pord.provisioning_id = TO_CHAR(di.CLOBVALUE)
left join CRM_MEDIATOR.SERVICE_DESCRIPTION sd on sd.ID = pord.SERVICE_DESC_ID
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda on sd.id = sda.SERVICE_DESC_ID and sda.name = 'sales.reference'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda1 on sd.id = sda1.SERVICE_DESC_ID and sda1.name = 'service.name'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda2 on sd.id = sda2.SERVICE_DESC_ID and sda2.name = 'worksheet.action'
left join ITSM_MEDIATOR.WORK_ORDER wo on wo.PROVISIONING_ID = pord.provisioning_id
left join ITSM_MEDIATOR.INCIDENT inct on inct.provisioning_id = pord.provisioning_id
where p.name like '%POTS%' and callerid = -1 /*and (inct.incident_id is not null or wo.SERVICE_REQUEST_ID is not null)*/
order by p.id, wo.INCOMING_DATE desc, inct.INCOMING_DATE desc;

select * from BPM.FLOWNODE_INSTANCE fw where fw.PARENTCONTAINERID = 101018 order by fw.REACHEDSTATEDATE desc;

select * from BPM.FLOWNODE_INSTANCE where id = 1167657;

select * from BPM.PROCESS_INSTANCE where callerid = 1279178;


-------------------------------------------------------------------------------------------------------------------------------------------------
-- Alta POTS
-------------------------------------------------------------------------------------------------------------------------------------------------
select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, 
sda.value as sales_reference, sda1.value as service_name2, sda2.value as service_action,
INCT.INCIDENT_ID, 
WO.SERVICE_REQUEST_ID,
ticket.status
from BPM.PROCESS_INSTANCE pi 
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID 
--AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
left join CRM_MEDIATOR.BPMPROCESS_CALL pc on  pi.id = pc.PROCESS_INSTANCE_ID
left join CRM_MEDIATOR.ACTION_PRC_CALL apc on pc.ID = apc.PROCESS_CALL_ID
left join CRM_MEDIATOR.PROVISION_ACTION act on act.id = apc.ACTION_ID
left join CRM_MEDIATOR.PROVISION_ORDER ord on ord.id = act.PROVISION_ORDER_ID 
left join CRM_MEDIATOR.SERVICE_DESCRIPTION sd on sd.ID = ord.SERVICE_DESC_ID
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda on sd.id = sda.SERVICE_DESC_ID and sda.name = 'sales.reference'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda1 on sd.id = sda1.SERVICE_DESC_ID and sda1.name = 'service.name'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda2 on sd.id = sda2.SERVICE_DESC_ID and sda2.name = 'worksheet.action'
left join ITSM_MEDIATOR.INCIDENT inct on INCT.PROVISIONING_ID = ORD.PROVISIONING_ID
left join ITSM_MEDIATOR.WORK_ORDER wo on wo.PROVISIONING_ID = ORD.PROVISIONING_ID
left join TICKET@ITSM_DB ticket on (ticket.ticketid = INCT.INCIDENT_ID or  ticket.ticketid = WO.SERVICE_REQUEST_ID) AND ticket.EXTERNALSYSTEM = 'PROVISIONING' 
--where pi.name like '%POTS%'
where pi.name = 'Alta POTS' 
--and  sda2.value ='CHANGE' 
and  sda2.value ='NEW'
--AND pi.id = '44338'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc, ord.customer_id;


-------------------------------------------------------------------------------------------------------------------------------------------------
-- Revisar hojas de obra registradas en el sistema por el codigo de la hoja de obra
-- Nos sirve para obtener el ID de caso en bonita (feasibility_case_id), tipo de orden (cambio, baja, alta,...) y feasibilityID o provisioningId
-------------------------------------------------------------------------------------------------------------------------------------------------

Select 
    --WS.ORDER_TYPE ,  WS.WORKSHEET_ID   ,ws.FEASIBILITY_ID,
	-- feasibility_case_id, worksheet_code_number, sales_reference 
    *
from 
    PROVISION.WORKSHEET ws
left join CRM_MEDIATOR.PROVISION_ORDER po on  ws.FEASIBILITY_ID = po.FEASIBILITY_ID
where  WS.WORKSHEET_CODE_NUMBER = '12620/DVE/BPAG/2019' 
OR WS.WORKSHEET_CODE_NUMBER = '12621/DVE/BPAG/2019'
OR WS.WORKSHEET_CODE_NUMBER = '12622/DVE/BPAG/2019'
OR WS.WORKSHEET_CODE_NUMBER = '12623/DVE/BPAG/2019'
OR WS.WORKSHEET_CODE_NUMBER = '12624/DVE/BPAG/2019';


-------------------------------------------------------------------------------------------------------------------------------------------------
-- Procesos y parametros asociados
-------------------------------------------------------------------------------------------------------------------------------------------------

Select 
    pd.name as proc_name, pd.version as proc_ver, pp.name as param_name, pp.value as param_value
from 
    BPM.PROC_PARAMETER pp
left join BPM.PROCESS_DEFINITION pd on  pd.PROCESSID = pp.PROCESS_ID 
where pd.name = 'Mudança producto LTE' AND pd.version = '1.0' AND pp.name = 'v_altaElementosRed'
OR pd.name = 'Mudança producto LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
OR pd.name = 'Mudança numero telefone LTE' AND pd.version = '1.0'  AND pp.name = 'vAltaElementosRedLTE'
OR pd.name = 'Mudança numero telefone LTE' AND pd.version = '1.0'  AND pp.name = 'vBajaElementosRedLTE'
OR pd.name = 'Alta LTE' AND pd.version = '1.0'  AND pp.name = 'v_altaElementosRed'
OR pd.name = 'Cancelar provisión LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
OR pd.name = 'Baja LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos';

-- Generamos las selects a partir del resultado anterior
SELECT 
 'UPDATE BPM_DES.PROC_PARAMETER SET VALUE = ''2.0'' WHERE ID = ' || pp.id || ';'
FROM BPM.PROC_PARAMETER pp
left join BPM.PROCESS_DEFINITION pd on  pd.PROCESSID = pp.PROCESS_ID 
where pd.name = 'Mudança producto LTE' AND pd.version = '1.0' AND pp.name = 'v_altaElementosRed'
OR pd.name = 'Mudança producto LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
OR pd.name = 'Mudança numero telefone LTE' AND pd.version = '1.0'  AND pp.name = 'vAltaElementosRedLTE'
OR pd.name = 'Mudança numero telefone LTE' AND pd.version = '1.0'  AND pp.name = 'vBajaElementosRedLTE'
OR pd.name = 'Alta LTE' AND pd.version = '1.0'  AND pp.name = 'v_altaElementosRed'
OR pd.name = 'Cancelar provisión LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
OR pd.name = 'Baja LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos';


-- Job para actualizar el valor del parametro de una lista de procesos y parametros
BEGIN
  FOR r IN 
  (
    Select 
        pd.name as proc_name, pd.version as proc_ver, pp.name as param_name, pp.value as param_value
    from 
        BPM.PROC_PARAMETER pp
    left join BPM.PROCESS_DEFINITION pd on  pd.PROCESSID = pp.PROCESS_ID 
    where pd.name = 'Mudança producto LTE' AND pd.version = '1.0' AND pp.name = 'v_altaElementosRed'
    OR pd.name = 'Mudança producto LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
    OR pd.name = 'Mudança numero telefone LTE' AND pd.version = '1.0'  AND pp.name = 'vAltaElementosRedLTE'
    OR pd.name = 'Mudança numero telefone LTE' AND pd.version = '1.0'  AND pp.name = 'vBajaElementosRedLTE'
    OR pd.name = 'Alta LTE' AND pd.version = '1.0'  AND pp.name = 'v_altaElementosRed'
    OR pd.name = 'Cancelar provisión LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
    OR pd.name = 'Baja LTE' AND pd.version = '1.0'  AND pp.name = 'v_bajaRecursos'
  )
  LOOP
    EXECUTE IMMEDIATE  'UPDATE BPM_DES.PROC_PARAMETER SET VALUE = ''2.0'' WHERE ID = ' || pp.id;     
  END LOOP;
END;




-------------------------------------------------------------------------------------------------------------------------------------------------
-- Buscar aquellos procesos que han sido instalados posteriormente a una fecha
-------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
TENANTID, ID, PROCESSID, 
   NAME, VERSION, DESCRIPTION, 
   DEPLOYMENTDATE, DEPLOYEDBY, ACTIVATIONSTATE, 
   CONFIGURATIONSTATE, DISPLAYNAME, DISPLAYDESCRIPTION, 
   LASTUPDATEDATE, CATEGORYID, ICONPATH, 
   CONTENT_TENANTID, CONTENT_ID
FROM BPM.PROCESS_DEFINITION
-- donde la fecha de despliegue DEPLOYMENTDATE sea mayor que la fecha dada
WHERE ((select to_date('19700101', 'YYYYMMDD') + ( 1 / 24 / 60 / 60 / 1000) * DEPLOYMENTDATE from dual) > TO_DATE('150219', 'DDMMYY'));


-- MAS LEGIBLE
SELECT 
   NAME, VERSION, (select to_date('19700101', 'YYYYMMDD') + ( 1 / 24 / 60 / 60 / 1000) * DEPLOYMENTDATE from dual) AS DEPLOYMENTDATE, ACTIVATIONSTATE, 
   CONFIGURATIONSTATE, DISPLAYNAME
FROM BPM.PROCESS_DEFINITION
WHERE ((select to_date('19700101', 'YYYYMMDD') + ( 1 / 24 / 60 / 60 / 1000) * DEPLOYMENTDATE from dual) > TO_DATE('150219', 'DDMMYY'));


hay que logarse como system para poder cruzar las tablas


-------------------------------------------------------------------------------------------------------------------------------------------------
-- INFORMACION CRUZADA DE LOS PROCESOS CON LAS ORDENES DE TRABAJO, INCIDENCIAS...
-------------------------------------------------------------------------------------------------------------------------------------------------

select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2,  
sda2.value as service_action,
INCT.INCIDENT_ID, 
WO.SERVICE_REQUEST_ID,
ticket.status
from BPM.PROCESS_INSTANCE pi 
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID 
-- EN ESTADO DE FALLO, LISTO, EJECUTANDOSE O ESPERANDO
--AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
-- EN ESPERA POR UN EVENTO
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
left join CRM_MEDIATOR.BPMPROCESS_CALL pc on  pi.id = pc.PROCESS_INSTANCE_ID
left join CRM_MEDIATOR.ACTION_PRC_CALL apc on pc.ID = apc.PROCESS_CALL_ID
left join CRM_MEDIATOR.PROVISION_ACTION act on act.id = apc.ACTION_ID
left join CRM_MEDIATOR.PROVISION_ORDER ord on ord.id = act.PROVISION_ORDER_ID 
left join CRM_MEDIATOR.SERVICE_DESCRIPTION sd on sd.ID = ord.SERVICE_DESC_ID
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda on sd.id = sda.SERVICE_DESC_ID and sda.name = 'sales.reference'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda1 on sd.id = sda1.SERVICE_DESC_ID and sda1.name = 'service.name'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda2 on sd.id = sda2.SERVICE_DESC_ID and sda2.name = 'worksheet.action'
left join ITSM_MEDIATOR.INCIDENT inct on INCT.PROVISIONING_ID = ORD.PROVISIONING_ID
left join ITSM_MEDIATOR.WORK_ORDER wo on wo.PROVISIONING_ID = ORD.PROVISIONING_ID
left join TICKET@ITSM_DB ticket on (ticket.ticketid = INCT.INCIDENT_ID or  ticket.ticketid = WO.SERVICE_REQUEST_ID) AND ticket.EXTERNALSYSTEM = 'PROVISIONING' 
--where pi.name like '%POTS%'
where pi.name = 'Alta POTS' 
--and  sda2.value ='CHANGE' 
and  sda2.value ='NEW'
--AND pi.id = '44338'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc, ord.customer_id;


select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2,  
sda2.value as service_action, sda3.value as folha_obra,
INCT.INCIDENT_ID, 
WO.SERVICE_REQUEST_ID,
ticket.status
from BPM.PROCESS_INSTANCE pi 
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID 
-- EN ESTADO DE FALLO, LISTO, EJECUTANDOSE O ESPERANDO
--AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
-- EN ESPERA POR UN EVENTO
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
left join CRM_MEDIATOR.BPMPROCESS_CALL pc on  pi.id = pc.PROCESS_INSTANCE_ID
left join CRM_MEDIATOR.ACTION_PRC_CALL apc on pc.ID = apc.PROCESS_CALL_ID
left join CRM_MEDIATOR.PROVISION_ACTION act on act.id = apc.ACTION_ID
left join CRM_MEDIATOR.PROVISION_ORDER ord on ord.id = act.PROVISION_ORDER_ID 
left join CRM_MEDIATOR.SERVICE_DESCRIPTION sd on sd.ID = ord.SERVICE_DESC_ID
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda on sd.id = sda.SERVICE_DESC_ID and sda.name = 'sales.reference'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda1 on sd.id = sda1.SERVICE_DESC_ID and sda1.name = 'service.name'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda2 on sd.id = sda2.SERVICE_DESC_ID and sda2.name = 'worksheet.action'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda3 on sd.id = sda3.SERVICE_DESC_ID and sda3.name = 'worksheet.number'

left join ITSM_MEDIATOR.INCIDENT inct on INCT.PROVISIONING_ID = ORD.PROVISIONING_ID
left join ITSM_MEDIATOR.WORK_ORDER wo on wo.PROVISIONING_ID = ORD.PROVISIONING_ID
left join TICKET@ITSM_DB ticket on (ticket.ticketid = INCT.INCIDENT_ID or  ticket.ticketid = WO.SERVICE_REQUEST_ID) AND ticket.EXTERNALSYSTEM = 'PROVISIONING' 
--where pi.name like '%POTS%'
--where sda.value = 'SO48532' or 
where sda3.value = '12614/DVG/ZAPA/2019'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc, ord.customer_id;


-------------------------------------------------------------------------------------------------------------------------------------------------
-- BACKUP DE TABLAS PARA UN UPDATE MAXIVO
-------------------------------------------------------------------------------------------------------------------------------------------------

create table BPM.USER_CONTACTINFO_BACKUP as (select * from BPM.USER_CONTACTINFO);

commit;

UPDATE BPM.USER_CONTACTINFO
SET    EMAIL    = 'desarrollo.provision@desarrollo.ao';

commit;


-------------------------------------------------------------------------------------------------------------------------------------------------
-- Modificar Dysplay_Name de un proceso, DysplayDescription o cualquier cosa en la definicion de un proceso en el estudio de bonita. Pero
-- replicar la modificación sin desplegar en otro entorno diferente a desarrollo:
-- buscar la definicion de un proceso, el xml que define el diagrama y el comportamiento de las tareas en caso de error, etc.
-------------------------------------------------------------------------------------------------------------------------------------------------

Select * FROM
    BPM.PROCESS_DEFINITION
WHERE
NAME LIKE 'Prov. Corporate'
 AND VERSION = '3.0'
 
 obtenemos el ID
 2245
 1227
 
 y buscamos en la tabla PROCESS_CONTENT, abrimos la columna CONTENT en edicion, buscamos el cambio que quermos hacer en el XML
 
 por ejemplo, para la tarea "notificar_provision_conluida", modificar la accion a realizar cuando falla: 
 failAction="IGNORE">