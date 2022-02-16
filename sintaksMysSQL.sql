-- Membuat database
CREATE DATABASE marketplace;
-- NOTE
-- CREATE DATABASE nama_database;

-- Menampilkan semua database
SHOW DATABASES;


-- ###

-- Menghapus Database
DROP DATABASE marketplace;
-- NOTE
-- DROP DATABASE nama_database;


-- ###

-- Masuk ke dalam database
USE marketplace;
-- NOTE
-- USE nama_database;


-- ###

-- Membuat Table
CREATE TABLE products (
    id INT (10),
    name VARCHAR (100), 
    email VARCHAR (200),
    price INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0
) ENGINE = InnoDB;
-- NOTE
-- CREATE TABLE nama_table (...) ENGINE = InnoDB;



-- ###

-- Menampilkan semua table
SHOW TABLES;
-- NOTE
-- Perintah ini bisa digunakan setelah kita masuk
-- kedalam database menggunkana perintah use



-- ###

-- Menampilkan struktur data table
DESCRIBE products;
-- NOTE
-- DESCRIBE nama_table;
-- Penulisan keyword DESCRIBE bisa kita singkat menjadi DESC
-- DESC nama_table;



-- ###

-- Menampilkan struktur pembuatan table
SHOW CREATE TABLE products;
-- NOTE
-- SHOW CREATE TABLE nama_table;
-- Dengan mengetikkan perintah ini kita bisa mengetahui
-- struktur dari pembuatan table lebih detail seperti 
-- engine, constraint, foreign key dan lain-lain



-- ###

-- Mengapus Table
DROP TABLE products;
-- NOTE
-- DROP TABLE nama_table;



-- ###

-- Menghapus dan Membuat Ulang Table
TRUNCATE products;
-- NOTE
-- TRUNCATE nama_table;
-- Kita perlu berhati-hati ketika mengetikkan perintah ini
-- karena ini akan membuat data di table akan terhapus semua
-- cara kerja dari perintah ini adalah
-- Menghapus table, setelah di hapus akan secara otomatis dibuat lagi



-- ###

-- Edit Table
ALTER TABLE products
ADD COLUMN description TEXT,
DROP COLUMN description,
RENAME COLUMN price to harga,
MODIFY harga VARCHAR (100) after quantity;
-- NOTE
-- ALTER TABLE nama_table
-- ADD COLUMN nama_kolom tipe data //Menambah Kolom
-- DROP nama_kolom // Menghapus kolom
-- RENAME COLUMN nama_kolom to nama_kolom keinginan //mengganti nama kolom
-- MODIFY nama_kolom tipe data after* quantity // Update atau edit kolom
-- *keyword ini akan berfungsi sebagai jika kita kita ingin memindahkan posisi kolom
-- sebelum meng ADD,DROP, RENAME, MODIFY kita wajib menuliskan terlebih dahulu ALTER TABLE nama_table



-- ###

-- Tipe Bilangan Number

-- Bilangan Bulat
TINYINT;
SMALLINT;
MEDIUMINT;
INT;
BIGINT;
-- NOTE
-- TINYINT      1 Bytes
-- SMALLINT     2 Bytes
-- MEDIUMINT    3 Bytes
-- INT          4 Bytes
-- BIGINT       8 Bytes

-- Floating Point
FLOAT;
DOUBLE;
-- NOTE
-- FLOAT    4 Bytes
-- DOUBLE   8 Bytes

-- Decimal
DECIMAL(5, 2);
-- NOTE
-- DECIMAL(Banyak angka, berapa angka setelah koma)
-- Jika DECIMAL(5, 2), Sama artinya dengan 999.99



-- ###

-- Tipe data String
CHAR(10);
VARCHAR(10);
-- NOTE
-- Char dan juga varchar sebenarnya sama
-- Yang membedakan adalah ketika kita isi datanya dengan 'galeh' maka kita lihat perbedaannya
-- CHAR(10)     = 'galeh     '
-- VARCHAR(10)  = 'galeh'

