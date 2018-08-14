select * FROM idepbh.bairro;

select at.TABLE_NAME 
from all_tables at where at.owner = 'IDEPBH'
and  at.TABLE_NAME not like '%MDR%' 
and  at.TABLE_NAME not like '%$%' 


select TC.TABLE_NAME, TC.COLUMN_NAME from all_tab_cols tc  
where tc.owner = 'IDEPBH' 
and  tc.DATA_TYPE = 'NUMBER'
and tc.COLUMN_NAME like  'ID%'
and TC.TABLE_NAME  in (select at.TABLE_NAME 
from all_tables at where at.owner = 'IDEPBH'
and  at.TABLE_NAME not like '%MDR%' 
and  at.TABLE_NAME not like '%$%' )



-- gerar o script para quem nao tem 
select 'alter table idepbh.'||TC.TABLE_NAME||' add constraint PK_'||substr(TC.TABLE_NAME, 1,10)||' primary key ('||TC.COLUMN_NAME||');'
from all_tab_cols tc 
where tc.owner = 'IDEPBH' 
and  tc.DATA_TYPE = 'NUMBER'
and tc.COLUMN_NAME like  'ID%'
and TC.TABLE_NAME  in (select at.TABLE_NAME 
from all_tables at where at.owner = 'IDEPBH'
and  at.TABLE_NAME not like '%MDR%' 
and  at.TABLE_NAME not like '%$%' )
and not exists (
SELECT cols.table_name
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = upper(TC.TABLE_NAME)
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
and cons.owner = 'IDEPBH'
)


select * FROM idepbh.praca;

select  *
FROM idepbh.bairro b
where b.id_ba = 1


alter table idepbh.bairro add constraint PK_bairro primary key (ID_BA);

select * from meio_ambiente.



SELECT cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = upper('bairro')
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position;




-- gerar o script de alter table para criar as tabelas
select 'alter table idepbh.'||TC.TABLE_NAME||' add constraint PK_'||substr(TC.TABLE_NAME, 1,10)||' primary key ('||TC.COLUMN_NAME||');'
--select TC.TABLE_NAME, tc.COLUMN_NAME
from all_tab_cols tc 
where tc.owner = 'IDEPBH' 
and  tc.DATA_TYPE = 'NUMBER'
and tc.COLUMN_NAME like  'ID%'
and TC.TABLE_NAME  in (select at.TABLE_NAME 
from all_tables at where at.owner = 'IDEPBH'
and  at.TABLE_NAME not like '%MDR%' 
and  at.TABLE_NAME not like '%$%' )
and not exists (
SELECT cols.table_name
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = upper(TC.TABLE_NAME)
AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
and cons.owner = 'IDEPBH'
)

-- 323
select * from idepbh.ade


alter table IDEPBH.ADE
  add constraint PK_ADE primary key (ID_ADE);
  
  alter table IDEPBH.ADE
  drop  constraint PK_ADE 


alter table idepbh.OBRA_DE_ARTE add constraint PK_OBRA_DE_AR primary key (ID_OBRART, TIPO_OBRA_DE_ARTE);


alter table GERMEM.CABO
  add constraint PK_CABO primary key (ID_CABO);
  
  alter table GERMEM.CABO
  drop  constraint PK_CABO;