-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 12:42 PM
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
  `isStudent` varchar(500) NOT NULL,
  `avt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `phone`, `email`, `birthdate`, `password`, `isStudent`, `avt`) VALUES
(1, 'Nguyễn Văn Avádasd', '123456789123', '123aa@example.coma', '2000-01-01', '$2y$10$ANhtS50DEtDlOmaxwSUnP.69oI3Ssh7jskOhFI2aGtBm9NuqDUizS', 'on', 'http://localhost/kimdong_bookstore/api/uploads/6815a9e41b4a6.png'),
(2, '123', '1231', '1234561@gmail.com', '2025-05-07', '$2y$10$T2ymOkpyDzwpJwBnFyx32uZxfIXugyW7dWWSdTYBvTOqqfsVY1hw.', 'on', 'http://localhost/kimdong_bookstore/api/uploads/681b1153a7782.jpg'),
(3, 'Nguyễn Văn A', '0911111111', 'a@example.com', '2000-01-01', '$2y$10$hash1', 'on', '/avt_1.png'),
(4, 'Trần Thị B', '0922222222', 'b@example.com', '2000-02-02', '$2y$10$hash2', 'on', '/avt_2.png'),
(5, 'Lê Minh C', '0933333333', 'c@example.com', '2000-03-03', '$2y$10$hash3', 'on', '/avt_3.png'),
(6, 'Phạm Thanh D', '0944444444', 'd@example.com', '2000-04-04', '$2y$10$hash4', 'on', '/avt_4.png'),
(7, 'Hoàng Quốc E', '0955555555', 'e@example.com', '2000-05-05', '$2y$10$hash5', 'on', '/avt_5.jpg'),
(8, 'Vũ Thị F', '0966666666', 'f@example.com', '2000-06-06', '$2y$10$hash6', 'on', '/avt_6.jpg'),
(9, 'Bùi Quốc G', '0977777777', 'g@example.com', '2000-07-07', '$2y$10$hash7', 'on', '/avt_7.jpg'),
(10, 'Đỗ Minh H', '0988888888', 'h@example.com', '2000-08-08', '$2y$10$hash8', 'on', '/avt_8.jpg'),
(11, 'Ngô Thị I', '0999999999', 'i@example.com', '2000-09-09', '$2y$10$hash9', 'on', '/avt_9.jpg'),
(12, 'Dương Thanh J', '0900000000', 'j@example.com', '2000-10-10', '$2y$10$hash10', 'on', '/avt_10.jpg');

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
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `level` int(11) NOT NULL DEFAULT 1,
  `reply_to_answer_id` int(11) DEFAULT NULL,
  `reply_to_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `user_id`, `answer`, `created_at`, `level`, `reply_to_answer_id`, `reply_to_user_id`) VALUES
(1, 1, 4, 'Có chương trình đào tạo nhưng chỉ theo đợt nhất định.', '2025-03-31 11:45:00', 1, NULL, NULL),
(2, 1, 3, 'Thường thì có hỗ trợ nếu bạn có bản thảo hoàn chỉnh.', '2025-03-31 11:38:00', 1, NULL, NULL),
(3, 1, 8, 'Tôi đã từng được chỉnh sửa bản thảo sau khi gửi.', '2025-03-31 11:50:00', 2, 2, 3),
(4, 2, 6, 'Họ có hỗ trợ xuất bản nhiều định dạng khác nhau.', '2025-03-31 11:55:00', 1, NULL, NULL),
(5, 2, 3, 'Tôi nghĩ bạn nên liên hệ trực tiếp để được hướng dẫn cụ thể.', '2025-03-31 11:45:00', 1, NULL, NULL),
(6, 2, 5, 'Bạn có thể xem trên trang chính sách của nhà xuất bản.', '2025-03-31 12:00:00', 2, 5, 3),
(7, 3, 5, 'Tôi từng được giới thiệu sách trên mạng xã hội của họ.', '2025-03-31 12:02:00', 1, NULL, NULL),
(8, 3, 1, 'Có thể gửi email để hỏi rõ ràng hơn.', '2025-03-31 12:03:00', 1, NULL, NULL),
(9, 3, 10, 'Câu hỏi này khá hay, mình từng hỏi rồi và được hỗ trợ.', '2025-03-31 12:12:00', 2, 8, 1),
(10, 4, 7, 'Bạn có thể xem trên trang chính sách của nhà xuất bản.', '2025-03-31 12:10:00', 1, NULL, NULL),
(11, 4, 9, 'Tôi nghĩ bạn nên liên hệ trực tiếp để được hướng dẫn cụ thể.', '2025-03-31 12:13:00', 1, NULL, NULL),
(12, 4, 6, 'Tôi từng được giới thiệu sách trên mạng xã hội của họ.', '2025-03-31 12:17:00', 2, 10, 7),
(13, 2, 6, 'Bạn ơi họ hỗ trợ lâu chưa?', '2025-05-08 09:01:31', 2, 1, 1),
(14, 2, 7, 'Cảm ơn bạn, mình sẽ thử liên hệ với họ.', '2025-05-08 09:01:31', 2, 2, 2),
(15, 2, 8, 'Bạn nói đúng, sách nổi bật mới được hỗ trợ.', '2025-05-08 09:01:31', 2, 3, 3),
(16, 2, 9, 'Họ phản hồi nhanh không bạn?', '2025-05-08 09:01:31', 2, 4, 4),
(17, 2, 10, 'Cộng tác viên đó là ai vậy bạn?', '2025-05-08 09:01:31', 2, 5, 5),
(18, 2, 1, 'Nhà xuất bản có chương trình quảng bá trên mạng xã hội.', '2025-05-08 09:01:40', 1, NULL, NULL),
(19, 2, 2, 'Tôi được hỗ trợ quảng bá sách trên fanpage của họ.', '2025-05-08 09:01:40', 1, NULL, NULL),
(20, 2, 3, 'Có hỗ trợ nhưng chỉ với những tác phẩm nổi bật.', '2025-05-08 09:01:40', 1, NULL, NULL),
(21, 2, 4, 'Bạn nên liên hệ trực tiếp để biết thêm.', '2025-05-08 09:01:40', 1, NULL, NULL),
(22, 2, 5, 'Họ có hệ thống cộng tác viên giúp giới thiệu sách.', '2025-05-08 09:01:40', 1, NULL, NULL),
(23, 2, 2, 'Nhà xuất bản có hỗ trợ quảng bá, mình từng được giúp.', '2025-05-08 09:01:52', 1, NULL, NULL),
(24, 2, 3, 'Cụ thể bạn được hỗ trợ như thế nào vậy?', '2025-05-08 09:01:52', 2, 23, 2),
(25, 2, 4, 'Họ đăng bài giới thiệu sách mình lên fanpage.', '2025-05-08 09:01:52', 2, 24, 3),
(26, 2, 5, 'Bạn có phải trả phí cho bài đăng đó không?', '2025-05-08 09:01:52', 2, 25, 4),
(27, 2, 6, 'Mình nghĩ bạn có thể hỏi trực tiếp nhà xuất bản để rõ hơn.', '2025-05-08 09:02:57', 2, 23, 2);

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
-- Table structure for table `author_section`
--

CREATE TABLE `author_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author_section`
--

INSERT INTO `author_section` (`id`, `title`, `subtitle`) VALUES
(1, 'Công tác đầu tư cho tác giả, tác phẩm', 'Các hoạt động tiêu biểu ');

-- --------------------------------------------------------

--
-- Table structure for table `author_section_activities`
--

CREATE TABLE `author_section_activities` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author_section_activities`
--

INSERT INTO `author_section_activities` (`id`, `author_id`, `year_from`, `year_to`, `description`) VALUES
(1, 1, 1976, 1978, 'Vì mầm non Xã hội Chủ nghĩa'),
(2, 1, 1979, 1979, 'Trại sáng tác văn học cho thiếu nhi tại Nha Trang (Khánh Hòa)'),
(3, 1, 1980, 1980, 'Hội nghị văn học thiếu nhi lần thứ nhất'),
(4, 1, 1980, 1982, 'Chào mừng 40 năm ngày thành lập Đội Thiếu niên Tiền phong Hồ Chí Minh'),
(5, 1, 1982, 1982, 'Tổ chức trao tặng phẩm cho gần 100 cộng tác viên có đóng góp xuất sắc cho sự phát triển của Nhà xuất bản');

-- --------------------------------------------------------

--
-- Table structure for table `author_section_paragraphs`
--

CREATE TABLE `author_section_paragraphs` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author_section_paragraphs`
--