-- Text
TINYTEXT;
TEXT;
MEDIUMTEXT;
LONGTEXT;
-- NOTE
-- TINYTEXT     256 bytes
-- TEXT         64 kb
-- MEDIUMTEXT   16 MB
-- LONGTEXT     4 GB



-- ###

-- Tipe Data Enum
ENUM;
-- NOTE
-- Tipe data enum ini adalah tipe data String yang terbatas pilihannya
-- Contohnya adalah jenis kelamin



-- ###

-- Tipe Data Waktu
DATE;
DATETIME;
TIMESTAMP;
TIME;
YEAR;
-- NOTE
-- DATE, Format         : YYYY-MM-DD
-- DATETIME, Format     : YYYY-MM-DD HH:MM:SS
-- TIMESTAMP, Format    : YYYY-MM-DD HH:MM:SS *for inforation created, dll
-- TIME, Format         : HH:MM:SS
-- YEAR, Format         : YYYY



-- ###

-- Tipe Data Boolean
TRUE
FALSE
-- NOTE
-- TRUE = BENAR
-- FALSE = SALAH



-- ###

-- Query
SELECT * FROM products;
-- NOTE 
-- SELECT * FROM nama_table;
-- * artinya kita select semua



-- ###

-- Insert
INSERT INTO products (id, name)
VALUES (1, 'Tahu Bulat');
-- NOTE
-- INSER INTO nama_table (nama_kolom, nama_kolom)
-- VALUES (nilai yang mau diisi sesuai tipe data);



-- ###

-- Primary Key
PRIMARY KEY (id);
-- PRIMARY KEY (nama kolom yang akan di jadikan primary key);
-- Primary key ini untuk menjaga agar data tidak duplikat dan data di dalamnya harus unique
-- gunanya dari primary key ini dalah sebagai identitas dari table yang kita buat



-- ###

-- Where Clause
UPDATE products
SET name = 'Cimori'
WHERE id = 3;
-- NOTE
-- UPDATE nama_table
-- SET nama_kolom = value
-- WHERE nama_kolom = value nama kolom;



-- ###

-- Hapus data
DELETE FROM products
WHERE id = 3;
-- NOTE
-- DELETE FROM nama_table
-- WHERE nama_kolom = value_kolom_yang_mau_dihapus



-- ###

-- Alias
SELECT p.id AS 'kode' 
FROM products AS 'p';
-- NOTE
-- SELECT kolom_id FROM nama_table
-- Alias ini adalah nama samaran
-- Ketika kita select id tanpa menggunakan AS maka yang terjadi sebenarnya
-- adalan products.id
-- Artunta Defaultnya adalah nama_table.kolom



-- ###

-- Operator

-- Operator Perbandingan
-- =            sama dengan
-- != atau <>   tidak sama dengan
-- >            lebih dari
-- <            kurang dari
-- >=           lebih dari sama dengan
-- <=           kurang dari sama dengan

-- Operator AND OR
AND
OR
-- NOTE
-- AND artinya DAN di seperti bahasa pemrograman pada umumnya
-- OR artinya ATAU di seperti bahasa pemrograman pada umumnya

-- LIKE Operator
LIKE 'a%';
LIKE '%a';
LIKE '%a%';
NOT LIKE;

SELECT * FROM products WHERE LIKE '%mie%';
-- NOTE
-- 'a%' artinya mencari kata yang awalnyannya huruf a
-- '%a' artinya mencari kata yang akhirannya huruf a
-- '%a%' artinya mencari kata yang tengah-tengahnya huruf a
-- NOT LIKE artinya yang tidak seperti value

-- SELECT * FROM nama_table WHERE LIKE '%mie%';

