-- 6. Order Details Deep Dive
-- Explore item-level sales patterns and pricing behavior. 

-- 1. What is the relationship between quantity ordered and total price? 
select quantity,avg(total_price) from order_details
group by quantity
order by quantity;

-- 2. What is the average quantity ordered per product? 
select * from order_details;
select prod_id,avg(quantity) from order_details
group by prod_id;

-- 3. How does the unit price vary across products and orders?
select ord_id,avg(each_price) from order_details
group by ord_id;

select prod_id,avg(each_price) from order_details
group by prod_id;