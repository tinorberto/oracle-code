
-- buscar as mviews 
select 
  m.*, 
  d.LAST_REFRESH_TYPE,
  r.interval,
  r.NEXT_DATE,
  r.BROKEN,
  j.FAILURES,
  j.WHAT,
  j.THIS_DATE
from 
  all_mview_refresh_times m
  join all_mviews d
  on m.OWNER = d.OWNER and m.NAME = d.MVIEW_NAME
  left outer join dba_refresh r
  on (d.MVIEW_NAME = r.RNAME and d.OWNER = r.ROWNER)
  left outer join dba_jobs j
  on r.JOB = j.JOB
  where m.OWNER = 'IDEPBH'
-- where m.LAST_REFRESH > trunc(sysdate) - 1
order by m.OWNER;


select * FROM Dba_Jobs db
where db.LOG_USER = 'IDEPBH';

-- buscar o job id
SELECT LOG_USER,
       JOB,
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
  FROM DBA_JOBS j
 WHERE (j.BROKEN != 'Y' AND j.FAILURES > 0);




-- setar o broken 0
begin
  idepbh.mview_admlib.pr_atualiza_broken_flag_job(644, 0);
end;


-- frocar a atualizacsao
begin
  idepbh.mview_admlib.pr_refresh_force_mview('IDEPBH.ZONEAMENTO');
end;

