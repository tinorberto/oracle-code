Select a.grantee User_name, a.granted_role role, b.privilege 
from DBA_ROLE_PRIVS a, DBA_SYS_PRIVS b where
a.granted_role=b.grantee;

 SELECT * FROM DBA_ROLE_PRIVS GRANTEE  
 where  GRANTEE not in ('SYS', 'XDB', 'OLAPSYS', 'WMSYS' , 'DBA','SYSTEM' , 'OWBSYS' , 'TSMSYS', 'EXECUTE_CATALOG_ROLE', 'SYSMAN', 'OEM_MONITOR', 'HS_ADMIN_ROLE')
 
 
 
 select * from DBA_ROLES
 
 select ( COUNT(GRANTEE)) FROM DBA_TAB_PRIVS
 where OWNER  not in ('APEX_030200','FLOWS_FILES', 'FLOWS_FILES', 'CTXSYS', 'MDSYS', 'ORDDATA', 'APPQOSSYS', 'DBSNMP', 'SYS', 'XDB', 'OLAPSYS', 'WMSYS' , 'DBA','SYSTEM' , 'OWBSYS' , 'TSMSYS', 'EXECUTE_CATALOG_ROLE', 'SYSMAN', 'OEM_MONITOR', 'HS_ADMIN_ROLE')
 and GRANTEE != 'PUBLIC'
and GRANTOR != 'ORDSYS'
group by GRANTEE



 select grantee  FROM DBA_TAB_PRIVS
 where OWNER  not in ('APEX_030200','FLOWS_FILES', 'FLOWS_FILES', 'CTXSYS', 'MDSYS', 'ORDDATA', 'APPQOSSYS', 'DBSNMP', 'SYS', 'XDB', 'OLAPSYS', 'WMSYS' , 'DBA','SYSTEM' , 'OWBSYS' , 'TSMSYS', 'EXECUTE_CATALOG_ROLE', 'SYSMAN', 'OEM_MONITOR', 'HS_ADMIN_ROLE')
 and GRANTEE != 'PUBLIC'
and GRANTOR != 'ORDSYS'
group by grantee


 select *  FROM DBA_TAB_PRIVS
 where OWNER  not in ('APEX_030200','FLOWS_FILES', 'FLOWS_FILES', 'CTXSYS', 'MDSYS', 'ORDDATA', 'APPQOSSYS', 'DBSNMP', 'SYS', 'XDB', 'OLAPSYS', 'WMSYS' , 'DBA','SYSTEM' , 'OWBSYS' , 'TSMSYS', 'EXECUTE_CATALOG_ROLE', 'SYSMAN', 'OEM_MONITOR', 'HS_ADMIN_ROLE')
 and GRANTEE != 'PUBLIC'
and GRANTOR != 'ORDSYS'
and grantee = 'SELECT_MUB'


 
 where OWNER in ('GERMEM')
 
 where OWNER  not in ('SYS', 'XDB', 'OLAPSYS', 'WMSYS' , 'DBA','SYSTEM' , 'OWBSYS' , 'TSMSYS', 'EXECUTE_CATALOG_ROLE', 'SYSMAN', 'OEM_MONITOR', 'HS_ADMIN_ROLE')
 
 SELECT * FROM DBA_ROLES D , dba_ROLE_PRIVS RTP
 where D.ROLE = RTP.GRANTED_ROLE
 and RTP.GRANTEE  not in ('SYS', 'XDB', 'OLAPSYS', 'WMSYS' , 'DBA','SYSTEM' , 'OWBSYS' , 'TSMSYS', 'EXECUTE_CATALOG_ROLE', 'SYSMAN', 'OEM_MONITOR', 'HS_ADMIN_ROLE')
 
  SELECT * FROM DBA_ROLES D 
 
 
 
 
