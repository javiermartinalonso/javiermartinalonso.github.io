Activacion suspension hay 1 caso del 26-11-2018
Alta-POTS		






select * from provision.ITSM_SR;

select * from PROVISION.ITSM_TASK_EXECUTIONKPI 
where case_id = '42048' 
order by case_id asc;

select * from BPM.DATA_INSTANCE di
where di.ID = 44338;




select * from TICKET@ITSM_DB ticket where ticket.ticketid = 3503 AND ticket.EXTERNALSYSTEM = 'PROVISIONING' ;






-- Alta POTS
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




-- Baja POTS
select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, fi.statename, fi.displayname as task_displayname, fi.kind  ,FI.LASTUPDATEDATE,  ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2  
from BPM.PROCESS_INSTANCE pi 
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
left join CRM_MEDIATOR.BPMPROCESS_CALL pc on  pi.id = pc.PROCESS_INSTANCE_ID
left join CRM_MEDIATOR.ACTION_PRC_CALL apc on pc.ID = apc.PROCESS_CALL_ID
left join CRM_MEDIATOR.PROVISION_ACTION act on act.id = apc.ACTION_ID
left join CRM_MEDIATOR.PROVISION_ORDER ord on ord.id = act.PROVISION_ORDER_ID 
left join CRM_MEDIATOR.SERVICE_DESCRIPTION sd on sd.ID = ord.SERVICE_DESC_ID
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda on sd.id = sda.SERVICE_DESC_ID and sda.name = 'sales.reference'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda1 on sd.id = sda1.SERVICE_DESC_ID and sda.name = 'service.name'
--where pi.name like '%POTS%'
where pi.name = 'Baja POTS'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc, ord.customer_id;






select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2,  
--sda2.value as service_action,
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
--left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda2 on sd.id = sda2.SERVICE_DESC_ID and sda2.name = 'worksheet.action'
left join ITSM_MEDIATOR.INCIDENT inct on INCT.PROVISIONING_ID = ORD.PROVISIONING_ID
left join ITSM_MEDIATOR.WORK_ORDER wo on wo.PROVISIONING_ID = ORD.PROVISIONING_ID
left join TICKET@ITSM_DB ticket on (ticket.ticketid = INCT.INCIDENT_ID or  ticket.ticketid = WO.SERVICE_REQUEST_ID) AND ticket.EXTERNALSYSTEM = 'PROVISIONING' 
--where pi.name like '%POTS%'
where pi.name = 'Baja POTS' 
--and  sda2.value ='CHANGE' 
--AND pi.id = '44338'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc, ord.customer_id;




select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  
ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2,  
sda2.value as service_action,
INCT.INCIDENT_ID, 
WO.SERVICE_REQUEST_ID,
ticket.status
from BPM.PROCESS_INSTANCE pi 
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
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
where pi.name = 'Baja POTS' 
--and  sda2.value ='CHANGE' 
--and  sda2.value ='NEW'
--AND pi.id = '44338'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc;--, ord.customer_id;




-- Elegibilidad técnica POTS
select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id ,fi.statename, fi.displayname as task_displayname, fi.kind  ,FI.LASTUPDATEDATE,  ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2  
from BPM.PROCESS_INSTANCE pi 
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
left join CRM_MEDIATOR.BPMPROCESS_CALL pc on  pi.id = pc.PROCESS_INSTANCE_ID
left join CRM_MEDIATOR.ACTION_PRC_CALL apc on pc.ID = apc.PROCESS_CALL_ID
left join CRM_MEDIATOR.PROVISION_ACTION act on act.id = apc.ACTION_ID
left join CRM_MEDIATOR.PROVISION_ORDER ord on ord.id = act.PROVISION_ORDER_ID 
left join CRM_MEDIATOR.SERVICE_DESCRIPTION sd on sd.ID = ord.SERVICE_DESC_ID
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda on sd.id = sda.SERVICE_DESC_ID and sda.name = 'sales.reference'
left join CRM_MEDIATOR.SERVICE_ATTRIBUTES sda1 on sd.id = sda1.SERVICE_DESC_ID and sda.name = 'service.name'
--where pi.name like '%POTS%'
where pi.name = 'Elegibilidad técnica POTS'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc, ord.customer_id;




select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  
ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2,  
sda2.value as service_action,
INCT.INCIDENT_ID, 
WO.SERVICE_REQUEST_ID,
ticket.status
from BPM.PROCESS_INSTANCE pi 
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
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
where pi.name = 'Elegibilidad técnica POTS' 
--and  sda2.value ='CHANGE' 
--and  sda2.value ='NEW'
--AND pi.id = '44338'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc;--, ord.customer_id;


