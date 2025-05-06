-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 03:51 PM
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
-- Database: `tiem_sach`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `name` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `birthdate` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `isStudent` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `phone`, `email`, `birthdate`, `password`, `isStudent`) VALUES
('1234', '1234', '1234@gmail.com', '2025-05-23', '$2y$10$/lJD1/e3UzgHeOcU4FU7Re9KfgOV2x8T5e4LalYxm.iiWXEwlF2mK', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `accountadmin`
--

CREATE TABLE `accountadmin` (
  `name` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `birthdate` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accountadmin`
--

INSERT INTO `accountadmin` (`name`, `phone`, `email`, `birthdate`, `password`) VALUES
('1234', '1234', 'hoangbao270904@gmail.com', '2025-05-13', '$2y$10$UrWILHE5W/LNNdXYglhtCO.i/BZFtaJ/QycbYCiVMtpZPRQe7FU3m');

-- --------------------------------------------------------

--
-- Table structure for table `don_dat_hang`
--

CREATE TABLE `don_dat_hang` (
  `id` int(11) NOT NULL,
  `ho_va_ten` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `dia_chi` varchar(500) NOT NULL,
  `thanh_pho` varchar(500) NOT NULL,
  `huyen` varchar(500) NOT NULL,
  `xa` varchar(500) NOT NULL,
  `total` varchar(500) NOT NULL,
  `book` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `don_dat_hang`
--

INSERT INTO `don_dat_hang` (`id`, `ho_va_ten`, `email`, `phone`, `dia_chi`, `thanh_pho`, `huyen`, `xa`, `total`, `book`, `status`) VALUES
(1, '1234', '1234@gmail.com', '1234', '1234', 'Tỉnh Hưng Yên', 'Huyện Yên Mỹ', 'Xã Yên Phú', '349700', '{id: 177(số lượng: 1),id: 178(số lượng: 1),id: 172(số lượng: 1),id: 176(số lượng: 1),id: 176(số lượng: 1),id: 173(số lượng: 1)}', 'Đã giao'),
(2, '123', '123', '123', '123', 'Tỉnh Vĩnh Phúc', 'Thành phố Phúc Yên', 'Phường Phúc Thắng', '44990000', '{id: 123(số lượng: 1)}', 'Đã hủy'),
(3, '123', '123', '123', '123', 'Tỉnh Vĩnh Phúc', 'Thành phố Phúc Yên', 'Phường Phúc Thắng', '44990000', '{id: 123(số lượng: 1)}', 'Đang giao');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`, `phone`) VALUES
(10, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương yêu nước', '20000', '18000', '10', 'truyện lẻ', 'Phạm Văn Hòa ', 'Thiếu niên (11 – 15)', '13x19 cm', '76', '95', 'tat_ca_san_pham', 'Active', '1234'),
(173, 'Dược sư tự sự (Manga) - Tập 13', '127000', '63500', '50', '13', 'Natsu Hyuuga, Touco Shino, Itsuki Nanao, Nekokurage', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '180', '200', 'tat_ca_san_pham', 'Active', '1234'),
(175, 'Cách yêu thương - Cẩm nang về tâm tình và mối quan hệ cho mọi người', '112000', '89600', '20', 'truyện lẻ', 'Alex Norris', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '224', '310', 'tat_ca_san_pham', 'Active', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `kien_thuc_khoa_hoc`
--

CREATE TABLE `kien_thuc_khoa_hoc` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kien_thuc_khoa_hoc`
--

INSERT INTO `kien_thuc_khoa_hoc` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`) VALUES
(98, 'Theo bước thời gian - Các công trình tiêu biểu của Sài Gòn - Thành phố Hồ Chí Minh', '180000', '144000', '20', 'truyện lẻ', 'Võ Thị Mai Chi, Hồ Quốc Cường', 'Mọi lứa tuổi', '25x25 cm', '84', '900', 'Kien_thuc_khoa_hoc', 'Active'),
(99, 'Giải mã danh tác - Cẩm nang phân tích tác phẩm nghệ thuật dành cho trẻ em', '235000', '188000', '20', 'truyện lẻ', 'Ingrid Swenson, Mary Auld', 'Thiếu niên (11-15 tuổi)', '24.5x30.5 cm', '128', '950', 'Kien_thuc_khoa_hoc', 'Active'),
(100, 'Kĩ năng vàng cho học sinh trung học - Học tập tối giản', '55000', '44000', '20', 'truyện lẻ', 'Liao Heng', 'Thiếu niên (11 – 15)', '14,5x20,5 cm', '212', '245', 'Kien_thuc_khoa_hoc', 'Active'),
(101, 'Kĩ năng xã hội cho học sinh tiểu học - Ứng xử ngoài xã hội', '86000', '77400', '10', 'truyện lẻ', 'Trung tâm nghiên cứu tâm lí trẻ em', 'Nhi đồng (6 – 11) ', '17x24 cm', '156', '280', 'Kien_thuc_khoa_hoc', 'Active'),
(102, '15 bí kíp giúp tớ an toàn - Cẩm nang phòng tránh đuối nước', '45000', '36000', '20', 'truyện lẻ', 'Ths. Bs. Nguyễn Trọng An', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '72', '140', 'Kien_thuc_khoa_hoc', 'Active'),
(103, 'Truyện xưa bất tận - Đông phương bách quái - Tập 2', '260000', '234000', '10', '2', 'Trương Vân, Miêu Cửu', 'Thiếu niên (11 – 15)', '17x24 cm', '328', '575', 'Kien_thuc_khoa_hoc', 'Active'),
(104, 'Truyện xưa bất tận - Đông phương bách quái - Tập 1', '260000', '234000', '10', '1', 'Trương Vân, Miêu Cửu', 'Thiếu niên (11 – 15)', '17x24 cm', '324', '570', 'Kien_thuc_khoa_hoc', 'Active'),
(105, 'Cẩm nang sinh hoạt bằng tranh cho bé - Tập 1 - Kĩ năng trong sinh hoạt thường ngày', '36000', '32400', '10', '1', 'Hội nghiên cứu khoa học đời sống trẻ em Nhật Bản', 'Nhà trẻ - mẫu giáo (0 - 6)', '18x23 cm', '48', '130', 'Kien_thuc_khoa_hoc', 'Active'),
(106, 'Quiz! Khoa học kì thú - Sa mạc Rừng rậm', '75000', '60000', '20', 'truyện lẻ', 'Oh Soo-jin, Ha Jong-joon', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(107, 'Rối loạn lưỡng cực - hành trình dài chung sống - Trò chuyện về sức khoẻ tâm thần - Từ chẩn đoán đến cuộc sống hằng ngày', '80000', '72000', '10', 'truyện lẻ', 'Fabrice Saulière, Nicolas Franck, Céline Renouard', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi), Phụ huynh', '14,5x20,5 cm', '152', '210', 'Kien_thuc_khoa_hoc', 'Active'),
(108, 'Lo âu ơi, tạm biệt! - Trò chuyện về sức khoẻ tâm thần - Chứng rối loạn lo âu', '80000', '72000', '10', 'truyện lẻ', 'Marco Coiffard, Mélanie Villette', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi), Phụ huynh', '14,5x20,5 cm', '160', '220', 'Kien_thuc_khoa_hoc', 'Active'),
(109, '160', '85000', '68000', '20', 'truyện lẻ', 'Li-Jung Yang, Yu-Shi Wu, Water Brain, Taiwan Happiness Village Emotion Education Association', 'Education Association', '14.5x20.5 cm', '224', '224', 'Kien_thuc_khoa_hoc', 'Active'),
(110, 'Kĩ năng vàng cho teen thế kỉ 21 – Bí kíp giao tiếp xã hội', '60000', '54000', '10', 'truyện lẻ', 'Han Nana, Toonjaengi ', 'Nhi đồng (6 – 11)', '14.5x20.5 cm', '184', '185', 'Kien_thuc_khoa_hoc', 'Active'),
(111, 'WHO? Chuyện kể về danh nhân thế giới - Nikola Tesla', '60000', '54000', '10', 'truyện lẻ', 'Kim Seung-Min, Choi Byeong-Guk', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '184', '200', 'Kien_thuc_khoa_hoc', 'Active'),
(112, 'WHO? Chuyện kể về danh nhân thế giới - Lionel Messi', '65000', '52000', '20', 'truyện lẻ', 'Choi Jaehun, Toonjaengi  ', 'Nhi đồng (6 – 11)', '14.5x20.5 cm', '160', '185', 'Kien_thuc_khoa_hoc', 'Active'),
(113, 'Quiz! Khoa học kì thú - Dậy thì Giới tính', '75000', '60000', '20', 'truyện lẻ', 'Park Kyung-eun', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(114, 'Vòng quanh thế giới - Lào', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Tuấn Huỳnh', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'Kien_thuc_khoa_hoc', 'Active'),
(115, 'Vòng quanh thế giới - Bồ Đào Nha', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'Kien_thuc_khoa_hoc', 'Active'),
(116, 'Vòng quanh thế giới - Bhutan', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'Kien_thuc_khoa_hoc', 'Active'),
(117, 'Vòng quanh thế giới - Argentina', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'Kien_thuc_khoa_hoc', 'Active'),
(118, 'Vòng quanh thế giới - Đài Loan', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'Kien_thuc_khoa_hoc', 'Active'),
(119, 'Câu chuyện âm nhạc - Lịch sử âm nhạc dành cho trẻ em', '185000', '148000', '20', 'truyện lẻ', 'Mick Manning, Brita Granström', 'Thiếu niên (11 – 15), Tuổi mới lớn (15 – 18)', '24,5x30,5 cm', '88', '755', 'Kien_thuc_khoa_hoc', 'Active'),
(120, 'Quiz! Khoa học kì thú - Sơ cấp cứu', '75000', '60000', '20', 'truyện lẻ', 'Shin Hye-young', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(121, 'Quiz! Khoa học kì thú - Thực phẩm Dinh dưỡng', '75000', '60000', '20', 'An Guang-hyun', 'An Guang-hyun', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(122, 'Quiz! Khoa học kì thú - Khám phá Trái Đất', '75000', '60000', '20', 'truyện lẻ', 'Ha Jong-joon, Oh Soo-jin', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(123, 'Quiz! Khoa học kì thú - Những cái nhất và đầu tiên trên thế giới', '75000', '60000', '20', 'truyện lẻ', 'Cha Hyun Jin', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(124, 'Quiz! Khoa học kì thú - Thế giới huyền bí', '75000', '60000', '20', 'truyện lẻ', 'An Guang-hyun', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(125, 'Quiz! Khoa học kì thú - Côn trùng', '75000', '60000', '20', 'truyện lẻ', 'Kim Hyun Min', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(126, 'Quiz! Khoa học kì thú - Thời tiết Môi trường', '75000', '60000', '20', 'truyện lẻ', 'Choi Dong-yin, Kwon Chan Ho', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '184', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(127, 'Quiz! Khoa học kì thú - Động vật', '75000', '60000', '20', 'truyện lẻ', 'Do Ki-sung', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '260', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(128, 'Quiz! Khoa học kì thú - Phát minh Phát kiến', '75000', '60000', '20', 'truyện lẻ', 'Do Ki-sung', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'Kien_thuc_khoa_hoc', 'Active'),
(129, 'Quiz! Khoa học kì thú - Các nhà khoa học thiên tài', '75000', '60000', '20', 'truyện lẻ', 'Joo Seong-yoon', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '152', '260', 'Kien_thuc_khoa_hoc', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `lich_su_truyen_thong`
--

CREATE TABLE `lich_su_truyen_thong` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lich_su_truyen_thong`
--

INSERT INTO `lich_su_truyen_thong` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`) VALUES
(1, 'Đội Việt Nam tuyên truyền giải phóng quân', '65000', '52000', '20', 'truyện lẻ', 'Nguyễn Mạnh Hà', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '252', '290', 'Lich_su_truyen_thong', 'Active'),
(2, 'Những anh hùng trẻ tuổi - Kim Đồng', '30000', '27000', '10', 'truyện lẻ', 'Tô Hoài', 'Nhi đồng (6 – 11), Thiếu niên (11-15 tuổi)', '13x19 cm', '128', '125', 'Lich_su_truyen_thong', 'Active'),
(3, 'Lược sử nước Việt bằng tranh', '140000', '112000', '20', 'truyện lẻ', 'Tạ Huy Long, Dương Trung Quốc, Hiếu Minh, Huyền Trang', 'Nhi đồng (6 – 11)', '30x18 cm', '96', '370', 'Lich_su_truyen_thong', 'Active'),
(4, 'Lá cờ chuẩn đỏ thắm', '40000', '32000', '20', 'truyện lẻ', 'Hồ Phương', 'Thiếu niên (11 – 15), Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '152', '185', 'Lich_su_truyen_thong', 'Active'),
(5, 'Chuyện ở đồi A1', '40000', '36000', '10', 'truyện lẻ', 'Nguyễn Tân', 'Thiếu niên (11 – 15), Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '144', '175', 'Lich_su_truyen_thong', 'Active'),
(6, 'Kể chuyện Điện Biên Phủ', '60000', '54000', '10', 'truyện lẻ', 'Hữu Mai. Nguyễn Thế Phương', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '19x26 cm', '52', '230', 'Lich_su_truyen_thong', 'Active'),
(7, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương đoàn kết', '30000', '27000', '10', 'truyện lẻ', 'Phạm Văn Hòa ', 'Thiếu niên (11 – 15)', '13x19 cm', '120', '140', 'Lich_su_truyen_thong', 'Active'),
(8, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương giản dị', '28000', '22400', '20', 'truyện lẻ', 'Tạ Văn Sang', 'Thiếu niên (11 – 15)', '13x19 cm', '108', '130', 'Lich_su_truyen_thong', 'Active'),
(9, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương khiêm tốn', '22000', '19800', '10', 'truyện lẻ', 'Bùi Văn Như ', 'Thiếu niên (11 – 15)', '13x19 cm', '76', '95', 'Lich_su_truyen_thong', 'Active'),
(10, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương yêu nước', '20000', '18000', '10', 'truyện lẻ', 'Phạm Văn Hòa ', 'Thiếu niên (11 – 15)', '13x19 cm', '76', '95', 'Lich_su_truyen_thong', 'Active'),
(11, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương tiết kiệm', '25000', '20000', '20', 'truyện lẻ', 'Tạ Văn Sang', 'Thiếu niên (11 – 15)', '13x19 cm', '120', '165', 'Lich_su_truyen_thong', 'Active'),
(12, 'Thư kí Bác Hồ kể chuyện', '50000', '45000', '10', 'truyện lẻ', 'Vũ Kỳ', 'Thiếu niên (11 – 15)', '13x19 cm', '208', '200', 'Lich_su_truyen_thong', 'Active'),
(13, 'Thầy giáo Nguyễn Tất Thành ở trường Dục Thanh', '30000', '27000', '10', 'truyện lẻ', 'Sơn Tùng', 'Thiếu niên (11 – 15)', '13x19 cm', '100', '105', 'Lich_su_truyen_thong', 'Active'),
(14, 'Bác Hồ viết Di chúc và Di chúc của Bác Hồ', '55000', '44000', '20', 'truyện lẻ', 'Vũ Kỳ, Thế Kỷ', 'Tuổi mới lớn (15 – 18)', '18.5x18.5 cm', '160', '245', 'Lich_su_truyen_thong', 'Active'),
(15, 'Ngàn năm sử Việt - Nhà Nguyễn - Chiến tướng Tôn Thất Thuyết', '60000', '54000', '10', 'truyện lẻ', 'Lê Minh Quốc', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '228', '245', 'Lich_su_truyen_thong', 'Active'),
(16, 'Ngàn năm sử Việt - Nhà Lê Trung Hưng - Quận He khởi nghĩa', '80000', '64000', '20', 'truyện lẻ', 'Hà Ân', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '340', '355', 'Lich_su_truyen_thong', 'Active'),
(17, 'Búp sen xanh', '72000', '64800', '10', '', 'Sơn Tùng', 'Thiếu niên (11 – 15)', '12.5x20.5 cm', '364', '360', 'Lich_su_truyen_thong', 'Active'),
(18, 'Nguyên phi Ỷ Lan', '120000', '108000', '10', 'truyện lẻ', 'Quỳnh Cư', 'Thiếu niên (11 – 15)', '13x19 cm', '216', '215', 'Lich_su_truyen_thong', 'Active'),
(19, 'Những anh hùng trẻ tuổi - Nguyễn Bá Ngọc', '35000', '28000', '20', 'truyện lẻ', 'Hiếu Minh, Lê Minh Hải', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '19x26 cm', '24', '120', 'Lich_su_truyen_thong', 'Active'),
(20, 'Chị Út Tịch', '35000', '28000', '20', 'truyện lẻ', 'Vương Trọng, Lê Minh Hải ', 'Nhi đồng (6-11 tuổi)', '19x26 cm', '24', '120', 'Lich_su_truyen_thong', 'Active'),
(21, 'Thư Tết của Bác Hồ', '40000', '36000', '10', 'truyện lẻ', 'Hồ Chí Minh, Lê Minh Hải', 'Nhi đồng (6-11 tuổi)', '14,5x20,5 cm', '92', '155', 'Lich_su_truyen_thong', 'Active'),
(22, 'Thư Bác Hồ gửi thiếu nhi', '40000', '36000', '10', 'truyện lẻ', 'Hồ Chí Minh, Lê Minh Hải', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '88', '145', 'Lich_su_truyen_thong', 'Active'),
(23, 'Những ngày sống gần Bác', '35000', '28000', '20', 'truyện lẻ', 'Nông Thị Trưng, Phùng Lê, Hoàng Hải', 'Tuổi mới lớn (15 – 18)', '13x19 cm', '120', '125', 'Lich_su_truyen_thong', 'Active'),
(24, 'Những anh hùng trẻ tuổi - Chuyện kể về năm đội viên đầu tiên', '50000', '45000', '10', 'truyện lẻ', 'Hoài Lộc, Bùi Việt Thanh', 'Nhi đồng (6 – 11)', '19x26 cm', '36', '170', 'Lich_su_truyen_thong', 'Active'),
(25, 'Ngàn năm sử Việt – Thời Bắc thuộc – Tiếng trống Mê Linh', '40000', '36000', '10', 'truyện lẻ', 'An Cương', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '124', '140', 'Lich_su_truyen_thong', 'Active'),
(26, 'Ngàn năm sử Việt – Thời Bắc thuộc – Giao Châu tụ nghĩa', '50000', '45000', '10', 'truyện lẻ', 'Vũ Ngọc Tiến', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '192', '210', 'Lich_su_truyen_thong', 'Active'),
(27, 'Ngàn năm sử Việt – Thời Bắc thuộc – Vua Đen', '80000', '72000', '10', 'truyện lẻ', 'Hoàng Công Khanh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '320', '335', 'Lich_su_truyen_thong', 'Active'),
(28, 'Ngàn năm sử Việt – Nhà Nguyễn – Nguyễn Trường Tộ - Nhà tư tưởng cách tân', '75000', '60000', '20', 'truyện lẻ', 'Hoàng Thanh Đạm', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '308', '325', 'Lich_su_truyen_thong', 'Active'),
(29, 'Ngàn năm sử Việt – Nhà Nguyễn – Người đào kênh Vĩnh Tế', '40000', '36000', '10', 'truyện lẻ', 'Phan Khánh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '144', '165', 'Lich_su_truyen_thong', 'Active'),
(30, 'Ngàn năm sử Việt – Nhà Nguyễn – Đất mặn đất ngọt', '50000', '45000', '10', 'truyện lẻ', 'Nghiêm Đa Văn', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '180', '200', 'Lich_su_truyen_thong', 'Active'),
(31, 'Ngàn năm sử Việt – Nhà Lê Trung Hưng – Quân sư Đào Duy Từ', '70000', '63000', '10', 'truyện lẻ', 'Vũ Ngọc Tiến', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '272', '295', 'Lich_su_truyen_thong', 'Active'),
(32, 'Ngàn năm sử Việt – Nhà Nguyễn – Bùi Hữu Nghĩa – Mối duyên vàng đá', '70000', '63000', '10', 'truyện lẻ', 'Hoài Anh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '260', '280', 'Lich_su_truyen_thong', 'Active'),
(33, 'Ngàn năm sử Việt – Nhà Nguyễn – Bùi Viện một tấm lòng', '30000', '27000', '10', 'truyện lẻ', 'Phan Trần Chúc', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '96', '120', 'Lich_su_truyen_thong', 'Active'),
(34, 'Ngàn năm sử Việt - Thời Bắc thuộc - Nữ tướng thời Trưng Vương', '75000', '60000', '20', 'truyện lẻ', 'Nguyễn Khắc Xương', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '304', '325', 'Lich_su_truyen_thong', 'Active'),
(35, 'Lược sử nước Việt bằng tranh - Viet Nam – A Brief History in Pictures', '196000', '156800', '20', 'truyện lẻ', ' Tạ Huy Long, Dương Trung Quốc, Hiếu Minh, Huyền Trang', 'Nhi đồng (6 – 11)', '30x24 cm', '96', '775', 'Lich_su_truyen_thong', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL,
  `so_luong` int(255) NOT NULL,
  `phone` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`, `so_luong`, `phone`) VALUES
(175, 'Cách yêu thương - Cẩm nang về tâm tình và mối quan hệ cho mọi người', '112000', '89600', '20', 'truyện lẻ', 'Alex Norris', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '224', '310', 'tat_ca_san_pham', 'Active', 1, '1234'),
(177, 'Kujima hót, cả nhà véo von - Tập 4 (Tặng Lót Ly)', '40000', '32000', '20', '4', 'Akira Konno', 'Tuổi mới lớn (15 – 18),  Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', 1, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tat_ca_san_pham`
--

CREATE TABLE `tat_ca_san_pham` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL,
  `from` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tat_ca_san_pham`
--

INSERT INTO `tat_ca_san_pham` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`, `from`) VALUES
(1, 'Đội Việt Nam tuyên truyền giải phóng quân', '65000', '52000', '20', 'truyện lẻ', 'Nguyễn Mạnh Hà', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '252', '290', 'tat_ca_san_pham', 'Active', ''),
(2, 'Những anh hùng trẻ tuổi - Kim Đồng', '30000', '27000', '10', 'truyện lẻ', 'Tô Hoài', 'Nhi đồng (6 – 11), Thiếu niên (11-15 tuổi)', '13x19 cm', '128', '125', 'tat_ca_san_pham', 'Active', ''),
(3, 'Lược sử nước Việt bằng tranh', '140000', '112000', '20', 'truyện lẻ', 'Tạ Huy Long, Dương Trung Quốc, Hiếu Minh, Huyền Trang', 'Nhi đồng (6 – 11)', '30x18 cm', '96', '370', 'tat_ca_san_pham', 'Active', ''),
(4, 'Lá cờ chuẩn đỏ thắm', '40000', '32000', '20', 'truyện lẻ', 'Hồ Phương', 'Thiếu niên (11 – 15), Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '152', '185', 'tat_ca_san_pham', 'Active', ''),
(5, 'Chuyện ở đồi A1', '40000', '36000', '10', 'truyện lẻ', 'Nguyễn Tân', 'Thiếu niên (11 – 15), Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '144', '175', 'tat_ca_san_pham', 'Active', ''),
(6, 'Kể chuyện Điện Biên Phủ', '60000', '54000', '10', 'truyện lẻ', 'Hữu Mai. Nguyễn Thế Phương', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '19x26 cm', '52', '230', 'tat_ca_san_pham', 'Active', ''),
(7, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương đoàn kết', '30000', '27000', '10', 'truyện lẻ', 'Phạm Văn Hòa ', 'Thiếu niên (11 – 15)', '13x19 cm', '120', '140', 'tat_ca_san_pham', 'Active', ''),
(8, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương giản dị', '28000', '22400', '20', 'truyện lẻ', 'Tạ Văn Sang', 'Thiếu niên (11 – 15)', '13x19 cm', '108', '130', 'tat_ca_san_pham', 'Active', ''),
(9, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương khiêm tốn', '22000', '19800', '10', 'truyện lẻ', 'Bùi Văn Như ', 'Thiếu niên (11 – 15)', '13x19 cm', '76', '95', 'tat_ca_san_pham', 'Active', ''),
(10, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương yêu nước', '20000', '18000', '10', 'truyện lẻ', 'Phạm Văn Hòa ', 'Thiếu niên (11 – 15)', '13x19 cm', '76', '95', 'tat_ca_san_pham', 'Active', ''),
(11, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương tiết kiệm', '25000', '20000', '20', 'truyện lẻ', 'Tạ Văn Sang', 'Thiếu niên (11 – 15)', '13x19 cm', '120', '165', 'tat_ca_san_pham', 'Active', ''),
(12, 'Thư kí Bác Hồ kể chuyện', '50000', '45000', '10', 'truyện lẻ', 'Vũ Kỳ', 'Thiếu niên (11 – 15)', '13x19 cm', '208', '200', 'tat_ca_san_pham', 'Active', ''),
(13, 'Thầy giáo Nguyễn Tất Thành ở trường Dục Thanh', '30000', '27000', '10', 'truyện lẻ', 'Sơn Tùng', 'Thiếu niên (11 – 15)', '13x19 cm', '100', '105', 'tat_ca_san_pham', 'Active', ''),
(14, 'Bác Hồ viết Di chúc và Di chúc của Bác Hồ', '55000', '44000', '20', 'truyện lẻ', 'Vũ Kỳ, Thế Kỷ', 'Tuổi mới lớn (15 – 18)', '18.5x18.5 cm', '160', '245', 'tat_ca_san_pham', 'Active', ''),
(15, 'Ngàn năm sử Việt - Nhà Nguyễn - Chiến tướng Tôn Thất Thuyết', '60000', '54000', '10', 'truyện lẻ', 'Lê Minh Quốc', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '228', '245', 'tat_ca_san_pham', 'Active', ''),
(16, 'Ngàn năm sử Việt - Nhà Lê Trung Hưng - Quận He khởi nghĩa', '80000', '64000', '20', 'truyện lẻ', 'Hà Ân', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '340', '355', 'tat_ca_san_pham', 'Active', ''),
(17, 'Búp sen xanh', '72000', '64800', '10', 'truyện lẻ', 'Sơn Tùng', 'Thiếu niên (11 – 15)', '12.5x20.5 cm', '364', '360', 'tat_ca_san_pham', 'Active', ''),
(18, 'Nguyên phi Ỷ Lan', '120000', '108000', '10', 'truyện lẻ', 'Quỳnh Cư', 'Thiếu niên (11 – 15)', '13x19 cm', '216', '215', 'tat_ca_san_pham', 'Active', ''),
(19, 'Những anh hùng trẻ tuổi - Nguyễn Bá Ngọc', '35000', '28000', '20', 'truyện lẻ', 'Hiếu Minh, Lê Minh Hải', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '19x26 cm', '24', '120', 'tat_ca_san_pham', 'Active', ''),
(20, 'Chị Út Tịch', '35000', '28000', '20', 'truyện lẻ', 'Vương Trọng, Lê Minh Hải ', 'Nhi đồng (6-11 tuổi)', '19x26 cm', '24', '120', 'tat_ca_san_pham', 'Active', ''),
(21, 'Thư Tết của Bác Hồ', '40000', '36000', '10', 'truyện lẻ', 'Hồ Chí Minh, Lê Minh Hải', 'Nhi đồng (6-11 tuổi)', '14,5x20,5 cm', '92', '155', 'tat_ca_san_pham', 'Active', ''),
(22, 'Thư Bác Hồ gửi thiếu nhi', '40000', '36000', '10', 'truyện lẻ', 'Hồ Chí Minh, Lê Minh Hải', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '88', '145', 'tat_ca_san_pham', 'Active', ''),
(23, 'Những ngày sống gần Bác', '35000', '28000', '20', 'truyện lẻ', 'Nông Thị Trưng, Phùng Lê, Hoàng Hải', 'Tuổi mới lớn (15 – 18)', '13x19 cm', '120', '125', 'tat_ca_san_pham', 'Active', ''),
(24, 'Những anh hùng trẻ tuổi - Chuyện kể về năm đội viên đầu tiên', '50000', '45000', '10', 'truyện lẻ', 'Hoài Lộc, Bùi Việt Thanh', 'Nhi đồng (6 – 11)', '19x26 cm', '36', '170', 'tat_ca_san_pham', 'Active', ''),
(25, 'Ngàn năm sử Việt – Thời Bắc thuộc – Tiếng trống Mê Linh', '40000', '36000', '10', 'truyện lẻ', 'An Cương', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '124', '140', 'tat_ca_san_pham', 'Active', ''),
(26, 'Ngàn năm sử Việt – Thời Bắc thuộc – Giao Châu tụ nghĩa', '50000', '45000', '10', 'truyện lẻ', 'Vũ Ngọc Tiến', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '192', '210', 'tat_ca_san_pham', 'Active', ''),
(27, 'Ngàn năm sử Việt – Thời Bắc thuộc – Vua Đen', '80000', '72000', '10', 'truyện lẻ', 'Hoàng Công Khanh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '320', '335', 'tat_ca_san_pham', 'Active', ''),
(28, 'Ngàn năm sử Việt – Nhà Nguyễn – Nguyễn Trường Tộ - Nhà tư tưởng cách tân', '75000', '60000', '20', 'truyện lẻ', 'Hoàng Thanh Đạm', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '308', '325', 'tat_ca_san_pham', 'Active', ''),
(29, 'Ngàn năm sử Việt – Nhà Nguyễn – Người đào kênh Vĩnh Tế', '40000', '36000', '10', 'truyện lẻ', 'Phan Khánh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '144', '165', 'tat_ca_san_pham', 'Active', ''),
(30, 'Ngàn năm sử Việt – Nhà Nguyễn – Đất mặn đất ngọt', '50000', '45000', '10', 'truyện lẻ', 'Nghiêm Đa Văn', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '180', '200', 'tat_ca_san_pham', 'Active', ''),
(31, 'Ngàn năm sử Việt – Nhà Lê Trung Hưng – Quân sư Đào Duy Từ', '70000', '63000', '10', 'truyện lẻ', 'Vũ Ngọc Tiến', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '272', '295', 'tat_ca_san_pham', 'Active', ''),
(32, 'Ngàn năm sử Việt – Nhà Nguyễn – Bùi Hữu Nghĩa – Mối duyên vàng đá', '70000', '63000', '10', 'truyện lẻ', 'Hoài Anh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '260', '280', 'tat_ca_san_pham', 'Active', ''),
(33, 'Ngàn năm sử Việt – Nhà Nguyễn – Bùi Viện một tấm lòng', '30000', '27000', '10', 'truyện lẻ', 'Phan Trần Chúc', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '96', '120', 'tat_ca_san_pham', 'Active', ''),
(34, 'Ngàn năm sử Việt - Thời Bắc thuộc - Nữ tướng thời Trưng Vương', '75000', '60000', '20', 'truyện lẻ', 'Nguyễn Khắc Xương', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '304', '325', 'tat_ca_san_pham', 'Active', ''),
(35, 'Lược sử nước Việt bằng tranh - Viet Nam – A Brief History in Pictures', '196000', '156800', '20', 'truyện lẻ', ' Tạ Huy Long, Dương Trung Quốc, Hiếu Minh, Huyền Trang', 'Nhi đồng (6 – 11)', '30x24 cm', '96', '775', 'tat_ca_san_pham', 'Active', ''),
(36, 'Ve sầu phiêu du Bắc Cực', '86000', '68800', '20', 'truyện lẻ', 'Mai Anh Đoàn', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '18x24 cm', '76', '200', 'tat_ca_san_pham', 'Active', ''),
(37, 'Sông vừa đi vừa lớn', '50000', '45000', '10', 'truyện lẻ', 'Nguyễn Minh Khiêm', 'Nhi đồng (6 – 11)', '18,5x20,5 cm', '84', '190', 'tat_ca_san_pham', 'Active', ''),
(38, 'Tủ sách tuổi thần tiên - Đi bắt nỗi buồn', '40000', '36000', '10', 'truyện lẻ', 'Nguyễn Thị Như Hiền', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '120', '150', 'tat_ca_san_pham', 'Active', ''),
(39, 'Hoa hướng dương', '55000', '44000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '212', '230', 'tat_ca_san_pham', 'Active', ''),
(40, 'Cá bống mú', '45000', '36000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '168', '190', 'tat_ca_san_pham', 'Active', ''),
(41, 'Rừng đêm xào xạc', '50000', '45000', '10', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '188', '210', 'tat_ca_san_pham', 'Active', ''),
(42, 'Những chuyện lạ về cá', '35000', '28000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '112', '135', 'tat_ca_san_pham', 'Active', ''),
(43, 'Tê giác trong ngàn xanh', '45000', '36000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '164', '185', 'tat_ca_san_pham', 'Active', ''),
(44, 'Người thủy thủ già trên hòn đảo lưu đày', '65000', '52000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '272', '295', 'tat_ca_san_pham', 'Active', ''),
(45, 'Cuộc truy tầm kho vũ khí', '50000', '45000', '10', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '200', '215', 'tat_ca_san_pham', 'Active', ''),
(46, 'Từ những ruộng rau ở nông trại Cúc Cu', '199000', '179100', '10', 'Dy Duyên, Đốm Đốm  ', 'Nhi đồng (6 – 11)', '18x25 cm', '208', '515', '515', 'tat_ca_san_pham', 'Active', ''),
(47, 'Tuổi thơ dữ dội - Tập 2', '80000', '64000', '20', '2', 'Phùng Quán', 'Thiếu niên (11 – 15)', '13.5x20.5 cm', '400', '420', 'tat_ca_san_pham', 'Active', ''),
(48, 'Tuổi thơ dữ dội - Tập 1', '80000', '72000', '10', '1', 'Phùng Quán', 'Thiếu niên (11 – 15)', '13.5x20.5 cm', '400', '420', 'tat_ca_san_pham', 'Active', ''),
(49, 'Thơ hay viết cho thiếu nhi - Góc sân và khoảng trời', '60000', '54000', '10', 'truyện lẻ', 'Trần Đăng Khoa', 'Nhi đồng (6 – 11)', '18.5x20.5 cm', '68', '155', 'tat_ca_san_pham', 'Active', ''),
(50, 'Cái Tết của Mèo Con', '60000', '54000', '10', 'truyện lẻ', 'Ngô Mạnh Lân, Nguyễn Đình Thi', 'Nhi đồng (6 – 11)', '17x24 cm', '64', '160', 'tat_ca_san_pham', 'Active', ''),
(51, 'Cây mận ngọt nhất Trái Đất từng đến vịnh Hạ Long', '46000', '41400', '10', 'truyện lẻ', 'Tiểu Phong', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '152', '180', 'tat_ca_san_pham', 'Active', ''),
(52, 'Tiếng sáo Gà Lôi', '60000', '54000', '10', 'truyện lẻ', 'Hữu Vi', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '208', '240', 'tat_ca_san_pham', 'Active', ''),
(53, 'Cậu bé Tròn Xoe và con ma thích ăn gà rán', '36000', '32400', '10', 'truyện lẻ', 'Mộc An', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '108', '135', 'tat_ca_san_pham', 'Active', ''),
(54, 'Người thầy một nửa ma', '46000', '36800', '20', 'truyện lẻ', 'Mộc An', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '156', '185', 'tat_ca_san_pham', 'Active', ''),
(55, 'Mùa tiểu học cuối cùng', '60000', '54000', '10', 'truyện lẻ', 'Lê Văn Nghĩa', 'Mọi lứa tuổi', '13.5x20.5 cm', '224', '235', 'tat_ca_san_pham', 'Active', ''),
(56, 'Bầu trời trong quả trứng', '60000', '54000', '10', 'truyện lẻ', 'Xuân Quỳnh', 'Nhi đồng (6 – 11)', '18.5x20.5 cm', '72', '160', 'tat_ca_san_pham', 'Active', ''),
(57, 'Cho mùa xuân ở lại', '60000', '54000', '10', 'truyện lẻ', 'Nguyễn Minh Ngọc', 'Nhi đồng (6-11 tuổi)', '14,5x20,5 cm', '184', '215', 'tat_ca_san_pham', 'Active', ''),
(58, 'Mũ rơm đi học', '80000', '72000', '10', 'truyện lẻ', 'Vũ Công Chiến', 'Thiếu niên (11 – 15 tuổi)', '13x20,5 cm', '272', '280', 'tat_ca_san_pham', 'Active', ''),
(59, 'Đất nước ngàn năm - Tập 2', '80000', '72000', '10', '2', 'Nhiều tác giả', 'Thiếu niên (11 – 15 tuổi), Tuổi mới lớn (15 – 18 tuổi), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '248', '285', 'tat_ca_san_pham', 'Active', ''),
(60, 'Đất nước ngàn năm - Tập 1', '80000', '72000', '10', '1', 'Nhiều tác giả', 'Thiếu niên (11 – 15 tuổi), Tuổi mới lớn (15 – 18 tuổi), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '260', '295', 'tat_ca_san_pham', 'Active', ''),
(61, 'Trang trại cuối rừng', '75000', '60000', '20', 'truyện lẻ', 'Phạm Công Luận', 'Thiếu niên (11 – 15)', '13x20,5 cm', '108', '170', 'tat_ca_san_pham', 'Active', ''),
(62, 'Xóm thiên đường', '75000', '60000', '20', 'truyện lẻ', 'Phạm Công Luận', 'Thiếu niên (11 – 15)', '13x20,5 cm', '108', '170', 'tat_ca_san_pham', 'Active', ''),
(63, 'Things you use to fill a hole', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'tat_ca_san_pham', 'Active', ''),
(64, 'Những thứ bạn dùng để lấp một cái hố', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'tat_ca_san_pham', 'Active', ''),
(65, 'Tủ sách tuổi thần tiên - Con Cáo Lửa', '40000', '36000', '10', 'truyện lẻ', 'Phạm Thanh Thúy', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '120', '150', 'tat_ca_san_pham', 'Active', ''),
(66, 'Cỏ trong rào bót', '25000', '20000', '20', 'truyện lẻ', 'Khổng Minh Dụ', 'Nhi đồng (6 – 11)', '13x19 cm', '100', '105', 'tat_ca_san_pham', 'Active', ''),
(67, 'Gia đình ong', '55000', '44000', '20', 'truyện lẻ', 'Anja Mugerli', 'Tuổi trưởng thành (trên 18 tuổi)', '13,5x20,5 cm', '164', '180', 'tat_ca_san_pham', 'Active', ''),
(68, 'Từ nhà anh về nhà em - Hành trình 16,000 km đạp xe xuyên Âu-Á của cặp đôi Pháp-Việt', '150000', '120000', '20', 'truyện lẻ', 'Thibault Clemenceau', 'Tuổi mới lớn (15 – 18 tuổi), Tuổi trưởng thành (trên 18 tuổi)', '16x24 cm', '396', '565', 'tat_ca_san_pham', 'Active', ''),
(69, 'Cửu Long Giang khói lửa - Kí họa và Thơ', '250000', '225000', '10', 'truyện lẻ', 'Sherry Buchanan, Nam Anandaroopa Nguyen', 'Thiếu niên (11 – 15)', '20x24 cm', '256', '875', 'tat_ca_san_pham', 'Active', ''),
(70, 'Chuyện phiêu lưu của Mít Đặc và các bạn', '180000', '144000', '20', 'truyện lẻ', 'Nikolay Nosov', 'Nhi đồng (6 – 11)', '18x25 cm', '220', '485', 'tat_ca_san_pham', 'Active', ''),
(71, 'Cùng Việt Nam', '210000', '168000', '20', 'truyện lẻ', 'Angelina Gatell, Nhiều tác giả', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '20x24 cm', '200', '735', 'tat_ca_san_pham', 'Active', ''),
(72, 'Chỉ có một trên đời', '90000', '81000', '10', 'truyện lẻ', 'Grigore Vieru, Platon Voronko, Nika Turbina', 'Nhi đồng (6-11 tuổi)', '18,5x20,5 cm', '84', '280', 'tat_ca_san_pham', 'Active', ''),
(73, 'Hachiko - chú chó đợi chờ', '60000', '54000', '10', 'Luis Prats, Zuzanna Celej', 'Luis Prats, Zuzanna Celej', 'Nhi đồng (6 – 11)', '13.5x21 cm', '152', '190', 'tat_ca_san_pham', 'Active', ''),
(74, 'Những tấm lòng cao cả', '85000', '68000', '20', 'truyện lẻ', 'Edmondo De Amicis', 'Nhi đồng (6 – 11)', '16x24 cm', '388', '375', 'tat_ca_san_pham', 'Active', ''),
(75, 'Biệt đội phiêu lưu dưới lòng đất', '70000', '63000', '10', 'truyện lẻ', 'Isabelle Marinov, Paula Zorite', 'Nhi đồng (6 – 11)', '13x19 cm', '272', '315', 'tat_ca_san_pham', 'Active', ''),
(76, 'Người Mohican cuối cùng', '180000', '162000', '10', 'truyện lẻ', 'James Fenimore Cooper, Patrick Prugne', 'Tuổi mới lớn (15 – 18)', '16x24 cm', '276', '470', 'tat_ca_san_pham', 'Active', ''),
(77, 'Đảo ngàn sao', '60000', '54000', '10', 'truyện lẻ', 'Emma Karinsdotter', 'Nhi đồng (6 – 11)', '13x19 cm', '304', '290', 'tat_ca_san_pham', 'Active', ''),
(78, 'Nhím Charlie tài ba - Xông pha trị thủy', '45000', '36000', '20', 'truyện lẻ', 'Callie, Anna Griot', 'Nhi đồng (6 – 11)', '13x19 cm', '96', '120', 'tat_ca_san_pham', 'Active', ''),
(79, 'Nhím Charlie tài ba - Phiêu lưu nơi đảo xa', '50000', '45000', '10', 'truyện lẻ', 'Callie, Anna Griot', 'Nhi đồng (6 – 11)', '13x19 cm', '108', '130', 'tat_ca_san_pham', 'Active', ''),
(80, 'Những đứa con của đường rừng', '30000', '27000', '10', 'truyện lẻ', 'Marion Achard', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '13x19 cm', '96', '115', 'tat_ca_san_pham', 'Active', ''),
(81, 'Nỗi bất hạnh của Sophie', '65000', '52000', '20', 'truyện lẻ', 'Nữ bá tước De Ségur', 'Nhi đồng (6 – 11)', '13x19 cm', '212', '205', 'tat_ca_san_pham', 'Active', ''),
(82, 'Bé Năm Mới và những truyện ngắn khác', '99000', '79200', '20', 'truyện lẻ', 'Ellen Robena Field', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '13x19 cm', '96', '215', 'tat_ca_san_pham', 'Active', ''),
(83, 'Kazan', '75000', '60000', '20', 'truyện lẻ', 'James Oliver Curwood', 'Thiếu niên (11 – 15)', '13x19 cm', '308', '285', 'tat_ca_san_pham', 'Active', ''),
(84, 'Cô bé chong chóng', '70000', '63000', '10', 'truyện lẻ', 'Joséphine Colomb', 'Nhi đồng (6 – 11)', '13x19 cm', '232', '225', 'tat_ca_san_pham', 'Active', ''),
(85, 'Nanh trắng', '90000', '81000', '10', 'truyện lẻ', 'Jack London', 'Nhi đồng (6 – 11)', '13x19 cm', '344', '320', 'tat_ca_san_pham', 'Active', ''),
(86, 'Căn cứ bí mật dưới tán rừng mùa hạ', '40000', '36000', '10', 'truyện lẻ', 'Masamoto Nasu, Takane Kurosu', 'Nhi đồng (6 – 11)', '13x19 cm', '156', '155', 'tat_ca_san_pham', 'Active', ''),
(87, 'Tiếng gọi nơi hoang dã', '55000', '44000', '20', 'truyện lẻ', 'Jack London', 'Nhi đồng (6 – 11)', '13x19 cm', '160', '165', 'tat_ca_san_pham', 'Active', ''),
(88, 'Một xu một ngày', '150000', '120000', '20', 'truyện lẻ', 'Walter de la Mare', 'Thiếu niên (11 – 15)', '13x19 cm', '636', '555', 'tat_ca_san_pham', 'Active', ''),
(89, 'Xứ Sở Sương Mù - Cuộc truy tầm Keo Dán Kí Ức', '105000', '84000', '20', 'truyện lẻ', 'Daryl Kho', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '13x19 cm', '488', '450', 'tat_ca_san_pham', 'Active', ''),
(90, 'Ngài Hổ, Betsy và con ngựa biển vàng', '50000', '45000', '10', 'truyện lẻ', 'Sally Gardner, Nick Maland', 'Nhi đồng (6 – 11)', '13x19 cm', '208', '205', 'tat_ca_san_pham', 'Active', ''),
(91, 'Ngài Hổ, Betsy và chú Rồng Biển', '50000', '45000', '10', 'truyện lẻ', 'Sally Gardner, Nick Maland', 'Nhi đồng (6 – 11)', '13x19 cm', '208', '205', 'tat_ca_san_pham', 'Active', ''),
(92, 'Ngài Hổ, Betsy và Mặt Trăng Xanh', '50000', '45000', '10', 'truyện lẻ', 'Sally Gardner, Nick Maland', 'Nhi đồng (6 – 11)', '13x19 cm', '196', '205', 'tat_ca_san_pham', 'Active', ''),
(93, 'Tiểu thuyết Thanh gươm diệt quỷ - Người dẫn lối của gió', '50000', '45000', '10', 'truyện lẻ', 'Koyoharu Gotouge, Aya Yajima', 'Tuổi mới lớn (15 – 18) ', '13x19 cm', '236', '215', 'tat_ca_san_pham', 'Active', ''),
(94, 'Tiểu thuyết Thanh gươm diệt quỷ - Cánh bướm khuyết', '50000', '45000', '10', 'truyện lẻ', 'Koyoharu Gotouge, Aya Yajima', 'Tuổi mới lớn (15 – 18) ', '13x19 cm', '208', '215', 'tat_ca_san_pham', 'Active', ''),
(95, 'Tiểu thuyết Thanh gươm diệt quỷ - Đóa hoa hạnh phúc', '50000', '45000', '10', 'truyện lẻ', 'Koyoharu Gotouge, Aya Yajima', 'Tuổi mới lớn (15 – 18) ', '13x19 cm', '208', '215', 'tat_ca_san_pham', 'Active', ''),
(96, '20 điều quan trọng nhất - Nói với con về những điều quý giá trong đời', '82000', '73800', '10', 'truyện lẻ', 'Christoph Hein, Rotraut Susanne Berner', 'Nhi đồng (6 – 11)', '16x24 cm', '88', '200', 'tat_ca_san_pham', 'Active', ''),
(97, 'Khúc ca mừng Giáng sinh', '55000', '44000', '20', 'truyện lẻ', 'Charles Dickens', 'Nhi đồng (6 – 11)', '13x19 cm', '172', '170', 'tat_ca_san_pham', 'Active', ''),
(98, 'Theo bước thời gian - Các công trình tiêu biểu của Sài Gòn - Thành phố Hồ Chí Minh', '180000', '144000', '20', 'truyện lẻ', 'Võ Thị Mai Chi, Hồ Quốc Cường', 'Mọi lứa tuổi', '25x25 cm', '84', '900', 'tat_ca_san_pham', 'Active', ''),
(99, 'Giải mã danh tác - Cẩm nang phân tích tác phẩm nghệ thuật dành cho trẻ em', '235000', '188000', '20', 'truyện lẻ', 'Ingrid Swenson, Mary Auld', 'Thiếu niên (11-15 tuổi)', '24.5x30.5 cm', '128', '950', 'tat_ca_san_pham', 'Active', ''),
(100, 'Kĩ năng vàng cho học sinh trung học - Học tập tối giản', '55000', '44000', '20', 'truyện lẻ', 'Liao Heng', 'Thiếu niên (11 – 15)', '14,5x20,5 cm', '212', '245', 'tat_ca_san_pham', 'Active', ''),
(101, 'Kĩ năng xã hội cho học sinh tiểu học - Ứng xử ngoài xã hội', '86000', '77400', '10', 'truyện lẻ', 'Trung tâm nghiên cứu tâm lí trẻ em', 'Nhi đồng (6 – 11) ', '17x24 cm', '156', '280', 'tat_ca_san_pham', 'Active', ''),
(102, '15 bí kíp giúp tớ an toàn - Cẩm nang phòng tránh đuối nước', '45000', '36000', '20', 'truyện lẻ', 'Ths. Bs. Nguyễn Trọng An', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '72', '140', 'tat_ca_san_pham', 'Active', ''),
(103, 'Truyện xưa bất tận - Đông phương bách quái - Tập 2', '260000', '234000', '10', '2', 'Trương Vân, Miêu Cửu', 'Thiếu niên (11 – 15)', '17x24 cm', '328', '575', 'tat_ca_san_pham', 'Active', ''),
(104, 'Truyện xưa bất tận - Đông phương bách quái - Tập 1', '260000', '234000', '10', '1', 'Trương Vân, Miêu Cửu', 'Thiếu niên (11 – 15)', '17x24 cm', '324', '570', 'tat_ca_san_pham', 'Active', ''),
(105, 'Cẩm nang sinh hoạt bằng tranh cho bé - Tập 1 - Kĩ năng trong sinh hoạt thường ngày', '36000', '32400', '10', '1', 'Hội nghiên cứu khoa học đời sống trẻ em Nhật Bản', 'Nhà trẻ - mẫu giáo (0 - 6)', '18x23 cm', '48', '130', 'tat_ca_san_pham', 'Active', ''),
(106, 'Quiz! Khoa học kì thú - Sa mạc Rừng rậm', '75000', '60000', '20', 'truyện lẻ', 'Oh Soo-jin, Ha Jong-joon', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'tat_ca_san_pham', 'Active', ''),
(107, 'Rối loạn lưỡng cực - hành trình dài chung sống - Trò chuyện về sức khoẻ tâm thần - Từ chẩn đoán đến cuộc sống hằng ngày', '80000', '72000', '10', 'truyện lẻ', 'Fabrice Saulière, Nicolas Franck, Céline Renouard', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi), Phụ huynh', '14,5x20,5 cm', '152', '210', 'tat_ca_san_pham', 'Active', ''),
(108, 'Lo âu ơi, tạm biệt! - Trò chuyện về sức khoẻ tâm thần - Chứng rối loạn lo âu', '80000', '72000', '10', 'truyện lẻ', 'Marco Coiffard, Mélanie Villette', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi), Phụ huynh', '14,5x20,5 cm', '160', '220', 'tat_ca_san_pham', 'Active', ''),
(109, 'Kĩ năng vàng cho teen thế kỉ 21 – Bí kíp giao tiếp xã hội', '85000', '68000', '20', 'truyện lẻ', 'Li-Jung Yang, Yu-Shi Wu, Water Brain, Taiwan Happiness Village Emotion Education Association', 'Education Association', '14.5x20.5 cm', '224', '224', 'tat_ca_san_pham', 'Active', ''),
(110, 'Kĩ năng vàng cho teen thế kỉ 21 – Bí kíp giao tiếp xã hội', '60000', '54000', '10', 'truyện lẻ', 'Han Nana, Toonjaengi ', 'Nhi đồng (6 – 11)', '14.5x20.5 cm', '184', '185', 'tat_ca_san_pham', 'Active', ''),
(111, 'WHO? Chuyện kể về danh nhân thế giới - Nikola Tesla', '60000', '54000', '10', 'truyện lẻ', 'Kim Seung-Min, Choi Byeong-Guk', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '184', '200', 'tat_ca_san_pham', 'Active', ''),
(112, 'WHO? Chuyện kể về danh nhân thế giới - Lionel Messi', '65000', '52000', '20', 'truyện lẻ', 'Choi Jaehun, Toonjaengi  ', 'Nhi đồng (6 – 11)', '14.5x20.5 cm', '160', '185', 'tat_ca_san_pham', 'Active', ''),
(113, 'Quiz! Khoa học kì thú - Dậy thì Giới tính', '75000', '60000', '20', 'truyện lẻ', 'Park Kyung-eun', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'tat_ca_san_pham', 'Active', ''),
(114, 'Vòng quanh thế giới - Lào', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Tuấn Huỳnh', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'tat_ca_san_pham', 'Active', ''),
(115, 'Vòng quanh thế giới - Bồ Đào Nha', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'tat_ca_san_pham', 'Active', ''),
(116, 'Vòng quanh thế giới - Bhutan', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'tat_ca_san_pham', 'Active', ''),
(117, 'Vòng quanh thế giới - Argentina', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'tat_ca_san_pham', 'Active', ''),
(118, 'Vòng quanh thế giới - Đài Loan', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'tat_ca_san_pham', 'Active', ''),
(119, 'Câu chuyện âm nhạc - Lịch sử âm nhạc dành cho trẻ em', '185000', '148000', '20', 'truyện lẻ', 'Mick Manning, Brita Granström', 'Thiếu niên (11 – 15), Tuổi mới lớn (15 – 18)', '24,5x30,5 cm', '88', '755', 'tat_ca_san_pham', 'Active', ''),
(120, 'Quiz! Khoa học kì thú - Sơ cấp cứu', '75000', '60000', '20', 'truyện lẻ', 'Shin Hye-young', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'tat_ca_san_pham', 'Active', ''),
(121, 'Quiz! Khoa học kì thú - Thực phẩm Dinh dưỡng', '75000', '60000', '20', 'An Guang-hyun', 'An Guang-hyun', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'tat_ca_san_pham', 'Active', ''),
(122, 'Quiz! Khoa học kì thú - Khám phá Trái Đất', '75000', '60000', '20', 'truyện lẻ', 'Ha Jong-joon, Oh Soo-jin', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '200', '260', 'tat_ca_san_pham', 'Active', ''),
(123, 'Quiz! Khoa học kì thú - Những cái nhất và đầu tiên trên thế giới', '75000', '60000', '20', 'truyện lẻ', 'Cha Hyun Jin', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'tat_ca_san_pham', 'Active', ''),
(124, 'Quiz! Khoa học kì thú - Thế giới huyền bí', '75000', '60000', '20', 'truyện lẻ', 'An Guang-hyun', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'tat_ca_san_pham', 'Active', ''),
(125, 'Quiz! Khoa học kì thú - Côn trùng', '75000', '60000', '20', 'truyện lẻ', 'Kim Hyun Min', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'tat_ca_san_pham', 'Active', ''),
(126, 'Quiz! Khoa học kì thú - Thời tiết Môi trường', '75000', '60000', '20', 'truyện lẻ', 'Choi Dong-yin, Kwon Chan Ho', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '184', '260', 'tat_ca_san_pham', 'Active', ''),
(127, 'Quiz! Khoa học kì thú - Động vật', '75000', '60000', '20', 'truyện lẻ', 'Do Ki-sung', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '260', '260', 'tat_ca_san_pham', 'Active', ''),
(128, 'Quiz! Khoa học kì thú - Phát minh Phát kiến', '75000', '60000', '20', 'truyện lẻ', 'Do Ki-sung', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '196', '260', 'tat_ca_san_pham', 'Active', ''),
(129, 'Quiz! Khoa học kì thú - Các nhà khoa học thiên tài', '75000', '60000', '20', 'truyện lẻ', 'Joo Seong-yoon', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '14.5x20.5 cm', '152', '260', 'tat_ca_san_pham', 'Active', ''),
(130, 'Cuộc sống là gì thế?', '75000', '60000', '20', 'truyện lẻ', 'Aldebert, Maud Roegiers', 'Nhi đồng (6 – 11)', '24x28 cm', '48', '230', 'tat_ca_san_pham', 'Active', ''),
(131, '10 bài học cho bé cá tính - Ăn vạ chẳng ai chơi', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(132, '10 bài học cho bé cá tính - Chế ngự cơn nóng giận', '30000', '27000', '10', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(133, '10 bài học cho bé cá tính - Lịch sự nơi công cộng', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(134, '10 bài học cho bé cá tính - Chớ lề mề hỏng việc', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(135, '10 bài học cho bé cá tính - Vui chơi có giờ giấc', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(136, '10 bài học cho bé cá tính - Đừng chế giễu người khác', '30000', '27000', '10', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(137, 'Thế giới xe công trình - Xe chở nước đáng mến', '26000', '23400', '10', 'truyện lẻ', 'Mijika, Liuzi', 'Nhà trẻ - mẫu giáo (0 - 6)', '18.5x20 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(138, 'Cổ tích Việt Nam cho bé - Tấm Cám', '20000', '18000', '10', 'truyện lẻ', 'Kim Ngọc, Cloud Pillow', 'Nhà trẻ - mẫu giáo (0 - 6)', '20,5x20,5 cm', '20', '85', 'tat_ca_san_pham', 'Active', ''),
(139, 'Thế giới xe công trình - Xe nâng cừ khôi', '26000', '23400', '10', 'truyện lẻ', 'Mijika, Liuzi', 'Nhà trẻ - mẫu giáo (0 - 6)', '18.5x20 cm', '32', '80', 'tat_ca_san_pham', 'Active', ''),
(140, 'Tý Quậy', '40000', '36000', '10', 'truyện lẻ', 'Đào Hải, Dương Thúy Quỳnh, Nguyễn Quang Toàn', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '172', '185', 'tat_ca_san_pham', 'Active', ''),
(141, 'Chuột Típ có em', '25000', '20000', '20', 'truyện lẻ', 'Marco Campanella, Anna Casalis', 'Nhà trẻ - mẫu giáo (0 - 6)', '18.5x20.5 cm', '28', '75', 'tat_ca_san_pham', 'Active', ''),
(142, 'Thế giới xe cộ - Xe tải - Truck', '25000', '20000', '20', 'truyện lẻ', 'Lee Yanan, Bookworm Culture', 'Nhà trẻ - mẫu giáo (0 - 6)', '18x20 cm', '24', '70', 'tat_ca_san_pham', 'Active', ''),
(143, 'Thế giới xe cộ - Xe tắc xi - Taxi', '25000', '20000', '20', 'truyện lẻ', 'Lee Yanan, Bookworm Culture', 'Nhà trẻ - mẫu giáo (0 - 6)', '18x20 cm', '24', '70', 'tat_ca_san_pham', 'Active', ''),
(144, 'Từ những hạt mầm - Hột điều của Sóc', '13000', '11700', '10', 'truyện lẻ', 'Nguyên Trang, Khanh Nguyễn', 'Nhi đồng (6 – 11)', '13x20 cm', '24', '40', 'tat_ca_san_pham', 'Active', ''),
(145, 'Niềm vui mỗi ngày - Vội gì vội thế! Phù! Phù Trễ mất thôi!', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'tat_ca_san_pham', 'Active', ''),
(146, 'Niềm vui mỗi ngày - Vị khách không mời', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'tat_ca_san_pham', 'Active', ''),
(147, 'Niềm vui mỗi ngày - Sao mà quá thế!', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'tat_ca_san_pham', 'Active', ''),
(148, 'Niềm vui mỗi ngày - Kho báu đích thực', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'tat_ca_san_pham', 'Active', ''),
(149, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Nàng tiên cá - The Little Mermaid', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'tat_ca_san_pham', 'Active', ''),
(150, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Nàng Bạch Tuyết - Snow White', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'tat_ca_san_pham', 'Active', ''),
(151, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Cô bé Lọ Lem - Cinderella', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'tat_ca_san_pham', 'Active', ''),
(152, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Chú lính chì dũng cảm - The Steadfast Tin Soldier', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her , Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'tat_ca_san_pham', 'Active', ''),
(153, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Alice ở xứ sở thần tiên - Alice in Wonderland', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her , Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'tat_ca_san_pham', 'Active', ''),
(154, 'Truyện cổ tích nổi tiếng song ngữ Việt - Anh - Pinocchio - Chú bé người gỗ Pinocchio', '35000', '28000', '20', 'truyện lẻ', 'Arianna Candell, Daniel Howarth', 'Nhi đồng (6 – 11)', '20,5x20,5 cm', '36', '95', 'tat_ca_san_pham', 'Active', ''),
(155, 'Boxset Cá voi đêm bão và những câu chuyện khác (5 quyển)', '260000', '234000', '10', 'truyện lẻ', 'Benji Davies', 'Nhi đồng (6 – 11)', '25x22 cm', '32', '890', 'tat_ca_san_pham', 'Active', ''),
(156, 'Đại gia đình cá voi đêm bão', '52000', '46800', '10', 'truyện lẻ', 'Benji Davies', 'Nhi đồng (6 – 11)', '25x22 cm', '32', '165', 'tat_ca_san_pham', 'Active', ''),
(157, 'Vang danh nghề cổ - Phường đúc Huế - Kiệt tác di sản', '40000', '36000', '10', 'truyện lẻ', 'Phương Bùi, Thành Nguyễn, Bùi Xuân Quỳnh, NGART', 'Nhi đồng (6 – 11)', '20x23 cm', '32', '115', 'tat_ca_san_pham', 'Active', ''),
(158, 'Vang danh nghề cổ - Giấy dó bản Sưng - Vẻ đẹp bình dị', '40000', '32000', '20', 'truyện lẻ', 'Phương Bùi, Thành Nguyễn, Bùi Xuân Quỳnh, NGART', 'Nhi đồng (6 – 11)', '20x23 cm', '32', '115', 'tat_ca_san_pham', 'Active', ''),
(159, 'Tranh truyện lịch sử Việt Nam - Trần Quốc Toản', '20000', '18000', '10', 'truyện lẻ', 'Nguyễn Huy Thắng, Lê Minh Hải', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '32', '100', 'tat_ca_san_pham', 'Active', ''),
(160, 'Trị liệu nghệ thuật - Giải phóng cảm xúc qua nghệ thuật', '130000', '104000', '20', 'truyện lẻ', 'Nhóm Viết Chữa Lành', 'Tuổi trưởng thành (trên 18 tuổi)', '14.5x20.5 cm', '244', '325', 'tat_ca_san_pham', 'Active', ''),
(161, 'Sơn hải kinh (Tặng kèm Bookmark)', '380000', '342000', '10', 'truyện lẻ', 'Sam Trạch, Lương Siêu', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '16x22 cm', '432', '935', 'tat_ca_san_pham', 'Active', ''),
(162, 'Bút chì đỏ, Lockdown xứ người & Tiệm thuê truyện', '50000', '45000', '10', 'truyện lẻ', 'Thư Cao, Nguyên Trần, Ngọc Anh, Nhiên Khang', 'Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '92ĐT+20M', '160', 'tat_ca_san_pham', 'Active', ''),
(163, 'Bài văn về trứng vịt lộn - Ma mère vend des baluts (Song ngữ Việt – Pháp)', '50000', '45000', '10', 'truyện lẻ', 'Khoan', 'Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '112', '160', 'tat_ca_san_pham', 'Active', ''),
(164, 'Thiên sứ nhà bên (Light Novel)', '95000', '76000', '20', 'truyện lẻ', 'Saekisan, Hanekoto', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '328', '330', 'tat_ca_san_pham', 'Active', ''),
(165, 'Thiên sứ nhà bên (Manga)', '50000', '45000', '10', 'truyện lẻ', 'Saekisan, Hanekoto, Wan Shibata, Suzu Yuki', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '194', '220', 'tat_ca_san_pham', 'Active', ''),
(166, 'Kujima hót, cả nhà véo von - Tập 5 (Tặng Shikishi)', '40000', '36000', '10', 'truyện lẻ', 'Akira Konno', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', ''),
(167, 'Thị trấn mèo (Manga)', '68000', '61200', '10', 'truyện lẻ', 'Nekomaki (ms-work)', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '176', '195', 'tat_ca_san_pham', 'Active', ''),
(168, 'Chúa tể bóng tối (Manga)​​​​​​​ - Tập 10 (Tặng kèm Postcard + Photostrip)', '40000', '36000', '10', '10', 'Daisuke Aizawa, Touzai, Anri Sakano', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '165', 'tat_ca_san_pham', 'Active', ''),
(169, 'Arya bàn bên thỉnh thoảng lại trêu ghẹo tôi bằng tiếng Nga - Tập 4.5', '95000', '76000', '20', '4.5', 'Sunsunsun, Momoco', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '392', '395', 'tat_ca_san_pham', 'Active', ''),
(170, 'Arya bàn bên thỉnh thoảng lại trêu ghẹo tôi bằng tiếng Nga - Tập 4', '95000', '76000', '20', '4', 'Sunsunsun, Momoco', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '412', '420', 'tat_ca_san_pham', 'Active', ''),
(171, 'Arya bàn bên thỉnh thoảng lại trêu ghẹo tôi bằng tiếng Nga - Tập 2', '95000', '76000', '20', '2', 'Sunsunsun, Momoco', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '336', '315', 'tat_ca_san_pham', 'Active', ''),
(172, 'Đàn chị hay xấu hổ', '38000', '34200', '10', 'truyện lẻ', 'Makoto Kudo', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '170', 'tat_ca_san_pham', 'Active', ''),
(173, 'Dược sư tự sự (Manga) - Tập 13', '127000', '63500', '50', '13', 'Natsu Hyuuga, Touco Shino, Itsuki Nanao, Nekokurage', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '180', '200', 'tat_ca_san_pham', 'Active', ''),
(174, 'Dược sư tự sự (Manga) (Tặng kèm Standee Ivory)', '47000', '42300', '10', 'truyện lẻ', 'Natsu Hyuuga, Touco Shino, Itsuki Nanao, Nekokurage', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '178', '200', 'tat_ca_san_pham', 'Active', ''),
(175, 'Cách yêu thương - Cẩm nang về tâm tình và mối quan hệ cho mọi người', '112000', '89600', '20', 'truyện lẻ', 'Alex Norris', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '224', '310', 'tat_ca_san_pham', 'Active', ''),
(176, 'Cô nàng Shimotsuki trót phải lòng nhân vật nền - Tập 5', '115000', '92000', '20', '5', 'Kagami Yagami, Roha', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '300', '330', 'tat_ca_san_pham', 'Active', ''),
(177, 'Kujima hót, cả nhà véo von - Tập 4 (Tặng Lót Ly)', '40000', '32000', '20', '4', 'Akira Konno', 'Tuổi mới lớn (15 – 18),  Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', ''),
(178, 'Kujima hót, cả nhà véo von - Tập 3 (Tặng Mini-Card)', '40000', '36000', '10', '3', 'Akira Konno', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', ''),
(179, 'Hai thằng này nhìn cứ nghi nghi', '35000', '31500', '10', 'truyện lẻ', 'Mayo Onizawa', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '164', '265', 'tat_ca_san_pham', 'Active', ''),
(180, 'Hội những người thích ở nhà', '80000', '72000', '10', 'truyện lẻ', 'Chiaki Ida', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '120', '265', 'tat_ca_san_pham', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `truyen_tranh`
--

CREATE TABLE `truyen_tranh` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truyen_tranh`
--

INSERT INTO `truyen_tranh` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`) VALUES
(130, 'Cuộc sống là gì thế?', '75000', '60000', '20', 'truyện lẻ', 'Aldebert, Maud Roegiers', 'Nhi đồng (6 – 11)', '24x28 cm', '48', '230', 'Truyen_tranh', 'Active'),
(131, '10 bài học cho bé cá tính - Ăn vạ chẳng ai chơi', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'Truyen_tranh', 'Active'),
(132, '10 bài học cho bé cá tính - Chế ngự cơn nóng giận', '30000', '27000', '10', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'Truyen_tranh', 'Active'),
(133, '10 bài học cho bé cá tính - Lịch sự nơi công cộng', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'Truyen_tranh', 'Active'),
(134, '10 bài học cho bé cá tính - Chớ lề mề hỏng việc', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'Truyen_tranh', 'Active'),
(135, '10 bài học cho bé cá tính - Vui chơi có giờ giấc', '30000', '24000', '20', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'Truyen_tranh', 'Active'),
(136, '10 bài học cho bé cá tính - Đừng chế giễu người khác', '30000', '27000', '10', 'truyện lẻ', 'Tao Chun Ni', 'Nhà trẻ - mẫu giáo (0 - 6)', '17x21 cm', '32', '80', 'Truyen_tranh', 'Active'),
(137, 'Thế giới xe công trình - Xe chở nước đáng mến', '26000', '23400', '10', 'truyện lẻ', 'Mijika, Liuzi', 'Nhà trẻ - mẫu giáo (0 - 6)', '18.5x20 cm', '32', '80', 'Truyen_tranh', 'Active'),
(138, 'Cổ tích Việt Nam cho bé - Tấm Cám', '20000', '18000', '10', 'truyện lẻ', 'Kim Ngọc, Cloud Pillow', 'Nhà trẻ - mẫu giáo (0 - 6)', '20,5x20,5 cm', '20', '85', 'Truyen_tranh', 'Active'),
(139, 'Thế giới xe công trình - Xe nâng cừ khôi', '26000', '23400', '10', 'truyện lẻ', 'Mijika, Liuzi', 'Nhà trẻ - mẫu giáo (0 - 6)', '18.5x20 cm', '32', '80', 'Truyen_tranh', 'Active'),
(140, 'Tý Quậy', '40000', '36000', '10', 'truyện lẻ', 'Đào Hải, Dương Thúy Quỳnh, Nguyễn Quang Toàn', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '172', '185', 'Truyen_tranh', 'Active'),
(141, 'Chuột Típ có em', '25000', '20000', '20', 'truyện lẻ', 'Marco Campanella, Anna Casalis', 'Nhà trẻ - mẫu giáo (0 - 6)', '18.5x20.5 cm', '28', '75', 'Truyen_tranh', 'Active'),
(142, 'Thế giới xe cộ - Xe tải - Truck', '25000', '20000', '20', 'truyện lẻ', 'Lee Yanan, Bookworm Culture', 'Nhà trẻ - mẫu giáo (0 - 6)', '18x20 cm', '24', '70', 'Truyen_tranh', 'Active'),
(143, 'Thế giới xe cộ - Xe tắc xi - Taxi', '25000', '20000', '20', 'truyện lẻ', 'Lee Yanan, Bookworm Culture', 'Nhà trẻ - mẫu giáo (0 - 6)', '18x20 cm', '24', '70', 'Truyen_tranh', 'Active'),
(144, 'Từ những hạt mầm - Hột điều của Sóc', '13000', '11700', '10', 'truyện lẻ', 'Nguyên Trang, Khanh Nguyễn', 'Nhi đồng (6 – 11)', '13x20 cm', '24', '40', 'Truyen_tranh', 'Active'),
(145, 'Niềm vui mỗi ngày - Vội gì vội thế! Phù! Phù Trễ mất thôi!', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'Truyen_tranh', 'Active'),
(146, 'Niềm vui mỗi ngày - Vị khách không mời', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'Truyen_tranh', 'Active'),
(147, 'Niềm vui mỗi ngày - Sao mà quá thế!', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'Truyen_tranh', 'Active'),
(148, 'Niềm vui mỗi ngày - Kho báu đích thực', '40000', '36000', '10', 'truyện lẻ', 'Maria Gianola', 'Nhà trẻ - mẫu giáo (0 - 6)', '21x21 cm', '31', '110', 'Truyen_tranh', 'Active'),
(149, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Nàng tiên cá - The Little Mermaid', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'Truyen_tranh', 'Active'),
(150, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Nàng Bạch Tuyết - Snow White', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'Truyen_tranh', 'Active'),
(151, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Cô bé Lọ Lem - Cinderella', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'Truyen_tranh', 'Active'),
(152, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Chú lính chì dũng cảm - The Steadfast Tin Soldier', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her , Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'Truyen_tranh', 'Active'),
(153, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Alice ở xứ sở thần tiên - Alice in Wonderland', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her , Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'Truyen_tranh', 'Active'),
(154, 'Truyện cổ tích nổi tiếng song ngữ Việt - Anh - Pinocchio - Chú bé người gỗ Pinocchio', '35000', '28000', '20', 'truyện lẻ', 'Arianna Candell, Daniel Howarth', 'Nhi đồng (6 – 11)', '20,5x20,5 cm', '36', '95', 'Truyen_tranh', 'Active'),
(155, 'Boxset Cá voi đêm bão và những câu chuyện khác (5 quyển)', '260000', '234000', '10', 'truyện lẻ', 'Benji Davies', 'Nhi đồng (6 – 11)', '25x22 cm', '32', '890', 'Truyen_tranh', 'Active'),
(156, 'Đại gia đình cá voi đêm bão', '52000', '46800', '10', 'truyện lẻ', 'Benji Davies', 'Nhi đồng (6 – 11)', '25x22 cm', '32', '165', 'Truyen_tranh', 'Active'),
(157, 'Vang danh nghề cổ - Phường đúc Huế - Kiệt tác di sản', '40000', '36000', '10', 'truyện lẻ', 'Phương Bùi, Thành Nguyễn, Bùi Xuân Quỳnh, NGART', 'Nhi đồng (6 – 11)', '20x23 cm', '32', '115', 'Truyen_tranh', 'Active'),
(158, 'Vang danh nghề cổ - Giấy dó bản Sưng - Vẻ đẹp bình dị', '40000', '32000', '20', 'truyện lẻ', 'Phương Bùi, Thành Nguyễn, Bùi Xuân Quỳnh, NGART', 'Nhi đồng (6 – 11)', '20x23 cm', '32', '115', 'Truyen_tranh', 'Active'),
(159, 'Tranh truyện lịch sử Việt Nam - Trần Quốc Toản', '20000', '18000', '10', 'truyện lẻ', 'Nguyễn Huy Thắng, Lê Minh Hải', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '32', '100', 'Truyen_tranh', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `van_hoc_nuoc_ngoai`
--

CREATE TABLE `van_hoc_nuoc_ngoai` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `van_hoc_nuoc_ngoai`
--

INSERT INTO `van_hoc_nuoc_ngoai` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`) VALUES
(67, 'Gia đình ong', '55000', '44000', '20', 'truyện lẻ', 'Anja Mugerli', 'Tuổi trưởng thành (trên 18 tuổi)', '13,5x20,5 cm', '164', '180', 'Van_hoc_nuoc_ngoai', 'Active'),
(68, 'Từ nhà anh về nhà em - Hành trình 16,000 km đạp xe xuyên Âu-Á của cặp đôi Pháp-Việt', '150000', '120000', '20', 'truyện lẻ', 'Thibault Clemenceau', 'Tuổi mới lớn (15 – 18 tuổi), Tuổi trưởng thành (trên 18 tuổi)', '16x24 cm', '396', '565', 'Van_hoc_nuoc_ngoai', 'Active'),
(69, 'Cửu Long Giang khói lửa - Kí họa và Thơ', '250000', '225000', '10', 'truyện lẻ', 'Sherry Buchanan, Nam Anandaroopa Nguyen', 'Thiếu niên (11 – 15)', '20x24 cm', '256', '875', 'Van_hoc_nuoc_ngoai', 'Active'),
(70, 'Chuyện phiêu lưu của Mít Đặc và các bạn', '180000', '144000', '20', 'truyện lẻ', 'Nikolay Nosov', 'Nhi đồng (6 – 11)', '18x25 cm', '220', '485', 'Van_hoc_nuoc_ngoai', 'Active'),
(71, 'Cùng Việt Nam', '210000', '168000', '20', 'truyện lẻ', 'Angelina Gatell, Nhiều tác giả', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '20x24 cm', '200', '735', 'Van_hoc_nuoc_ngoai', 'Active'),
(72, 'Chỉ có một trên đời', '90000', '81000', '10', 'truyện lẻ', 'Grigore Vieru, Platon Voronko, Nika Turbina', 'Nhi đồng (6-11 tuổi)', '18,5x20,5 cm', '84', '280', 'Van_hoc_nuoc_ngoai', 'Active'),
(73, 'Hachiko - chú chó đợi chờ', '60000', '54000', '10', 'Luis Prats, Zuzanna Celej', 'Luis Prats, Zuzanna Celej', 'Nhi đồng (6 – 11)', '13.5x21 cm', '152', '190', 'Van_hoc_nuoc_ngoai', 'Active'),
(74, 'Những tấm lòng cao cả', '85000', '68000', '20', 'truyện lẻ', 'Edmondo De Amicis', 'Nhi đồng (6 – 11)', '16x24 cm', '388', '375', 'Van_hoc_nuoc_ngoai', 'Active'),
(75, 'Biệt đội phiêu lưu dưới lòng đất', '70000', '63000', '10', 'truyện lẻ', 'Isabelle Marinov, Paula Zorite', 'Nhi đồng (6 – 11)', '13x19 cm', '272', '315', 'Van_hoc_nuoc_ngoai', 'Active'),
(76, 'Người Mohican cuối cùng', '180000', '162000', '10', 'truyện lẻ', 'James Fenimore Cooper, Patrick Prugne', 'Tuổi mới lớn (15 – 18)', '16x24 cm', '276', '470', 'Van_hoc_nuoc_ngoai', 'Active'),
(77, 'Đảo ngàn sao', '60000', '54000', '10', 'truyện lẻ', 'Emma Karinsdotter', 'Nhi đồng (6 – 11)', '13x19 cm', '304', '290', 'Van_hoc_nuoc_ngoai', 'Active'),
(78, 'Nhím Charlie tài ba - Xông pha trị thủy', '45000', '36000', '20', 'truyện lẻ', 'Callie, Anna Griot', 'Nhi đồng (6 – 11)', '13x19 cm', '96', '120', 'Van_hoc_nuoc_ngoai', 'Active'),
(79, 'Nhím Charlie tài ba - Phiêu lưu nơi đảo xa', '50000', '45000', '10', 'truyện lẻ', 'Callie, Anna Griot', 'Nhi đồng (6 – 11)', '13x19 cm', '108', '130', 'Van_hoc_nuoc_ngoai', 'Active'),
(80, 'Những đứa con của đường rừng', '30000', '27000', '10', 'truyện lẻ', 'Marion Achard', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '13x19 cm', '96', '115', 'Van_hoc_nuoc_ngoai', 'Active'),
(81, 'Nỗi bất hạnh của Sophie', '65000', '52000', '20', 'truyện lẻ', 'Nữ bá tước De Ségur', 'Nhi đồng (6 – 11)', '13x19 cm', '212', '205', 'Van_hoc_nuoc_ngoai', 'Active'),
(82, 'Bé Năm Mới và những truyện ngắn khác', '99000', '79200', '20', 'truyện lẻ', 'Ellen Robena Field', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '13x19 cm', '96', '215', 'Van_hoc_nuoc_ngoai', 'Active'),
(83, 'Kazan', '75000', '60000', '20', 'truyện lẻ', 'James Oliver Curwood', 'Thiếu niên (11 – 15)', '13x19 cm', '308', '285', 'Van_hoc_nuoc_ngoai', 'Active'),
(84, 'Cô bé chong chóng', '70000', '63000', '10', 'truyện lẻ', 'Joséphine Colomb', 'Nhi đồng (6 – 11)', '13x19 cm', '232', '225', 'Van_hoc_nuoc_ngoai', 'Active'),
(85, 'Nanh trắng', '90000', '81000', '10', 'truyện lẻ', 'Jack London', 'Nhi đồng (6 – 11)', '13x19 cm', '344', '320', 'Van_hoc_nuoc_ngoai', 'Active'),
(86, 'Căn cứ bí mật dưới tán rừng mùa hạ', '40000', '36000', '10', 'truyện lẻ', 'Masamoto Nasu, Takane Kurosu', 'Nhi đồng (6 – 11)', '13x19 cm', '156', '155', 'Van_hoc_nuoc_ngoai', 'Active'),
(87, 'Tiếng gọi nơi hoang dã', '55000', '44000', '20', 'truyện lẻ', 'Jack London', 'Nhi đồng (6 – 11)', '13x19 cm', '160', '165', 'Van_hoc_nuoc_ngoai', 'Active'),
(88, 'Một xu một ngày', '150000', '120000', '20', 'truyện lẻ', 'Walter de la Mare', 'Thiếu niên (11 – 15)', '13x19 cm', '636', '555', 'Van_hoc_nuoc_ngoai', 'Active'),
(89, 'Xứ Sở Sương Mù - Cuộc truy tầm Keo Dán Kí Ức', '105000', '84000', '20', 'truyện lẻ', 'Daryl Kho', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '13x19 cm', '488', '450', 'Van_hoc_nuoc_ngoai', 'Active'),
(90, 'Ngài Hổ, Betsy và con ngựa biển vàng', '50000', '45000', '10', 'truyện lẻ', 'Sally Gardner, Nick Maland', 'Nhi đồng (6 – 11)', '13x19 cm', '208', '205', 'Van_hoc_nuoc_ngoai', 'Active'),
(91, 'Ngài Hổ, Betsy và chú Rồng Biển', '50000', '45000', '10', 'truyện lẻ', 'Sally Gardner, Nick Maland', 'Nhi đồng (6 – 11)', '13x19 cm', '208', '205', 'Van_hoc_nuoc_ngoai', 'Active'),
(92, 'Ngài Hổ, Betsy và Mặt Trăng Xanh', '50000', '45000', '10', 'truyện lẻ', 'Sally Gardner, Nick Maland', 'Nhi đồng (6 – 11)', '13x19 cm', '196', '205', 'Van_hoc_nuoc_ngoai', 'Active'),
(93, 'Tiểu thuyết Thanh gươm diệt quỷ - Người dẫn lối của gió', '50000', '45000', '10', 'truyện lẻ', 'Koyoharu Gotouge, Aya Yajima', 'Tuổi mới lớn (15 – 18) ', '13x19 cm', '236', '215', 'Van_hoc_nuoc_ngoai', 'Active'),
(94, 'Tiểu thuyết Thanh gươm diệt quỷ - Cánh bướm khuyết', '50000', '45000', '10', 'truyện lẻ', 'Koyoharu Gotouge, Aya Yajima', 'Tuổi mới lớn (15 – 18) ', '13x19 cm', '208', '215', 'Van_hoc_nuoc_ngoai', 'Active'),
(95, 'Tiểu thuyết Thanh gươm diệt quỷ - Đóa hoa hạnh phúc', '50000', '45000', '10', 'truyện lẻ', 'Koyoharu Gotouge, Aya Yajima', 'Tuổi mới lớn (15 – 18) ', '13x19 cm', '208', '215', 'Van_hoc_nuoc_ngoai', 'Active'),
(96, '20 điều quan trọng nhất - Nói với con về những điều quý giá trong đời', '82000', '73800', '10', 'truyện lẻ', 'Christoph Hein, Rotraut Susanne Berner', 'Nhi đồng (6 – 11)', '16x24 cm', '88', '200', 'Van_hoc_nuoc_ngoai', 'Active'),
(97, 'Khúc ca mừng Giáng sinh', '55000', '44000', '20', 'truyện lẻ', 'Charles Dickens', 'Nhi đồng (6 – 11)', '13x19 cm', '172', '170', 'Van_hoc_nuoc_ngoai', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `van_hoc_viet_nam`
--

CREATE TABLE `van_hoc_viet_nam` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `van_hoc_viet_nam`
--

INSERT INTO `van_hoc_viet_nam` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`) VALUES
(36, 'Ve sầu phiêu du Bắc Cực', '86000', '68800', '20', 'truyện lẻ', 'Mai Anh Đoàn', 'Nhi đồng (6 – 11), Thiếu niên (11 – 15)', '18x24 cm', '76', '200', 'Van_hoc_Viet_Nam', 'Active'),
(37, 'Sông vừa đi vừa lớn', '50000', '45000', '10', 'truyện lẻ', 'Nguyễn Minh Khiêm', 'Nhi đồng (6 – 11)', '18,5x20,5 cm', '84', '190', 'Van_hoc_Viet_Nam', 'Active'),
(38, 'Tủ sách tuổi thần tiên - Đi bắt nỗi buồn', '40000', '36000', '10', 'truyện lẻ', 'Nguyễn Thị Như Hiền', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '120', '150', 'Van_hoc_Viet_Nam', 'Active'),
(39, 'Hoa hướng dương', '55000', '44000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '212', '230', 'Van_hoc_Viet_Nam', 'Active'),
(40, 'Cá bống mú', '45000', '36000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '168', '190', 'Van_hoc_Viet_Nam', 'Active'),
(41, 'Rừng đêm xào xạc', '50000', '45000', '10', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '188', '210', 'Van_hoc_Viet_Nam', 'Active'),
(42, 'Những chuyện lạ về cá', '35000', '28000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '112', '135', 'Van_hoc_Viet_Nam', 'Active'),
(43, 'Tê giác trong ngàn xanh', '45000', '36000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '164', '185', 'Van_hoc_Viet_Nam', 'Active'),
(44, 'Người thủy thủ già trên hòn đảo lưu đày', '65000', '52000', '20', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '272', '295', 'Van_hoc_Viet_Nam', 'Active'),
(45, 'Cuộc truy tầm kho vũ khí', '50000', '45000', '10', 'truyện lẻ', 'Đoàn Giỏi', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '200', '215', 'Van_hoc_Viet_Nam', 'Active'),
(46, 'Từ những ruộng rau ở nông trại Cúc Cu', '199000', '179100', '10', 'Dy Duyên, Đốm Đốm  ', 'Nhi đồng (6 – 11)', '18x25 cm', '208', '515', '515', 'Van_hoc_Viet_Nam', 'Active'),
(47, 'Tuổi thơ dữ dội - Tập 2', '80000', '64000', '20', '2', 'Phùng Quán', 'Thiếu niên (11 – 15)', '13.5x20.5 cm', '400', '420', 'Van_hoc_Viet_Nam', 'Active'),
(48, 'Tuổi thơ dữ dội - Tập 1', '80000', '72000', '10', '1', 'Phùng Quán', 'Thiếu niên (11 – 15)', '13.5x20.5 cm', '400', '420', 'Van_hoc_Viet_Nam', 'Active'),
(49, 'Thơ hay viết cho thiếu nhi - Góc sân và khoảng trời', '60000', '54000', '10', 'truyện lẻ', 'Trần Đăng Khoa', 'Nhi đồng (6 – 11)', '18.5x20.5 cm', '68', '155', 'Van_hoc_Viet_Nam', 'Active'),
(50, 'Cái Tết của Mèo Con', '60000', '54000', '10', 'truyện lẻ', 'Ngô Mạnh Lân, Nguyễn Đình Thi', 'Nhi đồng (6 – 11)', '17x24 cm', '64', '160', 'Van_hoc_Viet_Nam', 'Active'),
(51, 'Cây mận ngọt nhất Trái Đất từng đến vịnh Hạ Long', '46000', '41400', '10', 'truyện lẻ', 'Tiểu Phong', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '152', '180', 'Van_hoc_Viet_Nam', 'Active'),
(52, 'Tiếng sáo Gà Lôi', '60000', '54000', '10', 'truyện lẻ', 'Hữu Vi', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '208', '240', 'Van_hoc_Viet_Nam', 'Active'),
(53, 'Cậu bé Tròn Xoe và con ma thích ăn gà rán', '36000', '32400', '10', 'truyện lẻ', 'Mộc An', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '108', '135', 'Van_hoc_Viet_Nam', 'Active'),
(54, 'Người thầy một nửa ma', '46000', '36800', '20', 'truyện lẻ', 'Mộc An', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '156', '185', 'Van_hoc_Viet_Nam', 'Active'),
(55, 'Mùa tiểu học cuối cùng', '60000', '54000', '10', 'truyện lẻ', 'Lê Văn Nghĩa', 'Mọi lứa tuổi', '13.5x20.5 cm', '224', '235', 'Van_hoc_Viet_Nam', 'Active'),
(56, 'Bầu trời trong quả trứng', '60000', '54000', '10', 'truyện lẻ', 'Xuân Quỳnh', 'Nhi đồng (6 – 11)', '18.5x20.5 cm', '72', '160', 'Van_hoc_Viet_Nam', 'Active'),
(57, 'Cho mùa xuân ở lại', '60000', '54000', '10', 'truyện lẻ', 'Nguyễn Minh Ngọc', 'Nhi đồng (6-11 tuổi)', '14,5x20,5 cm', '184', '215', 'Van_hoc_Viet_Nam', 'Active'),
(58, 'Mũ rơm đi học', '80000', '72000', '10', 'truyện lẻ', 'Vũ Công Chiến', 'Thiếu niên (11 – 15 tuổi)', '13x20,5 cm', '272', '280', 'Van_hoc_Viet_Nam', 'Active'),
(59, 'Đất nước ngàn năm - Tập 2', '80000', '72000', '10', '2', 'Nhiều tác giả', 'Thiếu niên (11 – 15 tuổi), Tuổi mới lớn (15 – 18 tuổi), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '248', '285', 'Van_hoc_Viet_Nam', 'Active'),
(60, 'Đất nước ngàn năm - Tập 1', '80000', '72000', '10', '1', 'Nhiều tác giả', 'Thiếu niên (11 – 15 tuổi), Tuổi mới lớn (15 – 18 tuổi), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '260', '295', 'Van_hoc_Viet_Nam', 'Active'),
(61, 'Trang trại cuối rừng', '75000', '60000', '20', 'truyện lẻ', 'Phạm Công Luận', 'Thiếu niên (11 – 15)', '13x20,5 cm', '108', '170', 'Van_hoc_Viet_Nam', 'Active'),
(62, 'Xóm thiên đường', '75000', '60000', '20', 'truyện lẻ', 'Phạm Công Luận', 'Thiếu niên (11 – 15)', '13x20,5 cm', '108', '170', 'Van_hoc_Viet_Nam', 'Active'),
(63, 'Things you use to fill a hole', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'Van_hoc_Viet_Nam', 'Active'),
(64, 'Những thứ bạn dùng để lấp một cái hố', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'Van_hoc_Viet_Nam', 'Active'),
(65, 'Tủ sách tuổi thần tiên - Con Cáo Lửa', '40000', '36000', '10', 'truyện lẻ', 'Phạm Thanh Thúy', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '120', '150', 'Van_hoc_Viet_Nam', 'Active'),
(66, 'Cỏ trong rào bót', '25000', '20000', '20', 'truyện lẻ', 'Khổng Minh Dụ', 'Nhi đồng (6 – 11)', '13x19 cm', '100', '105', 'Van_hoc_Viet_Nam', 'Active'),
(67, 'Gia đình ong', '55000', '44000', '20', 'truyện lẻ', 'Anja Mugerli', 'Tuổi trưởng thành (trên 18 tuổi)', '13,5x20,5 cm', '164', '180', 'Van_hoc_Viet_Nam', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `wings_book`
--

CREATE TABLE `wings_book` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `gia_goc` varchar(500) NOT NULL,
  `gia` varchar(500) NOT NULL,
  `giam_gia` varchar(500) NOT NULL,
  `tap` varchar(500) NOT NULL,
  `tac_gia` varchar(500) NOT NULL,
  `doi_tuong` varchar(500) NOT NULL,
  `khuon_kho` varchar(500) NOT NULL,
  `so_trang` varchar(500) NOT NULL,
  `trong_luong` varchar(500) NOT NULL,
  `Page` varchar(500) NOT NULL,
  `Status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wings_book`
--

INSERT INTO `wings_book` (`id`, `name`, `gia_goc`, `gia`, `giam_gia`, `tap`, `tac_gia`, `doi_tuong`, `khuon_kho`, `so_trang`, `trong_luong`, `Page`, `Status`) VALUES
(160, 'Trị liệu nghệ thuật - Giải phóng cảm xúc qua nghệ thuật', '130000', '104000', '20', 'truyện lẻ', 'Nhóm Viết Chữa Lành', 'Tuổi trưởng thành (trên 18 tuổi)', '14.5x20.5 cm', '244', '325', 'Wings_book', 'Active'),
(161, 'Sơn hải kinh (Tặng kèm Bookmark)', '380000', '342000', '10', 'truyện lẻ', 'Sam Trạch, Lương Siêu', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '16x22 cm', '432', '935', 'Wings_book', 'Active'),
(162, 'Bút chì đỏ, Lockdown xứ người & Tiệm thuê truyện', '50000', '45000', '10', 'truyện lẻ', 'Thư Cao, Nguyên Trần, Ngọc Anh, Nhiên Khang', 'Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '92ĐT+20M', '160', 'Wings_book', 'Active'),
(163, 'Bài văn về trứng vịt lộn - Ma mère vend des baluts (Song ngữ Việt – Pháp)', '50000', '45000', '10', 'truyện lẻ', 'Khoan', 'Tuổi mới lớn (15 – 18)', '14,5x20,5 cm', '112', '160', 'Wings_book', 'Active'),
(164, 'Thiên sứ nhà bên (Light Novel)', '95000', '76000', '20', 'truyện lẻ', 'Saekisan, Hanekoto', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '328', '330', 'Wings_book', 'Active'),
(165, 'Thiên sứ nhà bên (Manga)', '50000', '45000', '10', 'truyện lẻ', 'Saekisan, Hanekoto, Wan Shibata, Suzu Yuki', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '194', '220', 'Wings_book', 'Active'),
(166, 'Kujima hót, cả nhà véo von - Tập 5 (Tặng Shikishi)', '40000', '36000', '10', 'truyện lẻ', 'Akira Konno', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'Wings_book', 'Active'),
(167, 'Thị trấn mèo (Manga)', '68000', '61200', '10', 'truyện lẻ', 'Nekomaki (ms-work)', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '176', '195', 'Wings_book', 'Active'),
(168, 'Chúa tể bóng tối (Manga)​​​​​​​ - Tập 10 (Tặng kèm Postcard + Photostrip)', '40000', '36000', '10', '10', 'Daisuke Aizawa, Touzai, Anri Sakano', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '165', 'Wings_book', 'Active'),
(169, 'Arya bàn bên thỉnh thoảng lại trêu ghẹo tôi bằng tiếng Nga - Tập 4.5', '95000', '76000', '20', '4.5', 'Sunsunsun, Momoco', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '392', '395', 'Wings_book', 'Active'),
(170, 'Arya bàn bên thỉnh thoảng lại trêu ghẹo tôi bằng tiếng Nga - Tập 4', '95000', '76000', '20', '4', 'Sunsunsun, Momoco', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '412', '420', 'Wings_book', 'Active'),
(171, 'Arya bàn bên thỉnh thoảng lại trêu ghẹo tôi bằng tiếng Nga - Tập 2', '95000', '76000', '20', '2', 'Sunsunsun, Momoco', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '336', '315', 'Wings_book', 'Active'),
(172, 'Đàn chị hay xấu hổ', '38000', '34200', '10', 'truyện lẻ', 'Makoto Kudo', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '170', 'Wings_book', 'Active'),
(173, 'Dược sư tự sự (Manga) - Tập 13', '127000', '63500', '50', '13', 'Natsu Hyuuga, Touco Shino, Itsuki Nanao, Nekokurage', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '180', '200', 'Wings_book', 'Active'),
(174, 'Dược sư tự sự (Manga) (Tặng kèm Standee Ivory)', '47000', '42300', '10', 'truyện lẻ', 'Natsu Hyuuga, Touco Shino, Itsuki Nanao, Nekokurage', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '178', '200', 'Wings_book', 'Active'),
(175, 'Cách yêu thương - Cẩm nang về tâm tình và mối quan hệ cho mọi người', '112000', '89600', '20', 'truyện lẻ', 'Alex Norris', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '224', '310', 'Wings_book', 'Active'),
(176, 'Cô nàng Shimotsuki trót phải lòng nhân vật nền - Tập 5', '115000', '92000', '20', '5', 'Kagami Yagami, Roha', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '300', '330', 'Wings_book', 'Active'),
(177, 'Kujima hót, cả nhà véo von - Tập 4 (Tặng Lót Ly)', '40000', '32000', '20', '4', 'Akira Konno', 'Tuổi mới lớn (15 – 18),  Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'Wings_book', 'Active'),
(178, 'Kujima hót, cả nhà véo von - Tập 3 (Tặng Mini-Card)', '40000', '36000', '10', '3', 'Akira Konno', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'Wings_book', 'Active'),
(179, 'Hai thằng này nhìn cứ nghi nghi', '35000', '31500', '10', 'truyện lẻ', 'Mayo Onizawa', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '164', '265', 'Wings_book', 'Active'),
(180, 'Hội những người thích ở nhà', '80000', '72000', '10', 'truyện lẻ', 'Chiaki Ida', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '14,5x20,5 cm', '120', '265', 'Wings_book', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `accountadmin`
--
ALTER TABLE `accountadmin`
  ADD PRIMARY KEY (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `don_dat_hang`
--
ALTER TABLE `don_dat_hang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kien_thuc_khoa_hoc`
--
ALTER TABLE `kien_thuc_khoa_hoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lich_su_truyen_thong`
--
ALTER TABLE `lich_su_truyen_thong`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tat_ca_san_pham`
--
ALTER TABLE `tat_ca_san_pham`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truyen_tranh`
--
ALTER TABLE `truyen_tranh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `van_hoc_nuoc_ngoai`
--
ALTER TABLE `van_hoc_nuoc_ngoai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `van_hoc_viet_nam`
--
ALTER TABLE `van_hoc_viet_nam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wings_book`
--
ALTER TABLE `wings_book`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `don_dat_hang`
--
ALTER TABLE `don_dat_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `kien_thuc_khoa_hoc`
--
ALTER TABLE `kien_thuc_khoa_hoc`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `lich_su_truyen_thong`
--
ALTER TABLE `lich_su_truyen_thong`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `tat_ca_san_pham`
--
ALTER TABLE `tat_ca_san_pham`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `truyen_tranh`
--
ALTER TABLE `truyen_tranh`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `van_hoc_nuoc_ngoai`
--
ALTER TABLE `van_hoc_nuoc_ngoai`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `van_hoc_viet_nam`
--
ALTER TABLE `van_hoc_viet_nam`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `wings_book`
--
ALTER TABLE `wings_book`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
