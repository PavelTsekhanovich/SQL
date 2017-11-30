/*001*/
SELECT REP, AVG(AMOUNT)
FROM ORDERS
GROUP BY REP;

/*002*/
SELECT REP_OFFICE, MIN(QUOTA), MAX(QUOTA)
FROM SALESREPS
GROUP BY REP_OFFICE;

/*003*/
SELECT REP_OFFICE, COUNT(*)
FROM SALESREPS
GROUP BY REP_OFFICE;

/*004*/
SELECT REP, CUST, SUM(AMOUNT)
FROM OREDRS
GROUP BY REP, CUST;

/*005*/
SELECT REP, CUST, SUM(AMOUNT)
FROM ORDERS
GROUP BY REP, CUST WITH ROLLUP;

/*006*/
/*SELECT REP, CUST, SUM(AMOUNT)
FROM ORDERS
GROUP BY REP, CUST WITH CUBE;*/ 

/*007*/
SELECT CUST, REP, SUM(AMOUNT)
FROM ORDERS
GROUP BY CUST, REP
ORDER BY CUST, REP;

/*008*/
SELECT HAIR, EYES, COUNT(*)
FROM PEOPLE
GROUP BY HAIR, EYES;