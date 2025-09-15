-- 4. Supplier Contribution
-- How many suppliers are there in the database?
select count(*) from supplier;

-- Which supplier provides the most products? 
select * from products;

select sup_id as Supplier, count(prod_id) as Totalproducts from products p
group by sup_id;

-- What is the average price of products from each supplier?
select * from products;
select sup_id, avg(price) as Avgprice from products
group by sup_id;



-- Which supplier contribute the most to total product sales (by revenue)?
select p.sup_id as Supplier, sum(od.total_price) as Revenue from products p
inner join order_details od on
p.prod_id = od.prod_id
group by p.sup_id
order by revenue desc
limit 1;