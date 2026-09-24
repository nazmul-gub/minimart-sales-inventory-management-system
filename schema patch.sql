-- MiniMart schema fixes

ALTER TABLE customers
    ALTER COLUMN email TYPE VARCHAR(120);

ALTER TABLE customers
    ALTER COLUMN address TYPE VARCHAR(120);

-- 2. products.category_id should point to categories.
ALTER TABLE products
    ADD CONSTRAINT fk_products_category
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id);

-- 3. orders must reference customers using UUID, because customers.customer_id is UUID!!
ALTER TABLE orders
    DROP COLUMN IF EXISTS user_id;

ALTER TABLE orders
    ADD COLUMN customer_id UUID NOT NULL
    REFERENCES customers(customer_id);

-- 4. The seed file explicitly inserts IDs into identity/bigserial columns.
--    Resetting the sequences afterward so future manual INSERTs continue correctly.
SELECT setval(
    pg_get_serial_sequence('categories', 'category_id'),
    COALESCE((SELECT MAX(category_id) FROM categories), 1),
    true
);

SELECT setval(
    pg_get_serial_sequence('products', 'product_id'),
    COALESCE((SELECT MAX(product_id) FROM products), 1),
    true
);

SELECT setval(
    pg_get_serial_sequence('orders', 'order_id'),
    COALESCE((SELECT MAX(order_id) FROM orders), 1),
    true
);

SELECT setval(
    pg_get_serial_sequence('order_items', 'id'),
    COALESCE((SELECT MAX(id) FROM order_items), 1),
    true
);
