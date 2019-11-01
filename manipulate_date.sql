-- buscar por data
select * FROM levantamento.hist_levantamento_campo  hlc where trunc(hlc.data_operacao) = to_date('30/10/2019','DD/MM/YYYY');

-- data da hora
select sysdate  FROM dual;  

-- data do dia anteriro
select sysdate -1 FROM dual;  

-- extratir do dia  YEAR, MONTH, DAY   extract
select extract( year from sysdate -1) FROM dual;  
select extract( month from sysdate -1) FROM dual;  
select extract( day from sysdate -1) FROM dual;  


