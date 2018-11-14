select * FROM siuca.usuario us  for update
where US.SITUACAO_USUARIO

for update



select * from siuca.setor_orgao so for update
where so.id_setor_orgao in (16,42) for update

  --42 ou 16
  
-- GEORGEW
-- RONAN   
select * FROM siuca.usuario us for update
where UPPER(US.NOME_USUARIO) like '%RONAN%'



select * from siuca.usuario_base_dados_geoc S  for update
where s.situacao_usuario_base_dados 
