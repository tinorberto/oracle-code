
-- select all jobs broken  
 select * from user_jobs where broken='Y';
  
-- run job  
  begin
    dbms_job.run(807);
   end;
   
-- detail of execution  of jobs  
select * from user_scheduler_job_run_details;
   
-- script to run job  
select 'begin  dbms_job.run('||JOB||');  end; -- '|| WHAT
   from USER_jobs
  where broken='Y' AND SCHEMA_USER = 'BHMAP'
  and what like '%S2000%'
  ORDER BY LAST_DATE DESC;
  
  
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS
WHERE LOG_ID =   1222;


SELECT VALUE
FROM V$PARAMETER
WHERE NAME = 'background_dump_dest';
  
