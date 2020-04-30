-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2020 at 07:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `kode_anggota` varchar(5) NOT NULL,
  `username_anggota` varchar(50) NOT NULL,
  `password_anggota` varchar(12) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `alamat_anggota` varchar(60) NOT NULL,
  `telp_anggota` varchar(20) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(70) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `kode_penulis` varchar(3) NOT NULL,
  `kode_penerbit` varchar(3) NOT NULL,
  `kode_kategori` varchar(3) NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `kode_rak` varchar(3) NOT NULL,
  `tanggal_pengadaaan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `kode_transaksi` varchar(5) NOT NULL,
  `kode_buku` varchar(10) NOT NULL,
  `jumlah_buku` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kode_kategori` varchar(3) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `master_transaksi`
--

CREATE TABLE `master_transaksi` (
  `kode_transaksi` varchar(5) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `kode_anggota` varchar(5) NOT NULL,
  `kode_pegawai` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kode_pegawai` varchar(5) NOT NULL,
  `username_pegawai` varchar(50) NOT NULL,
  `password_pegawai` varchar(12) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(12) NOT NULL,
  `alamat_pegawai` varchar(60) NOT NULL,
  `telp_pegawai` varchar(20) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `kode_penerbit` varchar(3) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `alamat_penerbit` varchar(60) NOT NULL,
  `telp_penerbit` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `kode_penulis` varchar(3) NOT NULL,
  `nama_penulis` varchar(50) NOT NULL,
  `alamat_penulis` varchar(60) NOT NULL,
  `telp_penulis` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `kode_rak` varchar(3) NOT NULL,
  `nama_rak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`kode_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`),
  ADD KEY `kode_penulis` (`kode_penulis`),
  ADD KEY `kode_penerbit` (`kode_penerbit`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `kode_rak` (`kode_rak`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_buku` (`kode_buku`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `master_transaksi`
--
ALTER TABLE `master_transaksi`
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `kode_anggota` (`kode_anggota`),
  ADD KEY `kode_pegawai` (`kode_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kode_pegawai`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`kode_penerbit`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`kode_penulis`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`kode_rak`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kode_penulis`) REFERENCES `penulis` (`kode_penulis`),
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`kode_penerbit`) REFERENCES `penerbit` (`kode_penerbit`),
  ADD CONSTRAINT `buku_ibfk_3` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`),
  ADD CONSTRAINT `buku_ibfk_4` FOREIGN KEY (`kode_rak`) REFERENCES `rak` (`kode_rak`);

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode_buku`);

--
-- Constraints for table `master_transaksi`
--
ALTER TABLE `master_transaksi`
  ADD CONSTRAINT `master_transaksi_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `detail_transaksi` (`kode_transaksi`),
  ADD CONSTRAINT `master_transaksi_ibfk_2` FOREIGN KEY (`kode_anggota`) REFERENCES `anggota` (`kode_anggota`),
  ADD CONSTRAINT `master_transaksi_ibfk_3` FOREIGN KEY (`kode_pegawai`) REFERENCES `pegawai` (`kode_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
