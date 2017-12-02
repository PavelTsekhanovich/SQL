/*001*/
/*ASSERTION*/
CREATE ASSERTION target_valid
  CHECK ((OFFICES.TARGET <= SUM(SALESREPS.QUOTA))
    AND SALESREPS.REP_OFFICE = OFFICES.OFFICE));

/*002*/
CREATE ASSERTION credit_orders
  CHECK (CUSTOMERS.CREDIT_LIMIT >=
          SELECT SUM(ORDERS.AMOUNT)
          FROM ORDERS
          WHERE ORDERS.CUST = CUSTOMER.CUST_NUM);

/*
DEFERRABLE - Verifying the constraint specified as DEFERRBLE can be delayed until the end of the transaction.
NOT DEFERRABLE - Verifying a constraint defined as NOT DEFERRABLE can not be postponed.
INITIALLY IMMEDIATE - The restriction, defined as INITIALLY IMMEDIATE, begins its life as "urgent", i.e. It is checked immediately after executing each SQL statement.
INITIALLY DEFERRED - The restriction, defined as INITIALLY DEFERRED, begins its life as "deferred," i.e. It is checked only after the transaction is completed. Of course, this attribute can not be used in conjunction with the NOT DEFERRABLE attribute.
*/

/*003*/
CREATE ASSERTION quota_totals
  CHECK ((OFFICES.TARGET = SUM(SALESREPS.QUOTA))
    AND (SALESREPS.REP_OFFICE = OFFICES.OFFICE))
        DEFERRABLE INITIALLY IMMEDIATE;

/*004*/
/*Delayed check for the transaction time*/
SET CONSTRAINTS quota_totals DEFERRED;

INSERT INTO SALESREPS (EMPL_NUM, NAME, REP_OFFOCE, HIRE_DATE, QOUTA, SALES)
  VALUES (:num, :name, :office_num, :date, :amount, 0);

UPDATE OFFICES SET TARGET = TARGET + :amount
  WHERE (OFFICE = :office_num);

COMMIT;
