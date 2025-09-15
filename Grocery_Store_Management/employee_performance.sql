-- 5. Employee Performance
-- Assess how employees are handling and influencing sales. 

-- 1. How many employees have processed orders? 
select * from employees;
select * from orders;

SELECT COUNT(DISTINCT emp_id) AS EmployeesProcessedOrders
FROM Orders;

-- 2. Which employees have handled the most orders? 
select e.emp_id as Employee, count(o.ord_id) Ordercount from employees e
inner join orders o on
o.emp_id = e.emp_id
group by e.emp_id
order by Ordercount desc;

-- 3. What is the total sales value processed by each employee? 
select e.emp_id as Employee, sum(od.total_price) as Totalsalesvalue from employees e
inner join orders o on
o.emp_id = e.emp_id
inner join order_details od on
od.ord_id = o.ord_id
group by e.emp_id
order by Totalsalesvalue desc;

select * from employees;
select * from order_details;
select * from orders;

-- 4. What is the average order value handled per employee?
select e.emp_id as Employee, avg(od.total_price) from employees e
inner join orders o on
o.emp_id = e.emp_id
inner join order_details od on
od.ord_id = o.ord_id
group by e.emp_id
order by avg(od.total_price) desc;