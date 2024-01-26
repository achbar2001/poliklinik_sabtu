-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 02:28 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bk_poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(10) UNSIGNED NOT NULL,
  `id_jadwal` int(10) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `tanggal`) VALUES
(33, 10, 12, 'saya panas obatnya apa ya', 1, '2024-01-07 19:14:23'),
(34, 10, 12, 'hai dok', 2, '2024-01-07 19:18:35'),
(35, 11, 13, 'Dok pingen curhat', 1, '2024-01-08 12:28:58'),
(36, 12, 12, 'sakit panas', 3, '2024-01-08 13:00:22'),
(37, 13, 13, 'dok mau curhat masalah hati', 2, '2024-01-08 13:04:41'),
(38, 14, 12, 'sakit panas', 4, '2024-01-08 13:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_periksa` int(10) UNSIGNED NOT NULL,
  `id_obat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(28, 105, 7),
(29, 105, 9),
(30, 106, 11),
(31, 107, 9),
(32, 107, 8),
(33, 107, 7),
(34, 108, 9),
(35, 108, 10),
(36, 109, 7),
(37, 109, 9);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(10) UNSIGNED NOT NULL,
  `nip` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `nip`, `password`) VALUES
(1, 'Dr. Achbar', 'Ngaliyan', '82318718143', 1, 111110, '$2y$10$hI8wfeevn0Sc5xXaEcoiI.wQnxAzlV59GauzhkcQjkO/T1c8Jc1AS'),
(2, 'Dr. Wahyu', 'Ngaliyan', '08232472423', 6, 111111, '$2y$10$4ZO4dKhbRGmTqzpqamjkhO4mVD2FQqFCPo8CfbMhAAi0r03K04Gey'),
(3, 'Dr. Yudhi', 'Ngaliyan', '0879264645664', 2, 111112, '$2y$10$Hry7IXw.71P9eTn.0LZpjO0hT1yGTt/66CDIf.pn9LNbfSzTGbn8e'),
(4, 'Dr. Bar', 'Ngaliyan', '081917768697', 7, 111113, '$2y$10$9MuUgMqKHh9vZLCxoO21zO3mYnD4o.B80kB7ODUyQn73NpSLwp2Dy'),
(5, 'Dr. Yuli', 'Solo', '09675654543', 7, 111115, '$2y$10$QD2S5CCygsWh9.8ICqvNsugFnHworUa9KTiff78l8Udh30yGRVrX6');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(10) UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `statues` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `statues`) VALUES
(12, 1, 'Senin', '07:00:00', '17:00:00', 1),
(13, 2, 'Sabtu', '07:00:00', '17:00:00', 0),
(14, 3, 'Rabu', '07:00:00', '17:00:00', 1),
(15, 4, 'Kamis', '07:00:00', '17:00:00', 1),
(16, 1, 'Selasa', '07:00:00', '17:00:00', 0),
(18, 2, 'Selasa', '08:00:00', '16:00:00', 0),
(19, 2, 'Senin', '04:00:00', '15:00:00', 1),
(20, 2, 'Rabu', '05:00:00', '18:00:00', 0),
(21, 2, 'Kamis', '09:00:00', '00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(7, 'Paracetamol', 'Tablet', 10000),
(8, 'Decolsin', 'Kapsul', 8000),
(9, 'Antangin', 'Sachet Sirup', 5000),
(10, 'Bodrex', 'Tablet', 13000),
(11, 'Tolak Angin', 'Sachet Sirup', 5500),
(12, 'Bodrex', 'Tablet', 14500),
(13, 'Puyer', 'Tablet', 32000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(10, 'yuli', 'Ngaliyan', '$2y$10$Wv8dwBz4hMXP8kz5BlK7WO50gMxXBNUlWgluEE4AAP3eAFXrSJDIG', '0928424328942', '2024-01-07-1'),
(11, 'yulia', 'semarang', '$2y$10$UUrIrIAbIxAbHgsHTP29u.m.5IsliDWkXQHg6Nbd34hKHPRdHqWIa', '9248924824', '2024-01-08-2'),
(12, 'edo', 'ngaliyan', '$2y$10$KVU0QENn8iAjOCx0R297YO0zZyifD.H2H7dxefSPILd.sVyQWq0Oe', '9248924824', '2024-01-08-3'),
(13, 'eko', 'ngaliyan', '$2y$10$FqbtgZYzxnaDHOurWJQPU.ThqKvoO1YX3eO.gAUa.93QP1EHyZpF6', '9248924824', '2024-01-08-4'),
(14, 'elo', 'semarang', '$2y$10$96GnaO8vx97l1Suuap6I7uOSYA7bsJHjZ7dBmaevjaOIJYLoRAb1i', '9248924824', '2024-01-08-5');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_daftar_poli` int(10) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(105, 33, '2024-01-07 20:16:20', 'anda harus banyak istirahat', 165000),
(106, 34, '2024-01-07 20:19:12', 'gimana', 155500),
(107, 35, '2024-01-08 13:31:05', 'iya curhat apa', 173000),
(108, 37, '2024-01-08 14:05:58', 'iya kamu harus kuat', 168000),
(109, 38, '2024-01-08 14:22:45', 'harus minum obat', 165000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Poli Umum', 'Untuk penyakit umum '),
(2, 'Poli Gigi', 'Untuk masalah yang ada pada gigi'),
(6, 'Poli Hati', 'Untuk masalah yang ada pada hati\r\n'),
(7, 'Poli Jantung', 'Untuk masalah yang ada pada jantung'),
(8, 'Poli Hidung', 'Untuk masalah hidung');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'rayhand', '$2y$10$Vm8PKNcH1y8NbRGb6uGCmuAMR21aAQHOVeK3HbkfUws50bgOSL5Ha'),
(2, 'tukinem', '$2y$10$DajdmG5k4yWMql5Q8TVg6.137mKzNsTNAXZYjHaZuKts//malkKby'),
(3, 'vita', '$2y$10$2j99cstm6b0Ch.z1mLzje.NTLjYHWZvQKXFn7ebS0EzN3jZc.W6iC'),
(4, 'achbar', '$2y$10$N5biKzQYWIFxwTDTW7ACMuRN0JDxmnAcBwCsy1PCWrHulqz8xdVsG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_periksa` (`id_periksa`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periksa_ibfk_1` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `daftar_poli_ibfk_4` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `detail_periksa_ibfk_2` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
