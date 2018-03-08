--- Create user and roles 
CREATE USER CLEBER
  IDENTIFIED BY cleber0956
  DEFAULT TABLESPACE SIGUR
  TEMPORARY TABLESPACE temp;
  
--- grant   
grant select_lp_pl_bh to CLEBER;
grant select_mub to CLEBER;
grant select_sistema_viario to CLEBER;
grant suti_urbel_e to CLEBER;
grant select_urber_v to CLEBER;
create role select_urber_v;


--- creater a role
GRANT select ON urbeL.conjunto_habitacional TO select_urber_v;

GRANT select ON urbeL.conj_habit_lote_cp TO select_urber_v;

GRANT select ON urbeL.hist_vila_favela TO select_urber_v;

GRANT select ON urbeL.tipo_localidade TO select_urber_v;

GRANT select ON urbeL.VILA_FAVELA TO select_urber_v;

--- permissao por owner
select  'GRANT select ON '||owner||'.'||table_name||' TO CROQUI_TRIBUTARIO_V; '   from all_tables where owner = 'IMAGEM_BH'  and table_name not like 'MDRT%' and table_name not like 'MDXT%'  --CROQUI_TRIBUTARIO_V


--- revoke
revoke select_urber_v from cleber


-- verificar lock da conta
SELECT username, 
       account_status
  FROM dba_users
  where username = 'EMERSON'
  
--checar lock  
select username,
account_status 
 from dba_users 
 where lock_date is not null
 order by username;
 
  
-- fazer o desbloqueio
 ALTER USER EMERSON ACCOUNT UNLOCK
 
 
 create user RICARDO
 identified by 123
  default tablespace SIGUR
  temporary tablespace TEMP
  profile DEFAULT;
-- Grant/Revoke role privileges 
grant conexao to RICARDO;
grant select_mub to RICARDO;
-- Set the user's default roles 
alter user RICARDO
  default role conexao;


 
  
