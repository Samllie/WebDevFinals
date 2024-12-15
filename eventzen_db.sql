-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 04:03 PM
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
-- Database: `eventzen_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminusers`
--

CREATE TABLE `adminusers` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminusers`
--

INSERT INTO `adminusers` (`id`, `username`, `password`) VALUES
(1, 'kiel', '$2y$10$ZvEQqEQMHNcdcJjXqXgDQ.xdAMT57cSpyrCZarjH/wok/2iOm2q5.'),
(2, 'sam', '$2y$10$3csNK2JPOejKg/k4/W/pKutZdVhfJjocmDcCBMJAQ5IYTfd4FUq0y'),
(3, 'aj', '$2y$10$nFDWAziKzkjTFqzPniz8depTErDqr7RVZunlo65hHC/RU2F1fObFW');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` time NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `full_name`, `address`, `phone_number`, `preferred_date`, `preferred_time`, `event_name`, `created_at`) VALUES
(1, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732799', '2024-12-14', '10:15:00', 'First Communion', '2024-12-07 14:14:32'),
(2, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732799', '2024-12-14', '11:30:00', 'First Communion', '2024-12-07 14:23:23'),
(3, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732799', '2024-12-14', '12:30:00', 'First Communion', '2024-12-07 14:23:43'),
(4, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732799', '2024-12-14', '13:30:00', 'First Communion', '2024-12-07 14:31:30'),
(5, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732799', '2024-12-14', '15:30:00', 'Confirmation', '2024-12-07 14:34:09'),
(6, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732799', '2024-12-27', '10:30:00', 'wedding', '2024-12-08 13:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `guests` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `fullname`, `address`, `mobile`, `email`, `event_date`, `guests`) VALUES
(1, 'kiel codillo', 'Blk. 7 lot 24 santol street phase 2 annex lumina subdivision brgy. san vicente', '09075732843', 'ezekielcodillo56@gmail.com', '2024-12-29', 60);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`) VALUES
(1, 'kiel', 'codillo', 'ezekielcodillo56@gmail.com', '$2y$10$tOATK5EudItY3XQ0Z9ves.AM.fE0EStdaADAJ7CGtWGBb4RGoepI6', '2024-12-07 13:32:44'),
(4, 'jean', 'codillo', 'jeancodillo@gmail.com', '$2y$10$gJG.1UWUzJ2keNlbzU1kR.i48GKwGgIdC12QuDGEZl8MQBU0P.u4i', '2024-12-07 13:38:00'),
(5, 'Angelica', 'Evangelista', 'aj56@gmail.com', '$2y$10$b9RwD.XG5hme0m5yW5kl9uBRWADSTJ5p8Zf/Q6/LzDNhy.pTBruzq', '2024-12-07 13:39:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminusers`
--
ALTER TABLE `adminusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `adminusers`
--
ALTER TABLE `adminusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
