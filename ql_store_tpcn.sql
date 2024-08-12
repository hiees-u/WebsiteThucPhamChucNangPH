-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 09:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ql_store_tpcn`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `email`, `password`, `admin_name`) VALUES
(1, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'Mẫn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(2, 'Thuốc'),
(3, 'Chăm sóc cá nhân'),
(4, 'Mẹ và bé'),
(16, 'Thực phẩm chức năng');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_donhang`
--

CREATE TABLE `tbl_donhang` (
  `donhang_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `mahang` varchar(50) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `tinhtrang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_donhang`
--

INSERT INTO `tbl_donhang` (`donhang_id`, `sanpham_id`, `soluong`, `mahang`, `khachhang_id`, `tinhtrang`) VALUES
(17, 4, 1, '4107', 11, 1),
(18, 3, 1, '4107', 0, 1),
(19, 8, 2, '4107', 0, 1),
(20, 4, 2, '1931', 12, 0),
(21, 8, 2, '1931', 12, 0),
(25, 5, 1, '3893', 14, 0),
(26, 2, 1, '5055', 15, 0),
(27, 1, 1, '8301', 16, 0),
(28, 5, 2, '3340', 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_giaodich`
--

CREATE TABLE `tbl_giaodich` (
  `giaodich_id` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `magiaodich` varchar(50) NOT NULL,
  `ngaythang` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `khachhang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_giaodich`
--

INSERT INTO `tbl_giaodich` (`giaodich_id`, `sanpham_id`, `soluong`, `magiaodich`, `ngaythang`, `khachhang_id`) VALUES
(2, 1, 1, '8301', '2024-04-18 19:11:11', 16),
(3, 5, 2, '3340', '2024-04-19 13:40:00', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_giohang`
--

CREATE TABLE `tbl_giohang` (
  `giohang_id` int(11) NOT NULL,
  `tensanpham` varchar(100) NOT NULL,
  `giasanpham` varchar(50) NOT NULL,
  `hinhanh` varchar(50) NOT NULL,
  `soluong` int(11) NOT NULL,
  `sanpham_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_giohang`
--

INSERT INTO `tbl_giohang` (`giohang_id`, `tensanpham`, `giasanpham`, `hinhanh`, `soluong`, `sanpham_id`) VALUES
(29, 'Bột PROANTIOBIOPLUS hỗ trợ làm giảm các triệu chứng rối loạn tiêu hóa', '500000', 'thucphamchucnang1.webp', 1, 8),
(30, 'Biovagen Welkids Multivitamin ADKE bổ sung vitamin A, D3, K2, E cho trẻ (Chai 10ml)', '385000', 'mevabe.jpg', 3, 3),
(31, 'Bột pha uống Enzymax Kids bổ sung đa dạng men tiêu hóa giúp bé tăng cường hấp thu dinh dưỡng (Hộp 30', '360000', 'mevabe1.jpg', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_khachhang`
--

CREATE TABLE `tbl_khachhang` (
  `khachhang_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL,
  `giaohang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_khachhang`
--

INSERT INTO `tbl_khachhang` (`khachhang_id`, `name`, `phone`, `address`, `email`, `password`, `giaohang`) VALUES
(11, 'Mẫn', '1234567', '434', 'man@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(12, 'Đinh Minh Mẫn', '0989030153', 'go vấp', 'minhman6802@gmail.com', '', 1),
(13, 'son', '1234567', '555', 'son@gmail.com', '123456', 0),
(14, 'aaa', '1234567', '555', 'aaa@gmail.com', '', 1),
(15, 'bbb', '1234567', '434', 'bbb@gmail.com', '', 0),
(16, 'bbbbbbbb', '1234567', '434', 'bbbbbbb@gmail.com', '', 0),
(17, 'songuyen', '123456', 'aaaa', 'sonn@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(18, 'hoa', '1234567', '434', '', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sanpham`
--

CREATE TABLE `tbl_sanpham` (
  `sanpham_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sanpham_name` varchar(255) NOT NULL,
  `sanpham_chitiet` text NOT NULL,
  `sanpham_mota` text NOT NULL,
  `sanpham_gia` varchar(100) NOT NULL,
  `sanpham_giakhuyenmai` varchar(100) NOT NULL,
  `sanpham_active` int(11) NOT NULL,
  `sanpham_hot` int(11) NOT NULL,
  `sanpham_soluong` int(11) NOT NULL,
  `sanpham_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sanpham`
--

INSERT INTO `tbl_sanpham` (`sanpham_id`, `category_id`, `sanpham_name`, `sanpham_chitiet`, `sanpham_mota`, `sanpham_gia`, `sanpham_giakhuyenmai`, `sanpham_active`, `sanpham_hot`, `sanpham_soluong`, `sanpham_image`) VALUES
(1, 2, 'Bột dùng ngoài Gynapax 5g vệ sinh và tẩy trùng niêm mạc phụ khoa (hộp 30 gói)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '50000', '28000', 1, 0, 10, 'Thuoc.webp'),
(2, 2, 'Bột pha uống Acehasan 200mg tiêu chất nhầy trong bệnh nhầy nhớt (30 gói x 3g)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '30000', '28000', 1, 1, 10, 'Thuoc1.jpg'),
(3, 4, 'Biovagen Welkids Multivitamin ADKE bổ sung vitamin A, D3, K2, E cho trẻ (Chai 10ml)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '385000', '350000', 1, 1, 10, 'mevabe.jpg'),
(4, 4, 'Bột pha uống Enzymax Kids bổ sung đa dạng men tiêu hóa giúp bé tăng cường hấp thu dinh dưỡng (Hộp 30 gói)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '360000', '340000', 1, 0, 10, 'mevabe1.jpg'),
(5, 3, 'Bàn chải kẽ răng Okamura Asahi chữ L AS_LDXD6P (Túi 6 cái)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '40000', '30000', 1, 1, 10, 'chamsoccanhan.webp'),
(6, 3, 'Dầu gội Sunsilk óng mượt rạng ngời (320g)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '100000', '90000', 1, 1, 10, 'chamsoccanhan1.webp'),
(7, 1, 'Bột LADOPHAR LADO CARE MARS hỗ trợ bổ thận, tráng dương và cải thiện sinh lý nam giới (Hộp 10 gói)', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '500000', '485000', 1, 0, 10, 'thucphamchucnang.jpg'),
(8, 1, 'Bột PROANTIOBIOPLUS hỗ trợ làm giảm các triệu chứng rối loạn tiêu hóa', 'Danh mục  Thuốc không kê đơn Hoạt chất  Acid boric; Phèn chua; Thymol; Phenol; Menthol; Berberin clorid; Methyl salicylat Chỉ định  Vệ sinh và tẩy trùng niêm mạc phụ khoa Dạng bào chế  Bột dùng ngoài Nơi sản xuất  Vidipha Quy cách  Hộp 30 gói Lưu ý  Mọi thông tin trên đây chỉ mang tính chất tham khảo. Vui lòng đọc kĩ thông tin chi tiết ở tờ hướng dẫn sử dẫn của sản phẩm.', '', '500000', '490000', 1, 1, 10, 'thucphamchucnang1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `slider_id` int(11) NOT NULL,
  `slider_image` varchar(100) NOT NULL,
  `slider_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`slider_id`, `slider_image`, `slider_active`) VALUES
(1, 'slide1.png', 1),
(2, 'slide2.webp', 0),
(3, 'slide3.png', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  ADD PRIMARY KEY (`donhang_id`);

--
-- Indexes for table `tbl_giaodich`
--
ALTER TABLE `tbl_giaodich`
  ADD PRIMARY KEY (`giaodich_id`);

--
-- Indexes for table `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  ADD PRIMARY KEY (`giohang_id`);

--
-- Indexes for table `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  ADD PRIMARY KEY (`khachhang_id`);

--
-- Indexes for table `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD PRIMARY KEY (`sanpham_id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_donhang`
--
ALTER TABLE `tbl_donhang`
  MODIFY `donhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_giaodich`
--
ALTER TABLE `tbl_giaodich`
  MODIFY `giaodich_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  MODIFY `giohang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_khachhang`
--
ALTER TABLE `tbl_khachhang`
  MODIFY `khachhang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  MODIFY `sanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
