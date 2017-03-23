-------------------------------------------------------------------------------
----------------------------------- SCRIPTS BASICOS ---------------------
-------------------------------------------------------------------------------

--Manipulacao de ARRAY

--1 criacao do de tipoi
 CREATE TYPE ESCHEMA.table_type IS VARRAY(5) OF NUMBER(10);
 
--2 criacao 
  l_str_tab := str_tab_type();

--3 adicopnar um item
l_lista_portas_dio_vis.extend;
l_lista_portas_dio_vis(l_lista_portas_dio_vis.last) := l_dio_porta;  
 
 