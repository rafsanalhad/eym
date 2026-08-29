CREATE DATABASE IF NOT EXISTS db_eym;
USE db_eym;

CREATE TABLE IF NOT EXISTS tb_user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  nik VARCHAR(50) NULL,
  first_name VARCHAR(50) NULL,
  firstName VARCHAR(50) NULL,
  last_name VARCHAR(50) NULL,
  lastName VARCHAR(50) NULL,
  email VARCHAR(100) NULL,
  password VARCHAR(255) NULL,
  no_hp VARCHAR(50) NULL,
  noHp VARCHAR(50) NULL,
  jenis_kelamin VARCHAR(50) NULL,
  tanggal_lahir DATE NULL,
  alamat TEXT NULL,
  poin_test_depresi INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS tb_psikiater(
  psikiater_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  pendidiikan_terakhir VARCHAR(50),
  alamat_praktek VARCHAR(255),
  no_hp VARCHAR(50),
  deskripsi_profesional TEXT,
  tarif_perjam INT
);

CREATE TABLE IF NOT EXISTS tb_jadwal(
  jadwal_id INT PRIMARY KEY AUTO_INCREMENT,
  psikiater_id INT,
  tanggal DATE,
  jam_mulai TIME,
  jam_selesai TIME,
  FOREIGN KEY (psikiater_id) REFERENCES tb_psikiater(psikiater_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tb_booking(
  booking_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  psikiater_id INT,
  jadwal_id INT,
  tipe_konsultasi VARCHAR(50),
  status_pembayaran VARCHAR(20),
  total_biaya INT,
  metode_pembayaran VARCHAR(50),
  tanggal_booking DATE,
  alamat_konsultasi TEXT
);

CREATE TABLE IF NOT EXISTS tb_riwayat(
  riwayat_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT,
  tanggal_mulai_konsultasi DATE,
  tanggal_selesai_konsultasi DATE,
  catatan_psikiater TEXT,
  hasil_test_depresi INT
);

CREATE TABLE IF NOT EXISTS tb_pembayaran(
  pembayaran_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT,
  tanggal_pembayaran DATE,
  jumlah_pembayaran INT,
  metode_pembayaran VARCHAR(50),
  status_pembayaran VARCHAR(20),
  FOREIGN KEY (booking_id) REFERENCES tb_booking(booking_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tb_chat(
  chat_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT,
  user_id INT,
  psikiater_id INT,
  pesan TEXT,
  tanggal_pesan DATE,
  FOREIGN KEY (booking_id) REFERENCES tb_booking(booking_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tb_test_depresi(
  test_depresi_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  tanggal_test DATE,
  hasil_test INT,
  FOREIGN KEY (user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tb_soal_tes(
  soal_id INT PRIMARY KEY AUTO_INCREMENT,
  test_depresi_id INT,
  soal TEXT,
  bobot_soal INT
);

CREATE TABLE IF NOT EXISTS tb_jawaban_tes(
  jawaban_id INT PRIMARY KEY AUTO_INCREMENT,
  soal_id INT,
  jawaban TEXT,
  bobot_jawaban INT,
  FOREIGN KEY (soal_id) REFERENCES tb_soal_tes(soal_id) ON DELETE CASCADE
);