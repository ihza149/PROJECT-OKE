-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2021 at 09:55 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

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
-- Table structure for table `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `id_bobotkriteria` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bobot_kriteria`
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
-- Table structure for table `datareal`
--

CREATE TABLE `datareal` (
  `id_datareal` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `nilai_real` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datareal`
--

INSERT INTO `datareal` (`id_datareal`, `id_supplier`, `id_kriteria`, `nilai_real`) VALUES
(16, 9, 7, 15),
(17, 9, 8, 43),
(18, 9, 9, 19),
(19, 10, 7, 14),
(20, 10, 8, 38),
(21, 10, 9, 17),
(22, 11, 7, 13),
(23, 11, 8, 27),
(24, 11, 9, 16),
(25, 13, 7, 8),
(26, 13, 8, 24),
(27, 13, 9, 17),
(28, 28, 7, 15),
(29, 28, 8, 25),
(30, 28, 9, 14);

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `hasil` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_jenisbarang`, `id_supplier`, `hasil`) VALUES
(4, 3, 9, 1.2),
(5, 3, 10, 0.85),
(6, 3, 11, 1.01),
(7, 4, 9, 1.8),
(8, 4, 10, 1.5),
(9, 10, 11, 1.24),
(10, 10, 9, 0.827),
(11, 10, 10, 1.1332),
(12, 10, 28, 0.6134),
(13, 4, 11, 1.05),
(14, 4, 28, 1.25),
(15, 3, 13, 0.27),
(16, 3, 28, 0.58);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenisbarang` int(3) NOT NULL,
  `namaBarang` varchar(30) NOT NULL,
  `jumlah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenisbarang`, `namaBarang`, `jumlah`) VALUES
(3, 'Beras', '3000'),
(4, 'Gula', '2000'),
(10, 'Jagung', '30000');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(3) NOT NULL,
  `namaKriteria` varchar(30) NOT NULL,
  `sifat` enum('Benefit','Cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `namaKriteria`, `sifat`) VALUES
(7, 'Ketersediaan Pangan', 'Benefit'),
(8, 'Akses Pangan', 'Benefit'),
(9, 'Pemanfaatan Pangan', 'Benefit');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kriteria`
--

CREATE TABLE `nilai_kriteria` (
  `id_nilaikriteria` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `nilai` float NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_kriteria`
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
-- Table structure for table `nilai_supplier`
--

CREATE TABLE `nilai_supplier` (
  `id_nilaisupplier` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `id_nilaikriteria` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_supplier`
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
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(3) NOT NULL,
  `namaSupplier` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id_admin` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$M80eHFnCpX6RzDiN7LfRNeNMmUZM51y4gT9NqnerVnud9onIWBvyq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD PRIMARY KEY (`id_bobotkriteria`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `datareal`
--
ALTER TABLE `datareal`
  ADD PRIMARY KEY (`id_datareal`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenisbarang`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD PRIMARY KEY (`id_nilaikriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `nilai_supplier`
--
ALTER TABLE `nilai_supplier`
  ADD PRIMARY KEY (`id_nilaisupplier`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_nilaikriteria` (`id_nilaikriteria`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  MODIFY `id_bobotkriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `datareal`
--
ALTER TABLE `datareal`
  MODIFY `id_datareal` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenisbarang` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  MODIFY `id_nilaikriteria` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `nilai_supplier`
--
ALTER TABLE `nilai_supplier`
  MODIFY `id_nilaisupplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD CONSTRAINT `nilai_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai_supplier`
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
