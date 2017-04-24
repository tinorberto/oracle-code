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
 
 
 -- desbroken
begin
  --TEM QUE ESTAR LOGADO COM O OWNER PARA ESSAS SITUAÕES
  DBMS_JOB.BROKEN(246, FALSE);
end;  

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