-- Null Operator
IS NULL;
IS NOT NULL;
-- NOTE
-- IS NULL untuk mencari data yang null
-- IS NOT NULL untuk mencari data yang tidak null
-- CONTOH
-- SELECT * FROM products WHERE category IS NULL
-- SELECT * FROM products WHERE category IS NOT NULL

-- BETWEEN Operator
BETWEEN;
NOT BETWEEN;
-- NOTE
-- Operator ini digunakan untuk mencari data yang >= dan <= secara sekaligus
-- Daripada kita menggunakan operator AND dan OR akan lebih mudah ketika kita menggunakan Operator Between ini
-- CONTOH
-- SELECT * FROM products WHERE price BETWEEN 5000 AND 10000;

-- IN Operator
IN;
-- NOTE
-- Operator IN ini digunakan untuk kita melakukan pencarian data lebih dari satu
-- sebenarnya ini bisa kita lakukan dengan menggunakan operator OR namun akan ribet dan panjang
-- CONTOH
-- SELECT * FROM products WHERE category IN ('Makanan', 'Minuman');
-- Ini artinya kita akan mencari prodact yang kategorinya Makanan atau minuman



-- ###

-- Oerder By Clause
ORDER BY price ASC;
ORDER BY id DESC;
-- NOTE
-- ORDER BY nama_kolom ASC
-- Secara default ORDER BY ini akan diurutkan secara ASC
-- Jadi jikalau kita tidak menuliskan ASC makan akan secara otomatis diurutkan secara ASC
-- ASC atau ASCENDING adalah pengurutan data dari yang terkecil ke besar
-- DESC atau DESCENDING adalah pengurutan data dari mulai besar ke kecil
-- CONTOH
-- SELECT * FROM products ORDER BY id DESC;



-- ###

-- LIMIT CLAUSE
SELECT * FROM products LIMIT 3;
SELECT * FROM products LIMIT 0.3;
SELECT * FROM products LIMIT 3.3;
-- NOTE
-- LIMIT 3 artinya kita akan hanya membatasi 3 data yang ingin kita tampilkan
-- Sebenarnya ketika kita hanya menuliskan LIMIT 3 yang di belakang layar adalah 0.3
-- 0 disini artinya data yanng di skip
-- Jika kita ingin skip data maka kita bisa menuliskan LIMIT 3.3
-- artinya data yang kita skip 3 data dan yang kita ingin tampilkan adalah 3 data setelah data yang di skip



-- ###

-- DISTINC
SELECT DISTINC category FROM products;
-- NOTE
-- DISTINC ini berguna untuk menghilangkan data yang dulplikat ketika query
-- Jadi misal saya punya dua data dengan kategori Makanan maka yang akan tampil hanya satu
-- Perlu diingat jika kita melakukan query distinc terhadap data yang tidak bisa kita disctinc
-- contohnya id yang primay atau auto increment maka secara otomatis tidak akan efeknya



-- ###

-- AUTO INCREMENT
AUTO_INCREMENT;
-- NOTE
-- auto increment ini untuk melakukan penambahan +1 secara otomatis
-- jadi jika kita punya data int kemudian kita set auto increment maka kita tidak perlu lagi 
-- memasukkan data lagi, karena secara otomatis akan diisi oleh MySQL nya senddiri
-- auto increment ini hanya bisa di primary key



-- ###

-- GROUP BY
SELECT * FROM count(id) AS 'Total Product', category FROM products GROUP BY category;
-- NOTE
-- GROP BY untuk nge group data



-- ###

-- CONSTRAINT

-- UNIQUE CONSTRAINT
UNIQUE KEY email_unique(email);
-- NOTE
-- Ini bisa kita tambahkan saat pembuatan table
-- UNIQUE KEY nama_constarin(kolom yang hendak di jadikan sebagai unique);

-- CHECK CONSTRAINT
CONSTRAINT price_check CHECK (price >= 10000);
-- NOTE
-- Pembuatan Contraint ini bisa kita buat saat membuat table 
-- atau ketika table nya sudah jadi kita bisa menggunakan alter table
-- CONSTRAINT nama_constraint CHECK (kondisi);
 


