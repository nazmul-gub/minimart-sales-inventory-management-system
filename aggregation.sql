 -- Find the total number of customers.
select count(*) as total_customers
from customers

-- Find the total number of products.
select count(*) as total_products
from products

-- Find the average product price.

select round(avg(price), 2) as avg_product_price
from products

-- Find the highest product price.
select max(price) as highest_price
from products

-- Find the lowest product price.
select min(price) as lowest_price
from products

-- Find the total amount of inventory value.
select sum(price) as inventory_value
from products

select * from products
-- Find the total number of items currently in stock.

select sum(stock_quantity) as items_count_in_stock
from products

-- Find the number of products that are out of stock.

select sum(stock_quantity) as items_count_out_of_stock
from products
where stock_quantity = 0


-- Count how many customers live in each city.

select city, count(customer_id)
from customers
group by city
order by count(customer_id) desc

-- Find the average product price for each category.

select categories, round(avg(price), 2) as average_product_price
from products
group by categories

-- Find the maximum product price in each category.

select categories, round(max(price), 2)
from products
group by categories


-- Find the minimum product price in each category.
select categories, round(min(price), 2)
from products
group by categories

-- Find the total stock quantity for each category.

select categories, sum(stock_quantity) as total_stock_quantity
from products
group by categories

-- Find the total inventory value for each category.

select categories, sum(price * stock_quantity)
from products
group by categories

-- Count how many products belong to each category.

select categories, count(product_id)
from products
group by categories

-- Show only categories having more than 5 products.

select categories, count(product_id)
from products
group by categories
having count(product_id) > 5

-- Show categories whose average product price is greater than ৳5,000.

select categories, round(avg(price), 2)
from products
group by categories
having avg(price) > 5000

-- Find the city with the highest number of customers.

select city, count(customer_id) as number_of_customers
from customers
group by city
order by count(customer_id) desc
limit 1

-- Which category has the highest total inventory value?

select categories, sum(price * stock_quantity)
from products
group by categories
order by sum(price * stock_quantity) desc
limit 1

-- Which category has the lowest average price?

select categories, round(avg(price))
from products
group by categories
order by avg(price) asc
limit 1

-- Which category contains the most products?

select categories, count(product_id) as product_count
from products
group by categories
order by product_count desc
limit 1

-- Which category currently has the highest total stock?

select categories, sum(stock_quantity) as total_stock
from products
group by categories
order by sum(stock_quantity) desc
limit 1

-- Calculate the percentage of products that are out of stock.

select 
    round(
        (count(case when stock_quantity = 0 then 1 end) * 100.0) / count(*), 
        2
    ) as percentage_out_of_stock
from 
    products;