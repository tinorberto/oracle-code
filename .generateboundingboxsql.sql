set serveroutput on;
declare 
    x1 number;
    y1 number;
    x2 number;
    y2 number;
    l_geom mdsys.sdo_geometry;
begin

  with mbr as 
  (select rownum coord_seq, column_value coord from table (select sdo_aggr_mbr(GEOMETRIA).sdo_ordinates 
    from GERMEM.CAIXA_PASSAGEM WHERE ID_CAIXA_PASSAGEM = 2081)) 
   select (select coord x1 from mbr where coord_seq = 1) x1 
        , (select coord y1 from mbr where coord_seq = 2) y1
        , (select coord x2 from mbr where coord_seq = 3) x2
        , (select coord y2 from mbr where coord_seq = 4) y2
        into x1, y1, x2, y2
     from dual;

  DBMS_OUTPUT.PUT_LINE(x1||' '||y1||' '||x2||' '||y2);
 
  select  SDO_AGGR_MBR((sdo_cs.transform (sdo_geometry(2003, 29193,  null,sdo_elem_info_array(1,1003,3), MDSYS.SDO_ORDINATE_ARRAY(x1, y1, x2, y2)),4326 ))) into l_geom from dual; 
  
   with mbr as 
  (select rownum coord_seq, column_value coord from table (select (l_geom).sdo_ordinates 
    from dual)) 
   select (select coord x1 from mbr where coord_seq = 1) x1 
        , (select coord y1 from mbr where coord_seq = 2) y1
        , (select coord x2 from mbr where coord_seq = 3) x2
        , (select coord y2 from mbr where coord_seq = 4) y2
        into x1, y1, x2, y2
     from dual;  

  DBMS_OUTPUT.PUT_LINE(x1||' '||y1||' '||x2||' '||y2);
 --DBMS_OUTPUT.PUT_LINE(SDO_UTIL.TO_WKTGEOMETRY(l_geom));
  
  

 
end;   
