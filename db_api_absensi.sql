-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2023 pada 18.04
-- Versi server: 8.0.33
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_api_absensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'adminadmin', '$2y$12$QG9HQ3RJBvQuuKj9hXGz5.QvmoAcKH2yEqbaI1sBJ6Ye9Tvq9Ja/S', NULL, '2023-11-13 18:06:19', '2023-11-13 18:06:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_absensi`
--

CREATE TABLE `log_absensi` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `log_start` timestamp NULL DEFAULT NULL,
  `log_lunch` timestamp NULL DEFAULT NULL,
  `log_end_lunch` timestamp NULL DEFAULT NULL,
  `log_end` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `log_absensi`
--

INSERT INTO `log_absensi` (`id`, `user_id`, `created_at`, `updated_at`, `log_start`, `log_lunch`, `log_end_lunch`, `log_end`) VALUES
(35, 11, '2023-11-17 01:37:53', '2023-11-17 01:38:07', '2023-11-17 01:37:58', '2023-11-17 04:38:02', '2023-11-17 05:30:03', '2023-11-17 09:38:07'),
(36, 12, '2023-11-17 01:38:22', '2023-11-17 01:38:26', '2023-11-17 00:30:24', '2023-11-17 04:30:25', '2023-11-17 05:15:25', '2023-11-17 09:30:26'),
(37, 13, '2023-11-17 01:38:43', '2023-11-17 01:38:46', '2023-11-17 00:20:44', '2023-11-17 04:48:45', '2023-11-17 05:38:45', '2023-11-17 08:50:46'),
(38, 14, '2023-11-17 01:39:34', '2023-11-17 01:39:39', '2023-11-17 00:28:38', '2023-11-17 04:39:38', '2023-11-17 05:00:39', '2023-11-17 09:00:39'),
(39, 15, '2023-11-17 02:15:41', '2023-11-17 02:15:44', '2023-11-17 00:35:44', '2023-11-17 04:35:44', '2023-11-17 05:35:44', '2023-11-17 09:25:44'),
(40, 16, '2023-11-17 02:16:26', '2023-11-17 02:16:30', '2023-11-17 00:36:28', '2023-11-17 04:36:28', '2023-11-17 05:28:28', '2023-11-17 09:45:30'),
(41, 17, '2023-11-17 09:07:59', '2023-11-17 09:08:03', '2023-11-17 09:08:01', '2023-11-17 09:08:02', '2023-11-17 09:08:02', '2023-11-17 09:08:03'),
(42, 18, '2023-11-17 09:08:35', '2023-11-17 09:08:38', '2023-11-17 09:08:36', '2023-11-17 09:08:37', '2023-11-17 09:08:37', '2023-11-17 09:08:38'),
(43, 19, '2023-11-17 09:08:52', '2023-11-17 09:08:54', '2023-11-17 09:08:53', '2023-11-17 09:08:53', '2023-11-17 09:08:54', '2023-11-17 09:38:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_13_170854_create_absensis_table', 2),
(6, '2023_11_14_004530_create_admins_table', 3),
(7, '2023_11_14_103405_update_log_absensi_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth-token', '3c8f7087f906c1878fdb4346dc4182d099d62c64fdd376ca1ddc36ac50f71de9', '[\"*\"]', NULL, NULL, '2023-11-13 09:13:51', '2023-11-13 09:13:51'),
(2, 'App\\Models\\User', 8, 'auth-token', '312f5d7ed8110b1e8e7e945fdb47962befbc251734def33e96b7d96fa0711e7c', '[\"*\"]', NULL, NULL, '2023-11-13 09:24:39', '2023-11-13 09:24:39'),
(3, 'App\\Models\\User', 10, 'auth-token', '78a163687a7aa8fb2430939535eb525043f5cd88192c78674530ab0b68b485ff', '[\"*\"]', NULL, NULL, '2023-11-13 09:25:41', '2023-11-13 09:25:41'),
(17, 'App\\Models\\Admin', 1, 'auth-token', 'f01c1f8a097489c5af69e1963df361b31a3849c511e5e0daede667ba9110011d', '[\"*\"]', NULL, NULL, '2023-11-13 18:06:19', '2023-11-13 18:06:19'),
(18, 'App\\Models\\Admin', 1, 'auth-token', 'cafc841de92c0f2a008a885dcd7563193cdc003302d0d985ce93eb63dc5038aa', '[\"*\"]', '2023-11-13 18:42:40', NULL, '2023-11-13 18:32:18', '2023-11-13 18:42:40'),
(19, 'App\\Models\\Admin', 1, 'auth-token', '98e257821ab9acce5e767eee5d3fc0188ff39716e17690edd17fb70395d12185', '[\"*\"]', '2023-11-13 19:17:32', NULL, '2023-11-13 18:44:44', '2023-11-13 19:17:32'),
(20, 'App\\Models\\Admin', 1, 'auth-token', 'cfa3edd53b70fc0df637805cba95754379799e49be3f64601cf5efe612ba0c04', '[\"*\"]', '2023-11-13 19:30:17', NULL, '2023-11-13 19:18:34', '2023-11-13 19:30:17'),
(21, 'App\\Models\\Admin', 1, 'auth-token', 'e57fcc9bdfd59775fe5e60fae9c2a9eebdff7c27e414134cc75cec6d477df90d', '[\"*\"]', '2023-11-13 19:31:54', NULL, '2023-11-13 19:30:22', '2023-11-13 19:31:54'),
(22, 'App\\Models\\Admin', 1, 'auth-token', '4380cd13d35bd494a6311464896f79001da7f7ee0c3081bbea1e4e8b9703c8f5', '[\"*\"]', '2023-11-13 19:48:57', NULL, '2023-11-13 19:48:44', '2023-11-13 19:48:57'),
(23, 'App\\Models\\Admin', 1, 'auth-token', '1652054173a7a4327b544e8bb19fd45c2574f6e49ec0bfef1e65b2a39d9add2d', '[\"*\"]', NULL, NULL, '2023-11-13 19:54:26', '2023-11-13 19:54:26'),
(24, 'App\\Models\\Admin', 1, 'auth-token', '5ac3be7ebbb9f890b057f2dadf8cb4162cd35834f9ebe8b211f37ccac2f52110', '[\"*\"]', '2023-11-13 20:08:31', NULL, '2023-11-13 19:55:02', '2023-11-13 20:08:31'),
(25, 'App\\Models\\Admin', 1, 'auth-token', '4ede33b202fde20380284cbb96efab66844ab9fd10ca69a37436b6d92b1d86c1', '[\"*\"]', '2023-11-13 20:12:39', NULL, '2023-11-13 20:10:11', '2023-11-13 20:12:39'),
(26, 'App\\Models\\Admin', 1, 'auth-token', '2cf402837fa7c8bd2ac3b697ca3aa424173f78783db013253f115555b3b9340d', '[\"*\"]', '2023-11-13 21:18:55', NULL, '2023-11-13 20:14:00', '2023-11-13 21:18:55'),
(27, 'App\\Models\\Admin', 1, 'auth-token', '896fa190d834535144f392e16c6fed16bdcb694869532c3b0236e57dee5b6d6e', '[\"*\"]', NULL, NULL, '2023-11-13 20:20:49', '2023-11-13 20:20:49'),
(28, 'App\\Models\\Admin', 1, 'auth-token', 'deb9c4707b1fc648361106b2b4b2914d4248e34dfaaefb5a80ecc4ba10098fd8', '[\"*\"]', NULL, NULL, '2023-11-13 20:20:52', '2023-11-13 20:20:52'),
(29, 'App\\Models\\Admin', 1, 'auth-token', '22cca9569975c125533be4963902e52fa185a3d1804e5569f5bd7830d9785782', '[\"*\"]', '2023-11-13 21:23:09', NULL, '2023-11-13 21:19:36', '2023-11-13 21:23:09'),
(30, 'App\\Models\\Admin', 1, 'auth-token', 'b085ec6f8dc8dbbc84fed00d7175326861f98b951df4fa6b6e74b1300d9b760b', '[\"*\"]', '2023-11-13 21:29:28', NULL, '2023-11-13 21:29:14', '2023-11-13 21:29:28'),
(31, 'App\\Models\\Admin', 1, 'auth-token-admin', '167dca80fb40d1673aefedb6fc14829bbad8eddad7ecadf0e384914452fea5dc', '[\"*\"]', '2023-11-13 21:47:05', NULL, '2023-11-13 21:31:44', '2023-11-13 21:47:05'),
(32, 'App\\Models\\Admin', 1, 'auth-token-admin', '609dd43dddf3cfb97022ba0564c3f18f8a17b8f472a6e32a02622a435b668ff0', '[\"*\"]', '2023-11-13 21:48:30', NULL, '2023-11-13 21:48:17', '2023-11-13 21:48:30'),
(33, 'App\\Models\\Admin', 1, 'auth-token-admin', 'da5bc259b06e3a02ebf7d9f3cf14852f4c2bfc51cb2a3c9e5599e66e299da9b5', '[\"*\"]', '2023-11-14 07:57:54', NULL, '2023-11-13 21:52:26', '2023-11-14 07:57:54'),
(38, 'App\\Models\\Admin', 1, 'auth-token-admin', '4f5d34308531d6a6ed8d1d8a106a4fe2829e128c366e5ff7f94de615fdebdcf2', '[\"*\"]', '2023-11-14 08:04:40', NULL, '2023-11-14 08:02:18', '2023-11-14 08:04:40'),
(39, 'App\\Models\\Admin', 1, 'auth-token-admin', '46a0cb9845a68054936c38d4bcc12f617a59a91cbf939e01361e1f23bf66c433', '[\"*\"]', '2023-11-14 08:07:29', NULL, '2023-11-14 08:07:16', '2023-11-14 08:07:29'),
(40, 'App\\Models\\Admin', 1, 'auth-token-admin', 'd1dd8db3293dc15cc2fe0b323d49f9921b7b3f984da26a4da35ffb7c9b5b49b9', '[\"*\"]', '2023-11-14 08:24:10', NULL, '2023-11-14 08:10:25', '2023-11-14 08:24:10'),
(58, 'App\\Models\\User', 20, 'auth-token', 'cd030e91eec96771ca46ed411623a904acb56fe4f7fba5ee7ce83bc46e8b4473', '[\"*\"]', NULL, NULL, '2023-11-16 21:36:05', '2023-11-16 21:36:05'),
(66, 'App\\Models\\User', 20, 'auth-token', '33dca02c1b6ee0f3b9c5fdb9c5063d51c949263208d20b19fc7b35002b21916e', '[\"*\"]', '2023-11-17 01:34:20', NULL, '2023-11-17 01:33:29', '2023-11-17 01:34:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, '1122334451', 'Andi', '$2y$12$3Ws0dQSXOD60LZvI4JRdte0wqVyDehIO4qPzVSwJfy1AmrryYuAhS', NULL, '2023-11-13 09:37:18', '2023-11-13 09:37:18'),
(12, '1122334452', 'Budi', '$2y$12$yA6XojLzCwc4tw4ICjRbuuUM0oVpXhaRVhq0I/C7hGhXkgR5ua9bG', NULL, '2023-11-13 09:37:35', '2023-11-13 09:37:35'),
(13, '1122334453', 'Citra', '$2y$12$o0wd/0NUoUTfOt5f9dXgSOdcq0nwcPHXsPl1oOkPsN2sp1ZHV1uwi', NULL, '2023-11-13 09:37:54', '2023-11-13 09:37:54'),
(14, '1122334454', 'Doni', '$2y$12$LaII7gPRFBBgSarCbSFA/.TFQ9L1liTOmrCTkeS/Kp6N8ucXtLrPi', NULL, '2023-11-13 09:38:08', '2023-11-13 09:38:08'),
(15, '1122334455', 'Ekky', '$2y$12$60xWFwruWKqNF15a1Nx.4e/.kLAtRk4Mw2SjMxs.eES2E4fYGLWXK', NULL, '2023-11-13 09:38:20', '2023-11-13 09:38:20'),
(16, '1122334456', 'Fikri', '$2y$12$oxcs6FHYHZU.lqJgAxoUrOAe3S.hM8AcN0BtjqgfOhmPPXTXitnQm', NULL, '2023-11-13 09:38:37', '2023-11-13 09:38:37'),
(17, '1122334457', 'Gina', '$2y$12$moQ0TH/S0dO8cE8eK80sLuMTkzQ1w4YufbG3jsOSY5maWbsRCKgnW', NULL, '2023-11-13 09:38:57', '2023-11-13 09:38:57'),
(18, '1122334458', 'Hengky', '$2y$12$S1ZObBZg3t9tiHPswyFr0uR4irhJ4IF3/cmp9JlJclBqoFD/Ug9DC', NULL, '2023-11-13 09:39:18', '2023-11-13 09:39:18'),
(19, '1122334459', 'Indra', '$2y$12$qoboE1wcBk/tG12vMGE/XO0lkNIr1Qor9vC4hdsc1FMlrWbB177Z.', NULL, '2023-11-13 09:39:44', '2023-11-13 09:39:44'),
(20, '1122334460', 'Jihan', '$2y$12$88/CEWGroRa4zhrpI0CJBeFDz4AH7jQ8ahQ7ZzWlgEA.6k8WG18I2', NULL, '2023-11-13 09:40:30', '2023-11-13 09:40:30');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `log_absensi`
--
ALTER TABLE `log_absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_absensi_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `log_absensi`
--
ALTER TABLE `log_absensi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `log_absensi`
--
ALTER TABLE `log_absensi`
  ADD CONSTRAINT `log_absensi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
