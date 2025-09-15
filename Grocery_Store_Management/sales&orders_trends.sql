-- 3. Sales and Order Trends 
-- How many orders have been placed in total? 
select count(ord_id) from order_details;

-- What is the average value per order? 
SELECT 
    AVG(OrderTotal) AS AverageOrderValue
FROM (
    SELECT 
        od.ord_id,
        SUM(od.total_price) AS OrderTotal
    FROM 
        order_details od
    GROUP BY 
        od.ord_id
) AS OrderSums;

-- On which dates were the most orders placed? 
select * from orders;
select order_date, count(ord_id) as cnt from orders
group by order_date
order by cnt desc;

-- What are the monthly trends in order volume and revenue? 
select * from orders;
select * from order_details;
-- [ converting orderdate varchar to date]
ALTER TABLE orders ADD new_date_column DATE;
UPDATE orders
SET new_date_column = STR_TO_DATE(order_date, '%m/%d/%Y');

SELECT 
    DATE_FORMAT(o.new_date_column, '%Y-%m') AS Month,
    COUNT(DISTINCT o.ord_id) AS OrderVolume,
    SUM(od.total_price) AS Revenue
FROM orders o
JOIN order_details od ON o.ord_id = od.ord_id
GROUP BY month -- DATE_FORMAT(o.new_date_column, '%Y-%m')
ORDER BY Month;

-- How do order patterns vary across weekdays and weekends? 
-- code to find weekday and weekend
SELECT 
    CASE 
        WHEN WEEKDAY(new_date_column) IN (5, 6) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type, count(ord_id) as totalorders
FROM orders
group by CASE 
        WHEN WEEKDAY(new_date_column) IN (5, 6) THEN 'Weekend'
        ELSE 'Weekday' END;

select * from orders;
select * from order_details;