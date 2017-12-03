/*001*/
/*SQL server*/
CREATE TRIGGER NEWORDER
  ON ORDERS
  FOR INSERT
  AS UPDATE SALESREPS
     SET SALES = SALES + INSERTED.AMOUNT
     FROM SALESREPS, INSERTED
     WHERE SALESREPS.EMPL_NUM = INSERTED.REP
     UPDATE PRODUCTS
     SET QTY_ON_HAND = QTY_ON_HAND - INSERTED.QTY
     FROM PRODUCTS, INSERTED
     WHERE PRODUCTS.MFR_ID = INSERTED.QTY
     AND PRODUCT.PRODUCT_ID = INSERTED.PRODUCT;