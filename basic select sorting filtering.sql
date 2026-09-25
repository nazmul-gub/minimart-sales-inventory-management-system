-- product search
select * from products

-- have a price greater than 10,000
-- have stock quantity greater than 20

select product_name, price, stock_quantity
from products
where price > 10000
	and stock_quantity > 20
order by price desc;


--The store manager wants a list of customers who are from Dhaka and whose name starts with A.
select * from customers

select name, email, city
from customers
where name ilike 'A%'
	and city = 'Dhaka'
order by name

-- Find customers whose email addresses belong to Gmail.
select name, email, city
from customers
where
	email like '%gmail%'
