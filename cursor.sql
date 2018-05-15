-- Operacoes com cursores
-- altera nimero dos cursores abertos
ALTER SYSTEM SET open_cursors = 400 SCOPE=BOTH;

-- contar o numero de cursores por usuario
select count(1) from  v$open_cursor where user_name = 'GEONETWORK'
