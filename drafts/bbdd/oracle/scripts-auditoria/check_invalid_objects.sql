    
-- comprobar objetos invalidos y recompilar schemas

select object_type,count(*) from all_objects where status = 'INVALID' 
    group by object_type;
    
    
    
 select * from all_objects where status = 'INVALID';
 
 
 exec dbms_utility.compile_schema( 'PROVISION_MONIT' );
 exec dbms_utility.compile_schema( 'PROVISION' );
  exec dbms_utility.compile_schema( 'PROVISION_DES' );
    exec dbms_utility.compile_schema( 'PROVISION_2' );
 exec dbms_utility.compile_schema( 'PROVISION_MONIT_DES' );  
 exec dbms_utility.compile_schema( 'SYSTEM' );
  exec dbms_utility.compile_schema( 'SYS' );


