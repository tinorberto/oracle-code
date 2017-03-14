-------------------------------------------------------------------------------
----------------------------------- SCRIPTS BASICOS ---------------------
-------------------------------------------------------------------------------

--GEOMETRICAS
--1) Verificar  a relacao entre objetos da mesma tabela
select  sd.DIAMETRO_DUTO, sd.ID_DUTO, SDO_GEOM.RELATE(sd.GEOMETRIA, 'determine',sd2.GEOMETRIA , 0.005) 
from GERMEM.DUTO sd ,  GERMEM.DUTO sd2 
where sd2.ID_DUTO <> sd.ID_DUTO;

--2) Checar 
describe germem.duto;

--3)Checar a distancia
select p.id_caixa_passagem
    from
      germem.caixa_passagem p
    where sdo_nn(p.geometria, l_geom_ver_ini, 'sdo_num_res=1',1) = 'TRUE'
      and sdo_nn_distance(1) <= lc_dist_max;


--4) Checar uma relacao especifica
SELECT CAIXA_EMENDA.ID_CAIXA_EMENDA, CAIXA_PASSAGEM.ID_CAIXA_PASSAGEM 
    FROM GERMEM.CAIXA_PASSAGEM CAIXA_PASSAGEM,GERMEM.CAIXA_EMENDA CAIXA_EMENDA
    WHERE CAIXA_EMENDA.TIPO_CAIXA_EMENDA='S' AND 
      SDO_RELATE(CAIXA_PASSAGEM.GEOMETRIA, CAIXA_EMENDA.GEOMETRIA, 'mask=covers+contains') = 'TRUE'
      AND CAIXA_EMENDA.ID_CAIXA_EMENDA = ID_CAIXA_EMENDA;

	  
	  
--5) Buffer e correcao de buffer
l_seg_cabo_buffer := sdo_util.rectify_geometry(sdo_geom.sdo_buffer(i_geom, gc_tol_relacao, gc_tol_validacao), gc_tol_validacao);


--6) WKT para geometry 	  
  select  SDO_GEOMETRY('LINESTRING (611354.33356591 7796728.7982483, 611356.64167487 7796730.4090499, 611366.01 7796714.23, 611363.51478069 7796711.8304337)', 82301)
  into i_geom
  from dual;

  
--7)Validar geometria
select ID_CABO_TESTE, SDO_GEOM.VALIDATE_GEOMETRY(geometria, 0.05) from CABO_TESTE	  
	  
	  
	  
-- DML
--1) Adicionar campo na tabela
alter table ATIVOS_REDE.SEGMENTO_CABO add  MODELO_SEG_CABO VARCHAR2(30);  - -	"GEOMETRIA" "MDSYS"."SDO_GEOMETRY"

--2)Remover campo da tabela
alter table ATIVOS_REDE.CABO drop column MODELO_CABO;

--3) Adicionar e remover not null e default
ALTER TABLE GERMEM.CABO MODIFY (MANUTENCAO NOT NULL);
ALTER TABLE GERMEM.CABO MODIFY (MANUTENCAO DEFAULT 'N');

--4) Adiconar coluna, restricao e chave estrangeira
alter table GERMEM.CABO add ID_CABO_PAI NUMBER(10) Null;

COMMENT ON COLUMN GERMEM.CABO.ID_CABO_PAI  IS 'Identificação do cabo Pai para as ramificações do cabo.';

ALTER TABLE GERMEM.CABO ADD CONSTRAINT fk_CABO_PAI FOREIGN KEY (ID_CABO_PAI) REFERENCES GERMEM.CABO(ID_CABO);

--5) Manipular o index
drop index germem.cabo_sx;
     
CREATE INDEX "GERMEM"."CABO_SX" ON "GERMEM"."CABO" ("GEOMETRIA") 
INDEXTYPE IS "MDSYS"."SPATIAL_INDEX"  PARAMETERS ('layer_gtype=multiline');  

--6)¨Inserir na tabela de metadados
INSERT INTO mdsys.sdo_geom_metadata_table
VALUES ('GERMEM','VW_CABO','GEOMETRIA',
       MDSYS.SDO_DIM_ARRAY(MDSYS.SDO_DIM_ELEMENT('X',  580000,640000, 0.0001),MDSYS.SDO_DIM_ELEMENT('Y', 7750000,7840000, 0.0001)),82301);


