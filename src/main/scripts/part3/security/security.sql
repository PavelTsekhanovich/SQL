/*001*/
GRANT SELECT, INSERT
  ON OFFICES
  TO PAVEL;

/*002*/
REVOKE SELECT, INSERT
  ON OFFICES
  FROM SAM;

/*003*/
GRANT SELECT, INSERT, DELETE, UPDATE
  ON ORDERS
  TO OPUSER;

/*004*/
GRANT ALL PRIVILEGES
  ON SALESREPS
  TO SAM;

/*005*/
GRANT UPDATE (COMPANY, CUST_REP)
  ON CUSTOMERS
  TO OPUSER;

/*006*/
CREATE VIEW LAREPS AS
  SELECT *
  FROM WESTREPS
  WHERE OFFICE = 21;

GRANT ALL PRIVILEGES
  ON LAREPS
  TO SUE;

/*007*/
GRANT SELECT
  ON WESTREPS
  TO LARRY
  WITH GRANT OPTION;

GRANT INSERT, DELETE, UPDATE
  ON WESTREPS
  TO LARRY;

/*008*/
GRANT SELECT, INSERT, UPDATE
  ON  OFFICES
  TO ARUSER, OPUSER;

REVOKE INSERT, UPDATE
  ON SALESREPS
  FROM OPUSER;

/*009*/
REVOKE ALL PRIVILEGES
  ON OFFICES
  FROM ARUSER;

/*010*/
REVOKE UPDATE, DELETE
  ON OFFICES
  FROM ARUSER, OPUSER;
