
-- buscar o nome se  o usario existe no siuca
select * from siuca.usuario su 
left join  siuca.usuario_base_dados_geoc ug on su.id_usuario = ug.id_usuario
where UPPER(su.nome_usuario) like UPPER('Gu%');

-- 
select  rowid, s.* FROM siuca.setor_orgao s;

insert into siuca.setor_orgao (id_setor_orgao, desc_setor, sigla_setor, nome_unid_organizacional, sigla_unid_organizacional) values 
(57, 'Ger�ncia de Licenciamento Urban�stico', 'GELU', 'EMPRESA DE TRANSPORTE E TRANSITO DE BH',  'BHTRANS');

commit;  --49



-- inserir os dados na tabela de usuario
insert into SIUCA.USUARIO SU (DATA_CADASTRO_USUARIO , MATRICULA_USUARIO, NOME_USUARIO, DESC_CARGO  
, TEL_USUARIO, EMAIL_USUARIO,SITUACAO_USUARIO, ID_SETOR_ORGAO) values(
sysdate,
'pr111366',
upper('JACKSON JESSE NONATO PIRES'),
'Analista',
'(31) 3277-1034',
'jackson.jesse@pbh.gov.br',
'ATIVO',
72
);

commit;


select * FROM SIUCA.USUARIO SU 
order by su.id_usuario desc;

-- tabela de usuarios do oracle
-- verificar se o usuario existe  1384
-- 1381
select * FROM all_users au where au.username like upper('GUSTAVORAUBER')


--1281  PAULA_CABRAL  1325

-- inserir os dados na tabela do siuca
select * from siuca.usuario_base_dados_geoc for update;



declare
   result number;
   i_id_usuario  number;
   o_email  varchar2(255);
   i_sdm  number;
   
begin
   i_id_usuario := 1381;
   o_email := 'thais.ksantos@edu.pbh.gov.br';
   i_sdm  := 1810711; 

   -- Call the function
   result := siuca.fu_cria_usuario_bdgc(i_id_usuario,  o_email, i_sdm);
   DBMS_OUTPUT.put_line(o_email);
end;   
   


-- PAULA_CABRAL

-- atribuiir as roles
SELECT * FROM DBA_ROLES  dr where  dr.ROLE like '%SELECT_MUB_V2%';

select * FROM dba_role_privs  rp where rp.GRANTED_ROLE = 'UPDATE_LANC_PRELIMINAR'
 
-- privs de uma role
SELECT * FROM dba_tab_privs d  where d.grantee =UPPER('SELECT_MUB_V2');


grant SELECT_MUB_V2 to ANETE_ALVAREZ; 
grant SELECT_MUB_V2 to SENA; 
grant SELECT_MUB_V2 to PEDRONGINT; 

create role  UPDATE_TRANSITO;


grant UPDATE_TRANSITO to ANETE_ALVAREZ; 
grant UPDATE_TRANSITO to SENA; 
grant UPDATE_TRANSITO to PEDRONGINT; 
grant UPDATE_TRANSITO to SIBELLE; 

select  'GRANT DELETE, INSERT, UPDATE ON '||owner||'.'||table_name||' TO UPDATE_TRANSITO; ' 
  from all_tables where owner = 'TRANSITO'
  and table_name not like 'MDRT%' and table_name not like 'MDXT%'  --CROQUI_TRIBUTARIO_V
  

select * FROM all_users;


grant SELECT_CADASTRO_TECNICO to THAIS_KSANTOS;
grant SELECT_SISTEMA_VIARIO to THAIS_KSANTOS;

-- SELECT    05/07  TOTAL 667  CADASTRADOE 280   FALTA     387 REGISTROS 
select * from all_users au 
left join  siuca.usuario_base_dados_geoc us on us.login_usuario_base_dados = au.username
left join siuca.usuario u on u.id_usuario = us.id_usuario
where username not in  ('APEX_030200', 'SYSMAN', 
'EXFSYS', 'AUDSYS','SYS','SYSBACKUP','SYSDG','SYSKM','SYSTEM','OUTLN','GSMADMIN_INTERNAL','GSMUSER',
'DIP','XS$NULL','ORACLE_OCM','DBSNMP','APPQOSSYS','ANONYMOUS','XDB','GMCATUSER','WMSYS','OJVMSYS','CTXSYS',
'MDSYS','ORDDATA','ORDPLUGINS','ORDSYS','SI_INFORMTN_SCHEMA','OLAPSYS','MDDATA','SPATIAL_WFS_ADMIN_USR','SPATIAL_CSW_ADMIN_USR',
 'SPATIAL_CSW_ADMIN_UR', 'MAPINFO',
'LBACSYS','APEX_040200','APEX_PUBLIC_USER','FLOWS_FILES','DVF','DVSYS', 'SDE', 'SPOT', 'GDOSYS',
'MGMT_VIEW', 'OWBSYS', 'OWBSYS_AUDIT' ,'SCOTT', 'USRSERVICOCTMCP')
and username not like 'APP_%'
and username not like 'LK_%'
and username not like 'DW_%'
and username not like 'SG_%'
and username not like 'SIURBE_%'
and username not like 'BHMAP%'
and username not like 'CARGA_%'
and username not like '%MSYS%'
and username not like 'WS_%'
and username not like 'TESTE%'
and username not like 'FME%'
and username not like 'GEOC%'
and username not like 'DIAGNOSTICO_%'
and username not in  ('AREA_RISCO', 'ATIVOS_REDE_QGIS','BHTRANS' ,'CIRCULACAO_VIARIA','CADASTRO_TECNICO','CP', 'CTM', 'DIPC', 'DIPC001' ,'ESPACO_AEREO', 'ECONOMIA', 'EDUCACAO', 'EPP', 'ESPELHO_CADASTRO_TECNICO',
'ESTRATEGICO','EDIFICACAO' ,'EVENTOS','EQUIPAMENTOS','ESPELHO_TABELAS','FISCALIZACAO' , 'IDEDBSTAGINGAREA', 'IDEDBSTAGINGAREA', 'INFRA_ESTRUTURA', 'LANCAMENTO_PRELIMINAR','LIDAR_RASTER', 'LPOUS', 'MEIO_AMBIENTE',
'MOBILIARIO_URBANO', 'OBRA', 'PARAM_URB', 'PARAM_URB_PROPOSTAS', 'PATRIMONIO', 'PATRIMONIO_CULTURAL', 'SIUCA' , 'SMARU' , 'SMED', 'SMPS',
'LAZER', 'LEVANTAMENTO' ,'LIMPEZA_URBANA','REFERENCIA', 'REBECADECASTRO', 'TELECOMUNICACAO', 'TRANSITO', 'TRANSPORTE', 'TRIBUTARIO', 'URBEL')
and USERNAME not in('ACERVO','AERO','AERO2015','ARCGISSERVERREAD','CBDG','CBDG001','DADOS_AERO','ENERGIA','GEDIV','GEINC','GEOAERO','GEOMLIB','GEORGEW','GEPT','GERMEM','GMLIB','GPROG','IMAGEM_BH','INCLUSAO_DIGITAL','ISS','MAPINFO_SGBI','PLANEJ','PLANIALTIMETRICO','POLITICA_SOCIAL','SAUDE','SEGURANCA','SIAFIM_APP','SIELEN','SIGEAR001','SIGUR','SIMONE_ROCHA','SIRGAS2000','SISTEMA_VIARIO','SIUR','SIURBE','SIUR001','VINICIUSM','VISUALIZADOR','WILLIAM_SILVA','WKSP_IP')
order by AU.username;
