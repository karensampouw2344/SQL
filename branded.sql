-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 04:07 PM
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
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Perfume'),
(2, 'Clothing'),
(3, 'Bags');

-- --------------------------------------------------------

--
-- Table structure for table `designers`
--

CREATE TABLE `designers` (
  `designer_id` int(11) NOT NULL,
  `designer_name` varchar(100) NOT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designers`
--

INSERT INTO `designers` (`designer_id`, `designer_name`, `bio`) VALUES
(1, 'Giorgio Armani', 'World-renowned Italian designer known for elegant and tailored menswear.'),
(2, 'Coco Chanel', 'Legendary French designer famous for timeless women\'s fashion and luxury.'),
(3, 'Gucci', 'Global luxury brand famous for its unique and bold accessories.'),
(4, 'Christian Louboutin', 'French designer known for iconic red-soled shoes.'),
(5, 'Dior', 'A legendary French fashion house known for haute couture and luxury perfumes.');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `designer_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `created_at` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `designer_id`, `price`, `description`, `stock_quantity`, `created_at`) VALUES
(1, 'Chanel No. 5', 1, 2, 200.00, 'An iconic and timeless fragrance by Chanel.', 30, '2025-01-10'),
(2, 'Gucci Bloom', 1, 3, 150.00, 'A floral fragrance inspired by a garden in full bloom.', 40, '2025-01-10'),
(3, 'Armani Code', 1, 1, 120.00, 'A seductive fragrance for men with notes of leather and tonka bean.', 25, '2025-01-10'),
(4, 'Dior Sauvage', 1, 5, 150.00, 'A fresh and bold fragrance inspired by wide-open spaces.', 35, '2025-01-10'),
(5, 'Miss Dior Eau de Parfum', 1, 5, 180.00, 'A modern and romantic floral fragrance by Dior.', 30, '2025-01-10'),
(6, 'Chanel Tweed Jacket', 2, 2, 5000.00, 'The classic tweed jacket redefined for modern elegance.', 10, '2025-01-10'),
(7, 'Gucci Logo T-Shirt', 2, 3, 450.00, 'A comfortable cotton T-shirt featuring the iconic Gucci logo.', 50, '2025-01-10'),
(8, 'Armani Evening Gown', 2, 1, 3000.00, 'An exquisite evening gown designed for sophistication and grace.', 8, '2025-01-10'),
(9, 'Dior Bar Jacket', 2, 5, 4500.00, 'The iconic Bar Jacket that revolutionized women\'s fashion.', 10, '2025-01-10'),
(10, 'Dior Oblique Sweater', 2, 5, 1200.00, 'A luxury sweater featuring the Dior Oblique motif.', 15, '2025-01-10'),
(11, 'Chanel Classic Flap Bag', 3, 2, 7500.00, 'The timeless Chanel Classic Flap Bag, crafted in quilted leather.', 12, '2025-01-10'),
(12, 'Gucci GG Marmont Bag', 3, 3, 2500.00, 'A versatile and chic shoulder bag with the iconic GG logo.', 20, '2025-01-10'),
(13, 'Dior Lady Bag', 3, 5, 6000.00, 'The iconic Lady Dior bag featuring cannage stitching and Dior charms.', 8, '2025-01-10'),
(14, 'Armani Leather Tote', 3, 1, 1200.00, 'A spacious and elegant leather tote bag by Armani.', 15, '2025-01-10'),
(15, 'Charles & Keith Croc-Effect Bag', 3, NULL, 150.00, 'A chic bag with a textured croc-effect finish for a sleek look.', 30, '2025-01-10'),
(16, 'Charles & Keith Quilted Shoulder Bag', 3, NULL, 200.00, 'A luxurious quilted shoulder bag for modern elegance.', 25, '2025-01-10'),
(17, 'Kate Spade Sam Icon Bag', 3, NULL, 250.00, 'A classic and minimalist tote bag by Kate Spade.', 25, '2025-01-10'),
(18, 'Kate Spade Knott Satchel', 3, NULL, 300.00, 'A structured satchel bag with a playful twist.', 18, '2025-01-10'),
(19, 'Guess Alby Crossbody', 3, NULL, 90.00, 'A stylish crossbody bag perfect for casual outings.', 40, '2025-01-10'),
(20, 'Guess Vikky Tote', 3, NULL, 120.00, 'A spacious tote bag with the iconic Guess logo.', 35, '2025-01-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `designers`
--
ALTER TABLE `designers`
  ADD PRIMARY KEY (`designer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `designer_id` (`designer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designers`
--
ALTER TABLE `designers`
  MODIFY `designer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`designer_id`) REFERENCES `designers` (`designer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
