-- ALterar para retirar o paralelismo das mview
-- Aconteceu por nõa usar o indice

SELECT
  'ALTER MATERIALIZED VIEW '||D.OWNER||'.'||D.MVIEW_NAME||CHR(10)||
  '  NOLOGGING'||CHR(10)||
  '  NOPARALLEL'||CHR(10)||
  '  REFRESH '||D.REFRESH_METHOD||' ON '||D.REFRESH_MODE||CHR(10)||
  '  NEXT '||R.interval||';'||CHR(10)
FROM 
  DBA_MVIEWS D,
  DBA_REFRESH R
WHERE 
  D.OWNER IN ('GEOCODER','DIPC','CADASTRO_TECNICO','SIURBE','SISTEMA_VARIO','PLANEJ','CP','PARAM_URB','IMAGEM_BH','EDIFICACAO','AREA_RISCO','MEIO_AMBIENTE')
  AND D.OWNER = R.ROWNER
  AND D.MVIEW_NAME = R.RNAME;
  
  
  
 -- alterar as hora de execucao
ALTER MATERIALIZED VIEW idepbh.unid_receb_peqn_volume REFRESH next trunc(sysdate) + interval '23' hour; 
  

  