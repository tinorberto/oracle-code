--- Create user and roles 
CREATE USER CLEBER
  IDENTIFIED BY cleber0956
  DEFAULT TABLESPACE SIGUR
  TEMPORARY TABLESPACE temp;
  
--- grant   
grant select_lp_pl_bh to CLEBER;
grant select_mub to CLEBER;
grant select_sistema_viario to CLEBER;
grant suti_urbel_e to CLEBER;
grant select_urber_v to CLEBER;
create role select_urber_v;


--- creater a role
GRANT select ON urbeL.conjunto_habitacional TO select_urber_v;

GRANT select ON urbeL.conj_habit_lote_cp TO select_urber_v;

GRANT select ON urbeL.hist_vila_favela TO select_urber_v;

GRANT select ON urbeL.tipo_localidade TO select_urber_v;

GRANT select ON urbeL.VILA_FAVELA TO select_urber_v;

