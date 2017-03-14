declare

  l_user        varchar2(30) := 'RODRIGO_NUNES';
  
  l_tab_roles        geocorpapi.bdlib.gt_tab_varchar2;         
  l_temp_tab_roles   geocorpapi.bdlib.gt_tab_varchar2;         
  
  l_index       smallint;
  l_index_i     smallint;
  
  cursor cur_roles (curp_grantee in varchar2) is
    select r.granted_role
    from dba_role_privs r
    where r.grantee = curp_grantee;
  
begin

  l_tab_roles := geocorpapi.bdlib.gt_tab_varchar2();
  
  select r.granted_role
  bulk collect into l_tab_roles
  from dba_role_privs r
  where r.grantee = l_user;
  
  l_index  := l_tab_roles.first;
  
  loop
    
    l_index_i := l_index; 
    
    for i in l_index .. l_tab_roles.count loop
      for r in (select t.granted_role
                from dba_role_privs t
                where t.grantee = l_tab_roles(i)) loop
        
        l_tab_roles.extend;
        l_tab_roles(l_tab_roles.last) := r.granted_role;
      
        l_index := l_index + 1;
        
      end loop;
    end loop;
    
    exit when l_index = l_index_i;    
  end loop;
  
  for i in l_tab_roles.first .. l_tab_roles.last loop
    dbms_output.put_line(l_tab_roles(i));
  end loop;
  
end;

select 
  --falta incluir as permissoes por system role
  DISTINCT
  u.USERNAME
  --,u.account_status
 /* ,case t.grantee 
     when u.username then
       null
     when r.column_value then
       r.column_value
     else 
       null
   end granted_role */
  ,t.owner
  ,t.table_name
  ,t.privilege
from
  dba_users u,
  table (jose_ricardo.fu_user_roles_roles(u.username)) r,
  dba_tab_privs t 
where
  u.username = upper('&user')
  AND (u.username = t.grantee or r.column_value = t.grantee)
  and  r.column_value not in ('SELECT_CATALOG_ROLE', 'HS_ADMIN_ROLE')
  ORDER BY   
  username, /*granted_role,*/ t.owner, t.table_name;
  
  SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = 'HS_ADMIN_ROLE';
  
  REVOKE SELECT_CATALOG_ROLE FROM
  
  select T.COLUMN_VALUE from table (jose_ricardo.fu_user_roles_roles('RODRIGO_NUNES')) T
  
