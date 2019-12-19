
-- Alterar a periocdade de atualizacao
ALTER MATERIALIZED VIEW IDEPBH.ENDERECO  NEXT sysdate + 15/24/60;

ALTER MATERIALIZED VIEW IDEPBH.ENDERECO REFRESH FORCE START WITH SYSDATE NEXT SYSDATE+(15/24)/60;
 
-- Forcar o refresh  
begin
	--dbms_mview.refresh('bhmap.bhmap_area_trecho_logradouro');
	dbms_mview.refresh('bhmap.BHMAP_AREA_TRECHO_LOGRADOURO');
    -- DBMS_SNAPSHOT.REFRESH('bhmap.bhmap_obra_trecho_logradouro');
end;

-- quando a view nap 
como sysdba
drop summary owner.nome_da_mv

--consultar  ultima execução
select 
  R.ROWNER,
  R.RNAME,
  j.LAST_DATE,
  T.LAST_REFRESH_TYPE,
  R.NEXT_DATE, 
  T.REFRESH_METHOD,
  R.JOB,
  case T.LAST_REFRESH_TYPE
        when 'COMPLETE' then an.fullrefreshtim /60
        when 'FAST' then an.increfreshtim / 60 
   end DURACAO_MIN
from 
  dba_refresh r
  join DBA_JOBS J
  on (r.JOB = j.JOB)
  join all_mviews t
  on (r.ROWNER = t.OWNER and r.RNAME = t.MVIEW_NAME)
  join all_mview_analysis an
  on (r.ROWNER = an.OWNER and r.RNAME = an.MVIEW_NAME)
where 
  r.BROKEN = 'N'
ORDER BY R.NEXT_DATE, R.ROWNER;


-- buscar todas as mviews
select * from all_mviews  e where e.MVIEW_NAME like '%BAIRRO_OFICIAL%'


  
  SELECT owner, mview_name, last_refresh_date
  FROM all_mviews
 WHERE owner = 'BHMAP'
   AND mview_name  like '%BAIRRO_OFICIAL%'
   
   
 --alter materialized view cp.lote_cp refresh complete on demand next trunc(sysdate) + 1 + 1 / 24 / 60;

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
-- where m.LAST_REFRESH > trunc(sysdate) - 1
order by m.OWNER;

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
 
select
  j.JOB,
  J.WHAT,
  r.SID, 
  q.SQL_TEXT
from 
  dba_jobs_running r 
  join dba_jobs j on r.JOB = j.JOB
  join v$session s on r.sid = s.sid
  join v$sql q on s.SQL_ID = q.SQL_ID
  ;

 
select 
  SJ.owner,
  SJ.job_name,
  SJ.last_start_date,
  SJ.LAST_RUN_DURATION,
  SJ.JOB_ACTION
from dba_scheduler_jobs sj
where sj.owner not in ('SYS','ORACLE_OCM','EXFSYS');
/** 410 siurbe.projeto
begin
  DBMS_JOB.RUN(410);
end;
/
begin
  --TEM QUE ESTAR LOGADO COM O OWNER PARA ESSAS SITUAÕES
  DBMS_JOB.BROKEN(243, FALSE);
end;  

alter materialized view meio_ambiente.area_preservacao_permanente refresh complete on demand start with sysdate + 1/24/60 next sysdate + 1/24/60  --trunc(sysdate) + 1 + 1 / 24 / 60;

alter table SIURBE.INDICE_SOLICITACAO disable constraint FK_INDICE_SOLICITACAO_LOTE_CP;

begin
  DBMS_MVIEW.REFRESH('BHMAP_LOTE_CTM');
end;

alter table SIURBE.INDICE_SOLICITACAO enable constraint FK_INDICE_SOLICITACAO_LOTE_CP;


-- Enable/Disable primary, unique and foreign key constraints 
alter table SIURBE.INDICE_SOLICITACAO disable constraint FK_INDICE_SOLICITACAO_LOTE_CP;

alter materialized view cp.lote_cp refresh complete on demand next trunc(sysdate) + 1 + 1 / 24 / 60;

alter index dipc.diretriz_protecao_sx rebuild;

select * from user_jobs_running  
  
  