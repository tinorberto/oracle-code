--  Checar Lock em objetos
select
  l.SID,
  l.TYPE,
  o1.OWNER, o1.OBJECT_NAME, o1.OBJECT_TYPE,
  o2.OWNER, o2.OBJECT_NAME, o2.OBJECT_TYPE
from
  v$lock l
  left outer join dba_objects o1
  on l.ID1 = o1.OBJECT_ID
  left outer join dba_objects o2
  on l.ID2 = o2.OBJECT_ID 
where o1.owner = 'CP';


-- Sessions locks
select 
   blocking_session, 
   sid, 
   serial#, 
   wait_class,
   seconds_in_wait
from 
   v$session
where 
   blocking_session is not NULL
order by 
   blocking_session;
   
   
-- Sessions LOcks
SELECT vh.sid locking_sid,
 vs.status status,
 vs.program program_holding,
 vw.sid waiter_sid,
 vsw.program program_waiting
FROM v$lock vh,
 v$lock vw,
 v$session vs,
 v$session vsw
WHERE     (vh.id1, vh.id2) IN (SELECT id1, id2
 FROM v$lock
 WHERE request = 0
 INTERSECT
 SELECT id1, id2
 FROM v$lock
 WHERE lmode = 0)
 AND vh.id1 = vw.id1
 AND vh.id2 = vw.id2
 AND vh.request = 0
 AND vw.lmode = 0
 AND vh.sid = vs.sid
 AND vw.sid = vsw.sid;   