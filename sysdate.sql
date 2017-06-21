-- horas 
select  TRUNC(SYSDATE+1) from dual; -- 22/06/2017  amanha sem horas

select  (SYSDATE+1) from dual; -- 22/06/2017  amanha com horas

select  trunc(SYSDATE+1)+2/24 from dual; -- 22/06/2017 02:00:00 amanha com horas

select  trunc(SYSDATE+1)+2/24 +5/1440 + 30/86400 from dual; -- 22/06/2017 02:05:30 amanha com horas

select trunc(sysdate) + 1 + ((1/24/60)*2)  from dual -- amanhã as 00:02:00