--7) Buscar na tabela de metadados
 SELECT SDO_OWNER,  'germem.VW_CABO', SDO_COLUMN_NAME, SDO_DIMINFO, SDO_SRID
        FROM MDSYS.SDO_GEOM_METADATA_TABLE WHERE SDO_TABLE_NAME = 'VW_CABO';


--8) Dar a permissao para germem_app_ve
GRANT  SELECT, UPDATE, DELETE ON  GERMEM.VW_CABO TO germem_app_ve; 
GRANT  SELECT, UPDATE, DELETE ON  GERMEM.VW_CABO TO ativos_rede_ve; 

--9) Se for view adicionar um id 

--10) Exemplo de criação de view
  CREATE OR REPLACE FORCE VIEW "ATIVOS_REDE"."VW_RELAT_DUTO_SOBREPOE_DUTO" ("ID_ERRO", "ID_SEGMENTO_DUTO", "GEOMETRIA") AS 
  select  ROWNUM ID_ERRO, seg_duto_1.ID_SEGMENTO_DUTO , seg_duto_1.GEOMETRIA
from  ATIVOS_REDE.SEGMENTO_DUTO seg_duto_1  
inner join ATIVOS_REDE.SEGMENTO_DUTO seg_duto_2 on seg_duto_2.ID_SEGMENTO_DUTO = seg_duto_2.ID_SEGMENTO_DUTO
where  seg_duto_1.ID_SEGMENTO_DUTO <> seg_duto_2.ID_SEGMENTO_DUTO and  ( SDO_OVERLAPBDYDISJOINT(seg_duto_1.GEOMETRIA, seg_duto_2.GEOMETRIA ) = 'TRUE' OR SDO_TOUCH(seg_duto_1.GEOMETRIA, seg_duto_2.GEOMETRIA ) = 'TRUE');

--11) Lock e unlock
ALTER USER myuser ACCOUNT LOCK;
ALTER USER myuser ACCOUNT UNLOCK;
ALTER USER myuser PASSWORD EXPIRE;

--12) Check lock
SELECT username, 
       account_status
  FROM dba_users;

--13) Alter table add primary key  
  alter table sirgas2000.t_quadra_ctm
  add constraint pk_t_quadra_ctm
  primary key (id_quadra_ctm);

  

-- OUTROS
--1) Ligar a saida
set serveroutput on;

--2) Declarar tipo
--geometria mdsys.sdo_geometry;

--3) Resetar o package
 EXECUTE SYS.DBMS_SESSION.RESET_PACKAGE;
 
 --4) Buscar as exveptions
 select * from GERMEM.EXCECAO_APP order by  ID_EXCECAO_APP desc;
 
 --5) Imprimir no console 
 DBMS_OUTPUT.PUT_LINE(resultado);

 
--6) Criar usuarios
CREATE USER EDUARDO_ALVARENGA
  IDENTIFIED BY edualvarenga0220
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp;

 
 -- Achar area
 select ID_CAIXA_PASSAGEM, SDO_GEOM.SDO_AREA(GEOMETRIA, 0.005, 'unit=sq_m') as area from ATIVOS_REDE.CAIXA_PASSAGEM order by area ;
 
 
 
 
 
 -- verificar se a jog esta broken
SELECT JOB,
       WHAT,
       LAST_DATE,
       LAST_SEC,
       THIS_DATE,
       THIS_SEC,
       NEXT_DATE,
       NEXT_SEC,
       FAILURES,
       BROKEN,
       TOTAL_TIME
  FROM user_jobs j
 WHERE (j.BROKEN = 'Y' OR j.FAILURES > 0);
 
 
 -- desbroken
begin
  --TEM QUE ESTAR LOGADO COM O OWNER PARA ESSAS SITUAÕES
  DBMS_JOB.BROKEN(246, FALSE);
end;  


begin
  DBMS_MVIEW.REFRESH('BHMAP_LAGOA');
end;
 
 
 
 
 
 
 -- Oracle qGis ubuntu
 http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-2240591.html
 https://bisoftdiary.com/osm_gdal_oci_linux
 https://github.com/qgis/QGIS/blob/master/INSTALL
 
 http://stackoverflow.com/questions/8266568/connect-python-to-oracle