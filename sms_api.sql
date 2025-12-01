-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2025 at 05:20 AM
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
-- Database: `sms_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` enum('LOGIN','LOGOUT','CREATE','UPDATE','DELETE','VIEW','EXPORT','IMPORT') NOT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `old_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_value`)),
  `new_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_value`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `entity`, `entity_id`, `ip_address`, `user_agent`, `description`, `created_at`, `old_value`, `new_value`) VALUES
(1, 1, 'LOGIN', NULL, NULL, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Safari/605.1.15', NULL, '2025-11-24 15:53:52.281490', NULL, NULL),
(2, 1, 'LOGIN', NULL, NULL, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Safari/605.1.15', NULL, '2025-11-25 20:06:02.753378', NULL, NULL),
(3, 1, 'LOGIN', NULL, NULL, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Safari/605.1.15', NULL, '2025-11-27 12:33:38.190873', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `api_key` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_used_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfers`
--

CREATE TABLE `bank_transfers` (
  `id` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `accountNumber` varchar(255) NOT NULL,
  `transferProofUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfer_payments`
--

CREATE TABLE `bank_transfer_payments` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `transfer_proof_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_visible` tinyint(4) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `banner_image`, `icon`, `is_visible`, `sort_order`, `meta_title`, `meta_description`, `meta_keywords`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Mountain Bikes', 'mountain-bikes', 'Xe đạp địa hình - Chinh phục mọi địa hình với các dòng xe đạp leo núi chuyên nghiệp', NULL, 'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?auto=format&fit=crop&q=80&w=1000', NULL, 1, 1, 'Mountain Bikes', 'Conquer any trail with our rugged mountain bikes.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(2, 'Racing Bikes', 'racing-bikes', 'Xe đạp đua - Tốc độ và khí động học cho người đam mê tốc độ', NULL, 'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?auto=format&fit=crop&q=80&w=1000', NULL, 1, 2, 'Racing Bikes', 'Speed and aerodynamics for the competitive cyclist.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(3, 'Road / Touring Bikes', 'road-touring-bikes', 'Xe đạp đường trường - Thoải mái cho những chuyến đi dài', NULL, 'https://images.unsplash.com/photo-1485965120184-e224f7a1dbfe?auto=format&fit=crop&q=80&w=1000', NULL, 1, 3, 'Road / Touring Bikes', 'Comfortable bikes for long-distance adventures.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(4, 'Folding Bikes', 'folding-bikes', 'Xe đạp gấp - Nhỏ gọn và tiện lợi cho di chuyển đô thị', NULL, 'https://images.unsplash.com/photo-1623996713869-79a527622872?auto=format&fit=crop&q=80&w=1000', NULL, 1, 4, 'Folding Bikes', 'Compact and convenient for urban commuting.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(5, 'Women\'s Bikes', 'womens-bikes', 'Xe đạp nữ - Thiết kế đặc biệt dành cho phụ nữ', NULL, 'https://images.unsplash.com/photo-1599058945522-28d584b6f0ff?auto=format&fit=crop&q=80&w=1000', NULL, 1, 5, 'Women’s Bikes', 'Bikes designed specifically for women’s geometry.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(6, 'Kids\' Bikes', 'kids-bikes', 'Xe đạp trẻ em - An toàn và vui vẻ cho các bé', NULL, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&q=80&w=1000', NULL, 1, 6, 'Kids’ Bikes', 'Safe and fun bikes for the little ones.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(7, 'Bike Accessories', 'bike-accessories', 'Phụ kiện xe đạp - Trang bị cần thiết cho mọi chuyến đi', NULL, 'https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?auto=format&fit=crop&q=80&w=1000', NULL, 1, 7, 'Bike Accessories', 'Essential gear for every ride.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000'),
(8, 'Vendors & Brands', 'vendors-brands', 'Shop by your favorite bicycle brands.', NULL, 'https://images.unsplash.com/photo-1559348349-86f1f65817fe?auto=format&fit=crop&q=80&w=1000', NULL, 1, 0, 'Vendors & Brands', 'Shop by your favorite bicycle brands.', NULL, NULL, '2025-11-24 21:05:47.000000', '2025-11-24 21:05:47.000000');

-- --------------------------------------------------------

--
-- Table structure for table `cod_payments`
--

CREATE TABLE `cod_payments` (
  `id` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `actualReceivedAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_card_payments`
--

CREATE TABLE `credit_card_payments` (
  `id` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `transactionId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Thu Hồng', 'john.doe@example.com', '0901234567', '123 Main St, City', '2025-11-24 21:05:47.000000', '2025-11-24 21:54:30.431681'),
(2, 'Jane Smith', 'jane.smith@example.com', '0909876543', '456 Oak Ave, Town', '2025-11-24 21:05:47.000000', '2025-11-24 21:05:47.000000'),
(3, 'Mike Johnson', 'mike.j@example.com', '0912345678', '789 Pine Rd, Village', '2025-11-24 21:05:47.000000', '2025-11-24 21:05:47.000000'),
(4, 'Sarah Wilson', 'sarah.w@example.com', '0987654321', '321 Elm St, City', '2025-11-24 21:05:47.000000', '2025-11-24 21:05:47.000000'),
(5, 'David Brown', 'david.b@example.com', '0911223344', '654 Maple Dr, Town', '2025-11-24 21:05:47.000000', '2025-11-24 21:05:47.000000'),
(6, 'Nguyễn Văn A', 'nguyenvana@example.com', '0901234567', 'Số 10, Đường Trần Phú, Quận Ba Đình, Hà Nội', '2025-11-24 22:15:53.000000', '2025-11-24 22:15:53.000000'),
(7, 'Trần Thị B', 'tranthib@example.com', '0982345678', '43 Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội', '2025-11-24 22:15:53.000000', '2025-11-24 22:15:53.000000'),
(8, 'Lê Văn C', 'levanc@example.com', '0913456789', '128 Láng Hạ, Quận Đống Đa, Hà Nội', '2025-11-24 22:15:53.000000', '2025-11-24 22:15:53.000000'),
(9, 'Phạm Thị D', 'phamthid@example.com', '0924567890', '56 Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội', '2025-11-24 22:15:53.000000', '2025-11-24 22:15:53.000000'),
(10, 'Hoàng Văn E', 'hoangvane@example.com', '0935678901', '89 Giải Phóng, Quận Hai Bà Trưng, Hà Nội', '2025-11-24 22:15:53.000000', '2025-11-24 22:15:53.000000');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `minimum_stock` int(11) NOT NULL DEFAULT 5,
  `status` enum('in_stock','low_stock','out_of_stock') NOT NULL DEFAULT 'out_of_stock',
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `stock_quantity`, `minimum_stock`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 50, 5, 'in_stock', '2025-11-27 17:38:15.886746', '2025-11-27 17:38:15.886746'),
(2, 2, 29, 5, 'in_stock', '2025-11-27 17:38:15.891072', '2025-11-27 17:38:15.891072'),
(3, 3, 39, 5, 'in_stock', '2025-11-27 17:38:15.892775', '2025-11-27 17:38:15.892775'),
(4, 4, 25, 5, 'in_stock', '2025-11-27 17:38:15.894797', '2025-11-27 17:38:15.894797'),
(5, 5, 34, 5, 'in_stock', '2025-11-27 17:38:15.895970', '2025-11-27 17:38:15.895970'),
(6, 6, 59, 5, 'in_stock', '2025-11-27 17:38:15.897378', '2025-11-27 17:38:15.897378'),
(7, 7, 199, 5, 'in_stock', '2025-11-27 17:38:15.898288', '2025-11-27 17:38:15.898288'),
(8, 8, 149, 5, 'in_stock', '2025-11-27 17:38:15.899552', '2025-11-27 17:38:15.899552'),
(9, 9, 20, 5, 'in_stock', '2025-11-27 17:38:15.900422', '2025-11-27 17:38:15.900422'),
(10, 10, 15, 5, 'in_stock', '2025-11-27 17:38:15.901434', '2025-11-27 17:38:15.901434'),
(11, 11, 10, 5, 'in_stock', '2025-11-27 17:39:23.000000', '2025-11-27 17:39:23.000000');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `type` enum('in','out','adjustment','return','damaged') NOT NULL,
  `quantity` int(11) NOT NULL,
  `previous_quantity` int(11) NOT NULL,
  `new_quantity` int(11) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `source` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_transactions`
--

INSERT INTO `inventory_transactions` (`id`, `product_id`, `variant_id`, `type`, `quantity`, `previous_quantity`, `new_quantity`, `reference`, `notes`, `created_by`, `created_at`, `source`, `supplier_id`) VALUES
(1, 2, NULL, 'out', 2, 30, 28, 'ORD-1763993147300-0', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(2, 1, NULL, 'out', 1, 50, 49, 'ORD-1763993147300-0', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(3, 2, NULL, 'out', 1, 30, 29, 'ORD-1763993147322-1', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(4, 1, NULL, 'out', 2, 50, 48, 'ORD-1763993147322-1', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(5, 1, NULL, 'out', 1, 50, 49, 'ORD-1763993147322-1', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(6, 1, NULL, 'out', 1, 50, 49, 'ORD-1763993147328-2', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(7, 9, NULL, 'out', 1, 20, 19, 'ORD-1763993147330-3', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(8, 3, NULL, 'out', 1, 40, 39, 'ORD-1763993147330-3', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(9, 10, NULL, 'out', 2, 15, 13, 'ORD-1763993147330-3', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(10, 8, NULL, 'out', 1, 150, 149, 'ORD-1763993147340-6', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(11, 3, NULL, 'out', 2, 40, 38, 'ORD-1763993147340-6', 'Order fulfillment', NULL, '2025-11-24 21:05:47.000000', NULL, NULL),
(12, 6, NULL, 'out', 1, 60, 59, 'order-13', NULL, NULL, '2025-11-24 22:17:58.000000', NULL, NULL),
(13, 2, NULL, 'out', 1, 30, 29, 'order-14', NULL, NULL, '2025-11-24 22:17:58.000000', NULL, NULL),
(14, 8, NULL, 'out', 1, 150, 149, 'order-14', NULL, NULL, '2025-11-24 22:17:58.000000', NULL, NULL),
(15, 3, NULL, 'out', 1, 40, 39, 'order-15', NULL, NULL, '2025-11-24 22:17:58.000000', NULL, NULL),
(16, 5, NULL, 'out', 1, 35, 34, 'order-16', NULL, NULL, '2025-11-24 22:17:58.000000', NULL, NULL),
(17, 7, NULL, 'out', 1, 200, 199, 'order-16', NULL, NULL, '2025-11-24 22:17:58.000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `attempt_count` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `locked_until` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `email`, `attempt_count`, `last_attempt_at`, `locked_until`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 'hong@gmail.com', 3, '2025-11-27 05:32:39', NULL, '::1', '2025-11-24 15:42:20.160666', '2025-11-27 12:32:39.000000'),
(2, 'admin@123gmail.com', 6, '2025-11-27 05:33:05', '2025-11-27 06:03:05', '::1', '2025-11-24 15:43:03.046320', '2025-11-27 12:33:05.000000'),
(3, 'thuhong@gmail.com', 2, '2025-11-24 08:45:39', NULL, '::1', '2025-11-24 15:45:30.746155', '2025-11-24 15:45:39.000000');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('Pending','Paid','Shipped','Canceled') NOT NULL DEFAULT 'Pending',
  `shipping_address` text DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT 0,
  `paid_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `customer_notes` text DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `customer_id`, `total_amount`, `status`, `shipping_address`, `billing_address`, `payment_method`, `is_paid`, `paid_at`, `phone`, `email`, `customer_notes`, `cancellation_reason`, `completed_at`, `cancelled_at`, `order_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ORD-1763993147300-0', 2, 50300000.00, 'Shipped', 'Sample Address', NULL, 'COD', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(2, 'ORD-1763993147322-1', 1, 56400000.00, 'Pending', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(3, 'ORD-1763993147328-2', 2, 12500000.00, 'Pending', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(4, 'ORD-1763993147330-3', 5, 67000000.00, 'Shipped', 'Sample Address', NULL, 'COD', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(5, 'ORD-1763993147336-4', 3, 38150000.00, 'Canceled', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(6, 'ORD-1763993147338-5', 4, 29000000.00, 'Canceled', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(7, 'ORD-1763993147340-6', 1, 17350000.00, 'Paid', 'Sample Address', NULL, 'COD', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(8, 'ORD-1763993147342-7', 5, 17000000.00, 'Canceled', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(9, 'ORD-1763993147343-8', 3, 27500000.00, 'Canceled', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(10, 'ORD-1763993147345-9', 1, 53700000.00, 'Canceled', 'Sample Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 21:05:47', NULL, '2025-11-24 21:05:47', '2025-11-24 14:05:47'),
(11, 'ORD-100001', 6, 12950000.00, 'Pending', 'Số 10, Đường Trần Phú, Quận Ba Đình, Hà Nội', NULL, 'Bank Transfer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 22:15:53', NULL, '2025-11-24 00:00:00', '2025-11-24 15:15:53'),
(13, 'ORD-100002', 7, 4600000.00, 'Paid', '43 Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 22:17:58', NULL, '2025-11-23 00:00:00', '2025-11-24 15:17:58'),
(14, 'ORD-100003', 8, 19450000.00, 'Shipped', '128 Láng Hạ, Quận Đống Đa, Hà Nội', NULL, 'Bank Transfer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 22:17:58', NULL, '2025-11-22 00:00:00', '2025-11-24 15:17:58'),
(15, 'ORD-100004', 9, 8620000.00, 'Canceled', '56 Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 22:17:58', NULL, '2025-11-21 00:00:00', '2025-11-24 15:17:58'),
(16, 'ORD-100005', 10, 10100000.00, 'Paid', '89 Giải Phóng, Quận Hai Bà Trưng, Hà Nội', NULL, 'Bank Transfer', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 22:17:58', NULL, '2025-11-20 00:00:00', '2025-11-24 15:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `total_price`) VALUES
(1, 1, 2, 2, 18900000.00, 37800000.00),
(2, 1, 1, 1, 12500000.00, 12500000.00),
(3, 2, 2, 1, 18900000.00, 18900000.00),
(4, 2, 1, 2, 12500000.00, 25000000.00),
(5, 2, 1, 1, 12500000.00, 12500000.00),
(6, 3, 1, 1, 12500000.00, 12500000.00),
(7, 4, 9, 1, 14500000.00, 14500000.00),
(8, 4, 3, 1, 8500000.00, 8500000.00),
(9, 4, 10, 2, 22000000.00, 44000000.00),
(10, 5, 8, 1, 350000.00, 350000.00),
(11, 5, 2, 2, 18900000.00, 37800000.00),
(12, 6, 9, 2, 14500000.00, 29000000.00),
(13, 7, 8, 1, 350000.00, 350000.00),
(14, 7, 3, 2, 8500000.00, 17000000.00),
(15, 8, 3, 2, 8500000.00, 17000000.00),
(16, 9, 3, 2, 8500000.00, 17000000.00),
(17, 9, 5, 1, 9800000.00, 9800000.00),
(18, 9, 8, 2, 350000.00, 700000.00),
(19, 10, 6, 2, 4500000.00, 9000000.00),
(20, 10, 10, 2, 22000000.00, 44000000.00),
(21, 10, 8, 2, 350000.00, 700000.00),
(22, 11, 1, 1, 12500000.00, 12500000.00),
(23, 13, 6, 1, 4500000.00, 4500000.00),
(24, 14, 2, 1, 18900000.00, 18900000.00),
(25, 14, 8, 1, 350000.00, 350000.00),
(26, 15, 3, 1, 8500000.00, 8500000.00),
(27, 16, 5, 1, 9800000.00, 9800000.00),
(28, 16, 7, 1, 150000.00, 150000.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_refunds`
--

CREATE TABLE `order_refunds` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected','completed') NOT NULL DEFAULT 'pending',
  `approved_by` int(11) DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_timeline`
--

CREATE TABLE `order_timeline` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `used_at` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `short_description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `compare_price` decimal(10,2) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `status` enum('active','hidden','out_of_stock') NOT NULL DEFAULT 'active',
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `weight` decimal(8,2) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `discount_price` decimal(10,2) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `dimensions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dimensions`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specifications`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `sku`, `description`, `short_description`, `price`, `compare_price`, `cost`, `quantity`, `category_id`, `supplier_id`, `brand_id`, `status`, `is_featured`, `weight`, `meta_title`, `meta_description`, `meta_keywords`, `image_url`, `created_by`, `created_at`, `updated_at`, `discount_price`, `deleted_at`, `dimensions`, `tags`, `specifications`) VALUES
(1, 'GIANT Rincon 2 29 - Phanh Đĩa, Bánh 29 Inch', 'giant-rincon-2-29', 'GIANT-Rincon2-29', 'Xe đạp địa hình GIANT Rincon 2 29 với khung nhôm ALUXX nhẹ và bánh 29 inch giúp di chuyển mượt mà trên địa hình gồ ghề. Phanh đĩa cơ học đảm bảo an toàn tối đa.', NULL, 12500000.00, NULL, 9000000.00, 50, 1, NULL, NULL, 'active', 1, NULL, 'GIANT Rincon 2 29 - Xe Đạp Địa Hình Giá Tốt Tại Hà Nội', 'Mua xe đạp địa hình GIANT Rincon 2 29 chính hãng, giá tốt. Phanh đĩa, bánh 29 inch, khung nhôm nhẹ. Giao hàng toàn quốc.', NULL, 'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-25 09:57:49.000000', NULL, NULL, NULL, NULL, NULL),
(2, 'JAVA Auriga R5 - Xe Đạp Đua Khung Nhôm', 'java-auriga-r5', 'JAVA-Auriga-R5', 'JAVA Auriga R5 với khung nhôm khí động học và bánh 700C, hoàn hảo cho những người đam mê tốc độ. Thiết kế thể thao, trọng lượng nhẹ.', NULL, 18900000.00, NULL, 14000000.00, 29, 2, NULL, NULL, 'active', 1, NULL, 'JAVA Auriga R5 - Xe Đạp Đua Chuyên Nghiệp', 'Xe đạp đua JAVA Auriga R5 khung nhôm, bánh 700C. Thiết kế khí động học, phù hợp đua xe chuyên nghiệp.', NULL, 'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-25 10:03:49.000000', NULL, NULL, NULL, NULL, NULL),
(3, 'Trinx Free 2.2 - Xe Đạp Đường Trường', 'trinx-free-2-2', 'TRINX-Free2.2', 'Trinx Free 2.2 là dòng xe đạp đa năng với bánh 700C, lý tưởng cho di chuyển trong thành phố và những chuyến đi dài. Thiết kế thoải mái, bền bỉ.', NULL, 8500000.00, NULL, 6500000.00, 39, 3, NULL, NULL, 'active', 0, NULL, 'Trinx Free 2.2 - Xe Đạp Đường Trường Đa Năng', 'Xe đạp Trinx Free 2.2 phù hợp đi phố và touring. Bánh 700C, thiết kế thoải mái, giá tốt.', NULL, 'https://images.unsplash.com/photo-1485965120184-e224f7a1dbfe?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.254644', NULL, NULL, NULL, NULL, NULL),
(4, 'JAVA Neo-9S - Xe Đạp Gấp Cao Cấp', 'java-neo-9s', 'JAVA-Neo9S', 'Xe đạp gấp JAVA Neo-9S nhỏ gọn và thời trang với bánh 16 inch, dễ dàng mang theo và cất giữ. Phù hợp cho người đi làm, đi học.', NULL, 11200000.00, NULL, 8500000.00, 25, 4, NULL, NULL, 'active', 0, NULL, 'JAVA Neo-9S - Xe Đạp Gấp Cao Cấp', 'Xe đạp gấp JAVA Neo-9S bánh 16 inch, nhỏ gọn, dễ gấp. Phù hợp đi làm, đi học trong thành phố.', NULL, 'https://images.unsplash.com/photo-1623996713869-79a527622872?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000', NULL, NULL, NULL, NULL, NULL),
(5, 'LIV Alight 4 Disc - Xe Đạp Nữ Phanh Đĩa', 'liv-alight-4-disc', 'LIV-Alight4-Disc', 'LIV Alight 4 Disc được thiết kế đặc biệt cho phụ nữ, mang lại sự thoải mái khi di chuyển với phanh đĩa đáng tin cậy. Thiết kế thanh lịch, màu sắc nữ tính.', NULL, 9800000.00, NULL, 7500000.00, 34, 5, NULL, NULL, 'active', 1, NULL, 'LIV Alight 4 Disc - Xe Đạp Nữ Cao Cấp', 'Xe đạp nữ LIV Alight 4 Disc phanh đĩa, thiết kế dành riêng cho phụ nữ. Thoải mái, an toàn.', NULL, 'https://images.unsplash.com/photo-1599058945522-28d584b6f0ff?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.256569', NULL, NULL, NULL, NULL, NULL),
(6, 'RAPTOR Lily 3 - Xe Đạp Trẻ Em Bánh 24 Inch', 'raptor-lily-3', 'RAPTOR-Lily3-24', 'RAPTOR Lily 3 là dòng xe đạp dễ thương và bền bỉ dành cho trẻ em với bánh 24 inch. An toàn, dễ điều khiển, màu sắc bắt mắt.', NULL, 4500000.00, NULL, 3500000.00, 59, 6, NULL, NULL, 'active', 0, NULL, 'RAPTOR Lily 3 - Xe Đạp Trẻ Em An Toàn', 'Xe đạp trẻ em RAPTOR Lily 3 bánh 24 inch. An toàn, bền bỉ, màu sắc đẹp. Phù hợp cho bé từ 8-12 tuổi.', NULL, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.231249', NULL, NULL, NULL, NULL, NULL),
(7, 'RAPTOR RA69 - Bình Nước 600ml', 'raptor-ra69-bottle', 'RA69-WaterBottle', 'Bình nước cao cấp dung tích 600ml, chất liệu an toàn, giữ nhiệt tốt. Phụ kiện không thể thiếu cho mọi chuyến đi xe đạp.', NULL, 150000.00, NULL, 100000.00, 199, 7, NULL, NULL, 'active', 0, NULL, 'RAPTOR RA69 - Bình Nước Xe Đạp 600ml', 'Bình nước xe đạp RAPTOR RA69 dung tích 600ml. Chất liệu an toàn, giữ nhiệt tốt.', NULL, 'https://images.unsplash.com/photo-1602143407151-01114192003b?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.258444', NULL, NULL, NULL, NULL, NULL),
(8, 'Khóa Xe Đạp Cao Cấp - Chống Trộm', 'premium-bicycle-lock', 'LOCK-Premium-001', 'Khóa xe đạp cao cấp với cơ chế khóa số an toàn, chống cắt, chống phá. Bảo vệ xe đạp của bạn mọi lúc mọi nơi.', NULL, 350000.00, NULL, 250000.00, 149, 7, NULL, NULL, 'active', 1, NULL, 'Khóa Xe Đạp Cao Cấp Chống Trộm', 'Khóa xe đạp cao cấp, chống cắt, chống phá. Bảo vệ xe đạp an toàn tuyệt đối.', NULL, 'https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.249060', NULL, NULL, NULL, NULL, NULL),
(9, 'Trek Marlin 5 - Xe Đạp Địa Hình Đa Năng', 'trek-marlin-5', 'TREK-Marlin5', 'Trek Marlin 5 là dòng xe đạp địa hình đa năng, phù hợp cho cả đường mòn và sử dụng hàng ngày. Khung bền, phuộc trước hành trình 100mm.', NULL, 14500000.00, NULL, 11000000.00, 20, 1, NULL, NULL, 'active', 0, NULL, 'Trek Marlin 5 - Xe Đạp Địa Hình Đa Năng', 'Trek Marlin 5 xe đạp địa hình đa năng. Phù hợp cả đường mòn và đô thị. Phuộc 100mm.', NULL, 'https://images.unsplash.com/photo-1511994298220-4127091f53e8?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000', NULL, NULL, NULL, NULL, NULL),
(10, 'Specialized Allez - Xe Đạp Đua Khung Nhôm', 'specialized-allez', 'SPEC-Allez', 'Specialized Allez mang đến hiệu suất cấp chuyên nghiệp với khung nhôm giá phải chăng. Thiết kế khí động học, phù hợp đua xe và tập luyện.', NULL, 22000000.00, NULL, 17000000.00, 15, 2, NULL, NULL, 'active', 0, NULL, 'Specialized Allez - Xe Đạp Đua Chuyên Nghiệp', 'Specialized Allez xe đạp đua khung nhôm. Hiệu suất cao, giá hợp lý. Phù hợp đua xe.', NULL, 'https://images.unsplash.com/photo-1485965120184-e224f7a1dbfe?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-24 21:05:47.000000', '2025-11-24 22:17:58.000000', NULL, NULL, NULL, NULL, NULL),
(11, 'Test Product - UPDATED', 'test-product-updated', 'TEST-CRUD-001', 'This is a test product to verify CRUD functionality', NULL, 6000000.00, NULL, 3000000.00, 150, 1, NULL, NULL, 'active', 0, NULL, 'Test Product', 'Test product for CRUD verification', NULL, 'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?auto=format&fit=crop&q=80&w=600', NULL, '2025-11-25 11:58:38.547031', '2025-11-25 20:20:11.000000', 4500000.00, '2025-11-25 20:20:11.000000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_primary` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `color` varchar(50) DEFAULT NULL,
  `wheel_size` varchar(20) DEFAULT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attributes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `is_revoked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `user_id`, `token`, `expires_at`, `ip_address`, `user_agent`, `is_revoked`, `created_at`) VALUES
(1, 1, '1ca365bb034d093d74b4fd6de9cd1e538bfb9ef40f75afd4491ae420fb69a6b405062ad50e70e3b4da6ca3d3b58f7c3e7bc81cf4c8c81de9b10718f27280d864', '2025-12-01 08:53:52', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Safari/605.1.15', 0, '2025-11-24 15:53:52.257377'),
(2, 1, '7e853bd708fa1a9519f6a703a6d34f3c8e5d6a2ea96e526657e297279c9051ee7fbe5ad27a0f1906b63f6380f307ed00c1cb7d27920370a4ae274c230d0764e1', '2025-12-02 13:06:02', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Safari/605.1.15', 0, '2025-11-25 20:06:02.706998'),
(3, 1, 'd8601c3428e688aec7d1b3b0afd103abb2dfd9f02cfe708ab74e317cb1acb75cc72b1e8bb46b027da9ddbf7b22b7dbdd555be7b786c4ce87583f7af08e85aa3c', '2025-12-04 05:33:38', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Safari/605.1.15', 0, '2025-11-27 12:33:38.181829');

-- --------------------------------------------------------

--
-- Table structure for table `sms_messages`
--

CREATE TABLE `sms_messages` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `status` enum('pending','sent','failed','delivered') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `template` text NOT NULL,
  `variables` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`variables`)),
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_alerts`
--

CREATE TABLE `stock_alerts` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `threshold` int(11) NOT NULL,
  `current_stock` int(11) NOT NULL,
  `is_resolved` tinyint(4) NOT NULL DEFAULT 0,
  `notified_at` timestamp NULL DEFAULT NULL,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_auth`
--

CREATE TABLE `two_factor_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `secret` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `backup_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`backup_codes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('admin','warehouse','sales','accounting','user') NOT NULL DEFAULT 'user',
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `role`, `avatar`, `phone`, `is_active`, `last_login_at`, `createdAt`, `updatedAt`) VALUES
(1, 'admin@example.com', '$2b$10$T4xwl1VaImxAjftBd9cq4OKUcaUztQn8qMAfH9zTQD1.XlT8iOyQ6', 'Admin User', 'admin', NULL, NULL, 1, '2025-11-27 05:33:38', '2025-11-24 15:52:39.000000', '2025-11-27 12:33:38.000000'),
(2, 'manager@example.com', '$2b$10$XTlWRMkJEpYyGm5lXNdJouygCKztVdFaZMWjcCPEMng76n4otWkW2', 'Manager User', 'admin', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(3, 'trang@example.com', '$2b$10$LJraGOqSdwOWRgOELgSuneBU.Jv1AfVFsJypdcnnNfbFNFAgDhTTC', 'Customer 1', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-25 08:07:24.661259'),
(4, 'customer2@example.com', '$2b$10$55GJqDH4We7epyDGl2jOCOtEwOW3Sr2UjWEELoQC4ErIWrNi6Kb6q', 'Customer 2', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(5, 'customer3@example.com', '$2b$10$H6EGlkR6NQYYyPKxRzgQEePTC7KV8fiSYudGVBImh3cykuaEYSnBS', 'Customer 3', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(6, 'customer4@example.com', '$2b$10$fjOE1a6nQIq6ZM5nytOd7OsWC58F3qk.Tdtns8Ik7irPDtZ3cE4iy', 'Customer 4', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(7, 'customer5@example.com', '$2b$10$IeTL0JnsRk9znufqi7V3leK6scFLOmlN2VULe3pClQAqeFF02Vc5a', 'Customer 5', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(8, 'customer6@example.com', '$2b$10$YVflUQMPBID8Q1xdw6FP3eeYo6KcfkrevzDlp/HbfsC440V.JWDiy', 'Customer 6', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(9, 'customer7@example.com', '$2b$10$hcB1zuSQg41UAUwyNbQPlu7lxxQiwmLImv00Of0WkvP/hWAptJhgi', 'Customer 7', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(10, 'customer8@example.com', '$2b$10$4koZO7NQomnSCpsbsxyM2Omkg2BAk..zn8FwfMW6/ZYxEmpZ3ugWO', 'Customer 8', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:39.000000', '2025-11-24 15:52:39.000000'),
(11, 'customer9@example.com', '$2b$10$HdU3dt8470GABXF1z4ux9u1JLBEY09UGowooVYhnPOTdyvzqcIqzC', 'Customer 9', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:40.000000', '2025-11-24 15:52:40.000000'),
(12, 'customer10@example.com', '$2b$10$.FQB2P/NV6BpD5UaaBLW8.TY99GGJss0itcANYclEKhpiZe264Zfy', 'Customer 10', 'user', NULL, NULL, 1, NULL, '2025-11-24 15:52:40.000000', '2025-11-24 15:52:40.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d54f841fa5478e4734590d44036` (`user_id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_key` (`api_key`),
  ADD KEY `idx_api_key` (`api_key`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indexes for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transfer_payments`
--
ALTER TABLE `bank_transfer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_96db6bbbaa6f23cad26871339b` (`name`),
  ADD UNIQUE KEY `IDX_b15428f362be2200922952dc26` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_9c77aaa5bc26f66159661ffd808` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_420d9f679d41281f282f5bc7d0` (`slug`),
  ADD KEY `FK_88cea2dc9c31951d06437879b40` (`parent_id`),
  ADD KEY `FK_23ad9291e0e22cdf46ae7ec5461` (`created_by`);

--
-- Indexes for table `cod_payments`
--
ALTER TABLE `cod_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_card_payments`
--
ALTER TABLE `credit_card_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_8536b8b85c06969f84f0c098b0` (`email`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_732fdb1f76432d65d2c136340d` (`product_id`);

--
-- Indexes for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_2520d97de0c9a0fbfc9b00f4c1b` (`product_id`),
  ADD KEY `FK_aeb0f3a59ed2fd95e1a13097eda` (`variant_id`),
  ADD KEY `FK_d9a2ac973b889087b33f84d3517` (`created_by`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_75eba1c6b1a66b09f2a97e6927` (`order_number`),
  ADD KEY `FK_772d0ce0473ac2ccfa26060dbe9` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_145532db85752b29c57d2b7b1f1` (`order_id`),
  ADD KEY `FK_9263386c35b6b242540f9493b00` (`product_id`);

--
-- Indexes for table `order_refunds`
--
ALTER TABLE `order_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_91a69cafbe7711aaebd0e0ac4b6` (`order_id`),
  ADD KEY `FK_efa528b06d89f38fccf4f086fba` (`approved_by`);

--
-- Indexes for table `order_timeline`
--
ALTER TABLE `order_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5127a6bdbbdfcbd60fa05d74595` (`order_id`),
  ADD KEY `FK_06946dd72c1684ac49bfcc88532` (`created_by`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_f7a4c3bc48f24df007936d217be` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_464f927ae360106b783ed0b410` (`slug`),
  ADD UNIQUE KEY `IDX_c44ac33a05b144dd0d9ddcf932` (`sku`),
  ADD KEY `FK_9a5f6868c96e0069e699f33e124` (`category_id`),
  ADD KEY `FK_c1af9b47239151e255f62e03247` (`created_by`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_4f166bb8c2bfcef2498d97b4068` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_46f236f21640f9da218a063a86` (`sku`),
  ADD KEY `FK_6343513e20e2deab45edfce1316` (`product_id`);

--
-- Indexes for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3ddc983c5f7bcf132fd8732c3f4` (`user_id`);

--
-- Indexes for table `sms_messages`
--
ALTER TABLE `sms_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_phone_number` (`phone_number`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indexes for table `stock_alerts`
--
ALTER TABLE `stock_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_dad362a1120c7a8b522ed7aaa0a` (`product_id`),
  ADD KEY `FK_77356964aae8304ff896a1e6422` (`variant_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_6f01a03dcb1aa33822e19534cd` (`code`),
  ADD KEY `FK_4be40fae84ce82ed3baef4a49fa` (`created_by`);

--
-- Indexes for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_64385b800e675d22928d1e1cec` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transfer_payments`
--
ALTER TABLE `bank_transfer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cod_payments`
--
ALTER TABLE `cod_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_card_payments`
--
ALTER TABLE `credit_card_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_refunds`
--
ALTER TABLE `order_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_timeline`
--
ALTER TABLE `order_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_messages`
--
ALTER TABLE `sms_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_alerts`
--
ALTER TABLE `stock_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `FK_d54f841fa5478e4734590d44036` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FK_9c77aaa5bc26f66159661ffd808` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_23ad9291e0e22cdf46ae7ec5461` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_88cea2dc9c31951d06437879b40` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK_732fdb1f76432d65d2c136340dc` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `FK_2520d97de0c9a0fbfc9b00f4c1b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_aeb0f3a59ed2fd95e1a13097eda` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d9a2ac973b889087b33f84d3517` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_772d0ce0473ac2ccfa26060dbe9` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FK_145532db85752b29c57d2b7b1f1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_9263386c35b6b242540f9493b00` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_refunds`
--
ALTER TABLE `order_refunds`
  ADD CONSTRAINT `FK_91a69cafbe7711aaebd0e0ac4b6` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_efa528b06d89f38fccf4f086fba` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `order_timeline`
--
ALTER TABLE `order_timeline`
  ADD CONSTRAINT `FK_06946dd72c1684ac49bfcc88532` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_5127a6bdbbdfcbd60fa05d74595` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `FK_f7a4c3bc48f24df007936d217be` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_9a5f6868c96e0069e699f33e124` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_c1af9b47239151e255f62e03247` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FK_4f166bb8c2bfcef2498d97b4068` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `FK_6343513e20e2deab45edfce1316` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD CONSTRAINT `FK_3ddc983c5f7bcf132fd8732c3f4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_alerts`
--
ALTER TABLE `stock_alerts`
  ADD CONSTRAINT `FK_77356964aae8304ff896a1e6422` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dad362a1120c7a8b522ed7aaa0a` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `FK_4be40fae84ce82ed3baef4a49fa` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
  ADD CONSTRAINT `FK_64385b800e675d22928d1e1cecf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
