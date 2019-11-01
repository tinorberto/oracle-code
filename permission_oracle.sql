
-- permissao para debug
GRANT DEBUG ANY PROCEDURE to APP_GERMEM; 
GRANT CREATE SESSION to APP_GERMEM; 
 
-- permissao para geometria
grant update (geoloc) on sistema_viario.trecho to jose_ricardo;
REVOKE update (geoloc) on sistema_viario.trecho FROM jose_ricardo; 


-- permisao para criar o pacote
grant  ALTER ANY procedure   to teste_PACKAGE;
grant  CREATE ANY PROCEDURE to teste_PACKAGE;
grant  drop  ANY PROCEDURE to teste_PACKAGE;