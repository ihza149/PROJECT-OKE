-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2021 pada 14.21
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(36, 3, 7, 0.2),
(37, 3, 8, 0.6),
(38, 3, 9, 0.4),
(39, 4, 7, 0.2),
(40, 4, 8, 1),
(41, 4, 9, 0.6),
(45, 4, 8, 1),
(46, 4, 7, 3),
(48, 10, 7, 0.4),
(49, 10, 8, 0.6),
(50, 10, 9, 0.4);

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
(10, 9, 7, 12),
(11, 9, 8, 12),
(12, 9, 9, 12),
(13, 10, 7, 2),
(14, 10, 8, 3),
(15, 10, 9, 4);

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
(4, 3, 9, 0.7),
(5, 3, 10, 0.7),
(6, 3, 11, 1.2),
(7, 4, 9, 1.6014),
(8, 4, 10, 1.8),
(9, 10, 11, 1.4);

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
(3, 'Beras', '3000'),
(4, 'gula', '300'),
(10, 'tebu', '30000');

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
(29, 7, 0.27, 'x < = 2'),
(30, 7, 0.4, '3 < x < = 5'),
(31, 7, 60, '5 < x < = 10'),
(32, 7, 0.8, '10<x<=14'),
(33, 7, 1, 'x>=15'),
(34, 8, 0.2, 'x<=25'),
(35, 8, 0.4, '25<x<=35'),
(36, 8, 0.6, '30<x<=35'),
(37, 8, 0.8, '35<x<=43'),
(38, 8, 1, 'x>=44'),
(39, 9, 0.2, 'x<=3'),
(40, 9, 0.4, '3<x<=6'),
(41, 9, 0.6, '6<x<=15'),
(42, 9, 0.8, '15<x<=18'),
(43, 9, 1, 'x>=19');

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
(64, 9, 3, 7, 29),
(65, 9, 3, 8, 34),
(66, 9, 3, 9, 39),
(67, 9, 4, 7, 30),
(68, 9, 4, 8, 34),
(69, 9, 4, 9, 39),
(70, 10, 3, 7, 29),
(71, 10, 3, 8, 34),
(72, 10, 3, 9, 39),
(73, 11, 10, 7, 29),
(74, 11, 10, 8, 34),
(75, 11, 10, 9, 39),
(76, 10, 4, 7, 31),
(77, 10, 4, 8, 34),
(78, 10, 4, 9, 39),
(79, 11, 3, 7, 29),
(80, 11, 3, 8, 35),
(81, 11, 3, 9, 40);

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
(9, 'Bondowoso1'),
(10, 'Maesan'),
(11, 'Tamanan');

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
  MODIFY `id_bobotkriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `datareal`
--
ALTER TABLE `datareal`
  MODIFY `id_datareal` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenisbarang` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  MODIFY `id_nilaikriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `nilai_supplier`
--
ALTER TABLE `nilai_supplier`
  MODIFY `id_nilaisupplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
