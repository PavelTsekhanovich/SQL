/*001*/
/*use PostgreSQL*/
CREATE DOMAIN VALID_EMPLOYEE_ID INTEGER
  CHECK (VALUE BETWEEN 101 AND 199);

/*Example*/
CREATE TABLE SALESRREPS(
  EMPL_NUM VALID_EMPLOYEE_ID,
  AGE INTEGER
    CHECK (AGE >= 21),
  QUOTA DECIMAL(9,2)
    CHECK (QUOTA >= 0.0)
);

/*002*/
ALTER DOMAIN VALID_EMPLOYEE_ID SET NOT NULL;

/*003*/
ALTER DOMAIN VALID_EMPLOYEE_ID DROP CONSTRAINT VALID_EMPLOYEE_IDs;

/*004*/
DROP DOMAIN VALID_EMPLOYEE_ID;

