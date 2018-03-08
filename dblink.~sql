--LK_SGBI_IMOVEL_PCASP

select * from LK_GEO_SGEE.PBH


-- buscar todas os links 
SELECT * FROM all_db_links

-- tabelas que o link acessa 
select owner, table_name
from all_tables@LK_GEO_GEOCSIURPRD.PBH
where table_name not like '%$%'
and table_name not like '%==%' 
and table_name not like '%SYS%'
and owner not in ('CTXSYS', 'MDSYS', 'SYS', 'OLAPSYS', 'EXFSYS', 'SYSTEM', 'SYSMAN', 'GDOSYS')
order by owner, table_name;
