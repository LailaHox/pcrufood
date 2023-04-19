-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2023 at 02:05 AM
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
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `idShop` text NOT NULL,
  `NameFood` text NOT NULL,
  `PathImage` text NOT NULL,
  `Price` text NOT NULL,
  `Detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `idShop`, `NameFood`, `PathImage`, `Price`, `Detail`) VALUES
(2, '9', 'ผัดกะเพรา', '/foodapp/Food/food86118.jpg', '35', 'ไม่มีไข่ดาว'),
(3, '2', 'พริกแกง', '/foodapp/Food/food971426.jpg', '35', 'สูตรเด็ด'),
(4, '2', 'ผัดซีอิ้ว', '/foodapp/Food/food38658.jpg', '35', 'หวาน'),
(5, '9', 'ข้าวผัด', '/foodapp/Food/food881769.jpg', '35', 'ร้อนๆ'),
(6, '9', 'ข้าวไข่เจียว', '/foodapp/Food/food265043.jpg', '35', 'พร้อมข้าว'),
(7, '9', 'ไข่ดาว', '/foodapp/Food/food553553.jpg', '5', 'ไข่ดาวอย่างเดียว'),
(12, '9', 'ไข่ดาว', '/foodapp/Food/food466871.jpg', '5', 'สุก'),
(19, '9', 'ไข่ต้ม', '/foodapp/Food/editFood76671.jpg', '5', 'สุก'),
(20, '8', 'ไข่ต้ม', '/foodapp/Food/food358123.jpg', '5', 'สุก'),
(21, '8', 'ไข่ดาว', '/foodapp/Food/food918307.jpg', '10', 'ได้2ฟอง');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `OrderDateTime` text NOT NULL,
  `idMem` text NOT NULL,
  `NameUser` text NOT NULL,
  `idShop` text NOT NULL,
  `NameShop` text NOT NULL,
  `Distance` text NOT NULL,
  `Transport` text NOT NULL,
  `idFood` text NOT NULL,
  `NameFood` text NOT NULL,
  `Price` text NOT NULL,
  `Amount` text NOT NULL,
  `Sum` text NOT NULL,
  `idRider` text NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `OrderDateTime`, `idMem`, `NameUser`, `idShop`, `NameShop`, `Distance`, `Transport`, `idFood`, `NameFood`, `Price`, `Amount`, `Sum`, `idRider`, `Status`) VALUES
(8, '2023-04-19 01:52', '5', '01', '8', 'Mart', '5.93', '57', '[20]', '[ไข่ต้ม]', '[5]', '[1]', '[5]', 'none', 'UserOrder'),
(10, '2023-04-19 02:02', '6', '02', '2', 'shopsnack', '6.21', '57', '[4]', '[ผัดซีอิ้ว]', '[35]', '[2]', '[70]', 'none', 'UserOrder'),
(11, '2023-04-19 02:13', '6', '02', '9', 'chicken', '5.95', '57', '[2, 5]', '[ผัดกะเพรา, ข้าวผัด]', '[35, 35]', '[3, 1]', '[105, 35]', 'none', 'UserOrder');

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
  `chooseType` text NOT NULL,
  `NameShop` text NOT NULL,
  `Address` text NOT NULL,
  `PhoneShop` text NOT NULL,
  `UrlPicture` text NOT NULL,
  `Lat` text NOT NULL,
  `Lng` text NOT NULL,
  `Token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `id`, `password`, `name`, `idcard`, `phonenumber`, `chooseType`, `NameShop`, `Address`, `PhoneShop`, `UrlPicture`, `Lat`, `Lng`, `Token`) VALUES
(1, 'test01', '1234', 'test01', '1234567890111', '01', 'Owner', '', '', '', '', '', '', ''),
(2, 'test02', '1234', 'ทศพล', '1234567890112', '1234567890', 'Owner', 'shopsnack', 'qw/013', '656', '/foodapp/Shop/editShop34883.jpg', '16.4527967', '101.1482117', ''),
(3, 'test03', '1234', 'test03', '1234567890113', '1234567890', 'Owner', '', '', '', '', '', '', ''),
(4, 'id', 'password', 'name', 'idcard', 'phonenumber', 'chooseType', '', '', '', '', '', '', ''),
(5, '01', '1234', '01', '01', '01', 'Member', '', '', '', '', '', '', ''),
(6, '02', '1234', '02', '02', '02', 'Member', '', '', '', '', '', '', ''),
(7, 'test04', '1234', '01', '01', '01', 'Rider', '', '', '', '', '', '', ''),
(8, 'ft01', '1234', 'ft01', '1', '1', 'Owner', 'Mart', '99/gb', '5547', '/foodapp/Shop/shop119242.jpg', '16.4514801', '101.1506497', ''),
(9, 'testo', '1234', 'owner', '1', '1', 'Owner', 'chicken', '101', '1105', '/foodapp/Shop/shop561688.jpg', '16.45138', '101.1501917', ''),
(10, 'id', 'password', 'name', 'idcard', 'phonenumber', 'chooseType', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
