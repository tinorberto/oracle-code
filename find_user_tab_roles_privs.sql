-- 
select
  --falta incluir as permissões por system role 
  DISTINCT
  case t.grantee 
    when r.granted_role then 
      r.grantee 
    else 
      t.grantee 
  end user_name
  ,u.account_status
  ,r.granted_role
  ,t.owner
  ,t.table_name
  ,t.privilege
from 
  dba_tab_privs t
  left outer join dba_role_privs r
  on t.grantee = r.granted_role
  left outer join dba_users u
  on (t.grantee = u.username or r.GRANTEE = u.username)
where
  t.grantee = upper('&user')
  or r.grantee = upper('&user') ORDER BY   t.owner
  ,t.table_name;

select 
  DISTINCT
  case t.grantee 
    when r.granted_role then 
      r.grantee 
    else 
      t.grantee 
  end user_name
  ,u.account_status
  ,r.granted_role
  ,t.owner
  ,t.table_name
  ,t.privilege
from 
  dba_tab_privs t
  left outer join dba_role_privs r
  on t.grantee = r.granted_role
  left outer join dba_users u
  on (t.grantee = u.username or r.GRANTEE = u.username)
where
  UPPER(t.table_name) = UPPER('&OBJETO')
  and t.owner = UPPER('&ESQUEMA');

--select * from dba_role_privs s where s.GRANTED_ROLE = 'PLAN_URB_ESPECIAL'

/*  
PLAN_URB_SELECT_CTM
PLAN_URB_SELECT_PLANEJ
PLAN_URB_GERAL
PLAN_URB_SELECT_SIST_VIARIO
PLAN_URB_SELECT_TRIBUTARIO
SELECT_PARAM_URB
PLAN_URB_SELECT_SMARU
PLAN_URB_GERAL
SELECT_DIPC
SELECT_HIST_CADASTRO_TECNICO
UPDATE_PARAM_URB_SMAPU
SELECT_SMAPU
UPDATE_SMAPU
EXECUTE_DIPC
SELECT_SMARU
SELECT_INFRA_ESTRUTURA
SELECT_SANEAMENTO_BASICO
SELECT_TRANSPORTE
SELECT_MUB
SELECT_COMPAT_CP
SELECT_CP
SELECT_PLANEJ
SELECT_TRIBUTARIO
SELECT_CTM
*/
--SELECT * FROM DBA_TAB_PRIVS T WHERE T.table_name = 'LOTE_CTM'










  
