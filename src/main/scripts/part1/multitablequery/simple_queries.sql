/*001*/
SELECT ORDER_NUM, AMOUNT, COMPANY, CREDIT_LIMIT
FROM ORDERS, CUSTOMERS
WHERE CUST = CUST_NUM;

/*002*/
SELECT NAME, CITY, REGION
FROM SALESREPS, OFFICES
WHERE REP_OFFICE = OFFICE;

/*003*/
SELECT NAME, CITY, REGION
FROM SALESREPS
JOIN OFFICES
ON REP_OFFICE = OFFICE;

/*004*/
SELECT CITY, NAME, TITLE
FROM OFFICES, SALESREPS
WHERE MGR = EMPL_NUM
  AND ARGET > 600000.00;

/*005*/
SELECT CITY, NAME, TITLE
FROM OFFICES
JOIN SALEREPS
ON MGR = EMPL_NUM
WHERE TARGET > 600000.0;

/*006*/
SELECT ORDER_NUM, AMOUNT, DESCRIPTION
FROM ORDERS, PRODUCTS
WHERE MRF = MRF_ID
  AND PRODUCT = PRODUCT_ID;

/*007*/
SELECT ORDER_NUM, AMOUNT, DESCRIPTION
FROM ORDERS
JOIN PRODUCTS
ON MRF = MRF_ID
  AND PRODUCT = PRODUCT_ID;

/*008*/
SELECT ORDER_NUM, AMOUNT, DESCRIPTION
FROM ORDERS NATURAL JOIN PRODUCTS;

/*009*/
SELECT ORDER_NUM, AMOUNT, DESCRIPTION
FROM ORDERS JOIN PRODUCTS
USING (MRF, PRODUCT);

/*010*/
SELECT ORDER_NUM, AMOUNT, DESCRIPTION
FROM ORDERS JOIN PRODUCTS
ON ORDERS.MRF = PRODUCTS.MFR
  AND ORDERS.PRODUCT = PRODUCTS.PRODUCT;

/*011*/
SELECT ORDER_NUM, AMOUNT, COMPANY, NAME
FROM ORDERS, CUSTOMERS, SALESREPS
WHERE CUST = CUST_NUM
  AND REP = EMPL_NUM
  AND AMOUNT > 25000.00;

/*012*/
SELECT ORDER_NUM, AMOUNT, COMPANY, NAME
FROM ORDERS JOIN CUSTOMERS ON CUST = CUST_NUM
            JOIN SALESREPS ON REP = EMPL_NUM
WHERE AMOUNT > 25000.00;

/*013*/
SELECT ORDER_NUM, AMOUNT, COMPANY, NAME, CITY
FROM ORDERS, CUSTOMERS, SALESREPS, OFFICES
WHERE CUST_REP = EMPL_NUM
  AND REP_OFFICE = OFFICE
  AND REP_OFFICE = OFFICE
  AND AMOUNT > 25000.00;

/*014*/
SELECT *
FROM SALESREPS, OFFICES
WHERE REP_OFFICE = OFFICE;

/*015*/
SELECT SALESREPS.* , CITY, REGION
FROM SALESREPS, OFFICES
WHERE REP_OFFICE = OFFICE;

/*016*/
SELECT EMPS.NAME, MGRS.NAME
FROM EMPS, MGRS
WHERE EMPS.MANAGER = MGRS.EMPL_NUM;

/*017*/
SELECT SALESREPS.NAME, SALESREPS.QUOTA, MGRS.QUOTA
FROM SALESREPS, SALESREPS MGRS
WHERE SALESREPS.MANAGER = MGRS.EMPL_NUM
  AND SALESREPS.QUOTA > MGRS.QUOTA;

/*018*/
SELECT EMPS.NAME, EMP_OFFICE.CITY, MGRS.NAME, MGR_OFFICE.CITY
FROM SALESREPS EMPS, SALESREPS MGRS, OFFICES EMP_OFFICE, OFFICES MGR_OFFICE
WHERE EMPS.REP_OFFICE = EMP_OFFICE.OFFICE
  AND MGRS.REP_OFFICE = MGR_OFFICE.OFFICE
  AND EMPS.MANAGER = MGRS.EMPL_NUM
  AND EMPS.REP_OFFICE <> MGRS.REP_OFFICE;

/*019*/
SELECT SALESREPS.NAME, QUOTA, SAM.BIRTHDAYS.BIRTH_DATE
FROM SALESREPS, BIRTHDAYS
WHERE SALESREPS.NAME = SAM.BIRTHDAYS.NAME;

/*020*/
SELECT NAME, CITY
FROM SALESREPS
LEFT OUTER JOIN OFFICES
ON REP_OFFICE = OFFICE;

/*021*/
SELECT *
FROM GIRLS FULL OUTER JOIN BOYS
ON GIRLS.CITY = BOYS.CITY;

/*022*/
SELECT *
FROM GIRLS LEFT OUTER JOIN BOYS
ON GIRLS.CITY = BOYS.CITY;



