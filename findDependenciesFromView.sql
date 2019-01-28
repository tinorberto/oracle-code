

SELECT REFERENCED_OWNER||'.'||REFERENCED_name 
FROM all_dependencies 
WHERE TYPE = 'VIEW'
    and owner = 'LANCAMENTO_PRELIMINAR'
    AND name = 'VW_LP_IPTU_ABRANGENTE'
    and referenced_owner not in ('SYS', 'MDSYS', 'PUBLIC' )
