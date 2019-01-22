-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2017 at 01:28 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hoangtoanmobileshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `binhluansanpham`
--

CREATE TABLE `binhluansanpham` (
  `id_bl` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dien_thoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `binh_luan` text COLLATE utf8_unicode_ci NOT NULL,
  `ngay_gio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `binhluansanpham`
--

INSERT INTO `binhluansanpham` (`id_bl`, `id_sp`, `ten`, `dien_thoai`, `binh_luan`, `ngay_gio`) VALUES
(1, 1, 'Vietpro Education', '0968 511 155', 'Đây là dòng sản phẩm đáng chờ đợi nhất trong năm nay, với cấu hình mạnh và giá thành tương đối mềm so với các dòng Smart Phone của các hãng khác.', '2013-05-06 09:19:30'),
(2, 2, 'Vietpro Education', '0968 511 155', 'Đây là dòng sản phẩm đáng chờ đợi nhất trong năm nay, với cấu hình mạnh và giá thành tương đối mềm so với các dòng Smart Phone của các hãng khác.', '2013-05-06 09:19:30'),
(3, 29, 'Hoàng Văn Toàn', '0972803631', 'Sản Phẩm rất đẹp và bền', '2017-10-26 06:17:06'),
(4, 29, 'Hoàng Văn Toàn', '0972803631', 'Điện Thoại Rất Bền Và Giá Hợp Lý', '2017-10-26 06:34:27'),
(5, 29, 'Hoàng Văn Toàn', '0972803631', 'Sản Phẩm Tốt', '2017-10-26 06:41:35'),
(6, 29, 'Hoàng Văn Toàn', '0972803631', 'Sản Phẩm Đẹp', '2017-10-26 06:41:52'),
(7, 29, 'Hoàng Văn Toàn', '0972803631', 'Sản Phẩm Chất Lượng', '2017-10-26 06:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `danhmucsanpham`
--

CREATE TABLE `danhmucsanpham` (
  `id_dm` int(10) NOT NULL,
  `ten_dm` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danhmucsanpham`
--

INSERT INTO `danhmucsanpham` (`id_dm`, `ten_dm`) VALUES
(1, 'iPhone'),
(2, 'Samsung'),
(3, 'Sony'),
(4, 'LG'),
(5, 'HTC'),
(6, 'Nokia'),
(7, 'BlackBerry'),
(8, 'OPPO'),
(9, 'Asus');

-- --------------------------------------------------------

--
-- Table structure for table `quangcao`
--

CREATE TABLE `quangcao` (
  `id_qc` int(10) NOT NULL,
  `ten_qc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ten_doi_tac` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_doi_tac` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anh_qc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duyet_qc` int(1) NOT NULL,
  `xem_qc` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quangcao`
--

INSERT INTO `quangcao` (`id_qc`, `ten_qc`, `ten_doi_tac`, `link_doi_tac`, `anh_qc`, `duyet_qc`, `xem_qc`) VALUES
(1, 'Banner 01', 'TGDD', 'https://www.thegioididong.com/', 'banner01.png', 1, 1),
(2, 'Banner 02', 'TGDD', 'https://www.thegioididong.com/', 'banner01.png', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id_sp` int(10) UNSIGNED NOT NULL,
  `id_dm` int(10) UNSIGNED NOT NULL,
  `ten_sp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anh_sp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gia_sp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tinh_trang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trang_thai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bao_hanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phu_kien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `khuyen_mai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dac_biet` int(1) NOT NULL,
  `chi_tiet_sp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id_sp`, `id_dm`, `ten_sp`, `anh_sp`, `gia_sp`, `tinh_trang`, `trang_thai`, `bao_hanh`, `phu_kien`, `khuyen_mai`, `dac_biet`, `chi_tiet_sp`) VALUES
(0, 4, 'LG Optimus L7(LG P705)', 'LG-Optimus-L7LG P705.jpg', '8.600.000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(1, 1, 'IPhone 3GS 32G Màu Đen', 'IPhone-3GS-32G-Mau-Den.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, '<p><span style="color:#e67e22"><strong><img alt="" src="http://localhost:88/vietproshop/quantri/anh/images/iphone-6s-32gb-400x450-400x450.png" style="height:450px; width:400px" />Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</strong></span></p>\r\n'),
(2, 1, 'iPhone 4 16G Quốc Tế Màu Trắng', 'iPhone-4-16G-Quoc-Te-Trang.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(3, 1, 'iPhone 5 16GB Quốc Tế Màu Đen', 'iPhone-5-16GB-Quoc-Te-Den.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(4, 1, 'iPhone 5C 16GB Quốc Tế Màu Đen', 'iPhone-5C-16GB-Blue.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(5, 1, 'iPhone 5S 32GB Quốc Tế Màu Trắng', 'iPhone-5S-32GB-Quoc-te-Mau-Trang.jpg', '10000000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(12, 3, 'Sony Arc S (LT18i) Màu Trắng', 'Sony-arc-S-LT18i-Trang.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(13, 3, 'Sony Arc S', 'Sony-Arc-S.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(14, 3, 'Sony X10', 'sony-x10.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(15, 3, 'Sony Xperia TX Màu Đen', 'Sony-Xperia-TX-LT29i-Den.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(16, 3, 'Sony Xperia Z Màu Đen', 'Sony-Xperia-Z-Mau-Den.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(18, 4, 'LG LTE 3 (LG F260)', 'LG-LTE-3-LG F260.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(19, 4, 'LG Optimus 2X SU660', 'LG-optimus-2x-SU660.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(20, 4, 'LG Optimus 3D SU760', 'LG-Optimus-3D-SU760.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(21, 4, 'LG Optimus G', 'LG-Optimus-G.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, 'Tất Cả Các Sản Phẩm Điện Thoại Di Động Của HoangToan Mobile Shop Đều Là Các Sản Phẩm Chính Hãng, Đều Được Bảo Hành 12 Tháng Trên Toàn Quốc.'),
(23, 5, 'HTC EVO 3D', 'HTC-EVO-3D.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(24, 5, 'HTC One Đen 16GB FPT', 'HTC-One-Den-16GB-cong-ty-FPT.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(25, 5, 'HTC One Trắng 16GB FPT', 'HTC-One-Trang-16GB-cong-ty-FPT.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(26, 5, 'HTC One X 16GB Màu Trắng', 'htc-one-x-white.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 0, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(27, 5, 'HTC Windows X Phone 8S', 'HTC-Windows-Phone-8S.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(28, 6, 'Nokia-8800-Sirocco-Gold', 'Nokia-8800-Sirocco-Gold.jpg', '10000000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(29, 6, 'Lumia-800-Black', 'lumia-800-den.jpg', '10000000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(30, 7, 'BlackBerry-Curve-3G-9300', 'BlackBerry-Curve-3G-9300.jpg', '8600000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách Hướng Dẫn, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình Cường Lực Chống Xước', 1, '<p>Tất Cả C&aacute;c Sản Phẩm Điện Thoại Di Đ&ocirc;̣ng Của HoangToan Mobile Shop Đều L&agrave; C&aacute;c Sản Phẩm Ch&iacute;nh H&atilde;ng, Đ&ecirc;̀u Được Bảo H&agrave;nh 12 Th&aacute;ng Tr&ecirc;n To&agrave;n Quốc.</p>\r\n'),
(31, 8, 'Điện Thoại OPPO F3 Plus', 'oppo-f3-plus-1-1-400x460.png', '10690000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình 3 Lớp', 1, '<h2 style="font-style:normal; text-align:start">Sau sự th&agrave;nh c&ocirc;ng của F1 Plus, OPPO F3 Plus đang được người d&ugrave;ng quan t&acirc;m y&ecirc;u th&iacute;ch với cụm camera selfie k&eacute;p, c&ocirc;ng nghệ chụp thiếu s&aacute;ng đỉnh cao, cấu h&igrave;nh mạnh mẽ v&agrave; tất nhi&ecirc;n đ&oacute; l&agrave; thiết kế nguy&ecirc;n khối qu&aacute; ư l&agrave; sang trọng.</h2>\r\n'),
(32, 8, 'OPPO F3', 'oppo-f3-3-400x460-400x460.png', '6990000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe, Cây Lấy Sim', 'Dán Màn Hình 3 Lớp', 1, '<h2 style="font-style:normal">Cuối c&ugrave;ng th&igrave; mẫu &quot;chuy&ecirc;n gia selfie&quot; mới&nbsp;<a href="https://www.thegioididong.com/dtdd-oppo" style="margin: 0px; padding: 0px; text-decoration: none; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: 18px; font-family: Helvetica, Arial, ">OPPO</a>&nbsp;F3&nbsp;cũng đ&atilde; ch&iacute;nh thức được tr&igrave;nh l&agrave;ng với cụm camera trước k&eacute;p trang bị nhiều t&iacute;nh năng selfie tuyệt vời hứa hẹn sẽ đem đến trải nghiệm đ&aacute;ng gi&aacute; cho người d&ugrave;ng.</h2>\r\n'),
(33, 9, 'Asus Zenfone 4 Max Pro', 'asus-zenfone-4-max-pro-zc554kl-2-500x500.png', '4990000', 'Máy Mới 100%', 'Còn hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình 3 Lớp', 0, '<p><span style="color:#333333; font-family:Helvetica,Arial,">ZenFone 4 Max Pro sở hữu thiết kế kh&aacute; quen thuộc của Asus với c&aacute;c g&oacute;c cạnh được bo tr&ograve;n cho cảm gi&aacute;c thoải m&aacute;i khi cầm nắm, đặc biệt kh&ocirc;ng c&oacute; cảm gi&aacute;c trơn trượt khi cầm tay v&agrave; kh&ocirc;ng sợ d&iacute;nh dấu v&acirc;n tay.</span></p>\r\n\r\n<p><img alt="" src="http://localhost:88/vietproshop/quantri/anh/images/asus-zenfone-4-max-pro-zc554kl2.jpg" style="height:395px; width:640px" /></p>\r\n'),
(34, 9, 'Asus Zenfone Live ZB501KL', 'asus-zenfone-live-zb501kl-400-1-400x460.png', '2990000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình 3 Lớp', 0, '<p>Asus Zenfone Live k&iacute;ch thước 5 inch kh&aacute; nhỏ gọn. M&agrave;n h&igrave;nh được trang bị tấm nền IPS, độ ph&acirc;n giải HD c&ugrave;ng ph&iacute;m điều hướng đặt ở b&ecirc;n ngo&agrave;i.</p>\r\n\r\n<p>Ph&iacute;a tr&ecirc;n gồm camera selfie 5 MP g&oacute;c rộng l&ecirc;n đến 82 độ, khẩu độ F/2.2 k&egrave;m đ&egrave;n flash LED trợ s&aacute;ng. Tất nhi&ecirc;n phần mềm đi k&egrave;m t&iacute;nh năng Beauty Live gi&uacute;p bạn live stream với một gương mặt rạng rỡ v&agrave; ảo diệu hơn.</p>\r\n\r\n<p><img alt="" src="http://localhost:88/vietproshop/quantri/anh/images/img_0064_1280x720-800-resize.jpg" style="height:450px; width:800px" /></p>\r\n'),
(37, 2, 'Samsung Galaxy Note 8', 'samsung-galaxy-note8-1-400x460.png', '22490000', 'Máy Mới 100%', 'Còn hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe, Cây Lấy Sim', 'Dán Màn Hình 3 Lớp', 1, ''),
(38, 2, 'Samsung Galaxy S8 Plus', 'samsung-galaxy-s8-plus-tim-khoi-400-400x460.png', '20490000', 'Máy Mới 100%', 'Còn hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe', 'Dán Màn Hình 3 Lớp', 0, ''),
(39, 2, 'Samsung Galaxy S8', 'samsung-galaxy-s8-4-400x460-400x460.png', '18490000', 'Máy Mới 100%', 'Còn hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe, Cây Lấy Sim', 'Dán Màn Hình 3 Lớp', 1, ''),
(40, 2, 'Samsung Galaxy C9 Pro', 'samsung-galaxy-c9-pro-1-400x460.png', '11490000', 'Máy Mới 100%', 'Còn Hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe, Cây Lấy Sim', 'Dán Màn Hình 3 Lớp', 0, ''),
(41, 2, 'Samsung Galaxy A7 (2017)', 'samsung-galaxy-a7-2017-4-400x460.png', '9990000', 'Máy Mới 100%', 'Còn hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe, Cây Lấy Sim', 'Dán Màn Hình 3 Lớp', 0, ''),
(42, 2, 'Samsung Galaxy J7+', 'samsung-galaxy-j7-plus-1-400x460.png', '8690000', 'Máy Mới 100%', 'Còn hàng', '12 Tháng', 'Hộp, Sách, Sạc, Cáp, Tai Nghe, Cây Lấy Sim', 'Dán Màn Hình 3 Lớp', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `thanhvien`
--

CREATE TABLE `thanhvien` (
  `id_thanhvien` int(10) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mat_khau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quyen_truy_cap` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thanhvien`
--

INSERT INTO `thanhvien` (`id_thanhvien`, `email`, `mat_khau`, `quyen_truy_cap`) VALUES
(1, 'hoangvantoan.edu@gmail.com', 'HT241198hvt916', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binhluansanpham`
--
ALTER TABLE `binhluansanpham`
  ADD PRIMARY KEY (`id_bl`);

--
-- Indexes for table `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  ADD PRIMARY KEY (`id_dm`);

--
-- Indexes for table `quangcao`
--
ALTER TABLE `quangcao`
  ADD PRIMARY KEY (`id_qc`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_sp`);

--
-- Indexes for table `thanhvien`
--
ALTER TABLE `thanhvien`
  ADD PRIMARY KEY (`id_thanhvien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binhluansanpham`
--
ALTER TABLE `binhluansanpham`
  MODIFY `id_bl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  MODIFY `id_dm` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `quangcao`
--
ALTER TABLE `quangcao`
  MODIFY `id_qc` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_sp` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `thanhvien`
--
ALTER TABLE `thanhvien`
  MODIFY `id_thanhvien` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
