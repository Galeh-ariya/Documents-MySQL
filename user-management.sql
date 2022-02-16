-- ### USER MANAGEMENT ### --

-- NOTE
-- Ketika kita membuat suatu aplikasi idealnya user tersebut kita batasi
-- Karena jika tidak maka user tersebut akan memiliki akses ke semua data didatabase
-- karena secara default jika kita tidak memberikan hak akses maka yang di pakai adalah 
-- user root atau super user
-- Maka dari itu setiap kita membuat aplikasi kita batasi user tersebut dengan memberikan 
-- hak akses sesuai kebutuhan. Misalnya INSERT saja atau SELECT saja

-- Membuat & Menghapus User
CREATE USER 'galeh'@'localhost';
CREATE USER 'ariya'@'%';

DROP USER 'galeh'@'localhost';
DROP USER 'ariya'@'%';

-- NOTE
-- Jika kita ingin membuat user maka kita bisa melakukan CREATE USER 'nama user'@'localhost';
-- localhost artinya user tersebut hanya bisa mengakses di komputer local saja, sedangkan %
-- user akan bisa mengakses via local dan juga di server
-- Perlu diingat penggunaan % sangat tidak disarankan karena data si user bisa ter ekspose keluar



-- ###

-- Menambah Hak Akses
GRANT SELECT ON belajar_mysql.* TO 'galeh'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'ariya'@'%';
-- NOTE
-- setelah kata kunci grant kita bisa menambahkan hak akses apa saja yang ingin kita berikan terhapda user
-- .* artinya user dapat mengakses seluruh table
-- jikalau kita ingin membatasi user tersebut pada pengaksesan table maka kita bisa menggunakan
-- belajar_mysql.nama_table

-- Manghpus Hak Akses User
REVOKE SELECT ON belajar_mysql.* FROM 'galeh'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* FROM 'ariya'@'%';


-- Melihat User ini memiliki akses apa saja
SHOW GRANTS FOR 'galeh'@'localhost';
SHOW GRANTS FOR 'ariya'@'%';



-- ###

-- Mengubah Password Untuk user
SET PASSWORD FOR 'galeh'@'localhost' = 'kepo';
SET PASSWORD FOR 'ariya'@'%' = 'rahasia';




-- ###

-- Backup database
-- NOTE
-- Untuk membackup database kita tidak perlu menggunakan perintah sql
-- Karena si MySQL sudah menyiapkan sebuah aplikasi client sederhana dalan bentuk terminal
-- yang bernama mysqldump.
-- mysqldump ini terletak di di folder bin tempak kita menginstall MySQL
-- untuk menjalankannya kita tinggal mengetikkan perintah diterminal
-- mysqldump nama_database --user root --password --result-file=lokasi menyimpan database backup/nama_file_backup.sql
-- Contoh:
-- mysqldump belajar_mysql --user root --password --result-file=D:/temp/coba/backup.sql



-- ###

-- Restore Database
-- NOTE
-- Restore ini digunakan untuk mengimpir database kita ke database yang masih kosong
-- Ada dua cara untuk Merstore atau mengimport data ke database MySQL
-- Cara pertama adalah dengan menggunakan MySQL client dan cara yang ke dua adalah menggunakan 
-- perintah SOURCE

-- Menggunakan MySQL CLient
-- mysql --user=root --password belajar_mysql_import < D:/temp/coba/backup.sql

-- Menggunakan Perintah SQL
-- NOTE
-- Sebelum mengimport database kita harus membuat database terlebih dahulu
-- setelah sudah membuat database kita haru masuk ke dalam database tersebut menggunakan perintah use nama_database
-- nah setelah masuk ke dalam database tersebut kita bisa menegtikkan perintah 
-- SOURCE D:/temp/coba/backup.sql
