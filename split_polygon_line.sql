create or replace function fu_quebra_poligono_linhas(i_id_curva_sec in number)
  return geocorpapi.geolib.gt_tab_sdo_geometry
  pipelined is
  l_geom                 mdsys.sdo_geometry;
  perimetro_linha          number(10) := 0;  -- tamanho total a linha a ser dividida
  tamanho_segmento_linha number(10) := 0;  -- tamanho de cada resultante da divisao
  tamanho_linha    number(10) := 10000; -- tamanho de cada segmento a ser gerado
  
begin

  -- buscar o perimetro da linha
  select sdo_geom.sdo_length(sdo_util.polygontoline(lm.geometria),
                             mdsys.sdo_dim_array(mdsys.sdo_dim_element('X',
                                                                       598487.098431027,
                                                                       619327.974503302,
                                                                       .001),
                                                 mdsys.sdo_dim_element('Y',
                                                                       7781771.42414864,
                                                                       7812877.3181585,
                                                                       .001)),
                             'unit=M')
    into perimetro_linha
    from cadastro_tecnico.limite_municipio lm;


  while (true) loop
    dbms_output.put_line(tamanho_segmento_linha);
    -- calcula o tamanho do segmento de liha 
    tamanho_segmento_linha := tamanho_segmento_linha + tamanho_linha;
  
    -- essa parte gera o ultimo segmento, o seu tamanho sera variavel 
    if tamanho_segmento_linha > perimetro_linha then
      tamanho_segmento_linha := tamanho_segmento_linha - tamanho_linha; -- retira o ultimo valor incremantado
      tamanho_segmento_linha := perimetro_linha - tamanho_segmento_linha; 
      dbms_output.put_line(tamanho_segmento_linha);
      
      -- gera a geometria para cada segmento 
      select sdo_lrs.convert_to_std_geom(sdo_lrs.clip_geom_segment(sdo_lrs.convert_to_lrs_geom(sdo_util.polygontoline(lm.geometria)),
        perimetro_linha - tamanho_segmento_linha, perimetro_linha)) as geom
        into l_geom
        from cadastro_tecnico.limite_municipio lm;
    
      pipe row(l_geom);
    
      exit;
    else
      -- gera a geometria para cada segmento 
      select sdo_lrs.convert_to_std_geom(sdo_lrs.clip_geom_segment(sdo_lrs.convert_to_lrs_geom(sdo_util.polygontoline(lm.geometria)),
                                                                   tamanho_segmento_linha - tamanho_linha,
                                                                  tamanho_segmento_linha)) as geom
        into l_geom
        from cadastro_tecnico.limite_municipio lm;
    
      pipe row(l_geom);
    
    end if;
  end loop;
end;


-- gerar a tabela utilizando a funcao 
create table dividir_poly_4 as 
select   MDSYS.SDO_GEOMETRY(
     sdo_gtype,  
    sdo_srid,
    NULL,
    sdo_elem_info, 
   sdo_ordinates 
  )  as geometria 
   FROM table (fu_quebra_poligono_linhas(10)) ;
   
   
-- testes
create table dividir_poly_1 as  select 
sdo_lrs.convert_to_std_geom(
  sdo_lrs.clip_geom_segment (
 sdo_lrs.convert_to_lrs_geom (  SDO_UTIL.POLYGONTOLINE(lm.geometria)),0, 2000))  as geom
 FROM cadastro_tecnico.limite_municipio lm
 

 