INSERT INTO `author_section_paragraphs` (`id`, `author_id`, `content`) VALUES
(1, 1, 'Để có được sự cộng tác, giúp đỡ, đóng góp quý báu của các tác giả, dịch giả, công tác cộng tác viên luôn được Nhà xuất bản đặc biệt coi trọng.'),
(2, 1, 'Ngay từ những tác giả đầu tiên là những nhà văn, họa sĩ, nhạc sĩ hàng đầu của đất nước, trải qua từng giai đoạn phát triển, Nhà xuất bản Kim Đồng luôn thu hút được những cây bút tâm huyết sáng tác cho thiếu nhi.'),
(3, 1, 'Về phần mình, Nhà xuất bản cũng luôn nỗ lực hết mình để xứng đáng với niềm tin yêu đó, đồng thời tạo điều kiện tốt nhất để các cộng tác viên có cơ hội đến với mình: tổ chức các cuộc thi viết, các đợt vận động sáng tác,…'),
(4, 1, 'Tất cả đã làm nên một thứ \"văn hóa Kim Đồng\" để nhiều cộng tác viên coi việc đến với Nhà xuất bản như trở về ngôi nhà chung Kim Đồng.');

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
(3, 'Bình luận 1.3', '2025-04-30 15:41:10', 1, 2),
(7, 'Bình luận reply mới', '2025-05-06 07:14:21', 1, 2),
(19, 'bình luận mới', '2025-05-06 12:22:50', 1, 1),
(21, 'hi', '2025-05-06 12:24:02', 1, 1),
(23, 'hello', '2025-05-06 12:25:44', 1, 1),
(24, 'xóa thử', '2025-05-06 12:26:00', 1, 1),
(27, 'bđld', '2025-05-08 11:56:37', 1, 2),
(28, 'dkdld', '2025-05-08 11:56:48', 1, 2);

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
(2, 3),
(2, 24);

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
(23, 3),
(28, 24);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, '123', '123', '123', '123', 'Tỉnh Vĩnh Phúc', 'Thành phố Phúc Yên', 'Phường Phúc Thắng', '44990000', '{id: 123(số lượng: 1)}', 'Đã hủy');

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
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `description`, `icon`) VALUES
(1, 'Tài khoản', 'Quản lý tài khoản người dùng. ', 'http://localhost/kimdong_bookstore/api/uploads/681dd65d8bfbf.png'),
(2, 'Cộng đồng', 'Nơi người dùng có thể kết nối và chia sẻ kinh nghiệm.', 'http://localhost/kimdong_bookstore/api/uploads/681dd6682243c.png'),
(3, 'Tác giả', 'Thông tin về các tác giả của hệ thống.', 'http://localhost/kimdong_bookstore/api/uploads/681dd67a46d7b.png'),
(4, 'Khuyến mãi', 'Cập nhật các chương trình khuyến mãi và ưu đãi.', 'http://localhost/kimdong_bookstore/api/uploads/681dd682ce79f.png'),
(5, 'Chất lượng', 'Đảm bảo chất lượng sản phẩm và dịch vụ.', 'http://localhost/kimdong_bookstore/api/uploads/681dd68cbeb54.png'),
(6, 'Bảo mật', 'Các biện pháp bảo mật và an toàn cho hệ thống.', 'http://localhost/kimdong_bookstore/api/uploads/681dd69644ecf.png');

-- --------------------------------------------------------

--
-- Table structure for table `feature_questions`
--

CREATE TABLE `feature_questions` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feature_questions`
--

INSERT INTO `feature_questions` (`id`, `feature_id`, `question`, `answer`) VALUES
(1, 1, 'Làm sao để tạo một tài khoản mới trên hệ thống?', 'Bạn chỉ cần nhấn vào nút \"Đăng ký\" và điền thông tin cá nhân. Một email xác nhận sẽ được gửi để kích hoạt tài khoản.'),
(2, 1, 'Tôi có thể đăng nhập bằng cách nào?', 'Sử dụng email và mật khẩu đã đăng ký để đăng nhập.'),
(3, 2, 'Làm sao để tham gia vào cộng đồng?', 'Bạn cần đăng nhập, sau đó truy cập phần \"Cộng đồng\" trong menu.'),
(4, 3, 'Tác giả có thể chia sẻ bài viết của mình trên hệ thống không?', 'Có, bài viết sẽ được cộng đồng đánh giá và phản hồi.'),
(5, 4, 'Làm sao để biết về các chương trình khuyến mãi?', 'Thông tin sẽ được cập nhật thường xuyên trên trang \"Khuyến mãi\".'),
(6, 5, 'Chất lượng sản phẩm có được đảm bảo khi mua hàng không?', 'Sản phẩm đều được kiểm tra kỹ trước khi phát hành.'),
(7, 6, 'Làm sao để bảo vệ tài khoản khỏi các nguy cơ bảo mật?', 'Hãy sử dụng mật khẩu mạnh và bật xác thực hai yếu tố (2FA).'),
(8, 1, 'Tôi quên mật khẩu, làm sao để khôi phục?', 'Nếu bạn quên mật khẩu, hãy nhấp vào nút \'Quên mật khẩu\' trên trang đăng nhập. Nhập địa chỉ email đã đăng ký, hệ thống sẽ gửi đường dẫn để đặt lại mật khẩu mới. Nếu không nhận được email, hãy kiểm tra thư mục spam hoặc liên hệ với bộ phận hỗ trợ khách hàng.'),
(9, 1, 'Làm sao để cập nhật thông tin tài khoản?', 'Để cập nhật thông tin tài khoản, bạn hãy đăng nhập, vào phần \'Tài khoản của tôi\', sau đó chỉnh sửa các thông tin như tên, số điện thoại, địa chỉ. Đối với thay đổi email hoặc mật khẩu, hệ thống có thể yêu cầu bạn xác minh danh tính qua email hoặc số điện thoại.'),
(10, 1, 'Tài khoản của tôi bị khóa, làm sao để mở lại?', 'Nếu tài khoản của bạn bị khóa do nhập sai mật khẩu quá nhiều lần hoặc vi phạm chính sách, hãy liên hệ với bộ phận hỗ trợ khách hàng để được hướng dẫn cách mở khóa. Bạn có thể cần cung cấp một số thông tin xác minh danh tính để đảm bảo an toàn cho tài khoản.'),
(11, 1, 'Tôi có thể xóa tài khoản của mình không?', 'Có, bạn có thể yêu cầu xóa tài khoản bằng cách liên hệ với bộ phận hỗ trợ. Lưu ý rằng khi tài khoản bị xóa, tất cả dữ liệu liên quan như lịch sử đơn hàng, danh sách yêu thích sẽ bị mất và không thể khôi phục.');

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
-- Table structure for table `international_section`
--

CREATE TABLE `international_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `international_section`
--

INSERT INTO `international_section` (`id`, `title`) VALUES
(1, 'Hợp tác quốc tế ');

-- --------------------------------------------------------

--
-- Table structure for table `international_section_partners`
--

