-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2023 at 01:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `id` text NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `idcard` text NOT NULL,
  `phonenumber` text NOT NULL,
  `chooseType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `id`, `password`, `name`, `idcard`, `phonenumber`, `chooseType`) VALUES
(1, 'test01', '1234', 'test01', '1234567890111', '', 'Owner'),
(2, 'test02', '1234', 'ทศพล', '1234567890112', '1234567890', 'Owner'),
(3, 'test03', '1234', 'test03', '1234567890113', '1234567890', 'Owner'),
(4, 'id', 'password', 'name', 'idcard', 'phonenumber', 'chooseType'),
(5, '01', '1234', '01', '01', '01', 'Member'),
(6, '02', '1234', '02', '02', '02', 'Member'),
(7, 'test04', '1234', '01', '01', '01', 'Rider'),
(8, 'ft01', '1234', 'ft01', '1', '1', 'Owner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
