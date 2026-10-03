SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict Bf447BE7T0LQe9yHJzGZgqNN1F7IbP3vZhE0LvpaAA8ZhiIzlnqpRYpeqtOl7UU

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
-- Data for Name: data_tbl_mevent_type; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_mevent_type" ("id", "name", "npc_id", "tip", "type") VALUES
	(1, 'Điểm đầu', 0, '0', 1),
	(2, 'Điểm cuối', 0, '0', 2),
	(3, 'Điểm giữa', 0, '0', 3),
	(4, 'Bảo rương nhỏ', 2343, 'Bảo vật ẩn chứa trong Bí Cảnh, người may mắn mới mở được.\nNgẫu nhiên mở được: 100 Kết Tinh Thần Dụ, nguyên liệu cấp 4.', 4),
	(5, 'Bảo rương trung', 2344, 'Bảo vật ẩn chứa trong Bí Cảnh, người may mắn mới mở được.\nNgẫu nhiên mở được: 100 Kết Tinh Thần Dụ, nguyên liệu cấp 5, Tinh Hồn Linh Giáp.', 5),
	(6, 'Bảo rương lớn', 2345, 'Bảo vật lớn ẩn chứa trong Bí Cảnh, phải người kiên trì mới mở được.\nNgẫu nhiên mở được: lượng lớn Kết Tinh Thần Dụ, bảo thạch thượng hạng, Tẩy Tủy Đan cao cấp', 6),
	(7, 'Ô đấu', 2347, 'Đây là vùng đất trong Bí Cảnh bị những kẻ lang thang chiếm đóng, ai bước vào không có mạng trở ra.', 7),
	(8, 'Ô Đại Thánh', 2348, 'Đây vật độc thường thấy trong Bí Cảnh, đối với những kẻ ngoại lai nó đều tỏ vẻ không lương thiện.', 8),
	(9, 'Ô Đại Thánh', 2349, 'Sở hữu sức mạnh thần kỳ, làm mê hoặc lòng người', 8),
	(10, 'Ô Đại Thánh', 2350, 'Sự tồn tại thần bí trong Bí Cảnh, tốt nhất là tìm đường khác mà đi.', 8),
	(11, 'Chuyển trận', 2346, 'Lực không gian không ổn định, bất cứ vật nào tiếp cận đều sẽ bị đẩy đi 1 nơi khác.', 9),
	(12, 'Ô bạc', 2335, 'Ngẫu nhiên nhận 1 lượng ngân phiếu', 10),
	(13, 'Minigame', 2336, 'Chức năng chưa mở!', 11),
	(14, 'Ô Exp', 2337, 'Ngẫu nhiên nhận 1 lượng exp', 12),
	(15, 'Ô lò xo', 2338, 'Đưa về điểm xuất phát', 13),
	(16, 'Bẫy 1 - Kẹp', 2339, 'Kẹp bắt heo, đạp trúng bất động 1 khoảng thời gian', 14),
	(17, 'Bẫy 1 - Bẫy', 2340, 'Giếng sâu, rớt vào sẽ không thể di chuyển', 15),
	(18, 'Bẫy 3 - Trói Cương Thi', 2341, 'Khi bước chân vào 1 nơi xa lạ, không biết chân người sẽ ra sao', 16),
	(19, 'Bẫy 4 - Bắt Alien', 2342, 'Với kinh nghiệm nghiên cứu sinh vật ngàn năm qua, loại ngươi vừa bắt rất thích hợp làm đối tượng nghiên cứu', 17);


--
-- PostgreSQL database dump complete
--

-- \unrestrict Bf447BE7T0LQe9yHJzGZgqNN1F7IbP3vZhE0LvpaAA8ZhiIzlnqpRYpeqtOl7UU


SET session_replication_role = origin;
