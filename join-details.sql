-- jenis-jenis Join
-- Inner Join
-- Left Join
-- Right Join
-- Cross Join

-- 
-- INNER JOIN Default
SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);

-- Karena Jenis inner ini default maka kita tidak perlu menambahkan Kata kunci INNER
SELECT * FROM categories
JOIN products ON (products.id_category = categories.id);

-- NOTE
-- Inner join ini hanya akan menampilkan data yang berelasi
-- contohnya adalah ketika products memiliki id_category yang tidak sama dengan id di table categri
-- maka datanya tidak akan di tampilkan.

-- 
-- LEFT JOIN
SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);

-- NOTE
-- Join bertipe Left ini, ketika kita melakukan select join data, maka data yang di table pertama dan
-- yang tidak memiliki relasi juga akan muncul. namun data di table lain akan di set null karena tidak memiliki kategori
-- jadi ketika select join yang muncul adalah data yang berelasi dan juga data di table pertama.
-- Data yang di table kedua akan di tampilkan tapi datanya akan null

-- 
-- RIGHT JOIN
SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);

-- NOTE
-- Right Join adalah kebalikan dari left join
-- dimana data yang akan di tampilkan adalah
-- data dari data yang berelasi dan juga data dari table ke 2


--
--  CROSS JOIN
SELECT * FROM categories
CROSS JOIN products;

-- NOTE
-- Cross join ini akan sangat jarang sekali digunakan
-- cara kerja cross join ini adalah mengkalikan data
-- misal dari table A 5 data dan table B 5 data
-- maka hasilnya adalah 25 data
