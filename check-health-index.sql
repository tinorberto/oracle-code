SELECT ALIN.OWNER, ALIN.TABLE_NAME
  FROM ALL_INDEXES ALIN
 WHERE (    ALIN.INDEX_TYPE = 'DOMAIN'
        AND ALIN.ITYP_NAME = 'SPATIAL_INDEX'
        AND ALIN.TABLE_NAME NOT LIKE '%$%'
        AND ALIN.STATUS != 'VALID')
       OR (    ALIN.INDEX_TYPE = 'DOMAIN'
           AND ALIN.ITYP_NAME = 'SPATIAL_INDEX'
           AND ALIN.TABLE_NAME NOT LIKE '%$%'
           AND ALIN.DOMIDX_STATUS != 'VALID')
       OR (    ALIN.INDEX_TYPE = 'DOMAIN'
           AND ALIN.ITYP_NAME = 'SPATIAL_INDEX'
           AND ALIN.TABLE_NAME NOT LIKE '%$%'
           AND ALIN.DOMIDX_OPSTATUS != 'VALID');
