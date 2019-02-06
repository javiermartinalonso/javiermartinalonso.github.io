-------------------------------------------------------------------------------------------------------------------------------------------------
--- Instancias de un proceso por nombre de proceso
-------------------------------------------------------------------------------------------------------------------------------------------------
select p.id, p.name, fw.* from BPM.PROCESS_INStance p
left join BPM.FLOWNODE_INSTANCE fw on fw.ROOTCONTAINERID = p.id
where p.name like '%POTS%' and p.name != 'Alta POTS' order by p.id, fw.REACHEDSTATEDATE;

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