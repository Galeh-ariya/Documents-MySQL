CREATE TABLE wishlist (
	id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product
    FOREIGN KEY (id_product) REFERENCES products (id)
)ENGINE = InnoDB;

-- edit foreign key
ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id);

ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_costumer) REFERENCES customers (id);

-- edit table
ALTER TABLE wishlist
ADD COLUMN id_costumer INT;

UPDATE wishlist
SET id_costumer = 1 WHERE id = 2;

-- insert
INSERT INTO wishlist (id_product, description) VALUES ('P002', 'Makanan Kesukaan');

-- delete
DELETE FROM products WHERE id = 'P002';

-- query
SELECT * FROM wishlist;

-- util
DESC wishlist;


-- JOIN
SELECT * FROM wishlist
JOIN products ON (wishlist.id_product = products.id);

SELECT wishlist.id, products.id, products.name, wishlist.description
FROM wishlist JOIN products ON (wishlist.id_product = products.id);

-- menggunakan AS
SELECT W.id, P.id, P.name, W.description
FROM wishlist AS W JOIN products AS P ON (W.id_product = P.id);

-- join ke beberapa table
SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist 
JOIN products ON (products.id = wishlist.id_product)
JOIN customers ON (customers.id = wishlist.id_costumer);