-- ACTIVACION-SUSPENSION-POTS
select pi.name as process_name, pi.id as process_instance, fi.name as tak_name, PI.id, fi.statename, fi.displayname as task_displayname, 
fi.kind  ,FI.LASTUPDATEDATE,  
ord.start_date, ord.provisioning_id, ord.customer_id, ord.customer_name, ord.service_name, sda.value as sales_reference, sda1.value as service_name2,  
sda2.value as service_action,
INCT.INCIDENT_ID, 
WO.SERVICE_REQUEST_ID,
ticket.status
from BPM.PROCESS_INSTANCE pi 
--left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('failed', 'ready', 'executing', 'waiting')
left join BPM.FLOWNODE_INSTANCE fi on  pi.id = fi.ROOTCONTAINERID AND fi.statename IN ('waiting') AND fi.kind IN ('intermediateCatchEvent')
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
where pi.name = 'Activacion-Suspensión POTS'
--and  sda2.value ='CHANGE' 
--and  sda2.value ='NEW'
--AND pi.id = '44338'
order by pi.name asc, process_instance asc, FI.LASTUPDATEDATE asc, pi.STARTDATE asc;--, ord.customer_id;


select count (*) from ITSM_MEDIATOR.INCIDENT;

select inct.id, inct.ACTIVATION_ORDER_ID, inct.ACTIVATION_ORDER_TEMPLATE_NAME,inct.CODE, inct.CUSTOMER_ID, inct.INCIDENT_ID, inct.INCIDENT_STATUS_CODE, inct.MESSAGE,inct.SERVICE_DETAILS_ID, inct.FEASIBILITY_ID, inct.PROVISIONING_ID,inct.INCOMING_DATE, inct.LAST_ACTION_DATE, inct.END_DATE
 from ITSM_MEDIATOR.INCIDENT inct
left join TICKET@ITSM_DB ticket on (ticket.ticketid = INCT.INCIDENT_ID) --AND ticket.EXTERNALSYSTEM = '%'
where ticket.ticketid is null AND INCT.INCIDENT_ID is not null;
--tienen ticket
--where ticket.ticketid is not null AND INCT.INCIDENT_ID is not null;





select * from ITSM_MEDIATOR.work_order wo
left join TICKET@ITSM_DB ticket on (ticket.ticketid = WO.SERVICE_REQUEST_ID)
where ticket.ticketid is null;




select * from ITSM_MEDIATOR.INCIDENT inct  where INCT.INCIDENT_ID =11267;

describe TICKET@ITSM_DB;
select * from TICKET@ITSM_DB ticket where ticket.ticketid = 11267 AND ticket.EXTERNALSYSTEM like '%' ;
select * from TICKET@ITSM_DB ticket where ticket.ticketid in ('11267',
'11303',
'11302',
'11304',
'11306',
'11307',
'11310',
'11314',
'11319',
'11354',
'11352',
'11353',
'11356',
'11357',
'11361',
'11397',
'11399',
'11401',
'11403',
'11420',
'11440',
'11920',
'11479',
'11478',
'11481',
'11495',
'11496',
'11499',
'11531',
'11537',
'11585',
'11586',
'11587',
'11592',
'11614',
'11615',
'11618',
'11621',
'11624',
'11642',
'11643',
'11644',
'11645',
'11665',
'11716',
'11720',
'11780',
'11817',
'11822',
'11825',
'11837',
'11838',
'11842',
'11839',
'11840',
'11841',
'11880',
'11881',
'11883',
'11890',
'11892',
'11882',
'11889',
'11891',
'11885',
'11887',
'11886',
'11888',
'11896',
'11894',
'11929',
'11931',
'11941',
'11960',
'11966',
'12002',
'12003',
'12004',
'12005',
'12006',
'12020',
'12023',
'12021',
'12022',
'12025',
'12035',
'12037',
'12138',
'12118',
'12117',
'12132',
'12122',
'12182',
'12203');


select distinct statename, stateid from BPM.FLOWNODE_INSTANCE fi;


select distinct kind from BPM.FLOWNODE_INSTANCE fi;

select * from BPM.FLOWNODE_INSTANCE fi where FI.LOGICALGROUP2=44526;

select * from BPM.FLOWNODE_INSTANCE fi where FI.LOGICALGROUP4=59671;