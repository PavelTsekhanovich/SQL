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

/*004*/
CREATE PROC chk_tok
  @c_num INTEGER
AS
  DECLARE @tot_ord money, @msg_text VARCHAR(30)
BEGIN
  SELECT @tot_ord = SUM (AMOUNT)
  FROM ORDERS
  WHERE CUST = @CONDITION_NUMBER
  IF tot_ord < 30000.00
    SELECT @msg_text = "Big value"
  ELSE
    SELECT @msg_text = "Small value"
END

/*005*/
CREATE PROCEDURE sort_orders()
DECLARE
  CURSOR o_cursor IS
  SELECT AMOUNT, COMPANY, NAME
  FROM ORDERS, CUSTOMERS, SALESREPS
  WHERE CUST = cust_num
  AND REP = empl_num;
  curs_row o_cursor%rowtype;
BEGIN
  FOR curs_row IN o_cursor
  LOOP
    IF (curs_row.amount < 1000.00)
    THEN INSERT INTO SMALLORDERS
         VALUES (cusr_row.name, curs_row.amount);
    ELSIF (curs_row.amount > 10000.00)
    THEN INSERT INTO BIGOREDERS
         VALUES (curs_row.company, curs_row.amount);
      END IF;
  END LOOP;
  COMMIT;
END;

/*006*/
CREATE FUNCTION get_tot_ords (c_num IN NUMBER)
       RETURNS NUMBER
AS
DECLARE tot_ord NUMBER(16,2);

BEGIN
  SELECT SUM(AMOUNT) INTO tot_ord
    FROM ORDERS
    WHERE CUST = c_num;
    RETURN tot_ord;
  EXCEPTION
    WHEN no_data_found
    THEN raise_application_error(-20123, 'Error number customer');
    WHEN others
    THEN raise_application_error(-20199, 'Unknown error');
END;
