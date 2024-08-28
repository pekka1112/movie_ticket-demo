-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 09, 2024 lúc 10:26 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
DROP DATABASE IF EXISTS movie_ticket;

CREATE DATABASE movie_ticket
		CHARACTER SET "utf8mb4"
		COLLATE "utf8mb4_general_ci";
USE movie_ticket;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `movie_ticket`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `actor`
--

CREATE TABLE `actor` (
  `actorID` varchar(20) NOT NULL,
  `movieID` varchar(20) NOT NULL,
  `actorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `actor`
--

INSERT INTO `actor` (`actorID`, `movieID`, `actorName`, `dob`, `gender`) VALUES
('At1', 'Mv1', 'Hoàng Hà', '0000-00-00', 'Female'),
('At10', 'Mv5', 'Ryo Yoshizawa', '0000-00-00', 'Male'),
('At11', 'Mv6', 'Chi Pu', '0000-00-00', 'Female'),
('At12', 'Mv6', 'Thuận Nguyễn', '0000-00-00', 'Male'),
('At13', 'Mv7', 'Iitoyo Marie', '0000-00-00', 'Female'),
('At14', 'Mv7', 'Suzuka Ouji', '0000-00-00', 'Male'),
('At15', 'Mv8', 'Kang Mi-na', '0000-00-00', 'Female'),
('At16', 'Mv8', 'Yoo Seon-ho', '0000-00-00', 'Male'),
('At17', 'Mv9', 'Yeo Min-jeong', '0000-00-00', 'Female'),
('At18', 'Mv9', 'Choi Joon-young', '0000-00-00', 'Male'),
('At19', 'Mv10', 'Taylor Alison Swift', '0000-00-00', 'Female'),
('At2', 'Mv1', 'Võ Điền Gia Huy', '0000-00-00', 'Male'),
('At3', 'Mv2', 'Joseph Jason Namakaeha Momoa', '0000-00-00', 'Male'),
('At4', 'Mv2', 'Nicole Mary Kidman AC ', '0000-00-00', 'Female'),
('At5', 'Mv3', 'Soma Santoki', '0000-00-00', 'Male'),
('At6', 'Mv3', 'Aimyon', '0000-00-00', 'Female'),
('At7', 'Mv4', 'Timothée Hal Chalamet ', '0000-00-00', 'Male'),
('At8', 'Mv4', 'Sally Cecilia Hawkins', '0000-00-00', 'Female'),
('At9', 'Mv5', 'Shunsuke Sakuya', '0000-00-00', 'Male');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `bookingID` varchar(20) NOT NULL,
  `ticketID` varchar(20) NOT NULL,
  `userID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking`
--

INSERT INTO `booking` (`bookingID`, `ticketID`, `userID`) VALUES
('bk1', 'tk1', 'user1'),
('bk2', 'tk2', 'user2'),
('bk3', 'tk3', 'user3'),
('bk4', 'tk4', 'user4'),
('bk5', 'tk5', 'user1'),
('bk6', 'tk6', 'user2'),
('bk7', 'tk7', 'user3'),
('bk8', 'tk8', 'user4'),
('bk9', 'tk9', 'user2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookingdetail`
--

CREATE TABLE `bookingdetail` (
  `bookingDetailID` varchar(20) NOT NULL,
  `bookingID` varchar(20) NOT NULL,
  `bookingDate` date NOT NULL,
  `totalTicket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bookingdetail`
--

INSERT INTO `bookingdetail` (`bookingDetailID`, `bookingID`, `bookingDate`, `totalTicket`) VALUES
('bkdt1', 'bk1', '2024-01-21', 200000),
('bkdt2', 'bk2', '2024-01-21', 300000),
('bkdt3', 'bk3', '2024-01-22', 200000),
('bkdt4', 'bk4', '2024-01-23', 200000),
('bkdt5', 'bk5', '2024-01-26', 400000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cartID` varchar(20) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `movieID` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cinema`
--

CREATE TABLE `cinema` (
  `cinemaID` varchar(20) NOT NULL,
  `cinemaName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cinemaRoomID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cinema`
--

INSERT INTO `cinema` (`cinemaID`, `cinemaName`, `location`, `cinemaRoomID`) VALUES
('cnm1', 'Cinestar Quốc Thanh', '271 Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1, Tp. Hồ Chí Minh', 'cr1'),
('cnm10', 'CGV CT Plaza', 'Tầng 10, CT Plaza, 60A Trường Sơn, P.2, Q. Tân Bình, Tp. Hồ Chí Minh', 'cr2'),
('cnm11', 'CGV Crescent Mall', 'Lầu 5, Crescent Mall Đại lộ Nguyễn Văn Linh, Phú Mỹ Hưng, Q.7 Tp. Hồ Chí Minh', 'cr3'),
('cnm12', 'CGV Aeon Tân Phú', 'Lầu 3, Aeon Mall 30 Bờ Bao Tân Thắng, P. Sơn Kỳ, Q. Tân Phú, Tp. Hồ Chí Minh', 'cr2'),
('cnm2', 'Cinestar Hai Bà Trưng', '135 Hai Bà Trưng, P. Bến Nghé, Q.1, Tp. Hồ Chí Minh', 'cr2'),
('cnm3', 'Mega GS Cao Thắng', 'Lầu 6 - 7, 19 Cao Thắng, P.2, Q.3, Tp. Hồ Chí Minh', 'cr3'),
('cnm4', 'DCINE Bến Thành', 'Số 6, Mạc Đĩnh Chi, Q.1, Tp. Hồ Chí Minh', 'cr4'),
('cnm5', 'Beta Quang Trung', '645 Quang Trung, Phường 11, Quận Gò Vấp, Thành phố Hồ Chí Minh', 'cr1'),
('cnm6', 'Galaxy Nguyễn Du', '116 Nguyễn Du, Q.1, Tp. Hồ Chí Minh', 'cr2'),
('cnm7', 'Galaxy Tân Bình', '246 Nguyễn Hồng Đào, Q.Tân Bình, Tp. Hồ Chí Minh', 'cr3'),
('cnm8', 'Galaxy Kinh Dương Vương', '718bis Kinh Dương Vương, Q.6, Tp. Hồ Chí Minh', 'cr4'),
('cnm9', 'Galaxy Phạm Văn Chí', 'Platinum Plaza, 634 Bis Phạm Văn Chí, Phường 8, Quận 6 Tp. Hồ Chí Minh', 'cr1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cinemaroom`
--

CREATE TABLE `cinemaroom` (
  `cinemaRoomID` varchar(20) NOT NULL,
  `roomName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cinemaroom`
--

INSERT INTO `cinemaroom` (`cinemaRoomID`, `roomName`) VALUES
('cr1', 'Phòng 1'),
('cr2', 'Phòng 2'),
('cr3', 'Phòng 3'),
('cr4', 'Phòng 4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contain`
--

CREATE TABLE `contain` (
  `cinemaID` varchar(20) NOT NULL,
  `showtimeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contain`
--

INSERT INTO `contain` (`cinemaID`, `showtimeID`) VALUES
('cnm1', 'st21'),
('cnm1', 'st22'),
('cnm1', 'st23'),
('cnm1', 'st24'),
('cnm1', 'st25'),
('cnm1', 'st26'),
('cnm10', 'st10'),
('cnm10', 'st27'),
('cnm10', 'st28'),
('cnm2', 'st2'),
('cnm2', 'st6'),
('cnm3', 'st3'),
('cnm4', 'st3'),
('cnm4', 'st4'),
('cnm5', 'st1'),
('cnm5', 'st2'),
('cnm5', 'st5'),
('cnm6', 'st6'),
('cnm7', 'st7'),
('cnm8', 'st5'),
('cnm9', 'st9');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie`
--

CREATE TABLE `movie` (
  `movieID` varchar(20) NOT NULL,
  `movieName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movieCategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `releaseDate` date NOT NULL,
  `director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `movieDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `movieContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isPublished` tinyint(1) NOT NULL,
  `movieScore` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`movieID`, `movieName`, `movieCategory`, `releaseDate`, `director`, `duration`, `country`, `movieDescription`, `movieContent`, `isPublished`, `movieScore`) VALUES
('Mv1', 'Kẻ Ăn Hồn', 'Gay cấn, Kinh dị, Ma', '2024-01-15', 'Trần Hữu Tấn', '113 phút', 'Việt Nam', 'Có một kẻ luyện Rượu Sọ Người trong làng Địa Ngục.', 'Kẻ Ăn Hồn - phim về hàng loạt cái chết bí ẩn ở Làng Địa Ngục, nơi có ma thuật cổ xưa: 5 mạng đổi bình Rượu Sọ Người. Thập Nương - cô gái áo đỏ là kẻ nắm giữ bí thuật luyện nên loại rượu mạnh nhất!', 1, 9.1),
('Mv10', 'Kỷ Nguyên của TaylorSwift', 'Âm Nhạc', '2024-01-13', 'Sam Wrench', '169 phút', 'Mỹ', 'Đến lúc ra rạp tận hưởng show của chị đẹp rồi!', 'Hiện tượng văn hóa tiếp tục trên màn ảnh lớn! Đắm chìm trong trải nghiệm xem phim hòa nhạc độc nhất vô nhị với góc nhìn ngoạn mục, đậm chất điện ảnh về chuyến lưu diễn mang tính lịch sử. Khuyến khích khán giả đeo vòng tay tình bạn và mặc trang phục Taylor', 1, 9.9),
('Mv11', 'Argylle: Siêu Điệp Viên', 'Gay cấn, Hành động, Phiêu lưu', '2024-02-10', 'Elly Conway', '08:30:00', 'Mỹ', 'Một khi đã biết bí mật, đừng làm con mèo lẻo mép', 'Argylle là ai? Duy nhất 1 cách có thể tìm ra câu trả lời.”.', 0, 7.5),
('Mv12', 'MAI', 'Lãng mạn, Tình cảm, Tâm lý', '2024-02-10', 'Trấn Thành', '06:30:00', 'Việt Nam', 'Quá khứ chưa ngủ yên, ngày mai liệu sẽ đến?', 'MAI xoay quanh câu chuyện về cuộc đời của một người phụ nữ cùng tên với bộ phim. Trên First-look Poster, Phương Anh Đào tạo ấn tượng mạnh với cái nhìn tĩnh lặng, xuyên thấu, đặc biệt, trên bờ môi nữ diễn viên là hình ảnh cô đang nằm nghiêng trên mặt nước.', 0, 0),
('Mv13', 'Godzilla x Kong: Đế Chế Mới', 'Hành động, Phiêu lưu, Viễn tưởng', '2024-05-17', 'Terry Rossio, Jeremy Slater và Simon Barrett', '09:30:00', 'Mỹ', 'Cúi đầu trước vị vua mới.', 'Sau cuộc đối đầu nổ lực, Godzilla và Kong phải hợp tác chống lại một mối đe dọa khổng lồ chưa được khám phá ẩn sâu trong thế giới của chúng ta, thách thức sự tồn tại của chính chúng – và của chúng ta.', 0, 0),
('Mv14', 'Gặp Lại Chị Bầu', 'Gia đình, Hài, Lãng mạn, Tình cảm', '2024-02-10', 'Nhất Trung', '12:30:00', 'Việt Nam', 'Hạnh phúc bất ngờ từ cuộc gặp khó đỡ!', '“Gặp Lại Chị Bầu” xoay quanh Phúc, một thanh viên trẻ với đam mê diễn xuất nhưng phải trải qua cuộc sống muôn vàn khó khăn. Anh tình cờ lưu lạc đến xóm trọ của bà Lê và cùng những người bạn ở đây trải qua những ngày tháng thanh xuân đáng nhớ nhất cuộc đời', 0, 0),
('Mv15', 'Những Mảnh Ghép Cảm Xúc 2', 'Gia đình, Hài, Hoạt hình', '2024-06-14', 'Pixar', '08:30:00', 'Mỹ', 'Thay đổi mới. Cảm xúc mới.', 'Một cuộc phiêu lưu hoàn toàn mới bên trong đầu của Riley với một bộ cảm xúc mới.', 0, 8.2),
('Mv16', 'Nhà Bà Nữ', 'Chính kịch, Hài, Tâm lý', '2024-01-22', 'Trấn Thành', '102 phút', 'Việt Nam', 'Ai cũng có lỗi, nhưng ai cũng nghĩ mình là nạn nhân...', 'Câu chuyện xoay quanh gia đình bà Nữ gồm ba thế hệ sống cùng nhau trong một ngôi nhà. Bà Nữ một tay cáng đáng mọi sự, nổi tiếng với quán bánh canh cua và cũng khét tiếng với việc kiểm soát cuộc sống của tất cả mọi người, từ con gái đến con rể. Mọi chuyện ', 1, 8.3),
('Mv17', 'Lật Mặt 6: Tấm Vé Định Mệnh', 'Bí ẩn, Chính kịch, Hài, Hành động', '2024-04-28', 'Lý Hải ', '132 phút', 'Việt Nam', 'Tri kỷ hay trăm tỷ?.', 'Nội dung phim kể về tấm vé có mệnh giá 10 ngàn đồng và sở hữu những con số \"định mệnh\" gồm 10, 16, 18, 20, 27, 28 - đây là tập hợp những con số ngày sinh của hội bạn thân gồm 6 người. Câu chuyện bắt đầu khi cả 6 người bạn thân quyết định mua một tấm vé số', 1, 9),
('Mv18', 'Khóa Chặt Cửa Nào Suzume', 'Chính kịch, Phiêu lưu, Hoạt hình, Viễn tưởng', '2024-10-03', 'Shinkai Makoto', '121 phút', 'Nhật Bản', 'Ở bên kia cánh cửa có phải tất cả thời gian sẽ ở trong đó?', 'Suzume, 17 tuổi, mồ côi mẹ từ nhỏ. Trên đường đến trường, cô gặp một chàng trai bí ẩn. Nhưng sự tò mò của cô ấy đã gây ra một tai họa gây nguy hiểm cho toàn bộ người dân Nhật Bản, vì vậy Suzume bắt đầu cuộc hành trình để giải quyết mọi việc.', 1, 9.3),
('Mv19', 'Spider-Man: No Way Home', 'Hành động, Phiêu lưu, Viễn tưởng, Siêu anh hùng', '2022-09-01', 'Marvel', '148 phút', 'Mỹ', 'Phiên bản nhiều sự thú vị hơn của 3 Nhện!', 'Phần 3: Nhện Nhọ không có đường về nhà! Peter Parker đã bị lộ mặt và không còn có thể tách biệt cuộc sống bình thường của mình với những yêu cầu cao của việc trở thành một Siêu anh hùng. Khi anh ta yêu cầu sự giúp đỡ từ Doctor Strange, mọi thứ càng trở nê', 1, 8.2),
('Mv2', 'Aquaman: Vương Quốc Thất Lạc', 'Hành động, Phiêu lưu, Viễn tưởng, Siêu anh hùng', '2024-01-22', 'James Wan', '123 phút', 'Mỹ', 'Dòng nước đã đổi chiều!', 'Black Manta khao khát trả thù cái chết của cha mình và giờ đây hắn cầm trong tay sức mạnh của cây Đinh Ba Đen huyền thoại, hắn sẽ không dừng lại trước khi hạ gục Aquaman một lần và mãi mãi. Để đánh bại Black Manta, Aquaman phải nhờ sự trợ giúp của người a', 0, 9.6),
('Mv20', 'Chú Thuật Hồi Chiến: 0', 'Hành động, Phiêu lưu, Hoạt hình, Viễn tưởng', '2022-04-14', 'Mappa', '105 phút', 'Nhật Bản', 'Chú thuật sư đời đầu.', 'Yuta Okkotsu là một học sinh trung học đang gặp phải một vấn đề nghiêm trọng - người bạn thời thơ ấu của anh là Rika, đã biến thành một Chú Linh và sẽ không để anh yên. Vì Rika không phải là một Chú Linh bình thường, nên đã được Satoru Gojo xử lí, một giá', 1, 9),
('Mv3', 'Thiếu Niên và Chim Diệc', 'Chính kịch, Phiêu lưu, Hoạt hình, Viễn tưởng', '2024-01-15', 'Miyazaki Hayao', '136 phút', 'Nhật Bản', 'Nơi cái chết kết thúc. Cuộc sống tìm thấy một khởi đầu mới.', 'Trong khi Thế chiến thứ hai đang diễn ra, cậu thiếu niên Mahito, bị ám ảnh bởi cái chết bi thảm của mẹ, được chuyển từ Tokyo đến ngôi nhà nông thôn yên bình của mẹ kế mới Natsuko, một người phụ nữ có nét tương đồng nổi bật với mẹ của cậu. Khi cậu cố gắng ', 1, 8.8),
('Mv4', 'Wonka', 'Gia đình, Hài, Viễn tưởng', '2024-01-08', 'Paul King', '131 phút', 'Mỹ', 'Mọi điều tốt đẹp trên thế giới này đều bắt đầu từ một giấc mơ.', 'Dựa trên nhân vật từ quyến sách gối đầu giường của các em nhỏ trên toàn thế giới \"Charlie và Nhà Máy Sôcôla\" và phiên bản phim điện ảnh cùng tên vào năm 2005, WONKA kể câu chuyện kỳ diệu về hành trình của nhà phát minh, ảo thuật gia và nhà sản xuất sôcôla', 1, 8.8),
('Mv5', 'NCT NATION: Vươn Tầm Thế Giới', 'Tài liệu, Âm Nhạc', '2024-01-06', 'Yoon Dong Oh', '102 phút', 'Hàn Quốc', 'Lời cảm ơn chân thành tới tất cả NCTzens trong lòng có anh.', '\"NCT NATION: To The World in Cinemas\" đánh dấu sự khởi đầu thú vị của NCT và chuyến hành trình chia sẻ các bản nhạc độc đáo cùng những màn trình diễn ngoạn mục, khẳng định vị thế tiên phong của NCT NATION trong thể loại K-Pop. Bộ concert movie hoàn toàn m', 1, 9.9),
('Mv6', 'Người Mặt Trời', 'Kinh dị', '2024-01-08', 'Timothy Linh Bùi', '115 phút', 'Việt Nam', 'Chung dòng máu,hai số phận!', '400 năm qua, loài Ma Cà Rồng đã bí mật sống giữa loài người trong hòa bình, nhưng hiểm họa bỗng ập đến khi một cô gái loài người phát hiện được thân phận của hai anh em Ma Cà Rồng. Người anh khát máu quyết săn lùng cô để bảo vệ bí mật giống loài, trong kh', 1, 7.8),
('Mv7', 'Đường Hầm Tới Mùa Hạ, Lối Thoát Của Biệt Ly', 'Chính kịch, Hoạt hình, Viễn tưởng, Tình cảm', '2024-01-01', 'Taguchi Tomohisa', '84 phút', 'Nhật Bản', 'Một đường hầm bí ẩn có thể thực hiện điều ước trong lòng bạn… nhưng bạn sẽ phải trả một cái giá.', 'TDựa trên cuốn tiểu thuyết đạt giải thưởng. Bộ phim chuyển thể giành giải thưởng Paul Grimault tại Liên hoan phim hoạt hình quốc tế Annecy 2023. Một đường hầm bí ẩn tên Urashima có thể thực hiện bất kỳ điều ước nào…nhưng bạn sẽ phải đánh đổi bằng thời gia', 1, 8.7),
('Mv8', 'Bỗng Dưng Trúng Mánh', 'Chính kịch, Hành động', '2024-01-01', 'Hwang Dong-seok', '105 phút', 'Hàn Quốc', 'Từ đáy xã hội tôi trở thành sói đầu đàn.', 'Bỗng Dưng Trúng Mánh là câu chuyện từ cá biệt toàn trường hoá tài phiệt học đường của Lee Kang-jin (Yoo Seon-ho) - một nam sinh thường xuyên bị bạn học bắt nạt. Tình cờ nhặt được chiếc phong bì chứa đầy tiền mặt của ông trùm cho vay nặng lãi Rang (Yoon By', 1, 4.7),
('Mv9', 'Xin Chào Jadoo', 'Hoạt hình', '2024-01-15', 'Son Seok-woo', '75 phút', 'Hàn Quốc', 'NHóa thân thành nhân vật chính thôi!', 'Bộ phim Hello Jadoo nổi bật với cốt truyện vô cùng khác biệt, đưa nhân vật Jadoo bước đến cuộc hành trình phiêu lưu vào một thế giới cổ tích tuyệt vời thông qua cuốn sách ma thuật mà Jadoo phát hiện ra trong chuyến thăm công viên giải trí.', 1, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movieimage`
--

CREATE TABLE `movieimage` (
  `movieID` varchar(20) NOT NULL,
  `movieImageID` varchar(20) NOT NULL,
  `linkMovieImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movieimage`
--

INSERT INTO `movieimage` (`movieID`, `movieImageID`, `linkMovieImage`) VALUES
('Mv1', 'mml1', 'ke-an-hon.png'),
('Mv10', 'mml10', 'nhung-ky-nguyen-cua-taylor-swift.jpg'),
('Mv11', 'mml11', 'argylle-sieu-diep-vien.png'),
('Mv12', 'mml12', 'mai.png'),
('Mv13', 'mml13', 'godzilla-kong-de-che-moi.png'),
('Mv14', 'mml14', 'gap-lai-chi-bau.png'),
('Mv15', 'mml15', 'nhung-manh-ghep-cam-xuc.png'),
('Mv16', 'mml16', 'nha-ba-nu.png'),
('Mv17', 'mml17', 'lat-mat-6.png'),
('Mv18', 'mml18', 'khoa-chat-cua-nao-suzume.png'),
('Mv19', 'mml19', 'spiderman-no-way-home.png'),
('Mv2', 'mml2', 'aquaman-vuong-quoc-that-lac.jpg'),
('Mv20', 'mml20', 'chu-thuat-hoi-chien-0.png'),
('Mv3', 'mml3', 'thieu-nien-va-chim-diec.jpg'),
('Mv4', 'mml4', 'wonka.png'),
('Mv5', 'mml5', 'nct-nation-vuon-tam-the-gioi.jpeg'),
('Mv6', 'mml6', 'nguoi-mat-troi.png'),
('Mv7', 'mml7', 'duong-ham-toi-mua-ha.jpg'),
('Mv8', 'mml8', 'bong-dung-trung-manh.jpg'),
('Mv9', 'mml9', 'xin-chao-jadoo.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movietrailer`
--

CREATE TABLE `movietrailer` (
  `movieID` varchar(20) NOT NULL,
  `movieTrailerID` varchar(20) NOT NULL,
  `linkMovieTrailer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movietrailer`
--

INSERT INTO `movietrailer` (`movieID`, `movieTrailerID`, `linkMovieTrailer`) VALUES
('Mv1', 'ke-an-hon.png', 'https://www.youtube.com/embed/xWh0g4rKGjI'),
('Mv10', 'nhung-ky-nguyen-cua-taylor-swift.jpg', 'https://www.youtube.com/embed/cwLAor_smGw'),
('Mv11', 'argylle-sieu-diep-vien.png', 'https://www.youtube.com/embed/YQ2GbAV0jTw'),
('Mv12', 'mai.png', 'https://www.youtube.com/embed/Yz96EBNwMGw'),
('Mv13', 'godzilla-kong-de-che-moi.png', 'https://www.youtube.com/embed/jHWeXs31Uig'),
('Mv14', 'gap-lai-chi-bau.png', 'https://www.youtube.com/embed/Gggw9jwr1h4'),
('Mv15', 'nhung-manh-ghep-cam-xuc.png', 'https://www.youtube.com/embed/AfOlW2OrzqE'),
('Mv16', 'nha-ba-nu.png', 'https://www.youtube.com/embed/IkaP0KJWTsQ'),
('Mv17', 'lat-mat-6.png', 'https://www.youtube.com/embed/o3FoowSoNr4'),
('Mv18', 'khoa-chat-cua-nao-suzume.png', 'https://www.youtube.com/embed/xQ4_c8JfuzI'),
('Mv19', 'spiderman-no-way-home.png', 'https://www.youtube.com/embed/OB3g37GTALc'),
('Mv2', 'aquaman-vuong-quoc-that-lac.jpg', 'https://www.youtube.com/embed/mRGMMd8eazw'),
('Mv20', 'chu-thuat-hoi-chien-0.png', 'https://www.youtube.com/embed/ceqa2pIN9ng'),
('Mv3', 'thieu-nien-va-chim-diec.jpg', 'https://www.youtube.com/embed/eggzAobZzHc'),
('Mv4', 'wonka.png', 'https://www.youtube.com/embed/otNh9bTjXWg'),
('Mv5', 'nct-nation-vuon-tam-the-gioi.jpeg', 'https://www.youtube.com/embed/soeosaczFGw'),
('Mv6', 'nguoi-mat-troi.png', 'https://www.youtube.com/embed/5yreWvGqbyg'),
('Mv7', 'duong-ham-toi-mua-ha.jpg', 'https://www.youtube.com/embed/38B5-Ft_doo'),
('Mv8', 'bong-dung-trung-manh.jpg', 'https://www.youtube.com/embed/cH2lE3fxelc'),
('Mv9', 'xin-chao-jadoo.jpg', 'https://www.youtube.com/embed/Yuy029-UlOE');

-- --------------------------------------------------------

CREATE TABLE `moviemedialink` (
  `movieID` varchar(20) NOT NULL,
  `linkMovieImage` VARCHAR(255) DEFAULT NULL,
  `linkMovieTrailer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `moviemedialink` (`movieID`, `linkMovieImage`, `linkMovieTrailer`) VALUES
('Mv1', 'ke-an-hon.png', 'https://www.youtube.com/embed/xWh0g4rKGjI'),
('Mv10', 'nhung-ky-nguyen-cua-taylor-swift.jpg', 'https://www.youtube.com/embed/cwLAor_smGw'),
('Mv11', 'argylle-sieu-diep-vien.png', 'https://www.youtube.com/embed/YQ2GbAV0jTw'),
('Mv12', 'mai.png', 'https://www.youtube.com/embed/Yz96EBNwMGw'),
('Mv13', 'godzilla-kong-de-che-moi.png', 'https://www.youtube.com/embed/jHWeXs31Uig'),
('Mv14', 'gap-lai-chi-bau.png', 'https://www.youtube.com/embed/Gggw9jwr1h4'),
('Mv15', 'nhung-manh-ghep-cam-xuc.png', 'https://www.youtube.com/embed/AfOlW2OrzqE'),
('Mv16', 'nha-ba-nu.png', 'https://www.youtube.com/embed/IkaP0KJWTsQ'),
('Mv17', 'lat-mat-6.png', 'https://www.youtube.com/embed/o3FoowSoNr4'),
('Mv18', 'khoa-chat-cua-nao-suzume.png', 'https://www.youtube.com/embed/xQ4_c8JfuzI'),
('Mv19', 'spiderman-no-way-home.png', 'https://www.youtube.com/embed/OB3g37GTALc'),
('Mv2', 'aquaman-vuong-quoc-that-lac.jpg', 'https://www.youtube.com/embed/mRGMMd8eazw'),
('Mv20', 'chu-thuat-hoi-chien-0.png', 'https://www.youtube.com/embed/ceqa2pIN9ng'),
('Mv3', 'thieu-nien-va-chim-diec.jpg', 'https://www.youtube.com/embed/eggzAobZzHc'),
('Mv4', 'wonka.png', 'https://www.youtube.com/embed/otNh9bTjXWg'),
('Mv5', 'nct-nation-vuon-tam-the-gioi.jpeg', 'https://www.youtube.com/embed/soeosaczFGw'),
('Mv6', 'nguoi-mat-troi.png', 'https://www.youtube.com/embed/5yreWvGqbyg'),
('Mv7', 'duong-ham-toi-mua-ha.jpg', 'https://www.youtube.com/embed/38B5-Ft_doo'),
('Mv8', 'bong-dung-trung-manh.jpg', 'https://www.youtube.com/embed/cH2lE3fxelc'),
('Mv9', 'xin-chao-jadoo.jpg', 'https://www.youtube.com/embed/Yuy029-UlOE');


--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `paymentTypeID` varchar(20) NOT NULL,
  `paymentTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`paymentTypeID`, `paymentTypeName`) VALUES
('pm1', 'momo'),
('pm2', 'bidv'),
('pm3', 'Agribank'),
('pm4', 'Oceanbank'),
('pm5', 'GPBank');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `roleID` tinyint(1) NOT NULL,
  `roleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seat`
--

CREATE TABLE `seat` (
  `seatID` varchar(20) NOT NULL,
  `seatName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seatType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cinemaRoomID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `seat`
--

INSERT INTO `seat` (`seatID`, `seatName`, `seatType`, `cinemaRoomID`) VALUES
('seat1', 'a1', 'thường', 'cr1'),
('seat10', 'a2', 'thường', 'cr3'),
('seat11', 'a3', 'thường', 'cr3'),
('seat12', 'a4', 'thường', 'cr3'),
('seat13', 'a1', 'thường', 'cr4'),
('seat14', 'a2', 'thường', 'cr4'),
('seat15', 'a3', 'thường', 'cr4'),
('seat16', 'a4', 'thường', 'cr4'),
('seat17', 'b1', 'thường', 'cr1'),
('seat18', 'b2', 'thường', 'cr2'),
('seat19', 'b1', 'thường', 'cr3'),
('seat2', 'a2', 'thường', 'cr1'),
('seat20', 'b2', 'thường', 'cr4'),
('seat21', 't4', 'thường', 'cr1'),
('seat22', 'h5', 'thường', 'cr3'),
('seat23', 'h7', 'thường', 'cr3'),
('seat24', 'h8', 'thường', 'cr3'),
('seat25', 'c3', 'thường', 'cr4'),
('seat26', 'a2', 'thường', 'cr4'),
('seat27', 'c1', 'thường', 'cr4'),
('seat28', 'a4', 'thường', 'cr4'),
('seat29', 'h5', 'thường', 'cr1'),
('seat3', 'a3', 'thường', 'cr1'),
('seat30', 'b2', 'thường', 'cr2'),
('seat31', 'g5', 'thường', 'cr3'),
('seat32', 'f5', 'thường', 'cr1'),
('seat33', 'v5', 'thường', 'cr4'),
('seat34', 'b6', 'thường', 'cr1'),
('seat35', 'g5', 'thường', 'cr1'),
('seat36', 'r4', 'thường', 'cr2'),
('seat37', 'd2', 'thường', 'cr2'),
('seat38', 'f1', 'thường', 'cr2'),
('seat39', 'f9', 'thường', 'cr2'),
('seat4', 'a4', 'thường', 'cr1'),
('seat5', 'a1', 'thường', 'cr2'),
('seat6', 'a2', 'thường', 'cr2'),
('seat7', 'a3', 'thường', 'cr2'),
('seat8', 'a4', 'thường', 'cr2'),
('seat9', 'a1', 'thường', 'cr3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `showtime`
--

CREATE TABLE `showtime` (
  `showtimeID` varchar(20) NOT NULL,
  `movieID` varchar(20) NOT NULL,
  `showDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `showtime`
--

INSERT INTO `showtime` (`showtimeID`, `movieID`, `showDate`, `startTime`, `endTime`) VALUES
('st1', 'Mv1', '2024-01-22', '17:00:00', '19:00:00'),
('st10', 'Mv5', '2024-01-25', '20:00:00', '22:00:00'),
('st11', 'Mv6', '2024-01-26', '08:00:00', '10:00:00'),
('st12', 'Mv6', '2024-01-26', '10:00:00', '12:00:00'),
('st13', 'Mv2', '2024-01-27', '10:00:00', '12:00:00'),
('st14', 'Mv2', '2024-01-27', '12:00:00', '14:00:00'),
('st15', 'Mv2', '2024-01-27', '14:00:00', '16:00:00'),
('st16', 'Mv2', '2024-01-27', '16:00:00', '20:00:00'),
('st17', 'Mv2', '2024-01-28', '10:00:00', '12:00:00'),
('st18', 'Mv2', '2024-01-28', '08:00:00', '10:00:00'),
('st19', 'Mv2', '2024-01-28', '12:00:00', '14:00:00'),
('st2', 'Mv1', '2024-01-22', '19:00:00', '21:00:00'),
('st20', 'Mv2', '2024-01-28', '14:00:00', '16:00:00'),
('st21', 'Mv1', '2024-01-23', '14:00:00', '16:00:00'),
('st22', 'Mv2', '2024-01-23', '14:00:00', '16:00:00'),
('st23', 'Mv3', '2024-01-20', '14:00:00', '16:00:00'),
('st24', 'Mv4', '2024-01-24', '14:00:00', '16:00:00'),
('st25', 'Mv5', '2024-01-23', '14:00:00', '16:00:00'),
('st26', 'Mv12', '2024-01-25', '14:00:00', '16:00:00'),
('st27', 'Mv5', '2024-01-22', '16:00:00', '18:00:00'),
('st28', 'Mv5', '2024-01-22', '18:00:00', '20:00:00'),
('st3', 'Mv2', '2024-01-28', '08:00:00', '10:00:00'),
('st4', 'Mv2', '2024-01-26', '10:00:00', '12:00:00'),
('st5', 'Mv3', '2024-01-23', '08:00:00', '10:00:00'),
('st6', 'Mv3', '2024-01-23', '12:00:00', '14:00:00'),
('st7', 'Mv4', '2024-01-24', '14:00:00', '16:00:00'),
('st8', 'Mv4', '2024-01-24', '16:00:00', '18:00:00'),
('st9', 'Mv5', '2024-01-25', '18:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `ticketID` varchar(20) NOT NULL,
  `cinemaID` varchar(20) NOT NULL,
  `showtimeID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`ticketID`, `cinemaID`, `showtimeID`) VALUES
('tk1', 'cnm1', 'st1'),
('tk10', 'cnm10', 'st10'),
('tk2', 'cnm2', 'st2'),
('tk3', 'cnm3', 'st3'),
('tk4', 'cnm4', 'st4'),
('tk5', 'cnm5', 'st5'),
('tk6', 'cnm6', 'st6'),
('tk7', 'cnm7', 'st7'),
('tk8', 'cnm8', 'st8'),
('tk9', 'cnm9', 'st9');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticketdetail`
--

CREATE TABLE `ticketdetail` (
  `ticketDetailID` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `seatID` varchar(20) NOT NULL,
  `cinemaRoomID` varchar(20) NOT NULL,
  `ticketID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticketdetail`
--

INSERT INTO `ticketdetail` (`ticketDetailID`, `price`, `seatID`, `cinemaRoomID`, `ticketID`) VALUES
('tkdl1', 100000, 'seat1', 'cr1', 'tk1'),
('tkdl3', 100000, 'seat3', 'cr3', 'tk3'),
('tkdl5', 100000, 'seat5', 'cr1', 'tk5'),
('tkdl7', 100000, 'seat7', 'cr3', 'tk7'),
('tkdl9', 100000, 'seat9', 'cr1', 'tk9'),
('tkdt10', 10000, 'seat10', 'cr2', 'tk10'),
('tkdt2', 10000, 'seat2', 'cr2', 'tk2'),
('tkdt4', 10000, 'seat4', 'cr4', 'tk4'),
('tkdt6', 10000, 'seat6', 'cr2', 'tk6'),
('tkdt8', 10000, 'seat8', 'cr4', 'tk8');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `userID` varchar(20) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `roles` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userID`, `userName`, `email`, `userPassword`, `isActive`, `roles`) VALUES
('user1', 'nguyenthanhquyen', 'nguyenthanhquyen@email.com', 'thanhquyen', 1, 0),
('user10', 'vansang', 'nguyenvansang@email.com', 'vansang', 1, 0),
('user11', 'vansang', 'nguyenvansang@email.com', 'vansang', 0, 0),
('user13', 'vansang', 'nguyenvansang1@email.com', 'vansang', 1, 0),
('user14', 'quyen', 'thanhquyen@email.com', 'thanhquyen', 1, 0),
('user15', 'quyen', 'thanhquyen@email.com', 'thanhquyen', 1, 0),
('user16', 'quyen', 'thanhquyen@email.com', 'thanhquyen', 1, 0),
('user17', 'quyen', 'thanhquyen1@email.com', 'thanhquyen', 1, 0),
('user2', 'pzo', 'pzo@gmail.com', 'pzo', 1, 0),
('user3', 'nguyenthanhquy', 'nguyenthanhquy@email.com', 'thanhquy', 1, 0),
('user4', 'nguyendothanhphat', 'nguyendothanhphat@email.com', 'thanhphat', 1, 0),
('user7', 'nguyenthanhquy', 'nguyenthanhquy@gmail.com', 'thanhquy', 1, 0),
('user9', 'nguyenthanhquy', 'nguyenthanhquy@gmail.com', 'thanhquy', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usercomment`
--

CREATE TABLE `usercomment` (
  `commentID` varchar(20) NOT NULL,
  `movieID` varchar(20) NOT NULL,
  `UserDetailID` varchar(20) NOT NULL,
  `commentText` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `usercomment`
--

INSERT INTO `usercomment` (`commentID`, `movieID`, `UserDetailID`, `commentText`) VALUES
('cmt1', 'Mv3', 'cus1', 'Phim từ đầu đến cuối toàn đánh nhau, kĩ xảo xem đã vc, 10 điểm không có nhưng'),
('cmt2', 'Mv7', 'cus2', 'hay vãi, đúng kiểu tình yêu học đường nhật bản :)))'),
('cmt3', 'Mv4', 'cus1', 'Mạch truyện hay, diễn viên xinh,.. nói chung siêu phẩm :> mn nên xem nha!!!'),
('cmt4', 'Mv1', 'cus1', 'phim hay lắm'),
('cmt5', 'Mv2', 'cus1', 'Xem phim hài nhảm Việt Nam là bán rẻ sức lao động của chính mình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userdetail`
--

CREATE TABLE `userdetail` (
  `UserDetailID` varchar(20) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `userdetail`
--

INSERT INTO `userdetail` (`UserDetailID`, `userID`, `fullName`, `gender`, `phoneNumber`, `address`, `dob`) VALUES
('cus1', 'user1', 'quyen', 'Nam', NULL, NULL, NULL),
('cus2', 'user2', 'nguyen do thanh phat', 'Nữ', NULL, NULL, '2003-12-11');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actorID`),
  ADD KEY `movieID` (`movieID`);

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `ticketID` (`ticketID`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `bookingdetail`
--
ALTER TABLE `bookingdetail`
  ADD PRIMARY KEY (`bookingDetailID`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`);

--
-- Chỉ mục cho bảng `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`cinemaID`),
  ADD KEY `cinemaRoomID` (`cinemaRoomID`);

--
-- Chỉ mục cho bảng `cinemaroom`
--
ALTER TABLE `cinemaroom`
  ADD PRIMARY KEY (`cinemaRoomID`);

--
-- Chỉ mục cho bảng `contain`
--
ALTER TABLE `contain`
  ADD PRIMARY KEY (`cinemaID`,`showtimeID`),
  ADD KEY `showtimeID` (`showtimeID`);

--
-- Chỉ mục cho bảng `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movieID`);

--
-- Chỉ mục cho bảng `movieimage`
--
ALTER TABLE `movieimage`
  ADD PRIMARY KEY (`movieImageID`,`movieID`);

--
-- Chỉ mục cho bảng `movietrailer`
--
ALTER TABLE `movietrailer`
  ADD PRIMARY KEY (`movieTrailerID`,`movieID`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentTypeID`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Chỉ mục cho bảng `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seatID`),
  ADD KEY `cinemaRoomID` (`cinemaRoomID`);

--
-- Chỉ mục cho bảng `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`showtimeID`),
  ADD KEY `movieID` (`movieID`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticketID`),
  ADD KEY `cinemaID` (`cinemaID`),
  ADD KEY `showtimeID` (`showtimeID`);

--
-- Chỉ mục cho bảng `ticketdetail`
--
ALTER TABLE `ticketdetail`
  ADD PRIMARY KEY (`ticketDetailID`),
  ADD KEY `seatID` (`seatID`),
  ADD KEY `cinemaRoomID` (`cinemaRoomID`),
  ADD KEY `ticketID` (`ticketID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`,`roles`);

--
-- Chỉ mục cho bảng `usercomment`
--
ALTER TABLE `usercomment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `movieID` (`movieID`),
  ADD KEY `UserDetailID` (`UserDetailID`);

--
-- Chỉ mục cho bảng `userdetail`
--
ALTER TABLE `userdetail`
  ADD PRIMARY KEY (`UserDetailID`),
  ADD KEY `userID` (`userID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`ticketID`) REFERENCES `ticket` (`ticketID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Các ràng buộc cho bảng `bookingdetail`
--
ALTER TABLE `bookingdetail`
  ADD CONSTRAINT `bookingdetail_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`);

--
-- Các ràng buộc cho bảng `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`cinemaRoomID`) REFERENCES `cinemaroom` (`cinemaRoomID`);

--
-- Các ràng buộc cho bảng `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`cinemaID`) REFERENCES `cinema` (`cinemaID`),
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`showtimeID`) REFERENCES `showtime` (`showtimeID`);

--
-- Các ràng buộc cho bảng `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`cinemaRoomID`) REFERENCES `cinemaroom` (`cinemaRoomID`);

--
-- Các ràng buộc cho bảng `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`);

--
-- Các ràng buộc cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`cinemaID`) REFERENCES `cinema` (`cinemaID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`showtimeID`) REFERENCES `showtime` (`showtimeID`);

--
-- Các ràng buộc cho bảng `ticketdetail`
--
ALTER TABLE `ticketdetail`
  ADD CONSTRAINT `ticketdetail_ibfk_1` FOREIGN KEY (`seatID`) REFERENCES `seat` (`seatID`),
  ADD CONSTRAINT `ticketdetail_ibfk_2` FOREIGN KEY (`cinemaRoomID`) REFERENCES `cinemaroom` (`cinemaRoomID`),
  ADD CONSTRAINT `ticketdetail_ibfk_3` FOREIGN KEY (`ticketID`) REFERENCES `ticket` (`ticketID`);

--
-- Các ràng buộc cho bảng `usercomment`
--
ALTER TABLE `usercomment`
  ADD CONSTRAINT `usercomment_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`),
  ADD CONSTRAINT `usercomment_ibfk_2` FOREIGN KEY (`UserDetailID`) REFERENCES `userdetail` (`UserDetailID`);

--
-- Các ràng buộc cho bảng `userdetail`
--
ALTER TABLE `userdetail`
  ADD CONSTRAINT `userdetail_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
