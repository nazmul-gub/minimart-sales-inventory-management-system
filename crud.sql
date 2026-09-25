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











