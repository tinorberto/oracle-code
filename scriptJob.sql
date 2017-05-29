-- Functions para JOB
 
 -- verificar se a jog esta broken
SELECT JOB,
       WHAT,
       LAST_DATE,
       LAST_SEC,
       THIS_DATE,
       THIS_SEC,
       NEXT_DATE,
       NEXT_SEC,
       FAILURES,
       BROKEN,
       TOTAL_TIME
  FROM user_jobs j
 WHERE (j.BROKEN = 'Y' OR j.FAILURES > 0);
 
 
	

-- refresh
begin
  DBMS_MVIEW.REFRESH('BHMAP_LAGOA');
end;

-- criar job
begin
  sys.dbms_scheduler.create_job(job_name            => 'SIRGAS2000.INICIAR_CONVERSAO_JOB',
                                job_type            => 'STORED_PROCEDURE',
                                job_action          => 'SIRGAS2000.SIRGAS2000LIB_INIC_CONV.INICIAR_CONVERSAO',
                                start_date          => SYSTIMESTAMP,
                                repeat_interval     => 'Freq=Minutely;Interval=5',
                                end_date            => to_date(null),
                                job_class           => 'DEFAULT_JOB_CLASS',
                                enabled             => true,
                                auto_drop           => true,
                                 comments   => 'Conversao Inicada ' || systimestamp)
end;
/

-- drop job
BEGIN
	SYS.DBMS_SCHEDULER.DROP_JOB (job_name => 'SIRGAS2000.INICIAR_CONVERSAO_JOB');
END;


-- run job
BEGIN
	SYS.DBMS_SCHEDULER.run_JOB (job_name => 'SIRGAS2000.INICIAR_CONVERSAO_JOB');
END; 


-- check lock job
select 
  J.JOB, 
  j.WHAT, 
  j.THIS_DATE, 
  j.TOTAL_TIME,
  j.LAST_DATE, 
  s.SID,
  s.STATUS,
  q.SQL_TEXT,
  l.TYPE,
  lp.name,
  o1.OWNER, o1.OBJECT_NAME, o1.OBJECT_TYPE,
  o2.OWNER, o2.OBJECT_NAME, o2.OBJECT_TYPE,
  l.BLOCK,
  l.CTIME,
  s.WAIT_TIME
from 
  dba_jobs_running r 
  join dba_jobs j 
  on r.JOB = j.JOB
  join v$session s
  on r.SID = s.SID
  join v$sql q
  on s.SQL_ID = q.SQL_ID
  left outer join v$lock l
  on s.SID = l.SID
  left outer join dba_objects o1
  on l.ID1 = o1.OBJECT_ID
  left outer join dba_objects o2
  on l.ID2 = o2.OBJECT_ID
  left outer join v$lock_type lp
  on l.TYPE = lp.TYPE
order by q.SQL_TEXT,l.type;