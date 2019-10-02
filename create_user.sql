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


-- alter password
ALTER USER user_name IDENTIFIED BY new_password;

grant connect, resource to IDEPBH_CARGA;


-- defeault  role
alter user ADRIANE_CUNHA default role UPDATE_EQUIP_CULTURAL;



-- Exemplo de criacao  de usuario  
  CREATE USER GEONETWORK
  IDENTIFIED BY geonetwork1335
  DEFAULT TABLESPACE SIGUR
  TEMPORARY TABLESPACE temp;
  
  
GRANT CONNECT TO GEONETWORK;
GRANT UNLIMITED TABLESPACE TO GEONETWORK;

GRANT CREATE SESSION  TO GEONETWORK;
 GRANT PRIVILEGE TO GEONETWORK;
  

GRANT CREATE ANY TABLE    TO GEONETWORK;
GRANT  CREATE INDEXTYPE TO GEONETWORK;
  
 
 
 
PRIVILEGE                             M
---------------------------------------
ALTER ANY CLUSTER                     
ALTER ANY DIMENSION                   
ALTER ANY EVALUATION CONTEXT          
ALTER ANY INDEX                       
ALTER ANY INDEXTYPE                   
ALTER ANY LIBRARY                     
ALTER ANY MATERIALIZED VIEW           
ALTER ANY OPERATOR                    
ALTER ANY PROCEDURE                   
ALTER ANY ROLE                        
ALTER ANY RULE                        
ALTER ANY RULE SET                    
ALTER ANY SEQUENCE                    
ALTER ANY TABLE                       
ALTER ANY TRIGGER                     
ALTER ANY TYPE                        
ALTER SYSTEM                          
ALTER USER                            
ANALYZE ANY                           
AUDIT ANY                             
BACKUP ANY TABLE                      
COMMENT ANY TABLE                     
CREATE ANY CLUSTER                    
CREATE ANY CONTEXT                    
CREATE ANY DIMENSION                  
CREATE ANY DIRECTORY                  
CREATE ANY INDEX                      
CREATE ANY INDEXTYPE                  
CREATE ANY JOB                        
CREATE ANY LIBRARY                    
CREATE ANY MATERIALIZED VIEW          
CREATE ANY PROCEDURE                  
CREATE ANY RULE                       
CREATE ANY RULE SET                   
CREATE ANY SEQUENCE                   
CREATE ANY SQL PROFILE                
CREATE ANY SYNONYM                    
CREATE ANY TABLE                      
CREATE ANY TRIGGER                    
CREATE ANY TYPE                       
CREATE ANY VIEW                       
CREATE CLUSTER                        
CREATE DATABASE LINK                  
CREATE DIMENSION                      
CREATE EXTERNAL JOB                   
CREATE INDEXTYPE                      
CREATE JOB                            
CREATE MATERIALIZED VIEW              
CREATE PROCEDURE                      
CREATE PUBLIC DATABASE LINK           
CREATE PUBLIC SYNONYM                 
CREATE ROLE                           
CREATE RULE                           
CREATE RULE SET                       
CREATE SEQUENCE                       
CREATE SESSION                        
CREATE SYNONYM                        
CREATE TABLE                          
CREATE TRIGGER                        
CREATE TYPE                           
CREATE USER                           
CREATE VIEW                           
DEBUG ANY PROCEDURE                   
DEBUG CONNECT SESSION                 
DELETE ANY TABLE                      
DROP ANY CLUSTER                      
DROP ANY CONTEXT                      
DROP ANY DIMENSION                    
DROP ANY INDEX                        
DROP ANY INDEXTYPE                    
DROP ANY MATERIALIZED VIEW            
DROP ANY OPERATOR                     
DROP ANY OUTLINE                      
DROP ANY PROCEDURE                    
DROP ANY ROLE                         
DROP ANY RULE SET                     
DROP ANY SEQUENCE                     
DROP ANY SQL PROFILE                  
DROP ANY SYNONYM                      
DROP ANY TABLE                        
DROP ANY TRIGGER                      
DROP ANY TYPE                         
DROP ANY VIEW                         
DROP PUBLIC SYNONYM                   
ENQUEUE ANY QUEUE                     
EXECUTE ANY EVALUATION CONTEXT        
EXECUTE ANY INDEXTYPE                 
EXECUTE ANY LIBRARY                   
EXECUTE ANY PROCEDURE                 
EXECUTE ANY PROGRAM                   
EXECUTE ANY RULE                      
EXECUTE ANY RULE SET                  
EXECUTE ANY TYPE                      
EXPORT FULL DATABASE                  
FORCE ANY TRANSACTION                 
FORCE TRANSACTION                     
GLOBAL QUERY REWRITE                  
IMPORT FULL DATABASE                  
INSERT ANY TABLE                      
MANAGE ANY QUEUE                      
MERGE ANY VIEW                        
ON COMMIT REFRESH                     
QUERY REWRITE                         
READ ANY FILE GROUP                   
RESTRICTED SESSION                    
SELECT ANY DICTIONARY                 
SELECT ANY SEQUENCE                   
SELECT ANY TABLE                      
SELECT ANY TRANSACTION                
UNDER ANY TYPE                        
UNDER ANY VIEW                        
UNLIMITED TABLESPACE                  
UPDATE ANY TABLE                      
 