create table customers(
	customer_id uuid primary key unique,
	name varchar(50) not null,
	email varchar(20) not null unique,
	address varchar(20) not null,
	city varchar(20) not null,
	created_at date default CURRENT_DATE
);


create table categories (
    category_id bigserial PRIMARY KEY,
    category_name varchar(20) NOT NULL,
    description text,
    created_at date DEFAULT CURRENT_DATE
);

create table products(
	product_id bigint generated always as identity primary key,
	category_id bigint,
	product_name varchar(20) not null,
	price numeric(10,2) not null default 0.00,
	stock_quantity int not null default 0,
	description text,
	is_available boolean default true not null,
	created_at date default current_date
)

create table orders(
	order_id BIGINT GENERATED ALWAYS AS IDENTITY primary key,
    user_id BIGINT NOT NULL,
	order_status VARCHAR(20) DEFAULT 'pending' NOT NULL,
	total_amount NUMERIC(12, 2) NOT NULL DEFAULT 0.00,
	shipping_address TEXT,
	created_at date default current_date
);

--for exact purchase time
ALTER TABLE orders 
  ALTER COLUMN created_at TYPE TIMESTAMP WITH TIME ZONE 
    USING created_at::TIMESTAMP WITH TIME ZONE,
  ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE order_items (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id BIGINT REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10, 2) NOT NULL,
    discount_amount NUMERIC(10, 2) DEFAULT 0.00,
    fulfillment_status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

