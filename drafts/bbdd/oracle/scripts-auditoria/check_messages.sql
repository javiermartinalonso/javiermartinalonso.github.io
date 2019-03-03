alter session set current_schema = BPM;

select * from ARCH_PROCESS_INSTANCE order by startdate desc;

select * from MESSAGE_INSTANCE where correlation1 = 'cor_activationExecutionOrderId-$-0619607d-cdcc-49a6-ae54-3f4fe04f805d';
select * from WAITING_EVENT e 
where correlation1= 'cor_activationExecutionOrderId-$-0619607d-cdcc-49a6-ae54-3f4fe04f805d';

select *  from MESSAGE_INSTANCE mi 
left join WAITING_EVENT e on mi.MESSAGENAME = e.MESSAGENAME 
and mi.CORRELATION1 = e.CORRELATION1 
--and mi.PROCESSDEFINITIONID = e.PROCESSDEFINITIONID
--left join process_definition pd1 on pd1.processid = mi.PROCESSDEFINITIONID
--left join process_definition pd2 on pd2.processid = e.PROCESSDEFINITIONID
where mi.correlation1= 'cor_activationExecutionOrderId-$-0619607d-cdcc-49a6-ae54-3f4fe04f805d';

select * from WAITING_EVENT where correlation1= 'cor_activationExecutionOrderId-$-0619607d-cdcc-49a6-ae54-3f4fe04f805d';

select count(*) from MESSAGE_INSTANCE;
select count(*) from WAITING_EVENT;
