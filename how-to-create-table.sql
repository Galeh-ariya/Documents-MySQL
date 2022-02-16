-- biasa
CREATE TABLE coba (
	kode INT,
	nama VARCHAR(100),
	harga INT NOT NULL DEFAULT 0,
	jumlah INT
)ENGINE = InnoDB;

-- primary key and auto increment
CREATE TABLE admin(
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	PRIMARY KEY(id)
) ENGINE = InnoDB;

-- unique
CREATE TABLE customer (
	id VARCHAR(100) NOT NULL,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT email_unique UNIQUE(email),
    PRIMARY KEY(id)
)ENGINE = InnoDB;

-- relasi table
CREATE TABLE wallet (
	id INT NOT NULL AUTO_INCREMENT,
	id_customer INT NOT NULL,
	balance INT NOT NULL DEFAULT 0,
	PRIMARY KEY (id),
	UNIQUE KEY id_customer_unique (id_customer),
	FOREIGN KEY fk_wallet_cutomer (id_customer) REFERENCES customers (id)
)ENGINE = InnoDB;

-- waktu
CREATE TABLE sample_time (
	id INT NOT NULL AUTO_INCREMENT,
    sample_date DATE,
    sample_time TIME,
    sample_timestamp TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;


