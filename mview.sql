 
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

select * from all_mviews  e where e.MVIEW_NAME like '%BAIRRO_OFICIAL%'


  
  SELECT owner, mview_name, last_refresh_date
  FROM all_mviews
 WHERE owner = 'BHMAP'
   AND mview_name  like '%BAIRRO_OFICIAL%'
  
  