-- ###

-- Full Text Search
FULLTEXT product_search (name, description);
-- NOTE 
-- Kiata bisa menambahkan pencarian text menggunakan firut full text search ini
-- FULLTEXT nama_full_text (kolom yang mau dilakukan pencarian);
-- Perlu diingat fitur fulltext search ini tidak secanggih fitur dari database yang memang
-- untuk khusus fulltext search seperti elastis search
-- kita bisa mengetikkan perintah tersebut saat pembuatan table atau create table
-- Jika kita sudah terlanjur membuat tablenya kita bisa menggunakan alter table contoh:
-- ALTER TABLE products
-- ADD FULLTEXT product_search (name, description);
-- jika kita ingin menghapu kita bisa menggunakan keyword:
-- DROP INDEX nama_fulltext



-- ###

-- Foreign Key
CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_products) REFERENCES products(id);
-- NOTE
-- CONSTRAINT nama_constraint
-- FOREIGN KEY (kolom yang dijadikan foreign key) REFERENCES table_lain(unique yang ada di table lain);
-- Foreign key adalah Kolom referensi
-- Saat membuat suatu foreign key untuk relasi antar table, pastika tipe data dari foreign key di table wishlist contohnya
-- sama dengan table referensinya misalnya id dari table products
-- pembuatan foreign key ini dilakukan saat pembuatan table
-- jika table sudah terlanjur dibuat maka, kita bisa menggunakan ALTER TABLE untuk menambahkan foreign key ke table



-- ###

-- Join
SELECT * FROM wishlist JOIN products ON (wishlist.id_product = products.id);
-- NOTE
-- SELECT * FROM nama_table JOIN nama_table_reference ON (nama_table.foreignkey = nama_table.unique);
-- Semakin banyak kita melakukan join, maka akan memperlambat pula performa dari database kita



-- ###

-- Set Operator
UNION;
UNION ALL;
-- NOTE
-- Operator set ini adalah menggabungkan hasil dari dua query

-- UNION
SELECT DISTINC email FROM products
UNION
SELECT DISTINC email FROM costumers;
-- NOTE
-- Jika kita menggunakan union maka data yang sama di antara 2 table akan di jadikan satu
-- dalam artian data yang tampil hanyalah satu data

-- UNION ALL
SELECT DISTINC email FROM products
UNION ALL
SELECT DISTINC email FROM costumers;
-- NOTE
-- Jika kita menggunakan union all ini maka data yang duplikat akan tetap ditampilkan
-- pada saat querynya



-- ###

-- Transaction
-- Perintah di Transcation
-- STRAT TRANSCATION    *Memulai proses transaction
-- COMMIT               *Menyimpan permanen seluruh proses transaksi
-- ROLLBACK             *Membatalkan secara permanen seluruh proses transaksi

START TRANSCATION;
INSERT INTO products (name) VALUES ('Galeh');
DELETE FROM product WHERE id = 1;
COMMIT;
-- NOTE 
-- Ketika kita ingin menjalan suatu transaction maka kita harus memulai dengan START TRANSACTION kemudian kita execute
-- Setelah kita START TRANSCATION baru kita bisa menambahkan beberapa perintah sql kemudian execute/ekeskusi
-- Jikalau sudah tidak ada yang gagal atau salah satu peroses gagal maka kita bisa melakukan COMMIT;

START TRANSCATION;
INSERT INTO products (name) VALUES ('Galeh');
DELETE FROM product WHERE id = 1;
ROLLBACK;
-- NOTE
-- Jika ternyata ada proses di tengah jalan maka kita bisa membatalkan perintah sebelumnya dengan menggunakan ROLLBACK

