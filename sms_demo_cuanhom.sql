-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 27, 2025 at 03:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `bike_accessories`
--

CREATE TABLE `bike_accessories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `compatible_with` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`compatible_with`)),
  `in_stock` tinyint(1) DEFAULT 1,
  `image_url` varchar(255) DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_accessories`
--

INSERT INTO `bike_accessories` (`id`, `name`, `description`, `price`, `category`, `compatible_with`, `in_stock`, `image_url`, `image_filename`, `created_at`, `updated_at`) VALUES
(1, 'Mũ bả hiểm thể thao', 'Mũ bả hiểm nhẹ, thông thoáng cho đạp xe thể thao', 450000.00, 'Dụng cụ', '[1,3,4,6]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763996986824-404096043.jpg', 'accessory-1763996986824-404096043.jpg', '2025-11-16 16:19:33', '2025-11-24 15:09:52'),
(2, 'Bộ dụng cụ sửa xe đa năng', 'Bộ dụng cụ 15 trong 1 cho bảo dưỡng xe đạp', 280000.00, 'Dụng cụ', '[1,2,3,4,5,6]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763997031846-710028464.jpg', 'accessory-1763997031846-710028464.jpg', '2025-11-16 16:19:33', '2025-11-24 15:10:33'),
(3, 'Bình nước thể thao', 'Bình nước 750ml, chống tràn', 120000.00, 'Phụ kiện', '[1,2,3,4,5,6]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763997006840-548707847.jpg', 'accessory-1763997006840-548707847.jpg', '2025-11-16 16:19:33', '2025-11-24 15:10:07'),
(4, 'Đèn xe đạp LED', 'Đèn chiếu sáng phía trước và sau', 350000.00, 'An toàn', '[1,3,4,5,6]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763997081977-733034047.jpg', 'accessory-1763997081977-733034047.jpg', '2025-11-16 16:19:33', '2025-11-24 15:11:23'),
(5, 'Cảm Biến Tốc Độ IGPSPORT SPD70', 'THÔNG SỐ KỸ THUẬT CẢM BIẾN TỐC ĐỘ IGPSPORT SPD70:\nBộ cảm biến: Độ nhạy cao\nChống rơi & Chống sốc: 1.5m\nTrọng lượng sản phẩm: 7,8g (có pin)\nKích thước sản phẩm: 36*34*7,7mm\nCấp độ chống nước: IPX7\nTuổi thọ pin: Lên đến 300 giờ\nTruyền dữ liệu: Bluetooth 5.0+ANT+\nThiết bị được hỗ trợ: Android 6.0 trở lên\nĐóng gói: SPD70*1, Vỏ bảo vệ silicon*1, Pin CR2025*1, Hướng dẫn sử dụng*1', 390000.00, 'Bảo hộ', '[1,2,5,6]', 0, 'http://localhost:3000/uploads/accessories/accessory-1763996972995-885588235.jpg', 'accessory-1763996972995-885588235.jpg', '2025-11-24 09:38:13', '2025-11-24 15:09:34'),
(6, 'Mắt Kính Đạp Xe Thể Thao ACTIVE XQ36A - Revo Cycling Sunglasses', 'Mắt Kính Đạp Xe Thể Thao ACTIVE XQ36A - Revo Cycling Sunglasses.\nMắt kính đạp xe thể thao ACTIVE XQ36A là lựa chọn lý tưởng cho những ai yêu thích sự thoải mái và bảo vệ mắt tối đa khi tham gia các hoạt động ngoài trời. Với thiết kế năng động và tính năng vượt trội, sản phẩm không chỉ giúp bạn bảo vệ mắt khỏi ánh sáng mặt trời mà còn mang đến trải nghiệm rõ nét, bảo vệ mắt toàn diện trong suốt hành trình đạp xe.\n\n\n\nCông nghệ Revo – Hiệu Suất Tối Ưu\n\nMắt kính ACTIVE XQ36A sử dụng công nghệ Revo tiên tiến, mang đến khả năng chống chói và giảm phản xạ ánh sáng cực kỳ hiệu quả. Các lớp tráng Revo trên bề mặt kính giúp tăng cường độ tương phản và độ sáng, cho phép bạn quan sát rõ ràng hơn ngay cả trong điều kiện ánh sáng...', 990000.00, 'Mắt kính ', '[1,2,3,4,5]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763997019690-292608933.jpg', 'accessory-1763997019690-292608933.jpg', '2025-11-24 12:45:51', '2025-11-24 15:10:20'),
(7, 'Còi xe', NULL, 100000.00, 'Dụng cụ', '[2,5]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763993387238-485469290.jpg', NULL, '2025-11-24 14:02:41', '2025-11-24 14:09:52'),
(8, 'Chuông xe mini', NULL, 89000.00, 'Dụng cụ', '[1]', 1, 'http://localhost:3000/uploads/accessories/accessory-1763996946628-785596343.jpg', 'accessory-1763996946628-785596343.jpg', '2025-11-24 14:10:37', '2025-11-24 15:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `bike_services`
--

CREATE TABLE `bike_services` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `warranty_period` int(11) DEFAULT 12,
  `free_maintenance` tinyint(1) DEFAULT 0,
  `delivery_assembly` tinyint(1) DEFAULT 1,
  `test_ride_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_services`
--

INSERT INTO `bike_services` (`id`, `product_id`, `warranty_period`, `free_maintenance`, `delivery_assembly`, `test_ride_available`, `created_at`, `updated_at`) VALUES
(1, 1, 24, 1, 1, 1, '2025-11-16 15:25:42', '2025-11-16 15:25:42'),
(2, 2, 12, 1, 1, 1, '2025-11-16 15:25:42', '2025-11-16 15:25:42'),
(3, 3, 18, 1, 1, 1, '2025-11-16 15:25:42', '2025-11-16 15:25:42'),
(4, 4, 24, 1, 1, 1, '2025-11-16 15:25:42', '2025-11-16 15:25:42'),
(5, 5, 12, 1, 1, 1, '2025-11-16 15:25:42', '2025-11-16 15:25:42');

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
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `userId`, `sessionId`, `productId`, `quantity`, `price`, `createdAt`, `updatedAt`) VALUES
(3, NULL, 'test17', 1, 1, 8484.00, '2025-10-31 16:55:44', '2025-10-31 16:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_guest` tinyint(1) DEFAULT 0,
  `temporary_token` varchar(100) DEFAULT NULL,
  `guest_expires_at` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `is_guest`, `temporary_token`, `guest_expires_at`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Mai Lê Phương Loan', 'admin@gmail.com', 0, NULL, NULL, '09282828', 'VNUIS', '2025-10-30 01:54:17', '2025-11-03 19:43:48'),
(4, 'Nguyễn Duy Đức', 'ducduy@gmail.com', 0, NULL, NULL, '02929229', 'VNUIS', '2025-10-30 02:03:13', '2025-11-03 19:44:02'),
(5, 'Lê Thị Xuân Hào', 'hao@gmail.com', 0, NULL, NULL, '39393883', 'ha nội', '2025-10-30 02:05:57', '2025-11-27 16:59:38'),
(9, 'Đoàn Thị Hồng Ngọc', 'ngocdoan@gmail.com', 0, NULL, NULL, '92943829', 'VNU IS', '2025-10-30 11:51:21', '2025-10-30 11:51:21'),
(12, 'Nguyễn Thu Hồng', 'hongthu@gmail.com', 0, NULL, NULL, '029488482', 'VNUIS', '2025-11-03 19:43:28', '2025-11-03 19:43:28'),
(14, 'Trần Văn Dũng', 'dungtran@gmail.com', 0, NULL, NULL, '39393883', 'VNU IS', '2025-11-06 16:37:21', '2025-11-27 16:58:35'),
(16, 'Trần Hoàng Anh', 'hoanganh@gmail.com', 0, NULL, NULL, '03929292929', 'VNUIS', '2025-11-13 16:38:03', '2025-11-13 16:38:03'),
(17, 'Quang', 'quang@gmail.com', 0, NULL, NULL, '0987654321', 'qưertyuio', '2025-11-13 16:48:06', '2025-11-13 16:48:06'),
(18, 'QHC', 'qhc@gmail.com', 0, NULL, NULL, '123213123123', '12312312', '2025-11-13 16:56:22', '2025-11-13 16:56:22'),
(19, 'QUI', 'qui@gmail.com', 0, NULL, NULL, '', '2131231231231', '2025-11-13 16:58:46', '2025-11-16 20:47:04'),
(20, 'abc', 'lalal@gmail.com', 0, NULL, NULL, '2929229', 'VNUIS', '2025-11-13 21:38:44', '2025-11-13 21:38:44'),
(21, 'Vũ Ngọc Hoa', 'hoa@gmail.com', 0, NULL, NULL, '03033020', 'Nghệ An', '2025-11-13 23:17:21', '2025-11-13 23:17:21'),
(22, 'Nguyễn Mai Chi', 'maichi@gmail.com', 0, NULL, NULL, '0292992', 'Vũng Tàu', '2025-11-13 23:22:46', '2025-11-13 23:22:46'),
(23, 'Hà Hồng ', 'hongha@gmail.com', 0, NULL, NULL, '02929910', 'Nam Định ', '2025-11-13 23:33:34', '2025-11-13 23:33:34'),
(24, 'Phạm Chi Mai', 'chimai@gmail.com', 0, NULL, NULL, '02999101', 'Nam Định', '2025-11-13 23:34:47', '2025-11-13 23:34:47'),
(25, 'Nguyễn Thanh Nhàn', 'thanhnhan@gmail.com', 0, NULL, NULL, '02929292929', 'Phú Thọ ', '2025-11-13 23:38:06', '2025-11-13 23:38:06'),
(26, 'Nguyễn Trà My', 'myiu@gmail.com', 0, NULL, NULL, '0929920202', 'Bắc Ninh', '2025-11-13 23:50:25', '2025-11-13 23:50:25'),
(27, 'Hà Trang', 'trang@gmail.com', 0, NULL, NULL, '029299292', 'Hải Phòng ', '2025-11-13 23:56:13', '2025-11-13 23:56:13'),
(28, 'QUI FF', 'quDi@gmail.com', 0, NULL, NULL, '0987654321', '12345', '2025-11-14 08:37:36', '2025-11-14 08:37:36'),
(29, 'Trần Văn Dũng', 'dungtran@344gmail.com', 0, NULL, NULL, '39393883', 'Hồ Chí Minh', '2025-11-27 15:43:20', '2025-11-27 15:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `guest_session_id` varchar(100) DEFAULT NULL,
  `is_guest_order` tinyint(1) DEFAULT 0,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('Pending','Paid','Shipped','Canceled') DEFAULT 'Pending',
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `customerId` int(11) DEFAULT NULL,
  `orderNumber` varchar(255) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT 0,
  `paid_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `customer_notes` text DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `guest_session_id`, `is_guest_order`, `order_date`, `status`, `totalAmount`, `created_by`, `created_at`, `customerId`, `orderNumber`, `shipping_address`, `billing_address`, `payment_method`, `is_paid`, `paid_at`, `phone`, `email`, `customer_notes`, `cancellation_reason`, `completed_at`, `cancelled_at`, `updated_at`) VALUES
(1, 0, NULL, 0, '2025-10-30 15:13:41', 'Pending', 8484.00, NULL, '2025-10-30 15:13:41', 1, 'ORD-1761812021666-tcrfjp7op', 'hanoi ', 'america', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-30 08:13:41'),
(3, 0, NULL, 0, '2025-11-01 00:30:24', 'Pending', 3322.00, NULL, '2025-11-01 00:30:24', 5, 'ORD-1761931824118-ovdrmav4v', 'ha nội', 'ha nội', 'COD', 0, NULL, '39393883', 'hao@gmail.com', '', NULL, NULL, NULL, '2025-10-31 17:30:24'),
(4, 0, NULL, 0, '2025-11-01 10:26:46', 'Pending', 3322.00, NULL, '2025-11-01 10:26:46', NULL, 'ORD-1761967606036-esscvyiku', 'Hồ Chí Minh', 'Hồ Chí Minh', 'COD', 0, NULL, '39393883', 'dungtran@gmail.com', '', NULL, NULL, NULL, '2025-11-01 03:26:46'),
(5, 0, NULL, 0, '2025-11-06 16:37:21', 'Pending', 36542.00, NULL, '2025-11-06 16:37:21', 14, 'ORD-1762421841251-kqf1jgjwy', 'Hồ Chí Minh', 'Hồ Chí Minh', 'COD', 0, NULL, '39393883', 'dungtran@gmail.com', '', NULL, NULL, NULL, '2025-11-06 09:37:21'),
(6, 0, NULL, 0, '2025-11-13 16:09:03', 'Pending', 3322.00, NULL, '2025-11-13 16:09:03', 14, 'ORD-1763024943101-rhz7newgu', 'VNUIS', 'VNUIS', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 09:09:03'),
(7, 0, NULL, 0, '2025-11-13 16:09:51', 'Pending', 3322.00, NULL, '2025-11-13 16:09:51', 14, 'ORD-1763024991830-42ar96lzi', '123 ABC', '123 ABC', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 09:09:51'),
(8, 0, NULL, 0, '2025-11-13 16:19:01', 'Pending', 3322.00, NULL, '2025-11-13 16:19:01', 1, 'ORD-1763025541328-2ph11e0hx', 'ha nội', 'ha nội', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 09:19:01'),
(9, 0, NULL, 0, '2025-11-13 16:22:40', 'Pending', 333.00, NULL, '2025-11-13 16:22:40', 1, 'ORD-1763025760231-kkkgfl6cz', 'Hà Nội', 'Hà Nội', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 09:22:40'),
(10, 0, NULL, 0, '2025-11-13 16:58:46', 'Pending', 3322.00, NULL, '2025-11-13 16:58:46', 19, 'ORD-1763027926241-uvq6rox8q', '2131231231231', '12312312', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 09:58:46'),
(11, 0, NULL, 0, '2025-11-13 21:38:44', 'Pending', 3322.00, NULL, '2025-11-13 21:38:44', 20, 'ORD-1763044724726-w3qjtlipm', 'VNUIS', 'VNUIS', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 14:38:44'),
(12, 0, NULL, 0, '2025-11-13 23:17:21', 'Pending', 3322.00, NULL, '2025-11-13 23:17:21', 21, 'ORD-1763050641952-6jsdefsjl', 'Nghệ An', 'Nghệ An', 'BANKING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 16:17:21'),
(13, 0, NULL, 0, '2025-11-13 23:22:46', 'Pending', 333.00, NULL, '2025-11-13 23:22:46', 22, 'ORD-1763050966195-ivt7jyhyh', 'Vũng Tàu', 'Vũng Tàu', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 16:22:46'),
(14, 0, NULL, 0, '2025-11-13 23:56:13', 'Pending', 8484.00, NULL, '2025-11-13 23:56:13', 27, 'ORD-1763052973753-82efvibxh', 'Hải Phòng ', 'Hải Phòng ', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-13 16:56:13'),
(15, 0, NULL, 0, '2025-11-14 08:37:36', 'Pending', 3322.00, NULL, '2025-11-14 08:37:36', 28, 'ORD-1763084256179-m1lvm5334', '12345', '12345', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 01:37:36'),
(16, 0, NULL, 0, '2025-11-14 09:15:36', 'Pending', 8484.00, NULL, '2025-11-14 09:15:36', 19, 'ORD-1763086536893-t1qtgq07m', '123456', '123456', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 02:15:36'),
(17, 0, NULL, 0, '2025-11-14 09:36:25', 'Pending', 3322.00, NULL, '2025-11-14 09:36:25', 19, 'ORD-1763087785771-42nyg9oi0', 'hjjj', 'hjjj', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 02:36:25'),
(18, 0, NULL, 0, '2025-11-14 09:55:36', 'Pending', 333.00, NULL, '2025-11-14 09:55:36', 19, 'ORD-1763088936794-mmf4jtqc1', '38833', '38833', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 02:55:36'),
(19, 0, NULL, 0, '2025-11-14 09:58:07', 'Pending', 333.00, NULL, '2025-11-14 09:58:07', 19, 'ORD-1763089087228-9ooigymd6', '993939', '993939', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 02:58:07'),
(20, 0, NULL, 0, '2025-11-14 09:58:42', 'Pending', 8484.00, NULL, '2025-11-14 09:58:42', 19, 'ORD-1763089122042-yprh11m01', 'jjgjg', 'jjgjg', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 02:58:42'),
(21, 0, NULL, 0, '2025-11-14 10:10:40', 'Pending', 8484.00, NULL, '2025-11-14 10:10:40', 1, 'ORD-1763089840349-2lsdf26ce', 'Test Address', NULL, 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 03:10:40'),
(22, 0, NULL, 0, '2025-11-14 10:32:06', 'Pending', 938.00, NULL, '2025-11-14 10:32:06', 19, 'ORD-1763091126150-0jclnyd6b', 'njjjd', 'njjjd', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 03:32:06'),
(23, 0, NULL, 0, '2025-11-14 11:22:11', 'Pending', 3999000.00, NULL, '2025-11-14 11:22:11', 19, 'ORD-1763094131750-o7ifq8gbz', 'nhà t ', 'nhà t ', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-14 04:22:11'),
(24, 0, NULL, 0, '2025-11-16 20:42:55', 'Pending', 3999000.00, NULL, '2025-11-16 20:42:55', 19, 'ORD-1763300575836-66i0rmdc5', 'abc', 'abc', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-16 13:42:55'),
(25, 0, NULL, 0, '2025-11-16 20:46:29', 'Pending', 3999000.00, NULL, '2025-11-16 20:46:29', 19, 'ORD-1763300789795-42hkv1iur', 'abc', 'abc', 'BANKING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-16 13:46:29'),
(37, 14, NULL, 0, '2025-11-27 16:00:55', 'Pending', 6550000.00, NULL, '2025-11-27 16:00:55', NULL, 'ORD-1764234055963-ulu9jc0sr', 'Hồ Chí Minh', 'Hà Nội', 'BANKING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:00:56'),
(38, 14, NULL, 0, '2025-11-27 16:01:09', 'Pending', 6550000.00, NULL, '2025-11-27 16:01:09', NULL, 'ORD-1764234069285-95dcpk3tr', 'Hồ Chí Minh', 'Hà Nội', 'BANKING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:01:09'),
(39, 14, NULL, 0, '2025-11-27 16:12:20', 'Pending', 6550000.00, NULL, '2025-11-27 16:12:20', NULL, 'ORD-1764234740327-aqzzq1pu3', 'ha nội', 'ha nội', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:12:20'),
(40, 14, NULL, 0, '2025-11-27 16:27:25', 'Pending', 6550000.00, NULL, '2025-11-27 16:27:25', NULL, 'ORD-1764235645709-3l9bsdhf5', 'ha nội', 'ha nội', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:27:25'),
(41, 14, NULL, 0, '2025-11-27 16:27:31', 'Pending', 6550000.00, NULL, '2025-11-27 16:27:31', NULL, 'ORD-1764235651013-kt98vqfk9', 'ha nội', 'ha nội', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:27:31'),
(42, 14, NULL, 0, '2025-11-27 16:45:05', 'Pending', 6550000.00, NULL, '2025-11-27 16:45:05', NULL, 'ORD-1764236705840-zkajpcb2p', 'An Dương', 'An Dương', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:45:05'),
(43, 14, NULL, 0, '2025-11-27 16:50:12', 'Pending', 6550000.00, NULL, '2025-11-27 16:50:12', NULL, 'ORD-1764237012826-gatirlts4', 'An Dương', 'An Dương', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:50:12'),
(44, 14, NULL, 0, '2025-11-27 16:57:32', 'Pending', 6550000.00, NULL, '2025-11-27 16:57:32', NULL, 'ORD-1764237452836-jilmqnn7m', 'An Dương', 'An Dương', 'COD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:57:32'),
(45, 14, NULL, 0, '2025-11-27 16:58:35', 'Pending', 3999000.00, NULL, '2025-11-27 16:58:35', NULL, 'ORD-1764237515145-7ttv4x8zt', 'VNU IS', 'VNU IS', 'BANKING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-27 09:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `orderId`, `productId`, `quantity`, `unitPrice`, `totalPrice`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 1, 8484.00, 8484.00, '2025-10-30 15:13:41', '2025-10-30 15:13:41'),
(2, 2, 1, 1, 8484.00, 8484.00, '2025-11-01 00:27:02', '2025-11-01 00:27:02'),
(3, 3, 2, 1, 3322.00, 3322.00, '2025-11-01 00:30:24', '2025-11-01 00:30:24'),
(4, 4, 2, 1, 3322.00, 3322.00, '2025-11-01 10:26:46', '2025-11-01 10:26:46'),
(5, 5, 2, 11, 3322.00, 36542.00, '2025-11-06 16:37:21', '2025-11-06 16:37:21'),
(6, 6, 2, 1, 3322.00, 3322.00, '2025-11-13 16:09:03', '2025-11-13 16:09:03'),
(7, 7, 2, 1, 3322.00, 3322.00, '2025-11-13 16:09:51', '2025-11-13 16:09:51'),
(8, 8, 2, 1, 3322.00, 3322.00, '2025-11-13 16:19:01', '2025-11-13 16:19:01'),
(9, 9, 5, 1, 333.00, 333.00, '2025-11-13 16:22:40', '2025-11-13 16:22:40'),
(10, 10, 2, 1, 3322.00, 3322.00, '2025-11-13 16:58:46', '2025-11-13 16:58:46'),
(11, 11, 2, 1, 3322.00, 3322.00, '2025-11-13 21:38:44', '2025-11-13 21:38:44'),
(12, 12, 2, 1, 3322.00, 3322.00, '2025-11-13 23:17:21', '2025-11-13 23:17:21'),
(13, 13, 3, 1, 333.00, 333.00, '2025-11-13 23:22:46', '2025-11-13 23:22:46'),
(14, 14, 1, 1, 8484.00, 8484.00, '2025-11-13 23:56:13', '2025-11-13 23:56:13'),
(15, 15, 2, 1, 3322.00, 3322.00, '2025-11-14 08:37:36', '2025-11-14 08:37:36'),
(16, 16, 1, 1, 8484.00, 8484.00, '2025-11-14 09:15:36', '2025-11-14 09:15:36'),
(17, 17, 2, 1, 3322.00, 3322.00, '2025-11-14 09:36:25', '2025-11-14 09:36:25'),
(18, 18, 3, 1, 333.00, 333.00, '2025-11-14 09:55:36', '2025-11-14 09:55:36'),
(19, 19, 3, 1, 333.00, 333.00, '2025-11-14 09:58:07', '2025-11-14 09:58:07'),
(20, 20, 1, 1, 8484.00, 8484.00, '2025-11-14 09:58:42', '2025-11-14 09:58:42'),
(21, 21, 1, 1, 8484.00, 8484.00, '2025-11-14 10:10:40', '2025-11-14 10:10:40'),
(22, 22, 4, 1, 938.00, 938.00, '2025-11-14 10:32:06', '2025-11-14 10:32:06'),
(23, 23, 2, 1, 3999000.00, 3999000.00, '2025-11-14 11:22:11', '2025-11-14 11:22:11'),
(24, 24, 2, 1, 3999000.00, 3999000.00, '2025-11-16 20:42:55', '2025-11-16 20:42:55'),
(25, 25, 2, 1, 3999000.00, 3999000.00, '2025-11-16 20:46:29', '2025-11-16 20:46:29'),
(27, 37, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:00:55', '2025-11-27 16:00:55'),
(28, 38, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:01:09', '2025-11-27 16:01:09'),
(29, 39, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:12:20', '2025-11-27 16:12:20'),
(30, 40, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:27:25', '2025-11-27 16:27:25'),
(31, 41, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:27:31', '2025-11-27 16:27:31'),
(32, 42, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:45:05', '2025-11-27 16:45:05'),
(33, 43, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:50:12', '2025-11-27 16:50:12'),
(34, 44, 1, 1, 6550000.00, 6550000.00, '2025-11-27 16:57:32', '2025-11-27 16:57:32'),
(35, 45, 2, 1, 3999000.00, 3999000.00, '2025-11-27 16:58:35', '2025-11-27 16:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model_year` year(4) DEFAULT NULL,
  `color_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`color_options`)),
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `bike_type` varchar(50) DEFAULT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attributes`)),
  `image_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `sku`, `brand`, `model_year`, `color_options`, `price`, `stock`, `category`, `bike_type`, `attributes`, `image_url`, `createdAt`, `updatedAt`, `quantity`) VALUES
(1, 'Xe đạp địa hình thể thao Maruishi ASO', 'Với xu hướng phát triển bận rộn như ngày nay, mọi người thường làm việc văn phòng công sở không có thời gian hoạt động, để nâng cao sức khỏe và để phòng tránh được những bệnh tật. Bộ môn đạp xe đạp rất được nhiều người quan tâm nhất là ở các thành phố lớn, đạp xe đạp nâng cao sức khỏe và có rất nhiều tác dụng tốt cho cơ thể, thứ nhất là bộ môn bơi lội, thứ nhì là đạp xe đạp.\n\n', NULL, 'Maruishi', '2025', '[\"Đen\", \"Xanh\", \"Đỏ\"]', 6550000.00, 0, 'Xe đạp địa hình', 'Mountain Bike', NULL, 'http://localhost:3000/uploads/products/product-1763977152038-95658893.jpg', '2025-10-30 10:49:59', '2025-11-27 16:57:32', 174),
(2, 'Xe đạp trẻ em NISHIKI ANNA 20', 'Ngay lần đầu nhìn thấy xe đạp trẻ em NISHIKI ANNA 20, các bé và phụ huynh sẽ rất ấn tượng với thiết kế thời trang thể thao với 3 phối màu hiện đại cùng kích cỡ bánh 20 inch. Đây sẽ là lựa chọn tuyệt vời dành cho các bé trong giai đoạn phát triển và tập đi xe.\n', NULL, 'NISHIKI', '2025', '[\"Hồng\", \"Xanh\", \"Trắng\"]', 3999000.00, 0, 'Xe đạp trẻ em', 'Kids Bike', NULL, 'http://localhost:3000/uploads/products/product-1762160785813-40438951.jpg', '2025-10-31 08:36:35', '2025-11-27 16:58:35', 897),
(3, 'Xe đạp touring Maruishi Half Miler', 'Bạn đang cần tìm một chiếc xe nhẹ nhàng, thanh lịch, êm ái nhưng vẫn ổn định trên mọi cung đường, Mẫu xe Maruishi Half Miler đến từ Nhật Bản sẽ là chiếc xe khiến bạn hài lòng ngay từ cái nhìn đầu tiên. Xe đạp touring Maruishi Half Miler là chiếc xe đạp thành phố, với kiểu dáng trang nhã, màu sắc khỏe khoắn, phù hợp cho nhiều đối tượng sử dụng, từ thanh niên đến trung niên. Với nhiều mục đích sử dụng, từ đi làm, đi tập thể dục, đi chơi, đi phượt….\n', NULL, 'Maruishi', '2025', '[\"Xám\", \"Đen\"]', 3333000.00, 0, 'Xe đạp tuaring', 'Touring Bike', NULL, 'http://localhost:3000/uploads/products/product-1762160816726-403420681.jpg', '2025-10-31 08:41:46', '2025-11-16 22:25:17', 0),
(4, 'Xe đạp đua RIKULAU CADENCE', 'Xe đạp đua RIKULAU CADENCE mang trong mình kiểu dáng thể thao với thiết kế hiện đại, thời thượng, phù hợp với những hoạt động ngoài trời nhằm mục đích rèn luyện sức khỏe hay chinh phục những cung đường đầy thử thách.', NULL, 'RIKULAU', '2025', '[\"Đỏ\", \"Đen\", \"Trắng\"]', 2999000.00, 0, 'Xe đạp đua', 'Road Bike', NULL, 'http://localhost:3000/uploads/products/product-1762109283481-50811960.jpg', '2025-11-03 01:48:14', '2025-11-16 22:25:17', 20),
(5, 'Xe đạp touring RIKULAU Traverse 700C', 'Thương hiệu: Rikulau\nChất liệu khung: Hợp kim thép\nLoại phanh: Phanh vành\nPhuộc giảm xóc: Hợp kim thép\nLíp: Shimano Tz500- 7S – 14/28T\nGiò đĩa: Hợp kim nhôm 48T\nTay đề: Shimano TX30 1x7S\nĐề trước: Không\nĐề sau: Shimano Tourney TY21 7S\nTốc độ: 7\nVành xe: Hợp kim nhôm 2 lớp\nKích cỡ bánh xe: 700\nLốp xe: Kenda 700x28C\nDây âm sườn: Không\nGấp gọn: Không', NULL, NULL, NULL, NULL, 2590000.00, 0, 'Xe đạp touring ', NULL, NULL, 'http://localhost:3000/uploads/products/product-1762109374182-463006984.jpg', '2025-11-03 01:49:53', '2025-11-14 10:44:19', 3),
(6, 'Xe đạp đua RIKULAU ILI ILI\r\n', NULL, NULL, NULL, NULL, NULL, 1999000.00, 0, 'Xe đạp đua', NULL, NULL, 'http://localhost:3000/uploads/products/product-1763093939701-81722647.jpg', '2025-11-12 20:19:10', '2025-11-24 15:07:35', 99);

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `frame_size` varchar(50) DEFAULT NULL,
  `wheel_size` varchar(20) DEFAULT NULL,
  `gear_system` varchar(100) DEFAULT NULL,
  `brake_type` varchar(50) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `product_id`, `frame_size`, `wheel_size`, `gear_system`, `brake_type`, `weight`, `material`, `created_at`, `updated_at`) VALUES
(1, 1, 'L', '29\"', 'Shimano 21-speed', 'Đĩa phanh', 14.50, 'Nhôm', '2025-11-16 15:25:29', '2025-11-16 15:25:29'),
(2, 2, 'S', '20\"', 'Single-speed', 'Phanh gấp', 11.20, 'Thép', '2025-11-16 15:25:29', '2025-11-16 15:25:29'),
(3, 3, 'M', '700C', 'Shimano 18-speed', 'Phanh vành', 13.80, 'Thép Carbon', '2025-11-16 15:25:29', '2025-11-16 15:25:29'),
(4, 4, 'M', '700C', 'Shimano 16-speed', 'Đĩa phanh', 9.50, 'Carbon', '2025-11-16 15:25:29', '2025-11-16 15:25:29'),
(5, 5, 'L', '700C', 'Shimano 14-speed', 'Phanh vành', 12.10, 'Thép', '2025-11-16 15:25:29', '2025-11-16 15:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `test_ride_schedules`
--

CREATE TABLE `test_ride_schedules` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `scheduled_date` datetime NOT NULL,
  `status` enum('pending','confirmed','completed','cancelled') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('Admin','User') NOT NULL DEFAULT 'User',
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `role`, `email`, `name`, `createdAt`, `updatedAt`) VALUES
(1, '$2b$10$55dpwgw1hozyT/109.Z6Z.tFYrXukg/6BoTLelM.AIC0RZh5g5I2G', '', 'admin@gmail.com', 'Administrator', '2025-10-29 20:26:00', '2025-10-29 20:26:00'),
(3, '$2b$10$MGay2yItqnBV1WYouKccc.5YIG54ijhtNuZRBqWKQug9I/rZDz8mu', 'Admin', 'admin@example.com', 'Admin User', '2025-10-30 00:50:11', '2025-10-30 00:50:11'),
(4, '$2b$10$odxtykh2m1y2PXU889npLO3P6iocPFv28GMgXVTasaWqt8I/tPe/W', 'Admin', 'admin@123gmail.com', 'Admin User', '2025-10-30 00:54:11', '2025-10-30 00:54:11'),
(5, '$2b$10$1aVldWSJpddevA0QP/I8n.rBYp86hrrkd6jxjM23uOvV0mdwHOUxm', 'User', 'loaniu@example.com', 'Mai Lê Phương Loan', '2025-10-30 01:12:37', '2025-10-30 01:12:37'),
(6, '$2b$10$FH1j8H.W7eaf.xNRHXtIxuYWr.Prz48gjL37RuzwVEEfOvIIsZ5CO', 'User', 'simple@example.com', 'Simple User', '2025-10-30 01:16:46', '2025-10-30 01:16:46'),
(7, '$2b$10$Mz1TEwD.SlQKnbhkkNETouBqfVUtDf2iEdaUSluRmUB2/AkniOc8K', 'User', 'test@example.com', 'Test User', '2025-10-30 02:33:20', '2025-10-30 02:33:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bike_accessories`
--
ALTER TABLE `bike_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_services`
--
ALTER TABLE `bike_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product` (`userId`,`productId`),
  ADD KEY `idx_user_id` (`userId`),
  ADD KEY `idx_product_id` (`productId`),
  ADD KEY `idx_session_id` (`sessionId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderNumber` (`orderNumber`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `fk_orders_customer` (`customerId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `test_ride_schedules`
--
ALTER TABLE `test_ride_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bike_accessories`
--
ALTER TABLE `bike_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bike_services`
--
ALTER TABLE `bike_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `test_ride_schedules`
--
ALTER TABLE `test_ride_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bike_services`
--
ALTER TABLE `bike_services`
  ADD CONSTRAINT `bike_services_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_ride_schedules`
--
ALTER TABLE `test_ride_schedules`
  ADD CONSTRAINT `test_ride_schedules_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
