
-- tamanho do esquema em mega
SELECT sum(bytes)/1024/1024 as size_in_mega
  FROM dba_segments
 WHERE owner = '&PATRIMONIO_CULTURAL'
 
 
-- table space size_in_mega
select b.tablespace_name, tbs_size SizeMb, a.free_space FreeMb

from  (select tablespace_name, round(sum(bytes)/1024/1024 ,2) as free_space

       from dba_free_space

       group by tablespace_name) a,

      (select tablespace_name, sum(bytes)/1024/1024 as tbs_size

       from dba_data_files

       group by tablespace_name) b

where a.tablespace_name(+)=b.tablespace_name; 