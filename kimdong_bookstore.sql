-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 07, 2025 lúc 04:13 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kimdong_bookstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`ID`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`ID`, `Name`) VALUES
(1, 'Hoạt động'),
(2, 'Sự kiện'),
(3, 'Điểm sách'),
(4, 'Sách giả - Sách lậu'),
(5, 'Lịch phát hành sách định kỳ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `ID` int(11) NOT NULL,
  `Content` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `NewsID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
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
-- Cấu trúc bảng cho bảng `commentlike`
--

CREATE TABLE `commentlike` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `commentlike`
--

INSERT INTO `commentlike` (`UserID`, `CommentID`) VALUES
(1, 2),
(1, 3),
(1, 7),
(2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `commentreply`
--

CREATE TABLE `commentreply` (
  `CommentID` int(11) NOT NULL,
  `ParrentCommentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `commentreply`
--

INSERT INTO `commentreply` (`CommentID`, `ParrentCommentID`) VALUES
(7, 3),
(23, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
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
-- Đang đổ dữ liệu cho bảng `news`
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
-- Cấu trúc bảng cho bảng `newsupdatelog`
--

CREATE TABLE `newsupdatelog` (
  `AdminID` int(11) NOT NULL,
  `NewID` int(11) NOT NULL,
  `UpdateAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `newsupdatelog`
--

INSERT INTO `newsupdatelog` (`AdminID`, `NewID`, `UpdateAt`) VALUES
(1, 1, '2025-04-30 14:24:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `relatednew`
--

CREATE TABLE `relatednew` (
  `NewID` int(11) NOT NULL,
  `RelatedNewID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `relatednew`
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
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`) VALUES
(1),
(2),
(3),
(4),
(5);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NewsID` (`NewsID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `commentlike`
--
ALTER TABLE `commentlike`
  ADD PRIMARY KEY (`UserID`,`CommentID`),
  ADD KEY `commentlike_ibfk_2` (`CommentID`);

--
-- Chỉ mục cho bảng `commentreply`
--
ALTER TABLE `commentreply`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `fk_commentreply_parent` (`ParrentCommentID`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `WrittenByAdminID` (`WrittenByAdminID`);

--
-- Chỉ mục cho bảng `newsupdatelog`
--
ALTER TABLE `newsupdatelog`
  ADD PRIMARY KEY (`NewID`,`AdminID`);

--
-- Chỉ mục cho bảng `relatednew`
--
ALTER TABLE `relatednew`
  ADD PRIMARY KEY (`NewID`,`RelatedNewID`),
  ADD KEY `RelatedNewID` (`RelatedNewID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`NewsID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

--
-- Các ràng buộc cho bảng `commentlike`
--
ALTER TABLE `commentlike`
  ADD CONSTRAINT `commentlike_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `commentlike_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `commentreply`
--
ALTER TABLE `commentreply`
  ADD CONSTRAINT `fk_commentreply_comment` FOREIGN KEY (`CommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_commentreply_parent` FOREIGN KEY (`ParrentCommentID`) REFERENCES `comment` (`ID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`WrittenByAdminID`) REFERENCES `admin` (`ID`);

--
-- Các ràng buộc cho bảng `newsupdatelog`
--
ALTER TABLE `newsupdatelog`
  ADD CONSTRAINT `newsupdatelog_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `newsupdatelog_ibfk_2` FOREIGN KEY (`NewID`) REFERENCES `news` (`ID`);

--
-- Các ràng buộc cho bảng `relatednew`
--
ALTER TABLE `relatednew`
  ADD CONSTRAINT `relatednew_ibfk_1` FOREIGN KEY (`NewID`) REFERENCES `news` (`ID`),
  ADD CONSTRAINT `relatednew_ibfk_2` FOREIGN KEY (`RelatedNewID`) REFERENCES `news` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
