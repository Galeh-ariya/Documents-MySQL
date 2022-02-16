-- relasi one to one
CREATE TABLE wallet (
	id INT NOT NULL AUTO_INCREMENT,
	id_customer INT NOT NULL,
	balance INT NOT NULL DEFAULT 0,
	PRIMARY KEY (id),
	UNIQUE KEY id_customer_unique (id_customer),
	FOREIGN KEY fk_wallet_cutomer (id_customer) REFERENCES customers (id)
)ENGINE = InnoDB;

INSERT INTO wallet (id_customer) VALUES (1), (3);

SELECT * FROM wallet;

SELECT customers.email, wallet.balance
FROM wallet JOIN customers ON (wallet.id_customer = customers.id);

-- note
-- cara menerapkan relasi one to one kita bisa menambahkan unique key pada 
-- column yang di jadikan sebagai foreign key
-- sebenarnya ada 2 cara kita bisa membuat agar id di table ini mempunyai id yang sama
-- namun itu akan sangat merepotkan



-- one to many
CREATE TABLE categories (
	id VARCHAR (10) NOT NULL,
    name VARCHAR (100) NOT NULL,
    PRIMARY KEY (id)
)ENGINE = innoDB;

-- edit table products 
ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (id_category) REFERENCES categories (id);

-- insert ke table categories
INSERT INTO categories (id, name) 
VALUES ('C001', 'Makanan'),
('C002', 'Minuman'),
('C003', 'Lain-lain'); 

-- update products
UPDATE products
SET id_category = 'C001'
WHERE id IN ('P0010', 'P002', 'P003', 'P004', 'P005', 'P006', 'P007', 'P009');

UPDATE products
SET id_category = 'C002'
WHERE id IN ('P013', 'P015', 'P016');

UPDATE products
SET id_category = 'C003'
WHERE id IN ('P014');

-- join
SELECT products.id, products.name, products.price, categories.name
FROM products JOIN categories ON (products.id_category = categories.id);

-- note
-- Untuk membuat relasi antar table one to many
-- caranya sama seperti membuat table one to oneyang membedakan adalah
-- kita tidak perlu meng set unique pada table yang dijadikan foreign key




-- many to many

-- table penjualan
CREATE TABLE orders(
	id INT NOT NULL AUTO_INCREMENT,
	total INT NOT NULL,
	order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
)ENGINE = InnoDB;

-- table relasi
CREATE TABLE orders_detail (
	id_product VARCHAR(10) NOT NULL,
	id_order INT NOT NULL,
	price INT NOT NULL,
	quantity INT NOT NULL,
	PRIMARY KEY (id_product, id_order)
)ENGINE = InnoDB;

-- kita terapkan bahwa 1 product bisa memiliki banyak order detail
ALTER TABLE orders_detail
ADD CONSTRAINT fk_order_detail_products
FOREIGN KEY (id_product) REFERENCES products(id);

-- kita terapkan bahwa 1 order bisa memiliki banyak order detail
ALTER TABLE orders_detail
ADD CONSTRAINT fk_order_detail_orders
FOREIGN KEY (id_order) REFERENCES orders(id);

INSERT INTO orders (total)
VALUES (50000);

INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P002', 1, 25000, 1),
		('P003', 1, 25000, 1);

INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P004', 2, 55000, 1),
		('P005', 3, 20000, 1);

INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES ('P007', 3, 55000, 1),
		('P009', 2, 20000, 1);


-- select join
SELECT * FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);

SELECT orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price
FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);

-- note
-- untuk membuat relasi many to many kita bisa membuat table penengah
-- contohnya ketika kita ingin merelasikan many to many antara table product dan juga order
-- maka kita harus membuat table lagi sebagai relasinya yang bisa kita sebut table relasi
-- sebenarnya relasi many to many adalah relasi gabungan antara one to many dan one to many
-- gambarannya dari table products kita berelasi one to many denngan table relasi
-- kemudian table order juga berelasi ke table relasi secara one to many