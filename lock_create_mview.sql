alter system kill session '482,5747' immediate;

alter system kill session '397,2399' immediate;


SELECT *   FROM DBA_DDL_LOCKS WHERE OWNER = 'IDEPBH'  -- 397


select
  'alter system kill session '''||s.SID||','||s.SERIAL#||''' immediate;'
from v$session s
where s.SCHEMANAME like '%IDEPBH%'

select
  'alter system kill session '''||s.SID||','||s.SERIAL#||''' immediate;'
from v$session s
 WHERE S.SID = 397;


select * from v$session s WHERE S.SID = 397

alter system kill session '94,23179' immediate;
alter system kill session '376,10838' immediate;
