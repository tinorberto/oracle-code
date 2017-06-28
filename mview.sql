 
-- Forcar o refresh  
begin
	--dbms_mview.refresh('bhmap.bhmap_area_trecho_logradouro');
	dbms_mview.refresh('bhmap.BHMAP_AREA_TRECHO_LOGRADOURO');
    -- DBMS_SNAPSHOT.REFRESH('bhmap.bhmap_obra_trecho_logradouro');
end;

-- quando a view nap 
como sysdba
drop summary owner.nome_da_mv

  
  
  
  