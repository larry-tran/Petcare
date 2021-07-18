-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 18, 2021 lúc 06:20 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petcaredb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `adminid` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`adminid`, `username`, `password`, `email`, `phone`, `fullname`, `status`) VALUES
(1, 'ThinhLN', '1', 'ThinhLNSE140590@fpt.edu.vn', '0123456789', 'Lê Nhựt Thịnh', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblappointment`
--

CREATE TABLE `tblappointment` (
  `appointmentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `total` double NOT NULL,
  `appointDate` date NOT NULL,
  `bookingDate` varchar(30) NOT NULL,
  `starttime` varchar(5) NOT NULL,
  `reasonDenied` varchar(500) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblappointment`
--

INSERT INTO `tblappointment` (`appointmentId`, `userId`, `shopId`, `total`, `appointDate`, `bookingDate`, `starttime`, `reasonDenied`, `status`) VALUES
(1, 7, 1, 167500, '2021-07-19', '2021-07-18 21:02:51', '08:30', 'Tiệm Cháy', 'denied'),
(2, 7, 1, 167500, '2021-07-19', '2021-07-18 21:03:44', '12:30', '', 'done'),
(3, 7, 1, 274000, '2021-07-19', '2021-07-18 21:35:17', '08:30', '', 'done'),
(4, 7, 1, 699000, '2021-07-19', '2021-07-18 21:35:56', '10:30', 'Việc bận đột xuất', 'canceled'),
(5, 7, 17, 60000, '2021-07-19', '2021-07-18 21:45:45', '16:15', '', 'done'),
(6, 7, 1, 1058000, '2021-07-23', '2021-07-18 21:48:22', '08:00', '', 'done'),
(7, 7, 1, 100000, '2021-07-19', '2021-07-18 22:24:59', '08:00', '', 'waiting'),
(8, 6, 17, 110000, '2021-07-19', '2021-07-18 22:26:50', '12:15', '', 'done');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblappointmentdetail`
--

CREATE TABLE `tblappointmentdetail` (
  `appointmentDetailId` int(11) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblappointmentdetail`
--

INSERT INTO `tblappointmentdetail` (`appointmentDetailId`, `appointmentId`, `serviceId`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 6),
(4, 2, 2),
(5, 2, 3),
(6, 2, 6),
(7, 3, 4),
(8, 3, 24),
(9, 3, 1),
(10, 3, 5),
(11, 3, 6),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 23),
(16, 4, 24),
(17, 5, 30),
(18, 6, 1),
(19, 6, 5),
(20, 6, 6),
(21, 6, 24),
(22, 6, 23),
(23, 6, 4),
(24, 6, 3),
(25, 6, 2),
(26, 7, 2),
(27, 8, 25),
(28, 8, 26);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblgoldtime`
--

CREATE TABLE `tblgoldtime` (
  `idGoldTime` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `daysOfWeek` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `slotId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblgoldtime`
--

INSERT INTO `tblgoldtime` (`idGoldTime`, `percent`, `daysOfWeek`, `shopId`, `status`, `slotId`) VALUES
(1, 50, 0, 1, 'active', 38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblrating`
--

CREATE TABLE `tblrating` (
  `ratingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `ratingNumber` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateOfComment` datetime DEFAULT NULL,
  `appointmentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tblrating`
--

INSERT INTO `tblrating` (`ratingId`, `userId`, `shopId`, `comment`, `ratingNumber`, `status`, `dateOfComment`, `appointmentId`) VALUES
(1, 7, 1, 'phục vụ chuyên nghiệp', 5, 'active', '2021-07-18 21:40:33', 2),
(2, 7, 1, 'Giá thành tốt', 4, 'active', '2021-07-18 21:42:12', 3),
(3, 7, 17, 'phục vụ thiếu chuyên nghiệp', 2, 'active', '2021-07-18 21:47:17', 5),
(4, 7, 1, 'vjp quá anh oy', 5, 'active', '2021-07-18 21:51:04', 6),
(5, 6, 17, 'vjp', 5, 'active', '2021-07-18 22:28:26', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblservice`
--

CREATE TABLE `tblservice` (
  `serviceId` int(11) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `duration` int(3) NOT NULL,
  `status` varchar(10) NOT NULL,
  `description` varchar(500) NOT NULL,
  `imageService` varchar(500) NOT NULL,
  `shopId` int(11) NOT NULL,
  `categoryService` varchar(10) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblservice`
--

INSERT INTO `tblservice` (`serviceId`, `serviceName`, `duration`, `status`, `description`, `imageService`, `shopId`, `categoryService`, `price`) VALUES
(1, 'Tẩy giun cho chó', 30, 'active', 'tẩy giun cho chó', '110072021212031.png', 1, 'clinic', 150000),
(2, 'Cắt móng cho mèo', 15, 'active', 'cắt móng cho mèo', '110072021211331.png', 1, 'spa', 100000),
(3, 'Tắm cho chó', 30, 'active', 'tắm cho chó', '110072021211322.png', 1, 'spa', 150000),
(4, 'Cắt móng cho chó', 30, 'active', 'Cắt móng cho chó', '111072021125855.png', 1, 'spa', 123000),
(5, 'Chích ngừa cho mèo', 10, 'active', 'chích các bệnh về đường ruột', '112072021065223.png', 1, 'clinic', 124000),
(6, 'Chích ngừa cho chó', 10, 'active', 'chích bệnh dại', '112072021065303.png', 1, 'clinic', 85000),
(23, 'Siêu âm chó', 60, 'active', '', '113072021221820.png', 1, 'spa', 260000),
(24, 'Cạo vôi răng cho chó', 45, 'active', '', '115072021222250.png', 1, 'spa', 66000),
(25, 'Chích chó', 20, 'active', '', '118072021191851.png', 17, 'clinic', 60000),
(26, 'Cạo cao răng cho chó', 15, 'active', '', '118072021191947.png', 17, 'clinic', 50000),
(27, 'Siêu âm cho chó', 60, 'active', '', '118072021193158.png', 17, 'clinic', 120000),
(28, 'Tẩy giun cho chó', 55, 'active', '', '118072021194154.png', 17, 'clinic', 248000),
(29, 'Tỉa lông cho Corgi', 30, 'inactive', '', '118072021202545.png', 1, 'clinic', 500000),
(30, 'Tỉa lông Corgi', 120, 'active', '', '118072021202855.png', 17, 'clinic', 60000),
(31, 'Đỡ đẻ cho chó', 120, 'active', '', '118072021202935.png', 17, 'clinic', 300000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblshop`
--

CREATE TABLE `tblshop` (
  `idShop` int(11) NOT NULL,
  `nameShop` varchar(50) NOT NULL,
  `addressShop` varchar(200) NOT NULL,
  `phoneNumShop` varchar(11) NOT NULL,
  `openTime` varchar(5) NOT NULL,
  `closeTime` varchar(5) NOT NULL,
  `type` varchar(10) NOT NULL,
  `imgShop` varchar(500) NOT NULL,
  `adImgShop` varchar(500) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblshop`
--

INSERT INTO `tblshop` (`idShop`, `nameShop`, `addressShop`, `phoneNumShop`, `openTime`, `closeTime`, `type`, `imgShop`, `adImgShop`, `status`) VALUES
(1, 'Pet City', '174 Cộng Hòa, Phường 12, Tân Bình, Thành phố Hồ Chí Minh 70000', '19001005', '08:00', '20:00', 'spa,clinic', 'logo.png', '1.png,2.png,3.png', 'active'),
(2, 'Phòng khám K-9', '88 Dương Bá Trạc, Phường 2, Q.8', '0901234567', '07:30', '21:00', 'clinic', 'logo.png', '1.png,2.png,3.png', 'active'),
(3, 'Pet Mart', '312 Quang Trung, Phường 10, Q.Gò Vấp', '0128962524', '08:15', '21:45', 'spa', 'logo.png', '1.png,2.png,3.png', 'active'),
(4, 'Petcare', '124A Xuân Thủy, Thảo Điền, Q.2', '0908144145', '08:00', '20:00', 'spa,clinic', 'logo.png', '1.png,2.png,3.png', 'active'),
(7, 'Doris Grooming', '217/18A Thích Quảng Đức, Q.Phú Nhuận', '0909192939', '10:30', '19:00', 'spa', 'logo.png', '1.png,2.png,3.png', 'active'),
(8, 'Family Vet', '72 Hữu Nghị, Phường Bình Thọ, Q.Thủ Đức', '0125867590', '09:00', '21:00', 'clinic', 'logo.png', '1.png,2.png,3.png', 'active'),
(15, '24/7 Pet Clinic', '94 Đường Đỗ Xuân Hợp, Khu Phố 6, Quận 9, Thành phố Hồ Chí Minh 70000', '0981314505', '07:00', '21:30', 'clinic', 'logo.png', '1.png,2.png,3.png', 'active'),
(16, 'Kelly', '113/47 Đường TCH 03, Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh', '01234567899', '07:45', '20:15', 'spa', 'logo.png', '1.png,2.png,3.png', 'active'),
(17, 'DeJays Grooming', '322/18 Nguyễn Đình Chiểu, Quận 3', '09874563212', '08:15', '20:30', 'clinic', 'logo.png', '1.png,2.png,3.png', 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblshopaccount`
--

CREATE TABLE `tblshopaccount` (
  `userid` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(200) NOT NULL,
  `shopid` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblshopaccount`
--

INSERT INTO `tblshopaccount` (`userid`, `username`, `password`, `email`, `shopid`, `status`) VALUES
(1, 'petcity', '123456', 'petcity@gmail.com', 1, 'active'),
(2, 'k9petshop', '123456', 'k9petshop@gmail.com', 2, 'active'),
(3, 'petmart', '123456', 'petmart@gmail.com', 3, 'active'),
(4, 'petcare', '123456', 'petcare@gmail.com', 4, 'active'),
(7, 'dorisgrooming', '123456', 'dorisgrooming@gmail.com', 7, 'active'),
(8, 'familyvet', '123456', 'familyvet@gmail.com', 8, 'active'),
(15, 'cccity1', '123456', 'chichchocity@gmail.com', 15, 'active'),
(17, 'kellyshop', '123456', 'kelly@gmail.com', 16, 'active'),
(18, 'dejay', '1', 'dejaygrming2@gmail.com', 17, 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblslot`
--

CREATE TABLE `tblslot` (
  `slotId` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `time` varchar(5) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tblslot`
--

INSERT INTO `tblslot` (`slotId`, `shopId`, `time`, `quantity`, `status`) VALUES
(1, 17, '08:15', 8, 'deleted'),
(2, 17, '08:45', 8, 'deleted'),
(3, 17, '09:15', 8, 'deleted'),
(4, 17, '09:45', 8, 'deleted'),
(5, 17, '10:15', 8, 'deleted'),
(6, 17, '10:45', 8, 'deleted'),
(7, 17, '11:15', 8, 'deleted'),
(8, 17, '11:45', 8, 'deleted'),
(9, 17, '12:15', 8, 'deleted'),
(10, 17, '12:45', 8, 'deleted'),
(11, 17, '13:15', 8, 'deleted'),
(12, 17, '13:45', 8, 'deleted'),
(13, 17, '14:15', 8, 'deleted'),
(14, 17, '14:45', 8, 'deleted'),
(15, 17, '15:15', 8, 'deleted'),
(16, 17, '15:45', 8, 'deleted'),
(17, 17, '16:15', 8, 'deleted'),
(18, 17, '16:45', 8, 'deleted'),
(19, 17, '17:15', 8, 'deleted'),
(20, 17, '17:45', 8, 'deleted'),
(21, 17, '18:15', 8, 'deleted'),
(22, 17, '18:45', 8, 'deleted'),
(23, 17, '19:15', 8, 'deleted'),
(24, 17, '19:45', 8, 'deleted'),
(25, 17, '08:15', 1, 'active'),
(26, 17, '09:15', 1, 'active'),
(27, 17, '10:15', 1, 'active'),
(28, 17, '11:15', 1, 'active'),
(29, 17, '12:15', 1, 'active'),
(30, 17, '13:15', 1, 'active'),
(31, 17, '14:15', 1, 'active'),
(32, 17, '15:15', 1, 'active'),
(33, 17, '16:15', 1, 'active'),
(34, 17, '17:15', 1, 'active'),
(35, 17, '18:15', 1, 'active'),
(36, 17, '19:15', 1, 'active'),
(37, 1, '08:00', 2, 'active'),
(38, 1, '08:30', 2, 'active'),
(39, 1, '09:00', 2, 'inactive'),
(40, 1, '09:30', 2, 'inactive'),
(41, 1, '10:00', 2, 'inactive'),
(42, 1, '10:30', 2, 'active'),
(43, 1, '11:00', 2, 'active'),
(44, 1, '11:30', 2, 'active'),
(45, 1, '12:00', 2, 'active'),
(46, 1, '12:30', 2, 'active'),
(47, 1, '13:00', 2, 'active'),
(48, 1, '13:30', 2, 'active'),
(49, 1, '14:00', 2, 'active'),
(50, 1, '14:30', 2, 'active'),
(51, 1, '15:00', 2, 'active'),
(52, 1, '15:30', 2, 'active'),
(53, 1, '16:00', 2, 'active'),
(54, 1, '16:30', 2, 'active'),
(55, 1, '17:00', 2, 'active'),
(56, 1, '17:30', 2, 'active'),
(57, 1, '18:00', 2, 'active'),
(58, 1, '18:30', 2, 'active'),
(59, 1, '19:00', 2, 'active'),
(60, 1, '19:30', 2, 'active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbluser`
--

CREATE TABLE `tbluser` (
  `userId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `role` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbluser`
--

INSERT INTO `tbluser` (`userId`, `username`, `password`, `phonenumber`, `lastname`, `firstname`, `email`, `role`, `status`) VALUES
(1, 'larrytran', '123456', '0794485000', '0', 'long', 'longtran49@gmail', 'member', 'active'),
(2, 'linh', '123456', '0794485001', '0', 'thinh', 'longtran49@gmail', 'member', 'active'),
(6, 'hongkong2', '1', '0794485001', 'Quốc', 'Hùng', 'larrytran4949@gmail.com', 'member', 'active'),
(7, 'long', '12345', '0794485085', 'Nguyễn', 'Phi', 'longtran4949@gmail.com', 'member', 'active'),
(8, 'test1', '123456', '0183629172', 'Phi', 'Nguyễn Trường', 'starcomichos112@gmail.com', 'member', 'active');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tblappointment`
--
ALTER TABLE `tblappointment`
  ADD PRIMARY KEY (`appointmentId`);

--
-- Chỉ mục cho bảng `tblappointmentdetail`
--
ALTER TABLE `tblappointmentdetail`
  ADD PRIMARY KEY (`appointmentDetailId`);

--
-- Chỉ mục cho bảng `tblgoldtime`
--
ALTER TABLE `tblgoldtime`
  ADD PRIMARY KEY (`idGoldTime`);

--
-- Chỉ mục cho bảng `tblrating`
--
ALTER TABLE `tblrating`
  ADD PRIMARY KEY (`ratingId`);

--
-- Chỉ mục cho bảng `tblservice`
--
ALTER TABLE `tblservice`
  ADD PRIMARY KEY (`serviceId`);

--
-- Chỉ mục cho bảng `tblshop`
--
ALTER TABLE `tblshop`
  ADD PRIMARY KEY (`idShop`);

--
-- Chỉ mục cho bảng `tblshopaccount`
--
ALTER TABLE `tblshopaccount`
  ADD PRIMARY KEY (`userid`);

--
-- Chỉ mục cho bảng `tblslot`
--
ALTER TABLE `tblslot`
  ADD PRIMARY KEY (`slotId`);

--
-- Chỉ mục cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tblappointment`
--
ALTER TABLE `tblappointment`
  MODIFY `appointmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tblappointmentdetail`
--
ALTER TABLE `tblappointmentdetail`
  MODIFY `appointmentDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `tblgoldtime`
--
ALTER TABLE `tblgoldtime`
  MODIFY `idGoldTime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblrating`
--
ALTER TABLE `tblrating`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tblservice`
--
ALTER TABLE `tblservice`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `tblshop`
--
ALTER TABLE `tblshop`
  MODIFY `idShop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tblshopaccount`
--
ALTER TABLE `tblshopaccount`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tblslot`
--
ALTER TABLE `tblslot`
  MODIFY `slotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
