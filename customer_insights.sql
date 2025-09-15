-- 1. Customer Insights 
USE GROCERYSTORE;
-- How many unique customers have placed orders? 
SELECT count(DISTINCT CUST_ID)  FROM ORDERS;

-- Which customers have placed the highest number of orders? 
SELECT COUNT(ORD_ID) AS CNT, CUST_ID FROM ORDERS
GROUP BY CUST_ID
ORDER BY CNT DESC
LIMIT 3;

-- What is the total and average purchase value per customer? 
SELECT O.CUST_ID,SUM(OD.TOTAL_PRICE) AS TP, 
	AVG(OD.TOTAL_PRICE) AS AVGP 
    FROM ORDER_DETAILS OD
INNER JOIN ORDERS O ON 
OD.ORD_ID = O.ORD_ID
GROUP BY O.CUST_ID
ORDER BY CUST_ID;

-- Who are the top 5 customers by total purchase amount? 
SELECT O.CUST_ID,SUM(OD.TOTAL_PRICE) AS TP FROM ORDER_DETAILS OD
INNER JOIN ORDERS O ON 
OD.ORD_ID = O.ORD_ID
GROUP BY O.CUST_ID
ORDER BY TP DESC
LIMIT 5;
