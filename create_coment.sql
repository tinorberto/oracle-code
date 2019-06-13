
-- gerar comentario de uma determinada tabela
select 'comment on column PATRIMONIO_CULTURAL.'||at.TABLE_NAME||'.'||at.COLUMN_NAME||' is '||''''||at.COMMENTS||''''||' ;' 
a FROM all_col_comments  at where at.OWNER = 'PATRIMONIO_CULTURAL'  and at.TABLE_NAME = 'BEM_CULTURAL_MOVEL';