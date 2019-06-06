select
  m.OWNER,
  m.NAME,
  M.LAST_REFRESH, 
  'begin '|| m.OWNER||'.mview_admlib.pr_run_job('||J.JOB||'); end;',
  'begin '|| m.OWNER||'.mview_admlib.pr_refresh_force_mview('''||m.OWNER||'.'||m.NAME||'''); end;'
from 
  all_mview_refresh_times m
  join all_mviews d
  on m.OWNER = d.OWNER and m.NAME = d.MVIEW_NAME
  left outer join dba_refresh r
  on (d.MVIEW_NAME = r.RNAME and d.OWNER = r.ROWNER)
  left outer join dba_jobs j
  on r.JOB = j.JOB
where m.OWNER not in ('BHMAP','IDEPBH')
-- and r.BROKEN != 'N'
order by m.OWNER;
