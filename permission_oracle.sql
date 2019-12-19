
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

grant  ALTER ANY function   to teste_PACKAGE;
grant  CREATE ANY function to teste_PACKAGE;
grant  drop  ANY function to teste_PACKAGE;


-- grant para catalago
grant SELECT ANY DICTIONARY to teste_PACKAGE; -- is a System Privilege.

--s a Role you would see in DBA_ROLES.  
--However, querying DBA_SYS_PRIVS does NOT show what privileges are granted to this role.
grant SELECT_CATALOG_ROLE  to teste_PACKAGE;

/*
The SELECT ANY DICTIONARY privilege grants Read access on Data Dictionary tables owned by SYS.
  The SELECT_CATALOG_ROLE role grants Read access to Data Dictionary (DBA_%) 
  and Performance (V$%) views.
*/