-- NOTE Transaction
-- Transaction ini berguna untuk ketika kita ingin mengirim perintah sql yang langsung banyak atau dalam satu kesatuan
-- misal nya kita ingin add, update, select data maka perintah-perintah sql tersebut akan menjadi satu kesatuan
-- Dalam arti data tersebut akan benar benar di eksekusi atau di simpan ke dalam datanbase sampai kita melakukan COMMIT
-- Namun ketika saat tengah jalan ada salah satu proses yang gagal maka perintah-perintah sebelumnnya akan di batalkan
-- Menggunakan perintah ROLLBACK
-- Transaction ini hanya berlaku untuk DML (Data Manipulation Language) seperti Select, Insert, Update, dan Delete
-- Itu berati Transaction ini tidak akan berlaku bagi 
-- DDL (Data Definition Language) seperti perintah mengubah struktur table dan sebagainya.



-- ###

-- Loking Record Manual
START TRANSACTION;
SELECT * FROM products WHERE id = 'P001' FOR UPDATE;
UPDATE products SET quantity = quantity - 10 WHERE id = 'P001';
COMMIT;
-- NOTE
-- Locking adalah sebuag fitur di MySQL dimana ketika kia ingin mengubah atau mengupdate stok barang misalnya
-- user lain yang hendak mengupdate juga kia suruh untuk menunggu sampai proses update kita selesai
-- Untuk membuat Locking secara manual kita bisa menambahkan KEYWORD FOR UPDATE pada saat SELECT
-- SELECT * FROM nama_table WHERE id = 'P001' FOR UPDATE

-- Perlu diingat kita perlu berhati hati saat melakukan proses locking ini karena bisa menimbulkan deadlock
-- Deadlock adalah kondisi dimana user 1, 2 , dan 3 saling menunggu
-- Contohnya adalah ketika user 1 melakukan select for update terhadap id 001 maka artinya user 1 lock id 001
-- kemudian user 2 melakukan select for update pada id 002 maka user 2 ini juga melakukan lock pada id 002
-- Namun si user 3 juga melakukan select for update di di 002 berarti si user 3 ini akan menunggu user 2
-- dan user 2 juga melakukan select for update pada id 001 artinya apa? 
-- artinya user 2 akan menunggu user 1 dan user 3 akan mengunnggu user 2 jadi tidak ada hentinya
-- inilah yang dinamakan deadlock.
-- saat ada kondisi deadlock maka semua perubahan sebelumnya akan di rollback
-- maka dari itu kita sangat perlu berhati-hati saat melakukan proses locking ini



-- ###

-- Locking Pada Table
LOCK TABLES products READ;
LOCK TABLES products WRITE;
UNLOCK TABLES;
-- NOTE
-- Jikalau sebelumnya kita melakukan locking pada record atau baris
-- Kita juga bisa melakukan lock kepada table
-- ada 2 jenis Lock pada table
-- yang pertama LOCK TABLES products READ;
-- yang ke dua LOCK TABLES products WRITE;
-- Kedua perintah tersebut sebenarnya sama yang membedakan ialah
-- Ketika kita menggunakan READ maka kita hanya bisa membaca atau read sedangkan proses lain
-- atau user lain juga hanya bisa membaca tidak bisa write atau mengubah
-- Dan ketika kita menggunakan WRITE maka kita bisa read dan juga wirte, sedangakang proses lain
-- tidak bisa read dan juga write
-- Proses locking table ini akan terus berjalan sampai kita menuliskan perintah UNLOCK TABLES;



-- ###

-- Lock Instance
LOCK INSTANCE FOR BACKUP;
UNLOCK INSTANCE;
-- NOTE
-- Lock Instance ini digunakan ketika kita tidak membolehkan adanya perubahan DDL (Data Definite Language)
-- seperti crete table, alter table dan lain-lain
-- Jadi ketika kita melakukan lock instance for backup maka orang tidak akan dapat memanipulasi table
-- sampai kita melakukan unlock instance