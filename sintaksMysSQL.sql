-- masuk ke psql
psql --host=localhost --port5432 --dbname=nama_database --username

-- Membuat database
CREATE DATABASE marketplace;
-- NOTE
-- CREATE DATABASE nama_database;

-- Menampilkan semua database 
-- \l (list)
\l
select datname from pg_database;


-- ###
-- Menghapus Database
DROP DATABASE marketplace;
-- NOTE
-- DROP DATABASE nama_database;


-- ###
-- Masuk ke dalam database
-- c (change)
\c nama_database;
-- NOTE
-- bisa juga dengan cara exit kemudian login dengan dbname yang sudah di buat


-- ###
-- Menampilkan semua table
-- dt (dir table)
\dt
select * from pg_tables where schemaname = 'public'


-- ###
-- Membuat Table
CREATE TABLE barang (
    kode int,
    name VARCHAR(10),
    harga int,
    jumlah int
);


-- ###
-- alter table
alter table barang
add column deskripsi text;
drop column deskripsi
-- note
-- semua perintah untuk modifikasi
-- add, drop, rename


-- ###
-- NOT NULL & default value
jumlah int not null
waktu_buat TIMESTAMP not null default current_timestamp


-- ###
-- Membuat ulang table
TRUNCATE barang;
-- NOTE
-- TRUNCATE nama_table;
-- Kita perlu berhati-hati ketika mengetikkan perintah ini
-- karena ini akan membuat data di table akan terhapus semua
-- cara kerja dari perintah ini adalah
-- Menghapus table, setelah di hapus akan secara otomatis dibuat lagi


-- ###
-- Menghapus Table
DROP TABLE nama_table



-- ###
-- Insert Data
INSERT INTO barang(nama_kolom1, nama_kolom2)
VALUES ('data1', 'data2');

-- Memasukkan data sekaligus
INSERT INTO barang(nama_kolom1, nama_kolom2)
VALUES ('data1', 'data2'),
('data3', 'data4')
('data5', 'data6);


-- ###
-- Select Data
SELECT * FROM barang;
SELECT harga FROM barang;


-- ###
-- Primary Key
PRIMARY KEY (kolom_mana_yang_mau_jadi_pm)


-- ###
-- Where
SELECT * FROM barang WHERE harga = 0;


-- ###
-- Update
UPDATE barang
SET nama = "bebek bumbu hitam"
WHERE id = 'P0001';


-- ###
-- Delete
DELETE FROM barang
WHERE id = 'p0009';
