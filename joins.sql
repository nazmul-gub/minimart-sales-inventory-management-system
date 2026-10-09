
-- Show every order along with the customer's name.
select o.order_id, o.order_status, c.name
from orders o
left join customers c
on o.customer_id = c.customer_id


-- Show the customer name, city, order date, and total amount for every order.
select c.name, c.city, o.created_at, o.total_amount
from orders o
left join customers c
on o.customer_id = c.customer_id

-- Find all orders placed by customers from Dhaka.

select o.order_id, o.order_status, c.name
from orders o
left join customers c
on o.customer_id = c.customer_id
where c.city = 'Dhaka'

-- Show the names of customers who have placed at least one order.

select c.name, o.order_id, o.order_status
from customers c
inner join orders o
on o.customer_id = c.customer_id 

-- Show the names of customers who recieved at least one order.

select c.name, o.order_id, o.order_status
from customers c
inner join orders o
on o.customer_id = c.customer_id 
where o.order_status = 'delivered'

-- Show customers who have never placed an order.

select *
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null

-- Show each order with the product name and quantity purchased.

select oi.order_id, p.product_name, oi.quantity
from order_items oi
left join products p
on oi.product_id = p.product_id

-- customer name, product name, quantity, unit price for every order item.

select c.name, p.product_name, oi.quantity, oi.unit_price
from order_items oi
left join products p
on oi.product_id = p.product_id
left join orders o
on o.order_id = oi.order_id
left join customers c
on o.customer_id = c.customer_id

-- Calculate the total value of each order item.
select 
	oi.order_id,
	oi.quantity,
	oi.unit_price,
	(oi.quantity * oi.unit_price) as total_value
from order_items oi

-- Find all products that have been ordered at least once.

select distinct p.product_id, p.product_name
from products p
inner join order_items oi
on p.product_id = oi.product_id

-- Find products that have never been ordered.
select p.product_id, p.product_name
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.product_id is null

-- Show every order with its customer's name and total number of items purchased.
select o.order_id, c.name as customer_name, sum(oi.quantity) as total_items
from orders o
inner join customers c
on o.customer_id = c.customer_id
inner join order_items oi
on o.order_id = oi.order_id
group by c.name, o.order_id
order by c.name asc

-- Find how many different products each customer has purchased.

select c.customer_id , count(distinct oi.product_id) as different_products
from customers c
inner join orders o
	on o.customer_id = c.customer_id
inner join order_items oi
	on oi.order_id = o.order_id
group by c.customer_id

-- Find the total quantity of products purchased by each customer.

select c.customer_id, c.name, sum(oi.quantity) as total_quantity
from customers c
inner join orders o
	on c.customer_id = o.customer_id
inner join order_items oi
	on oi.order_id = o.order_id
group by 
	c.customer_id,
	c.name

-- Find the total amount spent by each customer.

select c.customer_id, c.name, sum((oi.unit_price * oi.quantity) - coalesce(oi.discount_amount, 0)) as total
from customers c
inner join orders o
	on c.customer_id = o.customer_id
inner join order_items oi
	on oi.order_id = o.order_id
group by 
	c.customer_id,
	c.name

-- Find the number of orders placed by each customer.

select 
    c.customer_id,
    c.name, 
    count(o.order_id) as number_of_orders
from customers c
left join orders o
    on c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.name;
