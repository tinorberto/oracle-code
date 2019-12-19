--- exibir o nome do pacote
  SELECT *
    FROM dba_source 
   WHERE TYPE = 'PACKAGE BODY'
    AND name = 'PKG_PATRIMONIO_CULTURAL'
   and owner =  'PATRIMONIO_CULTURAL' 
ORDER BY line;
