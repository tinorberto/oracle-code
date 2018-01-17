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
 where lock_date is not null;  
  
  
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

 -------------------------------------------------------

CREATE OR REPLACE VIEW EVENTOS.PONTO_CONCENTRACAO_BLOCO AS
SELECT 
    ate.nome_atracao AS "NOME_BLOCO",
    atv.PUBLICO_ESPERADO,
    TO_CHAR(atv.DATA_HORA_ATIVIDADE,'DD/MM')      AS "DATA_CONCENTRACAO",
    TO_CHAR(atv.DATA_HORA_CONCENTRACAO,'HH24:MI') AS "HORARIO_CONCENTRACAO",
    PTP.GEOMETRIA,
    NVL(PTP.REFERENCIA_PT,CADASTRO_TECNICO.FU_GET_ENDERECO_DESC(PTP.ID_ENDERECO_PBH)) AS "REFERENCIA",
    LOC.ID_LOCALIZACAO, ATV.ID_ATIVIDADE
  FROM EVENTOS.ATIVIDADE atv,
    eventos.atracao_evento  ate,
    EVENTOS.LOCALIZACAO loc,
    EVENTOS.Localizacao_Pt_Referencia lpr
  WHERE atv.ID_ORGANIZACAO   = og.ID_ORGANIZACAO
  AND loc.ID_LOCALIZACAO     = atv.ID_LOCALIZACAO
  AND LOC.ID_PT_CONCENTRACAO = .ID_PT_PERCURSO
 -- AND atv.TITULO_ORGANIZACAO  = 'BLOCO DE CARNAVAL';


------------------------------------------------------------------------------
create or replace view eventos.ponto_dispersao_bloco as
select  og.NOME_ORGANIZACAO as "NOME_BLOCO", 
atv.PUBLICO_ESPERADO, 
to_char(atv.DATA_HORA_DISPERSAO,'DD/MM') AS "DATA_DISPERSAO", 
to_char(atv.DATA_HORA_DISPERSAO,'HH24:MI') AS "HORARIO_DISPERSAO", 
PTP.GEOMETRIA, 
NVL(PTP.REFERENCIA_PT,CADASTRO_TECNICO.FU_GET_ENDERECO_DESC(PTP.ID_ENDERECO_PBH)) AS "REFERENCIA", LOC.ID_LOCALIZACAO
from EVENTOS.ATIVIDADE atv, 
     EVENTOS.ORGANIZACAO og,
     EVENTOS.LOCALIZACAO loc, 
     EVENTOS.PT_PERCURSO PTP
where atv.ID_ORGANIZACAO = og.ID_ORGANIZACAO 
and loc.ID_LOCALIZACAO = atv.ID_LOCALIZACAO 
AND LOC.ID_PT_DISPERSAO = PTP.ID_PT_PERCURSO
AND og.TITULO_ORGANIZACAO = 'BLOCO DE CARNAVAL';




-------------------------------------------------------
create or replace view eventos.folionibus_pt_view as
select
loc.ID_LOCALIZACAO,
loc.NOME_LOCALIZACAO,
pt.ID_PT_PERCURSO,
pt.GEOMETRIA
from EVENTOS.LOCALIZACAO loc
join EVENTOS.PT_PERCURSO pt
on (loc.ID_PT_CONCENTRACAO = pt.ID_PT_PERCURSO or loc.ID_PT_DISPERSAO= pt.ID_PT_PERCURSO)
where NOME_LOCALIZACAO = 'FOLIÔNIBUS';














--------------------------------------------------------------------------
CREATE OR REPLACE VIEW EVENTOS.PONTO_DISPERSAO AS
SELECT TIPO_ATRACAO.NOME_TIPO_ATRACAO AS TIPO, ATRACAO_EVENTO.NOME_ATRACAO AS NOME, ATIVIDADE.QTE_PUBLICO_ESPERADO AS PUBLICO_ESPERADO,
to_char(ATIVIDADE.DATA_HORA_DISPERSAO,'DD/MM') AS "DATA_DISPERSAO", to_char(ATIVIDADE.DATA_HORA_DISPERSAO,'HH24:MI') AS "HORARIO_DISPERSAO", PONTO_REFERENCIA.GEOMETRIA,
NVL(PONTO_REFERENCIA.LOCAL_REFERENCIA,CADASTRO_TECNICO.FU_GET_ENDERECO_DESC(PONTO_REFERENCIA.ID_ENDERECO_PBH)) AS "REFERENCIA", LOCALIZACAO.ID_LOCALIZACAO, ATIVIDADE.ID_ATIVIDADE, ATIVIDADE.ID_EVENTO
from EVENTOS.ATIVIDADE, EVENTOS.ATRACAO_EVENTO, EVENTOS.LOCALIZACAO, EVENTOS.Localizacao_Pt_Referencia LPT, EVENTOS.PONTO_REFERENCIA, EVENTOS.Tipo_Atracao
where ATIVIDADE.ID_ATRACAO_EVENTO = ATRACAO_EVENTO.ID_ATRACAO_EVENTO and LOCALIZACAO.ID_LOCALIZACAO = ATIVIDADE.ID_LOCALIZACAO AND  ATRACAO_EVENTO.ID_TIPO_ATRACAO = TIPO_ATRACAO.ID_TIPO_ATRACAO
  AND Localizacao.Id_LOCALIZACAO = LPT.ID_LOCALIZACAO AND LPT.ID_PONTO_REFERENCIA = PONTO_REFERENCIA.ID_PONTO_REFERENCIA AND LPT.ID_TIPO_PONTO_REFERENCIA = 2;

 
  