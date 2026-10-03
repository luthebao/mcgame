SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict xShcW0xRncW5fjRkdad7tb4eicnjUhpXTxHd5H004No8sckTkIoXq9o583ijGd8

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: data_tbl_creature_handbook; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_creature_handbook" ("id", "active_num1", "active_num2", "active_num3", "active_num4", "class_id", "discription", "evolution_id", "mid", "name", "percent_flag", "prop_num", "prop_type", "relate_id", "skill_id1", "skill_id2", "skill_id3", "skill_id4") VALUES
	(71, 1500, NULL, NULL, NULL, 2, 'Đây là sủng vật của các chư thần, chạy trốn trên không trung. Tốc độ di chuyển nhanh như gió. Vì vậy sức chiến đấu cũng rất đáng nể', NULL, 71, 'Tuần Lộc Mị Ảnh', 0, NULL, NULL, 1338, NULL, NULL, NULL, NULL),
	(70, 1500, NULL, NULL, NULL, 2, 'Tâm nguyện luôn muốn trở thành con người, nhưng do hoàn cảnh đưa đẩy mà chỉ biến hình được cái kính mát và khăn đỏ buột đầu. Đừng vì ngoại hình kỳ quái này mà khinh thường rùa ta ~!~', NULL, 29, 'Rùa Nika', 0, NULL, NULL, 188, NULL, NULL, NULL, NULL),
	(69, 1500, NULL, NULL, NULL, 2, 'Tất cả công phu đều là tự luyện thành. Mỗi ngày gấu trúc phải ăn 1 lượng lớn cơm để bồi bổ công lực', NULL, 19, 'Gấu Trúc Kungfu', 0, 600, 4, 45, NULL, NULL, NULL, NULL),
	(68, 1500, NULL, NULL, NULL, 2, 'Máu là nguồn dinh dưỡng nuôi sống hải tinh, và từ lâu hắn luôn mục tiêu có các binh đoàn khát máu chiêu mộ', NULL, 5, 'Hấp Huyết Hải Tinh', 0, NULL, NULL, 136, NULL, NULL, NULL, NULL),
	(67, 1500, NULL, NULL, NULL, 2, 'Tuy là có họ hàng với gà bát vị nhưng theo kinh nghiệm của Nhà Hàng Âu Dương thì thiếu 1 vị như Thất Vị Kê vẫn rất là hấp dẫn', NULL, 3, 'Thất Vị Kê', 0, 1920, 6, 2, NULL, NULL, NULL, NULL),
	(66, 1500, NULL, NULL, NULL, 8, 'Chú dê con bé nhỏ này rất thích hợp cho những người chơi mới do có sức tấn công mạnh, tốc độ nhanh, bạo kích cao, lại có thuộc tính ám hỗ trợ, điểm yếu là lượng HP tương đối thấp và dễ bị pet thuộc tính quang khắc chế.', NULL, 47, 'Dê Con', 0, NULL, NULL, 565, 3845, NULL, NULL, NULL),
	(64, 1500, NULL, NULL, NULL, 8, 'Trang điểm xong rồi mặc áo ngủ đi chơi mới là thú vị ^_^', NULL, NULL, 'Momo Bản Du Hành【Du Hành】', 0, NULL, NULL, 851, 4950, 6219, NULL, NULL),
	(65, 1500, NULL, NULL, NULL, 8, 'Người bạn tốt của nông dân là đây …', NULL, NULL, 'Chim Ưng', 0, NULL, NULL, 1254, 5916, NULL, NULL, NULL),
	(63, 1500, NULL, NULL, NULL, 8, 'Là em gái của Linh Long, sắc đẹp cũng như tài năng, không thua kém gì người chị của mình', NULL, NULL, 'Tiểu Linh Long', 0, 1, 32, 921, 5379, 5380, NULL, NULL),
	(62, 1500, NULL, NULL, NULL, 8, 'Đừng tưởng Long tộc chỉ biết dùng sức mạnh móng vuốt. Linh Long ngoài hình dáng xinh xắn, còn có mê lực hơn người', NULL, NULL, 'Linh Long', 0, 1920, 7, 902, 5341, 5352, NULL, NULL),
	(61, 1500, NULL, NULL, NULL, 8, 'Bất kể là người hay ma thì đều có 1 tuổi thơ và hình ảnh ngậm sữa bình vẫn luôn là đáng nhớ nhất', NULL, NULL, 'Ác Long Sơ Sinh', 0, NULL, NULL, 9, NULL, NULL, NULL, NULL),
	(60, 1500, NULL, NULL, NULL, 8, 'Thuần chủng máu trâu, thuần chủng sức mạnh, không ai địch lại', NULL, NULL, 'Huyết Ngưu Thuần Chủng', 0, 2400, 1, 593, 3904, NULL, NULL, NULL),
	(58, 1500, NULL, NULL, NULL, 8, 'Hỏi thế gian tình là gì? Tình khiến sinh tử tương hứa. Trời nam đất bắc song phi nhạn. Cổ thụ mấy mùa hàng sơn. Hoan lạc thú, biệt ly sầu.', NULL, NULL, 'Cô Gái Si Tình', 0, NULL, NULL, 16, NULL, NULL, NULL, NULL),
	(59, 1500, NULL, NULL, NULL, 8, 'Vì có những trai lăng nhăng này mà những cô gái si tình càng thêm đau khổ', NULL, NULL, 'Chàng Trai Lăng Nhăng', 0, NULL, NULL, 17, NULL, NULL, NULL, NULL),
	(57, 1500, NULL, NULL, NULL, 7, 'Đây là con trai của thần Sấm Sét, vì bị thần Hắc Ám đầu độc nên cùng với đứa em trai của mình - thần Sức Mạnh liên kết giết chết cha ruột của mình và sai khiến Solomon hủy diệt Đại Lục Vô Ưu.', NULL, 37, 'Mehdi', 0, 1, 13, 1193, 5876, 5877, 5878, NULL),
	(56, 1500, NULL, NULL, NULL, 1, 'Vua ma thần vĩ đại, không chỉ cực mạnh mà còn là kẻ đứng đầu ma giới, lãnh đạo 72 ma thần.', NULL, 56, 'Solomon', 0, 1, 58, 806, 4819, 4820, 4876, 3494),
	(55, 1500, NULL, NULL, NULL, 1, 'So với đám hải tặc, Phi tặc có tài cướp bóc nhưng trong chốn không người. Ra tay nhanh chóng, gọn lẹ là ưu điểm của chúng', NULL, NULL, 'Phi Tặc', 0, NULL, NULL, 775, NULL, NULL, NULL, NULL),
	(81, 1500, NULL, NULL, NULL, 9, 'Thần thú trong truyền thuyết, sở hữu năng lực phi thường', 1677, NULL, 'Hắc Nhân Mã', 0, 1920, 7, 1672, 6365, 6361, 6358, NULL),
	(54, 1500, NULL, NULL, NULL, 1, 'Luôn có dã tâm trở lại xâm chiếm Đại Lục Vô Ưu, là 1 trong những mối nguy hại hàng đầu', NULL, NULL, 'Phản Quân Đại Tướng', 0, 1, 31, 477, 3462, 3463, NULL, NULL),
	(52, 1500, NULL, NULL, NULL, 1, 'Nhóm người có trí tuệ thông minh, có khả năng chế tạo các người máy chiến đấu, ẩn cư vùng băng tuyết', NULL, 43, 'Tộc Navi', 0, NULL, NULL, 731, NULL, NULL, NULL, NULL),
	(51, 1500, NULL, NULL, NULL, 1, 'Một sinh linh sống tại Mễ Quang Tự. Không ai biết đây là người hay ma, chỉ biết hắn có tài làm người ta rơi vào ảo giác', NULL, 29, 'Mê Hồn Giáo Chủ', 0, NULL, NULL, 186, NULL, NULL, NULL, NULL),
	(50, 1500, NULL, NULL, NULL, 6, 'Sinh vật của dòng dõi Rồng sống tại Bàn Địa Tộc, có sứ mạnh công phá uy dũng', NULL, 37, 'Bàn Thạch Long', 0, NULL, NULL, 1115, NULL, NULL, NULL, NULL),
	(49, 1500, NULL, NULL, NULL, 6, 'Không biết vì nguyên do gì mà từ một con rồng ôn hòa lại trở nên nóng nảy như vậy. Hễ ai chọc giận Bạo Liệt Long là đều có có kết cục đẹp', NULL, 56, 'Bạo Liệt Long', 0, 1, 58, 824, NULL, NULL, NULL, NULL),
	(48, 1500, NULL, NULL, NULL, 6, 'Đôi cánh là binh khí uy lực nhất của sinh vật gia tộc Rồng này', NULL, 20, 'Dực Long', 0, 600, 4, 610, NULL, NULL, NULL, NULL),
	(47, 1500, NULL, NULL, NULL, 6, 'Gia nhập vào binh đoàn ác ma từ lâu nên các thủ đoạn tội ác của chúng Lợi Trảo Long đều rất thông thuộc và từ từ mất đi tính tôn quý từ gia tộc Rồng', NULL, 36, 'Lợi Trảo Long', 0, NULL, NULL, 615, NULL, NULL, NULL, NULL),
	(46, 1500, NULL, NULL, NULL, 6, 'Chỉ thích một cuộc sống yên bình, vì vậy đã sống ẩn dật nhiều năm ở các dãy núi Vân Lộc Sơn. Ai làm phiền Leviathan sẽ phải gánh chịu hậu quả nặng nề', NULL, 28, 'Leviathan', 0, NULL, NULL, 484, 3548, NULL, NULL, NULL),
	(45, 1500, NULL, NULL, NULL, 6, 'Không ai có thể tùy tiện bắt nạt được Samael', NULL, 42, 'Samael', 0, NULL, NULL, 482, 3548, NULL, NULL, NULL),
	(44, 1500, NULL, NULL, NULL, 6, 'Núp bóng dưới hình hài 1 con rồng nhỏ dễ thương nhưng thật ra nó chẳng có họ hàng gì với loài rồng', NULL, 5, 'Mammon', 0, 1920, 7, 479, 3548, NULL, NULL, NULL),
	(43, 1500, NULL, NULL, NULL, 4, 'Được gọi là Tử thần của Cổ Thần, đã tham gia chinh phạt nhiều năm, kinh nghiệm chiến đấu hơn người', NULL, 37, 'Tiểu Binh Cổ Thành【BOSS lv150】', 0, 1920, 6, 1149, 6218, 4742, 3232, NULL),
	(42, 1500, NULL, NULL, NULL, 4, 'Có khả năng tự thay đổi diện mạo một cách nhanh chóng, không ai biết được bộ mặt thật', NULL, 18, 'Thiên Diện Ma Vương', 0, NULL, NULL, 412, 3402, 3403, 3404, NULL),
	(41, 1500, NULL, NULL, NULL, 4, 'Là một trong những yêu ma mạnh nhất luôn đối đầu với thế giới chính nghĩa. Khi xuất hiện luôn có ngọn lửa bao quanh người', NULL, 35, 'Ma Thần', 0, 1920, 7, 143, 2010, 1798, 1902, 3561),
	(40, 1500, NULL, NULL, NULL, 4, 'Có khả năng khống chế thế giới thực và ảo, tính tình quái dị, ma lực thần bí. Không ai ở Đại Lục Vô Ưu này là không biết độ khủng của bọn chúng', NULL, 23, 'Ma Chiến', 0, 1, 31, 131, 3725, 3726, 3494, NULL),
	(39, 1500, NULL, NULL, NULL, 4, 'Nhìn như vũ khí uy lực to lớn, có khả năng phá vỡ bất kỳ tảng băng cứng rắn nào', NULL, 70, 'Cơ Giáp Phá Băng Loại 300', 0, NULL, NULL, 1001, NULL, NULL, NULL, NULL),
	(38, 1500, NULL, NULL, NULL, 4, 'Là cua nhưng lại thích sống trên cạn hơn dưới nước. Vì vậy mà sức mạnh của nó cũng rất khó lường', NULL, 29, 'Cua Yêu', 0, NULL, NULL, 191, NULL, NULL, NULL, NULL),
	(37, 1500, NULL, NULL, NULL, 4, 'Tuy không có sức nóng công phá như mặt trời thật sự nhưng cũng đủ làm nhân loại một phen điên đảo', NULL, 18, 'Tiểu Thái Dương', 0, NULL, NULL, 34, NULL, NULL, NULL, NULL),
	(36, 1500, NULL, NULL, NULL, 7, 'Vị thống soái tàn bạo nhất trong giới ác ma. Là đại diện cho năng lực tà ác', NULL, 2005, 'Chu Ma Vương【Quái Chính 5 Chu Ma Điện】', 0, 240, 11, 1245, 5894, 5895, NULL, NULL),
	(35, 1500, NULL, NULL, NULL, 7, 'Vì hút quá nhiều máu người nên được phong là vua trong các loài muỗi', NULL, 69, 'Muỗi Đại Vương', 0, NULL, NULL, 1191, 5851, 5837, 5838, 5840),
	(34, 1500, NULL, NULL, NULL, 5, 'Không tà cũng không chính, giết người chủ yếu chỉ là sở thích của Atula Vương', NULL, 20, 'Atula Vương', 0, 1, 31, 786, 4756, 3494, NULL, NULL),
	(32, 1500, NULL, NULL, NULL, 5, 'Đeo kính mát để che giấu đôi mắt gian xảo, thích trêu ghẹo người khác của mình', NULL, 19, 'Mèo Yêu Tinh Nghịch', 0, 480, 5, 38, NULL, NULL, NULL, NULL),
	(33, 1500, NULL, NULL, NULL, 7, 'Không biết học yêu thuật từ phương nào mà phù thủy này toàn thân đều có mùi lá cây', NULL, 509, 'Phù Thủy Tà Ác 【Lục Tiên Cảnh】', 0, NULL, NULL, 633, 3859, 3721, 3787, 3812),
	(31, 1500, NULL, NULL, NULL, 5, 'Làm nhiều chuyện xấu quá nên phải đeo kính đen để tránh bị truy nã', NULL, 34, 'Mèo Kính Đen', 0, 1920, 6, 44, 2681, NULL, NULL, NULL),
	(30, 1500, NULL, NULL, NULL, 7, 'Đây là hồn phách của thủ lĩnh tử trận năm xưa. Sau khi bị ma khí xâm nhập thể xác đã trở nên cuồng bộ, luôn muốn tấn công vào Tinh Linh Thành', NULL, 37, 'Thành Chủ【Boss Chính Tuyến】', 0, NULL, NULL, 1132, 2203, 5749, NULL, NULL),
	(29, 1500, NULL, NULL, NULL, 7, 'Truyền thuyết kể rằng, hộ sĩ sau khi chiến đấu ác ma đã rơi vào giấc ngủ say, nhưng không biết vì lý do gì, sau khi tỉnh giấc, hắn hoàn toàn thay đổi, trởi thành linh hồn núp sau loài cây kịch động ở Mê Huyễn, đợi thời cơ tấn công Vô Ưu', NULL, 2004, 'Cự Ma Mê Huyễn 【4 BOSS chính Mê Huyễn】', 0, NULL, NULL, 1006, 6216, 6217, NULL, NULL),
	(28, 1500, NULL, NULL, NULL, 7, 'Đây là chiến tướng ác ma được phong ấn sâu trong Liệt Diễm Thâm Uyên. Lần theo thời gian, sức phong ấn giảm dần, Abate tìm cách trốn thoát, thống soái ma giới', NULL, 520, 'Abate 【BOSS Liệt Diễm 4】', 0, NULL, NULL, 957, 5437, 5439, 3231, NULL),
	(27, 1500, NULL, NULL, NULL, 7, 'Đây là vị cua bạo ngược nhất trong lịch sử, được chôn cất ở lăng mộ nằm sâu trong hoang mạc. Khi phong ấn không còn, hắn sẽ là nỗi kinh hoàng cho tất cả cư dân', NULL, 504, 'Pharaoh Cabu III 【Kho Báu Đại Mạc】', 0, NULL, NULL, 321, 3113, 3114, 3115, NULL),
	(26, 1500, NULL, NULL, NULL, 4, 'Bề ngoài như 1 đứa con nít dễ thương nhưng thực ra là 1 binh khí chiến đấu lợi hại của vương quốc robot. Tuy không trang bị nhiều đạn dược nhưng cũng đủ làm cho kẻ địch phải lao đao', NULL, 7, 'Búp Bê Máy', 0, NULL, NULL, 26, NULL, NULL, NULL, NULL),
	(25, 1500, NULL, NULL, NULL, 7, 'Yêu thú bên cảnh của Ma Vương. Bề ngoài to lớn, hung ác, xấu xí, đủ làm cho mọi người không dám đến gần, huống hồ chi là khiêu chiến', NULL, 21, 'Phủ Ma', 0, NULL, NULL, 130, 3722, 3723, 3450, NULL),
	(24, 1500, NULL, NULL, NULL, 7, 'Linh vật biểu tượng cho sự tài phú. Mèo ta sẵn sàng cho các cư dân một món tài sản kết xù nhưng không phải ai cũng có được dễ dàng. Phải chứng minh mình là người xứng đáng nhé!', NULL, 3, 'Chiêu Tài Mao', 0, 1920, 6, 126, 3712, 3713, 3714, 3715),
	(23, 1500, NULL, NULL, NULL, 5, 'Hình dáng bất định, sức mạnh bất ngờ. Không ai đối đầu nổi với Ma Hồn', NULL, NULL, 'Ma Hồn【Kiếp Nạn Vô Ưu - Ma Hồn】', 0, NULL, NULL, 1269, 5995, 5996, 5997, NULL),
	(22, 1500, NULL, NULL, NULL, 2, 'Kỳ Kỳ là một tinh linh của tộc người Naga truyền thuyết, nắm giữ sức mạnh hắc ám vô biên của vùng biển cổ xưa và chỉ có Kỳ Kỳ mới có khả năng thi triển năng lực huyền bí của tộc Naga', 1428, NULL, 'Kỳ Kỳ', 0, NULL, NULL, 1270, 5944, 5947, NULL, NULL),
	(21, 1500, NULL, NULL, NULL, 1, 'Pony là truyền nhân nhí, dễ thương của gia tộc Ngựa Một Sừng, luôn mong muốn đem lại hòa bình cho thế giới. Sở hữu ma pháp trị liệu thần thánh của gia tộc và rất ghét chiến tranh.', 1427, NULL, 'Pony', 0, NULL, NULL, 1177, 5824, 5827, NULL, NULL),
	(20, 1500, NULL, NULL, NULL, 6, 'Loni vốn là con gải của Đông Hải Long Vương, thông minh, đáng yêu, hiền lành, tốt bụng, và đặc biệt luôn hiếu kỳ với cuộc sống của nhân gian. Sở hữu kỹ năng ma pháp bí chú lợi hại, nhưng do tuổi còn quá nhỏ, công lực bí chú chưa được phát huy ổn định', 1426, NULL, 'Loni', 0, NULL, NULL, 1151, 5731, NULL, NULL, NULL),
	(19, 1500, NULL, NULL, NULL, 5, 'Camy là truyền nhân của dòng tộc ác ma. Nhờ vào những ca khúc 《Linh Hồn Khúc》 ai oán, thần bí mà có thể trói buộc được linh hồn của đối phương, làm kẻ thù mất đi khả năng tự hồi phục và trị liệu. Đây cũng là kỹ năng làm cho người khác khiếp sợ trong hệ Ác', 1425, NULL, 'Camy', 0, NULL, NULL, 1088, 5561, NULL, NULL, NULL),
	(18, 1500, NULL, NULL, NULL, 5, 'Nấm Điện xuất thân từ vương quốc nấm xa xôi, nghe nói bọn yêu ma từng dụ dỗ Nấm Điện chống lại các gia tộc, nhưng Nấm Điện chính nghĩa đã không nghe theo. Nấm Điện có đòn tấn công sát thương quy mô lớn, là pet thích hợp dùng để luyện cấp 50 - 80.', 1424, NULL, 'Nấm Điện', 0, NULL, NULL, 953, 5417, 5461, 5464, NULL),
	(17, 1500, NULL, NULL, NULL, 1, 'Tuy có vẻ ngoài vô cùng đáng yêu nhưng sức chiến đấu của pet này thật sự rất đáng nể. Với bản chất thông minh, kế thừa và phát huy được các ưu thế của pet hệ người, ngoài ra còn sở hữu 2 kỹ năng tấn công ma pháp liên tục và ngăn chặn sát thương, Thỏ Baby ', 1423, NULL, 'Thỏ Baby', 0, NULL, NULL, 903, 5363, 5366, NULL, NULL),
	(16, 1500, NULL, NULL, NULL, 3, 'Nhím Xanh là tinh linh cao cấp, tuy vẻ ngoài đáng yêu và có chút yếu ớt nhưng bên trong lại có sức mạnh kinh hồn mà bản thân chưa biết. Có thể học được tất cả kỹ năng hệ thực vật. Hai kỹ năng đặc biệt nhất là Tiêu Nhược và Phản Xạ. Khi lâm vào hoàn cảnh s', 1422, NULL, 'Nhím Xanh', 0, NULL, NULL, 876, 5133, 5144, NULL, NULL),
	(15, 1500, NULL, NULL, NULL, 5, 'Đừng để vẻ đẹp của Công Chúa Ác Ma đánh lừa bạn, khả năng phá hoại của cô ấy khiến cho Ma Vương cũng phải ngán ngẩm, bản lĩnh dẫn dắt sức mạnh ma giới sẽ tạo sát thương cực mạnh cho kẻ địch.', 1421, NULL, 'Công Chúa Ác Ma', 0, NULL, NULL, 722, 4017, NULL, NULL, NULL),
	(14, 1500, NULL, NULL, NULL, 5, 'Hoàng Tử Thiên Sứ là niềm tự hào của Tộc Thiên Sứ, có khả năng dẫn dắt sức mạnh thần thánh, bảo vệ và tăng sức chiến đấu cho bản thân và đồng đội.', 1420, NULL, 'Hoàng Tử Thiên Sứ', 0, NULL, NULL, 721, 4018, NULL, NULL, NULL),
	(13, 1500, NULL, NULL, NULL, 4, 'Là người thừa kế duy nhất của hoàng tộc vương quốc máy móc, vẻ mặt đáng yêu thánh thiện, Momo sở hữu những kỹ năng sử dụng năng lượng sóng điện như Mê Tâm hay Khóa Mục Tiêu, khiến đối thương trúng sát thương trong chớp mắt. Ngoài ra các kỹ năng hệ máy như', 1419, NULL, 'Momo', 0, NULL, NULL, 776, 4739, NULL, NULL, NULL),
	(85, 1500, NULL, NULL, NULL, 9, 'Vì tấm lòng yêu thương nhân loại, \nShiba được xem là sứ giả hòa bình may mắn', 2247, NULL, 'Võ Sĩ Shiba', 0, NULL, NULL, 2246, 6903, 6891, NULL, NULL),
	(12, 1500, NULL, NULL, NULL, 2, 'Chúa sơn lâm đã xuất hiện! Đừng nhìn vẻ bề ngoài đáng yêu của pet mà xem thường nhé. Các kỹ năng hấp thu HP của Kim Hổ tạo sát thương cực mạnh, khiến cho pet này có năng lực chiến đấu mạnh mẽ trên chiến trường và sức chịu đựng bền bỉ.', 1418, NULL, 'Kim Hổ', 0, NULL, NULL, 735, 4042, NULL, NULL, NULL),
	(11, 1500, NULL, NULL, NULL, 4, 'Dê thì phải ăn cỏ thôi, bộ lạ lắm à?', 1417, NULL, 'Dê Con II', 0, NULL, NULL, 728, 3820, NULL, NULL, NULL),
	(10, 1500, NULL, NULL, NULL, 3, 'Không nên xem thường quả dứa bé nhỏ này, chất độc trên người nó khiến cho loài rồng cũng phải kiêng dè. Các kỹ năng độc và hồi HP của pet này đều rất đáng nể.', 1416, NULL, 'Dứa Mật', 0, NULL, NULL, 488, 3547, 3562, 3557, 3575),
	(9, 1500, NULL, NULL, NULL, 6, 'Long tộc là chủng tộc pet cao quý trên Vô Ưu Đại Lục, khả năng miễn 70% sát thương khiến cho kẻ địch phải chùn bước. Nếu có thêm các kỹ năng hỗ trợ, pet rồng sẽ khiến cho kẻ nào dám đương đầu đều sẽ hối hận!', 1415, NULL, 'Thần Long Viễn Cổ', 0, NULL, NULL, 487, 3548, NULL, NULL, NULL),
	(8, 1500, NULL, NULL, NULL, 6, 'Long tộc là chủng tộc pet cao quý trên Vô Ưu Đại Lục, khả năng miễn 70% sát thương khiến cho kẻ địch phải chùn bước. Nếu có thêm các kỹ năng hỗ trợ, pet rồng sẽ khiến cho kẻ nào dám đương đầu đều sẽ hối hận!', NULL, NULL, 'Đinh Long', 0, NULL, NULL, 486, 3548, NULL, NULL, NULL),
	(7, 1500, NULL, NULL, NULL, 3, 'Tinh Linh Hộ Thú tuy không sở hữu sức tấn công mạnh mẽ, cũng không có ma pháp huyền diệu, nhưng độ trung thành của pet này là không thể xem thường. Khả năng liều mình ngăn chặn tấn công vật lý cho chủ nhân và đồng đội chắc chắn sẽ khiến bạn yên tâm trên b', NULL, NULL, 'Tinh Linh Hộ Thú', 0, NULL, NULL, 447, 3379, NULL, NULL, NULL),
	(6, 1500, NULL, NULL, NULL, 2, 'Thực lực của Kim Ngưu là quá rõ ràng, các điểm tư chất cao, sức tấn công mạnh và lượng HP dồi dào, cộng thêm vẻ ngoài đáng sợ đã khiến Kim Ngưu trở thành 1 trong những pet đáng gờm trên Vô Ưu Đại Lục. Một pet Kim Ngưu có kỹ năng Dã Thú Cuồng Vũ chính là m', NULL, NULL, 'Kim Ngưu', 0, NULL, NULL, 367, NULL, NULL, NULL, NULL),
	(5, 1500, NULL, NULL, NULL, 2, 'Chú dê con bé nhỏ này rất thích hợp cho những người chơi mới do có sức tấn công mạnh, tốc độ nhanh, bạo kích cao, lại có thuộc tính ám hỗ trợ, điểm yếu là lượng HP tương đối thấp và dễ bị pet thuộc tính quang khắc chế.', NULL, NULL, 'Hổ Bì Dương', 0, NULL, NULL, 91, NULL, NULL, NULL, NULL),
	(4, 1500, NULL, NULL, NULL, 1, 'Là nhân vật hình mẫu của các gia tộc. Vẻ ngoài xinh xắn, nhưng năng lực biến hóa khôn lường. Muốn thử nghiệm thì cứ động thủ !', 1410, NULL, 'Tiểu Lương Tử', 0, NULL, NULL, 87, 3651, NULL, NULL, NULL),
	(3, 1500, NULL, NULL, NULL, 1, 'Y Tá MM là một y tá đẳng cấp của gia tộc Đông Huyền, vừa tận tâm, vừa ôn hòa, dễ mến. Bằng tài năng và sự chân thành, có Y Tá MM bên cạnh, mọi vết thương trên người đều sẽ được trị khỏi. Tuy nhiên trong những cuộc chiến sinh tử, Y Tá MM luôn có năng lực s', NULL, NULL, 'Y Tá MM', 0, NULL, NULL, 71, 3412, 3418, NULL, NULL),
	(2, 1500, NULL, NULL, NULL, 5, 'Ác Ma Quấy Phá có năng lực phá hoại cực mạnh. Nếu sở hữu Ác Ma Chi Kích, pet sẽ có năng lực sát thương cực mạnh, nếu có Tình Yêu Ngụy Kế, pet sẽ tạo sát thương cho số đông, đặc biệt là kỹ năng Lời Ngọt Ngào có thể cùng lúc gây sát thương cho 10 mục tiêu, ', 1408, NULL, 'Ác Ma Quấy Phá', 0, NULL, NULL, 20, 3307, 3308, 3319, NULL),
	(1, 1500, NULL, NULL, NULL, 5, 'Thiên Sứ Mít Ướt là hóa thân của thần Tình Yêu, vì thế có nhiều kỹ năng rất kỳ diệu. Nếu sở hữu Hào Quang Ái Thần, pet sẽ có khả năng trị liệu cho nhiều người, nếu có kỹ năng Mũi Tên Cupid, pet sẽ khiến cho nhiều địch thủ rơi vào trạng thái hỗn loạn, đặc ', 1407, NULL, 'Thiên Sứ Mít Ướt', 0, NULL, NULL, 19, 3309, 3310, 3319, NULL),
	(72, 1500, NULL, NULL, NULL, 2, 'Là 1 trong những á ma truyền thuyết,. Một phần thân thể bị giam ở Đăng Vân Địa, nhiều lần toan tính thoát khỏi nhưng đều thất bại, Vì vậy, nhiều phân thân của hắn cứ xuất hiện quấy phá cư dân', NULL, NULL, 'Hidra【Kiếp Nạn Vô Ưu - Hidra】', 0, 1, 31, 1300, 6021, 6023, 6024, NULL),
	(73, 1500, NULL, NULL, NULL, 3, 'Sinh vật kịch độc trong Mê Huyễn Động, chỉ cần bị gai nhọn đâm vào là có thể chết ngay tức khắc', NULL, 2001, 'Xương Rồng Cực Độc', 0, NULL, NULL, 343, 3235, NULL, NULL, NULL),
	(74, 1500, NULL, NULL, NULL, 8, 'Dù có tin hay không thì nấm điện vẫn là 1 cô gái dễ thương không kém gì mỹ nhân nào ^_^', NULL, NULL, 'Nấm Điện【Bản Trưởng Thành】', 0, NULL, NULL, 1432, 5417, 5461, 5464, NULL),
	(75, 1500, NULL, NULL, NULL, 3, 'Là yêu nữ của Băng Tuyết, có khả năng đưa người khác vào trạng thái mơ ảo giữa thực và hư', NULL, 43, 'Ảo Mộng Nữ Yêu 【BOSS Phi Hành lv135】', 0, 1920, 6, 1052, 5411, 3232, NULL, NULL),
	(76, 1500, NULL, NULL, NULL, 3, 'Người bạn đồng hành trung thành nhất của các dũng sĩ Vô Ưu', NULL, NULL, 'Tiểu Nấm Yêu', 0, 1, 31, 32, NULL, NULL, NULL, NULL),
	(77, 1500, NULL, NULL, NULL, 3, 'Tuy hình dáng thật thà, dễ thương nhưng chỉ cần sơ hở là sẽ bị nuốt chửng. Một cái chết bất ngờ và nhẹ nhàng ', NULL, 7, 'Cây Nắp Ấm', 0, NULL, NULL, 332, 2791, NULL, NULL, NULL),
	(78, 1500, NULL, NULL, NULL, 3, 'Ếch vốn là sinh vật ôn hòa, nhưng vì chịu nguyền rủa của bóng đêm mà thay đổi trở thành độc ác và sẵn sàng bất kỳ ai xâm phạm vào lãnh thổ đầm lầy của nó', NULL, 67, 'Ếch Độc Đầm Lầy', 0, 1920, 7, 983, NULL, NULL, NULL, NULL),
	(79, 1500, NULL, NULL, NULL, 3, 'Sinh trưởng dưới đáy đại dương, làm kẻ thù phải chết ngạt trong môi trường thiếu oxy', NULL, 525, 'Dây Rong', 0, NULL, NULL, 1326, NULL, NULL, NULL, NULL),
	(80, 1500, NULL, NULL, NULL, 3, 'Vua thực vật sinh sống tại Linh Lan, cực mạnh và đầy quyền lực, gần đây hắn đang triệu tập lực lượng để chống lại các gia tộc.', NULL, 19, 'Bách Thảo Tinh', 0, NULL, NULL, 127, 2613, 3721, 3720, NULL),
	(53, 1500, 0, 0, 0, 1, 'Tập đoàn cướp bóc xuyên đại lục, là 1 trong những mối nguy hại hàng đầu của Đại Lục Vô Ưu', NULL, 15, 'Thủ Lĩnh Hải Tặc', 0, 1920, 7, 22, 3376, 3377, 0, 0),
	(82, 1500, 0, 0, 0, 9, 'Với kungfu cái thế, Chiến Dương là 1 trong những thần thú đáng gờm nhất Đại Lục Vô Ưu', 2072, NULL, 'Chiến Dương', 0, NULL, NULL, 2071, 6626, 6635, 0, 0),
	(83, 1500, 0, 0, 0, 9, 'Tề Thiên Đại Thánh, nhất thế chí tôn, đi nam về bắc, lên trời xuống đất, thần kỳ bách biến.', 2146, NULL, 'Đại Thánh Chí Tôn', 0, NULL, NULL, 2145, 6712, 6721, 6751, 0),
	(84, 1500, 0, 0, 0, 9, 'Chim phượng hoàng sinh là từ ngọn lửa bất tử phương nam. \nMỗi lần chết đi, quanh thân sẽ xuất hiện vòng lửa, \nsau đó tiếp tiếp tục từ lửa mà tái sinh, \nđồng thời sức mạnh càng tăng gấp bội phần', 2222, NULL, 'Moltres', 0, NULL, NULL, 2221, 6839, 6842, 6845, NULL),
	(86, 1500, NULL, NULL, NULL, 9, 'Hóa thân của Hiệp Sĩ Lợn, tiêu trừ cái ác, đem lại hòa bình cho thế giới', 2250, NULL, 'Burin', 0, NULL, NULL, 2249, 6920, 6929, 6932, NULL),
	(87, 1500, NULL, NULL, NULL, 9, 'Chú chuột thông minh, tài hoa.', 2274, NULL, 'Jery', 0, NULL, NULL, 2273, 6959, 6962, NULL, NULL),
	(88, 1500, NULL, NULL, NULL, 9, 'Sau một trận cuồng phong, \nLong Tiểu Thanh xuất hiện trên một đám mây', 2278, NULL, 'Long Tiểu Thanh', 0, NULL, NULL, 2277, 6978, 6981, 6969, NULL),
	(89, 1500, NULL, NULL, NULL, 9, 'Vân tập sự huyền bí của Nam thất tinh túc', 2280, NULL, 'Kim Tước', 0, NULL, NULL, 2279, 6984, 6993, 6996, NULL),
	(90, 1500, NULL, NULL, NULL, 9, 'Xung quah bao trùm linh khí huyền vũ', 2282, NULL, 'Huyền Minh Linh Vũ', 0, NULL, NULL, 2281, 7002, 7011, 7014, NULL),
	(91, 1500, NULL, NULL, NULL, 10, 'Hàn khí ngùn ngụt', 2291, NULL, 'Bạch Hổ Cuồng Nộ', 0, NULL, NULL, 2290, 7017, 7026, 7029, 7032),
	(92, 1500, NULL, NULL, NULL, 10, 'Một sinh vật hùng mạnh mang sức mạnh sấm sét', 2293, NULL, 'Lôi Lân Ảnh', 0, NULL, NULL, 2292, 7038, 7047, 7050, NULL);


--
-- PostgreSQL database dump complete
--

-- \unrestrict xShcW0xRncW5fjRkdad7tb4eicnjUhpXTxHd5H004No8sckTkIoXq9o583ijGd8


SET session_replication_role = origin;
