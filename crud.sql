-- insert

-- Add a new customer named Rahim Ahmed from Dhaka.
insert into customers (customer_id, name, email, address, city)
values('f2ae3de0-a08a-472e-a248-5b78757d6c2b', 'Rahim Ahmed', 'rahim@gmail.com', 'Jatrabari-1200', 'Dhaka')

select *
from customers
where name = 'Rahim Ahmed'

-- Add a new product called Wireless Mouse priced at ৳1,200 with 50 units in stock.
insert into products (product_name, price, stock_quantity, description)
values('Wireless mouse', 1200.00, 50, 'Wireless Mouse 2.4Ghz Bluetooth Rechargeable Mouse')

select *
from products
where price = 1200


-- Add a new product in the Electronics category with a price of ৳3,500 and stock of 25.
insert into products (category_id, product_name, price, stock_quantity, description)
values(1, 'Wireless mouse 2.0', 3500, 25, 'Wireless Mouse 2.8Ghz Bluetooth Rechargeable Mouse')

-- Add a new customer with a unique email address and city Chattogram.
insert into customers (customer_id, name, email, address, city)
values('fef3d4c0-8bac-4725-b021-5cbae03a0664', 'Jahanara Imam', 'jahanara@gmail.com', 'Mirpur-12', 'Chattogram')


--update
-- Increase the price of every product in the Electronics category by 10%.
select * from products
 
update products
set price = price * 1.1
where category_id = 1

-- updating a null category_id
update products
set category_id = 4
where product_id = 66

-- Reduce the price of every product costing more than ৳20,000 by 5%.
update products
set price = (price*0.95)
where price > 20000

-- Add 20 units to the stock of every product currently having less than 10 units.
update products
set stock_quantity = (stock_quantity + 20)
where stock_quantity < 20

-- Update a customer's city from Dhaka to Gazipur.
select * from customers

update customers
set city = 'Gazipur'
where customer_id = '8ba588af-1407-5a7d-ac67-9aac1e15e22c'

-- Increase the price of a specific product by ৳500.
update products
set price = (price+500)
where product_id = 11

-- Set the stock quantity of a specific product to 0 because it has been discontinued.
update products
set stock_quantity = 0
where product_id = 38


-- Delete a customer by their customer ID.
select * from customers

DELETE FROM orders
WHERE customer_id = 'a88c9b89-320b-5817-9ea3-2a2b2290cf85';

DELETE FROM customers --we have to delete customer's order first
WHERE customer_id = 'a88c9b89-320b-5817-9ea3-2a2b2290cf85';

-- Delete a product that has never been used in any order.
select * from products
select * from order_items

delete from products p
where not exists(
	select 1
	from order_items oi
	WHERE oi.product_id = p.product_id
)


--A supplier tells MiniMart that the price of all products in one category increased by 8%.
--Update the prices accordingly.
-- let, the category is electronics

select * from products
where category_id = 1

update products
set price = (price * 1.08)
where category_id = 1

-- MiniMart ran a clearance campaign.
-- Reduce prices by 15% for products with stock greater than 50 units.

update products
set price = (price * 0.85)
where stock_quantity > 50

-- Five new units of every product in the Gaming category arrived.
-- Increase their stock.

select * from products
where category_id = 5

update products
set stock_quantity = (stock_quantity + 5)
where category_id = 5
