-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 08:04 AM
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
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `idAuthor` int(11) NOT NULL,
  `AuthorName` varchar(100) NOT NULL,
  `TotalBookPublished` int(11) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`idAuthor`, `AuthorName`, `TotalBookPublished`, `DateOfBirth`) VALUES
(1, 'Morgan Housel', 3, '1984-01-01'),
(2, 'Dale Carnegie', 5, '1888-11-24'),
(3, 'James Clear', 1, '1986-06-01'),
(4, 'Benjamin Graham', 4, '1894-05-09'),
(5, 'Sun Tzu', 1, '0544-01-01'),
(6, 'Robert Greene', 6, '1959-05-14'),
(7, 'Peter Lynch', 2, '1944-01-19'),
(8, 'George S. Clason', 2, '1874-11-07'),
(9, 'Jordan B. Peterson', 2, '1962-06-12'),
(10, 'Robert T. Kiyosaki', 4, '1947-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `idBook` int(11) NOT NULL,
  `BookName` varchar(100) NOT NULL,
  `BookAuthor` varchar(100) DEFAULT NULL,
  `BookRating` int(11) DEFAULT NULL,
  `TotalBorrow` int(11) DEFAULT NULL,
  `idAuthor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`idBook`, `BookName`, `BookAuthor`, `BookRating`, `TotalBorrow`, `idAuthor`) VALUES
(1, 'The Psychology of Money', 'Morgan Housel', 5, 30, 1),
(2, 'How to Win Friends & Influence People', 'Dale Carnegie', 5, 50, 2),
(3, 'Atomic Habits', 'James Clear', 5, 20, 3),
(4, 'The Intelligent Investor', 'Benjamin Graham', 5, 15, 4),
(5, 'The Art of War', 'Sun Tzu', 5, 25, 4),
(6, 'The 48 Laws of Power', 'Robert Greene', 4, 20, 4),
(7, 'One Up on Wall Street', 'Peter Lynch', 4, 15, 4),
(8, 'The Richest Man in Babylon', 'George S. Clason', 5, 45, 4),
(9, '12 Rules for Life', 'Jordan B. Peterson', 5, 35, 4),
(10, 'Rich Dad Poor Dad', 'Robert T. Kiyosaki', 5, 55, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mostpopularbook`
--

CREATE TABLE `mostpopularbook` (
  `book_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `times_borrowed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mostpopularbook`
--

INSERT INTO `mostpopularbook` (`book_id`, `title`, `author_id`, `name`, `times_borrowed`) VALUES
(1, 'Wuthering Heights', 1, 'Emily Brontë', 25),
(2, 'The Lord of the Rings', 2, 'J.R.R. Tolkien', 30),
(3, 'The da Vinci Code', 3, 'Dan Brown', 18),
(4, 'The Hobbit', 2, 'J.R.R. Tolkien', 28),
(5, 'Start Your Own Import/Export Business', 4, 'Entrepreneur Press', 12),
(6, 'The Study Skills Handbook', 5, 'Stella Cottrell', 14),
(7, 'The World for Sale', 6, 'Javier Blas', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`idAuthor`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`idBook`),
  ADD KEY `fk_author` (`idAuthor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`idAuthor`) REFERENCES `author` (`idAuthor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
