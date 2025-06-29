-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2025 at 09:42 PM
-- Server version: 10.6.20-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-shop`
--
CREATE DATABASE IF NOT EXISTS `e-shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `e-shop`;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Welcome All', 'welcome-all', '/storage/photos/1/Banner/banner-06.jpg', '<p>This is the Day</p>', 'active', '2025-06-22 07:32:41', '2025-06-22 07:32:41'),
(2, 'This week is the best', 'this-week-is-the-best', '/storage/photos/1/Banner/banner-01.jpg', '<p>we\'re having special offers</p>', 'active', '2025-06-22 14:26:35', '2025-06-22 14:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nike', 'nike', 'active', '2025-06-22 08:05:33', '2025-06-22 08:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 150.00, 'new', 1, 150.00, '2025-06-22 11:27:50', '2025-06-22 11:45:36'),
(2, 1, 2, 3, 150.00, 'new', 1, 150.00, '2025-06-22 11:48:01', '2025-06-22 11:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Women’s Dress Category', 'organic-products', '<p data-start=\"233\" data-end=\"700\"><strong data-start=\"233\" data-end=\"249\">Description:</strong><br data-start=\"249\" data-end=\"252\">\r\nDiscover elegance and versatility in our collection of <strong data-start=\"307\" data-end=\"326\">women’s dresses</strong>—perfect for every occasion. From casual daytime looks to chic evening wear, our dresses are designed to flatter every silhouette. Choose from flowing maxi dresses, structured midi styles, playful mini dresses, and timeless wrap and bodycon designs. Whether you’re dressing for work, a wedding, or a weekend out, find the perfect fit and fabric to express your unique style.</p>', '/storage/photos/1/Products/0122b-wsd000t.jpg', 1, NULL, NULL, 'active', '2025-06-22 08:13:23', '2025-06-22 14:04:02'),
(2, 'Tops', 'tops', '<p>From everyday basics to statement blouses, explore stylish tops that pair perfectly with any bottom.</p>', '/storage/photos/1/Products/18b18-wbk003b.jpg', 1, NULL, NULL, 'active', '2025-06-22 14:05:39', '2025-06-22 14:05:39'),
(3, 'Outerwear', 'outerwear', '<p>Stay warm and stylish with jackets, blazers, and coats made for layering in every season.</p>', '/storage/photos/1/Products/0455e-c1.jpg', 1, NULL, NULL, 'active', '2025-06-22 14:06:41', '2025-06-22 14:06:41'),
(4, 'Activewear', 'activewear', '<p>Performance-ready leggings, sports bras, and tops designed for movement and motivation.</p>', '/storage/photos/1/Products/01f42-pwt004b.jpg', 0, 3, NULL, 'active', '2025-06-22 14:08:18', '2025-06-22 14:08:18'),
(5, 'Women’s Official Wear', 'womens-official-wear', '<p>Command confidence and style with our <strong data-start=\"295\" data-end=\"320\">Women’s Official Wear</strong> collection—tailored for the modern professional. Designed to blend sophistication with comfort, our selection features polished pieces perfect for the boardroom, interviews, and corporate events. From sleek blazers to tailored trousers, structured dresses, and smart blouses, each item is crafted to help you look sharp, feel empowered, and dress for success.</p>', '/storage/photos/1/Products/53b38-wsd013a.jpg', 1, NULL, NULL, 'active', '2025-06-22 14:11:41', '2025-06-22 14:11:41'),
(6, 'Men\'s Official Wear', 'mens-official-wear', '<p>Command confidence and style with our <strong data-start=\"295\" data-end=\"320\">Women’s Official Wear</strong> collection—tailored for the modern professional. Designed to blend sophistication with comfort, our selection features polished pieces perfect for the boardroom, interviews, and corporate events. From sleek blazers to tailored trousers, structured dresses, and smart blouses, each item is crafted to help you look sharp, feel empowered, and dress for success.</p>', '/storage/photos/1/Products/0455e-c1.jpg', 0, 5, NULL, 'active', '2025-06-22 14:13:18', '2025-06-22 14:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', 300.00, 'active', NULL, NULL),
(2, '111111', 'percent', 10.00, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2023_06_21_164432_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1659c4eb-44a6-43ca-a721-d567b2deaa80', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2025-06-22 12:09:46', '2025-06-22 11:49:20', '2025-06-22 12:09:46'),
('6d06f3a6-f366-42ca-8dea-976afe055459', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/dress\",\"fas\":\"fa-star\"}', '2025-06-26 03:39:10', '2025-06-22 14:23:43', '2025-06-26 03:39:10'),
('c69a0ee1-6872-4a85-a446-28cefa769393', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', '2025-06-22 12:10:29', '2025-06-22 11:45:34', '2025-06-22 12:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-UPQ6RKRI6H', 3, 150.00, NULL, NULL, 150.00, 1, 'cod', 'unpaid', 'delivered', 'Doughlas', 'Githui', 'githuiddoughlas8@gmail.com', '0702345567', 'KE', '12378', 'Nanyuki', 'Naromoru', '2025-06-22 11:45:24', '2025-06-22 11:47:18'),
(2, 'ORD-XWWHMQJJNG', 3, 150.00, NULL, NULL, 150.00, 1, 'paypal', 'paid', 'new', 'Doughlas', 'Githui', 'githuiddoughlas8@gmail.com', '0702345567', 'CN', '12378', 'Nanyuki', 'Naromoru', '2025-06-22 11:49:19', '2025-06-22 11:49:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'U.S. law enforcement agencies on high alert after strikes on Iran', 'us-law-enforcement-agencies-on-high-alert-after-strikes-on-iran', '<div class=\"wpds-c-PJLV article-body type-text\" data-qa=\"article-body\" style=\"color: rgb(255, 255, 255); font-family: Franklin, Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(32, 32, 32);\"><p data-apitype=\"text\" data-contentid=\"5QUBHS2CXNDIZEZQNGK2O7V5OE\" data-el=\"text\" class=\"wpds-c-heFNVF wpds-c-heFNVF-fTBRgi-isLiveArticle-true wpds-c-heFNVF-iPJLV-css overrideStyles font-copy\" dir=\"null\" data-scroll-pos=\"2\" data-scroll-measured=\"true\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: georgia, &quot;Times New Roman&quot;, serif; padding-bottom: 24px; line-height: 1.6; font-size: 1.25rem;\">Law enforcement agencies across the United States were on high alert after the U.S. carried out strikes on Iran, according to local leaders and police departments late Saturday.</p></div><div class=\"wpds-c-PJLV article-body type-text\" data-qa=\"article-body\" style=\"color: rgb(255, 255, 255); font-family: Franklin, Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(32, 32, 32);\"><p data-apitype=\"text\" data-contentid=\"MPY3RY2YFZDSVDLSCEJH27STC4\" data-el=\"text\" class=\"wpds-c-heFNVF wpds-c-heFNVF-fTBRgi-isLiveArticle-true wpds-c-heFNVF-iPJLV-css overrideStyles font-copy\" dir=\"null\" data-scroll-pos=\"3\" data-scroll-measured=\"true\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: georgia, &quot;Times New Roman&quot;, serif; padding-bottom: 24px; line-height: 1.6; font-size: 1.25rem;\">In Washington, police&nbsp;<a href=\"https://x.com/DCPoliceDept/status/1936600174073098399\" target=\"_blank\" style=\"color: rgb(255, 255, 255); text-decoration-line: underline; text-decoration-thickness: 0.0625em; text-decoration-color: rgb(255, 255, 255); border-bottom: 0px; text-underline-offset: 0.125em;\">said</a>&nbsp;they were maintaining an increased presence at religious institutions across the city, although there were no known threats. The department was actively coordinating with local, state and federal agencies, it said.</p></div>', '<div class=\"wpds-c-PJLV article-body type-text\" data-qa=\"article-body\" style=\"color: rgb(255, 255, 255); font-family: Franklin, Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(32, 32, 32);\"><p data-apitype=\"text\" data-contentid=\"5QUBHS2CXNDIZEZQNGK2O7V5OE\" data-el=\"text\" class=\"wpds-c-heFNVF wpds-c-heFNVF-fTBRgi-isLiveArticle-true wpds-c-heFNVF-iPJLV-css overrideStyles font-copy\" dir=\"null\" data-scroll-pos=\"2\" data-scroll-measured=\"true\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: georgia, &quot;Times New Roman&quot;, serif; padding-bottom: 24px; line-height: 1.6; font-size: 1.25rem;\">Law enforcement agencies across the United States were on high alert after the U.S. carried out strikes on Iran, according to local leaders and police departments late Saturday.</p></div><div class=\"wpds-c-PJLV article-body type-text\" data-qa=\"article-body\" style=\"color: rgb(255, 255, 255); font-family: Franklin, Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(32, 32, 32);\"><p data-apitype=\"text\" data-contentid=\"MPY3RY2YFZDSVDLSCEJH27STC4\" data-el=\"text\" class=\"wpds-c-heFNVF wpds-c-heFNVF-fTBRgi-isLiveArticle-true wpds-c-heFNVF-iPJLV-css overrideStyles font-copy\" dir=\"null\" data-scroll-pos=\"3\" data-scroll-measured=\"true\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: georgia, &quot;Times New Roman&quot;, serif; padding-bottom: 24px; line-height: 1.6; font-size: 1.25rem;\">In Washington, police&nbsp;<a href=\"https://x.com/DCPoliceDept/status/1936600174073098399\" target=\"_blank\" style=\"color: rgb(255, 255, 255); text-decoration-line: underline; text-decoration-thickness: 0.0625em; text-decoration-color: rgb(255, 255, 255); border-bottom: 0px; text-underline-offset: 0.125em;\">said</a>&nbsp;they were maintaining an increased presence at religious institutions across the city, although there were no known threats. The department was actively coordinating with local, state and federal agencies, it said.</p></div>', '<div class=\"wpds-c-PJLV article-body type-text\" data-qa=\"article-body\" style=\"color: rgb(255, 255, 255); font-family: Franklin, Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(32, 32, 32);\"><p data-apitype=\"text\" data-contentid=\"5QUBHS2CXNDIZEZQNGK2O7V5OE\" data-el=\"text\" class=\"wpds-c-heFNVF wpds-c-heFNVF-fTBRgi-isLiveArticle-true wpds-c-heFNVF-iPJLV-css overrideStyles font-copy\" dir=\"null\" data-scroll-pos=\"2\" data-scroll-measured=\"true\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: georgia, &quot;Times New Roman&quot;, serif; padding-bottom: 24px; line-height: 1.6; font-size: 1.25rem;\">Law enforcement agencies across the United States were on high alert after the U.S. carried out strikes on Iran, according to local leaders and police departments late Saturday.</p></div><div class=\"wpds-c-PJLV article-body type-text\" data-qa=\"article-body\" style=\"color: rgb(255, 255, 255); font-family: Franklin, Arial, Helvetica, sans-serif; font-size: medium; background-color: rgb(32, 32, 32);\"><p data-apitype=\"text\" data-contentid=\"MPY3RY2YFZDSVDLSCEJH27STC4\" data-el=\"text\" class=\"wpds-c-heFNVF wpds-c-heFNVF-fTBRgi-isLiveArticle-true wpds-c-heFNVF-iPJLV-css overrideStyles font-copy\" dir=\"null\" data-scroll-pos=\"3\" data-scroll-measured=\"true\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: georgia, &quot;Times New Roman&quot;, serif; padding-bottom: 24px; line-height: 1.6; font-size: 1.25rem;\">In Washington, police&nbsp;<a href=\"https://x.com/DCPoliceDept/status/1936600174073098399\" target=\"_blank\" style=\"color: rgb(255, 255, 255); text-decoration-line: underline; text-decoration-thickness: 0.0625em; text-decoration-color: rgb(255, 255, 255); border-bottom: 0px; text-underline-offset: 0.125em;\">said</a>&nbsp;they were maintaining an increased presence at religious institutions across the city, although there were no known threats. The department was actively coordinating with local, state and federal agencies, it said.</p></div>', '/storage/photos/1/Blog/blog-single1.jpg', '', 1, NULL, 1, 'active', '2025-06-22 09:02:05', '2025-06-22 09:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'News', 'news', 'active', '2025-06-22 09:00:21', '2025-06-22 09:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'News', 'news', 'active', '2025-06-22 10:21:38', '2025-06-22 10:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Dress', 'dress', '<p>sfdddddghhh</p>', '<p>wefergtdddddrrrrrff</p>', '/storage/photos/1/Products/0122b-wsd000t.jpg', 344, 'S,M', 'new', 'active', 200.00, 25.00, 1, 1, NULL, 1, '2025-06-22 10:58:12', '2025-06-22 11:47:18'),
(2, 'Men’s Classic Slim-Fit Stretch Chinos', 'mens-classic-slim-fit-stretch-chinos', '<p data-start=\"247\" data-end=\"525\">Elevate your everyday style with our <strong data-start=\"284\" data-end=\"319\">Classic Slim-Fit Stretch Chinos</strong> – the perfect balance of comfort, versatility, and modern design. Crafted from a high-quality cotton-spandex blend, these pants offer a tailored look with just the right amount of stretch for all-day wear.</p><p data-start=\"527\" data-end=\"792\">Whether you\'re heading to the office, a casual outing, or a weekend event, these chinos keep you looking sharp without compromising on comfort. The <strong data-start=\"675\" data-end=\"696\">flat-front design</strong>, <strong data-start=\"698\" data-end=\"725\">functional side pockets</strong>, and <strong data-start=\"731\" data-end=\"761\">buttoned back welt pockets</strong> add both function and finesse.</p><p>\r\n\r\n</p><p data-start=\"794\" data-end=\"924\">Available in a range of classic and seasonal colors, these pants pair effortlessly with anything from dress shirts to casual tees.</p>', '<h3 data-start=\"931\" data-end=\"948\"><strong data-start=\"935\" data-end=\"948\">Features:</strong></h3><p>\r\n</p><ul data-start=\"950\" data-end=\"1185\">\r\n<li data-start=\"950\" data-end=\"1016\">\r\n<p data-start=\"952\" data-end=\"1016\">Slim fit – tailored through the thigh and tapered at the ankle</p>\r\n</li>\r\n<li data-start=\"1017\" data-end=\"1069\">\r\n<p data-start=\"1019\" data-end=\"1069\">Stretch fabric for enhanced mobility and comfort</p>\r\n</li>\r\n<li data-start=\"1070\" data-end=\"1101\">\r\n<p data-start=\"1072\" data-end=\"1101\">Zip fly with button closure</p>\r\n</li>\r\n<li data-start=\"1102\" data-end=\"1137\">\r\n<p data-start=\"1104\" data-end=\"1137\">Belt loops and reinforced seams</p>\r\n</li>\r\n<li data-start=\"1138\" data-end=\"1158\">\r\n<p data-start=\"1140\" data-end=\"1158\">Machine washable</p>\r\n</li>\r\n<li data-start=\"1159\" data-end=\"1185\">\r\n<p data-start=\"1161\" data-end=\"1185\">Available in sizes 28–40</p></li></ul>', '/storage/photos/1/Products/01bc5-mpd006b.jpg', 230, 'S,M,L', 'hot', 'active', 250.00, 10.00, 1, 1, NULL, 1, '2025-06-22 14:00:11', '2025-06-22 14:00:11'),
(3, 'Blazers & Jackets', 'blazers-jackets', '<p>Sharp tailoring and versatile cuts—ideal for layering and adding a professional edge to any outfit.</p>', '<p>Sharp tailoring and versatile cuts—ideal for layering and adding a professional edge to any outfit.</p>', '/storage/photos/1/Products/09a16-mpd000t_6.jpg', 2300, 'S,M', 'hot', 'active', 220.00, 5.00, 1, 5, 6, 1, '2025-06-22 14:16:04', '2025-06-22 14:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 'Very good product and of high quality', 'active', '2025-06-22 14:23:42', '2025-06-22 14:23:42');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo.png', '/storage/photos/1/users/2cc83283fa069271e09da6de18a1f837.jpg', '10340 Machakos', '0707264913', 'githuiddoughlas8@gmail.com', NULL, '2025-06-22 06:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fruits', 3200.00, 'active', '2025-06-22 08:55:41', '2025-06-22 08:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$Ib0Id1c293j7G/mrD3dxUOhwqjuhYAIZkn5NtSh4rahe8.v.1NXW6', NULL, 'admin', NULL, NULL, 'active', 'zAKAHWuppNNedraGfilgN8JkOUqMvUALdtJol9zhoXIAAyUoEOD175kZjy1l', NULL, NULL),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$8dvXCSrMLDlgoKGugpn7HuhuQ9QAuZXgIKIr30JADVBoQhJvTAZR.', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL),
(3, 'Doughlas Githui', 'githuiddoughlas8@gmail.com', NULL, '$2y$10$WlhEroJaBSFuirWoa7ux4eBtwOkgADnUCrb8X2PFKfbb6UxW9wr9i', NULL, 'user', NULL, NULL, 'active', NULL, '2025-06-22 11:00:35', '2025-06-22 11:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, 150.00, 1, 150.00, '2025-06-22 11:28:30', '2025-06-22 11:48:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
--
-- Database: `employee_data`
--
CREATE DATABASE IF NOT EXISTS `employee_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `employee_data`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(30) DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `status`) VALUES
(3, 'Emp11', '2025-03-11', 'Absent'),
(4, 'Emp10', '2025-03-11', 'Present'),
(5, 'Emp11', '2025-03-11', 'Present'),
(6, 'Emp10', '2025-03-11', 'Present'),
(7, 'Emp13', '2025-03-11', 'Present'),
(8, 'Emp13', '2025-03-11', 'Present'),
(9, 'Emp13', '2025-03-11', 'Present'),
(10, 'Emp13', '2025-03-12', 'Absent'),
(11, 'Emp13', '2025-03-12', 'Absent'),
(12, 'Emp12', '2025-03-12', 'Present'),
(13, 'Emp13', '2025-03-12', 'Absent'),
(14, 'Emp13', '2025-03-12', 'Absent'),
(15, 'Emp5', '2025-03-12', 'Present'),
(16, 'Emp6', '2025-03-12', 'Absent'),
(17, 'Emp15', '2025-03-12', 'Present'),
(18, 'Emp13', '2025-03-13', 'Present'),
(19, 'Emp6', '2025-03-13', 'Absent'),
(20, 'Emp6', '2025-03-13', 'Present'),
(21, 'Emp6', '2025-03-13', 'Absent'),
(23, 'Emp13', '2025-03-14', 'Absent'),
(24, 'Emp13', '2025-03-15', 'Present'),
(25, 'Emp13', '0000-00-00', 'Absent'),
(28, 'Emp13', '2025-03-17', 'Absent'),
(30, 'Emp13', '0003-12-25', 'Absent'),
(32, 'Emp13', '2025-03-18', 'Present'),
(35, 'Emp3', '2025-03-18', 'Absent'),
(36, 'Emp17', '2025-03-20', 'Present'),
(37, 'Emp13', '2025-03-30', 'Absent'),
(38, 'Emp13', '2025-03-31', 'Absent'),
(39, 'Emp18', '2025-03-31', 'Present'),
(40, 'Emp13', '2025-05-12', 'Present'),
(41, 'Emp13', '2025-05-11', 'Absent');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `Id` varchar(30) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Deductions` decimal(10,2) DEFAULT NULL,
  `NetPay` decimal(10,2) DEFAULT NULL,
  `PayrollDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`Id`, `Name`, `Phone`, `Role`, `Gender`, `Salary`, `Deductions`, `NetPay`, `PayrollDate`) VALUES
('Emp1', 'Eliud Mathu', '078956345', 'Network Engineer', 'Male', 127000.00, 5000.00, 122000.00, '2025-03-13'),
('Emp10', 'Lilian Ngima', '079374676', 'IT Consultant', 'Female', 125000.00, 8500.00, 116500.00, '2025-03-10'),
('Emp11', 'Jane Gathoni', '078658393', 'Web Developer', 'Female', 160000.00, 4500.00, 155500.00, '2025-03-10'),
('Emp12', 'Esther Muthoni', '079564732', 'UI/UX Developer', 'Female', 250000.00, 40000.00, 210000.00, '2025-03-10'),
('Emp13', 'Doughlas Githui', '0701361741', 'Web Developer', 'Male', 234000.00, 50000.00, 184000.00, '2025-03-11'),
('Emp15', 'Camaviga James', '0712345678', 'Technical Writer', 'Male', 120000.00, 38000.00, 82000.00, '2025-03-12'),
('Emp17', 'Aden Smith', '0708187778', 'Business Analyst', 'Male', 200000.00, 50000.00, 150000.00, '2025-03-20'),
('Emp18', 'Caleb', '0700456456', 'Business Analyst', 'Male', 32000.00, 1000.00, 31000.00, '2025-03-31'),
('Emp2', 'Alex Wambua', '073456345', 'Data Analyst', 'Male', 122400.00, 20400.00, 102000.00, '2025-03-10'),
('Emp3', 'Noah Gizzy', '076859543', 'Web Developer', 'Male', 123456.00, 56700.00, 66756.00, '2025-03-10'),
('Emp4', 'Peter Kingori', '070234567', 'Business Analyst', 'Male', 567000.00, 56000.00, 511000.00, '2025-03-10'),
('Emp5', 'Ukoo Mkuu', '075647323', 'Web Developer', 'Male', 123455.00, 23000.00, 100455.00, '2025-03-10'),
('Emp6', 'Jacob Adan', '078954643', 'IT Consultant', 'Male', 564000.00, 40000.00, 524000.00, '2025-03-10'),
('Emp8', 'Enock Mwangi', '078945634', 'Business Analyst', 'Male', 120000.00, 6000.00, 114000.00, '2025-03-10'),
('Emp9', 'Mercy Gicharu', '074536785', 'UI/UX Developer', 'Female', 123000.00, 20000.00, 103000.00, '2025-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `role` enum('Admin','Employee') NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `name`, `phone`, `role`, `password_hash`) VALUES
(1, 'EMP001', 'Admin User', '0712345678', 'Admin', '$2b$12$.vaj6GQBEQ.LQEJYgO2cC.cML5QQAvAA5daIGw5T8gDwTU9uqIcf6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `data` (`Id`) ON DELETE CASCADE;
--
-- Database: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `admin_name`, `admin_pass`) VALUES
(1, 'admin', 'admin123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `mwala_tvc`
--
CREATE DATABASE IF NOT EXISTS `mwala_tvc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mwala_tvc`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add administration', 7, 'add_administration'),
(26, 'Can change administration', 7, 'change_administration'),
(27, 'Can delete administration', 7, 'delete_administration'),
(28, 'Can view administration', 7, 'view_administration'),
(29, 'Can add course', 8, 'add_course'),
(30, 'Can change course', 8, 'change_course'),
(31, 'Can delete course', 8, 'delete_course'),
(32, 'Can view course', 8, 'view_course'),
(33, 'Can add notice', 9, 'add_notice'),
(34, 'Can change notice', 9, 'change_notice'),
(35, 'Can delete notice', 9, 'delete_notice'),
(36, 'Can view notice', 9, 'view_notice'),
(37, 'Can add department', 10, 'add_department'),
(38, 'Can change department', 10, 'change_department'),
(39, 'Can delete department', 10, 'delete_department'),
(40, 'Can view department', 10, 'view_department'),
(41, 'Can add supporting department', 11, 'add_supportingdepartment'),
(42, 'Can change supporting department', 11, 'change_supportingdepartment'),
(43, 'Can delete supporting department', 11, 'delete_supportingdepartment'),
(44, 'Can view supporting department', 11, 'view_supportingdepartment'),
(45, 'Can add jobs vacancies', 12, 'add_jobsvacancies'),
(46, 'Can change jobs vacancies', 12, 'change_jobsvacancies'),
(47, 'Can delete jobs vacancies', 12, 'delete_jobsvacancies'),
(48, 'Can view jobs vacancies', 12, 'view_jobsvacancies'),
(49, 'Can add image gallery', 13, 'add_imagegallery'),
(50, 'Can change image gallery', 13, 'change_imagegallery'),
(51, 'Can delete image gallery', 13, 'delete_imagegallery'),
(52, 'Can view image gallery', 13, 'view_imagegallery'),
(53, 'Can add news', 14, 'add_news'),
(54, 'Can change news', 14, 'change_news'),
(55, 'Can delete news', 14, 'delete_news'),
(56, 'Can view news', 14, 'view_news'),
(57, 'Can add student affairs', 15, 'add_studentaffairs'),
(58, 'Can change student affairs', 15, 'change_studentaffairs'),
(59, 'Can delete student affairs', 15, 'delete_studentaffairs'),
(60, 'Can view student affairs', 15, 'view_studentaffairs'),
(61, 'Can add contact', 16, 'add_contact'),
(62, 'Can change contact', 16, 'change_contact'),
(63, 'Can delete contact', 16, 'delete_contact'),
(64, 'Can view contact', 16, 'view_contact'),
(65, 'Can add feedback', 17, 'add_feedback'),
(66, 'Can change feedback', 17, 'change_feedback'),
(67, 'Can delete feedback', 17, 'delete_feedback'),
(68, 'Can view feedback', 17, 'view_feedback'),
(69, 'Can add admission application', 18, 'add_admissionapplication'),
(70, 'Can change admission application', 18, 'change_admissionapplication'),
(71, 'Can delete admission application', 18, 'delete_admissionapplication'),
(72, 'Can view admission application', 18, 'view_admissionapplication'),
(73, 'Can add tenders', 19, 'add_tenders'),
(74, 'Can change tenders', 19, 'change_tenders'),
(75, 'Can delete tenders', 19, 'delete_tenders'),
(76, 'Can view tenders', 19, 'view_tenders'),
(77, 'Can add brochures', 20, 'add_brochures'),
(78, 'Can change brochures', 20, 'change_brochures'),
(79, 'Can delete brochures', 20, 'delete_brochures'),
(80, 'Can view brochures', 20, 'view_brochures');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$p08NsCacAlkJTyfZxj3KWj$LRkBXv9ORpZOUst28W/cD3gY9TwOEATKgFCI57Zbry0=', '2025-01-15 05:21:13.215000', 1, 'Mwala', '', '', '', 1, 1, '2025-01-04 13:19:53.641000'),
(2, 'pbkdf2_sha256$870000$az5MHhvg2cHaDGSiiyNAhz$0cD2T3vU0fWP21vFXLFHssS9Q5inCgznmAo8iEnCbS4=', '2025-05-12 07:50:46.420000', 1, 'Mwalaadmin', '', '', '', 1, 1, '2025-02-20 10:17:33.108000'),
(3, 'pbkdf2_sha256$870000$ahulsYRCaJ21IoBF1WsHwX$Vv1No7IwOW+NVMJpTrtekC8KSfSoi+dDeD4bvwI+KfM=', '2025-06-12 20:58:40.632000', 1, 'Mwalatvc', '', '', '', 1, 1, '2025-04-03 16:13:56.107000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-01-04 13:24:26.884000', '1', 'John Mwangi - Principal', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-01-04 13:45:47.058000', '2', 'Lilian Ngima - Deputy Principal', 1, '[{\"added\": {}}]', 7, 1),
(3, '2025-01-04 17:09:05.968000', '1', 'New course', 1, '[{\"added\": {}}]', 8, 1),
(4, '2025-01-04 17:21:31.965000', '2', 'Plumbing', 1, '[{\"added\": {}}]', 8, 1),
(5, '2025-01-04 17:24:05.103000', '3', 'Financial Accounting', 1, '[{\"added\": {}}]', 8, 1),
(6, '2025-01-04 17:25:09.365000', '4', 'Welding', 1, '[{\"added\": {}}]', 8, 1),
(7, '2025-01-04 17:26:44.841000', '5', 'Catering', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-01-04 18:50:53.916000', '6', 'Electrical', 1, '[{\"added\": {}}]', 8, 1),
(9, '2025-01-04 19:00:04.443000', '6', 'Electrical', 2, '[]', 8, 1),
(10, '2025-01-04 19:00:26.816000', '3', 'Financial Accounting', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(11, '2025-01-04 19:00:41.216000', '2', 'Plumbing', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(12, '2025-01-04 19:00:54.793000', '1', 'ICT', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(13, '2025-01-05 15:48:13.824000', '1', 'Training Timetable (Sep -Dec)', 1, '[{\"added\": {}}]', 9, 1),
(14, '2025-01-05 16:08:05.323000', '2', 'Ball Games (Girls & Boys)', 1, '[{\"added\": {}}]', 9, 1),
(15, '2025-01-05 16:08:32.182000', '3', 'Collage Principals Meeting', 1, '[{\"added\": {}}]', 9, 1),
(16, '2025-01-05 16:08:45.789000', '4', 'Students Forum', 1, '[{\"added\": {}}]', 9, 1),
(17, '2025-01-05 16:09:16.508000', '5', 'ICT & Business Department Trip', 1, '[{\"added\": {}}]', 9, 1),
(18, '2025-01-05 16:09:57.299000', '6', 'Agricultural Day', 1, '[{\"added\": {}}]', 9, 1),
(19, '2025-01-05 16:10:18.916000', '7', 'KATTI Drama Festivals', 1, '[{\"added\": {}}]', 9, 1),
(20, '2025-01-06 11:15:45.161000', '7', 'Mechanical Engineering', 1, '[{\"added\": {}}]', 8, 1),
(21, '2025-01-06 13:25:29.274000', '1', 'ICT & Business Department', 1, '[{\"added\": {}}]', 10, 1),
(22, '2025-01-06 13:27:34.956000', '2', 'Mechanical Department', 1, '[{\"added\": {}}]', 10, 1),
(23, '2025-01-06 13:28:49.456000', '3', 'Catering & Accommodation Department', 1, '[{\"added\": {}}]', 10, 1),
(24, '2025-01-06 13:49:18.361000', '2', 'Mechanical Department', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(25, '2025-01-06 13:55:54.529000', '2', 'Mechanical Department', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(26, '2025-01-06 13:56:26.301000', '2', 'Mechanical Department', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(27, '2025-01-06 14:43:42.561000', '7', 'Mechanical Engineering', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 8, 1),
(28, '2025-01-06 14:44:12.944000', '6', 'Electrical', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 8, 1),
(29, '2025-01-06 14:44:35.689000', '5', 'Catering', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 8, 1),
(30, '2025-01-06 14:44:53.422000', '4', 'Welding', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 8, 1),
(31, '2025-01-06 14:45:18.519000', '2', 'Plumbing', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 8, 1),
(32, '2025-01-06 15:42:30.061000', '1', 'sports', 1, '[{\"added\": {}}]', 11, 1),
(33, '2025-01-06 16:34:05.425000', '2', 'Examination', 1, '[{\"added\": {}}]', 11, 1),
(34, '2025-01-06 16:36:23.657000', '3', 'Procurement', 1, '[{\"added\": {}}]', 11, 1),
(35, '2025-01-06 17:45:17.326000', '2', 'Examination', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(36, '2025-01-09 15:10:36.107000', '1', 'Deputy Principal', 1, '[{\"added\": {}}]', 12, 1),
(37, '2025-01-09 17:17:57.536000', '2', 'Trainer', 1, '[{\"added\": {}}]', 12, 1),
(38, '2025-01-09 17:19:11.731000', '2', 'Trainer', 2, '[]', 12, 1),
(39, '2025-01-09 17:23:09.701000', '1', 'Deputy Principal', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 12, 1),
(40, '2025-01-09 17:24:37.909000', '2', 'Trainer', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 12, 1),
(41, '2025-01-09 17:27:24.390000', '3', 'Watchman', 1, '[{\"added\": {}}]', 12, 1),
(42, '2025-01-09 17:29:23.767000', '1', 'Training Timetable (Sep -Dec)', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(43, '2025-01-09 17:35:53.742000', '1', 'Training Timetable (Sep -Dec)', 2, '[]', 9, 1),
(44, '2025-01-10 06:41:25.135000', '2', 'Ball Games (Girls & Boys)', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(45, '2025-01-10 10:07:37.697000', '1', '2025-01-10', 1, '[{\"added\": {}}]', 13, 1),
(46, '2025-01-10 10:07:54.795000', '2', '2025-01-06', 1, '[{\"added\": {}}]', 13, 1),
(47, '2025-01-10 10:08:08.071000', '3', '2025-01-10', 1, '[{\"added\": {}}]', 13, 1),
(48, '2025-01-10 10:08:21.803000', '4', '2025-01-10', 1, '[{\"added\": {}}]', 13, 1),
(49, '2025-01-10 10:08:36.774000', '5', '2025-01-10', 1, '[{\"added\": {}}]', 13, 1),
(50, '2025-01-10 13:21:14.143000', '1', 'Deputy Principal, The college had a strategic meeting with the Assistant County Commissioner and Chiefs to chat the way forward in boosting the population of the college. This is the fourth time the t', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 12, 1),
(51, '2025-01-10 13:22:01.460000', '1', 'Deputy Principal', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 12, 1),
(52, '2025-01-11 05:23:07.525000', '1', 'Computer lab Launching', 1, '[{\"added\": {}}]', 14, 1),
(53, '2025-01-11 06:00:05.231000', '1', 'Computer lab Launching', 2, '[{\"changed\": {\"fields\": [\"Video attachment\"]}}]', 14, 1),
(54, '2025-01-11 06:37:52.028000', '2', 'Awarding National Gnvt.', 1, '[{\"added\": {}}]', 14, 1),
(55, '2025-01-11 06:47:38.763000', '3', 'Mechanical Department Celebration.', 1, '[{\"added\": {}}]', 14, 1),
(56, '2025-01-11 07:34:00.657000', '8', 'fee structure', 1, '[{\"added\": {}}]', 9, 1),
(57, '2025-01-11 08:24:10.519000', '9', 'games', 1, '[{\"added\": {}}]', 9, 1),
(58, '2025-01-11 08:26:01.186000', '9', 'games', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(59, '2025-01-11 08:51:05.708000', '8', 'fee structure', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(60, '2025-01-11 09:24:19.746000', '1', 'Guidance & Counseling', 1, '[{\"added\": {}}]', 15, 1),
(61, '2025-01-11 16:02:56.367000', '1', 'Guidance & Counseling', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(62, '2025-01-11 16:03:52.854000', '1', 'Guidance & Counseling', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(63, '2025-01-11 16:07:53.467000', '2', 'Clubs & societies', 1, '[{\"added\": {}}]', 15, 1),
(64, '2025-01-11 16:09:54.981000', '3', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(65, '2025-01-11 16:09:55.141000', '4', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(66, '2025-01-11 16:09:55.265000', '5', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(67, '2025-01-11 16:09:55.391000', '6', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(68, '2025-01-11 16:09:55.527000', '7', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(69, '2025-01-11 16:09:55.690000', '8', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(70, '2025-01-11 16:09:55.865000', '9', 'Hostels & Accommodation', 1, '[{\"added\": {}}]', 15, 1),
(71, '2025-01-11 16:10:46.148000', '9', 'Hostels & Accommodation', 3, '', 15, 1),
(72, '2025-01-11 16:10:46.148000', '8', 'Hostels & Accommodation', 3, '', 15, 1),
(73, '2025-01-11 16:10:46.148000', '7', 'Hostels & Accommodation', 3, '', 15, 1),
(74, '2025-01-11 16:10:46.148000', '6', 'Hostels & Accommodation', 3, '', 15, 1),
(75, '2025-01-11 16:10:46.148000', '5', 'Hostels & Accommodation', 3, '', 15, 1),
(76, '2025-01-11 16:10:46.148000', '4', 'Hostels & Accommodation', 3, '', 15, 1),
(77, '2025-01-11 16:12:50.036000', '10', 'Students Leadership', 1, '[{\"added\": {}}]', 15, 1),
(78, '2025-01-11 16:13:59.778000', '10', 'Students Leadership', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(79, '2025-01-11 16:25:51.518000', '2', 'application_form', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(80, '2025-01-11 16:25:51.896000', '2', 'application_form', 2, '[]', 9, 1),
(81, '2025-01-11 16:34:41.368000', '2', 'application_form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(82, '2025-01-11 16:40:39.274000', '10', 'app_form', 1, '[{\"added\": {}}]', 9, 1),
(83, '2025-01-11 16:49:20.797000', '2', 'application_form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(84, '2025-01-11 16:50:08.587000', '10', 'app_form', 3, '', 9, 1),
(85, '2025-01-11 16:52:15.592000', '2', 'application_form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(86, '2025-01-11 18:47:36.253000', '3', 'Jane - muli@gmail.com', 3, '', 16, 1),
(87, '2025-01-11 18:47:36.253000', '2', 'Jane - muli@gmail.com', 3, '', 16, 1),
(88, '2025-01-11 18:47:36.253000', '1', 'Muthoni - murage8@gmail.com', 3, '', 16, 1),
(89, '2025-01-12 17:11:31.740000', '2', 'FAITH Mwangi - ICT', 3, '', 18, 1),
(90, '2025-01-13 17:07:17.477000', '1', 'Mwala', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(91, '2025-01-14 11:50:00.830000', '1', 'Mwala', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(92, '2025-01-14 13:04:34.621000', '10', 'Students Leadership', 2, '[]', 15, 1),
(93, '2025-01-14 20:56:54.479000', '5', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 13, 1),
(94, '2025-01-14 20:57:44.326000', '1', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 13, 1),
(95, '2025-01-15 05:23:15.585000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Hod message\"]}}]', 10, 1),
(96, '2025-01-15 15:23:07.956000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(97, '2025-01-15 15:23:09.907000', '3', 'Catering & Accommodation Department', 2, '[]', 10, 1),
(98, '2025-01-15 15:31:49.416000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(99, '2025-01-15 15:33:39.094000', '1', 'John Mwangi - Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(100, '2025-01-15 15:41:56.544000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Hod message\"]}}]', 10, 1),
(101, '2025-01-15 15:50:16.817000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(102, '2025-01-15 16:18:14.786000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(103, '2025-01-15 16:24:46.767000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(104, '2025-01-15 16:38:56.709000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(105, '2025-01-15 16:39:39.399000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(106, '2025-01-15 16:46:22.782000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(107, '2025-01-15 16:48:13.156000', '3', 'Catering & Accommodation Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(108, '2025-01-15 16:51:50.537000', '3', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 10, 1),
(109, '2025-01-15 17:02:48.608000', '3', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(110, '2025-01-15 17:07:21.139000', '7', 'Mechanical Engineering', 3, '', 8, 1),
(111, '2025-01-15 17:07:21.139000', '6', 'Electrical', 3, '', 8, 1),
(112, '2025-01-15 17:07:21.139000', '5', 'Catering', 3, '', 8, 1),
(113, '2025-01-15 17:07:21.139000', '4', 'Welding', 3, '', 8, 1),
(114, '2025-01-15 17:07:21.139000', '3', 'Financial Accounting', 3, '', 8, 1),
(115, '2025-01-15 17:07:21.139000', '2', 'Plumbing', 3, '', 8, 1),
(116, '2025-01-15 17:07:21.139000', '1', 'ICT', 3, '', 8, 1),
(117, '2025-01-15 17:10:20.785000', '8', 'Tourism Management', 1, '[{\"added\": {}}]', 8, 1),
(118, '2025-01-15 17:13:09.229000', '9', 'Tourism Management', 1, '[{\"added\": {}}]', 8, 1),
(119, '2025-01-15 17:17:38.760000', '10', 'Food and Beverage production', 1, '[{\"added\": {}}]', 8, 1),
(120, '2025-01-15 17:18:29.056000', '11', 'Food and Beverage production', 1, '[{\"added\": {}}]', 8, 1),
(121, '2025-01-15 17:19:34.198000', '12', 'Food and Beverage Sales and service', 1, '[{\"added\": {}}]', 8, 1),
(122, '2025-01-15 17:20:15.516000', '13', 'Food and Beverage Sales and service', 1, '[{\"added\": {}}]', 8, 1),
(123, '2025-01-15 17:25:12.661000', '13', 'Food and Beverage Sales and service', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(124, '2025-01-15 17:26:09.109000', '12', 'Food and Beverage Sales and service', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(125, '2025-01-15 17:26:25.644000', '11', 'Food and Beverage production', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(126, '2025-01-15 17:26:42.138000', '10', 'Food and Beverage production', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(127, '2025-01-15 17:27:02.547000', '9', 'Tourism Management', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(128, '2025-01-15 17:27:31.736000', '8', 'Tourism Management', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(129, '2025-01-15 17:29:31.455000', '14', 'Fashion and Design', 1, '[{\"added\": {}}]', 8, 1),
(130, '2025-01-15 17:30:09.936000', '15', 'Fashion and Design', 1, '[{\"added\": {}}]', 8, 1),
(131, '2025-01-15 17:31:11.063000', '16', 'Hairdressing and Beauty (cosmetology)', 1, '[{\"added\": {}}]', 8, 1),
(132, '2025-01-15 17:31:42.453000', '17', 'Hairdressing and Beauty (cosmetology)', 1, '[{\"added\": {}}]', 8, 1),
(133, '2025-01-15 17:52:48.937000', '3', 'Hospitality', 2, '[]', 10, 1),
(134, '2025-01-15 17:55:13.750000', '3', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(135, '2025-01-15 17:55:49.721000', '3', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(136, '2025-01-15 17:56:30.397000', '3', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(137, '2025-01-15 18:04:27.041000', '3', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(138, '2025-01-15 18:18:35.213000', '2', 'the department of agriculture and applied sciences', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Image\", \"Description\", \"Hod name\", \"Hod message\"]}}]', 10, 1),
(139, '2025-01-15 18:25:58.060000', '2', 'the department of agriculture and applied sciences', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(140, '2025-01-15 18:29:08.923000', '18', 'Agricultural extension', 1, '[{\"added\": {}}]', 8, 1),
(141, '2025-01-15 18:29:58.023000', '19', 'Agricultural extension', 1, '[{\"added\": {}}]', 8, 1),
(142, '2025-01-15 18:32:29.146000', '20', 'Agricultural extension', 1, '[{\"added\": {}}]', 8, 1),
(143, '2025-01-15 18:32:56.541000', '18', 'Agricultural extension', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(144, '2025-01-15 18:34:20.839000', '21', 'Sustainable agriculture', 1, '[{\"added\": {}}]', 8, 1),
(145, '2025-01-15 18:35:25.522000', '21', 'Sustainable agriculture', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(146, '2025-01-15 18:36:53.678000', '22', 'Sustainable agriculture', 1, '[{\"added\": {}}]', 8, 1),
(147, '2025-01-15 18:37:28.810000', '22', 'Sustainable agriculture', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(148, '2025-01-15 18:38:01.572000', '22', 'Sustainable agriculture', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(149, '2025-01-15 18:41:10.825000', '23', 'Agricultural economics', 1, '[{\"added\": {}}]', 8, 1),
(150, '2025-01-15 18:41:58.122000', '24', 'Agricultural economics', 1, '[{\"added\": {}}]', 8, 1),
(151, '2025-01-15 18:43:43.011000', '25', 'Dairy farm management', 1, '[{\"added\": {}}]', 8, 1),
(152, '2025-01-15 18:45:07.566000', '26', 'Dairy farm management', 1, '[{\"added\": {}}]', 8, 1),
(153, '2025-01-15 18:47:52.380000', '27', 'Analytical chemistry', 1, '[{\"added\": {}}]', 8, 1),
(154, '2025-01-15 18:48:39.343000', '28', 'Diploma in science laboratory technology', 1, '[{\"added\": {}}]', 8, 1),
(155, '2025-01-15 18:49:24.505000', '29', 'Certificate  in science laboratory technology', 1, '[{\"added\": {}}]', 8, 1),
(156, '2025-01-15 18:50:05.076000', '30', 'Diploma in industrial chemistry', 1, '[{\"added\": {}}]', 8, 1),
(157, '2025-01-15 18:50:48.634000', '31', 'Diploma in applied biology', 1, '[{\"added\": {}}]', 8, 1),
(158, '2025-01-15 18:51:25.014000', '32', 'Diploma in applied biology', 1, '[{\"added\": {}}]', 8, 1),
(159, '2025-01-15 18:52:01.252000', '33', 'Diploma in community health', 1, '[{\"added\": {}}]', 8, 1),
(160, '2025-01-15 18:52:48.116000', '34', 'Certificate in community health', 1, '[{\"added\": {}}]', 8, 1),
(161, '2025-01-15 18:53:13.464000', '34', 'Certificate in community health', 2, '[{\"changed\": {\"fields\": [\"Qualification\", \"Duration\"]}}]', 8, 1),
(162, '2025-01-15 18:53:55.074000', '35', 'Artisan in community health', 1, '[{\"added\": {}}]', 8, 1),
(163, '2025-01-15 18:54:45.896000', '8', 'Tourism Management', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(164, '2025-01-15 18:55:12.836000', '16', 'Hairdressing and Beauty (cosmetology)', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(165, '2025-01-15 18:55:34.446000', '12', 'Food and Beverage Sales and service', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(166, '2025-01-15 18:55:49.823000', '14', 'Fashion and Design', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(167, '2025-01-15 18:56:11.017000', '10', 'Food and Beverage production', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(168, '2025-01-15 18:58:56.107000', '2', 'the department of agriculture and applied sciences', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(169, '2025-01-15 18:59:42.955000', '2', 'Department of agriculture and applied sciences', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1),
(170, '2025-01-15 19:14:35.691000', '1', 'ICT & Business Department', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Hod name\", \"Hod message\"]}}]', 10, 1),
(171, '2025-01-15 19:18:02.345000', '1', 'ICT & Business Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(172, '2025-01-15 19:19:57.230000', '1', 'ICT & Business Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(173, '2025-01-15 19:23:54.727000', '1', 'ICT & Business Department', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(174, '2025-01-15 19:27:34.532000', '36', 'Information Communication Technology', 1, '[{\"added\": {}}]', 8, 1),
(175, '2025-01-15 19:28:18.319000', '37', 'Information Communication Technology', 1, '[{\"added\": {}}]', 8, 1),
(176, '2025-01-15 19:29:39.147000', '38', 'Information Communication Technology', 1, '[{\"added\": {}}]', 8, 1),
(177, '2025-01-15 19:30:23.182000', '39', 'Computer Science', 1, '[{\"added\": {}}]', 8, 1),
(178, '2025-01-15 19:31:02.260000', '40', 'Computer Science', 1, '[{\"added\": {}}]', 8, 1),
(179, '2025-01-15 19:32:02.765000', '41', 'Computer Science', 1, '[{\"added\": {}}]', 8, 1),
(180, '2025-01-15 19:32:47.555000', '42', 'Office Administration', 1, '[{\"added\": {}}]', 8, 1),
(181, '2025-01-15 19:34:07.481000', '43', 'Office Administration', 1, '[{\"added\": {}}]', 8, 1),
(182, '2025-01-15 19:34:53.753000', '44', 'Office Administration', 1, '[{\"added\": {}}]', 8, 1),
(183, '2025-01-15 19:37:21.919000', '45', 'Supply Chain Management', 1, '[{\"added\": {}}]', 8, 1),
(184, '2025-01-15 19:38:06.146000', '46', 'Supply Chain Management', 1, '[{\"added\": {}}]', 8, 1),
(185, '2025-01-15 19:38:45.479000', '47', 'Supply Chain Management', 1, '[{\"added\": {}}]', 8, 1),
(186, '2025-01-15 19:39:45.153000', '48', 'Banking and Finance', 1, '[{\"added\": {}}]', 8, 1),
(187, '2025-01-15 19:40:10.449000', '48', 'Banking and Finance', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(188, '2025-01-15 19:41:15.416000', '49', 'Banking and Finance', 1, '[{\"added\": {}}]', 8, 1),
(189, '2025-01-15 19:41:51.856000', '50', 'Banking and Finance', 1, '[{\"added\": {}}]', 8, 1),
(190, '2025-01-15 19:42:43.198000', '51', 'Accounting and Finance', 1, '[{\"added\": {}}]', 8, 1),
(191, '2025-01-15 19:43:28.020000', '52', 'Accounting and Finance', 1, '[{\"added\": {}}]', 8, 1),
(192, '2025-01-15 19:44:50.556000', '53', 'Accounting and Finance', 1, '[{\"added\": {}}]', 8, 1),
(193, '2025-01-15 19:46:12.601000', '46', 'Supply Chain Management', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(194, '2025-01-15 19:46:40.669000', '49', 'Banking and Finance', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(195, '2025-01-15 19:46:57.031000', '52', 'Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(196, '2025-01-15 19:47:50.506000', '53', 'Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Qualification\", \"Duration\"]}}]', 8, 1),
(197, '2025-01-15 19:49:29.219000', '54', 'Human Resource Management', 1, '[{\"added\": {}}]', 8, 1),
(198, '2025-01-15 19:50:26.971000', '55', 'Human Resource Management', 1, '[{\"added\": {}}]', 8, 1),
(199, '2025-01-15 19:51:36.767000', '56', 'Human Resource Management', 1, '[{\"added\": {}}]', 8, 1),
(200, '2025-01-15 19:54:34.085000', '57', 'Project Management', 1, '[{\"added\": {}}]', 8, 1),
(201, '2025-01-15 19:55:41.585000', '58', 'Project Management', 1, '[{\"added\": {}}]', 8, 1),
(202, '2025-01-15 19:56:17.585000', '59', 'Project Management', 1, '[{\"added\": {}}]', 8, 1),
(203, '2025-01-16 12:34:36.843000', '1', 'Deputy Principal', 3, '', 12, 1),
(204, '2025-01-16 12:40:23.896000', '9', 'games', 3, '', 9, 1),
(205, '2025-01-16 12:40:23.896000', '7', 'KATTI Drama Festivals', 3, '', 9, 1),
(206, '2025-01-16 12:40:23.896000', '6', 'Agricultural Day', 3, '', 9, 1),
(207, '2025-01-16 12:40:23.896000', '5', 'ICT & Business Department Trip', 3, '', 9, 1),
(208, '2025-01-16 12:40:23.896000', '4', 'Students Forum', 3, '', 9, 1),
(209, '2025-01-16 12:40:23.896000', '3', 'Collage Principals Meeting', 3, '', 9, 1),
(210, '2025-01-16 13:06:55.597000', '3', 'Madam June Benson - Industrial Liaison Office', 1, '[{\"added\": {}}]', 7, 1),
(211, '2025-01-16 13:19:38.511000', '3', 'Madam June Benson - Industrial Liaison Office (ILO)', 2, '[{\"changed\": {\"fields\": [\"Position\", \"Description\"]}}]', 7, 1),
(212, '2025-01-16 13:20:09.583000', '3', 'Madam June Benson - Industrial Liaison Office (ILO)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(213, '2025-01-16 13:25:47.179000', '4', 'Faith Mumbe Musyoka - Head of Quality Assurance and Standards', 1, '[{\"added\": {}}]', 7, 1),
(214, '2025-01-16 13:27:05.965000', '4', 'Faith Mumbe Musyoka - Head of Quality Assurance and Standards', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(215, '2025-01-16 13:30:27.236000', '3', 'Madam June Benson - Industrial Liaison Office (ILO)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(216, '2025-01-16 13:34:54.847000', '5', 'Office of Career Services - Head Of Office of Career Services', 1, '[{\"added\": {}}]', 7, 1),
(217, '2025-01-16 14:13:14.130000', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Image\", \"Hod name\", \"Hod message\"]}}]', 11, 1),
(218, '2025-01-16 14:17:13.686000', '1', 'Sports and Recreation', 2, '[]', 11, 1),
(219, '2025-01-16 14:17:45.531000', '1', 'Sports and Recreation', 2, '[]', 11, 1),
(220, '2025-01-16 14:27:13.501000', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(221, '2025-01-16 16:02:58.663000', '1', 'FAITH Mwangi - ICT', 3, '', 18, 1),
(222, '2025-01-16 16:02:58.663000', '3', 'Edwin kllklm - Computer Science', 3, '', 18, 1),
(223, '2025-01-16 16:02:58.663000', '4', 'ken Minah - ICT', 3, '', 18, 1),
(224, '2025-01-17 16:27:53.121000', '1', 'Mwala', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(225, '2025-04-04 06:31:18.225000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 3),
(226, '2025-04-04 06:32:26.335000', '2', 'Deputy - Office of Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 3),
(227, '2025-04-04 06:33:22.396000', '3', 'Deputy - Office of Deputy Principal Administration', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 3),
(228, '2025-04-04 06:34:37.448000', '4', 'Pascaline - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 3),
(229, '2025-04-04 06:35:43.149000', '5', 'Cyrus k Musau - Office of Dean of Trainees', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 3),
(230, '2025-04-04 06:54:11.553000', '3', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Image\", \"Hod name\", \"Hod message\", \"Position\"]}}]', 11, 3),
(231, '2025-04-04 06:55:24.400000', '2', 'Industrial Liaison Office', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Image\", \"Hod name\", \"Hod message\", \"Position\"]}}]', 11, 3),
(232, '2025-04-04 06:56:18.685000', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 11, 3),
(233, '2025-04-04 06:57:40.702000', '4', 'Quality Assurance & Standards Office', 1, '[{\"added\": {}}]', 11, 3),
(234, '2025-04-04 06:58:48.578000', '5', 'Finance Office', 1, '[{\"added\": {}}]', 11, 3),
(235, '2025-04-04 07:00:22.964000', '6', 'Performance Contracting Office', 1, '[{\"added\": {}}]', 11, 3),
(236, '2025-04-04 07:03:51.677000', '1', 'Guidance & Counseling Office', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Name\", \"Details\"]}}]', 15, 3),
(237, '2025-04-04 07:04:53.882000', '10', 'Repair & Maintenance Office', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Details\"]}}]', 15, 3),
(238, '2025-04-04 07:05:39.805000', '3', 'Industrial Attachment Office', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Details\"]}}]', 15, 3),
(239, '2025-04-04 07:06:13.853000', '2', 'Examinations & Timetabling Office', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Details\"]}}]', 15, 3),
(240, '2025-04-04 07:07:14.678000', '11', 'Research & Innovation Office', 1, '[{\"added\": {}}]', 15, 3),
(241, '2025-04-04 07:15:11.406000', '1', 'Mwala TVC Brochures', 1, '[{\"added\": {}}]', 20, 3),
(242, '2025-04-04 07:20:26.181000', '3', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Hod name\", \"Hod message\"]}}]', 10, 3),
(243, '2025-04-04 07:21:44.953000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 10, 3),
(244, '2025-04-04 07:23:40.859000', '1', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Hod image\", \"Description\"]}}]', 10, 3),
(245, '2025-04-04 07:26:04.316000', '4', 'Electrical and Electronic Engineering', 1, '[{\"added\": {}}]', 10, 3),
(246, '2025-04-04 07:28:12.258000', '5', 'Building & Civil Engineering', 1, '[{\"added\": {}}]', 10, 3),
(247, '2025-04-04 07:41:49.560000', '2', 'Application Form', 2, '[{\"changed\": {\"fields\": [\"Title\", \"UploadNotice\"]}}]', 9, 3),
(248, '2025-04-04 07:42:32.082000', '8', 'fee structure', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 3),
(249, '2025-04-04 07:44:31.029000', '11', 'Clearance Form', 1, '[{\"added\": {}}]', 9, 3),
(250, '2025-04-04 07:46:01.462000', '12', 'Course Transfer Form', 1, '[{\"added\": {}}]', 9, 3),
(251, '2025-04-04 07:46:38.650000', '13', 'Fee Refunding Form', 1, '[{\"added\": {}}]', 9, 3),
(252, '2025-04-04 07:51:40.057000', '14', 'Service Delivery Charter', 1, '[{\"added\": {}}]', 9, 3),
(253, '2025-04-04 07:55:59.958000', '15', 'Rules & Regulations', 1, '[{\"added\": {}}]', 9, 3),
(254, '2025-04-04 08:13:32.985000', '3', 'Watchman', 3, '', 12, 3),
(255, '2025-04-04 08:13:32.985000', '2', 'Trainer', 3, '', 12, 3),
(256, '2025-04-04 08:27:26.164000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(257, '2025-04-04 08:39:32.976000', '4', 'Pascaline - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(258, '2025-04-04 08:59:11.294000', '4', 'Pascaline - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(259, '2025-04-04 09:02:44.630000', '5', 'Cyrus k Musau - Office of Dean of Trainees', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(260, '2025-04-04 09:04:13.780000', '1', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(261, '2025-04-04 09:05:29.521000', '1', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(262, '2025-04-04 09:08:51.874000', '3', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(263, '2025-04-04 09:10:26.200000', '3', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(264, '2025-04-04 09:12:57.027000', '4', 'Electrical and Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(265, '2025-04-04 09:14:16.250000', '4', 'Electrical and Electronic Engineering', 2, '[]', 10, 3),
(266, '2025-04-04 09:24:56.654000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(267, '2025-04-04 09:30:27.797000', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(268, '2025-04-04 09:33:25.461000', '5', 'Finance Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(269, '2025-04-04 09:36:35.200000', '3', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(270, '2025-04-04 09:38:04.932000', '2', 'Industrial Liaison Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(271, '2025-04-04 09:39:02.759000', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(272, '2025-04-04 09:42:18.030000', '6', 'Performance Contracting Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(273, '2025-04-04 09:45:01.995000', '1', 'Guidance & Counseling Office', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 3),
(274, '2025-04-04 09:46:57.292000', '2', 'Examinations & Timetabling Office', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 3),
(275, '2025-04-04 09:48:56.622000', '3', 'Industrial Attachment Office', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 3),
(276, '2025-04-04 09:50:42.974000', '10', 'Repair & Maintenance Office', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 3),
(277, '2025-04-04 09:52:22.740000', '11', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 3),
(278, '2025-04-04 12:25:10.175000', '3', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Hod image\"]}}]', 10, 3),
(279, '2025-04-04 12:25:27.048000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod image\"]}}]', 10, 3),
(280, '2025-04-04 12:27:45.445000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod image\"]}}]', 10, 3),
(281, '2025-04-04 12:29:33.141000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(282, '2025-04-05 12:04:27.828000', '1', 'Catering  Department Block Launching', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 14, 3),
(283, '2025-04-05 12:05:44.630000', '1', 'Catering  Department Block Launching', 2, '[{\"changed\": {\"fields\": [\"Video attachment\"]}}]', 14, 3),
(284, '2025-04-11 13:38:00.675000', '2', 'Deputy - Office of Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(285, '2025-04-11 13:51:10.308000', '14', 'Service Delivery Charter', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 3),
(286, '2025-05-12 07:51:41.379000', '3', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Hod name\"]}}]', 11, 2),
(287, '2025-05-12 07:53:12.099000', '16', 'Recognition of Prior Learning in Kenya Framework', 1, '[{\"added\": {}}]', 9, 2),
(288, '2025-05-12 07:53:42.707000', '17', 'Vision 2030 Policy', 1, '[{\"added\": {}}]', 9, 2),
(289, '2025-05-12 07:54:37.584000', '18', 'A Policy Framework for Education and Training', 1, '[{\"added\": {}}]', 9, 2),
(290, '2025-05-28 10:02:16.951000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(291, '2025-05-28 10:04:47.820000', '5', 'Building & Civil Engineering', 2, '[]', 10, 3),
(292, '2025-05-28 10:07:37.502000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(293, '2025-05-28 10:10:29.742000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(294, '2025-05-28 10:13:03.685000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(295, '2025-05-28 10:14:15.714000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(296, '2025-05-28 10:18:29.776000', '1', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod message\", \"Hod info\"]}}]', 10, 3),
(297, '2025-05-28 10:19:55.923000', '1', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(298, '2025-05-28 12:39:33.877000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(299, '2025-05-28 12:50:29.147000', '6', 'Cultural Day', 1, '[{\"added\": {}}]', 13, 3),
(300, '2025-05-28 12:50:46.959000', '7', '2025-05-28', 1, '[{\"added\": {}}]', 13, 3),
(301, '2025-05-29 07:08:11.351000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(302, '2025-05-29 07:10:08.369000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(303, '2025-05-29 07:12:07.742000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(304, '2025-05-29 07:22:33.204000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(305, '2025-05-29 07:33:19.924000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(306, '2025-05-29 07:36:01.924000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(307, '2025-05-29 08:38:25.238000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(308, '2025-05-29 08:40:49.654000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(309, '2025-05-29 10:20:33.251000', '4', 'Pascaline - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(310, '2025-05-29 11:00:35.120000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(311, '2025-05-29 11:10:38.941000', '1', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 3, '', 7, 3),
(312, '2025-05-29 11:17:05.857000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 1, '[{\"added\": {}}]', 7, 3),
(313, '2025-05-29 11:18:04.665000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(314, '2025-05-29 11:26:12.795000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(315, '2025-05-29 11:26:58.381000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(316, '2025-05-29 11:31:46.254000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(317, '2025-05-29 11:37:11.845000', '3', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(318, '2025-05-29 11:40:54.445000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(319, '2025-05-31 08:49:46.888000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Position level\"]}}]', 7, 3),
(320, '2025-05-31 08:51:48.547000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(321, '2025-05-31 08:59:17.776000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(322, '2025-05-31 08:59:55.266000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(323, '2025-06-12 21:13:42.589000', '5', 'Finance Office', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 11, 3),
(324, '2025-06-12 21:25:13.476000', '5', 'Finance Office', 2, '[{\"changed\": {\"fields\": [\"Hod information\"]}}]', 11, 3),
(325, '2025-06-12 21:31:06.070000', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Hod information\"]}}]', 11, 3),
(326, '2025-06-12 21:32:41.180000', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(327, '2025-06-12 21:33:49.881000', '1', 'Sports and Recreation Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 3),
(328, '2025-06-12 21:58:33.974000', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Hod information\"]}}]', 11, 3),
(329, '2025-06-12 22:16:53.307000', '4', 'Electrical and Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(330, '2025-06-12 22:38:36.958000', '2', 'Examinations & Timetabling Office', 3, '', 15, 3),
(331, '2025-06-12 22:47:55.075000', '7', 'Examinations & timetabling Office', 1, '[{\"added\": {}}]', 11, 3),
(332, '2025-06-12 22:51:15.540000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod info\"]}}]', 10, 3),
(333, '2025-06-12 22:53:26.521000', '6', 'Mr. Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Position level\"]}}]', 7, 3),
(334, '2025-06-12 22:55:57.762000', '7', 'Examinations & timetabling Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\", \"Hod information\"]}}]', 11, 3),
(335, '2025-06-12 22:57:30.565000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(336, '2025-06-16 11:40:28.969000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod image\"]}}]', 10, 3),
(337, '2025-06-16 11:45:02.138000', '4', 'Pascaline - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Position level\"]}}]', 7, 3),
(338, '2025-06-16 11:46:45.780000', '4', 'Pascaline - Office of Registrar', 2, '[]', 7, 3),
(339, '2025-06-16 12:01:51.407000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Position level\", \"Image\"]}}]', 7, 3),
(340, '2025-06-16 12:09:47.017000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(341, '2025-06-16 12:15:00.618000', '5', 'Cyrus k Musau - Office of Dean of Trainees', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Position level\"]}}]', 7, 3),
(342, '2025-06-16 12:17:50.137000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(343, '2025-06-16 12:21:26.845000', '2', 'Cecelia Kayongo - Office of Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Position level\"]}}]', 7, 3),
(344, '2025-06-16 12:21:57.475000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(345, '2025-06-16 12:29:01.042000', '1', 'Sports and Recreation Office', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 3),
(346, '2025-06-16 12:42:44.647000', '2', 'Industrial Liaison Office', 2, '[{\"changed\": {\"fields\": [\"Hod name\", \"Hod information\"]}}]', 11, 3),
(347, '2025-06-16 12:42:48.964000', '2', 'Industrial Liaison Office', 2, '[]', 11, 3),
(348, '2025-06-17 10:53:12.897000', '6', 'IT', 1, '[{\"added\": {}}]', 10, 3),
(349, '2025-06-17 10:54:40.167000', '60', 'Data comm', 1, '[{\"added\": {}}]', 8, 3),
(350, '2025-06-17 12:04:12.139000', '6', 'IT', 3, '', 10, 3),
(351, '2025-06-18 17:50:38.238000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\", \"Hod info\"]}}]', 10, 3),
(352, '2025-06-18 17:52:02.179000', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(353, '2025-06-18 17:54:35.551000', '4', 'Electrical and Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(354, '2025-06-18 17:58:02.239000', '3', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Hod message\", \"Hod info\"]}}]', 10, 3),
(355, '2025-06-18 18:00:49.527000', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 3),
(356, '2025-06-18 18:09:58.538000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(357, '2025-06-18 18:11:53.443000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(358, '2025-06-18 18:13:54.972000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(359, '2025-06-18 18:16:09.417000', '4', 'Ms. Pascaline Nzilu - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 3),
(360, '2025-06-18 18:53:15.195000', '2', 'Ms. Cecilia Wanjiru Kayongo - Office of Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 3),
(361, '2025-06-18 18:54:52.675000', '5', 'Mr. Cyrus k Musau - Office of Dean of Trainees', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 3),
(362, '2025-06-18 19:06:15.000000', '6', 'Mr. Kavita C. Kyuli - Office of Principal', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 3),
(363, '2025-06-18 19:11:35.198000', '10', 'Repair & Maintenance Office', 3, '', 15, 3),
(364, '2025-06-18 19:11:35.198000', '1', 'Guidance & Counseling Office', 3, '', 15, 3),
(365, '2025-06-18 20:03:06.324000', '8', 'Research & Innovation Office', 1, '[{\"added\": {}}]', 11, 3),
(366, '2025-06-18 20:06:36.325000', '8', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 11, 3),
(367, '2025-06-18 20:07:28.964000', '11', 'Research & Innovation Office', 3, '', 15, 3),
(368, '2025-06-18 20:09:05.192000', '8', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(369, '2025-06-18 20:10:16.998000', '8', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(370, '2025-06-18 21:52:44.155000', '3', 'Industrial Attachment Office', 3, '', 15, 3),
(371, '2025-06-19 09:50:29.744000', '6', 'Performance Contracting Office', 2, '[{\"changed\": {\"fields\": [\"Hod information\"]}}]', 11, 3),
(372, '2025-06-19 09:59:22.552000', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(373, '2025-06-19 10:00:03.521000', '2', 'Industrial Liaison Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(374, '2025-06-19 10:02:39.487000', '3', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(375, '2025-06-19 10:04:27.472000', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(376, '2025-06-19 10:06:00.848000', '8', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3),
(377, '2025-06-19 10:07:38.835000', '8', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mwala_app', 'administration'),
(18, 'mwala_app', 'admissionapplication'),
(20, 'mwala_app', 'brochures'),
(16, 'mwala_app', 'contact'),
(8, 'mwala_app', 'course'),
(10, 'mwala_app', 'department'),
(17, 'mwala_app', 'feedback'),
(13, 'mwala_app', 'imagegallery'),
(12, 'mwala_app', 'jobsvacancies'),
(14, 'mwala_app', 'news'),
(9, 'mwala_app', 'notice'),
(15, 'mwala_app', 'studentaffairs'),
(11, 'mwala_app', 'supportingdepartment'),
(19, 'mwala_app', 'tenders'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-29 19:06:05.001212'),
(2, 'auth', '0001_initial', '2025-06-29 19:06:22.204143'),
(3, 'admin', '0001_initial', '2025-06-29 19:06:26.699810'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-29 19:06:26.792250'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-29 19:06:26.851489'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-29 19:06:27.788144'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-29 19:06:28.744552'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-29 19:06:29.099353'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-29 19:06:29.125495'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-29 19:06:29.882379'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-29 19:06:29.901611'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-29 19:06:29.924501'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-29 19:06:30.465548'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-29 19:06:30.967701'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-29 19:06:31.463023'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-29 19:06:31.492139'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-29 19:06:31.784517'),
(18, 'mwala_app', '0001_initial', '2025-06-29 19:06:31.965944'),
(19, 'mwala_app', '0002_course', '2025-06-29 19:06:32.171703'),
(20, 'mwala_app', '0003_remove_course_title', '2025-06-29 19:06:32.509250'),
(21, 'mwala_app', '0004_alter_course_course_level', '2025-06-29 19:06:32.524893'),
(22, 'mwala_app', '0005_notice', '2025-06-29 19:06:32.710156'),
(23, 'mwala_app', '0006_remove_notice_link_notice_uploadnotice', '2025-06-29 19:06:33.392203'),
(24, 'mwala_app', '0007_department', '2025-06-29 19:06:34.218737'),
(25, 'mwala_app', '0008_alter_department_course', '2025-06-29 19:06:38.387812'),
(26, 'mwala_app', '0009_remove_department_course_course_department', '2025-06-29 19:06:41.068647'),
(27, 'mwala_app', '0010_supportingdepartment', '2025-06-29 19:06:41.341622'),
(28, 'mwala_app', '0011_jobsvacancies', '2025-06-29 19:06:41.603340'),
(29, 'mwala_app', '0012_alter_jobsvacancies_uploadnotice', '2025-06-29 19:06:41.620261'),
(30, 'mwala_app', '0013_rename_uploadnotice_jobsvacancies_uploadjobs', '2025-06-29 19:06:41.990526'),
(31, 'mwala_app', '0014_imagegallery', '2025-06-29 19:06:42.246134'),
(32, 'mwala_app', '0015_news', '2025-06-29 19:06:42.501829'),
(33, 'mwala_app', '0016_studentaffairs', '2025-06-29 19:06:42.823431'),
(34, 'mwala_app', '0017_contact_alter_studentaffairs_details', '2025-06-29 19:06:43.064348'),
(35, 'mwala_app', '0018_feedback', '2025-06-29 19:06:43.366822'),
(36, 'mwala_app', '0019_rename_departments_feedback_department_choices_and_more', '2025-06-29 19:06:44.364822'),
(37, 'mwala_app', '0020_admissionapplication', '2025-06-29 19:06:45.463911'),
(38, 'mwala_app', '0021_imagegallery_description_imagegallery_title', '2025-06-29 19:06:46.370410'),
(39, 'mwala_app', '0022_studentaffairs_image', '2025-06-29 19:06:46.626265'),
(40, 'mwala_app', '0023_alter_administration_description_and_more', '2025-06-29 19:06:47.156275'),
(41, 'mwala_app', '0024_alter_course_course_level', '2025-06-29 19:06:47.415321'),
(42, 'mwala_app', '0025_admissionapplication_county_and_more', '2025-06-29 19:06:50.300443'),
(43, 'mwala_app', '0026_studentaffairs_name', '2025-06-29 19:06:50.902463'),
(44, 'mwala_app', '0027_alter_studentaffairs_name', '2025-06-29 19:06:51.791923'),
(45, 'mwala_app', '0028_feedback_submitted_at', '2025-06-29 19:06:53.180371'),
(46, 'mwala_app', '0029_tenders', '2025-06-29 19:06:53.400670'),
(47, 'mwala_app', '0030_department_hod_image_alter_department_description', '2025-06-29 19:06:54.400545'),
(48, 'mwala_app', '0031_mwalabrachures', '2025-06-29 19:06:54.764696'),
(49, 'mwala_app', '0032_mwalabrachures_title_alter_mwalabrachures_brochure', '2025-06-29 19:06:56.747453'),
(50, 'mwala_app', '0033_brochures_delete_mwalabrachures', '2025-06-29 19:06:58.355360'),
(51, 'mwala_app', '0034_alter_supportingdepartment_position', '2025-06-29 19:06:59.115950'),
(52, 'mwala_app', '0035_alter_course_course_level', '2025-06-29 19:06:59.142721'),
(53, 'mwala_app', '0036_department_hod_info', '2025-06-29 19:06:59.586023'),
(54, 'mwala_app', '0037_administration_position_level', '2025-06-29 19:07:00.201302'),
(55, 'mwala_app', '0038_supportingdepartment_hod_info', '2025-06-29 19:07:01.076076'),
(56, 'mwala_app', '0039_alter_supportingdepartment_hod_info', '2025-06-29 19:07:01.580921'),
(57, 'mwala_app', '0040_remove_supportingdepartment_hod_info_and_more', '2025-06-29 19:07:02.353810'),
(58, 'mwala_app', '0041_alter_department_hod_info_and_more', '2025-06-29 19:07:02.377179'),
(59, 'sessions', '0001_initial', '2025-06-29 19:07:03.178079');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('51agp4yrk2jh5vbpnxcaeh0qbvir4nal', '.eJxVjDsOwjAQBe_iGlnx36ak5wzWeneDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeckTibNQ4vS7FcAHtx3QHdptlji3dZmK3BV50C6vM_Hzcrh_BxV6_daJnI_GhqJGMAphIB09FNDKehONCmFwzCFhQRo1Wi4RfHIqMURmYvH-ANvkOGg:1tU465:_oAp5ieX9qfkcUM89aeZcnxgvZti2FXSi5w72D2GNt0', '2025-01-18 13:21:45.717000'),
('75j91xdgoanlr1uzmuahe1qc102wczeo', '.eJxVjDsOwjAQBe_iGlnxT15T0nMGa9de4wBypDipIu5OIqWAdmbe20TEdalx7TzHMYurMOLyywjTi9sh8hPbY5Jpass8kjwSedou71Pm9-1s_w4q9rqvARSbYDWTBqcIGW1hCB6LTV5bM5RUTKAdgVLgrXLsCpBT2SVIfhCfL-LHN8A:1u0aXH:KwMwMUU-o_ag_TGWdVnLBvg8E0w8aNSNauO34ifswgk', '2025-04-18 06:28:15.440000'),
('7gcsmr9p93kg4o4qqt11wekt1ufjah7w', '.eJxVjDsOwjAQBe_iGlnxT15T0nMGa9de4wBypDipIu5OIqWAdmbe20TEdalx7TzHMYurMOLyywjTi9sh8hPbY5Jpass8kjwSedou71Pm9-1s_w4q9rqvARSbYDWTBqcIGW1hCB6LTV5bM5RUTKAdgVLgrXLsCpBT2SVIfhCfL-LHN8A:1uPp0S:W-HeiOx7AWILr-rNb3knDqZpqRY0tr_ct9PTIywVNEs', '2025-06-26 20:58:40.846000'),
('edzdqj4o8yzd941ua88re0uvfd34eq1c', '.eJxVjMEOwiAQRP-FsyENULp49O43kIXdtVUDSWlPjf9um_Sgt8m8N7OpiOsyxrXxHCdSV2XU5bdLmF9cDkBPLI-qcy3LPCV9KPqkTd8r8ft2un8HI7ZxXwMJcA6dI6EueWBxg5c-DBZEvFhy0KO1RMYR7sGHnslC59GwATuozxcBezgo:1tl3d1:MYtzc1D3p9AvhPn6NEbLM3iuhOx1aCmgMq6S1jSeLH0', '2025-03-06 10:17:59.766000'),
('eyv6rky95cp8y5niwa8gttf6a76665s4', '.eJxVjDsOwyAQRO9CHSE-Xj4p0_sMiF1wcBKBZOwqyt1jSy4Saap5b-bNQtzWEraelzAndmWSXX47jPTM9QDpEeu9cWp1XWbkh8JP2vnYUn7dTvfvoMRe9rVNCoVDM2QP5ElpC6CMkdH6CcjaAbwiZ41OOJF3Touc9wBKNCjIsc8Xygk3jw:1tXfQo:udic67VmpVI2YDMxx-ubwiZZ_AFnKdy8MXeA0XQawLE', '2025-01-28 11:50:02.354000'),
('h7w1tzlj7asb2oxm9d9ouan6gcggyqs9', '.eJxVjDsOwjAQBe_iGlnxT15T0nMGa9de4wBypDipIu5OIqWAdmbe20TEdalx7TzHMYurMOLyywjTi9sh8hPbY5Jpass8kjwSedou71Pm9-1s_w4q9rqvARSbYDWTBqcIGW1hCB6LTV5bM5RUTKAdgVLgrXLsCpBT2SVIfhCfL-LHN8A:1uKDMk:J7JVp_d76URvDeYvqekMtkX19pO_tuD04nVFwaMEUSo', '2025-06-11 09:46:30.611000'),
('t1c24385j3kbmuc2ks07hmthdjfyklwn', '.eJxVjMEOwiAQRP-FsyENULp49O43kIXdtVUDSWlPjf9um_Sgt8m8N7OpiOsyxrXxHCdSV2XU5bdLmF9cDkBPLI-qcy3LPCV9KPqkTd8r8ft2un8HI7ZxXwMJcA6dI6EueWBxg5c-DBZEvFhy0KO1RMYR7sGHnslC59GwATuozxcBezgo:1uENvy:GcUojrrDOy76gBRtlEB_JeSIEdZvdtHz0jcDkED1yAs', '2025-05-26 07:50:46.693000'),
('y5l3crh7k1b8v23vdv8cnlrbaehwwfru', '.eJxVjDkOwjAUBe_iGlnebVHScwbL_gsOIEeKkwpxd4iUAto3M-8lctnWlrdBS55QnIUWp9-tFnhQ3wHeS7_NEua-LlOVuyIPOuR1RnpeDvfvoJXRvjVXFaOxNQEbZPCVvCrBmaSAk3bOBuWrYdZWqQhADq12SEg2BbYE4v0B7cE4Ug:1tYpCL:CafEpAk5j30SqZrRmQPrI_gySoYitF1xiS9YqOVB1xk', '2025-01-31 16:27:53.652000');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_administration`
--

CREATE TABLE `mwala_app_administration` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `position_level` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_administration`
--

INSERT INTO `mwala_app_administration` (`id`, `title`, `position`, `description`, `image`, `position_level`) VALUES
(2, 'Ms. Cecilia Wanjiru Kayongo', 'Office of Deputy Principal Academics', '<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Cecilia Wanjiru Kayongo is the Deputy Principal at Mwala Technical and Vocational College (MwalaTVC), a position she has held since February 2021. With a wealth of experience in technical education, inclusive training, and institutional administration, she has consistently demonstrated dedication to advancing the goals of the TVET sector in Kenya.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Before her deployment to MwalaTVC, Mrs. Kayongo served as the Head of Department for Fashion and Clothing Technology at Machakos Technical Institute for the Blind (MTIB). During her tenure at MTIB, she not only oversaw academic and skills-based training tailored for learners with visual impairments but also played a central role in college management. She chaired several critical committees, including the Guidance and Counselling Committee, the Procurement Committee, and the Asset Management Committee, among others. Her leadership at MTIB was marked by a strong emphasis on inclusive learning, student empowerment, and effective resource management.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">At MwalaTVC, Mrs. Kayongo continues to serve with distinction. She is responsible for coordinating all academic programs across departments, managing class timetabling and examinations, and ensuring the smooth implementation of the curriculum. She supervises both teaching and non-teaching staff and leads in promoting staff mentorship and development. She is also actively involved in student affairs, overseeing discipline, supporting welfare initiatives, and guiding academic performance improvement strategies.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">In addition to her administrative duties, she chairs key institutional committees such as the Academic Board, the Disciplinary Committee, the Quality Assurance Committee, and the Risk Management Team. She works closely with the Principal in policy implementation, strategic planning, and stakeholder engagement, and serves as Acting Principal when called upon. Her leadership style emphasizes collaboration, accountability, and continuous improvement.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Mrs. Kayongo is also a certified assessor and moderator with the Kenya National Examinations Council (KNEC), the TVET Curriculum Development, Assessment and Certification Council (TVET-CDACC), and the National Industrial Training Authority (NITA). Through these roles, she contributes meaningfully to the national TVET assessment framework and upholds high standards in training and certification.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">She holds professional qualifications in technical education, home economics, and institutional leadership, supported by additional certifications in assessment and mentorship. Her work continues to impact the lives of learners, staff, and the wider community.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">&gt;&quot;Inclusive leadership is the thread that stitches together equity, excellence, and empowerment&nbsp;in&nbsp;education.&quot;</span></span></p>\r\n\r\n<p><span style=\"font-size:20px\"><strong><span style=\"color:#e74c3c\">Message From the Office of Deputy Principal Academics</span></strong></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The Office is responsible for assisting the principal in day-to-day management of the institution including the planning and overseeing the daily timetable of the classes. The office is also involved in other major activities which include:</span></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Development of key institute&rsquo;s strategic aims as well as participation in the formulation/review of academic policies and preparation/review of academic work manuals and procedures.</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Corporate planning, staff recruitment, training of administrative staff, staff and students&rsquo; discipline, personnel administration and registry administration.</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Chairing a number of strategic institute committees, such as Institute Academic Board, examinations and Timetable among others.</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Working with the principal&rsquo;s office in development of institutional and professional capacities aimed at enhancing the provision of quality and relevant technical education and training, including Staff Continuous Professional.</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The office is responsible for coordinating the development and implementation of the Institute Strategic Plan with regard to academic programs towards achievement of the intended short and long-term goals.</span></span></p>\r\n	</li>\r\n</ul>', 'administration_images/deputy_principal_LipvSXJ.jpg', 'Deputy Principal Academics'),
(3, 'Deputy', 'Office of Deputy Principal Administration', '<h1 style=\"margin-right:416px\">None</h1>', '', NULL),
(4, 'Ms. Pascaline Nzilu', 'Office of Registrar', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp; Ms. Pascaline Nzilu is a dedicated and results-driven academic administrator with a strong technical background and a passion for quality education. She serves as the Registrar &ndash; Academic Affairs at Mwala Technical and Vocational College, where she plays a key role in managing academic processes, student records, admissions, examinations, and certification.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">With a solid foundation in electrical engineering and technical education, Ms. Nzilu brings a wealth of experience and practical knowledge to the institution. She is committed to promoting excellence in technical and vocational training and ensuring compliance with national education standards.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Academic Qualifications</span></span></strong></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Higher Diploma in Electrical Engineering &ndash; Kabete National Polytechnic</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in Electrical and Electronic Engineering &ndash; Kenya Technical Trainers College (KTTC)</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in Technical Education &ndash; Kenya Technical Trainers College (KTTC)</span></span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Professional Certifications</span></span></strong></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Registered Trainer &ndash; Technical and Vocational Education and Training Authority (TVETA)</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">NITA-Certified Examiner &ndash; National Industrial Training Authority (NITA</span></span></span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><span style=\"color:#e74c3c\"><span style=\"font-size:20px\">Message From the Office of Registrar</span></span></strong></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong>THE COLLEGE</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The college is a government accredited TVET institutution which is registered with the universities and college central placement services (KUCCPS) for placement of tranees in different courses. The college offers KNEC, CDACC &amp; NITA courses across five departments.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong>ADMISSIONS</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Mwala TVC affirms its commitment to equal opportunity in admissions and examination for all qualified individuals.&nbsp; The college admits trainees yearly&nbsp;</span></span><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">in <strong><span style=\"color:#3498db\">January</span>, <span style=\"color:#3498db\">May&nbsp;</span></strong>and <strong><span style=\"color:#3498db\">September&nbsp;</span></strong>intakes under the following levels;</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">i) LEVEL 4 (Artisan) Courses: The entry requirement is a K.C.S.E mean grade <strong>E. </strong>On qualifying at this level, trainee may proceed to Level 5.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">ii) LEVEL 5 (Certificate) Courses: Minimum entry requirement is a K.C.S.E mean grade <strong>D</strong> (Plain) or Level 4 certificate. On completion of this level, trainees may proceed to Level 6.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">iii) LEVEL 6 (Diploma) Courses: Entry requirement at this level is a K. C. S. E mean grade <strong>C-</strong> (Minus)</span></span></p>\r\n\r\n<h1><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:14pt\"><strong><span style=\"font-size:12.0pt\">EXAMINATION BODIES</span></strong></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Examination bodies include;</span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,&quot;serif&quot;\"><a href=\"https://tvetcdacc.go.ke/\" style=\"color:blue; text-decoration:underline\">TVET-CDACC</a></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,&quot;serif&quot;\"><a href=\"https://www.knec.ac.ke/\" style=\"color:blue; text-decoration:underline\">Kenya National Examination Council</a> (KNEC)</span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,&quot;serif&quot;\">National Industrial Training Authority (NITA)</span></span></li>\r\n</ol>\r\n\r\n<h1><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:14pt\"><strong><span style=\"font-size:12.0pt\">EDUCATION FUNDING</span></strong></span></span></h1>\r\n\r\n<p style=\"margin-right:3px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Trainees admitted in the institutions can be assisted to apply for education funding to assist them in the payment tuition and examination fees through;</span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,&quot;serif&quot;\"><a href=\"https://www.helb.co.ke/\" style=\"color:blue; text-decoration:underline\">Higher Education Loan Board</a> (HELB) and government Scholarships</span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,&quot;serif&quot;\">CDF bursaries .</span></span></li>\r\n</ol>', 'administration_images/gerist_FtCDwNo.jpg', 'Registrar'),
(5, 'Mr. Cyrus k Musau', 'Office of Dean of Trainees', '<div class=\"WordSection1\">\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">I am a dedicated and multidisciplinary professional with a strong background in agribusiness, agricultural engineering, and technical education. I hold a Bachelor of Science in Agribusiness Management and Trade from Kenyatta University, a Diploma in Agricultural Engineering from Jomo Kenyatta University of Agriculture and Technology (JKUAT), and Diploma in Technical Education from the Kenya Technical Trainers College (KTTC).</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">My career spans education, research, industry, and student affairs. I currently serve as the <strong>Dean of Trainees</strong>, where I am deeply passionate about handling student matters, including mentorship, discipline, guidance, and overall welfare. I am committed to nurturing a supportive, inclusive, and empowering learning environment that fosters both academic excellence and personal growth.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Previously, I served as the <strong>Head</strong> <strong>Of</strong> <strong>Guidance and Counselling</strong> and <strong>Agriculture and Applied Sciences Departments</strong>, where I provided leadership in academic programs, curriculum development, and student support. I also serve as the institution&rsquo;s <strong>Focal Person for Research, Science, and Innovation</strong>, coordinating research initiatives, fostering innovation, and supporting faculty and student engagement in scientific inquiry. Additionally, I actively contribute to several institutional committees focused on academic and trainees&rsquo; affairs.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">My earlier experience includes working as the <strong>Regional Research Project Coordinator</strong> under the <strong>SRISTI-USAID-JKUAT</strong> partnership, where I managed grassroots innovation projects and coordinated research activities. I also gained valuable industry exposure during my internship at <strong>Gailey and Roberts Co. Ltd.</strong>, which strengthened my understanding of agribusiness operations and private sector engagement.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">I bring a unique combination of technical expertise, educational leadership, and student-centered service, and I remain committed to advancing sustainable agriculture, innovation, and holistic trainee development.</span></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"color:#e74c3c\"><span style=\"font-size:22px\">Message From the Office of Dean of Trainees</span></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:11.5pt\">Our office is mandated with a responsibility of acting as a link between trainees and the Administration. We provide various services like trainees&rsquo; welfare, guidance &amp; counselling, games and Sports, Students with Special Needs and Spiritual Nourishment.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:11.5pt\">We coordinate activities of the Trainees Governing Council (TGC) and advice on how to form professional clubs and societies which expose them to global industry.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:11.5pt\">We also handle trainees conduct and discipline. Our top priority is to provide the necessary resources and support services to compliment and supplement their academic development outside the academic curriculum to produce a holistic individual capable of copying and functioning anywhere. We are here to assist any trainee when they are experiencing difficulties that might impact negatively on their learning.</span></span></p>\r\n\r\n<p style=\"margin-right:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:11.5pt\">Do not hesitate to contact the Dean of Students Office for information and guidance. We strive to provide a healthy sense of self for you to make individual choices that promote your wellbeing, develop consistent ethics and values, develop skills to establish and sustain meaningful healthy interpersonal relationships, recognize respect, value diversity and develop a desire for lifelong learning and professional development.</span></span></p>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>', 'administration_images/dean_025PwJd.jpg', 'Dean of Trainees'),
(6, 'Mr. Kavita C. Kyuli', 'Office of Principal', '<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Kavita C. Kyuli has been a transformative leader in the field of Technical Education since he joined Mwala Technical and Vocational College in Machakos County on September 17, 2020, as its inaugural Principal. He holds a Master of Science degree in Human Resource Development from Moi University and a Bachelor of Science in Agriculture Education and Extension from Egerton University. In addition, he is a Certified Monitoring &amp; Evaluation Professional from the Kenya Institute of Management and is currently pursuing a PhD in Human Resource Management at Jomo Kenyatta University of Agriculture and Technology (JKUAT).</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">As an accomplished academician, Kavita has published over nine peer-reviewed journal articles recognized both regionally and internationally. He has served as a reviewer for numerous scientific journals and has contributed to several editorial boards. His professional affiliations include membership in the Kenya Institute of Management (KIM) and the Kenya Association for Technical Training Institutions (KATTI), a consortium dedicated to the advancement of technical training in Kenya. He is also committed to education, having taught, supervised, and mentored students at the undergraduate, diploma, and certificate levels.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Before leading Mwala Technical &amp; Vocational College, Kavita served as the Deputy Principal in charge of Academics and Administration at Katine Technical Training Institute. His experience includes being the Pioneer Head of the Department of Agriculture Education and Extension at the Rift Valley Institute of Science and Technology and the Dean of Curriculum and Examinations at Narok Teachers College.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Under Kavita&#39;s visionary leadership, Mwala Technical &amp; Vocational College became officially registered as a Technical and Vocational Education and Training (TVET) institution in July 2021, marking a significant milestone in its development. He has successfully transformed the college into a premier institution known for its diverse programs in Engineering, ICT, Business, Agriculture, Applied Sciences, Hospitality, and Institutional Management. His ability to forge synergies with governmental bodies and local development funds has greatly enhanced the college&#39;s infrastructure.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Kavita has demonstrated a remarkable aptitude for securing additional revenue sources through the Directorate of the Income Generating Unit and the Endowment Trust Funds, facilitating the college&#39;s key development initiatives. His expertise in people management, attention to detail, and proficiency in financial strategies, networking, fundraising, and resource mobilization have been instrumental in his success. This excellence has led to his election as Chairman of Resource Mobilization, Marketing &amp; Publicity, Partnerships, and Linkages for the Kenya Association of Technical Training Institutions (Northern Region), in addition to serving as Treasurer. He is also a Board Member of the African Book Project, led by Professor Erastus Karanja Muia of North Carolina Central University.</span></span></p>\r\n\r\n<p><span style=\"font-size:22px\"><span style=\"color:#e74c3c\"><span style=\"font-family:Times New Roman,Times,serif\"><strong>Message from&nbsp; the Office&nbsp; of the Chief Principal&nbsp;</strong></span></span></span><strong><span style=\"font-family:Times New Roman,Times,serif\">&nbsp;<span style=\"color:#e74c3c\"><span style=\"font-size:22px\">Mwala Technical and Vocational College</span></span></span></strong></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">It is with great pleasure and excitement that I welcome you to the newly launched website for Mwala Technical and Vocational College. This is a significant step forward in our commitment to expanding access to quality education and training, and it provides a vital platform to showcase our college to the wider community. In alignment with the principles of the Fourth Industrial Revolution, our website offers a dynamic online space for our trainees, partners, and industry stakeholders to easily explore our comprehensive program offerings from anywhere, at any time.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Mwala Technical and Vocational College is a vibrant institution, currently home to over 3000 trainees enrolled in a diverse range of Technical and Vocational programs. This growth is a testament to the dedication of our exceptional staff, fully supported by our Board of Governors and college management. Our ambition is clear: to become the leading technical and vocational college in Kenya, starting with a strong focus on excellence within Machakos County. We are confident that this goal is within reach, guided by our clearly articulated Vision and Mission statements.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Our primary drivers are to significantly increase access to and success in all our programs. While expanding access is crucial, our focus remains steadfastly on the relevance and quality of our qualifications, prioritizing impactful outcomes over mere quantity. Every support function within the college is fully committed to achieving these vital objectives.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Mwala Technical and Vocational College proudly serves the communities across the seven sub-counties of Machakos County. We are fortunate to have strong and focused governance and management structures. Our dedicated Board of Governors, management team, and staff are deeply committed to the educational advancement of our community, each playing a crucial role in the college&#39;s growth and future success.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">As the Principal of Mwala Technical and Vocational College, I am dedicated to fostering an educational environment that promotes personal growth, professional development, and academic excellence among our trainees and staff. My role encompasses a range of responsibilities, all vital to the success and reputation of our institution:</span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Strategic Leadership:&nbsp;Providing guidance to ensure alignment with our mission and vision, and spearheading initiatives to enhance academic programs and innovation.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Academic Excellence:&nbsp;Overseeing programs to ensure relevance to industry standards and labor market demands, and fostering a culture of continuous improvement.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Staff Development:&nbsp;Investing in the professional growth of our trainers and administrative staff through training and mentorship.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Trainee Support:&nbsp;Prioritizing trainee well-being through comprehensive services for academic, career, and personal development.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Stakeholder Engagement:&nbsp;Building strong relationships with industry partners, government agencies, alumni, and the community to enhance program relevance and job placement.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Resource Management:&nbsp;Ensuring the effective management of college resources, including finances, budgeting, and facilities.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Compliance and Accreditation:&nbsp;Adhering to regulatory requirements and accreditation standards to maintain our credibility.</span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Community Involvement:&nbsp;Promoting trainee participation in local development projects to cultivate civic engagement.</span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">In conclusion, I am passionate about bridging the gap between education and industry, ensuring that our graduates are well-prepared to meet the challenges of the modern workforce. Together with our dedicated staff, trainees, and stakeholders, I am proud to lead Mwala Technical and Vocational College towards a successful future, empowering our trainees to achieve their fullest potential.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong>Kavita C. Kyuli, MKIM, CMEP</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong><u>Chief<strong><u>&nbsp;</u></strong>Principal&nbsp;</u></strong><strong><u>/</u></strong><strong><u>&nbsp;Secretary, Board of Governors</u></strong></span></span></p>', 'administration_images/princ-kavita_HUwalOH.jpg', 'Chief Principal/ BOG, Secretary');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_admissionapplication`
--

CREATE TABLE `mwala_app_admissionapplication` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `kcse_grade` varchar(5) NOT NULL,
  `course_id` int(11) NOT NULL,
  `intake_month` varchar(20) NOT NULL,
  `kcse_certificate` varchar(100) NOT NULL,
  `birth_certificate` varchar(100) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `county` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_admissionapplication`
--

INSERT INTO `mwala_app_admissionapplication` (`id`, `first_name`, `last_name`, `email`, `phone`, `kcse_grade`, `course_id`, `intake_month`, `kcse_certificate`, `birth_certificate`, `submitted_at`, `county`, `department_id`) VALUES
(1, 'Doughlas', 'Githui', 'githuidoughlas8@gmail.com', '0768345456', 'C +', 37, 'September', 'kcse_certificates/sports_profile.pdf', 'birth_certificates/June_ILO.pdf', '2025-01-16 16:54:40.715000', 'Nyeri', 1),
(2, 'TIMOTHY', 'Githui', 'muli@gmail.com', '0768345456', 'C', 29, 'May', 'kcse_certificates/JAN-APRIL_2025_STUDENTS_TIMETABLE.pdf', 'birth_certificates/June_ILO_sB6zSpf.pdf', '2025-01-17 11:25:33.038000', 'Mandera', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_brochures`
--

CREATE TABLE `mwala_app_brochures` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `brochure` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_brochures`
--

INSERT INTO `mwala_app_brochures` (`id`, `title`, `brochure`) VALUES
(1, 'Mwala TVC Brochures', 'brochures/MTVC_SP_August_2024_egyWr1P.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_contact`
--

CREATE TABLE `mwala_app_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_contact`
--

INSERT INTO `mwala_app_contact` (`id`, `name`, `phone`, `email`, `message`, `created_at`) VALUES
(4, 'Jane', '0712345678', 'muli@gmail.com', 'very nice institution', '2025-01-11 18:43:06.636000'),
(5, 'Jane', '0712345678', 'muli@gmail.com', 'very nice institution', '2025-01-11 18:43:52.120000'),
(6, 'Stephen', '0703456765', 'githuidoughlas8@gmail.com', 'very nice', '2025-01-11 18:44:18.234000'),
(7, 'doughlas', '0703456765', 'githuiddoughlas8@gmail.com', 'i love your institution', '2025-01-11 18:48:12.378000'),
(8, 'Daniel', '0703456765', 'hunn@gmail.com', 'this is it..keep up', '2025-01-11 18:51:00.497000'),
(9, 'Muthoni', '0707354675', 'githuidoughlas8@gmail.com', 'wow wow', '2025-01-11 18:52:17.019000'),
(10, 'Stephen', '0707354675', 'githuiddoughlas8@gmail.com', 'hooo', '2025-01-11 18:53:30.698000'),
(11, 'Githui', '0707264913', 'githuid8@gmail.com', 'good', '2025-01-11 18:55:13.338000'),
(12, 'Stephen', '0703456765', 'lilian@gmail.com', 'wowowow', '2025-01-11 18:56:54.157000'),
(13, 'Githui', '0703456765', 'githuiddoughlas8@gmail.com', 'Your institution is the best', '2025-01-12 05:58:12.877000');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_course`
--

CREATE TABLE `mwala_app_course` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `examination_body` varchar(10) NOT NULL,
  `course_level` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_course`
--

INSERT INTO `mwala_app_course` (`id`, `description`, `course_name`, `qualification`, `duration`, `examination_body`, `course_level`, `department_id`) VALUES
(8, '<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"background-color:#e74c3c\">Focus:</span> Tour operations, customer service, and travel agency management.</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"background-color:#e74c3c\">Career Pathways:</span> Tour guides and travel agents </span></span></p>', 'Tourism Management', 'D  And Above', '2 Modules', 'CDACC', 'Certificate(level 5)', 3),
(9, '<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Focus: Tour operations, customer service, and travel agency management.</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Career Pathways: Tour guides and travel agents </span></span></p>', 'Tourism Management', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 3),
(10, '', 'Food and Beverage production', 'D  And Above', '2 Modules', 'CDACC', 'Certificate(level 5)', 3),
(11, '', 'Food and Beverage production', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 3),
(12, '', 'Food and Beverage Sales and service', 'D And Above', '2 Modules', 'CDACC', 'Certificate(level 5)', 3),
(13, '', 'Food and Beverage Sales and service', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 3),
(14, '', 'Fashion and Design', 'D And Above', '2 Modules', 'CDACC', 'Certificate(level 5)', 3),
(15, '', 'Fashion and Design', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 3),
(16, '', 'Hairdressing and Beauty (cosmetology)', 'D And Above', '2 Modules', 'CDACC', 'Certificate(level 5)', 3),
(17, '', 'Hairdressing and Beauty (cosmetology)', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 3),
(18, '', 'Agricultural extension', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(19, '', 'Agricultural extension', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(20, '', 'Agricultural extension', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 2),
(21, '', 'Sustainable agriculture', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(22, '', 'Sustainable agriculture', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(23, '', 'Agricultural economics', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(24, '', 'Agricultural economics', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(25, '', 'Dairy farm management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(26, '', 'Dairy farm management', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(27, '', 'Analytical chemistry', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(28, '', 'Diploma in science laboratory technology', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(29, '', 'Certificate  in science laboratory technology', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(30, '', 'Diploma in industrial chemistry', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(31, '', 'Diploma in applied biology', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 2),
(32, '', 'Diploma in applied biology', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(33, '', 'Diploma in community health', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(34, '', 'Certificate in community health', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(35, '', 'Artisan in community health', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 2),
(36, '', 'Information Communication Technology', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 1),
(37, '', 'Information Communication Technology', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(38, '', 'Information Communication Technology', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1),
(39, '', 'Computer Science', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(40, '', 'Computer Science', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(41, '', 'Computer Science', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1),
(42, '', 'Office Administration', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(43, '', 'Office Administration', 'D  And Above', '2 Modules', 'CDACC', 'Certificate(level 5)', 1),
(44, '', 'Office Administration', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1),
(45, '', 'Supply Chain Management', 'C -  And Above', '3 Modules', 'CDACC', 'Diploma(level 6)', 1),
(46, '', 'Supply Chain Management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(47, '', 'Supply Chain Management', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1),
(48, '', 'Banking and Finance', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(49, '', 'Banking and Finance', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(50, '', 'Banking and Finance', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1),
(51, '', 'Accounting and Finance', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(52, '', 'Accounting and Finance', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(53, '', 'Accounting and Finance', 'D - And Below', '1.5 Years', 'CDACC', 'Certificate(level 5)', 1),
(54, '', 'Human Resource Management', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(55, '', 'Human Resource Management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(56, '', 'Human Resource Management', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1),
(57, '', 'Project Management', 'C -  And Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(58, '', 'Project Management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(59, '', 'Project Management', 'D - And Below', '1.5 Years', 'CDACC', 'Artisan(level 4)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_department`
--

CREATE TABLE `mwala_app_department` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(1200) NOT NULL,
  `hod_name` varchar(150) NOT NULL,
  `hod_message` longtext NOT NULL,
  `hod_image` varchar(100) DEFAULT NULL,
  `hod_info` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_department`
--

INSERT INTO `mwala_app_department` (`id`, `title`, `image`, `description`, `hod_name`, `hod_message`, `hod_image`, `hod_info`) VALUES
(1, 'ICT and Business Studies', 'department_images/ict_dep_eiqqg9O.jpg', 'The Department offers training at Artisan, Craft and Diploma level in all the three sections mentioned above. The department also has excellent infrastructure with two fully equipped laboratories.', 'SAMSON MUTUNGA', '<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The department of ICT and BUSINESS offers training under three sections which offer the following courses.</span></span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">ICT </span></strong></span></span></li>\r\n</ol>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Information Communication Technology</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Computer Science</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp; &nbsp; &nbsp; 2.BUSINESS</span></strong></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Office Administration</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Supply Chain Management</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Banking and Finance</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Accounting and Finance</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Human Resource Management</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Project Management</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. LIBERAL STUDIES</span></strong></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Social work and Community Development</span></span></span></li>\r\n	<li><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Child Care protection</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The Department offers training at Artisan, Craft and Diploma level in all the three sections mentioned above. The department also has excellent infrastructure with two fully equipped laboratories.</span></span></span></p>', 'hod_images/ict_sam2_vFRfoL5.jpg', '<p><span style=\"font-size:16px\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">My name is Samson Mutunga, a computer scientist with a decade of experience in the ever-evolving field of computer science education. I am a dedicated and passionate trainer committed to shaping the next generation of tech professionals. My expertise spans a range of domains, including programming, networking, cybersecurity, and emerging technologies.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Over the years, I have empowered countless students with practical skills, fostering innovation and problem-solving abilities crucial in today&#39;s digital landscape. My teaching philosophy combines hands-on experience with theoretical depth, ensuring that learners grasp complex concepts effectively and confidently apply them in real-world scenarios.</span></span></p>'),
(2, 'Agriculture and Applied Sciences', 'department_images/agriculture.jpg', 'This department is one of the backbones of food productivity, quality checks and health practitioners. We pride? ourselves in quality learning that is field practice oriented, to produce innovative, and competent individuals.', 'Kevin K. Yatich', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This department is one of the backbones of food productivity, quality checks and health practitioners. We pride&nbsp; ourselves in quality learning that is field practice oriented, to produce innovative, and competent individuals. </span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The department has the following sections:</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Agriculture technology</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">the courses in agriculture are designed to equip trainees with knowledge and practical skills&nbsp; that enables them produce, process and to market agricultural&nbsp; produce for improved living. The trainee can train farmers in the informal sector and therefore enhancing agricultural productivity in the nation. With this knowledge, they can join formal and informal employment. Our curriculum is competency based to fully equip trainee practical skills applicable in the course.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;; font-size:12pt\">Those who graduate from&nbsp; level 4 are allowed to transit to level 5 who also can transit to level 6.</span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Applied science and health technology</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The section of applied science equips trainees with technological knowledge and skills applied to ensure quality of products and processes applied in industrial manufacturing. A trainee gaining these skills can apply them in research institutions and many formal employments both in industries and education.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Trainees who graduate from level 5 in science laboratory technology can advance to level 6 in either of the fields&nbsp; below:</span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in analytical chemistry </span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in science laboratory technology</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in food technology</span></span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The courses offered here are tailored to equip trainees with skills .</span></span></span></span><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Since inception, we have graduated trainees in the following courses:</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in agriculture</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in analytical chemistry</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Certificate in agriculture </span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Certificate in science laboratory technology</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">We look forward to welcoming you to this department and helping you achieve the career of your choice.</span></span></span></span></p>', 'hod_images/agriculture.jpg', '<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">I am a dedicated academic and departmental leader with a Bachelor of Science degree in Analytical Chemistry with Management from Kenyatta University. With a strong background in both scientific analysis and managerial principles, with a well-rounded practical approach to teaching and departmental leadership.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">As the head of department, I am committed to fostering academic excellence, promoting practical skill development, and guiding both students and staff towards achieving their educational and professional goals. His leadership is marked by integrity, innovation, and a passion for quality training in technical and applied sciences.</span></span></p>\r\n\r\n<p>&nbsp;</p>'),
(3, 'Hospitality and Institutional Management', 'department_images/catering_dep.jpg', 'To be a leading department in providing excellent technical and vocational training in tourism, hospitality and Institutional management to produce competent and innovative professionals.', 'Mrs. Nyambura Mwenda', '<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:14.0pt\">Programs Offered</span></strong><strong> </strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">1<span style=\"font-size:16px\">. Diploma and Certificate in Tourism Management </span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Focus: Tour operations, customer service, and travel agency management.</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Career Pathways: Tour guides and travel agents </span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">2. Diploma and Certificate in Food and Beverage production </span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Focus: Culinary arts, Chefs, Caterers </span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Career Pathways: Chefs, Caterers </span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">3. Diploma and Certificate in Food and Beverage Sales and service</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Focus: Food service personnel, customer care </span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Career Pathways: Restaurant supervisor, Event planners, </span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">4. Diploma and Certificate in Fashion and Design</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Focus: Garment construction, basic tailoring skills</span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Career Pathways: Pattern makers, Fashion entrepreneurs, Tailors, Stylist, Fashion designer </span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">5. Diploma and Certificate in Hairdressing and Beauty (cosmetology)</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Focus: Haircare, Skincare, makeup artists </span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Career Pathways: Spa managers, cosmetologist, skin care specialist, hairdressers </span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong>Facilities</strong>:</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">1. Modern training kitchen</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">2. Rooms for practical housekeeping and accommodation </span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">3. Fashion studios with modern equipment </span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">4. Beauty Therapy Labs for skincare, hairdressing and Cosmetology training</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Contact Information</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Head of Department </span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Hospitality and Institutional Management </span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Mwala Technical and Vocational College </span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">P.O.Box 07-90102, Mwala</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Tel: 0724793791</span></span></p>', 'hod_images/Hospitality.jpg', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">A highly motivated Hospitality Trainer with 8 years of delivering exceptional training and creating engaging and interactive learning experiences for her students, ensuring academic excellence, and preparing students for successful careers.<br />\r\nExpertise in a wide range of hospitality operations, customer service and industry best practices.<br />\r\nIndustry knowledge and experience puts my training abilities at an exceptional level of bridging the divide between training and industry requirements,<br />\r\nCommitted to fostering a culture of continuous learning and empowering students to reach their full potential.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Core Responsibilities<br />\r\n1.&nbsp;&nbsp; &nbsp;Integrate current industry trends, techniques, and technologies into the program to ensure students receive relevant and up-to-date training.<br />\r\n2.&nbsp;&nbsp; &nbsp;Conduct regular evaluations of faculty performance and provide constructive feedback to enhance teaching effectiveness.<br />\r\n3.&nbsp;&nbsp; &nbsp;Manage departmental budgets, ensuring efficient allocation of resources for equipment, supplies, and facilities.<br />\r\n4.&nbsp;&nbsp; &nbsp;Implement strategies to recruit and retain students, providing guidance and support throughout their academic journey.<br />\r\n5.&nbsp;&nbsp; &nbsp;Represent the department at conferences, competitions, and community events to promote the departments&#39; programs.<br />\r\n6.&nbsp;&nbsp; &nbsp;Excellent verbal and written communication skills for effective interaction with students, faculty, industry partners, and stakeholders.<br />\r\n7.&nbsp;&nbsp; &nbsp;Ability to identify challenges and implement innovative solutions to enhance program quality and student success.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The Head of Department Hospitality and Institutional Management, is a strategic leader responsible for the academic and operational success of the department. This role requires a blend of expertise, educational leadership, and a passion for fostering student development and industry&nbsp;connections.</span></span></p>'),
(4, 'Electrical and Electronic Engineering', 'department_images/mechanical_dep_uIXowEu.jpg', 'Welcome to the Department of Electrical and Electronic Engineering at Mwala Technical and Vocational College! Our department is proud to be led by Mr. Hawkins Annan, a dynamic and passionate trainer who is committed to excellence in the field of Electrical and Electronic Engineering. With a passion for innovation, our staff brings a wealth of experience and knowledge to guide our students towards a bright future.', 'Hawkins Annan Balewa', '<div class=\"WordSection1\">\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our department is divided into three sections, each specializing in a specific area of engineering. We offer market oriented, trainee centered, competency-based programs in three levels as described in the Kenya National Qualification Framework including:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">TVET CDACC Level 4 (Equivalent to Artisan Certificate)</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">TVET CDACC Level 5 (Equivalent to Craft Certificate)</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">TVET CDACC Level 6 (Equivalent to Diploma)</span></span></span></li>\r\n</ul>\r\n\r\n<ol style=\"list-style-type:upper-alpha\">\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><em><span style=\"color:#4f81bc\">Electrical and Electronic Engineering Section</span></em></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This section is headed by Mr. Eliud Yego. Courses in the section include:</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Engineering Level 6 (Power Option)</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Operator Level 5 (Power Option)</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Installation Level 6</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<div class=\"WordSection2\">\r\n<ol style=\"list-style-type:upper-alpha\">\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Installation Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Installation Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electronics Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electronics Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Telecommunication Engineering Level 6</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><em><span style=\"color:#4f81bc\">Medical Engineering Section</span></em></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This section is headed by Mr. Wyclife Owino. The Course in this section is:</span></span></p>\r\n\r\n<ol start=\"2\" style=\"list-style-type:upper-alpha\">\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Medical Engineering Level 6</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><em><span style=\"color:#4f81bc\">Mechanical and Automotive Engineering Section</span></em></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This section is Headed by Mr. Frankline Kibet. Courses in the section include:</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Automotive Engineering Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Automotive Technician Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Automotive Technician Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Plant Engineering Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Plant Engineering Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Production Technician Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Production Technician Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Production (Grinding and Fabrication) Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Welding and Fabrication Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Welding and Fabrication Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Welding (Manual Metal Arc and Gas metal Arc Welding) Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Driving (Assessed by NTSA)</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Electrical and Electronic Engineering Section</span></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Electrical and Electronic Engineering Section offers a wide range of programs designed to equip students with the knowledge and skills necessary to excel in the rapidly evolving field of electrical and electronic technology. From power systems to telecommunications, our programs cover it all.</span></span></p>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Medical Engineering Section</span></span></span></h1>\r\n\r\n<p style=\"margin-right:1px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">In the Medical Engineering Section, we offer a comprehensive Diploma (Level 6) program in Medical Engineering. This program prepares students for careers in the healthcare industry, where they play a vital role in maintaining and servicing medical equipment, ensuring the safe and effective delivery of healthcare services.</span></span></p>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Mechanical Engineering Section</span></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Mechanical Engineering Section offers a diverse set of diploma courses including plant engineering, production engineering, welding, fabrication and automotive engineering. These programs provide students with hands-on training and theoretical knowledge, making them well-</span></span></p>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>', 'hod_images/ANAN_1IYRzSA.jpg', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Hawkins Annan Balewa is a dedicated and forward-thinking educator committed to excellence in the field of Electrical and Electronic Engineering. Since joining Mwala Technical and Vocational College in September 2022 as a trainer, he has demonstrated exceptional leadership and technical expertise, culminating in his appointment as the second Head of the Electrical and Electronic Engineering Department on September 5, 2023. He holds a Bachelor&rsquo;s Degree in Technology Education (Electrical and Electronic Engineering) from Masinde Muliro University of Science and Technology. As a certified Trainer, Assessor, and Verifier licensed by the Technical and Vocational Education and Training Authority (TVETA), Hawkins is well-equipped to deliver high-quality training and assessments that align with industry standards. He is also a graduate member of the Institute of Engineering Technologists of Kenya, reflecting his commitment to professional growth and advancement in the engineering sector. Under his dynamic leadership, the Electrical and Electronic Engineering Department has experienced remarkable growth, solidifying its reputation for providing quality technical education. Hawkins continues to spearhead initiatives that enhance the department&#39;s curriculum, ensuring that trainees receive practical and industry-relevant skills essential for the modern workforce. Beyond his administrative role, Hawkins plays a crucial role in performance contracting, ensuring accountability and goal-setting within the institution. He remains actively engaged in mentoring, training, and advocates for competency-based education and skilling, fostering an environment that encourages innovation, collaboration, and professional excellence. His dedication to advancing technical education and promoting engineering excellence remains at the core of his vision for the department and its trainees. His involvement in the college&rsquo;s resource&nbsp;mobilization committee showcases his commitment to securing funds and partnerships to support institutional growth and sustainability.</span></span></p>\r\n\r\n<p>&nbsp;</p>'),
(5, 'Building & Civil Engineering', 'department_images/building_prof_HNdShdB.jpg', 'Welcome to the Department of Building and Civil Engineering at Mwala Technical and Vocational College Our department is proud to be led by Mr. Hawkins Annan, a dedicated and visionary leader with a deep passion for empowering the next generation of building and civil engineering professionals. With a strong background in construction, Edwin brings both practical experience and academic excellence to the department.', 'Edwin Radindi', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Welcome to the Department of Building and Civil Engineering at Mwala Technical and Vocational College. Our department is proud to be led by Mr. Edwin Radindi, a dedicated and visionary leader with a deep passion for empowering the next generation of building and civil engineering professionals. With a strong background in construction, Edwin brings both practical experience and academic excellence to the department.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The building and civil engineering department is dedicated to producing highly skilled professionals in the construction and civil engineering industries. The department focuses on equipping trainees with the technical expertise, problem-solving skills, and hands-on experience necessary to meet industry standards and address modern infrastructure challenges.</span></span><br />\r\n<span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">To be a leading center of excellence in training competent professionals for the building and civil engineering sectors, contributing to sustainable development locally and globally.</span></span><br />\r\n<span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">To provide high-quality, industry-relevant training and practical knowledge that empowers trainees to excel in the building and civil engineering fields while fostering innovation, ethical practices, and sustainable construction methods.</span></span></p>\r\n\r\n<hr />\r\n<p><strong>PROGRAMS OFFERED</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Artisan in Building Level 4</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Artisan in Plumbing Level 4</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Craft Certificate in Building Level 5</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Craft Certificate in Plumbing Level 5</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Craft Certificate in Land Survey Level 5</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Diploma in Building Technology Level 6</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Diploma in Land Survey Level 6</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\">Diploma in Civil Engineering Level 6</span></span></p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<p><strong>FACILITIES</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Advanced computer labs equipped with design software like AutoCAD and CADD</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Workshop for practical skills training in masonry, carpentry, and plumbing</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Field equipment for building and plumbing studies</span></span></p>\r\n	</li>\r\n	<li>\r\n	<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Resourceful library with up-to-date construction and engineering references</span></span></p>\r\n	</li>\r\n</ul>', 'hod_images/building_dep_rcoVrUt.jpg', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Mr. Edwin Otieno Radindi is the Head of Department for Building and Civil Engineering at Mwala Technical and Vocational College.<br />\r\nA passionate and forward-thinking educator, he is committed to advancing practical, industry-aligned technical education that empowers young people with employable skills and real-world problem-solving abilities.<br />\r\n<br />\r\nHe is currently awaiting graduation with a Bachelor of Technology in Civil Engineering from the Technical University of Mombasa, and is pursuing a Diploma in Technical Education at the Kenya School of TVET.<br />\r\nHe also holds a Diploma in Building Technology (2018), and completed a Head of Department and Management Course at KSTVET in 2022.<br />\r\n<br />\r\nAs HOD, Mr. Radindi has led several initiatives to transform his department, including:<br />\r\n- Increasing trainee enrolment with a target of over 2,000 learners,<br />\r\n- Enhancing hands-on and workshop-based training for greater industry relevance,<br />\r\n- Mentoring trainers and leading performance-based staff development,<br />\r\n- Establishing linkages with industry stakeholders for job attachment and skills matching,<br />\r\n- Supporting the adoption of Competency-Based Education and Training (CBET) and curriculum reforms.<br />\r\n<br />\r\nMr. Radindi believes that technical training should be responsive, innovative, and anchored in community development.<br />\r\nHis leadership philosophy is built on teamwork, accountability, and outcome-based learning.<br />\r\n<br />\r\nHis vision is to grow the department into a regional center of excellence for civil engineering and construction training,<br />\r\nproducing graduates who are not only employable but also capable of contributing meaningfully to national development goals.<br />\r\n<br />\r\nHe is a registered member of the National Construction Authority (NCA) and the Institute of Engineering Technologists and Technicians (IET).<br />\r\nHe also actively participates in the Kenya Association of Technical Training Institutions (KATTI) and national TVET forums focusing on curriculum improvement, capacity building, and youth empowerment.</span></span></p>');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_feedback`
--

CREATE TABLE `mwala_app_feedback` (
  `id` bigint(20) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `visit_date` date NOT NULL,
  `time_in` time(6) NOT NULL,
  `time_out` time(6) NOT NULL,
  `department_choices` varchar(255) NOT NULL,
  `service_rating` varchar(20) NOT NULL,
  `complaints` varchar(3) NOT NULL,
  `complaints_description` longtext DEFAULT NULL,
  `compliments` varchar(3) NOT NULL,
  `compliments_description` longtext DEFAULT NULL,
  `submitted_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_feedback`
--

INSERT INTO `mwala_app_feedback` (`id`, `organization_name`, `visit_date`, `time_in`, `time_out`, `department_choices`, `service_rating`, `complaints`, `complaints_description`, `compliments`, `compliments_description`, `submitted_at`) VALUES
(1, 'Githui', '2024-12-31', '10:24:00.000000', '12:24:00.000000', '[\'Finance\']', 'Excellent', 'No', '', 'No', '', '2025-02-20 10:03:43.572000'),
(2, 'Githui', '2024-12-31', '10:24:00.000000', '12:24:00.000000', '[\'Finance\']', 'Excellent', 'No', '', 'No', '', '2025-02-20 10:03:43.572000'),
(3, 'Mwangi', '2025-01-31', '14:23:00.000000', '15:23:00.000000', '[\'Principal\']', 'Excellent', 'Yes', 'I love the service', 'Yes', 'Will join later', '2025-02-20 10:03:43.572000');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_imagegallery`
--

CREATE TABLE `mwala_app_imagegallery` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_imagegallery`
--

INSERT INTO `mwala_app_imagegallery` (`id`, `date`, `image`, `description`, `title`) VALUES
(1, '2025-01-10', 'imageGallery/catering_dep_3JDKbyK.jpg', '', 'Catering & Accommodation Department'),
(2, '2025-01-06', 'imageGallery/ict_dep.jpg', NULL, NULL),
(3, '2025-01-10', 'imageGallery/mechanical_dep1.jpg', NULL, NULL),
(4, '2025-01-10', 'imageGallery/mwala_img3.jpg', NULL, NULL),
(5, '2025-01-10', 'imageGallery/mwala_img4.jpg', 'none', 'Catering & Accommodation Department'),
(6, '2025-05-28', 'imageGallery/mwala_caurosel2.jpg', NULL, 'Cultural Day'),
(7, '2025-05-28', 'imageGallery/mwala_caurosel1.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_jobsvacancies`
--

CREATE TABLE `mwala_app_jobsvacancies` (
  `id` bigint(20) NOT NULL,
  `position` varchar(200) NOT NULL,
  `deadlineDate` date NOT NULL,
  `uploadJobs` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_news`
--

CREATE TABLE `mwala_app_news` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `video_attachment` varchar(100) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_news`
--

INSERT INTO `mwala_app_news` (`id`, `title`, `description`, `image`, `video_attachment`, `date`) VALUES
(1, 'Catering  Department Block Launching', '<p>The meeting will be held at Mwala ground and many leaders in Machakos County are expected to attend.</p>', 'news/images/catering_dep.jpg', '', '2025-01-11'),
(2, 'Awarding National Gnvt.', 'The college had a strategic meeting with the Assistant County Commissioner and Chiefs to chat the way forward in boosting the population of the college. This is the fourth time the team is meeting in the college', 'news/images/mechanical_dep1.jpg', '', '2025-01-11'),
(3, 'Mechanical Department Celebration.', 'The helb officials were in the college on 1st October to sensitize trainees on HELB Application and assist them in solving application challenges. During the same period, many trainees were assisted to apply.', 'news/images/mechanical_dep.jpg', '', '2025-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_notice`
--

CREATE TABLE `mwala_app_notice` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `uploadNotice` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_notice`
--

INSERT INTO `mwala_app_notice` (`id`, `title`, `date`, `uploadNotice`) VALUES
(1, 'Training Timetable (Sep -Dec)', '2025-01-05', 'notices/receipt_2.pdf'),
(2, 'Application Form', '2025-01-05', 'notices/application_form_2_pTXgKjg.pdf'),
(8, 'fee structure', '2025-01-11', 'notices/Fees_structure_for_second_year__Under_new_Funding_model_p2PLhXK.pdf'),
(11, 'Clearance Form', '2025-04-04', 'notices/MTVC_CLEARANCE_FORM_524WW3N.pdf'),
(12, 'Course Transfer Form', '2025-04-04', 'notices/COURSE-TRANSFER-FORM_icFLGrY.pdf'),
(13, 'Fee Refunding Form', '2025-04-04', 'notices/Fees_Rfund_form_Ecrossx.pdf'),
(14, 'Service Delivery Charter', '2025-04-04', 'notices/Mwala_tvc_service_charter__haK9sWu.pdf'),
(15, 'Rules & Regulations', '2025-04-04', 'notices/MWALA_TVC_rules_Rh6jhRo.pdf'),
(16, 'Recognition of Prior Learning in Kenya Framework', '2025-05-12', 'notices/RECOGNITION-OF-PRIOR-LEARNING-IN-KENYA_Framework-1-June-2021-1.pdf'),
(17, 'Vision 2030 Policy', '2025-05-12', 'notices/Vision-2030-Popular-Version.pdf'),
(18, 'A Policy Framework for Education and Training', '2025-05-12', 'notices/A-POLICY-FRAMEWORK-FOR-EDUCATION-AND-TRAINING-1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_studentaffairs`
--

CREATE TABLE `mwala_app_studentaffairs` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_supportingdepartment`
--

CREATE TABLE `mwala_app_supportingdepartment` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `hod_name` varchar(150) NOT NULL,
  `hod_message` longtext NOT NULL,
  `position` varchar(100) NOT NULL,
  `hod_information` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mwala_app_supportingdepartment`
--

INSERT INTO `mwala_app_supportingdepartment` (`id`, `title`, `image`, `hod_name`, `hod_message`, `position`, `hod_information`) VALUES
(1, 'Sports and Recreation Office', 'supporting_departments/james.jpg', 'JAMES NYAVOGA', '<p style=\"margin-left:448px\">&nbsp;</p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The sports and recreationDepartment at&nbsp; Mwala TVC is dedicated to nurturing physical fitness , teamwork and personal growth among trainees&nbsp; and staffs, the deparrtmenthas become a dynamic hub for sports excellence and recreational engagement</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:#3498db\">Key Responsibilities And Activities</span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Sports Programs: Organizing and managing college teams in various sports, including football, volleyball, basketball, athletics, and indoor games.</span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Recreational Activities: Hosting wellness programs, fitness sessions, and fun events that promote mental and physical well-being.</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Facilities Management: Overseeing the maintenance and improvement of sports grounds, gym facilities, and recreational spaces.</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Talent Development: Identifying and nurturing talented athletes, providing opportunities for participation in local and national competitions.</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Inclusive Participation: Encouraging widespread involvement in sports and recreation, ensuring that every student has access to physical activities regardless of skill level.</span></span></li>\r\n	<li><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Community Engagement: Collaborating with external organizations and institutions to promote sports and community-based recreational events.</span></span></li>\r\n</ul>\r\n\r\n<p style=\"margin-left:96px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Under James Nyavoga&rsquo;s guidance, the department continues to thrive, creating a vibrant environment where students and staff can excel both academically and physically. His commitment to holistic development ensures that Mwala TVC remains a leader in sports and recreational excellence.</span></span></p>', 'Head Of Sports and Recreation', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">James Nyavoga is a seasoned sports educator and leader: a qualified player turned coach, celebrated for leading teams to regional championships, achieving a top-four finish in national netball, and mentoring athletes to national podiums in table tennis. His dedication to training and development makes him a pillar in the Sport &amp; Recreation department.</span></span></p>'),
(2, 'Industrial Liaison Office', 'supporting_departments/ILO_MzaZvpJ.jpg', 'Ms. June Benson', '<h1 style=\"margin-right:416px\">&nbsp;</h1>\r\n\r\n<p style=\"margin-right:1px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Welcome to the Industrial Liaison Office (ILO) at Mwala Technical and Vocational College. Our office serves as the vital link between the college and the industry, fostering a symbiotic relationship that benefits both our students and industry partners. By bridging the gap between academic learning and practical industry demands, we ensure that our students are well-prepared for the dynamic workforce.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our mission is to create and nurture partnerships between Mwala Technical and Vocational College and various industry sectors. We aim to enhance the practical skills and employability of our students by providing them with opportunities for internships, industrial attachments, and collaborative projects with industry experts.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The Industrial Liaison Office offers a range of services, including:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Internship and Industrial Attachment Placements: Coordinating placements for students to gain hands-on experience in their respective fields.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Industry Collaboration: Facilitating partnerships and collaborative projects between the college and industry partners.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Career Guidance and Counseling: Providing students with career advice, job search strategies, and professional development resources.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Workshops and Seminars: Organizing events featuring industry leaders to share insights and knowledge with students and faculty.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Alumni Engagement: Maintaining a strong network of alumni who can contribute to the growth and development of current students.</span></span></span></li>\r\n</ul>', 'Head Of Industrial Liaison Office (ILO)', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">June Benson is a passionate and forward-thinking professional committed to advancing technical education and institutional excellence. Since joining Mwala Technical and Vocational College, she has played a vital role in enhancing industry-academic collaboration, institutional productivity, and administrative coordination. Her strong leadership and dedication led to her appointment as the Head of the Industrial Liaison Office (ILO) in October 2024.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Ms. June Benson is a dedicated and visionary professional in the field of Medical Engineering, with a strong background in education, industrial relations, and institutional leadership. She holds a Bachelor of Science in Medical Engineering from the Technical University of Mombasa (TUM) and is a certified Trainer, Assessor, and Verifier licensed by the Technical and Vocational Education and Training Authority (TVETA). As a committed member of the Association of Medical Engineering of Kenya (AMEK), she actively contributes to professional development, ethics, and innovation in the field of medical engineering.</span></span> <span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">She gained hands-on industry experience working as an equipment servicing personnel at Morab Ltd., where she was responsible for maintaining and repairing a wide range of biomedical devices. Additionally, she completed her internship at Shalom Community Hospital, where she worked as a biomedical engineer, assisting with the installation, testing, and maintenance of hospital equipment.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Since taking office as the Head of the ILO Department in October 2024, Ms. Benson has championed a transformative agenda focused on bridging the gap between education and industry. Under her leadership, the ILO department has undergone significant restructuring and innovation, ensuring that students at Mwala TVC gain meaningful practical experiences. Her key achievements include expansion of industrial attachment networks, and establishment of monitoring and evaluation tools for industrial attachment assessment.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Ms. Benson has successfully initiated and formalized partnerships with a wide array of stakeholders, including public and private industries. Through her efforts, the college has signed multiple Memorandums of Understanding (MoUs), which have resulted in increased opportunities for student internships, attachments, industrial visits, and on-the-job training, all of which are essential for enhancing employability and real-world skills.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">In her capacity as Productivity Mainstreaming Chair, she has led numerous institutional initiatives to ensure efficient service delivery and measurable improvements in performance. She works collaboratively with the Performance Contract (PC) Coordinator to develop productivity indicators, track institutional targets, and facilitate regular reporting. Her leadership has contributed to fostering a culture of accountability, innovation, and continuous improvement within the college.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Ms. Benson continues to lead with passion, professionalism, and a commitment to institutional advancement. Her strategic vision aligns technical training with evolving market demands, helping to prepare students to meet the expectations and challenges of the modern workforce. She remains a strong advocate for inclusive education, sustainable partnerships, and lifelong learning.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Her dedication to excellence makes her a key pillar in Mwala TVC&rsquo;s growth, innovation, and contribution to national development.</span></span></span></span></p>'),
(3, 'Office of Career Services', 'supporting_departments/career-service_toyGpkp.jpg', 'Mary Ngiki', '<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our vision is to empower students and alumni with the skills, resources, and opportunities needed to excel in their careers and contribute meaningfully to society.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">TOur mission is to facilitate career development and professional growth by fostering strong partnerships with industry stakeholders, offering personalized career guidance, and supporting students in achieving their career goals.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Core Functions</span></strong></span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Career Guidance and Counseling</span></strong></span></span>\r\n\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Offer personalized career counseling sessions to help students identify their strengths, interests, and career paths.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Conduct career aptitude tests and self-assessment workshops.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Industrial Linkages and Partnerships</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Establish and maintain partnerships with industries and organizations for internships, attachments, and employment opportunities.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Collaborate with industry stakeholders to align training programs with market demands.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Job Placement and Internship Coordination</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Facilitate job placement and internship opportunities for students and alumni.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Maintain a database of job openings and internship programs relevant to students&#39; fields of study.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Skills Development and Training</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Organize workshops, seminars, and training programs on soft skills, interview preparation, and CV writing.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Provide resources for entrepreneurial development and self-employment strategies.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Career Fairs and Networking Events</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Host career fairs, networking events, and employer engagement activities to connect students with potential employers.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Invite industry leaders for guest lectures and panel discussions.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Alumni Engagement</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Maintain a robust alumni network to support mentorship and career opportunities for current students.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Involve alumni in offering career talks and professional development initiatives.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Key Services Offered</span></strong></span></span></p>\r\n\r\n<ol start=\"5\" style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Career Counseling</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Internship and Job Placement</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">CV and Cover Letter Review</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Interview Coaching</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Workshops and Seminars</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Employer Networking Opportunities</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Alumni Mentorship Programs</span></span></span></li>\r\n</ol>', 'Head Of Career Services', ''),
(4, 'Quality Assurance & Standards Office', 'supporting_departments/quality-assurance_cq9du6c.jpg', 'Faith Mumbe Musyoka', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">At Mwala Technical and Vocational College, the Quality Assurance department plays a pivotal role in maintaining and enhancing the institution&#39;s commitment to academic and operational excellence. By fostering a culture of continuous improvement, we ensure that our programs, services, and policies consistently meet and exceed the highest standards in technical and vocational education.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our vision is to drive quality assurance processes that empower learners, equip educators, and strengthen systems to deliver globally competitive and industry-aligned training.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our mission is to position Mwala Technical and Vocational College as a leader in quality education, producing graduates who are highly skilled, ethical, and ready to meet the demands of a dynamic workforce</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">In today&rsquo;s competitive environment, quality assurance is the backbone of educational success. Our department is dedicated to creating a learning ecosystem that prioritizes student satisfaction, fosters innovation, and promotes sustainable development.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Core Functions</span></span></span></strong></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Monitoring and Evaluation:</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Regularly assessing programs and services to ensure alignment with institutional goals and national education standards.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Stakeholder Engagement:</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Collaborating with students, faculty, industry partners, and regulatory bodies to ensure feedback-driven improvements.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Accreditation and Compliance:</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Ensuring adherence to national and international quality benchmarks for technical and vocational training.</span></span></span></span></li>\r\n</ul>', 'Head of Quality Assurance & Standards', '<p><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Hello! My name is Faith Musyoka. </span></span><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">I&rsquo;m passionate about fostering an environment where every student&rsquo;s potential is recognized and supported. I acknowledge that continuous improvement is not just a goal but a shared journey. With a background rooted in education, I am committed to upholding the highest standards, driven by the belief that quality education transforms lives and communities.</span></span></p>'),
(5, 'Finance Office', 'supporting_departments/finance_mwala_vMcCzb1.jpg', 'Mr. Nzioki Bernard', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Finance department in Mwala Technical and Vocational College forms part of the integral management team. The department play critical role in sourcing, and sound financial management aimed at getting the best out of the college&rsquo;s service delivery.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Roles</span></span></strong></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Form part of the team preparing the strategic plan that acts as the guideline for all institutional planning. </span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Work in conjunction with the departmental heads in the preparation of annual budgets estimates for revenues and expenditure.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Custodian of institutional assets and resources to enhance optimal utilization and safeguard assets for the benefit of all stakeholders.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Aid in ensuring lawful expenditure within the institution and ensure proper authorization of all transactions committing institutions&rsquo; resources.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;In charge of the preparation and maintaining of financial and accounting records as per the guidelines of PFM Act of 2012.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Prepare and make submission of the required statutory reports as and when required by the PFM Act and any other relevant Circular as may be issued from time to time.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Continuous updates and follow up on fees collection from students and funds from other agencies for effective, efficiency use and to meet transparency requirements.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Assist in both internal and external audit through provision of sufficient evidence on accounting transactions as well as responding to matters raised by the AG office.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Provide disclosure on any fraud, losses or non-compliance with the PFM Act.</span></span></span></span></li>\r\n</ol>', 'Head of Finance Office', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">CPA Bernard Nzioki<br />\r\nCPA Bernard Nzioki is a dedicated and results-oriented finance professional currently serving as the Finance Officer at Mwala Technical and Vocational College (Mwala TVC). He brings with him a wealth of experience in financial management, accounting, and training, underpinned by a strong academic and professional background.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Mr. Nzioki holds a Bachelor of Commerce degree in Accounting from Machakos University. He is also a Certified Public Accountant of Kenya (CPA-K), holding membership number 31015. His academic and professional qualifications have equipped him with a deep understanding of financial reporting, budgeting, compliance, auditing and internal controls.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Prior to his current role at Mwala TVC, CPA Nzioki served at Uwezo Kenya Limited from 2016 to 2022. During his tenure, he held the dual responsibilities of Assistant Accountant and Accounting Trainer. In these roles, he was instrumental in maintaining accurate financial records, preparing management reports, and imparting accounting knowledge and skills to staff and trainees.</span></span><br />\r\n&nbsp;</p>'),
(6, 'Performance Contracting Office', 'supporting_departments/contracting_office_737Jq5h.jpg', 'Mr. Mathew Ndunda Ngui', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Mwala Technical and Vocational College and Technology joined implementation of Performance Contracting cycle since the 2022/2023 financial year.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The Performance Contracting Coordinator guides the PC drafting, negotiation, vetting, and implementation of the agreed document between the Mwala TVC Management and the Ministry of Education.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The Performance Contracting document is guided by the Mwala TVC Strategic Plan, Work Plan, Budget, and Procurement Plan. These documents are essential in the implementation of the agreed document.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Performance Contracting is a vital management tool that enables Mwala Technical and Vocational College policymakers to define expectations and responsibilities for staff to achieve mutually agreed goals.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">The objective is to enhance a strong and distinct image of college governance. This is achieved by ensuring improved processes, adopting a positive work ethic, and creating new behavior patterns in service delivery.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Performance Contracting is a public sector reform aimed at improving efficiency and effectiveness in the management of the Public Service. The Performance Contracting tool measures performance against negotiated performance targets.</span></span></p>', 'Management Representative & Performance Contracting', '<p><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Mathew </span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">holds Bachelor of Technology in Textiles from Moi University, Post graduate Diploma in Education from Kenyatta University, and Currently pursuing Masters in Design (Fashion Design) in Machakos University.&nbsp; </span></span><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Mathew </span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">holds Bachelor of Technology in Textiles from Moi University, Post graduate Diploma in Education from Kenyatta University, and Currently pursuing Masters in Design (Fashion Design) in Machakos University.&nbsp; </span></span></p>'),
(7, 'Examinations & timetabling Office', 'supporting_departments/Wambua.jpg', 'Nthenge Wambua', '<p style=\"text-align:left\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">Welcome to the Examinations &amp; timetabling Office at Mwala Technical &amp; Vocational College. &nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-right:23px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">Our mission is to ensure that all assessments and examinations are conducted smoothly, fairly, and in strict accordance with academic regulations. We understand that examinations are a vital part of your academic journey, and we are here to support you every step of the way from registration and timetables to results and certifications. &nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-right:23px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">The Examinations Office is committed to upholding integrity, transparency, and confidentiality in all exam-related matters. We work closely with faculty, departments, and external bodies to provide a structured and stress-reduced examination process. </span></span></span></p>\r\n\r\n<p style=\"margin-right:23px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">As the Timetabling and Examinations Officer, I am responsible for the planning, coordination, and administration of both academic timetables and examination processes across the institution. My aim is to ensure that all scheduling and assessments are conducted in a well-organized, fair, and transparent manner to support the academic success of our students and the smooth operation of teaching and learning. </span></span></span></p>\r\n\r\n<p style=\"margin-right:23px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">With a background in Mechanical Engineering, I apply a methodical and problem-solving mindset to this role, ensuring precision, efficiency, and adherence to academic policies. I understand the importance of effective time management and assessment integrity in the academic journey, and I am committed to providing reliable services that reflect these values. </span></span></span></p>\r\n\r\n<p style=\"margin-right:23px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">Students and staff are encouraged to regularly check the college website and official notices for updates on timetables, examination schedules, and relevant guidelines. &nbsp;</span></span></span></p>', 'Examination & Timetabling Office', '<p style=\"margin-right:1px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">Nthenge Wambua holds a bachelor of engineering &nbsp;(Mechanical Engineering) from the Technical University of Kenya (TUK) and currently finalizing his Postgraduate Diploma in Education (PGDE) at KCA University. His aspiration for academia began with teaching in several high schools while he was in university and joining the TVET directorate at several universities after graduating in 2019 as a part-time tutor. Nthenge Wambua holds a bachelor of engineering (Mechanical Engineering) from the Technical University of Kenya (TUK) and currently finalizing his Postgraduate Diploma in Education (PGDE) at KCA University. His aspiration for academia began with teaching in several high schools while he was in university and joining the TVET directorate at several universities after graduating in 2019 as a parttime tutor. </span></span></span></p>\r\n\r\n<p style=\"margin-right:1px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">Nthenge has run the department for over 3 years, since when the college started with less than 100 trainees in 2021 and now with over 3000 trainees. His professional qualifications include registration with the Engineers Board of Kenya (EBK) as a graduate engineer in the field of mechanical engineering. As a professional with a background in Mechanical Engineering, I will bring a structured, analytical, and detail-oriented approach to my role as Examinations Officer. The precision and discipline inherent in engineering have shaped my commitment to accuracy, fairness, and efficiency in managing all examination-related processes. </span></span></span></p>\r\n\r\n<p style=\"margin-right:23px; text-align:justify\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\"><span style=\"color:black\">In this capacity, I am dedicated to upholding the academic integrity of the institution by ensuring that all assessments are conducted in a transparent and orderly manner, adhering strictly to institutional and regulatory standards. My goal is to support both students and faculty by providing clear guidance, timely communication, and reliable administration throughout the examination cycle. </span></span></span></p>'),
(8, 'Research & Innovation Office', 'supporting_departments/Yego.jpg', 'Mr. Eliud K. Yego', '<p style=\"text-align:left\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Mwala TVC has established itself as a <strong>leading institution in technical education</strong>, actively promoting <strong>science, technology, and innovation (STI)</strong> through hands-on learning and competitive platforms. The college integrates <strong>engineering, robotics, and industrial training</strong> into its curriculum, ensuring students gain <strong>practical experience</strong> that aligns with industry demands. </span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:left\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Mwala TVC has been a <strong>consistent participant</strong> in national and regional <strong>skills and robotics competitions</strong>, including the <strong>Kenya Association of Technical Training Institutions (KATTI) Trade Fair</strong>. These events provide students with opportunities to: </span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Showcase <strong>innovative projects</strong> in electrical and electronic engineering.</span></span> </span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Compete in <strong>robotics challenges</strong>, demonstrating problem-solving and technical expertise.</span></span> </span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\">&nbsp;<span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Engage with <strong>industry professionals</strong>, fostering collaboration and career development.</span></span> </span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:left\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Through its <strong>active involvement in trade fairs and competitions</strong>, Mwala TVC has: </span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Enhanced <strong>student creativity and technical proficiency</strong>.</span></span> </span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Strengthened <strong>industry partnerships</strong>, leading to internship and job placement opportunities.</span></span> </span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Contributed to <strong>Kenya&rsquo;s STI agenda</strong>, supporting national goals for technological advancement.</span></span> </span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"color:black\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Mwala TVC aims to <strong>expand its innovation programs</strong>, incorporating <strong>advanced automation<span style=\"background-color:yellow\">,</span> AI-driven systems, and sustainable energy solutions</strong> into its curriculum. The institution continues to <strong>empower students</strong> with the skills needed to excel in <strong>modern technical fields</strong>. </span></span></span></span></span></p>', 'Head of Research & Innovation Office', '');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_tenders`
--

CREATE TABLE `mwala_app_tenders` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `deadlineDate` date NOT NULL,
  `uploadJobs` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mwala_app_administration`
--
ALTER TABLE `mwala_app_administration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_admissionapplication`
--
ALTER TABLE `mwala_app_admissionapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mwala_app_admissiona_department_id_a30b3c7b_fk_mwala_app` (`department_id`),
  ADD KEY `mwala_app_admissionapplication_course_id_8a1afa51` (`course_id`);

--
-- Indexes for table `mwala_app_brochures`
--
ALTER TABLE `mwala_app_brochures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_contact`
--
ALTER TABLE `mwala_app_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_course`
--
ALTER TABLE `mwala_app_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mwala_app_course_department_id_eb259c4f_fk_mwala_app` (`department_id`);

--
-- Indexes for table `mwala_app_department`
--
ALTER TABLE `mwala_app_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_feedback`
--
ALTER TABLE `mwala_app_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_imagegallery`
--
ALTER TABLE `mwala_app_imagegallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_jobsvacancies`
--
ALTER TABLE `mwala_app_jobsvacancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_news`
--
ALTER TABLE `mwala_app_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_notice`
--
ALTER TABLE `mwala_app_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_studentaffairs`
--
ALTER TABLE `mwala_app_studentaffairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_supportingdepartment`
--
ALTER TABLE `mwala_app_supportingdepartment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_tenders`
--
ALTER TABLE `mwala_app_tenders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `mwala_app_administration`
--
ALTER TABLE `mwala_app_administration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mwala_app_admissionapplication`
--
ALTER TABLE `mwala_app_admissionapplication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mwala_app_brochures`
--
ALTER TABLE `mwala_app_brochures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mwala_app_contact`
--
ALTER TABLE `mwala_app_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mwala_app_course`
--
ALTER TABLE `mwala_app_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `mwala_app_department`
--
ALTER TABLE `mwala_app_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mwala_app_feedback`
--
ALTER TABLE `mwala_app_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mwala_app_imagegallery`
--
ALTER TABLE `mwala_app_imagegallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mwala_app_jobsvacancies`
--
ALTER TABLE `mwala_app_jobsvacancies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mwala_app_news`
--
ALTER TABLE `mwala_app_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mwala_app_notice`
--
ALTER TABLE `mwala_app_notice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mwala_app_studentaffairs`
--
ALTER TABLE `mwala_app_studentaffairs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mwala_app_supportingdepartment`
--
ALTER TABLE `mwala_app_supportingdepartment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mwala_app_tenders`
--
ALTER TABLE `mwala_app_tenders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mwala_app_admissionapplication`
--
ALTER TABLE `mwala_app_admissionapplication`
  ADD CONSTRAINT `mwala_app_admissiona_course_id_8a1afa51_fk_mwala_app` FOREIGN KEY (`course_id`) REFERENCES `mwala_app_course` (`id`),
  ADD CONSTRAINT `mwala_app_admissiona_department_id_a30b3c7b_fk_mwala_app` FOREIGN KEY (`department_id`) REFERENCES `mwala_app_department` (`id`);

--
-- Constraints for table `mwala_app_course`
--
ALTER TABLE `mwala_app_course`
  ADD CONSTRAINT `mwala_app_course_department_id_eb259c4f_fk_mwala_app` FOREIGN KEY (`department_id`) REFERENCES `mwala_app_department` (`id`);
--
-- Database: `myhmsdb`
--
CREATE DATABASE IF NOT EXISTS `myhmsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myhmsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `admintb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttb`
--

CREATE TABLE `appointmenttb` (
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `doctor` varchar(30) NOT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointmenttb`
--

INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`) VALUES
(4, 1, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Ganesh', 550, '2020-02-14', '10:00:00', 1, 0),
(4, 2, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Dinesh', 700, '2020-02-28', '10:00:00', 0, 1),
(4, 3, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Amit', 1000, '2020-02-19', '03:00:00', 0, 1),
(11, 4, 'Shraddha', 'Kapoor', 'Female', 'shraddha@gmail.com', '9768946252', 'ashok', 500, '2020-02-29', '20:00:00', 1, 1),
(4, 5, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Dinesh', 700, '2020-02-28', '12:00:00', 1, 1),
(4, 6, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Ganesh', 550, '2020-02-26', '15:00:00', 0, 1),
(2, 8, 'Alia', 'Bhatt', 'Female', 'alia@gmail.com', '8976897689', 'Ganesh', 550, '2020-03-21', '10:00:00', 1, 1),
(5, 9, 'Gautam', 'Shankararam', 'Male', 'gautam@gmail.com', '9070897653', 'Ganesh', 550, '2020-03-19', '20:00:00', 1, 0),
(4, 10, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Ganesh', 550, '0000-00-00', '14:00:00', 1, 0),
(4, 11, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Dinesh', 700, '2020-03-27', '15:00:00', 1, 1),
(9, 12, 'William', 'Blake', 'Male', 'william@gmail.com', '8683619153', 'Kumar', 800, '2020-03-26', '12:00:00', 1, 1),
(9, 13, 'William', 'Blake', 'Male', 'william@gmail.com', '8683619153', 'Tiwary', 450, '2020-03-26', '14:00:00', 1, 1),
(0, 14, 'Doughlas', 'Githui', 'Male', 'githuiddoughlas8@gmail.com', '0712345567', 'Dinesh', 700, '2025-06-26', '12:30:00', 1, 1),
(0, 15, 'Peter', 'Maina', 'Male', 'maina@gmail.com', '0789456334', 'arun', 600, '2025-06-25', '13:58:00', 1, 1),
(7, 16, 'Nancy', 'Deborah', 'Female', 'nancy@gmail.com', '9128972454', 'ashok', 500, '2025-06-25', '18:43:00', 1, 1),
(10, 17, 'Peter', 'Norvig', 'Male', 'peter@gmail.com', '9609362815', 'Kumar', 800, '2025-06-26', '15:17:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Anu', 'anu@gmail.com', '7896677554', 'Hey Admin'),
(' Viki', 'viki@gmail.com', '9899778865', 'Good Job, Pal'),
('Ananya', 'ananya@gmail.com', '9997888879', 'How can I reach you?'),
('Aakash', 'aakash@gmail.com', '8788979967', 'Love your site'),
('Mani', 'mani@gmail.com', '8977768978', 'Want some coffee?'),
('Karthick', 'karthi@gmail.com', '9898989898', 'Good service'),
('Abbis', 'abbis@gmail.com', '8979776868', 'Love your service'),
('Asiq', 'asiq@gmail.com', '9087897564', 'Love your service. Thank you!'),
('Jane', 'jane@gmail.com', '7869869757', 'I love your service!'),
('Doughlas', 'githuiddoughlas8@gmail.com', '0786945624', 'Good services');

-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

CREATE TABLE `doctb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctb`
--

INSERT INTO `doctb` (`username`, `password`, `email`, `spec`, `docFees`) VALUES
('ashok', 'ashok123', 'ashok@gmail.com', 'General', 500),
('arun', 'arun123', 'arun@gmail.com', 'Cardiologist', 600),
('Dinesh', 'dinesh123', 'dinesh@gmail.com', 'General', 700),
('Ganesh', 'ganesh123', 'ganesh@gmail.com', 'Pediatrician', 550),
('Kumar', 'kumar123', 'kumar@gmail.com', 'Pediatrician', 800),
('Amit', 'amit123', 'amit@gmail.com', 'Cardiologist', 1000),
('Abbis', 'abbis123', 'abbis@gmail.com', 'Neurologist', 1500),
('Tiwary', 'tiwary123', 'tiwary@gmail.com', 'Pediatrician', 450);

-- --------------------------------------------------------

--
-- Table structure for table `patreg`
--

CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patreg`
--

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(1, 'Ram', 'Kumar', 'Male', 'ram@gmail.com', '9876543210', 'ram123', 'ram123'),
(2, 'Alia', 'Bhatt', 'Female', 'alia@gmail.com', '8976897689', 'alia123', 'alia123'),
(3, 'Shahrukh', 'khan', 'Male', 'shahrukh@gmail.com', '8976898463', 'shahrukh123', 'shahrukh123'),
(4, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'kishan123', 'kishan123'),
(5, 'Gautam', 'Shankararam', 'Male', 'gautam@gmail.com', '9070897653', 'gautam123', 'gautam123'),
(6, 'Sushant', 'Singh', 'Male', 'sushant@gmail.com', '9059986865', 'sushant123', 'sushant123'),
(7, 'Nancy', 'Deborah', 'Female', 'nancy@gmail.com', '9128972454', 'nancy123', 'nancy123'),
(8, 'Kenny', 'Sebastian', 'Male', 'kenny@gmail.com', '9809879868', 'kenny123', 'kenny123'),
(9, 'William', 'Blake', 'Male', 'william@gmail.com', '8683619153', 'william123', 'william123'),
(10, 'Peter', 'Norvig', 'Male', 'peter@gmail.com', '9609362815', 'peter123', 'peter123'),
(11, 'Shraddha', 'Kapoor', 'Female', 'shraddha@gmail.com', '9768946252', 'shraddha123', 'shraddha123'),
(12, 'John', 'Mwangi', 'Male', 'murage8@gmail.com', '0712345567', 'john123', 'john123'),
(13, 'John', 'Mwangi', 'Male', 'murage8@gmail.com', '0712345567', 'john123', 'john123'),
(16, 'Doughlas', 'Githui', 'Male', 'githuiddoughlas8@gmail.com', '0712345567', 'githui123', 'githui123'),
(18, 'Peter', 'Maina', 'Male', 'maina@gmail.com', '0789456334', 'maina123', 'maina123'),
(19, 'Peter', 'Maina', 'Male', 'maina@gmail.com', '0789456334', 'maina123', 'maina123');

-- --------------------------------------------------------

--
-- Table structure for table `prestb`
--

CREATE TABLE `prestb` (
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prestb`
--

INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`) VALUES
('Dinesh', 4, 11, 'Kishan', 'Lal', '2020-03-27', '15:00:00', 'Cough', 'Nothing', 'Just take a teaspoon of Benadryl every night'),
('Ganesh', 2, 8, 'Alia', 'Bhatt', '2020-03-21', '10:00:00', 'Severe Fever', 'Nothing', 'Take bed rest'),
('Kumar', 9, 12, 'William', 'Blake', '2020-03-26', '12:00:00', 'Sever fever', 'nothing', 'Paracetamol -> 1 every morning and night'),
('Tiwary', 9, 13, 'William', 'Blake', '2020-03-26', '14:00:00', 'Cough', 'Skin dryness', 'Intake fruits with more water content'),
('Dinesh', 0, 0, '<? echo $fname ?>', '<? echo $lname ?>', '0000-00-00', '00:00:00', 'Maralia', 'Coughing', 'Just sit down and relax my friend.'),
('Dinesh', 0, 0, '<? echo $fname ?>', '<? echo $lname ?>', '0000-00-00', '00:00:00', 'tgfsdfsdf', 'dfgdfgfgf\'fgf', 'ffdwettyy7'),
('arun', 0, 0, '<? echo $fname ?>', '<? echo $lname ?>', '0000-00-00', '00:00:00', 'Tummer', 'Slow breathing', 'Avoid cold places'),
('Unknown', 0, 0, '<? echo $fname ?>', '<? echo $lname ?>', '0000-00-00', '00:00:00', '2wrtg', 'dfgfgghgh', 'fffdggcg'),
('ashok', 0, 0, '<? echo $fname ?>', '<? echo $lname ?>', '0000-00-00', '00:00:00', 'yiyhh', 'hkl', 'dfghjhk'),
('arun', 0, 15, 'Peter', 'Maina', '2025-06-25', '13:58:00', 'Kuhara', 'None', 'Take care'),
('Kumar', 10, 17, 'Peter', 'Norvig', '2025-06-26', '15:17:00', 'Mharo', 'Itching', 'Eat balanced diet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patreg`
--
ALTER TABLE `patreg`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `patreg`
--
ALTER TABLE `patreg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'backups', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"auth_group\",\"auth_group_permissions\",\"auth_permission\",\"auth_user\",\"auth_user_groups\",\"auth_user_user_permissions\",\"django_admin_log\",\"django_content_type\",\"django_migrations\",\"django_session\",\"mwala_app_administration\",\"mwala_app_admissionapplication\",\"mwala_app_contact\",\"mwala_app_course\",\"mwala_app_department\",\"mwala_app_feedback\",\"mwala_app_imagegallery\",\"mwala_app_jobsvacancies\",\"mwala_app_news\",\"mwala_app_notice\",\"mwala_app_studentaffairs\",\"mwala_app_supportingdepartment\"],\"table_structure[]\":[\"auth_group\",\"auth_group_permissions\",\"auth_permission\",\"auth_user\",\"auth_user_groups\",\"auth_user_user_permissions\",\"django_admin_log\",\"django_content_type\",\"django_migrations\",\"django_session\",\"mwala_app_administration\",\"mwala_app_admissionapplication\",\"mwala_app_contact\",\"mwala_app_course\",\"mwala_app_department\",\"mwala_app_feedback\",\"mwala_app_imagegallery\",\"mwala_app_jobsvacancies\",\"mwala_app_news\",\"mwala_app_notice\",\"mwala_app_studentaffairs\",\"mwala_app_supportingdepartment\"],\"table_data[]\":[\"auth_group\",\"auth_group_permissions\",\"auth_permission\",\"auth_user\",\"auth_user_groups\",\"auth_user_user_permissions\",\"django_admin_log\",\"django_content_type\",\"django_migrations\",\"django_session\",\"mwala_app_administration\",\"mwala_app_admissionapplication\",\"mwala_app_contact\",\"mwala_app_course\",\"mwala_app_department\",\"mwala_app_feedback\",\"mwala_app_imagegallery\",\"mwala_app_jobsvacancies\",\"mwala_app_news\",\"mwala_app_notice\",\"mwala_app_studentaffairs\",\"mwala_app_supportingdepartment\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'database', 'railwaydb', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"auth_group\",\"auth_group_permissions\",\"auth_permission\",\"auth_user\",\"auth_user_groups\",\"auth_user_user_permissions\",\"django_admin_log\",\"django_content_type\",\"django_migrations\",\"django_session\",\"mwala_app_administration\",\"mwala_app_admissionapplication\",\"mwala_app_brochures\",\"mwala_app_contact\",\"mwala_app_course\",\"mwala_app_department\",\"mwala_app_feedback\",\"mwala_app_imagegallery\",\"mwala_app_jobsvacancies\",\"mwala_app_news\",\"mwala_app_notice\",\"mwala_app_studentaffairs\",\"mwala_app_supportingdepartment\",\"mwala_app_tenders\"],\"table_structure[]\":[\"auth_group\",\"auth_group_permissions\",\"auth_permission\",\"auth_user\",\"auth_user_groups\",\"auth_user_user_permissions\",\"django_admin_log\",\"django_content_type\",\"django_migrations\",\"django_session\",\"mwala_app_administration\",\"mwala_app_admissionapplication\",\"mwala_app_brochures\",\"mwala_app_contact\",\"mwala_app_course\",\"mwala_app_department\",\"mwala_app_feedback\",\"mwala_app_imagegallery\",\"mwala_app_jobsvacancies\",\"mwala_app_news\",\"mwala_app_notice\",\"mwala_app_studentaffairs\",\"mwala_app_supportingdepartment\",\"mwala_app_tenders\"],\"table_data[]\":[\"auth_group\",\"auth_group_permissions\",\"auth_permission\",\"auth_user\",\"auth_user_groups\",\"auth_user_user_permissions\",\"django_admin_log\",\"django_content_type\",\"django_migrations\",\"django_session\",\"mwala_app_administration\",\"mwala_app_admissionapplication\",\"mwala_app_brochures\",\"mwala_app_contact\",\"mwala_app_course\",\"mwala_app_department\",\"mwala_app_feedback\",\"mwala_app_imagegallery\",\"mwala_app_jobsvacancies\",\"mwala_app_news\",\"mwala_app_notice\",\"mwala_app_studentaffairs\",\"mwala_app_supportingdepartment\",\"mwala_app_tenders\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(4, 'root', 'server', 'mwala_database_backup', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"e-shop\",\"employee_data\",\"library\",\"mwala_tvc\",\"myhmsdb\",\"phpmyadmin\",\"portfolio_db\",\"test\",\"vehicle_service_db\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_department\"},{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_course\"},{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_administration\"},{\"db\":\"mwala_tvc\",\"table\":\"auth_user\"},{\"db\":\"mwala_tvc\",\"table\":\"django_admin_log\"},{\"db\":\"mwala_tvc\",\"table\":\"auth_user_groups\"},{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_brochures\"},{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_contact\"},{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_studentaffairs\"},{\"db\":\"mwala_tvc\",\"table\":\"mwala_app_notice\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'employee_data', 'data', '{\"CREATE_TIME\":\"2025-03-06 20:37:31\"}', '2025-03-10 10:09:41'),
('root', 'mwala_tvc', 'mwala_app_studentaffairs', '{\"CREATE_TIME\":\"2025-01-18 16:41:55\"}', '2025-04-04 06:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-29 19:04:26', '{\"Console\\/Mode\":\"show\",\"Console\\/Height\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `portfolio_db`
--
CREATE DATABASE IF NOT EXISTS `portfolio_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `portfolio_db`;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `submitted_at`) VALUES
(5, 'Stephen', 'murage8@gmail.com', 'Data Analysis', 'I love your work', '2025-06-25 12:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$P5IzB2JbvT7LkNw2R9mO.ODH8h9WzF5w5yLIOXPSo.noKAwcJTETK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `vehicle_service_db`
--
CREATE DATABASE IF NOT EXISTS `vehicle_service_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vehicle_service_db`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `date_created`) VALUES
(1, '2 Wheeler Vehicle', 1, '2021-09-30 09:42:40'),
(2, '3 Wheeler Vehicle', 1, '2021-09-30 09:43:00'),
(3, '4 Wheeler Vehicle', 1, '2021-09-30 09:43:48'),
(4, '6 Wheeler Vehicle', 1, '2021-09-30 09:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanics_list`
--

INSERT INTO `mechanics_list` (`id`, `name`, `contact`, `email`, `status`, `date_created`) VALUES
(1, 'John Smith', '09123456789', 'jsmith@sample.com', 1, '2021-09-30 10:26:11'),
(2, 'George Wilson', '09112355799', 'gwilson@gmail.com', 1, '2021-09-30 10:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `request_meta`
--

CREATE TABLE `request_meta` (
  `request_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_meta`
--

INSERT INTO `request_meta` (`request_id`, `meta_field`, `meta_value`) VALUES
(1, 'contact', '09112355799'),
(1, 'email', 'jsmith@sample.com'),
(1, 'address', 'Sample Address'),
(1, 'vehicle_name', 'Mitsubishi Montero Sport'),
(1, 'vehicle_registration_number', 'GBN 0623'),
(1, 'vehicle_model', 'CDM-10140715'),
(1, 'service_id', '1,3,4'),
(1, 'pickup_address', 'Here St., There City, Sample Only 623');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `date_created`) VALUES
(1, 'Change Oil', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel sapien lectus. Ut posuere, arcu eget bibendum venenatis, quam diam interdum diam, in viverra leo quam eu mi. Sed bibendum mauris nulla, vel vehicula libero elementum vel. Nam blandit justo justo, dapibus sodales risus consectetur nec. Suspendisse ornare in purus et mollis. Praesent placerat quis lectus at hendrerit. Morbi maximus dolor dolor, a maximus mi congue quis.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:11:21'),
(2, 'Overall Checkup', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Curabitur nec viverra tellus. Donec quis molestie arcu. Sed et blandit dui, vel vehicula tortor. Vivamus fringilla sit amet nibh fringilla ornare. Etiam iaculis ornare purus id feugiat. Etiam mattis erat ut congue tempor. Nam placerat faucibus libero ultrices posuere. Donec ac tempus nulla.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:11:38'),
(3, 'Engine Tune up', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Sed ultrices fermentum augue. Duis ultricies arcu vitae lorem accumsan porta. Donec fermentum risus ut tincidunt cursus. Sed varius id dolor et euismod. Vestibulum elit massa, varius nec arcu vel, viverra varius dolor. Etiam fermentum vel lorem vel tincidunt. Ut nec libero pulvinar, malesuada lacus et, tempor diam. Aliquam vitae nisl augue.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:12:03'),
(4, 'Tire Replacement', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Nullam pretium eu justo ac tincidunt. Vestibulum quis est non felis porttitor pretium. Vivamus nec augue ultrices, condimentum risus vitae, pellentesque turpis. Nullam ornare est sapien, sed semper neque imperdiet suscipit. Sed fermentum eros et felis mollis finibus. In condimentum eleifend magna, non consequat nibh viverra nec. Nulla vel sapien libero. Suspendisse varius nisl nec ornare imperdiet.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-09-30 14:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(30) NOT NULL,
  `owner_name` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `owner_name`, `category_id`, `service_type`, `mechanic_id`, `status`, `date_created`) VALUES
(1, 'Mike Williams', 3, 'Pick Up', 1, 2, '2021-09-30 14:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Vehicle Service Management System'),
(6, 'short_name', 'VSMS - PHP'),
(11, 'logo', 'uploads/1632965940_vrs-logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1632965760_car-shop-clip.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(6, 'Claire', 'Blake', 'cblake', 'cd74fae0a3adf459f73bbf187607ccea', 'uploads/1632990840_ava.jpg', NULL, 2, '2021-09-30 16:34:02', '2021-09-30 16:35:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD CONSTRAINT `request_meta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
