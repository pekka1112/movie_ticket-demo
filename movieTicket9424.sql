SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
DROP DATABASE IF EXISTS movie_ticket;

CREATE DATABASE movie_ticket
		CHARACTER SET "utf8mb4"
		COLLATE "utf8mb4_general_ci";
USE movie_ticket;

CREATE TABLE `cart` (
  `cartID` INT AUTO_INCREMENT PRIMARY KEY,
  `userID` INT NOT NULL,
  FOREIGN KEY (`userID`) REFERENCES `user`(`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- note : cartItem là từng bookingID cụ thể
CREATE TABLE `cartItem` (
  `cartItemID` INT AUTO_INCREMENT PRIMARY KEY,
  `cartID` INT NOT NULL,
  `bookingID` INT NOT NULL,
  `quantity` INT NOT NULL,
  FOREIGN KEY (`cartID`) REFERENCES `cart`(`cartID`) ON DELETE CASCADE,
  FOREIGN KEY (`bookingID`) REFERENCES `booking`(`bookingID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cinema` (
  `cinemaID` INT AUTO_INCREMENT PRIMARY KEY,
  `cinemaName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cinemaImageURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cinema` (`cinemaName`, `location`, `cinemaImageURL`) VALUES
	('Cinestar Quốc Thanh', '271 Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1, Tp. Hồ Chí Minh', ''),
	('CGV CT Plaza', 'Tầng 10, CT Plaza, 60A Trường Sơn, P.2, Q. Tân Bình, Tp. Hồ Chí Minh', ''),
	('CGV Crescent Mall', 'Lầu 5, Crescent Mall Đại lộ Nguyễn Văn Linh, Phú Mỹ Hưng, Q.7 Tp. Hồ Chí Minh', ''),
	('CGV Aeon Tân Phú', 'Lầu 3, Aeon Mall 30 Bờ Bao Tân Thắng, P. Sơn Kỳ, Q. Tân Phú, Tp. Hồ Chí Minh', ''),
	('Cinestar Hai Bà Trưng', '135 Hai Bà Trưng, P. Bến Nghé, Q.1, Tp. Hồ Chí Minh', '' ),
	('Mega GS Cao Thắng', 'Lầu 6 - 7, 19 Cao Thắng, P.2, Q.3, Tp. Hồ Chí Minh', ''),
	('DCINE Bến Thành', 'Số 6, Mạc Đĩnh Chi, Q.1, Tp. Hồ Chí Minh', ''),
	('Beta Quang Trung', '645 Quang Trung, Phường 11, Quận Gò Vấp, Thành phố Hồ Chí Minh', ''),
	('Galaxy Nguyễn Du', '116 Nguyễn Du, Q.1, Tp. Hồ Chí Minh', ''),
	('Galaxy Tân Bình', '246 Nguyễn Hồng Đào, Q.Tân Bình, Tp. Hồ Chí Minh', ''),
	('Galaxy Kinh Dương Vương', '718bis Kinh Dương Vương, Q.6, Tp. Hồ Chí Minh', ''),
	('Galaxy Phạm Văn Chí', 'Platinum Plaza, 634 Bis Phạm Văn Chí, Phường 8, Quận 6 Tp. Hồ Chí Minh', '');

-- note : 1 cinema có thể có nhiều cinemaRoom = quan hệ 1 - nhiều
-- note : 1 cinema thường sẽ có 2 - 3 room, mỗi room sẽ có các ghế khác nhau
CREATE TABLE `cinemaroom` (
  `roomID` INT AUTO_INCREMENT PRIMARY KEY,
  `cinemaID` INT NOT NULL,
  `roomName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  FOREIGN KEY (`cinemaID`) REFERENCES `cinema`(`cinemaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cinemaroom` (`cinemaID`, `roomName`) VALUES
	('1', 'Phòng 1'), ('1', 'Phòng 2'), ('1', 'Phòng 3'), ('1', 'Phòng 4'),
	('2', 'Phòng 1'), ('2', 'Phòng 2'), ('2', 'Phòng 3'), 
	('3', 'Phòng 1'), ('3', 'Phòng 2'), ('3', 'Phòng 3'), ('3', 'Phòng 4'),
	('4', 'Phòng 1');

-- note : lưu lại những ghế được 1 user bất kì đặt cho 1 showtime nào đó; có lưu lại roomID của ghế được đặt
CREATE TABLE `bookedSeat` (
  `bookedSeatID` INT AUTO_INCREMENT PRIMARY KEY,
  `seatNumber` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seatType` ENUM('Thường', 'VIP', 'Ghế đôi') DEFAULT 'Thường',
  `roomID` INT NOT NULL,
  `showtimeID` INT NOT NULL,
  `userID` INT NOT NULL,
  `bookingTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`roomID`) REFERENCES `cinemaRoom`(`roomID`) ON DELETE CASCADE,
  FOREIGN KEY (`showtimeID`) REFERENCES `showtime`(`showtimeID`) ON DELETE CASCADE,
  FOREIGN KEY (`userID`) REFERENCES `user`(`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `bookedSeat` (`seatNumber`, `seatType`, `roomID`, `showtimeID`, `userID`) VALUES
	('a1', 'Thường', 1, 1, 1),
	('a2', 'Thường', 3, 2, 2),
	('a3', 'Thường', 3, 3, 3),
	('a4', 'Thường', 3, 4, 4),
	('a1', 'Thường', 4, 5, 5),
	('a2', 'Thường', 4, 6, 6),
	('a3', 'Thường', 4, 7, 7),
	('a4', 'Thường', 4, 8, 8);

-- note : 1 lịch chiếu phim cụ thể, lưu rõ 1 bộ phim sẽ được chiếu vào thời gian nào của rạp nào và phòng nào của rạp đó
CREATE TABLE `showtime` (
  `showtimeID` INT AUTO_INCREMENT PRIMARY KEY,
  `movieID` INT NOT NULL,
  `cinemaID` INT NOT NULL,
  `roomID` INT NOT NULL,
  `startTime` DATETIME NOT NULL,
  `endTime` DATETIME NOT NULL,
  FOREIGN KEY (`movieID`) REFERENCES `movie`(`movieID`) ON DELETE CASCADE,
  FOREIGN KEY (`cinemaID`) REFERENCES `cinema`(`cinemaID`) ON DELETE CASCADE,
  FOREIGN KEY (`roomID`) REFERENCES `cinemaRoom`(`roomID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `showtime` (`movieID`, `cinemaID`, `roomID`, `startTime`, `endTime`) VALUES
    (1, 1, 1, '2024-09-01 14:00:00', '2024-09-01 16:30:00'),
    (2, 1, 1, '2024-09-01 17:00:00', '2024-09-01 19:30:00'),
    (3, 2, 2, '2024-09-02 13:00:00', '2024-09-02 15:30:00'),
    (4, 2, 2, '2024-09-02 16:00:00', '2024-09-02 18:30:00'),
    (5, 3, 3, '2024-09-03 11:00:00', '2024-09-03 13:30:00'),
    (6, 3, 3, '2024-09-03 14:00:00', '2024-09-03 16:30:00'),
    (7, 4, 4, '2024-09-04 20:00:00', '2024-09-04 22:30:00'),
    (8, 4, 4, '2024-09-04 23:00:00', '2024-09-05 01:30:00');

-- note : ticket được tạo trong khi user chọn các thông tin để chuẩn bị đặt vé
-- note : sau đó ticket sẽ được thêm vào booking để chuẩn bị thanh toán
-- note : giá vé đồng giá 50k / vé
CREATE TABLE `ticket` (
  `ticketID` INT AUTO_INCREMENT PRIMARY KEY,
  `showtimeID` INT NOT NULL,
  `bookedSeatID` INT NOT NULL,
  `price` double NOT NULL
  FOREIGN KEY (`showtimeID`) REFERENCES `showtime`(`showtimeID`) ON DELETE CASCADE,
  FOREIGN KEY (`bookedSeatID`) REFERENCES `bookedSeat`(`bookedSeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `ticket` (`showtimeID`, `bookedSeatID`, `price`) VALUES
    (1, 1, 50000),
    (1, 2, 50000),
    (2, 3, 50000),
    (2, 4, 50000),
    (3, 5, 50000),
    (3, 6, 50000),
    (4, 7, 50000),
    (4, 8, 50000),
    (5, 9, 50000),
    (5, 10, 50000),
    (6, 11, 50000),
    (6, 12, 50000),
    (7, 13, 50000),
    (7, 14, 50000),
    (8, 15, 50000),
    (8, 16, 50000);

-- note : ticket user đặt sẽ có thể thanh toán ngay hoặc cho vào giỏ hàng, xử lí 1 lần đặt nhiều `ticket ` bằng `booking`
CREATE TABLE `booking` (
  `bookingID` INT AUTO_INCREMENT PRIMARY KEY,
  `userID` INT NOT NULL,
  `ticketID` varchar(20) NOT NULL,
  `status` ENUM('Đã thanh toán', 'Chưa thanh toán', 'Đã hủy') DEFAULT 'Chưa thanh toán',
  `bookingTime` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`userID`) REFERENCES `user`(`userID`),
  FOREIGN KEY (`ticketID`) REFERENCES `ticket`(`ticketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `booking` (`userID`, `ticketID`, `status`) VALUES
	(1, 1, 'Đã thanh toán'),
	(2, 2, 'Chưa thanh toán'),
	(3, 3, 'Đã thanh toán'),
	(1, 4, 'Đã hủy'),
	(2, 5, 'Đã thanh toán');

CREATE TABLE `bookingticket` (
  `bookingID` INT NOT NULL,
  `ticketID` INT NOT NULL,
  PRIMARY KEY (`bookingID`, `ticketID`),
  FOREIGN KEY (`bookingID`) REFERENCES `booking`(`bookingID`),
  FOREIGN KEY (`ticketID`) REFERENCES `ticket`(`ticketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_GENERAL_CI;

INSERT INTO `bookingticket` (`bookingID`, `ticketID`) VALUES
	(1, 1), 
	(1, 2), 
	(2, 3), 
	(2, 4), 
	(3, 5), 
	(3, 6), 
	(4, 7), 
	(4, 8); 

CREATE TABLE `transaction` (
  `transactionID` INT AUTO_INCREMENT PRIMARY KEY,
  `userID` INT NOT NULL,
  `bookingID` INT NOT NULL,
  `transactionAmount` DOUBLE NOT NULL,
  `paymentMethod` ENUM('Credit Card', 'Debit Card', 'PayPal', 'Momo', 'ZaloPay', 'Cash') NOT NULL,
  `transactionStatus` ENUM('Thành công', 'Thất bại', 'Đang xử lý') DEFAULT 'Đang xử lý',
  FOREIGN KEY (`userID`) REFERENCES `user`(`userID`),
  FOREIGN KEY (`bookingID`) REFERENCES `booking`(`bookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `movie` (
  `movieID` INT AUTO_INCREMENT PRIMARY KEY,
  `movieName` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movieCategory` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `releaseDate` DATE DEFAULT NULL,
  `director` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `duration` TIME DEFAULT NULL,
  `country` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `movieDescription` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `movieContent` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `movieScore` DOUBLE DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `movie` (`movieName`, `movieCategory`, `releaseDate`, `directorName`, `duration`, `country`, `movieDescription`, `movieContent`, `movieScore`) VALUES
	('Kẻ Ăn Hồn', 'Kinh dị, Gay Cấn', '2024-01-15', 'Trần Hữu Tấn', '01:53:00', 'Việt Nam', 'Có một kẻ luyện Rượu Sọ Người trong làng Địa Ngục.', 'Kẻ Ăn Hồn - phim về hàng loạt cái chết bí ẩn ở Làng Địa Ngục, nơi có ma thuật cổ xưa: 5 mạng đổi bình Rượu Sọ Người. Thập Nương - cô gái áo đỏ là kẻ nắm giữ bí thuật luyện nên loại rượu mạnh nhất!', 9.1),
	('Aquaman: Vương Quốc Thất Lạc', 'Hành động, Phiêu lưu, Viễn tưởng, Siêu anh hùng', '2024-01-22', 'James Wan', '01:23:00', 'Mỹ', 'Dòng nước đã đổi chiều!', 'Black Manta khao khát trả thù cái chết của cha mình và giờ đây hắn cầm trong tay sức mạnh của cây Đinh Ba Đen huyền thoại, hắn sẽ không dừng lại trước khi hạ gục Aquaman một lần và mãi mãi. Để đánh bại Black Manta, Aquaman phải nhờ sự trợ giúp của người a', 9.6),	
	('Thiếu Niên và Chim Diệc', 'Chính kịch, Phiêu lưu, Hoạt hình, Viễn tưởng', '2024-01-15', 'Miyazaki Hayao', '01:36:00', 'Nhật Bản', 'Nơi cái chết kết thúc. Cuộc sống tìm thấy một khởi đầu mới.', 'Trong khi Thế chiến thứ hai đang diễn ra, cậu thiếu niên Mahito, bị ám ảnh bởi cái chết bi thảm của mẹ, được chuyển từ Tokyo đến ngôi nhà nông thôn yên bình của mẹ kế mới Natsuko, một người phụ nữ có nét tương đồng nổi bật với mẹ của cậu. Khi cậu cố gắng ',8.8),
	('Wonka', 'Gia đình, Hài, Viễn tưởng', '2024-01-08', 'Paul King', '01:31:00', 'Mỹ', 'Mọi điều tốt đẹp trên thế giới này đều bắt đầu từ một giấc mơ.', 'Dựa trên nhân vật từ quyến sách gối đầu giường của các em nhỏ trên toàn thế giới \"Charlie và Nhà Máy Sôcôla\" và phiên bản phim điện ảnh cùng tên vào năm 2005, WONKA kể câu chuyện kỳ diệu về hành trình của nhà phát minh, ảo thuật gia và nhà sản xuất sôcôla',8.8),
	('NCT NATION: Vươn Tầm Thế Giới', 'Tài liệu, Âm Nhạc', '2024-01-06', 'Yoon Dong Oh', '01:02:00', 'Hàn Quốc', 'Lời cảm ơn chân thành tới tất cả NCTzens trong lòng có anh.', '\"NCT NATION: To The World in Cinemas\" đánh dấu sự khởi đầu thú vị của NCT và chuyến hành trình chia sẻ các bản nhạc độc đáo cùng những màn trình diễn ngoạn mục, khẳng định vị thế tiên phong của NCT NATION trong thể loại K-Pop. Bộ concert movie hoàn toàn m', 9.9),
	('Người Mặt Trời', 'Kinh dị', '2024-01-08', 'Timothy Linh Bùi', '01:15:00', 'Việt Nam', 'Chung dòng máu,hai số phận!', '400 năm qua, loài Ma Cà Rồng đã bí mật sống giữa loài người trong hòa bình, nhưng hiểm họa bỗng ập đến khi một cô gái loài người phát hiện được thân phận của hai anh em Ma Cà Rồng. Người anh khát máu quyết săn lùng cô để bảo vệ bí mật giống loài, trong kh', 7.8),
	('Đường Hầm Tới Mùa Hạ, Lối Thoát Của Biệt Ly', 'Chính kịch, Hoạt hình, Viễn tưởng, Tình cảm', '2024-01-01', 'Taguchi Tomohisa', '01:04:00', 'Nhật Bản', 'Một đường hầm bí ẩn có thể thực hiện điều ước trong lòng bạn… nhưng bạn sẽ phải trả một cái giá.', 'TDựa trên cuốn tiểu thuyết đạt giải thưởng. Bộ phim chuyển thể giành giải thưởng Paul Grimault tại Liên hoan phim hoạt hình quốc tế Annecy 2023. Một đường hầm bí ẩn tên Urashima có thể thực hiện bất kỳ điều ước nào…nhưng bạn sẽ phải đánh đổi bằng thời gia',8.7),
	('Bỗng Dưng Trúng Mánh', 'Chính kịch, Hành động', '2024-01-01', 'Hwang Dong-seok', '01:05:00', 'Hàn Quốc', 'Từ đáy xã hội tôi trở thành sói đầu đàn.', 'Bỗng Dưng Trúng Mánh là câu chuyện từ cá biệt toàn trường hoá tài phiệt học đường của Lee Kang-jin (Yoo Seon-ho) - một nam sinh thường xuyên bị bạn học bắt nạt. Tình cờ nhặt được chiếc phong bì chứa đầy tiền mặt của ông trùm cho vay nặng lãi Rang (Yoon By', 4.7),
	('Xin Chào Jadoo', 'Hoạt hình', '2024-01-15', 'Son Seok-woo', '00:55:00', 'Hàn Quốc', 'NHóa thân thành nhân vật chính thôi!', 'Bộ phim Hello Jadoo nổi bật với cốt truyện vô cùng khác biệt, đưa nhân vật Jadoo bước đến cuộc hành trình phiêu lưu vào một thế giới cổ tích tuyệt vời thông qua cuốn sách ma thuật mà Jadoo phát hiện ra trong chuyến thăm công viên giải trí.', 10),
	('Kỷ Nguyên của TaylorSwift', 'Âm Nhạc', '2024-01-13', 'Sam Wrench', '02:31:00', 'Mỹ', 'Đến lúc ra rạp tận hưởng show của chị đẹp rồi!', 'Hiện tượng văn hóa tiếp tục trên màn ảnh lớn! Đắm chìm trong trải nghiệm xem phim hòa nhạc độc nhất vô nhị với góc nhìn ngoạn mục, đậm chất điện ảnh về chuyến lưu diễn mang tính lịch sử. Khuyến khích khán giả đeo vòng tay tình bạn và mặc trang phục Taylor', 9.9),
	('Argylle: Siêu Điệp Viên', 'Gay cấn, Hành động, Phiêu lưu', '2024-02-10', 'Elly Conway', '01:30:00', 'Mỹ', 'Một khi đã biết bí mật, đừng làm con mèo lẻo mép', 'Argylle là ai? Duy nhất 1 cách có thể tìm ra câu trả lời.”.',  7.5),
	('MAI', 'Lãng mạn, Tình cảm, Tâm lý', '2024-02-10', 'Trấn Thành', '01:30:00', 'Việt Nam', 'Quá khứ chưa ngủ yên, ngày mai liệu sẽ đến?', 'MAI xoay quanh câu chuyện về cuộc đời của một người phụ nữ cùng tên với bộ phim. Trên First-look Poster, Phương Anh Đào tạo ấn tượng mạnh với cái nhìn tĩnh lặng, xuyên thấu, đặc biệt, trên bờ môi nữ diễn viên là hình ảnh cô đang nằm nghiêng trên mặt nước.',  7.6),
	('Godzilla x Kong: Đế Chế Mới', 'Hành động, Phiêu lưu, Viễn tưởng', '2024-05-17', 'Terry Rossio, Jeremy Slater và Simon Barrett', '01:30:00', 'Mỹ', 'Cúi đầu trước vị vua mới.', 'Sau cuộc đối đầu nổ lực, Godzilla và Kong phải hợp tác chống lại một mối đe dọa khổng lồ chưa được khám phá ẩn sâu trong thế giới của chúng ta, thách thức sự tồn tại của chính chúng – và của chúng ta.',  8.7),
	('Gặp Lại Chị Bầu', 'Gia đình, Hài, Lãng mạn, Tình cảm', '2024-02-10', 'Nhất Trung', '01:30:00', 'Việt Nam', 'Hạnh phúc bất ngờ từ cuộc gặp khó đỡ!', '“Gặp Lại Chị Bầu” xoay quanh Phúc, một thanh viên trẻ với đam mê diễn xuất nhưng phải trải qua cuộc sống muôn vàn khó khăn. Anh tình cờ lưu lạc đến xóm trọ của bà Lê và cùng những người bạn ở đây trải qua những ngày tháng thanh xuân đáng nhớ nhất cuộc đời',9.1),
	('Những Mảnh Ghép Cảm Xúc 2', 'Gia đình, Hài, Hoạt hình', '2024-06-14', 'Pixar', '02:30:00', 'Mỹ', 'Thay đổi mới. Cảm xúc mới.', 'Một cuộc phiêu lưu hoàn toàn mới bên trong đầu của Riley với một bộ cảm xúc mới.',  8.2),
	('Nhà Bà Nữ', 'Chính kịch, Hài, Tâm lý', '2024-01-22', 'Trấn Thành', '02:30:00', 'Việt Nam', 'Ai cũng có lỗi, nhưng ai cũng nghĩ mình là nạn nhân...', 'Câu chuyện xoay quanh gia đình bà Nữ gồm ba thế hệ sống cùng nhau trong một ngôi nhà. Bà Nữ một tay cáng đáng mọi sự, nổi tiếng với quán bánh canh cua và cũng khét tiếng với việc kiểm soát cuộc sống của tất cả mọi người, từ con gái đến con rể. Mọi chuyện ', 8.3),
	('Lật Mặt 6: Tấm Vé Định Mệnh', 'Bí ẩn, Chính kịch, Hài, Hành động', '2024-04-28', 'Lý Hải ', '01:46:00', 'Việt Nam', 'Tri kỷ hay trăm tỷ?.', 'Nội dung phim kể về tấm vé có mệnh giá 10 ngàn đồng và sở hữu những con số \"định mệnh\" gồm 10, 16, 18, 20, 27, 28 - đây là tập hợp những con số ngày sinh của hội bạn thân gồm 6 người. Câu chuyện bắt đầu khi cả 6 người bạn thân quyết định mua một tấm vé số',  9),
	('Khóa Chặt Cửa Nào Suzume', 'Chính kịch, Phiêu lưu, Hoạt hình, Viễn tưởng', '2024-10-03', 'Shinkai Makoto', '01:46:00', 'Nhật Bản', 'Ở bên kia cánh cửa có phải tất cả thời gian sẽ ở trong đó?', 'Suzume, 17 tuổi, mồ côi mẹ từ nhỏ. Trên đường đến trường, cô gặp một chàng trai bí ẩn. Nhưng sự tò mò của cô ấy đã gây ra một tai họa gây nguy hiểm cho toàn bộ người dân Nhật Bản, vì vậy Suzume bắt đầu cuộc hành trình để giải quyết mọi việc.',9.3),
	('Spider-Man: No Way Home', 'Hành động, Phiêu lưu, Viễn tưởng, Siêu anh hùng', '2022-09-01', 'Marvel', '01:46:00', 'Mỹ', 'Phiên bản nhiều sự thú vị hơn của 3 Nhện!', 'Phần 3: Nhện Nhọ không có đường về nhà! Peter Parker đã bị lộ mặt và không còn có thể tách biệt cuộc sống bình thường của mình với những yêu cầu cao của việc trở thành một Siêu anh hùng. Khi anh ta yêu cầu sự giúp đỡ từ Doctor Strange, mọi thứ càng trở nê', 8.2),
	('Chú Thuật Hồi Chiến: 0', 'Hành động, Phiêu lưu, Hoạt hình, Viễn tưởng', '2022-04-14', 'Mappa', '01:46:00', 'Nhật Bản', 'Chú thuật sư đời đầu.', 'Yuta Okkotsu là một học sinh trung học đang gặp phải một vấn đề nghiêm trọng - người bạn thời thơ ấu của anh là Rika, đã biến thành một Chú Linh và sẽ không để anh yên. Vì Rika không phải là một Chú Linh bình thường, nên đã được Satoru Gojo xử lí, một giá',  9);

CREATE TABLE `moviemedialink` (
  `movieID` varchar(20) PRIMARY KEY,
  `linkMovieImage` VARCHAR(255) DEFAULT NULL,
  `linkMovieTrailer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `moviemedialink` (`movieID`, `linkMovieImage`, `linkMovieTrailer`) VALUES
	(1, 'ke-an-hon.png', 'https://www.youtube.com/embed/xWh0g4rKGjI'),
	(2, 'aquaman-vuong-quoc-that-lac.jpg', 'https://www.youtube.com/embed/mRGMMd8eazw'),
	(3, 'thieu-nien-va-chim-diec.jpg', 'https://www.youtube.com/embed/eggzAobZzHc'),
	(4, 'wonka.png', 'https://www.youtube.com/embed/otNh9bTjXWg'),
	(5, 'nct-nation-vuon-tam-the-gioi.jpeg', 'https://www.youtube.com/embed/soeosaczFGw'),
	(6, 'nguoi-mat-troi.png', 'https://www.youtube.com/embed/5yreWvGqbyg'),
	(7, 'duong-ham-toi-mua-ha.jpg', 'https://www.youtube.com/embed/38B5-Ft_doo'),
	(8, 'bong-dung-trung-manh.jpg', 'https://www.youtube.com/embed/cH2lE3fxelc'),
	(9, 'xin-chao-jadoo.jpg', 'https://www.youtube.com/embed/Yuy029-UlOE'),
	(10, 'nhung-ky-nguyen-cua-taylor-swift.jpg', 'https://www.youtube.com/embed/cwLAor_smGw'),
	(11, 'argylle-sieu-diep-vien.png', 'https://www.youtube.com/embed/YQ2GbAV0jTw'),
	(12, 'mai.png', 'https://www.youtube.com/embed/Yz96EBNwMGw'),
	(13, 'godzilla-kong-de-che-moi.png', 'https://www.youtube.com/embed/jHWeXs31Uig'),
	(14, 'gap-lai-chi-bau.png', 'https://www.youtube.com/embed/Gggw9jwr1h4'),
	(15, 'nhung-manh-ghep-cam-xuc.png', 'https://www.youtube.com/embed/AfOlW2OrzqE'),
	(16, 'nha-ba-nu.png', 'https://www.youtube.com/embed/IkaP0KJWTsQ'),
	(17, 'lat-mat-6.png', 'https://www.youtube.com/embed/o3FoowSoNr4'),
	(18, 'khoa-chat-cua-nao-suzume.png', 'https://www.youtube.com/embed/xQ4_c8JfuzI'),
	(19, 'spiderman-no-way-home.png', 'https://www.youtube.com/embed/OB3g37GTALc'),
	(20, 'chu-thuat-hoi-chien-0.png', 'https://www.youtube.com/embed/ceqa2pIN9ng');
	
CREATE TABLE `actor` (
  `actorID` INT AUTO_INCREMENT PRIMARY KEY,
  `movieID` INT NOT NULL,
  `actorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` ENUM('Nam', 'Nu', 'Khac') DEFAULT NULL,
  FOREIGN KEY (`movieID`) REFERENCES `movie`(`movieID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `actor` (`movieID`, `actorName`, `gender`) VALUES
	(1, 'Hoàng Hà', 'Nu'),
	(5, 'Ryo Yoshizawa', 'Nam'),
	(6, 'Chi Pu', 'Nu'),
	(12, 'Thuận Nguyễn', 'Nam'),
	(13, 'Iitoyo Marie', 'Nu'),
	(14, 'Suzuka Ouji', 'Nam'),
	(15, 'Kang Mi-na', 'Nu'),
	(16, 'Yoo Seon-ho', 'Nam'),
	(17, 'Yeo Min-jeong', 'Nu'),
	(18, 'Choi Joon-young', 'Nam'),
	(19, 'Taylor Alison Swift', 'Nu'),
	(2, 'Võ Điền Gia Huy', 'Nam'),
	(3, 'Joseph Jason Namakaeha Momoa', 'Nam'),
	(4, 'Nicole Mary Kidman AC', 'Nu'),
	(5, 'Soma Santoki', 'Nam'),
	(6, 'Aimyon', 'Nu'),
	(7, 'Timothée Hal Chalamet', 'Nam'),
	(8, 'Sally Cecilia Hawkins', 'Nu'),
	(9, 'Shunsuke Sakuya', 'Nam');

CREATE TABLE `user` (
  `userID` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(20) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` VARCHAR(20) NOT NULL,
  `isActive` BOOL NOT NULL DEFAULT TRUE,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `user` (`username`, `email`, `password`, `isActive`, `role`) VALUES
('nguyenthanhquyen', 'nguyenthanhquyen@email.com', 'thanhquyen', 1, 0),
('pzo', 'pzo@gmail.com', 'pzo', 1, 0),
('admin', 'admin@gmail.com', 'admin', 1, 1),
('nguyenthanhquy', 'nguyenthanhquy@email.com', 'thanhquy', 1, 0),
('nguyendothanhphat', 'nguyendothanhphat@email.com', 'thanhphat', 1, 0),
('vansang', 'nguyenvansang@email.com', 'vansang', 0, 0);

CREATE TABLE `roles` (
  `roleID` tinyint(1) PRIMARY KEY,
  `roleName` VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_GENERAL_CI;

INSERT INTO `roles` (`roleID`, `roleName`) VALUES 
(0, 'USER_ROLE'),
(1, 'ADMIN_ROLE');

-- note : 1 user sẽ có 1 detail duy nhất
-- alt : thêm link ảnh cho user, nếu không có link thì sẽ dùng default url
CREATE TABLE `userdetail` (
  `userID` int PRIMARY KEY,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` ENUM('Nam', 'Nu', 'Khac') DEFAULT NULL,
  `phoneNumber` VARCHAR(30) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `profilePictureURL` VARCHAR(255) DEFAULT NULL,
  FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `userdetail` (`userID`, `fullName`, `gender`, `phoneNumber`, `address`, `dob`, `profilePictureURL`) VALUES
(1, 'Nguyen Thanh Quyen', 'Nam', '0123456789', 'Hà Nội', '1990-01-01', ''),
(2, 'Nguyen Do Thanh Phat', 'Nu', '0987654321', 'Hồ Chí Minh', '2003-12-11', '');

-- note : 1 user có thể cmt trên nhiều movie, 1 user có thể cmt nhiều lần trên 1 movie
CREATE TABLE `usercomment` (
  `commentID` INT AUTO_INCREMENT PRIMARY KEY,
  `movieID` INT NOT NULL,
  `userID` INT NOT NULL,
  `commentText` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commentTime` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`movieID`) REFERENCES `movie` (`movieID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usercomment` (`movieID`, `userID`, `commentText`) VALUES
(1, 1, 'Great movie! I really enjoyed it.'),
(1, 1, 'Looking forward to the sequel.'),
(2, 2, 'The plot was a bit predictable.'),
(3, 3, 'Fantastic visuals and storyline.');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
