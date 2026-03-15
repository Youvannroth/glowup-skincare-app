-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 15, 2026 at 08:00 AM
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
-- Database: `appglowup_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cleanser', '2026-03-07 01:29:34', '2026-03-07 01:29:34'),
(2, 'Serum', '2026-03-07 01:29:34', '2026-03-07 01:29:34'),
(3, 'Moisturizer', '2026-03-07 01:29:34', '2026-03-07 01:29:34'),
(4, 'Sunscreen', '2026-03-07 01:29:34', '2026-03-07 01:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_07_065400_create_personal_access_tokens_table', 1),
(5, '2026_03_07_065429_create_categories_table', 1),
(6, '2026_03_07_065430_create_products_table', 1),
(7, '2026_03_07_065431_create_orders_table', 1),
(8, '2026_03_07_065432_create_order_items_table', 1),
(9, '2026_03_07_093709_add_phone_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `phone`, `payment_method`, `total`, `created_at`, `updated_at`) VALUES
(10, NULL, 'RUPP Toul Kork', '061962562', 'Cash', 29.00, '2026-03-14 23:02:25', '2026-03-14 23:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(16, 10, 93, 1, 15.00, '2026-03-14 23:02:25', '2026-03-14 23:02:25'),
(17, 10, 107, 1, 14.00, '2026-03-14 23:02:25', '2026-03-14 23:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `skin_type` varchar(255) DEFAULT NULL,
  `key_ingredients` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image`, `skin_type`, `key_ingredients`, `created_at`, `updated_at`) VALUES
(93, 1, 'Manyo Cleanser', 'Gentle deep cleansing foam', 15.00, 'manyo_cleanser.png', 'All Skin Type', 'Herbal Extract', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(94, 1, 'Rice Water Foam', 'Oil skin cleansing foam', 15.00, 'rice_water.png', 'All Skin Type', 'Herbal Extract', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(95, 1, 'Joseon Green Plum', 'Refreshing cleansing foam', 15.00, 'green_plum.png', 'All Skin Type', 'Herbal Extract', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(96, 1, 'COSRX Cleanser', 'Low pH gentle morning cleanser', 18.00, 'cosrx_cleanser.png', 'All Skin Type', 'Tea Tree', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(97, 1, 'Anua Cleanser', 'Soothing calming cleanser', 16.00, 'anua_cleanser.png', 'All Skin Type', 'Heartleaf', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(98, 1, 'Skin1004 Cleanser', 'Gentle foam cleanser', 11.20, 'skin1004_cleanser.png', 'All Skin Type', 'Centella', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(99, 2, 'Anua Serum', 'Brightening serum for glowing skin', 16.00, 'anua_serum.png', 'All Skin Type', 'Niacinamide', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(100, 2, 'Torriden Serum', 'Hydrating serum for soft skin', 12.00, 'torriden_serum.png', 'All Skin Type', 'Hyaluronic Acid', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(101, 2, 'Klairs Serum', 'Brightening serum for even tone', 13.00, 'klairs_serum.png', 'All Skin Type', 'Vitamin C', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(102, 2, 'Vitamin E Serum', 'Anti-aging nourishing serum', 14.50, 'vitamin_e_serum.png', 'All Skin Type', 'Vitamin E', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(103, 2, 'Anya Peach Serum', 'Peach extract brightening serum', 15.00, 'anya_peach_serum.png', 'All Skin Type', 'Peach Extract', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(104, 2, 'Skin1004 Serum', 'Centella soothing serum', 17.00, 'skin1004_serum.png', 'All Skin Type', 'Centella', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(105, 3, 'Laneige Moisturizer', 'Hydrating cream for glowing skin', 18.00, 'laneige_moisturizer.png', 'Dry Skin', 'Water', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(106, 3, 'Belif Moisturizer', 'Long lasting hydration cream', 12.00, 'belif_moisturizer.png', 'All Skin Type', 'Herbal Extract', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(107, 3, 'Illiyoon Moisturizer', 'Barrier repair cream', 14.00, 'illiyoon_moisturizer.png', 'Dry Skin', 'Ceramide', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(108, 3, 'Dr Jart Moisturizer', 'Deep hydration cream', 20.00, 'drjart_moisturizer.png', 'Dry Skin', 'Ceramide', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(109, 3, 'Etude Moisturizer', 'Light soothing cream', 13.50, 'etude_moisturizer.png', 'Sensitive Skin', 'Panthenol', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(110, 3, 'Sulwhasoo Moisturizer', 'Luxury anti-aging cream', 32.00, 'sulwhasoo_moisturizer.png', 'Mature Skin', 'Ginseng', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(111, 4, 'Biore Sunscreen', 'Light sunscreen with strong UV protection', 12.00, 'biore_sunscreen.png', 'All Skin Type', 'UV Filters', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(112, 4, 'Canmake Sunscreen', 'Moisturizing sunscreen for daily use', 13.00, 'canmake_sunscreen.png', 'All Skin Type', 'UV Filters', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(113, 4, 'Skin Aqua Sunscreen', 'Watery lightweight sunscreen', 15.00, 'skin_aqua_sunscreen.png', 'All Skin Type', 'Water', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(114, 4, 'Sakura Sunscreen', 'Refreshing sunscreen lotion', 14.00, 'sakura_sunscreen.png', 'All Skin Type', 'Cherry Extract', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(115, 4, 'Anessa Sunscreen', 'Brightening UV protection sunscreen', 14.00, 'anessa_sunscreen.png', 'All Skin Type', 'Vitamin C', '2026-03-08 02:59:43', '2026-03-08 02:59:43'),
(116, 4, 'Yohou Sunscreen', 'Brightening UV protection sunscreen', 16.00, 'yohou_sunscreen.png', 'All Skin Type', 'Vitamin C', '2026-03-08 02:59:43', '2026-03-08 02:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Youvannroth', 'chanroth@gmail.com', '061962562', NULL, '$2y$12$POzZJ/uqWATICpwCBIoH6e0Dgwlq//rUyBCt/IpIiaBWJ4mcnnU/i', NULL, '2026-03-07 02:49:28', '2026-03-07 02:49:28'),
(4, 'loey', 'loey@gmail.com', '012345678', NULL, '$2y$12$bvOydp3tfekKEvnWMekC2OxfeD2BJsA23pQ51ugoaIRyuwDvvqexa', NULL, '2026-03-07 20:03:04', '2026-03-07 20:03:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
