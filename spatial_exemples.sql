-- de wkt para 

-- criar reta com dois ponstis
  -- definir o segmento atual
l_geo_seg_atual := Mdsys.Sdo_geometry( 2002, 82301, null,
	 MDSYS.SDO_ELEM_INFO_ARRAY(1, 2, 1),
	 MDSYS.SDO_ORDINATE_ARRAY( l_geom_seg_ini.sdo_point.x , l_geom_seg_ini.sdo_point.y , l_geometria.sdo_point.x ,l_geometria.sdo_point.y));
	 
	 
-- imporimir wkt de geometria
DBMS_OUTPUT.PUT_LINE(SDO_UTIL.TO_WKTGEOMETRY(l_geo_seg_atual ) );
  
  
-- checar distancia de uma geometria
 select c.id_caixa_emenda
        from germem.caixa_emenda c
        where sdo_nn(c.geometria,(
         select  SDO_GEOMETRY('POINT (616229.12398547 7795825.6584237)', 82301)
  from dual)
        , 'sdo_num_res=1',1) = 'TRUE'  AND sdo_nn_distance(1) <= 0.5  