-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 29, 2026 at 02:00 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mykos`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id_blog` int NOT NULL,
  `id_admin` int DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `foto_thumbnail` varchar(255) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `isi_konten` text,
  `tgl_dibuat` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id_blog`, `id_admin`, `judul`, `foto_thumbnail`, `kategori`, `isi_konten`, `tgl_dibuat`) VALUES
(7, 2, 'Update Tabrakan KA Argo Bromo Anggrek Vs KRL di Bekasi: 14 Orang Tewas Mengenaskan', '1777347069_evakuasi-jenazah-korban-kecelakaan-kereta-di-bekasi-timur-masih-berlangsung-1777341715335_169.jpeg', 'News', 'Korban tewas kecelakaan kereta api Argo Bromo Anggrek dengan KRL di Bekasi Timur bertambah menjadi 14 orang. Selain itu, ada 84 orang korban yang terluka.\r\n\"Update 08.45 WIB: 14 meninggal dunia, 84 korban luka, proses penanganan masih berlangsung,\" kata VP Corporate Communication KAI Anne Purba dalam keterangan tertulis, Selasa (28/4/2026).\r\n\r\nKAI menyatakan seluruh biaya pengobatan bagi korban luka serta biaya pemakaman bagi korban meninggal dunia ditanggung oleh asuransi dan KAI. Direktur Utama KAI Bobby Rasyidin menyebut korban meninggal dunia telah dibawa ke RS Polri Kramat Jati untuk proses identifikasi lebih lanjut.\r\n\r\nSementara itu, 84 korban luka telah mendapatkan penanganan medis di berbagai fasilitas kesehatan. Penanganan korban dilakukan di sejumlah fasilitas kesehatan, antara lain RSUD Bekasi, RS Bella Bekasi, RS Primaya, RS Mitra Plumbon Cibitung, RS Bakti Kartini, RS Siloam Bekasi Timur, RS Hermina, serta RS Mitra Keluarga Bekasi Timur dan Barat.\r\n\r\nKAI juga menyampaikan bahwa barang-barang milik pelanggan yang ditemukan di lokasi kejadian telah diamankan dan saat ini berada di layanan lost and found. Pendataan dan pengelolaan barang tersebut dilakukan secara terkoordinasi bersama pihak kepolisian untuk mendukung proses identifikasi dan kebutuhan penanganan lebih lanjut.\r\n\r\nKAI menyiapkan Posko Tanggap Darurat dan Posko Informasi di Stasiun Bekasi Timur untuk membantu keluarga memperoleh informasi terkait korban dan penumpang. Keluarga dapat menghubungi Contact Center KAI 121.\r\n\r\nUntuk sementara waktu, Stasiun Bekasi Timur belum melayani naik dan turun penumpang. Perjalanan KRL dilayani hingga Stasiun Bekasi, sementara jalur hilir telah dibuka untuk operasional kereta api dengan pengaturan terbatas.', '2026-04-27 20:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `favorit`
--

CREATE TABLE `favorit` (
  `id_favorit` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_kos` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foto_kos`
--

CREATE TABLE `foto_kos` (
  `id_foto` int NOT NULL,
  `id_kos` int DEFAULT NULL,
  `file_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foto_kos`
--

INSERT INTO `foto_kos` (`id_foto`, `id_kos`, `file_nama`) VALUES
(47, 33, '1777302734_1.png'),
(48, 33, '1777302734_2.png'),
(49, 33, '1777302734_3.png'),
(50, 33, '1777302734_4.png'),
(51, 33, '1777302734_5.png');

-- --------------------------------------------------------

--
-- Table structure for table `kos`
--

CREATE TABLE `kos` (
  `id_kos` int NOT NULL,
  `id_pemilik` int DEFAULT NULL,
  `nama_kos` varchar(100) NOT NULL,
  `tipe_kos` enum('putra','putri','campur') NOT NULL,
  `alamat_lengkap` text NOT NULL,
  `kota` varchar(50) NOT NULL,
  `harga_per_bulan` decimal(10,2) NOT NULL,
  `deskripsi` text,
  `link_maps` text,
  `fasilitas_utama` text,
  `jumlah_kamar` int DEFAULT '0',
  `no_hp_kos` varchar(15) DEFAULT NULL,
  `peraturan_kos` text,
  `status_tersedia` tinyint(1) DEFAULT '1',
  `area_sekitar_kos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kos`
--

INSERT INTO `kos` (`id_kos`, `id_pemilik`, `nama_kos`, `tipe_kos`, `alamat_lengkap`, `kota`, `harga_per_bulan`, `deskripsi`, `link_maps`, `fasilitas_utama`, `jumlah_kamar`, `no_hp_kos`, `peraturan_kos`, `status_tersedia`, `area_sekitar_kos`) VALUES
(33, 23, 'MASJID ABU DZAR ALGHIFARI', 'putra', 'Perumahan Griya Shanta, Jl. Candi Jolotundo I Blk. E No.219A, Mojolangu, Lowokwaru, Malang City, East Java 65142', 'Kota Malang', 500000.00, 'Kos Griyashanta merupakan salah satu kawasan hunian dan kos yang cukup diminati di Kota Malang, terutama bagi mahasiswa dan pekerja muda yang mencari tempat tinggal nyaman dengan lokasi strategis. Berada di area Soekarno Hatta dan sekitarnya, kawasan ini dikenal memiliki lingkungan yang ramai namun tetap tertata, serta dekat dengan berbagai fasilitas umum seperti kampus, minimarket, tempat makan, laundry, dan akses transportasi yang mudah. Hal ini menjadikan Kos Griyashanta sebagai pilihan ideal bagi penghuni yang mengutamakan kepraktisan dalam aktivitas sehari-hari.\r\n\r\nSelain lokasinya yang unggul, Kos Griyashanta juga identik dengan suasana lingkungan yang mendukung kenyamanan tinggal. Banyak pilihan kos di kawasan ini menawarkan fasilitas lengkap seperti kamar mandi dalam, WiFi, parkir, dapur bersama, hingga keamanan 24 jam. Suasana sekitar yang hidup namun tetap nyaman membuat penghuni dapat menjalani aktivitas belajar, bekerja, maupun beristirahat dengan lebih optimal. Tidak heran jika kawasan Griyashanta menjadi salah satu destinasi favorit untuk mencari tempat kos di Malang.\r\n', 'https://maps.app.goo.gl/q7618FLG78dpwQHS9', 'Wifi, Ac, Kulkas, kamar mandi dalam, include listrik, air minum, springbad', 5, '089676524908', '1. Setiap penghuni wajib menjaga kebersihan kamar dan area bersama.\r\n2. Dilarang membuat kegaduhan yang mengganggu penghuni lain, terutama pada jam istirahat.\r\n3. Tamu wajib melapor kepada pengelola kos dan mematuhi jam kunjung yang telah ditentukan.\r\n4. Dilarang membawa atau menyimpan barang-barang berbahaya maupun ilegal di area kos.\r\n5. Setiap penghuni wajib menjaga keamanan barang pribadi masing-masing.\r\n6. Pembayaran uang kos harus dilakukan tepat waktu sesuai tanggal yang telah ditetapkan.\r\n7. Dilarang merusak fasilitas kos, dan segala kerusakan akibat kelalaian menjadi tanggung jawab penghuni.\r\n8. Kendaraan wajib diparkir pada tempat yang telah disediakan dengan rapi.\r\n9. Hemat penggunaan listrik dan air serta matikan peralatan saat tidak digunakan.\r\n10. Setiap penghuni wajib menjaga ketertiban, sopan santun, dan kenyamanan bersama di lingkungan kos.', 1, '1. Kampus UB 5 menit\r\n2. Kampus Polinema 4 menit\r\n3. Kampus UM 8 menit\r\n4. Kampus UIN Malang 12 menit\r\n5. Kampus Widyagama 5 menit\r\n6. Kampus Institut Asia 3 menit');

-- --------------------------------------------------------

--
-- Table structure for table `profil_kos`
--

CREATE TABLE `profil_kos` (
  `id_profil` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_kos` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `alamat_lengkap` text,
  `kota` varchar(50) DEFAULT NULL,
  `alamat` text,
  `foto_kos` varchar(255) DEFAULT NULL,
  `foto_ktp` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(100) DEFAULT NULL,
  `usia` int DEFAULT NULL,
  `kontak` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profil_kos`
--

INSERT INTO `profil_kos` (`id_profil`, `id_user`, `nama_kos`, `deskripsi`, `alamat_lengkap`, `kota`, `alamat`, `foto_kos`, `foto_ktp`, `nama_pemilik`, `usia`, `kontak`) VALUES
(19, 23, 'KOS GRIYA SHANTA E221', 'Saya memiliki kos di suhat malang', 'perumahan griyashanta', 'Malang', NULL, '1777302590_1.png,1777302590_2.png', '1777302590_ERD (1).png', 'Pak Bambang', 60, '089676524908');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_kos` int DEFAULT NULL,
  `skor_rating` int DEFAULT NULL,
  `ulasan` text,
  `tgl_rating` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `role` enum('admin','pemilik','pencari') NOT NULL,
  `status` enum('aktif','nonaktif','pending') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama_lengkap`, `email`, `password`, `google_id`, `no_hp`, `foto_profil`, `role`, `status`, `created_at`) VALUES
(2, 'admin mykos', 'admin@gmail.com', '12345678', NULL, NULL, NULL, 'admin', 'aktif', '2026-04-22 14:38:49'),
(23, 'Pak Bambang', 'pemilik@gmail.com', '12345678', NULL, NULL, NULL, 'pemilik', 'aktif', '2026-04-27 15:08:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id_blog`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`id_favorit`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_kos` (`id_kos`);

--
-- Indexes for table `foto_kos`
--
ALTER TABLE `foto_kos`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `id_kos` (`id_kos`);

--
-- Indexes for table `kos`
--
ALTER TABLE `kos`
  ADD PRIMARY KEY (`id_kos`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indexes for table `profil_kos`
--
ALTER TABLE `profil_kos`
  ADD PRIMARY KEY (`id_profil`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_kos` (`id_kos`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `google_id` (`google_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id_blog` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favorit`
--
ALTER TABLE `favorit`
  MODIFY `id_favorit` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto_kos`
--
ALTER TABLE `foto_kos`
  MODIFY `id_foto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `kos`
--
ALTER TABLE `kos`
  MODIFY `id_kos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `profil_kos`
--
ALTER TABLE `profil_kos`
  MODIFY `id_profil` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `favorit_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorit_ibfk_2` FOREIGN KEY (`id_kos`) REFERENCES `kos` (`id_kos`) ON DELETE CASCADE;

--
-- Constraints for table `foto_kos`
--
ALTER TABLE `foto_kos`
  ADD CONSTRAINT `foto_kos_ibfk_1` FOREIGN KEY (`id_kos`) REFERENCES `kos` (`id_kos`) ON DELETE CASCADE;

--
-- Constraints for table `kos`
--
ALTER TABLE `kos`
  ADD CONSTRAINT `kos_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `profil_kos`
--
ALTER TABLE `profil_kos`
  ADD CONSTRAINT `profil_kos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`id_kos`) REFERENCES `kos` (`id_kos`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
