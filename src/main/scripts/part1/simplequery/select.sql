/*001*/
SELECT CITY, TARGET, SALES
FROM OFFICES;

/*002*/
SELECT CITY, TARGET, SALES
FROM OFFICES
WHERE REGION = 'Eastern';

/*003*/
SELECT CITY, TARGET, SALES
FROM OFFICES
WHERE REGION = 'Eastern'
AND SALEC > TARGET
ORDER BY CITY;

/*004*/
SELECT NAME, REP_OFFICE, HIRE_DATE
FROM SALESREPS;

/*005*/
SELECT NAME, QUOTA, SALES
FROM SALESREPS
WHERE EMPL_NUM = 107;

/*006*/
SELECT AVG(SALES)
FROM SALESREPS;

/*007*/
SELECT NAME, HIRE_DATE
FROM SALESREPS
WHERE SALES > 500000.00;

/*008*/
SELECT CITY, REGION, (SALES - TARGET)
FROM OFFICES;

/*009*/
SELECT MRF_ID, PRODUCT_ID, DESCRIPTION, (QTY_ON_HAND * PRICE)
FROM PRODUCTS;

/*010*/
SELECT NAME, QUOTA, (QUOTA + (.03 * SALES))
FROM SALESREPS;

/*011*/
SELECT CITY, MONTH(HIRE_DATE), YEAR(HIRE_DATE)
FROM SALESREPS;

/*012*/
SELECT CITY , 'hassalesof'
FROM OFFICES ;

/*013*/
SELECT *
FROM OFFICES;

/*014*/
SELECT DISTINCT MGR
FROM OFFICES;
