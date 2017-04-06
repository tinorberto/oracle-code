with mbr as 
(select rownum coord_seq, column_value coord from table (select sdo_aggr_mbr(SDO_CS.TRANSFORM(GEOMETRIA, 4326)).sdo_ordinates 
  from GERMEM.CAIXA_PASSAGEM)) 
 select (select coord x1 from mbr where coord_seq = 1) x1
      , (select coord y1 from mbr where coord_seq = 2) y1
      , (select coord x2 from mbr where coord_seq = 3) x2
      , (select coord y2 from mbr where coord_seq = 4) y2
   from dual;