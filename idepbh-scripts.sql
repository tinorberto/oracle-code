declare
   type array_t is varray(4) of varchar2(200);
   array array_t := array_t('CADASTRO_TECNICO', 'DIVISA_LOTE', 'PLANEJ','SETOR_CENSITARIO_2010');
   result varchar2(2000); 
   
begin 
   for i in 1..array.count loop
       -- se for par pular para o proximi    
       IF mod (i, 2) = 0 then
        continue; 
       end if;
       --dbms_output.put_line((i));
       -- mlog 
       begin
         select  'grant select on '||log_owner||'.'||log_table ||' to idedbstagingarea;'into result
                 from all_mview_logs where master =  array(i+1) and LOG_OWNER =  array(i);
         DBMS_OUTPUT.PUT_LINE(result);              
         exception
         when no_data_found  then  DBMS_OUTPUT.PUT_LINE('Nao encontrou '||array(i+1) ); 
          DBMS_OUTPUT.PUT_LINE('create materialized view log on '|| array(i)||'.'|| array(i+1)||' with sequence,primary key,  rowid  including new values; ');
       
       end; 
        
         -- acesso ao dados
       begin
         select  'grant select on '||owner||'.'||object_name ||' to idedbstagingarea;' into result
                 from all_objects  where object_name =  array(i+1) and OWNER =  array(i)  and object_type in ('VIEW', 'TABLE' , 'MATERIALIZED VIEW');
         DBMS_OUTPUT.PUT_LINE(result);              
         exception
         when no_data_found  then  DBMS_OUTPUT.PUT_LINE('Nao encontrou a tabela  '||array(i+1) ); 
    
         end;
  end loop; 
 
end;




declare 
   result varchar2(500);
   mviewname varchar2(500);
   mviewnumber number(10);
   mviewscript varchar2(3000); 
   tablename_v varchar2(500);
   owner_v varchar2(500);
   tablecolluns varchar2(3999);
   mvlog varchar(4000);
begin 
  owner_v :='IDEDBSTAGINGAREA';
  tablename_v := 'MV036';
  
  
select MVIEW_NAME into result   from (select   (MVIEW_NAME) from all_mviews al  where al.OWNER = upper('idedbstagingarea') and al.MVIEW_NAME like 'MV%'  
order by MVIEW_NAME desc )
where rownum = 1;
--DBMS_OUTPUT.PUT_LINE(result);  

mviewname :=  REPLACE(result, 'MV');

--DBMS_OUTPUT.PUT_LINE(mviewname);

mviewnumber := TO_NUMBER(mviewname);

--DBMS_OUTPUT.PUT_LINE(mviewnumber+1);
 tablecolluns := 'rowid rowidt,'||chr(13)||chr(10);

FOR j IN (select COLUMN_name from  all_tab_columns where owner = owner_v  and  TABLE_NAME = tablename_v) 
loop
  --DBMS_OUTPUT.PUT_LINE(j.column_name );
  tablecolluns := tablecolluns || j.column_name ||' ,' ||chr(13)||chr(10);
  
END LOOP; 

-- remover a ultima virgula
select RTRIM(tablecolluns , chr(13)||chr(10)||',') into tablecolluns FROM DUAL ;


mviewscript := 'create materialized view idedbstagingarea.MV0'||(mviewnumber+1)||chr(13)||chr(10)||
  ' noparallel'||chr(13)||chr(10)||
  ' nologging'||chr(13)||chr(10)||
  ' build immediate'||chr(13)||chr(10)||
  ' refresh fast on demand'||chr(13)||chr(10)||
  ' next  sysdate + 2/24/60 '||chr(13)||chr(10)||
 ' as'||chr(13)||chr(10)||
' select '||tablecolluns||
' from '||owner_v||'.'||tablename_v||';';

DBMS_OUTPUT.PUT_LINE(mviewscript);

mvlog := 'create materialized view log on IDEDBSTAGINGAREA.MV0'||(mviewnumber+1)||chr(13)||chr(10)||  
'with sequence,primary key,  rowid  including new values; ';
-- CRIACAO DA MVIEW 
DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE(mvlog);


--PK
DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE('alter table IDEDBSTAGINGAREA.MV0'||(mviewnumber+1)|| 'add constraint PK_MV0'||(mviewnumber+1)|| ' primary key ();');


DBMS_OUTPUT.PUT_LINE('');
--PERMISSAO
DBMS_OUTPUT.PUT_LINE('grant select on IDEDBSTAGINGAREA.MLOG$_MV0'||(mviewnumber+1)|| ' to LK_BHMAP_GEOC;');
DBMS_OUTPUT.PUT_LINE('grant select on IDEDBSTAGINGAREA.MV0'||(mviewnumber+1)|| ' to LK_BHMAP_GEOC;');



end;


