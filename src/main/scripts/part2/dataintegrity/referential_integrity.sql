/*
RESTRICT - prevents deletion of a row from the parent table if the row has children.
CASCADE - determines that when a parent row is deleted, all of the lower-case rows are automatically deleted from the child table.
SET NULL - specifies that when the parent string is deleted, the external keys in all its child rows are automatically set to NULL.
SET DEFAULT - determines that when a parent string is deleted, the foreign keys in all its child rows are assigned a certain value, which is the default value for this column.
*/

/*001*/
CREATE TABLE ORDERS(
  /*.*/
  /*.*/
  /*.*/
  FOREIGN KEY PLACEDBY (CUST)
  REFERENCES CUSTOMERS (CUST_NUM)
  ON DELETE CASCADE,

  FOREIGN KEY TAKENBY (REP)
  REFERENCES SALESREPS (EMPL_NUM)
  ON DELETE SET NULL,

  FOREIGN KEY ISFOR (MRF, PRODUCT)
  REFERENCES PRODUCTS(MFR_ID, PRODUCT_ID)
  ON DELETE RESTRICT
);

/*002*/
ALTER TABLE OFFICES
    AND CONSTRAINT HASMGR
        FOREIGN KEY (MGR) REFERENCES SALESREPS(EMPL_NUM)
        ON UPDATE CASCADE
        ON DELETE SET NULL;