CREATE TABLE `international_section_partners` (
  `id` int(11) NOT NULL,
  `international_id` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `flag_url` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `international_section_partners`
--

INSERT INTO `international_section_partners` (`id`, `international_id`, `region`, `country_name`, `flag_url`, `count`) VALUES
(1, 1, 'Khu vực châu Á', 'Nhật Bản', 'http://localhost/kimdong_bookstore/api/uploads/681dd630000bd.png', 12),
(3, 1, 'Khu vực châu Mỹ', 'Nhật Bản', 'http://localhost/kimdong_bookstore/api/uploads/681dd63797c97.png', 4),
(5, 1, 'Khu vực châu Âu', 'Nhật Bản', 'http://localhost/kimdong_bookstore/api/uploads/681dd63fd62a1.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `intro_section`
--

CREATE TABLE `intro_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `highlight` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intro_section`
--

INSERT INTO `intro_section` (`id`, `title`, `subtitle`, `image_url`, `highlight`) VALUES
(1, 'Về chúng tôi', 'Bạn đồng hành của tuổi thơ Việt Nam', 'http://localhost/kimdong_bookstore/api/uploads/681dd6077a67f.png', '2 bộ sách đặc biệt trong loạt ấn phẩm kỷ niệm 65 năm thành lập NXB Kim Đồng.');

-- --------------------------------------------------------

--
-- Table structure for table `intro_section_paragraphs`
--

CREATE TABLE `intro_section_paragraphs` (
  `id` int(11) NOT NULL,
  `intro_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intro_section_paragraphs`
--

INSERT INTO `intro_section_paragraphs` (`id`, `intro_id`, `content`) VALUES
(1, 1, 'Nhà xuất bản Kim Đồng (NXB) trực thuộc Trung ương Đoàn TNCS Hồ Chí Minh là nhà xuất bản đầu tiên và lớn nhất dành cho thiếu nhi tại Việt Nam. Trong suốt 65 năm đồng hành với nhiều thế hệ tuổi thơ Việt Nam, NXB Kim Đồng luôn có vị trí đặc biệt quan trọng trong đời sống tinh thần của bạn đọc nhỏ tuổi.'),
(2, 1, 'Ngày 17/6/1957, tại trụ sở của Hội Văn học nghệ thuật Việt Nam, một cuộc họp liên tịch đã được tổ chức đi đến quyết định thành lập nhà xuất bản sách thiếu nhi, theo đề xuất của nhà văn Tô Hoài, tên của nhà xuất bản được kế thừa tên của Tủ sách Kim Đồng ra đời ở chiến khu Việt Bắc (1948). Sự ra đời một nhà xuất bản mang tên người thiếu niên anh hùng nhỏ tuổi Kim Đồng có ý nghĩa đặc biệt, trở thành dấu mốc lịch sử trên chặng đường phát triển nền văn học thiếu nhi Việt Nam và cả nền xuất bản nước nhà.');

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
(2, 'TRIỂN LÃM THƠ – TRANH CÙNG VIỆT NAM', 'Triển lãm thơ – tranh Cùng Việt Nam là không gian nghệ thuật đặc biệt, bước ra từ tập thơ cùng tên mang đầy trăn trở và khát vọng hòa bình.\r\n                                                                                                                                   Cùng Việt Nam tập hợp các tác phẩm lên tiếng phản đối cuộc chiến tranh phi nghĩa tại Việt Nam của các nhà thơ Tây Ban Nha, thể hiện sự đoàn kết sâu sắc với nhân dân Việt Nam trong những năm tháng khốc liệt nhất.\r\n\r\nSau hơn nửa thế kỷ, 6 họa sĩ Việt Nam và 6 họa sĩ Tây Ban Nha đã bắt tay thực hiện các tác phẩm minh họa mới cho tập thơ này, tạo nên một cuộc đối thoại nghệ thuật xuyên thời gian và không gian thể hiện sự cộng hưởng sâu sắc giữa thi ca và hội họa trong việc truyền tải thông điệp hòa bình, phản chiến và tình đoàn kết nhân loại.\r\n\r\nSự cộng tác giữa các nghệ sĩ hai bờ đại dương, còn là nhịp cầu kết nối quá khứ, hiện tại và tương lai giữa hai dân tộc Việt Nam – Tây Ban Nha trong tinh thần hữu nghị và đoàn kết.\r\n\r\nDù đến từ những nền văn hóa khác nhau, phong cách khác nhau, các họa sĩ đã thể hiện sự đồng cảm, sẻ chia và nỗ lực tái hiện tinh thần của những bài thơ từng bị kiểm duyệt, từng bị quên lãng, được sống lại trong ánh sáng và màu sắc của ngày hôm nay.\r\n\r\nNhân kỉ niệm 50 năm Giải phóng miền Nam thống nhất đất nước (30.4.1975-30.4.2025), Triển lãm được thực hiện trong khuôn khổ buổi ra mắt tập thơ Cùng Việt Nam và tiếp tục được tổ chức tại trụ sở Nhà xuất bản Kim Đồng, 55 Quang Trung, Hai Bà Trưng, Hà Nội từ ngày 30/4 đến ngày 4/5/2025 cho công chúng.', 'https://file.hstatic.net/200000343865/file/rien_lam_cvn_banner_fb_post_1800x1200_da22e2a6e34144efb7d6e9d0123d4cdb_grande.jpg', 'published', 1, 1, '2025-04-30 14:12:19'),
(3, 'THƯ MỜI BÁO GIÁ ', '\r\n        Kính gửi: Các đơn vị cung cấp dịch vụ Cho thuê phần mềm \r\nQuản trị bán hàng đa kênh\r\n\r\nNhà xuất bản Kim Đồng xin gửi Quý Công ty lời cảm ơn và lời chào trân trọng!\r\nHiện nay Nhà xuất bản chúng tôi đang có kế hoạch đầu tư mua sắm Phần mềm Quản trị bán hàng đa kênh nhằm phục vụ công tác Quản trị bán hàng đa kênh.\r\nNếu quý Công ty quan tâm, chúng tôi kính mời quý Công ty tham gia báo giá, chi tiết cụ thể như sau:\r\nI. Thông tin của đơn vị yêu cầu báo giá \r\n1. Đơn vị yêu cầu báo giá: Nhà xuất bản Kim Đồng: Số 55, đường Quang Trung, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội. \r\n2. Thông tin liên hệ của người chịu trách nhiệm tiếp nhận báo giá: Ông Trương Việt Anh – Điện thoại: 0913555451 - Văn Phòng – Nhà xuất bản Kim Đồng. \r\n3. Cách thức tiếp nhận báo giá: Gửi báo giá theo đường bưu điện hoặc trực tiếp theo địa chỉ: Văn phòng - Nhà xuất bản Kim Đồng: Số 55,Quang Trung, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội. \r\nNgười nhận báo giá trực tiếp: Ông Trương Việt Anh - ĐT: 0913555451\r\n4. Thời hạn tiếp nhận báo giá: Từ 14 giờ 00 ngày 23 tháng 04 năm 2025 đến trước 14 giờ 00 ngày 29 tháng 04 năm 2025. \r\nCác báo giá nhận được sau thời điểm nêu trên sẽ không được xem xét. \r\n5. Thời hạn có hiệu lực của báo giá: Tối thiểu 90 ngày, kể từ ngày báo giá. \r\nII. Nội dung yêu cầu báo giá \r\n1. Danh mục dịch vụ: Cho thuê Phần mềm Quản trị bán hàng đa kênh tại Nhà xuất bản Kim Đồng. \r\n(Phần mềm / Cơ sở dữ liệu và yêu cầu tính năng kỹ thuật cơ bản hoặc tương đương về chức năng, tiện ích chi tiết tại phụ lục kèm theo. Các đơn vị vui lòng chào giá theo đúng nội dung và có tài liệu giới thiệu tóm tắt về phần mềm/ cơ sở dữ liệu báo giá. Giá phần mềm/ cơ sở dữ liệu là giá đã bao gồm các loại thuế, phí, lệ phí, chi phí đào tạo, chuyển giao công nghệ, bảo hành bảo trì và các chi phí khác) \r\n2. Địa điểm thực hiện cung cấp dịch vụ: Nhà xuất bản Kim Đồng, 55 Quang Trung, Phường Nguyễn Du, Quận Hai Bà Trưng, Thành phố Hà Nội. \r\n3. Thời gian thực hiện: 1 năm (12 tháng) kể từ ngày hợp đồng có hiệu lực. \r\n4. Hồ sơ báo giá gồm: \r\n- Hồ sơ năng lực, các tài liệu chứng minh đủ điều kiện cung cấp phần mềm theo quy định.\r\n- Báo giá được ký, đóng dấu người có thẩm quyền và đóng dấu giáp lai (trong trường hợp báo giá có nhiều trang); và chịu trách nhiệm pháp lý về tính chính xác, thông tin phù hợp không vi phạm tính cạnh tranh về giá theo quy định hiện hành. \r\n- Báo giá tách rõ 2 phần:\r\n    + Chi phí chỉnh sửa phần mềm theo đặc thù (nếu có)\r\n    + Chi phí cho thuê phần mềm trong 1 năm.\r\n- Phiên bản dùng thử (Phần mềm Demo)\r\n- Giấy chứng nhận đăng ký kinh doanh do cấp có thẩm quyền cấp, đang có hiệu lực. \r\nNhà xuất bản Kim Đồng trân trọng kính mời các đơn vị có chức năng, năng lực quan tâm gửi báo giá và các tài liệu liên quan. \r\n\r\nTrân trọng thông báo.', 'https://file.hstatic.net/200000343865/article/thong_bao_4315dec2fefc4e9185b3340b037deeab_large.jpg', 'published', 1, 1, '2025-04-30 14:16:52'),
(4, 'Kết nối tri thức giáo dục và hình thành nhân cách thế hệ trẻ Việt - Trung', '        Trong khuôn khổ Gặp gỡ hữu nghị thanh niên Việt Nam – Trung Quốc lần thứ 24 năm 2025, đoàn đại biểu T.Ư Đoàn TNCS Trung Quốc thăm và làm việc với Nhà xuất bản Kim Đồng (thuộc T.Ư Đoàn TNCS Hồ Chí Minh). Nhiều ý kiến chia sẻ mở ra cơ hội thúc đẩy giao lưu hợp tác về công tác xuất bản các ấn phẩm dành cho thanh thiếu nhi hai nước.\r\nTrong khuôn khổ Gặp gỡ hữu nghị thanh niên Việt Nam – Trung Quốc lần thứ 24 năm 2025, chiều 14/4, tại Hà Nội, đoàn đại biểu T.Ư Đoàn TNCS Trung Quốc thăm và làm việc với Nhà xuất bản Kim Đồng. Cùng dự buổi làm việc có anh Nguyễn Thái An – Ủy viên Ban Thường vụ, Trưởng Ban Tuyên giáo T.Ư Đoàn TNCS Hồ Chí Minh.Đoàn đại biểu T.Ư Đoàn TNCS Trung Quốc có anh Hồng Lượng - Trưởng Ban Tuyên giáo T.Ư Đoàn TNCS Trung Quốc dẫn đầu; đại diện tỉnh thành Đoàn và báo Thanh niên Trung Quốc.\r\n', 'https://file.hstatic.net/200000343865/file/tp-kimdong11-481-343_0d33bf00d3e94cd39337431119ff0824_grande.jpg', 'published', 2, 1, '2025-04-30 14:18:32'),
(6, 'Đoàn đại biểu Cháu ngoan Bác Hồ tỉnh Bình Dương tham quan Nhà xuất bản Kim Đồng – Ngôi nhà tuổi thơ Việt Nam', 'Tiếp nối hành trình “Cháu ngoan Bác Hồ làm nghìn việc tốt”, ngày 5/4/2025, Đoàn đại biểu Cháu ngoan Bác Hồ tỉnh Bình Dương đã có chuyến tham quan, giao lưu tại Nhà xuất bản Kim Đồng – nơi gắn bó với bao thế hệ thiếu nhi Việt Nam qua từng trang sách tuổi thơ.\r\nTham dự chương trình có Đ/c Trần Thị Diễm Trinh - Ủy viên Ban Thường vụ Trung ương Đoàn, Tỉnh ủy viên, Bí thư Tỉnh đoàn, Chủ tịch Hội LHTN Việt Nam tỉnh; Đồng chí Lê Tuấn Anh, Ủy viên Ban Chấp hành Trung ương Hội Sinh viên Việt Nam, Phó Bí thư Thường trực Tỉnh đoàn, Chủ tịch Hội Sinh viên Việt Nam, Chủ tịch Hội đồng Đội tỉnh cùng các đồng chí lãnh đạo các phòng ban đơn vị của Tỉnh. \r\n                                                                                                                                   Tại đây, các đại biểu nhỏ tuổi đã được tìm hiểu lịch sử hình thành và sứ mệnh đặc biệt của Nhà xuất bản Kim Đồng, nghe giới thiệu về những bộ sách nổi bật: truyện tranh thiếu nhi, truyện cổ tích, sách giáo dục nhân cách, sách về Bác Hồ cũng như tìm hiểu quy trình làm sách và giao lưu với các cô chú biên tập viên của Nhà xuất bản. ', 'https://file.hstatic.net/200000343865/article/489484006_1075091784660940_3592676783007847537_n_a3db91780ca14b1f953b66cbf9957fe6_large.jpg', 'published', 1, 1, '2025-05-02 13:03:34'),
(7, 'Chương trình kêu gọi sáng tác “Gặp tôi trong tương lai” và chuỗi sự kiện về quyền tự do khám phá và lựa chọn nghề nghiệp', '“Gặp tôi trong tương lai” được khởi xướng bởi The Initiative of Children’s Book Creative Content (ICBC), với sự đồng hành của ECUE-VGEM và Nhà xuất bản (NXB) Kim Đồng. Chương trình này nhận được hỗ trợ kỹ thuật và tài chính từ Investing in Women (Đầu tư cho Phụ nữ) – một sáng kiến của Chính phủ Australia. Chương trình kêu gọi sáng tác sách tranh thiếu nhi nhằm tạo nhiều nội dung phong phú về quyền tự do khám phá và lựa chọn nghề nghiệp – một chủ đề còn nhiều khoảng trống trong hệ sinh thái xuất bản và giáo dục hiện nay.\r\n                                                                                                                                   Trong bối cảnh những khuôn mẫu giới vẫn có ảnh hưởng sâu sắc đến định hướng nghề nghiệp của trẻ em, chương trình mong muốn nhận được những ý tưởng sáng tác mới mẻ, gần gũi, khơi gợi khả năng tưởng tượng, đam mê và niềm tin của trẻ trong việc lựa chọn nghề nghiệp tương lai, không bị ràng buộc bởi định kiến giới hay hoàn cảnh sống. Các ý tưởng xuất sắc sẽ được lựa chọn để trao cơ hội xuất bản sách cùng Nhà xuất bản Kim Đồng. Các tác phẩm này tập trung hướng tới đối tượng người đọc là trẻ từ 5 đến 11 tuổi, với tiêu chí nội dung sáng tạo, phù hợp độ tuổi và góp phần lan tỏa thông điệp về bình đẳng trong học tập và định hướng nghề nghiệp.\r\nChương trình chào đón mọi công dân Việt Nam không giới hạn độ tuổi, có thể tham gia với tư cách cá nhân hoặc theo nhóm. Người tham gia có cơ hội được phát triển bản thảo, xuất bản tác phẩm với Nhà xuất bản Kim Đồng và lan tỏa đến hệ thống trường học, thư viện, cộng đồng đọc sách thiếu nhi trên toàn quốc.\r\nTrong khuôn khổ chương trình, sẽ có hai workshop cộng đồng được tổ chức tại NXB Kim Đồng, 55 Quang Trung, Hà Nội nhằm tạo kết nối, chia sẻ thông tin, kiến thức và lan toả mạnh mẽ hơn thông điệp tự do lựa chọn nghề nghiệp tới cộng đồng.\r\nWorkshop đầu tiên diễn ra vào ngày 27/4/2025 với tên gọi “Sự đa dạng của nghề nghiệp qua lăng kính sách thiếu nhi” với sự tham gia của các diễn giả trong lĩnh vực sách thiếu nhi và bình đẳng giới. Workshop được thiết kế với mục tiêu tạo cơ hội để cha mẹ, thầy cô giáo, nhà giáo dục, những người chăm sóc trẻ em và cộng đồng nói chung cùng nhau tìm hiểu, chia sẻ và phản ánh những giá trị tiềm năng mà sách thiếu nhi có thể mang lại trong việc khơi dậy sự tò mò và khát khao khám phá nghề nghiệp của trẻ em. Bằng cách cùng nhau trải nghiệm những câu chuyện về sự đa dạng nghề nghiệp, người tham gia sẽ được khơi gợi những suy nghĩ về cách thức các nghề nghiệp được giới thiệu đến trẻ em qua sách thiếu nhi, từ đó tìm hiểu, suy tư, phản biện và hơn hết là đưa ra những ý tưởng mới mẻ để phát triển các câu chuyện, đề tài sáng tác sách thiếu nhi mới mẻ và đa dạng, góp phần mở rộng những hình dung về nghề nghiệp trong xã hội hiện đại. \r\nWorkshop thứ hai diễn ra vào ngày 10/5/2025 có tên “Ghép mảnh những ước mơ thơ ấu” là một không gian sáng tạo dành cho người thực hành sáng tạo và người trẻ từ 18–30 tuổi. Với sự đồng hành của họa sĩ minh họa Trà Nhữ (Thạc sĩ Minh họa – University of the Arts London) và tác giả Phạm Thị Hoài Anh, người tham gia sẽ thực hành phương pháp collage (cắt dán sáng tạo) để kể lại hành trình nghề nghiệp cá nhân qua sách gấp dạng zine hoặc accordion. Workshop không chỉ là hành trình khám phá bản thân, mà còn là bước đệm để người tham gia được truyền cảm hứng và tạo động lực gửi ý tưởng của mình cho chương trình kêu gọi sáng tác “Gặp tôi trong tương lai”. Không gian của workshop cũng sẽ giới thiệu và trưng bày các cuốn sách thiếu nhi về chủ đề nghề nghiệp đa dạng để gợi mở và khích lệ người tham gia cùng khám phá các câu chuyện, các hình thức kể chuyện để truyền tải những thông điệp về nghề nghiệp đến với đối tượng độc giả trẻ em. ', 'https://file.hstatic.net/200000343865/article/open_call_-_gap_toi_trong_tuong_lai__3__ac345ca5e00747a4874fc1995ae529e0_large.jpg', 'published', 2, 1, '2025-05-02 13:05:33'),
(8, 'Chuỗi sự kiện giao lưu giới thiệu sách của NXB Kim Đồng chào mừng Ngày sách và Văn hóa đọc Việt Nam 2025', 'Chào mừng Ngày Sách và Văn hóa đọc Việt Nam lần thứ Tư – 2025, kỉ niệm 50 năm ngày Giải phóng miền Nam, Thống nhất đất nước, với thông điệp: “Đọc sách làm giàu tri thức, nuôi dưỡng khát vọng, thúc đẩy đổi mới, sáng tạo”, NXB Kim Đồng tổ chức chuỗi chương trình giao lưu giới thiệu sách tại Hà Nội và TP Hồ Chí Minh trong suốt tháng Tư.\r\n                                                                                                                                   Mời các bạn cùng theo dõi và tham gia chương trình: \r\n\r\n1.    10:00, 5/4 (thứ Bảy), Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội), Giao lưu: Sử Việt – Từ những cuộc đời - Câu chuyện về những con người đặt nền móng và xây đắp nên nền khoa học hiện đại ở Việt Nam\r\n2.    10:00, 12/4 (thứ Bảy), Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Đọc sách “Bỏ điện thoại xuống nào!” cùng tác giả Bùi Phương Tâm\r\n3.    9:30, 13/4 (Chủ nhật) tại Hội trường NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Giao lưu “Mở trang sách – Chạm vần thơ” với “Trắng mây tóc mẹ” - Giao lưu cùng tác giả Trương Anh Tú. \r\n4.    7:30, 18/4 (thứ Sáu) tại Trường Tiểu học Đông Ngạc (Q. Bắc Từ Liêm, Hà Nội): Giao lưu “Khoa học khắp quanh ta”\r\n5.    10:00, 19/4 (thứ Bảy), Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Đọc sách: Cậu bé Bi Đất - Bụng tròn chứa đầy niềm tin! với tác giả Bôn Đông Huân\r\n6.    15:00, ngày 19/4 (thứ Bảy) tại Sân khấu trung tâm Phố sách Hà Nội (Phố 19/12, Q. Hoàn Kiếm, Hà Nội): Giao lưu “Vang danh nghề cổ” -  Tìm hiểu Cùng khám phá những làng nghề thủ công truyền thống của Việt Nam. Khách mời: tác giả Phương Bùi, Thành Nguyễn, nhóm hoạ sĩ NGART\r\n7.    15:00, ngày 19/4 (thứ Bảy) tại Sảnh E, Thư viện Quốc gia (31 Tràng Thi, Q. Hoàn Kiếm, Hà Nội): Giao lưu: Sử Việt – Từ những cuộc đời - Câu chuyện về những con người đặt nền móng và xây đắp nên nền khoa học hiện đại ở Việt Nam. \r\n8.    9:00, 20/4 (Chủ nhật) tại Sân khấu A Đường sách TP. HCM (Quận 1): Giao lưu: “Hùm Xám và những cuộc phiêu lưu kì thú” cùng tác giả Bùi Tiểu Quyên.\r\n9.    7:30, 21/4 (thứ Hai) tại Trường Tiểu học Lê Hồng Phong (Q. Hà Đông, Hà Nội): Giao lưu “Vang danh nghề cổ” -  Tìm hiểu Cùng khám phá những làng nghề thủ công truyền thống của Việt Nam.\r\n10.    8:00, 21/4 (thứ Hai)    Trường Tiểu học Nguyễn Bỉnh Khiêm (Q. Long Biên, Hà Nội): Giao lưu giới thiệu bộ sách Ngàn năm sử Việt\r\n11.    8:45, 21/4 (thứ Hai) tại Trường THPT Nguyễn Huệ - Bắc Từ Liêm (Hà Nội): Giao lưu Bí kíp quản lí tài chính cá nhân cho bạn trẻ - Giao lưu với chuyên gia tài chính Trần Công Danh. \r\n12.    9:30, 23/4 (thứ Tư) tại Hội trường NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Giao lưu ra mắt sách CÙNG VIỆT NAM: Biểu tượng sống động của tình hữu nghị và đoàn kết Việt Nam – Tây Ban Nha. \r\n13.    10:00, 26/4 (thứ Bảy) tại Góc đọc Cuối tuần, NXB Kim Đồng (55 Quang Trung, Q. Hai Bà Trưng, Hà Nội): Đọc sách Chị Út Tịch “Người mẹ cầm súng” ', 'https://file.hstatic.net/200000343865/article/timeline_chao_mung_ngay_sach_va_van_hoa_doc_2025_inforgraphic_d213d2d2206e427d9ea4bd110e6400ae_large.png', 'published', 2, 1, '2025-05-02 13:07:05'),
(9, 'Hợp tác văn hóa Việt Nam – Đan Mạch: Mong đợi những bước phát triển mới\r\n', 'Từ khi chính thức thiết lập quan hệ ngoại giao vào năm 1971, Việt Nam và Đan Mạch đã không ngừng thúc đẩy hợp tác trên nhiều lĩnh vực, trong đó văn hóa là một trong những trụ cột quan trọng.\r\n\r\nTrao đổi với phóng viên Đài Tiếng nói Việt Nam, Đại sứ Đan Mạch tại Việt Nam Nicolai Prytz chia sẻ, sự hợp tác giữa Đan Mạch và Việt Nam có lịch sử lâu dài và trên phạm vi rất rộng, trên rất nhiều lĩnh vực, nhất là gần đây rất chú trọng vào chuyển đổi xanh và năng lượng.\r\n\r\nNgài Đại sứ cho biết: \"Đan Mạch cũng hợp tác với Việt Nam trong lĩnh vực y tế, thực phẩm và nông nghiệp. Chúng tôi có sự hợp tác trong lĩnh vực giáo dục, trong lĩnh vực thống kê... Bên cạnh đó, chúng tôi có rất nhiều công ty đến Việt Nam trong những năm gần đây, nơi chúng tôi cũng cố gắng tạo điều kiện thuận lợi cho đối thoại và kinh doanh giữa các công ty Việt Nam và Đan Mạch, các nhà đầu tư hai nước trong mọi lĩnh vực. Ví dụ, ngay tuần tới, tôi sẽ đến Bình Dương tham dự Lễ khánh thành nhà máy Lego. Ý tôi là, mọi thứ đang diễn ra liên tục trong danh mục đầu tư hợp tác của chúng tôi.\"\r\n\r\nTừ khi chính thức thiết lập quan hệ ngoại giao vào năm 1971, Việt Nam và Đan Mạch đã không ngừng thúc đẩy hợp tác trên nhiều lĩnh vực, trong đó văn hóa là một trong những trụ cột quan trọng. Một trong những sáng kiến quan trọng giúp phát triển các hoạt động hợp tác văn hóa giữa hai nước là Quỹ Hợp tác Văn hóa và Phát triển (CDEF), được Đại sứ quán Đan Mạch triển khai từ năm 2006. Quỹ này đã tài trợ hàng trăm dự án nghệ thuật tại Việt Nam, hỗ trợ các nghệ sĩ trẻ, tạo điều kiện để họ giao lưu và học hỏi từ các đồng nghiệp quốc tế. Ngoài ra, còn Dự án Hỗ trợ Văn học Thiếu nhi Việt Nam – Đan Mạch (2006-2015), trong đó Hội Nhà văn Đan Mạch phối hợp với Nhà xuất bản Kim Đồng phát triển văn học thiếu nhi.\r\nTuy nhiên, theo ngài Đại sứ Nicolai Prytz, các hoạt động hợp tác về văn hóa vẫn cần được chú trọng phát triển hơn nữa, để tương xứng với tiềm năng của hai nước: “Về mặt văn hóa, tôi muốn thấy nhiều hoạt động hợp tác hơn. Nhưng đó là một lĩnh vực mà theo quan điểm của tôi, chúng ta chưa ưu tiên đủ. Chúng ta cũng cần nguồn lực cho những hoạt động này. Tôi rất muốn chứng kiến nhiều hơn nữa các hoạt động hợp tác văn hoá được thực hiện. Chúng tôi đang nỗ lực thực hiện điều này. Chúng tôi thực sự đang cố gắng làm bất cứ điều gì có thể. Và chúng tôi có thể làm tốt hơn.”\r\n\r\nCuộc thi và Triển lãm tranh “Đan Mạch trong mắt em” do Đại sứ quán Đan Mạch tại Việt Nam và Hội hữu nghị Việt Nam – Đan Mạch (VIDAFA) tổ chức thường niên, trao giải ngày 02/04 vừa qua, cũng là một trong những hoạt động kết nối, hợp tác văn hóa gắn liền với nâng cao khả năng sáng tạo, ý thức bảo vệ môi trường cho thế hệ trẻ. Cuộc thi nhằm khuyến khích học sinh Việt Nam thể hiện suy nghĩ về môi trường và phát triển bền vững thông qua hội họa.', 'https://file.hstatic.net/200000343865/article/17_7876d79b21654d63910fbcdad379d8fc_large.jpg', 'published', 2, 1, '2025-05-02 13:08:39'),
(21, 'Trần Gia Bảo: Văn học thiếu nhi nuôi một đời vui', '<p><strong>Những năm 1990, c&aacute;i t&ecirc;n Trần Gia Bảo đ&atilde; l&agrave; sự ngưỡng mộ của ch&uacute;ng t&ocirc;i, bởi hồi ấy khắp c&aacute;c mặt b&aacute;o d&agrave;nh cho học sinh, sinh vi&ecirc;n, t&ecirc;n chị đ&atilde; rầm rộ với loạt b&agrave;i viết, truyện ngắn rất ấn tượng. Khi t&ocirc;i quay lại với c&acirc;u chuyện viết l&aacute;ch sau 15 năm từ thời sinh vi&ecirc;n, th&igrave; Trần Gia Bảo đ&atilde; l&agrave; Ph&oacute; tổng bi&ecirc;n tập của một tờ b&aacute;o lớn ở TP Hồ Ch&iacute; Minh.</strong></p>\n<p><strong>&ldquo;Bảo chị&rdquo; v&agrave; t&ocirc;i</strong></p>\n<p>Trần Gia Bảo l&agrave; c&acirc;y b&uacute;t 7X ghi đậm dấu ấn với nhiều bạn đọc y&ecirc;u th&iacute;ch văn chương tuổi mới lớn, nhất l&agrave; d&ograve;ng văn học thiếu nhi. Cuối năm 2024, với bộ s&aacute;ch &ldquo;Chuyện kể trước giờ đi ngủ&rdquo;, Trần Gia Bảo đ&atilde; vinh dự được trao giải C tại Giải thưởng S&aacute;ch Quốc gia. Đ&acirc;y ch&iacute;nh l&agrave; một phần thưởng xứng đ&aacute;ng cho h&agrave;nh tr&igrave;nh bền bỉ c&ugrave;ng d&ograve;ng văn học n&agrave;y.</p>\n<p>Nếu như c&oacute; dịp gặp Trần Gia Bảo, tin chắc sẽ nhận thấy một nụ cười lu&ocirc;n thường trực nở tr&ecirc;n m&ocirc;i của c&ocirc; nữ sinh Trường Trưng Vương. Nụ cười m&agrave; bao nhi&ecirc;u năm, từ l&uacute;c t&ocirc;i c&ograve;n l&agrave;m CTV của c&aacute;c ấn phẩm Khăn qu&agrave;ng đỏ, Mực t&iacute;m, Nhi đồng đến b&acirc;y giờ vẫn vậy. Tươi tắn hết cỡ.</p>\n<p><img src=\"https://file.hstatic.net/200000343865/file/5_794938f9287b49a391ca850ec6078767_grande.jpg\"></p>\n<p>Nh&agrave; văn Trần Gia Bảo.</p>\n<p>Hai chị em hay gọi nhau Bảo chị v&agrave; Bảo em, đấy l&agrave; c&aacute;ch ch&uacute;ng t&ocirc;i &iacute; ới nhau mỗi khi c&oacute; việc. C&oacute; những trưa t&ocirc;i đ&oacute;i meo v&igrave; lịch l&agrave;m việc d&agrave;y, chị biết được liền g&oacute;i đồ ăn cẩn thận gởi qua cho t&ocirc;i. Thoảng khi l&acirc;u qu&aacute; chẳng gặp nhau v&igrave; ai cũng bộn bề c&ocirc;ng việc lại nhắn tin tỉ t&ecirc; nhau, rủ r&ecirc; nhau phải thương ch&iacute;nh m&igrave;nh, cho bản th&acirc;n m&igrave;nh được nghỉ ngơi bằng những chuyến đi &ldquo;chữa l&agrave;nh&rdquo; lại t&acirc;m hồn m&igrave;nh.</p>\n<p>Nhưng, d&ugrave; c&oacute; cố gắng sắp xếp đến đ&acirc;u th&igrave; c&aacute;c chuyến đi của chị em ch&uacute;ng t&ocirc;i vẫn c&oacute; khoảnh khắc bất chợt phải &ocirc;m laptop l&agrave;m c&ocirc;ng việc, hay cầm chiếc điện thoại n&oacute;i thao thao bất tuyệt tận cả tiếng đồng hồ. Những l&uacute;c như vậy, Trần Gia Bảo lại cười x&ograve;a, th&ocirc;i kệ, cứ c&ograve;n vui được khắc gi&acirc;y n&agrave;o th&igrave; trọn vẹn khắc gi&acirc;y đ&oacute;. Đời ai cũng c&oacute; những l&uacute;c phải bận rộn. Nếu một ng&agrave;y n&agrave;o đ&oacute; m&igrave;nh kh&ocirc;ng bận rộn ắt hẳn l&agrave; m&igrave;nh hết x&agrave;i được rồi em ơi! Nhưng, ph&agrave;m đ&atilde; l&agrave; sống, th&igrave; sống hết m&igrave;nh, ai lại muốn m&igrave;nh trở th&agrave;nh &ldquo;hết x&agrave;i&rdquo; với cuộc đời n&agrave;y.</p>\n<p>C&oacute; một điều, t&ocirc;i chưa bao giờ kể cho Bảo chị nghe, hồi ấy tập truyện &ldquo;Quay đi v&agrave; kh&oacute;c&rdquo; khiến đ&aacute;m học tr&ograve; ch&uacute;ng t&ocirc;i gi&agrave;nh giật kinh khủng. Thậm ch&iacute; đến nỗi c&oacute; đứa mượn tận 3 ng&agrave;y chưa trả, c&ocirc; thủ thư phải l&ecirc;n hẳn lớp học để đ&ograve;i lại. Bởi, h&agrave;ng d&agrave;i những c&aacute;i t&ecirc;n đang đăng k&iacute; chờ đợi được đọc. Khi đ&oacute;, ch&uacute;ng t&ocirc;i l&agrave;m g&igrave; c&oacute; điện thoại th&ocirc;ng minh, cũng chẳng phải nh&agrave; n&agrave;o cũng c&oacute; tivi để xem, n&ecirc;n s&aacute;ch l&agrave; qu&yacute; nhất, như ch&iacute;nh người bạn t&acirc;m t&igrave;nh, nhất l&agrave; l&uacute;c ch&uacute;ng t&ocirc;i đang ở ngưỡng mới lớn, nhiều c&acirc;u chuyện &ldquo;t&igrave;nh học tr&ograve;&rdquo; đều lấy trang văn m&agrave; chia sẻ cảm x&uacute;c. Tập truyện &ldquo;Quay đi v&agrave; kh&oacute;c&rdquo; lan truyền qua miệng mỗi đứa đọc xong, khiến đứa kh&aacute;c cứ h&aacute;o hức, đọc v&agrave; t&igrave;m thấy sự tinh nghịch, hồn nhi&ecirc;n lẫn những mơn man buồn của vụng dại t&igrave;nh đầu. N&oacute;i thật, c&oacute; hai người trong b&uacute;t nh&oacute;m V&ograve;m Me Xanh ng&agrave;y ấy khiến t&ocirc;i m&ecirc; như điếu đổ l&agrave; Trần Gia Bảo v&agrave; Trần Đ&igrave;nh Thọ. Ch&iacute;nh hai c&aacute;i t&ecirc;n n&agrave;y khiến năm lớp 10, t&ocirc;i bắt đầu gởi t&aacute;c phẩm về tờ B&aacute;o Mực t&iacute;m với hy vọng trở th&agrave;nh một tr&aacute;i me trong b&uacute;t nh&oacute;m. Ấy thế m&agrave; cho tới b&acirc;y giờ, ước mơ ấy chưa th&agrave;nh hiện thực.</p>\n<p>M&atilde;i đến năm 2019, khi t&ocirc;i đ&atilde; tập tễnh quay lại với viết l&aacute;ch th&igrave; mới đọc trọn vẹn một t&aacute;c phẩm của Trần Gia Bảo. Tập truyện &ldquo;Những ng&ocirc;i l&agrave;ng tr&ecirc;n triền dốc&rdquo; khiến t&ocirc;i th&iacute;ch th&uacute;, bởi ở đ&oacute;, một kh&ocirc;ng gian n&uacute;i rừng c&ugrave;ng c&acirc;u chuyện của lo&agrave;i kiến đầy trong trẻo. Lo&agrave;i kiến đen sống ở l&agrave;ng Bồ C&ocirc;ng Anh, b&aacute;m v&agrave;o những hạt bồ c&ocirc;ng anh để gi&oacute; cuốn đến l&agrave;ng Hoa Xuyến Chi, rồi th&agrave;nh lập l&agrave;ng Hoa Chi Anh. Ch&agrave;ng Kiến H&ocirc;i đ&atilde; c&oacute; một h&agrave;nh tr&igrave;nh sống đầy ắp những y&ecirc;u thương với tinh thần sống v&igrave; cộng đồng. Th&ocirc;ng điệp truyện kh&eacute;o l&eacute;o lồng v&agrave;o c&aacute;c t&igrave;nh huống của Kiến H&ocirc;i, của c&aacute;c l&agrave;ng mang t&ecirc;n những lo&agrave;i hoa đầy thơ mộng. Từ đ&oacute;, Trần Gia Bảo như được khơi nguồn với d&ograve;ng văn học thiếu nhi. Chị bắt đầu viết nhiều, in nhiều, v&agrave; đắm đuối ở mảng đề t&agrave;i n&agrave;y.</p>\n<p><strong>Sống v&agrave; viết hết m&igrave;nh v&igrave; thiếu nhi</strong></p>\n<p>C&oacute; lần, hai chị em được mời về Gia Lai để đứng lớp bồi dưỡng s&aacute;ng t&aacute;c cho c&aacute;c c&acirc;y b&uacute;t thiếu nhi của tỉnh. Sau hai ng&agrave;y l&ecirc;n lớp, Trần Gia Bảo lại cần mẫn chỉnh sửa từng b&agrave;i thơ, truyện ngắn ng&acirc;y ng&ocirc; nhưng c&oacute; &yacute; tứ của c&aacute;c em để mang về B&aacute;o Khăn qu&agrave;ng đỏ, Nhi đồng, R&ugrave;a v&agrave;ng đăng. Đ&ecirc;m ngồi c&ugrave;ng gi&oacute; n&uacute;i lạnh ngắt chị bảo b&acirc;y giờ m&agrave; c&aacute;c em c&ograve;n m&ecirc; văn chương, c&ograve;n vượt những qu&atilde;ng đường xa để tụ về Hội trường của Hội VHNT Gia Lai ngồi học ngay ngắn th&igrave; đ&oacute; đ&atilde; l&agrave; một điều đ&aacute;ng mừng. Bởi trong qu&aacute; nhiều h&igrave;nh thức giải tr&iacute;, chọn văn chương đ&oacute; l&agrave; lựa chọn cần được hun đ&uacute;c, tạo niềm tin v&agrave; n&acirc;ng đỡ hết m&igrave;nh. Để từ những ng&ocirc; ngh&ecirc; n&agrave;y, 5 năm, 10 năm hay 20 năm nữa văn chương sẽ c&oacute; những gương mặt kế thừa. Dẫu lớp học khi đ&oacute; hơn 40 học sinh, nhưng chỉ cần 1 người, chị cũng đến v&agrave; dốc l&ograve;ng. Bởi với chị, thiếu nhi l&agrave; lứa tuổi cần một sự nắm tay d&igrave;u dắt trong h&agrave;nh tr&igrave;nh đam m&ecirc;. Từ bước ch&acirc;n bỡ ngỡ h&ocirc;m nay, để đi vạn dặm mai sau, ch&iacute; &iacute;t ngay từ b&acirc;y giờ cần tắm tưới c&aacute;c em bằng những niềm kh&iacute;ch lệ như thế. M&atilde;i tận 11 giờ đ&ecirc;m, chị vẫn gọt giũa b&agrave;i để chuyển về t&ograve;a soạn cho kịp số b&aacute;o in liền kề, cho n&oacute;ng sốt, cho niềm vui c&aacute;c em được trọn vẹn với lớp học n&agrave;y.</p>\n<p><img src=\"https://file.hstatic.net/200000343865/file/6_d977a1629ad24264804f5a7b10ad0507_grande.jpg\"></p>\n<p>Nh&agrave; văn Trần Gia Bảo (&aacute;o d&agrave;i đen) với giải thưởng S&aacute;ch Quốc gia.</p>\n<p>Những ng&agrave;y cuối th&aacute;ng 3 n&agrave;y, Trần Gia Bảo lại vừa cho ra mắt tập truyện thiếu nhi &ldquo;M&ugrave;a h&egrave; c&oacute; tuyết&rdquo; do NXB Kim Đồng ấn h&agrave;nh. Tập truyện nhỏ nhắn, xinh xắn với phần minh hoa đẹp của H&acirc;n Phạm nhanh ch&oacute;ng thu h&uacute;t sự quan t&acirc;m của phụ huynh v&agrave; c&aacute;c em nhỏ. C&acirc;u chuyện ch&uacute; m&egrave;o t&ecirc;n Louis sống c&ugrave;ng c&ocirc; chủ nhỏ l&agrave; du học sinh tr&ecirc;n nước Mỹ sinh động qua giọng văn pha ch&uacute;t nghịch ngợm v&agrave; t&agrave;i h&oacute;a th&acirc;n như thật của chị đưa c&aacute;c độc giả nh&iacute; kh&aacute;m ph&aacute; xứ sở cờ hoa đầy l&ocirc;i cuốn. Trong h&agrave;nh tr&igrave;nh ngao du xuy&ecirc;n bang c&ugrave;ng c&ocirc; chủ của m&igrave;nh, Louis đ&atilde; l&agrave;m quen th&ecirc;m nhiều bạn mới, gặp lại em g&aacute;i Loli sau bao ng&agrave;y xa c&aacute;ch v&agrave; chứng kiến điều đặc biệt c&oacute; một kh&ocirc;ng hai khi tuyết rơi giữa m&ugrave;a h&egrave;. Trần Gia Bảo c&oacute; thế mạnh mi&ecirc;u tả kĩ c&agrave;ng h&agrave;nh động, v&agrave; t&igrave;nh tiết truyện được dựng l&ecirc;n hợp l&yacute; với lo&agrave;i m&egrave;o. Độc giả nh&iacute; như t&igrave;m thấy ch&iacute;nh con m&egrave;o nh&agrave; m&igrave;nh nu&ocirc;i trong c&acirc;u chuyện của Louis. Phải quan s&aacute;t kĩ, chơi với m&egrave;o như một người bạn th&acirc;n thiết v&agrave; hơn hết l&agrave; t&igrave;nh y&ecirc;u với con vật nhỏ nhắn, kh&ocirc;n lanh n&agrave;y mới c&oacute; được những c&acirc;u văn đầy ấn tượng khi viết về m&egrave;o. Cảm x&uacute;c l&agrave; thứ kh&ocirc;ng thể đ&aacute;nh lừa độc giả. Từng bước đi chầm chậm s&aacute;t v&aacute;ch tường, những c&aacute;i ịn mũi v&agrave;o tấm cửa k&iacute;nh, c&aacute;i liếm m&eacute;p khi ch&eacute;n no say hộp pa-t&ecirc;, hay c&aacute;i khịt mũi ra chiều nũng nĩu của m&egrave;o, cả c&aacute;i cạ đầu v&agrave;o lưng cũng được khắc họa r&otilde; v&agrave; thật, như những đặc t&iacute;nh cố hữu của lo&agrave;i m&egrave;o.</p>\n<p>Chuyến đi của ch&uacute; m&egrave;o nhỏ c&ugrave;ng mami v&agrave; những người d&igrave; c&ograve;n được lồng v&agrave;o c&aacute;c c&acirc;u chuyện tr&ecirc;n đường để từ đ&oacute; to&aacute;t l&ecirc;n l&ograve;ng nh&acirc;n hậu giữa người v&agrave; người, giữa người v&agrave; động vật, giữa động vật với nhau. Y&ecirc;u thương chẳng c&oacute; r&agrave;o cản, ngay cả kh&ocirc;ng c&ugrave;ng tiếng n&oacute;i chung, giống lo&agrave;i chung. Chỉ c&oacute; y&ecirc;u thương mới khiến con người ta sống hạnh ph&uacute;c. Một điều đặc biệt nữa trong tập truyện lần n&agrave;y l&agrave; t&iacute;nh du k&yacute; của t&aacute;c phẩm. Ở mỗi v&ugrave;ng đất trong h&agrave;nh tr&igrave;nh xuy&ecirc;n bang của ch&uacute; m&egrave;o Louis, l&agrave; mỗi n&eacute;t đẹp thi&ecirc;n nhi&ecirc;n lẫn sự sống tươi mới của con người nơi đấy. Đ&ocirc;i khi ch&iacute;nh yếu tố n&agrave;y mới khơi gợi tr&iacute; t&ograve; m&ograve; v&agrave; h&aacute;o hức của độc giả nh&iacute;. C&aacute;c em tha hồ tưởng tượng những cảnh đẹp của một đất nước c&aacute;ch Việt Nam nửa v&ograve;ng tr&aacute;i đất.</p>\n<p>Trần Gia Bảo c&oacute; thể n&oacute;i l&agrave; người viết sống gần gũi với thiếu nhi nhất, bởi c&ocirc;ng việc đang phụ tr&aacute;ch v&agrave; những chuyến đi trao học bổng, l&agrave;m thiện nguyện đều l&agrave; d&agrave;nh cho thiếu nhi mồ c&ocirc;i, c&aacute;c b&eacute; học sinh kh&oacute; khăn. Đ&ocirc;i ch&acirc;n của chị đ&atilde; đi qua rất nhiều v&ugrave;ng s&acirc;u v&agrave; xa để đến với c&aacute;c em. Đ&ocirc;i tay chị cũng đ&atilde; d&igrave;u dắt, n&acirc;ng đỡ rất nhiều em cho đến ng&agrave;y trưởng th&agrave;nh v&agrave; c&oacute; c&ocirc;ng việc ổn định. Mới đ&acirc;y th&ocirc;i, đ&ocirc;i tay ấy nửa đ&ecirc;m chờ s&aacute;ng để c&ugrave;ng t&ocirc;i vận động suất học bổng đặc biệt cho một em sinh vi&ecirc;n ngh&egrave;o của Đại học Huế. M&atilde;i đến tận những ng&agrave;y trước Tết, ch&uacute;ng t&ocirc;i đ&atilde; ho&agrave;n th&agrave;nh phần trao học bổng, với chị xong việc n&agrave;y mới l&agrave; c&aacute;i Tết thanh thản của l&ograve;ng m&igrave;nh.</p>\n<p>H&ocirc;m ngồi ăn ch&aacute;o đậu giữa phố đi bộ Long Xuy&ecirc;n nh&acirc;n chuyến về giao lưu c&ugrave;ng sinh vi&ecirc;n của Trường Đại học An Giang, t&ocirc;i hỏi chị lấy đ&acirc;u ra năng lượng m&agrave; cười tươi từ s&aacute;ng đến tối, cũng c&aacute;i điệu cười sang sảng hồn hậu, chị bảo với chị l&agrave; nhờ viết cho thiếu nhi m&agrave; đời chị lu&ocirc;n vui mỗi ng&agrave;y.</p>', 'http://localhost/kimdong_bookstore/api/uploads/681befc45c13d.png', 'published', 2, 1, '2025-05-07 23:41:56');

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
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `question`, `created_at`) VALUES
(1, 1, 'Tôi có thể yêu cầu chỉnh sửa lại bản thảo sau khi gửi không?', '2025-03-31 11:30:00'),
(2, 2, 'Nhà xuất bản có hỗ trợ quảng bá sách không?', '2025-03-31 11:40:00'),
(3, 3, 'Tôi có thể xuất bản sách ở các định dạng nào?', '2025-03-31 11:50:00'),
(4, 4, 'Nhà xuất bản có chương trình đào tạo cho tác giả không?', '2025-03-31 12:00:00');

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
-- Table structure for table `social_section`
--

CREATE TABLE `social_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_section`
--

INSERT INTO `social_section` (`id`, `title`, `image_url`) VALUES
(1, 'Công tác xã hội ', 'http://localhost/kimdong_bookstore/api/uploads/681dd6124cf6c.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_section_schools`
--

CREATE TABLE `social_section_schools` (
  `id` int(11) NOT NULL,
  `social_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_section_schools`
--

INSERT INTO `social_section_schools` (`id`, `social_id`, `year`, `location`) VALUES
(1, 1, 1996, 'Trường tiểu học Kim Đồng, thôn Nà Mạ, Cao Bằng'),
(2, 1, 1998, 'Phòng học trường Phong Phú, Quận 9, TP.HCM'),
(3, 1, 1999, 'Phòng học trường tiểu học Tân Quy, Quận 7, TP.HCM'),
(4, 1, 2000, 'Phòng học trường tiểu học Mèo Vạc, Hà Giang'),
(5, 1, 2000, 'Phòng học cho trẻ em tật nguyền, Sơn Lạc, Tuyên Quang');

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar_url`, `created_at`) VALUES
(1, 'Nguyễn Văn A', '/avt_1.png', '2025-03-31 11:00:00'),
(2, 'Trần Thị B', '/avt_2.png', '2025-03-31 11:05:00'),
(3, 'Lê Minh C', '/avt_3.png', '2025-03-31 11:10:00'),
(4, 'Phạm Thanh D', '/avt_4.png', '2025-03-31 11:15:00'),
(5, 'Hoàng Quốc E', '/avt_5.png', '2025-03-31 11:20:00'),
(6, 'Vũ Thị F', '/avt_6.png', '2025-03-31 11:25:00'),
(7, 'Bùi Quốc G', '/avt_7.png', '2025-03-31 11:30:00'),
(8, 'Đỗ Minh H', '/avt_8.png', '2025-03-31 11:35:00'),
(9, 'Ngô Thị I', '/avt_9.png', '2025-03-31 11:40:00'),
(10, 'Dương Thanh J', '/avt_10.png', '2025-03-31 11:45:00');

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
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_answers_question_id` (`question_id`),
  ADD KEY `FK_answers_user_id` (`user_id`),
  ADD KEY `FK_answers_reply_to_answer_id` (`reply_to_answer_id`),
  ADD KEY `FK_answers_reply_to_user_id` (`reply_to_user_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`aut_id`);

--
-- Indexes for table `author_section`
--
ALTER TABLE `author_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `author_section_activities`
--
ALTER TABLE `author_section_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `author_section_paragraphs`
--
ALTER TABLE `author_section_paragraphs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

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
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `feature_questions`
--
ALTER TABLE `feature_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_feature_questions_features` (`feature_id`);

--
-- Indexes for table `generalinfo`
--
ALTER TABLE `generalinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `international_section`
--
ALTER TABLE `international_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `international_section_partners`
--
ALTER TABLE `international_section_partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `international_id` (`international_id`);

--
-- Indexes for table `intro_section`
--
ALTER TABLE `intro_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intro_section_paragraphs`
--
ALTER TABLE `intro_section_paragraphs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intro_id` (`intro_id`);

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
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_questions_user_id` (`user_id`);

--
-- Indexes for table `relatednew`
--
ALTER TABLE `relatednew`
  ADD PRIMARY KEY (`NewID`,`RelatedNewID`),
  ADD KEY `RelatedNewID` (`RelatedNewID`);

--
-- Indexes for table `social_section`
--
ALTER TABLE `social_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_section_schools`
--
ALTER TABLE `social_section_schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_id` (`social_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
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
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `aut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `author_section`
--
ALTER TABLE `author_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `author_section_activities`
--
ALTER TABLE `author_section_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `author_section_paragraphs`
--
ALTER TABLE `author_section_paragraphs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feature_questions`
--
ALTER TABLE `feature_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `generalinfo`
--
ALTER TABLE `generalinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `international_section`
--
ALTER TABLE `international_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `international_section_partners`
--
ALTER TABLE `international_section_partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `intro_section`
--
ALTER TABLE `intro_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `intro_section_paragraphs`
--
ALTER TABLE `intro_section_paragraphs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social_section`
--
ALTER TABLE `social_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_section_schools`
--
ALTER TABLE `social_section_schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `FK_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `FK_answers_reply_to_answer_id` FOREIGN KEY (`reply_to_answer_id`) REFERENCES `answers` (`id`),
  ADD CONSTRAINT `FK_answers_reply_to_user_id` FOREIGN KEY (`reply_to_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_answers_user_id` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `author_section_activities`
--
ALTER TABLE `author_section_activities`
  ADD CONSTRAINT `author_section_activities_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author_section` (`id`);

--
-- Constraints for table `author_section_paragraphs`
--
ALTER TABLE `author_section_paragraphs`
  ADD CONSTRAINT `author_section_paragraphs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author_section` (`id`);

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
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`NewsID`) REFERENCES `news` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commentlike`
--
ALTER TABLE `commentlike`
  ADD CONSTRAINT `commentlike_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentlike_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commentreply`
--
ALTER TABLE `commentreply`
  ADD CONSTRAINT `fk_commentreply_comment` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_commentreply_parent` FOREIGN KEY (`ParrentCommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `feature_questions`
--
ALTER TABLE `feature_questions`
  ADD CONSTRAINT `FK_feature_questions_features` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`);

--
-- Constraints for table `international_section_partners`
--
ALTER TABLE `international_section_partners`
  ADD CONSTRAINT `international_section_partners_ibfk_1` FOREIGN KEY (`international_id`) REFERENCES `international_section` (`id`);

--
-- Constraints for table `intro_section_paragraphs`
--
ALTER TABLE `intro_section_paragraphs`
  ADD CONSTRAINT `intro_section_paragraphs_ibfk_1` FOREIGN KEY (`intro_id`) REFERENCES `intro_section` (`id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`WrittenByAdminID`) REFERENCES `accountadmin` (`id`);

--
-- Constraints for table `newsupdatelog`
--
ALTER TABLE `newsupdatelog`
  ADD CONSTRAINT `newsupdatelog_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `newsupdatelog_ibfk_2` FOREIGN KEY (`NewID`) REFERENCES `news` (`ID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_questions_user_id` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relatednew`
--
ALTER TABLE `relatednew`
  ADD CONSTRAINT `relatednew_ibfk_1` FOREIGN KEY (`NewID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `relatednew_ibfk_2` FOREIGN KEY (`RelatedNewID`) REFERENCES `news` (`ID`);

--
-- Constraints for table `social_section_schools`
--
ALTER TABLE `social_section_schools`
  ADD CONSTRAINT `social_section_schools_ibfk_1` FOREIGN KEY (`social_id`) REFERENCES `social_section` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
