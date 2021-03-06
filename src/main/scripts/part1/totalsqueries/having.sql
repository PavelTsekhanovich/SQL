/*001*/
SELECT REP, AVG(AMOUNT)
FROM ORDERS
GROUP BY REP
HAVING SUM(AMOUNT) > 30000.00;

/*002*/
SELECT CITY, SUM(QUOTA), SUM(SALESREPS.SALES)
FROM OFFICES, SALESREPS
WHERE OFFICE = REP_OFFICE
GROUP BY CITY
HAVING COUNT(*) >= 2;