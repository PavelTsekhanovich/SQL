/*001*/
CREATE UNIQUE INDEX OFC_MGR_IDX
  ON OFFICES (MGR);

/*002*/
CREATE UNIQUE INDEX ORD_PROD_IDX
  ON OREDERS (MFR, PRODUCT);

/*003*/
DROP INDEX ORD_PROD_IDX;