CREATE DATABASE db_eym;

CREATE DATABASE db_eym;
CREATE TABLE tb_user(
    user_id INT PRIMARY KEY auto_increment,
  nik INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(50),
  no_hp VARCHAR(50),
  jenis_kelamin VARCHAR(50),
  tanggal_lahir DATE,
  alamat VARCHAR(50),
  poin_test_depresi INT,
);
CREATE TABLE tb_psikiater(
    psikiater_id INT PRIMARY KEY auto_increment,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    pendidiikan_terakhir VARCHAR(50),
    alamat_praktek VARCHAR(50),
    no_hp VARCHAR(50),
    deskripsi_profesional VARCHAR(50),
    tarif_perjam INT,
)
CREATE TABLE tb_jadwal(
    jadwal_id INT PRIMARY KEY auto_increment,
    psikiater_id INT,
    tanggal DATE,
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (psikiater_id) REFERENCES tb_psikiater(psikiater_id)
)
CREATE TABLE tb_booking(
    booking_id INT PRIMARY KEY auto_increment,
    user_id INT,
    psikiater_id INT,
    jadwal_id INT,
    tipe_konsultasi VARCHAR(50),
    status_pembayaran VARCHAR(10),
    total_biaya INT,
    metode_pembayaran VARCHAR(50),
    tanggal_booking DATE,
    alamat_konsultasi VARCHAR(50),
)
CREATE TABLE tb_riwayat(
    riwayat_id INT PRIMARY KEY auto_increment,
    booking_id INT,
    tanggal_mulai_konsultasi DATE,
    tanggal_selesai_konsultasi DATE,
    catatan_psikiater VARCHAR(50),
    hasil_test_depresi INT,
)
CREATE TABLE tb_pembayaran(
    pembayaran_id INT PRIMARY KEY auto_increment,
    booking_id INT,
    tanggal_pembayaran DATE,
    jumlah_pembayaran INT,
    metode_pembayaran VARCHAR(50),
    status_pembayaran VARCHAR(10),
    FOREIGN KEY (booking_id) REFERENCES tb_booking(booking_id)
)
CREATE TABLE tb_chat(
    chat_id INT PRIMARY KEY auto_increment,
    booking_id INT,
    user_id INT,
    psikiater_id INT,
    pesan VARCHAR(50),
    tanggal_pesan DATE,
    FOREIGN KEY (booking_id) REFERENCES tb_booking(booking_id)
)
CREATE TABLE tb_test_depresi(
    test_depresi_id INT PRIMARY KEY auto_increment,
    user_id INT,
    tanggal_test DATE,
    hasil_test INT,
    FOREIGN KEY (user_id) REFERENCES tb_user(user_id)
)
CREATE TABLE tb_soal_tes(
    soal_id INT PRIMARY KEY auto_increment,
    test_depresi_id INT,
    soal VARCHAR(50),
    bobot_soal INT,
)
CREATE TABLE tb_jawaban_tes(
    jawaban_id INT PRIMARY KEY auto_increment,
    soal_id INT,
    jawaban VARCHAR(50),
    bobot_jawaban INT,
    FOREIGN KEY (soal_id) REFERENCES tb_soal_tes(soal_id)
)