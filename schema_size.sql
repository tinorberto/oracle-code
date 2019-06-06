
-- tamanho do esquema em mega
SELECT sum(bytes)/1024/1024 as size_in_mega
  FROM dba_segments
 WHERE owner = '&PATRIMONIO_CULTURAL'
 