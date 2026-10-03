SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict 9FradkzcRUcw4IdDdrdHI7dFNcUf3rzKJNz18WbO6vd5qzCdsmU3F8QOlWmkkgm

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
-- Data for Name: data_tbl_diary; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_diary" ("id", "act", "info", "link_type", "max", "name", "nid", "pos") VALUES
	(30, 1, 'Mỗi lần giết 1 quái vật, nhận 1 điểm năng nổ', 3, -1, 'Hoàn Thành Sự Kiện Bảo Vệ Vô Ưu', 15, 24),
	(29, 1, 'Mỗi ngày dăng nhập lần đầu, nhận 1 điểm năng nổ', -1, 1, 'Mỗi ngày đăng nhập', -1, 7),
	(28, 1, 'Thu thập Tinh Quái ở Trang Viên bạn bè, nhận 1 điểm năng nổ', 2, 1, 'Thu hoạch Trang Viên bạn bè', 801, 11),
	(27, 1, 'Thu thập Tinh Quái ở Trang Viên, nhận 1 điểm năng nổ', 2, 1, 'Thu hoạch Trang Viên', 801, 10),
	(26, 3, 'Trong trận đấu Pet, chủ động khiêu chiến người khác, nhận 1 điểm năng nổ', 2, 30, 'Tham gia Đấu Pet', 834, 9),
	(25, 30, 'Hoàn thành Phụ bản Trở Về Lang Huyệt cấp 100, nhận 30 điểm năng nổ', 1, 1, 'Hoàn thành Phụ bản Trở Về Lang Huyệt cấp 100', 200, 33),
	(24, 30, 'Hoàn thành Phụ bản Liệt Diễm Thâm Uyên cấp 90, nhận 30 điểm năng nổ', 1, 1, 'Hoàn thành Phụ bản Liệt Diễm Thâm Uyên cấp 90', 200, 32),
	(23, 20, 'Hoàn thành Phụ bản Lục Tiên Cảnh cấp 80, nhận 20 điểm năng nổ', 1, 1, 'Hoàn thành Phụ bản Lục Tiên Cảnh cấp 80', 200, 31),
	(22, 20, 'Hoàn thành Phụ bản Kho Báu Đại Mạc cấp 60, nhận 20 điểm năng nổ', 1, 1, 'Hoàn thành Phụ bản Kho Báu Đại Mạc cấp 60', 200, 30),
	(21, 20, 'Hoàn thành Phụ bản Mê Huyễn Động cấp 50, nhận 20 điểm năng nổ', 1, 1, 'Hoàn thành Phụ bản Mê Huyễn Động cấp 50', 200, 29),
	(20, 2, 'Hoàn thành Nhiệm vụ Rèn Luyện Pet, nhận 2 điểm năng nổ', 1, 20, 'Hoàn Thành Nhiệm Vụ Rèn Luyện Pet', 280, 20),
	(19, 4, 'Hoàn thành 1 Nhiệm Vụ Trị An, nhận 4 điểm năng nổ', 1, 10, 'Hoàn Thành Nhiệm Vụ Trị An', 277, 16),
	(17, 4, 'Hoàn thành 1 Nhiệm Vụ Trừ Ma, nhận 4 điểm năng nổ', 1, 10, 'Hoàn Thành Nhiệm Vụ Trừ Ma', 3, 17),
	(16, 45, 'Hoàn thành 200 vòng Nhiệm vụ 200 vòng, nhận 45 điểm năng nổ', 1, 1, 'Hoàn thành 200 vòng Nhiệm vụ 200 vòng', 48, 43),
	(15, 45, 'Hoàn thành 150 vòng Nhiệm vụ 200 vòng, nhận 45 điểm năng nổ', 1, 1, 'Hoàn thành 150 vòng Nhiệm vụ 200 vòng', 48, 42),
	(14, 45, 'Hoàn thành 100 vòng Nhiệm vụ 200 vòng, nhận 45 điểm năng nổ', 1, 1, 'Hoàn thành 100 vòng Nhiệm vụ 200 vòng', 48, 41),
	(13, 45, 'Hoàn thành 50 vòng Nhiệm vụ 200 vòng, nhận 45 điểm năng nổ', 1, 1, 'Hoàn thành 50 vòng Nhiệm vụ 200 vòng', 48, 40),
	(12, 40, 'Hoàn thành 1 lần vượt tháp dạng khiêu chiến nhận phần thưởng, nhận 40 điểm năng nổ', 2, 1, 'Vượt Ảo Ma Tháp Dạng Khiêu Chiến 1 Lần', 993, 39),
	(11, 30, 'Hoàn thành 3 lần vượt tháp dạng thường nhận phần thưởng, nhận 30 điểm năng nổ', 2, 1, 'Vượt Ảo Ma Tháp Dạng Thường 3 Lần', 993, 38),
	(10, 20, 'Hoàn thành 2 lần vượt tháp dạng thường nhận phần thưởng, nhận 20 điểm năng nổ', 2, 1, 'Vượt Ảo Ma Tháp Dạng Thường 2 Lần', 993, 37),
	(9, 10, 'Hoàn thành 1 lần vượt tháp dạng thường nhận phần thưởng, nhận 10 điểm năng nổ', 2, 1, 'Vượt Ảo Ma Tháp Dạng Thường 1 Lần', 993, 36),
	(8, 5, 'Hoàn thành 1 Nhiệm vụ Nông Trường Pháp Thuật, nhận 5 điểm năng nổ', 1, 2, 'Hoàn thành Nhiệm vụ Nông Trường Pháp Thuật', 1263, 23),
	(7, 5, 'Hoàn thành 1 Nhiệm vụ Tiệm Thuốc Đông Huyền, nhận 5 điểm năng nổ', 1, 2, 'Hoàn thành Nhiệm vụ Tiệm Thuốc Đông Huyền', 412, 22),
	(6, 5, 'Hoàn thành 1 Nhiệm vụ Hồ Đông Huyền, nhận 5 điểm năng nổ', 1, 2, 'Hoàn thành Nhiệm vụ Hồ Đông Huyền', 280, 21),
	(5, 2, 'Hoàn thành 1 nhiệm vụ Bang hội, nhận 2 điểm năng nổ', 1, 15, 'Hoàn thành nhiệm vụ Bang Hội', 1069, 15),
	(4, 5, 'Hoàn thành 1 Nhiệm vụ thần tu, nhận 1 điểm năng nổ', 1, 10, 'Hoàn thành Nhiệm vụ thần tu', 929, 18),
	(3, 2, 'Hoàn thành 1 Nhiệm vụ tu hành, nhận 2 điểm năng nổ', 1, 20, 'Hoàn thành Nhiệm vụ tu hành', 434, 19),
	(2, 1, 'Hoàn thành 1 Nhiệm vụ treo thưởng, nhận 1 điểm năng nổ', 1, 50, 'Hoàn thành Nhiệm vụ treo thưởng', 568, 13),
	(1, 1, 'Hoàn thành 1 Nhiệm vụ gia tộc, nhận 1 điểm năng nổ', -1, 20, 'Hoàn thành Nhiệm vụ gia tộc', -1, 14),
	(31, 1, 'Mỗi lần giết 1 quái vật, nhận 1 điểm năng nổ', 3, -1, 'Hoàn Thành Sự Kiện Ác Linh Hiện Thế', 14, 25),
	(33, 1, 'Tích lũy online 30 phút', -1, 12, 'Tích lũy online 30 phút', -1, 8),
	(34, 1, 'Trong phần [Nhóm] sử dụng chức năng mời nhóm, mỗi lần tạo hoặc gia nhập nhóm, nhận 1 điểm năng nổ', 2, 1, 'Tạo hoặc Gia nhập 1 nhóm', 560, 12),
	(35, 30, 'Hoàn thành phụ bản Trở Về Lang Huyệt cấp 100, nhận 30 điểm năng nổ', 1, 1, 'Hoàn thành Phụ bản Quỷ Hút Máu cấp 120\t\t\t\t\t\t\r', 200, 34),
	(36, 40, 'Hoàn thành phụ bản Mê Trận, nhận 40 điểm năng nổ', -1, 1, 'Hoàn thành phụ bản Mê Trận', -1, 26),
	(37, 5, 'Mỗi lần khiêu chiến nhận thưởng, nhận 5 điểm năng nổ', 2, 10, 'Hoàn thành Sổ Tay Ma Vật', 931, 27),
	(38, 30, 'Nhận thưởng Kiếp Nạn Vô Ưu, nhận 30 điểm năng nổ', 2, 1, 'Hoàn thành Kiếp Nạn Vô Ưu', -1, 28),
	(42, 1, 'Nuôi dưỡng Tiểu Tinh Linh', 2, 1, 'Nuôi dưỡng Tiểu Tinh Linh', 838, 0),
	(41, 30, 'Hoàn thành phụ bản Thế Giới Số lv150, nhận 30 điểm năng nổ', 1, 1, 'Hoàn thành phụ bản Thế Giới Số lv150', 200, 35),
	(43, 1, 'Nhận Năng Lượng Tự Nhiên', 2, 1, 'Nhận Năng Lượng Tự Nhiên', 883, 1),
	(44, 1, 'Nhận Bộ Thời Trang', 2, 1, 'Nhận Bộ Thời Trang', 926, 2),
	(45, 1, 'Chế tạo Mật Bảo', 2, 1, 'Chế tạo Mật Bảo', 941, 3),
	(46, 1, 'Rút Thẻ Bài', 2, 1, 'Rút Thẻ Bài', 849, 4),
	(47, 1, 'Tu luyện Tinh Cung', 2, 1, 'Tu luyện Tinh Cung', 230, 5),
	(48, 1, 'Đổi thưởng Không Gian Điêu Khắc', 2, 1, 'Đổi thưởng Không Gian Điêu Khắc', 979, 6);


--
-- PostgreSQL database dump complete
--

-- \unrestrict 9FradkzcRUcw4IdDdrdHI7dFNcUf3rzKJNz18WbO6vd5qzCdsmU3F8QOlWmkkgm


SET session_replication_role = origin;
