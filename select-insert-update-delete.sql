-- query
SELECT * FROM products;
SELECT id, name, category FROM products;
SELECT price FROM products WHERE id = 10;

-- insert
INSERT INTO products (id, name, category)
VALUES (1, 'Tahu Bulat', 'Makanan Ringan');

-- insert beberapa data
INSERT INTO products (id, name, category)
VALUES  (1, 'Tahu Bulat', 'Makanan Ringan'),
        (2, 'Tahu Sumedang', 'Camilan');

-- update
UPDATE products
SET name = 'Cimori'
WHERE id = 3;

-- DELETE
DELETE FROM products
WHERE id = 6;