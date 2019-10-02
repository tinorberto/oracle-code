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



-- Selecionar por onwer
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
  (t.grantee = upper('&user')
  or r.grantee = upper('&user')) and  
  t.owner = '&owner'
  ORDER BY   t.owner,t.table_name;




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

--
select Grantee,'Granted Through Role' as Grant_Type, role, table_name
from role_tab_privs rtp, dba_role_privs drp
where rtp.role = drp.granted_role
and table_name = '&TABLENAME' 
union
select Grantee,'Direct Grant' as Grant_type, null as role, table_name
from dba_tab_privs
where table_name = '&TABLENAME' ;

-- usuario 
select * from session_privs;
  
-- QUEM TEM A ROLE
select * from dba_role_privs s where s.GRANTED_ROLE = 'PLAN_URB_ESPECIAL'

-- privs de uma role
SELECT * FROM dba_tab_privs d  where d.grantee =UPPER('croqui_tributario_v');


-- qual role tem a rabela
SELECT * FROM DBA_TAB_PRIVS T WHERE T.table_name = 'LOTE_CTM'

--

grant select on idedbstagingarea.hotspot_prodabel  to eventos WITH GRANT OPTION ;

--find objets

SELECT * FROM all_objects aj where aj.OWNER = 'BHMAP'
 AND AJ.OBJECT_TYPE IN ('TABLE', 'MATERIALIZED VIEW')  AND AJ.OBJECT_NAME NOT LIKE '%$%'

-- tipos disponiveis 
SELECT  aj.OBJECT_TYPE FROM all_objects aj where aj.OWNER = 'BHMAP'
group by aj.OBJECT_TYPE



  
