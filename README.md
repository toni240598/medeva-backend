# Medeva Backend - Express.js

Repositori ini berisi source code backend aplikasi **Medeva** yang dibangun menggunakan **Express.js**, **Sequelize**, dan **PostgreSQL**.

## 📦 Langkah-Langkah Menjalankan Aplikasi

Ikuti panduan berikut sebelum menjalankan aplikasi ini:

### 1. Install Dependensi
Sebelum melakukan hal lain, pastikan Anda telah mengunduh semua dependensi dengan menjalankan perintah berikut di direktori project:
```bash
npm install
```
Langkah ini akan mengunduh semua dependency yang dibutuhkan ke dalam folder node_modules.



### 2. Konfigurasi .env

Sebelum menjalankan aplikasi, salin atau buat file .env di root proyek dan sesuaikan isi konfigurasinya sesuai dengan lingkungan dan database PostgreSQL Anda. Contoh konfigurasi:
```bash
DB_HOST=localhost
DB_PORT=5432
DB_NAME=medeva_db
DB_USERNAME=postgres
DB_PASSWORD=yourpassword
```
Pastikan database medeva_db sudah dibuat terlebih dahulu di PostgreSQL Anda.


### 3. Menjalankan Aplikasi

Untuk menjalankan aplikasi dalam mode produksi atau biasa:
```bash
npm run start
```

Untuk menjalankan aplikasi dalam mode pengembangan (hot reload menggunakan nodemon):
```bash
npm run dev
```


### 4. Menjalankan Seeder (Pengisian Data Awal)

Buka terminal baru (jangan hentikan server yang sedang berjalan) dan jalankan perintah berikut untuk mengisi data default ke database:
```bash
npm run seed
```
Perintah ini akan memasukkan data wilayah (provinsi, kota/kabupaten, kecamatan, kelurahan) dan data referensi lainnya.


### 5. (Opsional) Import SQL Langsung ke PostgreSQL
Sebagai alternatif dari seeder, Anda juga dapat mengimpor file SQL langsung ke PostgreSQL menggunakan aplikasi seperti pgAdmin atau melalui terminal.

File yang dimaksud: medeva_db.sql

Langkah-langkah umum:

* Buka pgAdmin atau CLI PostgreSQL

* Buat database medeva_db jika belum ada

* Import file medeva_db.sql ke dalam database tersebut






✅ Catatan Tambahan

* Selalu pastikan environment Anda sudah sesuai sebelum menjalankan server atau seeder.

* Folder uploads/ digunakan untuk menyimpan file foto, pastikan folder ini ada dan memiliki izin tulis.

* Intruksi proyek ini hanya menggunakan npm. disarankan juga jika ingin menggunakan pnpm atau yarn.