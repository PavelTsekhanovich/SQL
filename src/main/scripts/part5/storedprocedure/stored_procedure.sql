/*001*/
/*Without stored procedure*/
INSERT INTO CUSTOMERS (CUST_NUM, COMPANY, CUST_REP, CREDIT_LIMIT)
    VALUES (2317, 'XYZ Corporation', 103, 30000.00);

UPDATE SALESREPS
SET QUOTA = QUOTA + 50000.00
WHERE EMPL_NUM = 103;

UPDATE OFFICES
SET TARGET = TARGET + 50000.00
WHERE CITY = 'Chicago';

COMMIT;

/*002*/
/*Example stored procedure*/
CREATE PROCEDURE ADD_CUST(
  c_name IN VARCHAR2,
  c_num IN INTEGER ,
  cred_lim IN NUMBER,
  tgt_sls IN NUMBER,
  c_rep IN INTEGER,
  c_offc IN VARCHAR2)
AS
BEGIN
  INSERT INTO CUSTOMERS (suct_num, company, cust_rep, credit_limit)
  VALUE (c_num, c_name, c_rep, cred_lim);

  UPDATE SALESREPS
  SET QUOTA = QUOTA + tgt_sls
  WHERE empl_num = c_rep;

  UPDATE OFFICES
  SET TARGET = TARGET + tgt_sls
  WHERE CITY = c_offc;

  COMMIT;
END:

/*003*/
/*RUN*/
EXECUTE ADD_CUST('XYZ Corporation', 2317, 30000.00, 50000.00, 103, 'Chicago');

