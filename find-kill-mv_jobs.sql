--
select * FROM DBA_JOBS_RUNNING jr,dba_jobs j 
where j.JOB = jr.JOB

-- gerar o script 
select
  'alter system kill session '''||s.SID||','||s.SERIAL#||''' immediate;', s.SID
from v$session s
where s.USERNAME like '%GERMEM%'   

--setar com brokrn
begin 
dbms_job.broken(1851,TRUE);

end;


-- tentar remover
begin

 DBMS_JOB.REMOVE(1851);
 
 end;
 
-- matar  a session 
 ALTER SYSTEM KILL SESSION '421,9#' IMMEDIATE;
