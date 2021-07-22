-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jul 2021 pada 15.16
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spksaw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `id_bobotkriteria` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`id_bobotkriteria`, `id_jenisbarang`, `id_kriteria`, `bobot`) VALUES
(51, 3, 7, 1),
(52, 3, 8, 1),
(53, 3, 9, 1),
(54, 10, 7, 1),
(55, 10, 8, 1),
(56, 10, 9, 1),
(57, 13, 7, 0.2),
(58, 13, 8, 0.2),
(59, 13, 9, 0.2),
(60, 14, 7, 1),
(61, 14, 8, 0.6),
(62, 14, 9, 1),
(63, 15, 7, 0.2),
(64, 15, 8, 0.2),
(65, 15, 9, 0.2),
(66, 16, 7, 0.2),
(67, 16, 8, 0.2),
(68, 16, 9, 0.2),
(69, 17, 7, 0.2),
(70, 17, 8, 0.2),
(71, 17, 9, 0.2),
(72, 18, 7, 0.6),
(73, 18, 8, 0.2),
(74, 18, 9, 0.6),
(75, 19, 7, 1),
(76, 19, 8, 1),
(77, 19, 9, 1),
(78, 20, 7, 0.4),
(79, 20, 8, 0.2),
(80, 20, 9, 0.4),
(81, 21, 7, 0.2),
(82, 21, 8, 0.2),
(83, 21, 9, 0.2),
(84, 4, 7, 1),
(85, 4, 8, 0.2),
(86, 4, 9, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `datareal`
--

CREATE TABLE `datareal` (
  `id_datareal` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `nilai_real` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `datareal`
--

INSERT INTO `datareal` (`id_datareal`, `id_supplier`, `id_kriteria`, `nilai_real`) VALUES
(31, 9, 7, 12),
(32, 9, 8, 39),
(33, 9, 9, 18),
(34, 10, 7, 3),
(35, 10, 8, 39),
(36, 10, 9, 17),
(37, 11, 7, 5),
(38, 11, 8, 39),
(39, 11, 9, 18),
(40, 13, 7, 4),
(41, 13, 8, 49),
(42, 13, 9, 5),
(43, 14, 7, 2),
(44, 14, 8, 40),
(45, 14, 9, 16),
(46, 15, 7, 5),
(47, 15, 8, 37),
(48, 15, 9, 16),
(49, 16, 7, 5),
(50, 16, 8, 37),
(51, 16, 9, 16),
(52, 17, 7, 3),
(53, 17, 8, 40),
(54, 17, 9, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `hasil` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_jenisbarang`, `id_supplier`, `hasil`) VALUES
(4, 3, 9, 3),
(5, 3, 10, 2.15),
(6, 3, 11, 2.55),
(7, 4, 9, 2.2),
(8, 4, 10, 1.66),
(9, 10, 11, 2.6),
(10, 10, 9, 1.734),
(11, 10, 10, 2.333),
(12, 10, 28, 1.2),
(13, 4, 11, 1.33),
(14, 4, 28, 1.37),
(15, 3, 13, 0.65),
(16, 3, 28, 1.5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenisbarang` int(3) NOT NULL,
  `namaBarang` varchar(30) NOT NULL,
  `jumlah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenisbarang`, `namaBarang`, `jumlah`) VALUES
(3, 'Beras', '506063'),
(4, 'Gula', '28881'),
(10, 'Jagung', '148668'),
(13, 'Kedelai', '317'),
(14, 'Ubi kayu', '39234'),
(15, 'Ubi jalar', '577'),
(16, 'Kacang tanah ', '118'),
(17, 'Kacang hijau', '51'),
(18, 'Sayuran', '18935'),
(19, 'Buah-buahan', '84188'),
(20, 'Daging', '4316'),
(21, 'Telur', '1593'),
(22, 'Susu', '16'),
(23, 'Ikan', '929');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(3) NOT NULL,
  `namaKriteria` varchar(30) NOT NULL,
  `sifat` enum('Benefit','Cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `namaKriteria`, `sifat`) VALUES
(7, 'Ketersediaan Pangan', 'Benefit'),
(8, 'Akses Pangan', 'Benefit'),
(9, 'Pemanfaatan Pangan', 'Benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_kriteria`
--

CREATE TABLE `nilai_kriteria` (
  `id_nilaikriteria` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `nilai` float NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_kriteria`
--

INSERT INTO `nilai_kriteria` (`id_nilaikriteria`, `id_kriteria`, `nilai`, `keterangan`) VALUES
(29, 7, 0.2, 'x < = 3'),
(30, 7, 0.4, '3 < x < = 5'),
(31, 7, 0.8, '10 < x < = 14'),
(33, 7, 1, 'x > = 15'),
(34, 8, 0.2, 'x < = 25'),
(35, 8, 0.4, '25 < x < = 30'),
(36, 8, 0.6, '30 < x < = 35'),
(37, 8, 0.8, '35 < x < = 43'),
(38, 8, 1, 'x > = 44'),
(39, 9, 0.2, 'x < = 3'),
(40, 9, 0.4, '3 < x < = 6'),
(41, 9, 0.6, '6 < x < = 15'),
(42, 9, 0.8, '15 < x < = 18'),
(43, 9, 1, 'x > = 19'),
(46, 7, 0.6, '5 < x < = 10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_supplier`
--

CREATE TABLE `nilai_supplier` (
  `id_nilaisupplier` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `id_nilaikriteria` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_supplier`
--

INSERT INTO `nilai_supplier` (`id_nilaisupplier`, `id_supplier`, `id_jenisbarang`, `id_kriteria`, `id_nilaikriteria`) VALUES
(82, 9, 3, 7, 33),
(83, 9, 3, 8, 37),
(84, 9, 3, 9, 43),
(85, 10, 3, 7, 31),
(86, 10, 3, 8, 36),
(87, 10, 3, 9, 41),
(88, 11, 3, 7, 31),
(89, 11, 3, 8, 36),
(90, 11, 3, 9, 43),
(91, 28, 3, 7, 46),
(92, 28, 3, 8, 35),
(93, 28, 3, 9, 40),
(94, 9, 4, 7, 31),
(95, 9, 4, 8, 38),
(96, 9, 4, 9, 43),
(97, 10, 4, 7, 30),
(98, 10, 4, 8, 37),
(99, 10, 4, 9, 43),
(100, 11, 4, 7, 29),
(101, 11, 4, 8, 35),
(102, 11, 4, 9, 43),
(103, 28, 4, 7, 29),
(104, 28, 4, 8, 36),
(105, 28, 4, 9, 43),
(106, 9, 10, 7, 30),
(107, 9, 10, 8, 35),
(108, 9, 10, 9, 40),
(109, 10, 10, 7, 33),
(110, 10, 10, 8, 36),
(111, 10, 10, 9, 39),
(112, 11, 10, 7, 46),
(113, 11, 10, 8, 36),
(114, 11, 10, 9, 41),
(115, 28, 10, 7, 29),
(116, 28, 10, 8, 35),
(117, 28, 10, 9, 39),
(118, 13, 3, 7, 29),
(119, 13, 3, 8, 34),
(120, 13, 3, 9, 39);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(3) NOT NULL,
  `namaSupplier` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `namaSupplier`) VALUES
(9, 'Bondowoso'),
(10, 'Maesan'),
(11, 'Tamanan'),
(13, 'Binakal'),
(14, 'Cerme'),
(15, 'Curahdami'),
(16, 'Darus sholah'),
(17, 'Grujugan'),
(18, 'Kalabang'),
(19, 'Prajekan'),
(20, 'Pakem'),
(21, 'Wringin'),
(22, 'Pujer'),
(23, 'Wonosari'),
(24, 'Tlogosari'),
(25, 'Tenggarang'),
(26, 'Tegalampel'),
(27, 'Sempol'),
(28, 'Tapen'),
(29, 'Sumber wringin'),
(30, 'Sukosari'),
(31, 'Taman Krocok'),
(32, 'Botolinggo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `Id_admin` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`Id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$M80eHFnCpX6RzDiN7LfRNeNMmUZM51y4gT9NqnerVnud9onIWBvyq');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD PRIMARY KEY (`id_bobotkriteria`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `datareal`
--
ALTER TABLE `datareal`
  ADD PRIMARY KEY (`id_datareal`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenisbarang`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD PRIMARY KEY (`id_nilaikriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `nilai_supplier`
--
ALTER TABLE `nilai_supplier`
  ADD PRIMARY KEY (`id_nilaisupplier`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_nilaikriteria` (`id_nilaikriteria`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_admin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  MODIFY `id_bobotkriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `datareal`
--
ALTER TABLE `datareal`
  MODIFY `id_datareal` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenisbarang` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  MODIFY `id_nilaikriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `nilai_supplier`
--
ALTER TABLE `nilai_supplier`
  MODIFY `id_nilaisupplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `Id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD CONSTRAINT `nilai_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_supplier`
--
ALTER TABLE `nilai_supplier`
  ADD CONSTRAINT `nilai_supplier_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_supplier_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_supplier_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_supplier_ibfk_4` FOREIGN KEY (`id_nilaikriteria`) REFERENCES `nilai_kriteria` (`id_nilaikriteria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
