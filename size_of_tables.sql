--tamanho por tabela
SELECT t.table_name AS "Table Name",
      t.num_rows AS "Rows",
      t.avg_row_len AS "Avg Row Len",
      Trunc((t.blocks * p.value)/1024/1024) AS "Size MB",
      t.last_analyzed AS "Last Analyzed"
 FROM dba_tables t,
      v$parameter p
where t.TABLE_NAME = 'QUADRA_CTM'



WHERE t.owner = UPPER('cadastro_tecnico')
