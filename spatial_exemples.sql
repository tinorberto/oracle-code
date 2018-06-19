-- de wkt para 

-- criar reta com dois ponstis
  -- definir o segmento atual
l_geo_seg_atual := Mdsys.Sdo_geometry( 2002, 82301, null,
	 MDSYS.SDO_ELEM_INFO_ARRAY(1, 2, 1),
	 MDSYS.SDO_ORDINATE_ARRAY( l_geom_seg_ini.sdo_point.x , l_geom_seg_ini.sdo_point.y , l_geometria.sdo_point.x ,l_geometria.sdo_point.y));
	 
	 
-- imprimir wkt de geometria
DBMS_OUTPUT.PUT_LINE(SDO_UTIL.TO_WKTGEOMETRY(l_geo_seg_atual ) );
  
  
-- checar distancia de uma geometria
 select c.id_caixa_emenda
        from germem.caixa_emenda c
        where sdo_nn(c.geometria,(
         select  SDO_GEOMETRY('POINT (616229.12398547 7795825.6584237)', 82301)
  from dual)
        , 'sdo_num_res=1',1) = 'TRUE'  AND sdo_nn_distance(1) <= 0.5  
		
		
		
--	Verificar  a relacao entre objetos da mesma tabela
select  sd.DIAMETRO_DUTO, sd.ID_DUTO, SDO_GEOM.RELATE(sd.GEOMETRIA, 'determine',sd2.GEOMETRIA , 0.005) 
from GERMEM.DUTO sd ,  GERMEM.DUTO sd2 
where sd2.ID_DUTO <> sd.ID_DUTO;


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


--6)  para geometry 	  
  select  SDO_GEOMETRY('LINESTRING (611354.33356591 7796728.7982483, 611356.64167487 7796730.4090499, 611366.01 7796714.23, 611363.51478069 7796711.8304337)', 82301)
  into i_geom
  from dual;

  
--7)Validar geometria
select ID_CABO_TESTE, SDO_GEOM.VALIDATE_GEOMETRY(geometria, 0.05) from CABO_TESTE	  
	  
	  
 -- Achar area
 select ID_CAIXA_PASSAGEM, 	 from ATIVOS_REDE.CAIXA_PASSAGEM order by area ;	
 
 
 -- Distancia entre duas geometrias
 SDO_GEOM.SDO_DISTANCE(loc.geometria,  pp.geometria, 0.005, 'unit=M') distancia


--
DBMS_OUTPUT.PUT_LINE( to_char( SDO_UTIL.TO_WKTGEOMETRY(l_geom_seg)));
 
-- Loop nos vertices
 
  FOR j IN ( 
    select *
    FROM germem.segmento_cabo  sca,  
    TABLE(SDO_UTIL.GETVERTICES(sca.geometria)) t   
    where sca.id_segmento_cabo = i_id_seg_cabo)  
                
  LOOP
  


-- criar linhas com todos os pontos dados os vertices de uma geometria
with points as(     
select  t.x, t.y , t.id
FROM germem.segmento_cabo  sca,  
TABLE(SDO_UTIL.GETVERTICES(sca.geometria)) t 
where sca.id_segmento_cabo = 443)
select  Mdsys.Sdo_geometry( 2002, 82301, null,
     MDSYS.SDO_ELEM_INFO_ARRAY(1, 2, 1),
      CAST(MULTISET(SELECT b.COLUMN_VALUE
            FROM points a,
            TABLE(mdsys.sdo_ordinate_array(a.x,a.y))b
            where a.id > 1
            )
            AS mdsys.sdo_ordinate_array)) AS linestring
 from dual;
		