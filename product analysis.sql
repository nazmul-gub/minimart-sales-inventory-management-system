-- Showing the product name, price, and stock quantity for every product.
select product_name, price, stock_quantity
from products

-- Finding products that are currently out of stock.
select product_name, price, stock_quantity
from products
where stock_quantity = 0 -- no stock out case

-- Displaying all products from the most expensive to the cheapest.
select product_name, price, stock_quantity
from products
order by price desc

--the 5 cheapest products
select product_name, price, stock_quantity
from products
order by price asc
limit 5

-- Finding products that are either:
-- cheaper than ৳1,000, or
-- have less than 5 units in stock.
select product_id, product_name, price, stock_quantity
from products
where price < 1000
	or stock_quantity < 5

-- products with price > 10,000 and stock > 20.
select product_id, product_name, price, stock_quantity
from products
where price > 10000
	and stock_quantity > 20

-- products between ৳2,000 and ৳15,000 that are not out of stock.
select product_id, product_name, price, stock_quantity
from products
where (price between 2000 and 15000)
	and stock_quantity > 0

-- Sort products by stock quantity from highest to lowest.
select product_id, product_name, price, stock_quantity
from products
order by stock_quantity desc
