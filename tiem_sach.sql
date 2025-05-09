-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 05:30 AM
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
  `id` int(11) NOT NULL,
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

INSERT INTO `account` (`id`, `name`, `phone`, `email`, `birthdate`, `password`, `isStudent`) VALUES
(1, 'Nguyễn Văn Avádasd', '123456789123', '123aa@example.coma', '2000-01-01', '$2y$10$6JTR3vy.9ymG650SrSXq7.HQqTl2UsSe754mXTBg.MZ2CrySXHclS', 'on'),
(2, '123', '1231', '1234561@gmail.com', '2025-05-07', '$2y$10$T2ymOkpyDzwpJwBnFyx32uZxfIXugyW7dWWSdTYBvTOqqfsVY1hw.', 'on'),
(3, 'Hoàng Thanh Chí Bảo123', '0368287072', 'hoangbao27092004@gmail.com', '2000-01-01', '$2y$10$.1qbZORv/V4Z364Jg6da8.jKi4Fw1nl8gqqx66SZ4aSsX8W775qvO', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `accountadmin`
--

CREATE TABLE `accountadmin` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `birthdate` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accountadmin`
--

INSERT INTO `accountadmin` (`id`, `name`, `phone`, `email`, `birthdate`, `password`) VALUES
(1, '1234', '1234', 'hoangbao270904@gmail.com', '2025-05-13', '$2y$10$UrWILHE5W/LNNdXYglhtCO.i/BZFtaJ/QycbYCiVMtpZPRQe7FU3m');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `aut_id` int(11) NOT NULL,
  `aut_name` varchar(50) NOT NULL,
  `aut_birthday` date DEFAULT NULL,
  `aut_img` varchar(255) DEFAULT NULL,
  `aut_desc` varchar(1000) DEFAULT NULL,
  `dead` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`aut_id`, `aut_name`, `aut_birthday`, `aut_img`, `aut_desc`, `dead`) VALUES
(1, 'Miyazaki Hayao', '1950-08-17', 'img/authors/vdlh.jpg', NULL, NULL),
(2, 'Eiichiro Oda', '1975-01-01', 'img/authors/oda.jpg', NULL, NULL),
(3, 'Masashi Kishimoto', '1974-11-08', 'img/authors/naruto.jpg', NULL, NULL),
(4, 'Horikoshi Kohei', '1980-08-12', 'img/authors/myhero.jpg', NULL, NULL),
(5, 'Fujiko F. Fujio', '1934-03-10', 'img/authors/dorae.jpg', NULL, '2022-04-07'),
(6, 'Isayama Hajime', '1986-08-29', 'img/authors/attackontitan.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookofaut`
--

CREATE TABLE `bookofaut` (
  `aut_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Name`) VALUES
(1, 'Hoạt động'),
(2, 'Sự kiện'),
(3, 'Điểm sách'),
(4, 'Sách giả - Sách lậu'),
(5, 'Lịch phát hành sách định kỳ');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `ID` int(11) NOT NULL,
  `Content` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `NewsID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`ID`, `Content`, `CreatedAt`, `NewsID`, `UserID`) VALUES
(2, 'Bình luận 1.2', '2025-04-30 15:41:00', 1, 2),
(3, 'Bình luận 1.3', '2025-04-30 15:41:10', 1, 3),
(4, 'Bình luận mới', '2025-05-06 06:21:11', 12, 2),
(5, 'Bình luận mới', '2025-05-06 06:21:49', 12, 4),
(7, 'Bình luận reply mới', '2025-05-06 07:14:21', 1, 2),
(19, 'bình luận mới', '2025-05-06 12:22:50', 1, 1),
(21, 'hi', '2025-05-06 12:24:02', 1, 1),
(23, 'hello', '2025-05-06 12:25:44', 1, 1),
(24, 'xóa thử', '2025-05-06 12:26:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `commentlike`
--

CREATE TABLE `commentlike` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commentlike`
--

INSERT INTO `commentlike` (`UserID`, `CommentID`) VALUES
(1, 2),
(1, 3),
(1, 7),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `commentreply`
--

CREATE TABLE `commentreply` (
  `CommentID` int(11) NOT NULL,
  `ParrentCommentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commentreply`
--

INSERT INTO `commentreply` (`CommentID`, `ParrentCommentID`) VALUES
(7, 3),
(23, 3);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ct_id` int(11) NOT NULL,
  `ct_name` varchar(100) NOT NULL,
  `ct_email` varchar(100) NOT NULL,
  `ct_title` varchar(100) NOT NULL,
  `ct_content` varchar(2000) NOT NULL,
  `ct_time` datetime NOT NULL,
  `ct_is_read` tinyint(1) NOT NULL,
  `ct_is_responsed` tinyint(1) NOT NULL
) ;

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
(1, '1234', '1234@gmail.com', '1234', '1234', 'Tỉnh Hưng Yên', 'Huyện Yên Mỹ', 'Xã Yên Phú', '349700', '{id: 177(số lượng: 1),id: 178(số lượng: 1),id: 172(số lượng: 1),id: 176(số lượng: 1),id: 176(số lượng: 1),id: 173(số lượng: 1)}', 'Đã giao');

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
(10, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương yêu nước', '20000', '18000', '10', 'truyện lẻ', 'Phạm Văn Hòa ', 'Thiếu niên (11 – 15)', '13x19 cm', '76', '95', 'tat_ca_san_pham', 'Active', '9'),
(33, 'Ngàn năm sử Việt – Nhà Nguyễn – Bùi Viện một tấm lòng', '30000', '27000', '10', 'truyện lẻ', 'Phan Trần Chúc', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '96', '120', 'tat_ca_san_pham', 'Active', '1'),
(173, 'Dược sư tự sự (Manga) - Tập 13', '127000', '63500', '50', '13', 'Natsu Hyuuga, Touco Shino, Itsuki Nanao, Nekokurage', 'Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '180', '200', 'tat_ca_san_pham', 'Active', '9'),
(175, 'Cách yêu thương - Cẩm nang về tâm tình và mối quan hệ cho mọi người', '112000', '89600', '20', 'truyện lẻ', 'Alex Norris', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '224', '310', 'tat_ca_san_pham', 'Active', '9');

-- --------------------------------------------------------

--
-- Table structure for table `generalinfo`
--

CREATE TABLE `generalinfo` (
  `id` int(11) NOT NULL,
  `main_address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `company_inter_name` varchar(200) NOT NULL,
  `agency` varchar(200) NOT NULL,
  `established_date` date NOT NULL,
  `phone` varchar(50) NOT NULL,
  `director` varchar(100) NOT NULL,
  `license` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `generalinfo`
--

INSERT INTO `generalinfo` (`id`, `main_address`, `email`, `company_name`, `company_inter_name`, `agency`, `established_date`, `phone`, `director`, `license`) VALUES
(1, 'Đường sách Nguyễn Văn Bình, Quận 1, TP.HCM', 'huyen.tran170704@hcmut.edu.vn', 'Nhà xuất bản Kim Đồng', 'Kim Dong Publishing House', 'Trung ương Đoàn TNCS Hồ Chí Minh', '1957-06-17', '028-3829-3180', 'Bùi Tuấn Nghĩa', '517/GP-BTTTT ngày 6/10/2015 của Bộ Thông tin và Truyền thông');

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
(117, 'Vòng quanh thế giới - Argentina', '12000', '10800', '10', 'truyện lẻ', 'Nguyễn Hào, Minh Tuấn', 'Nhi đồng (6 – 11)', '18.5x18.5 cm', '16', '60', 'Kien_thuc_khoa_hoc', 'Active');

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
(28, 'Ngàn năm sử Việt – Nhà Nguyễn – Nguyễn Trường Tộ - Nhà tư tưởng cách tân', '75000', '60000', '20', 'truyện lẻ', 'Hoàng Thanh Đạm', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '308', '325', 'Lich_su_truyen_thong', 'Active'),
(29, 'Ngàn năm sử Việt – Nhà Nguyễn – Người đào kênh Vĩnh Tế', '40000', '36000', '10', 'truyện lẻ', 'Phan Khánh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '144', '165', 'Lich_su_truyen_thong', 'Active'),
(30, 'Ngàn năm sử Việt – Nhà Nguyễn – Đất mặn đất ngọt', '50000', '45000', '10', 'truyện lẻ', 'Nghiêm Đa Văn', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '180', '200', 'Lich_su_truyen_thong', 'Active'),
(31, 'Ngàn năm sử Việt – Nhà Lê Trung Hưng – Quân sư Đào Duy Từ', '70000', '63000', '10', 'truyện lẻ', 'Vũ Ngọc Tiến', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '272', '295', 'Lich_su_truyen_thong', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `time_open` time NOT NULL,
  `time_close` time NOT NULL,
  `phone` varchar(20) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_address` varchar(100) NOT NULL,
  `main_branch` tinyint(1) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`time_open`, `time_close`, `phone`, `branch_name`, `branch_address`, `main_branch`, `location_id`) VALUES
('08:00:00', '21:00:00', '0909000111', 'Chi nhánh Nguyễn Văn Bình', 'Đường sách Nguyễn Văn Bình, Quận 1, TP.HCM', 1, 1),
('08:30:00', '21:00:00', '0909123456', 'Chi nhánh Phan Văn Trị', '104 Phan Văn Trị, Phường 10, Gò Vấp, TP.HCM', 0, 2),
('09:00:00', '18:00:00', '0911222333', 'Chi nhánh Cộng Hòa', '415 Cộng Hòa, Phường 15, Tân Bình, TP.HCM', 0, 3),
('08:00:00', '20:00:00', '0988111222', 'Chi nhánh Vincom Bà Triệu', '191 Bà Triệu, Hai Bà Trưng, Hà Nội', 0, 4),
('09:00:00', '19:30:00', '0977666555', 'Chi nhánh Trần Thái Tông', '139 Trần Thái Tông, Cầu Giấy, Hà Nội', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Text` text DEFAULT NULL,
  `Thumbnail` varchar(500) DEFAULT NULL,
  `Status` enum('published','hidden','draft') NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `WrittenByAdminID` int(11) NOT NULL,
  `WrittenDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`ID`, `Title`, `Text`, `Thumbnail`, `Status`, `CategoryID`, `WrittenByAdminID`, `WrittenDate`) VALUES
(1, 'Một kỉ niệm khó quên về bà Nguyễn Thị Bình', 'Trong không khí kỉ niệm 50 năm ngày đất nước thống nhất, trên khắp cả nước, muôn người dân đất Việt cùng hân hoan chào đón ngày lịch sử trọng đại này. Các chương trình thời sự liên tục chiếu lại những thước phim về những trận đánh lớn, về những người lính trẻ đã hòa máu thịt mình vào Đất Mẹ cho ngày độc lập hôm nay, rồi những nhân chứng lịch sử đã từng lăn lộn ngoài trận mạc kể về đồng đội đã không tiếc tuổi xanh, quyết không lùi bước trước bom đạn của kẻ thù. Tôi không sao quên được lời một cựu chiến binh chia sẻ: Hòa Bình giá đắt lắm, phải cố mà giữ lấy Hòa Bình. Lời nói mộc mạc của người cựu chiến binh như được rút ra từ dòng máu con tim, nghe mà thấm thía mà tự hào.\nRồi hình ảnh bà Nguyễn Thị Bình ký văn kiện Hiệp định Paris năm 1973 buộc Mĩ chấm dứt chiến tranh ở Việt Nam xuất hiện liên tục. Bà đã trở thành huyền thoại, là nhà ngoại giao tài ba khiến cộng đồng quốc tế phải nể phục. Nhìn người phụ nữ dịu dàng nhưng lại vô cùng mạnh mẽ quyết đoán ấy, tôi bỗng nhớ tới một kỉ niệm đẹp khó quên với bà.\nhttps://file.hstatic.net/200000343865/file/2845_5b496d621df39d757f4590b1e904c829_1c5a86c1d7274ae2822385ebc4ca1005_grande.jpg\nĐó là vào những năm cuối của thế kỉ 20, Nhà xuất bản Kim Đồng bắt đầu xây dựng một số tủ sách lớn như: Tủ sách Danh nhân Việt Nam, Tủ sách Anh hùng liệt sĩ, Tủ sách Vàng, Thơ với tuổi thơ, Tủ sách Tranh truyện dân gian Việt Nam... Trong hơn 60 bộ sách mà Nhà xuất bản Kim Đồng xây dựng, Tủ sách Danh nhân Việt Nam nổi lên như một viên ngọc sáng, nhằm tri ân những bậc hiền tài đã đóng góp cho đất nước trên nhiều lĩnh vực như văn hóa, chính trị, kinh tế, ngoại giao, xây dựng và bảo vệ tổ quốc...\nChúng tôi cảm thấy thật thiếu sót nếu trong Tủ sách lại vắng bóng gương mặt người phụ nữ tài ba Nguyễn Thị Bình. Chính từ ý tưởng ấy mà ông Nguyễn Thắng Vu, nguyên giám đốc Nhà xuất bản Kim Đồng đã liên hệ, đặt lịch được gặp bà.\nVậy là tôi được theo chân ông Nguyễn Thắng Vu đến gặp bà Nguyễn Thị Bình mà bấy lâu tôi chỉ được biết qua sách báo. Ngôi nhà bà sinh sống cũng thật giản dị. Bà nói, nước ta chỉ có một nhà làm sách cho trẻ em, đấy là Nhà xuất bản Kim Đồng, công việc thật vinh quang nhưng trách nhiệm thì nặng nề lắm. Rồi bà hỏi hiện nay trẻ em ta thích đọc loại sách nào nhất, sách xuất bản hàng năm có đủ cho các em đọc không, rồi có cách gì để trẻ em miền núi cũng được tiếp cận sách như miền xuôi.\nKhi nghe ông Nguyễn Thắng Vu trả lời từng câu hỏi, bà mỉm cười hiền hậu nói: “Tôi thấy Nhà xuất bản Kim Đồng làm tốt đấy, nội dung sách như một món quà lành mạnh góp phần hình thành nhân cách cho các cháu, trách nhiệm lớn lắm đó!” \nKhi câu chuyện đã trở nên thân tình, Giám đốc Nguyễn Thắng Vu mới trình bày rõ mong muốn của nhà xuất bản là có một cuốn sách viết về bà trong Tủ sách Danh nhân Việt Nam. Ông Nguyễn Thắng Vu dứt lời, bà Bình trầm ngâm một lúc rồi nói: “Xin cảm ơn nhã ý của Nhà xuất bản Kim Đồng, nhưng tôi nghĩ đất nước mình còn nhiều người tài giỏi lắm, hãy viết về họ trước đi, còn tôi, tôi xin phép thư thư.” \nÔi một con người huyền thoại, bản lĩnh kiên cường trước truyền thông quốc tế mà sao khi nói về bản thân lại khiêm nhường là vậy! Việc không thành nhưng tôi đã có một kỉ niệm đẹp và thật sự hạnh phúc khi được trực tiếp gặp người phụ nữ đã trở thành huyền thoại của Việt Nam trên mặt trận ngoại giao trong cuộc kháng chiến trường kì của dân tộc. ', 'https://file.hstatic.net/200000343865/file/2845_5b496d621df39d757f4590b1e904c829_1c5a86c1d7274ae2822385ebc4ca1005_grande.jpg', 'published', 1, 1, '2025-04-30 11:44:19'),
(2, 'TRIỂN LÃM THƠ – TRANH CÙNG VIỆT NAM', 'Triển lãm thơ – tranh Cùng Việt Nam là không gian nghệ thuật đặc biệt, bước ra từ tập thơ cùng tên mang đầy trăn trở và khát vọng hòa bình.\r\n                                                                                                                                   Cùng Việt Nam tập hợp các tác phẩm lên tiếng phản đối cuộc chiến tranh phi nghĩa tại Việt Nam của các nhà thơ Tây Ban Nha, thể hiện sự đoàn kết sâu sắc với nhân dân Việt Nam trong những năm tháng khốc liệt nhất.\r\n\r\nSau hơn nửa thế kỷ, 6 họa sĩ Việt Nam và 6 họa sĩ Tây Ban Nha đã bắt tay thực hiện các tác phẩm minh họa mới cho tập thơ này, tạo nên một cuộc đối thoại nghệ thuật xuyên thời gian và không gian thể hiện sự cộng hưởng sâu sắc giữa thi ca và hội họa trong việc truyền tải thông điệp hòa bình, phản chiến và tình đoàn kết nhân loại.\r\n\r\nSự cộng tác giữa các nghệ sĩ hai bờ đại dương, còn là nhịp cầu kết nối quá khứ, hiện tại và tương lai giữa hai dân tộc Việt Nam – Tây Ban Nha trong tinh thần hữu nghị và đoàn kết.\r\n\r\nDù đến từ những nền văn hóa khác nhau, phong cách khác nhau, các họa sĩ đã thể hiện sự đồng cảm, sẻ chia và nỗ lực tái hiện tinh thần của những bài thơ từng bị kiểm duyệt, từng bị quên lãng, được sống lại trong ánh sáng và màu sắc của ngày hôm nay.\r\n\r\nNhân kỉ niệm 50 năm Giải phóng miền Nam thống nhất đất nước (30.4.1975-30.4.2025), Triển lãm được thực hiện trong khuôn khổ buổi ra mắt tập thơ Cùng Việt Nam và tiếp tục được tổ chức tại trụ sở Nhà xuất bản Kim Đồng, 55 Quang Trung, Hai Bà Trưng, Hà Nội từ ngày 30/4 đến ngày 4/5/2025 cho công chúng.', 'https://file.hstatic.net/200000343865/file/rien_lam_cvn_banner_fb_post_1800x1200_da22e2a6e34144efb7d6e9d0123d4cdb_grande.jpg', 'published', 1, 2, '2025-04-30 14:12:19'),
(3, 'THƯ MỜI BÁO GIÁ ', '\r\n        Kính gửi: Các đơn vị cung cấp dịch vụ Cho thuê phần mềm \r\nQuản trị bán hàng đa kênh\r\n\r\nNhà xuất bản Kim Đồng xin gửi Quý Công ty lời cảm ơn và lời chào trân trọng!\r\nHiện nay Nhà xuất bản chúng tôi đang có kế hoạch đầu tư mua sắm Phần mềm Quản trị bán hàng đa kênh nhằm phục vụ công tác Quản trị bán hàng đa kênh.\r\nNếu quý Công ty quan tâm, chúng tôi kính mời quý Công ty tham gia báo giá, chi tiết cụ thể như sau:\r\nI. Thông tin của đơn vị yêu cầu báo giá \r\n1. Đơn vị yêu cầu báo giá: Nhà xuất bản Kim Đồng: Số 55, đường Quang Trung, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội. \r\n2. Thông tin liên hệ của người chịu trách nhiệm tiếp nhận báo giá: Ông Trương Việt Anh – Điện thoại: 0913555451 - Văn Phòng – Nhà xuất bản Kim Đồng. \r\n3. Cách thức tiếp nhận báo giá: Gửi báo giá theo đường bưu điện hoặc trực tiếp theo địa chỉ: Văn phòng - Nhà xuất bản Kim Đồng: Số 55,Quang Trung, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội. \r\nNgười nhận báo giá trực tiếp: Ông Trương Việt Anh - ĐT: 0913555451\r\n4. Thời hạn tiếp nhận báo giá: Từ 14 giờ 00 ngày 23 tháng 04 năm 2025 đến trước 14 giờ 00 ngày 29 tháng 04 năm 2025. \r\nCác báo giá nhận được sau thời điểm nêu trên sẽ không được xem xét. \r\n5. Thời hạn có hiệu lực của báo giá: Tối thiểu 90 ngày, kể từ ngày báo giá. \r\nII. Nội dung yêu cầu báo giá \r\n1. Danh mục dịch vụ: Cho thuê Phần mềm Quản trị bán hàng đa kênh tại Nhà xuất bản Kim Đồng. \r\n(Phần mềm / Cơ sở dữ liệu và yêu cầu tính năng kỹ thuật cơ bản hoặc tương đương về chức năng, tiện ích chi tiết tại phụ lục kèm theo. Các đơn vị vui lòng chào giá theo đúng nội dung và có tài liệu giới thiệu tóm tắt về phần mềm/ cơ sở dữ liệu báo giá. Giá phần mềm/ cơ sở dữ liệu là giá đã bao gồm các loại thuế, phí, lệ phí, chi phí đào tạo, chuyển giao công nghệ, bảo hành bảo trì và các chi phí khác) \r\n2. Địa điểm thực hiện cung cấp dịch vụ: Nhà xuất bản Kim Đồng, 55 Quang Trung, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội. \r\n3. Thời gian thực hiện: 1 năm (12 tháng) kể từ ngày hợp đồng có hiệu lực. \r\n4. Hồ sơ báo giá gồm: \r\n- Hồ sơ năng lực, các tài liệu chứng minh đủ điều kiện cung cấp phần mềm theo quy định.\r\n- Báo giá được ký, đóng dấu người có thẩm quyền và đóng dấu giáp lai (trong trường hợp báo giá có nhiều trang); và chịu trách nhiệm pháp lý về tính chính xác, thông tin phù hợp không vi phạm tính cạnh tranh về giá theo quy định hiện hành. \r\n- Báo giá tách rõ 2 phần:\r\n    + Chi phí chỉnh sửa phần mềm theo đặc thù (nếu có)\r\n    + Chi phí cho thuê phần mềm trong 1 năm.\r\n- Phiên bản dùng thử (Phần mềm Demo)\r\n- Giấy chứng nhận đăng ký kinh doanh do cấp có thẩm quyền cấp, đang có hiệu lực. \r\nNhà xuất bản Kim Đồng trân trọng kính mời các đơn vị có chức năng, năng lực quan tâm gửi báo giá và các tài liệu liên quan. \r\n\r\nTrân trọng thông báo.', 'https://file.hstatic.net/200000343865/article/thong_bao_4315dec2fefc4e9185b3340b037deeab_large.jpg', 'published', 1, 3, '2025-04-30 14:16:52'),
(4, 'Kết nối tri thức giáo dục và hình thành nhân cách thế hệ trẻ Việt - Trung', '        Trong khuôn khổ Gặp gỡ hữu nghị thanh niên Việt Nam – Trung Quốc lần thứ 24 năm 2025, đoàn đại biểu T.Ư Đoàn TNCS Trung Quốc thăm và làm việc với Nhà xuất bản Kim Đồng (thuộc T.Ư Đoàn TNCS Hồ Chí Minh). Nhiều ý kiến chia sẻ mở ra cơ hội thúc đẩy giao lưu hợp tác về công tác xuất bản các ấn phẩm dành cho thanh thiếu nhi hai nước.\r\nTrong khuôn khổ Gặp gỡ hữu nghị thanh niên Việt Nam – Trung Quốc lần thứ 24 năm 2025, chiều 14/4, tại Hà Nội, đoàn đại biểu T.Ư Đoàn TNCS Trung Quốc thăm và làm việc với Nhà xuất bản Kim Đồng. Cùng dự buổi làm việc có anh Nguyễn Thái An – Ủy viên Ban Thường vụ, Trưởng Ban Tuyên giáo T.Ư Đoàn TNCS Hồ Chí Minh.Đoàn đại biểu T.Ư Đoàn TNCS Trung Quốc có anh Hồng Lượng - Trưởng Ban Tuyên giáo T.Ư Đoàn TNCS Trung Quốc dẫn đầu; đại diện tỉnh thành Đoàn và báo Thanh niên Trung Quốc.\r\n', 'https://file.hstatic.net/200000343865/file/tp-kimdong11-481-343_0d33bf00d3e94cd39337431119ff0824_grande.jpg', 'published', 2, 3, '2025-04-30 14:18:32'),
(6, 'Đoàn đại biểu Cháu ngoan Bác Hồ tỉnh Bình Dương tham quan Nhà xuất bản Kim Đồng – Ngôi nhà tuổi thơ Việt Nam', 'Tiếp nối hành trình “Cháu ngoan Bác Hồ làm nghìn việc tốt”, ngày 5/4/2025, Đoàn đại biểu Cháu ngoan Bác Hồ tỉnh Bình Dương đã có chuyến tham quan, giao lưu tại Nhà xuất bản Kim Đồng – nơi gắn bó với bao thế hệ thiếu nhi Việt Nam qua từng trang sách tuổi thơ.\r\nTham dự chương trình có Đ/c Trần Thị Diễm Trinh - Ủy viên Ban Thường vụ Trung ương Đoàn, Tỉnh ủy viên, Bí thư Tỉnh đoàn, Chủ tịch Hội LHTN Việt Nam tỉnh; Đồng chí Lê Tuấn Anh, Ủy viên Ban Chấp hành Trung ương Hội Sinh viên Việt Nam, Phó Bí thư Thường trực Tỉnh đoàn, Chủ tịch Hội Sinh viên Việt Nam, Chủ tịch Hội đồng Đội tỉnh cùng các đồng chí lãnh đạo các phòng ban đơn vị của Tỉnh. \r\n                                                                                                                                   Tại đây, các đại biểu nhỏ tuổi đã được tìm hiểu lịch sử hình thành và sứ mệnh đặc biệt của Nhà xuất bản Kim Đồng, nghe giới thiệu về những bộ sách nổi bật: truyện tranh thiếu nhi, truyện cổ tích, sách giáo dục nhân cách, sách về Bác Hồ cũng như tìm hiểu quy trình làm sách và giao lưu với các cô chú biên tập viên của Nhà xuất bản. ', 'https://file.hstatic.net/200000343865/article/489484006_1075091784660940_3592676783007847537_n_a3db91780ca14b1f953b66cbf9957fe6_large.jpg', 'published', 1, 1, '2025-05-02 13:03:34'),
(7, 'Chương trình kêu gọi sáng tác “Gặp tôi trong tương lai” và chuỗi sự kiện về quyền tự do khám phá và lựa chọn nghề nghiệp', '“Gặp tôi trong tương lai” được khởi xướng bởi The Initiative of Children’s Book Creative Content (ICBC), với sự đồng hành của ECUE-VGEM và Nhà xuất bản (NXB) Kim Đồng. Chương trình này nhận được hỗ trợ kỹ thuật và tài chính từ Investing in Women (Đầu tư cho Phụ nữ) – một sáng kiến của Chính phủ Australia. Chương trình kêu gọi sáng tác sách tranh thiếu nhi nhằm tạo nhiều nội dung phong phú về quyền tự do khám phá và lựa chọn nghề nghiệp – một chủ đề còn nhiều khoảng trống trong hệ sinh thái xuất bản và giáo dục hiện nay.\r\n                                                                                                                                   Trong bối cảnh những khuôn mẫu giới vẫn có ảnh hưởng sâu sắc đến định hướng nghề nghiệp của trẻ em, chương trình mong muốn nhận được những ý tưởng sáng tác mới mẻ, gần gũi, khơi gợi khả năng tưởng tượng, đam mê và niềm tin của trẻ trong việc lựa chọn nghề nghiệp tương lai, không bị ràng buộc bởi định kiến giới hay hoàn cảnh sống. Các ý tưởng xuất sắc sẽ được lựa chọn để trao cơ hội xuất bản sách cùng Nhà xuất bản Kim Đồng. Các tác phẩm này tập trung hướng tới đối tượng người đọc là trẻ từ 5 đến 11 tuổi, với tiêu chí nội dung sáng tạo, phù hợp độ tuổi và góp phần lan tỏa thông điệp về bình đẳng trong học tập và định hướng nghề nghiệp.\r\nChương trình chào đón mọi công dân Việt Nam không giới hạn độ tuổi, có thể tham gia với tư cách cá nhân hoặc theo nhóm. Người tham gia có cơ hội được phát triển bản thảo, xuất bản tác phẩm với Nhà xuất bản Kim Đồng và lan tỏa đến hệ thống trường học, thư viện, cộng đồng đọc sách thiếu nhi trên toàn quốc.\r\nTrong khuôn khổ chương trình, sẽ có hai workshop cộng đồng được tổ chức tại NXB Kim Đồng, 55 Quang Trung, Hà Nội nhằm tạo kết nối, chia sẻ thông tin, kiến thức và lan toả mạnh mẽ hơn thông điệp tự do lựa chọn nghề nghiệp tới cộng đồng.\r\nWorkshop đầu tiên diễn ra vào ngày 27/4/2025 với tên gọi “Sự đa dạng của nghề nghiệp qua lăng kính sách thiếu nhi” với sự tham gia của các diễn giả trong lĩnh vực sách thiếu nhi và bình đẳng giới. Workshop được thiết kế với mục tiêu tạo cơ hội để cha mẹ, thầy cô giáo, nhà giáo dục, những người chăm sóc trẻ em và cộng đồng nói chung cùng nhau tìm hiểu, chia sẻ và phản ánh những giá trị tiềm năng mà sách thiếu nhi có thể mang lại trong việc khơi dậy sự tò mò và khát khao khám phá nghề nghiệp của trẻ em. Bằng cách cùng nhau trải nghiệm những câu chuyện về sự đa dạng nghề nghiệp, người tham gia sẽ được khơi gợi những suy nghĩ về cách thức các nghề nghiệp được giới thiệu đến trẻ em qua sách thiếu nhi, từ đó tìm hiểu, suy tư, phản biện và hơn hết là đưa ra những ý tưởng mới mẻ để phát triển các câu chuyện, đề tài sáng tác sách thiếu nhi mới mẻ và đa dạng, góp phần mở rộng những hình dung về nghề nghiệp trong xã hội hiện đại. \r\nWorkshop thứ hai diễn ra vào ngày 10/5/2025 có tên “Ghép mảnh những ước mơ thơ ấu” là một không gian sáng tạo dành cho người thực hành sáng tạo và người trẻ từ 18–30 tuổi. Với sự đồng hành của họa sĩ minh họa Trà Nhữ (Thạc sĩ Minh họa – University of the Arts London) và tác giả Phạm Thị Hoài Anh, người tham gia sẽ thực hành phương pháp collage (cắt dán sáng tạo) để kể lại hành trình nghề nghiệp cá nhân qua sách gấp dạng zine hoặc accordion. Workshop không chỉ là hành trình khám phá bản thân, mà còn là bước đệm để người tham gia được truyền cảm hứng và tạo động lực gửi ý tưởng của mình cho chương trình kêu gọi sáng tác “Gặp tôi trong tương lai”. Không gian của workshop cũng sẽ giới thiệu và trưng bày các cuốn sách thiếu nhi về chủ đề nghề nghiệp đa dạng để gợi mở và khích lệ người tham gia cùng khám phá các câu chuyện, các hình thức kể chuyện để truyền tải những thông điệp về nghề nghiệp đến với đối tượng độc giả trẻ em. ', 'https://file.hstatic.net/200000343865/article/open_call_-_gap_toi_trong_tuong_lai__3__ac345ca5e00747a4874fc1995ae529e0_large.jpg', 'published', 2, 2, '2025-05-02 13:05:33'),
(8, 'Chuỗi sự kiện giao lưu giới thiệu sách của NXB Kim Đồng chào mừng Ngày sách và Văn hóa đọc Việt Nam 2025', 'Chào mừng Ngày Sách và Văn hóa đọc Việt Nam lần thứ Tư – 2025, kỉ niệm 50 năm ngày Giải phóng miền Nam, Thống nhất đất nước, với thông điệp: “Đọc sách làm giàu tri thức, nuôi dưỡng khát vọng, thúc đẩy đổi mới, sáng tạo”, NXB Kim Đồng tổ chức chuỗi chương trình giao lưu giới thiệu sách tại Hà Nội và TP Hồ Chí Minh trong suốt tháng Tư.\r\n                                                                                                                                   Mời các bạn cùng theo dõi và tham gia chương trình: \r\n\r\n1.    10:00, 5/4 (thứ Bảy), Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội), Giao lưu: Sử Việt – Từ những cuộc đời - Câu chuyện về những con người đặt nền móng và xây đắp nên nền khoa học hiện đại ở Việt Nam\r\n2.    10:00, 12/4 (thứ Bảy), Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Đọc sách “Bỏ điện thoại xuống nào!” cùng tác giả Bùi Phương Tâm\r\n3.    9:30, 13/4 (Chủ nhật) tại Hội trường NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Giao lưu “Mở trang sách – Chạm vần thơ” với “Trắng mây tóc mẹ” - Giao lưu cùng tác giả Trương Anh Tú. \r\n4.    7:30, 18/4 (thứ Sáu) tại Trường Tiểu học Đông Ngạc (Q. Bắc Từ Liêm, Hà Nội): Giao lưu “Khoa học khắp quanh ta”\r\n5.    10:00, 19/4 (thứ Bảy), Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Đọc sách: Cậu bé Bi Đất - Bụng tròn chứa đầy niềm tin! với tác giả Bôn Đông Huân\r\n6.    15:00, ngày 19/4 (thứ Bảy) tại Sân khấu trung tâm Phố sách Hà Nội (Phố 19/12, Q. Hoàn Kiếm, Hà Nội): Giao lưu “Vang danh nghề cổ” -  Tìm hiểu Cùng khám phá những làng nghề thủ công truyền thống của Việt Nam. Khách mời: tác giả Phương Bùi, Thành Nguyễn, nhóm hoạ sĩ NGART\r\n7.    15:00, ngày 19/4 (thứ Bảy) tại Sảnh E, Thư viện Quốc gia (31 Tràng Thi, Q. Hoàn Kiếm, Hà Nội): Giao lưu: Sử Việt – Từ những cuộc đời - Câu chuyện về những con người đặt nền móng và xây đắp nên nền khoa học hiện đại ở Việt Nam. \r\n8.    9:00, 20/4 (Chủ nhật) tại Sân khấu A Đường sách TP. HCM (Quận 1): Giao lưu: “Hùm Xám và những cuộc phiêu lưu kì thú” cùng tác giả Bùi Tiểu Quyên.\r\n9.    7:30, 21/4 (thứ Hai) tại Trường Tiểu học Lê Hồng Phong (Q. Hà Đông, Hà Nội): Giao lưu “Vang danh nghề cổ” -  Tìm hiểu Cùng khám phá những làng nghề thủ công truyền thống của Việt Nam.\r\n10.    8:00, 21/4 (thứ Hai)    Trường Tiểu học Nguyễn Bỉnh Khiêm (Q. Long Biên, Hà Nội): Giao lưu giới thiệu bộ sách Ngàn năm sử Việt\r\n11.    8:45, 21/4 (thứ Hai) tại Trường THPT Nguyễn Huệ - Bắc Từ Liêm (Hà Nội): Giao lưu Bí kíp quản lí tài chính cá nhân cho bạn trẻ - Giao lưu với chuyên gia tài chính Trần Công Danh. \r\n12.    9:30, 23/4 (thứ Tư) tại Hội trường NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Giao lưu ra mắt sách CÙNG VIỆT NAM: Biểu tượng sống động của tình hữu nghị và đoàn kết Việt Nam – Tây Ban Nha. \r\n13.    10:00, 26/4 (thứ Bảy) tại Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Đọc sách Chị Út Tịch “Người mẹ cầm súng” ', 'https://file.hstatic.net/200000343865/article/timeline_chao_mung_ngay_sach_va_van_hoa_doc_2025_inforgraphic_d213d2d2206e427d9ea4bd110e6400ae_large.png', 'published', 2, 2, '2025-05-02 13:07:05'),
(9, 'Hợp tác văn hóa Việt Nam – Đan Mạch: Mong đợi những bước phát triển mới\r\n', 'Từ khi chính thức thiết lập quan hệ ngoại giao vào năm 1971, Việt Nam và Đan Mạch đã không ngừng thúc đẩy hợp tác trên nhiều lĩnh vực, trong đó văn hóa là một trong những trụ cột quan trọng.\r\n\r\nTrao đổi với phóng viên Đài Tiếng nói Việt Nam, Đại sứ Đan Mạch tại Việt Nam Nicolai Prytz chia sẻ, sự hợp tác giữa Đan Mạch và Việt Nam có lịch sử lâu dài và trên phạm vi rất rộng, trên rất nhiều lĩnh vực, nhất là gần đây rất chú trọng vào chuyển đổi xanh và năng lượng.\r\n\r\nNgài Đại sứ cho biết: \"Đan Mạch cũng hợp tác với Việt Nam trong lĩnh vực y tế, thực phẩm và nông nghiệp. Chúng tôi có sự hợp tác trong lĩnh vực giáo dục, trong lĩnh vực thống kê... Bên cạnh đó, chúng tôi có rất nhiều công ty đến Việt Nam trong những năm gần đây, nơi chúng tôi cũng cố gắng tạo điều kiện thuận lợi cho đối thoại và kinh doanh giữa các công ty Việt Nam và Đan Mạch, các nhà đầu tư hai nước trong mọi lĩnh vực. Ví dụ, ngay tuần tới, tôi sẽ đến Bình Dương tham dự Lễ khánh thành nhà máy Lego. Ý tôi là, mọi thứ đang diễn ra liên tục trong danh mục đầu tư hợp tác của chúng tôi.\"\r\n\r\nTừ khi chính thức thiết lập quan hệ ngoại giao vào năm 1971, Việt Nam và Đan Mạch đã không ngừng thúc đẩy hợp tác trên nhiều lĩnh vực, trong đó văn hóa là một trong những trụ cột quan trọng. Một trong những sáng kiến quan trọng giúp phát triển các hoạt động hợp tác văn hóa giữa hai nước là Quỹ Hợp tác Văn hóa và Phát triển (CDEF), được Đại sứ quán Đan Mạch triển khai từ năm 2006. Quỹ này đã tài trợ hàng trăm dự án nghệ thuật tại Việt Nam, hỗ trợ các nghệ sĩ trẻ, tạo điều kiện để họ giao lưu và học hỏi từ các đồng nghiệp quốc tế. Ngoài ra, còn Dự án Hỗ trợ Văn học Thiếu nhi Việt Nam – Đan Mạch (2006-2015), trong đó Hội Nhà văn Đan Mạch phối hợp với Nhà xuất bản Kim Đồng phát triển văn học thiếu nhi.\r\nTuy nhiên, theo ngài Đại sứ Nicolai Prytz, các hoạt động hợp tác về văn hóa vẫn cần được chú trọng phát triển hơn nữa, để tương xứng với tiềm năng của hai nước: “Về mặt văn hóa, tôi muốn thấy nhiều hoạt động hợp tác hơn. Nhưng đó là một lĩnh vực mà theo quan điểm của tôi, chúng ta chưa ưu tiên đủ. Chúng ta cũng cần nguồn lực cho những hoạt động này. Tôi rất muốn chứng kiến nhiều hơn nữa các hoạt động hợp tác văn hoá được thực hiện. Chúng tôi đang nỗ lực thực hiện điều này. Chúng tôi thực sự đang cố gắng làm bất cứ điều gì có thể. Và chúng tôi có thể làm tốt hơn.”\r\n\r\nCuộc thi và Triển lãm tranh “Đan Mạch trong mắt em” do Đại sứ quán Đan Mạch tại Việt Nam và Hội hữu nghị Việt Nam – Đan Mạch (VIDAFA) tổ chức thường niên, trao giải ngày 02/04 vừa qua, cũng là một trong những hoạt động kết nối, hợp tác văn hóa gắn liền với nâng cao khả năng sáng tạo, ý thức bảo vệ môi trường cho thế hệ trẻ. Cuộc thi nhằm khuyến khích học sinh Việt Nam thể hiện suy nghĩ về môi trường và phát triển bền vững thông qua hội họa.', 'https://file.hstatic.net/200000343865/article/17_7876d79b21654d63910fbcdad379d8fc_large.jpg', 'published', 2, 2, '2025-05-02 13:08:39'),
(12, 'Bài viết mới', '<p>Nội dung có hình <img src=\'http://localhost/BTL_WEB_1/api/uploads/6815a9e41b4a6.png\' /></p>', 'http://localhost/BTL_WEB_1/api/uploads/6815a9e41b4a6.png', 'published', 2, 1, '2025-05-01 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `newsupdatelog`
--

CREATE TABLE `newsupdatelog` (
  `AdminID` int(11) NOT NULL,
  `NewID` int(11) NOT NULL,
  `UpdateAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsupdatelog`
--

INSERT INTO `newsupdatelog` (`AdminID`, `NewID`, `UpdateAt`) VALUES
(1, 1, '2025-04-30 14:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `relatednew`
--

CREATE TABLE `relatednew` (
  `NewID` int(11) NOT NULL,
  `RelatedNewID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relatednew`
--

INSERT INTO `relatednew` (`NewID`, `RelatedNewID`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 1);

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
(33, 'Ngàn năm sử Việt – Nhà Nguyễn – Bùi Viện một tấm lòng', '30000', '27000', '10', 'truyện lẻ', 'Phan Trần Chúc', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '96', '120', 'tat_ca_san_pham', 'Active', 1, '1'),
(175, 'Cách yêu thương - Cẩm nang về tâm tình và mối quan hệ cho mọi người', '112000', '89600', '20', 'truyện lẻ', 'Alex Norris', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '224', '310', 'tat_ca_san_pham', 'Active', 1, '9'),
(177, 'Kujima hót, cả nhà véo von - Tập 4 (Tặng Lót Ly)', '40000', '32000', '20', '4', 'Akira Konno', 'Tuổi mới lớn (15 – 18),  Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', 1, '9');

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
(28, 'Ngàn năm sử Việt – Nhà Nguyễn – Nguyễn Trường Tộ - Nhà tư tưởng cách tân', '75000', '60000', '20', 'truyện lẻ', 'Hoàng Thanh Đạm', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '308', '325', 'tat_ca_san_pham', 'Active', ''),
(29, 'Ngàn năm sử Việt – Nhà Nguyễn – Người đào kênh Vĩnh Tế', '40000', '36000', '10', 'truyện lẻ', 'Phan Khánh', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '144', '165', 'tat_ca_san_pham', 'Active', ''),
(30, 'Ngàn năm sử Việt – Nhà Nguyễn – Đất mặn đất ngọt', '50000', '45000', '10', 'truyện lẻ', 'Nghiêm Đa Văn', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '180', '200', 'tat_ca_san_pham', 'Active', ''),
(31, 'Ngàn năm sử Việt – Nhà Lê Trung Hưng – Quân sư Đào Duy Từ', '70000', '63000', '10', 'truyện lẻ', 'Vũ Ngọc Tiến', 'Thiếu niên (11 – 15)', '13,5x20,5 cm', '272', '295', 'tat_ca_san_pham', 'Active', ''),
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
(62, 'Xóm thiên đường', '75000', '60000', '20', 'truyện lẻ', 'Phạm Công Luận', 'Thiếu niên (11 – 15)', '13x20,5 cm', '108', '170', 'tat_ca_san_pham', 'Active', ''),
(63, 'Things you use to fill a hole', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'tat_ca_san_pham', 'Active', ''),
(64, 'Những thứ bạn dùng để lấp một cái hố', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'tat_ca_san_pham', 'Active', ''),
(65, 'Tủ sách tuổi thần tiên - Con Cáo Lửa', '40000', '36000', '10', 'truyện lẻ', 'Phạm Thanh Thúy', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '120', '150', 'tat_ca_san_pham', 'Active', ''),
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
(176, 'Cô nàng Shimotsuki trót phải lòng nhân vật nền - Tập 5', '115000', '92000', '20', '5', 'Kagami Yagami, Roha', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '300', '330', 'tat_ca_san_pham', 'Active', ''),
(177, 'Kujima hót, cả nhà véo von - Tập 4 (Tặng Lót Ly)', '40000', '32000', '20', '4', 'Akira Konno', 'Tuổi mới lớn (15 – 18),  Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', ''),
(178, 'Kujima hót, cả nhà véo von - Tập 3 (Tặng Mini-Card)', '40000', '36000', '10', '3', 'Akira Konno', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'tat_ca_san_pham', 'Active', ''),
(179, 'Hai thằng này nhìn cứ nghi nghi', '35000', '31500', '10', 'truyện lẻ', 'Mayo Onizawa', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '164', '265', 'tat_ca_san_pham', 'Active', '');

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
(149, 'Truyện cổ tích nổi tiếng Song ngữ Việt - Anh - Nàng tiên cá - The Little Mermaid', '35000', '28000', '20', 'truyện lẻ', 'Shu-Hua Huang, Chia-Fen Her, Trương Nghĩa Văn', 'Nhà trẻ - mẫu giáo (0 - 6), Nhi đồng (6 – 11)', '18.5x23 cm', '32', '95', 'Truyen_tranh', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`) VALUES
(1),
(2),
(3),
(4),
(5);

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
(87, 'Tiếng gọi nơi hoang dã', '55000', '44000', '20', 'truyện lẻ', 'Jack London', 'Nhi đồng (6 – 11)', '13x19 cm', '160', '165', 'Van_hoc_nuoc_ngoai', 'Active');

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
(62, 'Xóm thiên đường', '75000', '60000', '20', 'truyện lẻ', 'Phạm Công Luận', 'Thiếu niên (11 – 15)', '13x20,5 cm', '108', '170', 'Van_hoc_Viet_Nam', 'Active'),
(63, 'Things you use to fill a hole', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'Van_hoc_Viet_Nam', 'Active'),
(64, 'Những thứ bạn dùng để lấp một cái hố', '90000', '81000', '10', 'truyện lẻ', 'Dy Duyên, Thanh Vũ', 'Nhi đồng (6 – 11)', '17x22 cm', '100', '220', 'Van_hoc_Viet_Nam', 'Active'),
(65, 'Tủ sách tuổi thần tiên - Con Cáo Lửa', '40000', '36000', '10', 'truyện lẻ', 'Phạm Thanh Thúy', 'Nhi đồng (6 – 11)', '14,5x20,5 cm', '120', '150', 'Van_hoc_Viet_Nam', 'Active');

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
(176, 'Cô nàng Shimotsuki trót phải lòng nhân vật nền - Tập 5', '115000', '92000', '20', '5', 'Kagami Yagami, Roha', 'Tuổi trưởng thành (trên 18 tuổi)', '13x19 cm', '300', '330', 'Wings_book', 'Active'),
(177, 'Kujima hót, cả nhà véo von - Tập 4 (Tặng Lót Ly)', '40000', '32000', '20', '4', 'Akira Konno', 'Tuổi mới lớn (15 – 18),  Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'Wings_book', 'Active'),
(178, 'Kujima hót, cả nhà véo von - Tập 3 (Tặng Mini-Card)', '40000', '36000', '10', '3', 'Akira Konno', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '144', '175', 'Wings_book', 'Active'),
(179, 'Hai thằng này nhìn cứ nghi nghi', '35000', '31500', '10', 'truyện lẻ', 'Mayo Onizawa', 'Tuổi mới lớn (15 – 18), Tuổi trưởng thành (trên 18 tuổi)', '13x18 cm', '164', '265', 'Wings_book', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `accountadmin`
--
ALTER TABLE `accountadmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`aut_id`);

--
-- Indexes for table `bookofaut`
--
ALTER TABLE `bookofaut`
  ADD PRIMARY KEY (`aut_id`,`b_id`),
  ADD KEY `b_id` (`b_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NewsID` (`NewsID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `commentlike`
--
ALTER TABLE `commentlike`
  ADD PRIMARY KEY (`UserID`,`CommentID`),
  ADD KEY `commentlike_ibfk_2` (`CommentID`);

--
-- Indexes for table `commentreply`
--
ALTER TABLE `commentreply`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `fk_commentreply_parent` (`ParrentCommentID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ct_id`);

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
-- Indexes for table `generalinfo`
--
ALTER TABLE `generalinfo`
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
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `WrittenByAdminID` (`WrittenByAdminID`);

--
-- Indexes for table `newsupdatelog`
--
ALTER TABLE `newsupdatelog`
  ADD PRIMARY KEY (`NewID`,`AdminID`),
  ADD KEY `newsupdatelog_ibfk_1` (`AdminID`);

--
-- Indexes for table `relatednew`
--
ALTER TABLE `relatednew`
  ADD PRIMARY KEY (`NewID`,`RelatedNewID`),
  ADD KEY `RelatedNewID` (`RelatedNewID`);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

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
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `accountadmin`
--
ALTER TABLE `accountadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `aut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `generalinfo`
--
ALTER TABLE `generalinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookofaut`
--
ALTER TABLE `bookofaut`
  ADD CONSTRAINT `bookofaut_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `tat_ca_san_pham` (`id`),
  ADD CONSTRAINT `bookofaut_ibfk_2` FOREIGN KEY (`aut_id`) REFERENCES `author` (`aut_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`NewsID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `commentlike`
--
ALTER TABLE `commentlike`
  ADD CONSTRAINT `commentlike_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `commentlike_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `commentreply`
--
ALTER TABLE `commentreply`
  ADD CONSTRAINT `fk_commentreply_comment` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_commentreply_parent` FOREIGN KEY (`ParrentCommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`WrittenByAdminID`) REFERENCES `admin` (`ID`);

--
-- Constraints for table `newsupdatelog`
--
ALTER TABLE `newsupdatelog`
  ADD CONSTRAINT `newsupdatelog_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `newsupdatelog_ibfk_2` FOREIGN KEY (`NewID`) REFERENCES `news` (`ID`);

--
-- Constraints for table `relatednew`
--
ALTER TABLE `relatednew`
  ADD CONSTRAINT `relatednew_ibfk_1` FOREIGN KEY (`NewID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `relatednew_ibfk_2` FOREIGN KEY (`RelatedNewID`) REFERENCES `news` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
