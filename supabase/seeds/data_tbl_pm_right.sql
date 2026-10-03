SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict tTwbYASGFmLN43X6O064T2LUOrVsYHnYFIzXcGeOKkHwdsncFlhfES68W0CjFqC

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
-- Data for Name: data_tbl_pm_right; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_pm_right" ("id", "count_config", "desc", "desc2", "sort_index", "type", "value1", "value2", "value3", "value4", "value5", "value6", "value7", "value8", "value9", "vip1", "vip2", "vip3", "vip4", "vip5", "vip6", "vip7", "vip8", "vip9") VALUES
	(2, '1|1|1', 'Mỗi ngày nhận <font color="#00FF00">{num}</font> kim phiếu\r\r', 'Mỗi ngày nhận kim phiếu', 1, 2, 10, 15, 20, 20, 25, 25, 30, 35, 40, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(1, '1|1|1', 'Mỗi ngày nhận 1 lượng kinh nghiệm\r', 'Mỗi ngày nhận 1 lượng kinh nghiệm', 2, 2, 2, 3, 3, 5, 5, 7, 7, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(3, '1|1|1', 'Mỗi ngày tăng <font color="#00FF00">{num}</font>% tấn công, <font color="#00FF00">{num}</font>% phòng ngự, <font color="#00FF00">{num}</font>% HP\r', 'Mỗi ngày nhận BUFF', 3, 2, 4, 4, 6, 6, 8, 8, 10, 10, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(4, NULL, 'Lập nhóm đánh quái sẽ được nhiều kinh nghiệm\r', 'Nhóm đánh quái tăng exp', 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(5, NULL, 'Tích lũy tăng <font color="#00FF00">{num}</font> ô Túi Tiện Dụng\r', 'Tăng ô Túi Tiện Dụng', 9, 3, NULL, 6, 12, 18, 24, 30, 36, 42, 48, 0, 1, 1, 1, 1, 1, 1, 1, 1),
	(6, NULL, 'Tăng tỉ lệ dung hợp pet thường cam <font color="#00FF00">{num}</font>%', 'Tăng tỉ lệ dung hợp pet thường cam', 11, 3, NULL, NULL, 1, 2, 3, 4, 5, 6, 7, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(7, '1|1|1', 'Mỗi ngày nhận <font color="#00FF00">{num}</font> Sách Tự Động Hoàn Thành Phụ Bản\r', 'Nhận sách auto phụ bản\r', 6, 2, NULL, NULL, NULL, 1, 2, 3, 4, 5, 6, 0, 0, 0, 1, 1, 1, 1, 1, 1),
	(8, NULL, 'Tỉ lệ dung hợp thành công nguyên liệu cấp 6 tăng <font color="#00FF00">{num}</font>%\r', 'Tăng % d.hợp ng.l cấp 6\r', 12, 3, NULL, NULL, NULL, 1, 2, 3, 4, 5, 6, 0, 0, 0, 1, 1, 1, 1, 1, 1),
	(9, NULL, 'Tăng tỉ lệ dung hợp cánh thường cam <font color="#00FF00">{num}</font>%', 'Tăng tỉ lệ dung hợp cánh thường cam', 13, 3, NULL, NULL, NULL, 1, 2, 3, 4, 5, 6, 0, 0, 0, 1, 1, 1, 1, 1, 1),
	(10, '2|30|1', 'Mỗi tháng có thể nhận 1 loại túi quà VIP\r', 'Mỗi tháng nhận quà VIP\r', 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(11, NULL, 'Mua tại Shop Vip\r', 'Mua tại Shop Vip\r', 17, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(12, NULL, 'Triệu hồi thần thú tím\r', 'Triệu hồi thần thú tím\r', 16, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(13, '1|1|1', 'Mỗi ngày biến hình 1 lần\r', 'Mỗi ngày biến hình 1 lần\r', 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(14, NULL, 'Kích hoạt chức năng Xủ Quẻ Cao Cấp\r', 'K.hoạt X.Quẻ Cao Cấp\r', 15, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1),
	(15, NULL, 'Biểu tượng VIP\r', 'Biểu tượng VIP\r', 18, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(16, NULL, 'Thao tác tìm Phi Tặc nhanh\r', 'Thao tác Phi Tặc nhanh\r', 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(17, NULL, 'Kích hoạt các chức năng: Nhận nhanh, Ph.giải nhanh trong Xủ Quẻ\r', 'K.hoạt ch.năng X.Quẻ\r', 14, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(18, NULL, 'Mở chức năng Hoán Đổi Bảo Thạch miễn phí', 'Đổi Bảo Thạch miễn phí\r', 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(20, NULL, 'Thẻ Bài Pha Lê: Mỗi ngày mua tăng  <font color="#00FF00">{num}</font> lần phát bài\r', 'Thêm lần phát bài\r', 19, 3, 15, 20, 25, 30, 35, 40, 45, 50, 55, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(19, NULL, 'Mở chức năng đấu giá hàng loạt\r', 'C.năng đấu giá hàng loạt\r', 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(21, NULL, 'Mở Vòng Xoay VIP\r', 'Mở Vòng Xoay VIP\r', 21, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(22, NULL, 'Tại Sách Tiến Hóa có thể trực tiếp kích hoạt', 'Tại Sách Tiến Hóa có thể trực tiếp kích hoạt', 22, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(23, NULL, 'Trong Vũ Hóa có thể thăng cấp nhanh và nhiều', 'Trong Vũ Hóa có thể thăng cấp nhanh và nhiều', 23, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(24, '1|1|1', 'Có thể tự hồi phục đặc quyền VIP chưa nhận', 'Có thể tự hồi phục đặc quyền VIP chưa nhận', 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 1, 1),
	(25, NULL, 'Miễn phí đổi MVỡ Tinh Cung', 'Miễn phí đổi MVỡ Tinh Cung', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(26, NULL, 'Mở kho báu nhanh', 'Mở kho báu nhanh', 26, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(27, NULL, 'Cường Hóa Hồn Khí 10 lần', 'Cường Hóa Hồn Khí 10 lần', 27, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(28, NULL, 'Tăng lượt chế tạo Mật Bảo', 'Tăng lượt chế tạo Mật Bảo', 28, 3, NULL, 5, 10, 15, 20, 25, 30, 35, 40, 0, 1, 1, 1, 1, 1, 1, 1, 1),
	(29, NULL, 'Tăng số lần Sổ Tay Ma Thú', 'Tăng số lần Sổ Tay Ma Thú', 29, 3, 0, 0, 1, 1, 1, 2, 2, 2, 3, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(30, NULL, 'Tăng điểm nhận khi mở Thẻ Bài Pha Lê', 'Tăng điểm nhận khi mở Thẻ Bài Pha Lê', 30, 3, 0, 0, 1, 2, 3, 4, 5, 6, 7, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(31, NULL, 'Tăng số phần thưởng khi diệt Ma Binh', 'Người tiêu diệt Ma Binh', 31, 3, 0, 0, 1, 1, 1, 2, 2, 2, 3, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(32, NULL, 'Tự động ủy thác phụ bản Thám Hiểm', 'Tự động ủy thác phụ bản Thám Hiểm', 32, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(33, NULL, 'Tự Động Thần Tu', 'Tự Động Thần Tu', 33, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(34, NULL, 'Tăng số lượng thử thách Không Gian Điêu Khắc', 'Tăng số lượng thử thách Không Gian Điêu Khắc', 34, 3, 0, 0, 1, 1, 1, 2, 2, 2, 3, 0, 0, 1, 1, 1, 1, 1, 1, 1),
	(35, NULL, 'Phân giải nhanh M.Hồn lam', 'Phân giải nhanh M.Hồn lam', 35, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1, 1);


--
-- PostgreSQL database dump complete
--

-- \unrestrict tTwbYASGFmLN43X6O064T2LUOrVsYHnYFIzXcGeOKkHwdsncFlhfES68W0CjFqC


SET session_replication_role = origin;
