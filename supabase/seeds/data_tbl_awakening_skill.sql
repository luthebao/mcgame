SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict VzSpgSnCEjhYrIX2ym2ouuVLVOAe12XNzc6VZhgaMAGUKkdq2BAlgwzc3PnurAO

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
-- Data for Name: data_tbl_awakening_skill; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_awakening_skill" ("id", "cost_points", "description", "icon_code", "max_level", "name", "position", "req_class", "req_points", "skill_code_name") VALUES
	(1001, 1, 'Tăng cao sát thương kỹ năng Khai Sơn Chi Lực. \nKhi sử dụng, tăng ngay chính xác và xuyên phòng ngự.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000001, 1, 'Khai Sơn Chi Lực', 1, 1, 0, 'SKILL111001'),
	(1002, 2, 'Khi sử dụng Phá Toái, tạm thời tăng Chính xác và Bạo kích.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000003, 1, 'Phá Toái', 2, 1, 0, 'SKILL111031'),
	(1003, 1, 'Khi sử dụng Xung Kích, tăng tạm thời Chính xác và Xuyên phòng ngự, \nkhông còn tiêu hao HP mà sẽ tiêu hao MP, khi đánh hạ mục tiêu sẽ \n không hồi phục HP nữa, mà sẽ tăng tỷ lệ tốc độ ra đòn.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100152, 1, 'Xung Kích', 3, 1, 0, 'SKILL111071'),
	(1004, 1, 'Khi sử dụng Hộ Vệ, không còn gia tăng phòng ngự vật lý \nmà sẽ gia tăng tỷ lệ miễn giảm sát thương vật lý.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000007, 1, 'Hộ Vệ', 4, 1, 0, 'SKILL111021'),
	(1005, 2, 'Khi sử dụng Phòng Ngự, Né tránh về 0, không còn \n gia tăng phòng ngự mà sẽ gia tăng khả năng miễn \n giảm sát thương, tốc độ giảm mạnh.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000009, 1, 'Phòng Ngự', 5, 1, 0, 'SKILL111081'),
	(1006, 2, 'Trạng thái Thuẫn Kích, gia tăng tỷ lệ Chính xác, giảm số lượt duy trì.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100156, 1, 'Phản Kích', 6, 1, 0, 'SKILL111091'),
	(2001, 1, 'Trạng thái Tứ Diện Sở Ca, gia tăng tỷ lệ Chính xác, \ngiảm số lượt duy trì, không giảm phòng ngự ma pháp \nmà sẽ giảm khả năng miễn giảm sát thương.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000033, 1, 'Tứ Diện Sở Ca', 1, 2, 0, 'SKILL112021'),
	(2002, 2, 'Trạng thái Thôi Miên Khúc, gia tăng tỷ lệ Chính xác, \ngiảm số lượt duy trì.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000034, 1, 'Thôi Miên Khúc', 6, 2, 3, 'SKILL112031'),
	(2003, 1, 'Trạng thái Điệp Khúc Miên Hoa, gia tăng tỷ lệ Chính xác, \ngiảm số lượt duy trì, giảm công kích của mục tiêu.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000035, 1, 'Điệp Khúc Miên Hoa', 2, 2, 0, 'SKILL112041'),
	(2004, 2, 'Trạng thái Mê Mị Chi Âm, gia tăng tỷ lệ Chính xác, \ngiảm số lượt duy trì.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000037, 1, 'Mê Mị Chi Âm', 4, 2, 3, 'SKILL112051'),
	(2005, 1, 'Trạng thái Thích Đạp Chi Âm, gia tăng tỷ lệ Chính xác, \ngiảm số lượt duy trì, không giảm phòng ngự, tốc độ và \nné tránh mà giảm khả năng kháng debuff của mục tiêu.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000038, 1, 'Thích Đạp Chi Âm', 3, 2, 0, 'SKILL112071'),
	(2006, 2, 'Trạng thái Trọng Kim Chi Hồn, gia tăng tỷ lệ Chính xác, giảm số lượt duy trì.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000040, 1, 'Trọng Kim Chi Hồn', 5, 2, 3, 'SKILL112091'),
	(3001, 2, 'Khi sử dụng Quang Trừng Giới hoặc Thần Thánh Phẫn Nộ, \ntăng tạm thời Bạo kích và Xuyên phòng ngự.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000021, 1, 'Chuyên Tinh Thần Thánh', 1, 3, 0, 'SKILL113001|SKILL113061'),
	(3002, 1, 'Tăng hiệu quả trị liệu của Thần Chi Mệnh \n(dựa vào tỷ lệ lượng HP đã tổn thất của mục tiêu) .\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000022, 1, 'Thần Chi Đinh Ninh', 2, 3, 0, 'SKILL113011'),
	(3003, 1, 'Tăng hiệu quả trị liệu của Quang Minh Hộ Thân \n(dựa vào tỷ lệ lượng HP đã tổn thất của mục tiêu) .\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000024, 1, 'Quang Minh Hộ Thân', 3, 3, 0, 'SKILL113041'),
	(3004, 2, 'Khi sử dụng Thần Thánh Tịnh Hóa, gia tăng \n khả năng kháng debuff của mục tiêu.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000026, 1, 'Thần Thánh Tịnh Hóa', 4, 3, 0, 'SKILL113071'),
	(3005, 2, 'Khi sử dụng Phục Sinh Thuật, gia tăng khả năng miễn \ngiảm sát thương của mục tiêu được hồi sinh.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000027, 1, 'Phục Sinh Thuật', 5, 3, 0, 'SKILL113031'),
	(3006, 1, 'Tăng hiệu quả của Thần Ân Khôi Phục, tăng \nkhả năng trị liệu từ mức cơ bản (dựa \nvào tỷ lệ lượng HP đã tổn thất của mục tiêu) .\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000030, 1, 'Thần Ân Khôi Phục', 6, 3, 0, 'SKILL113051'),
	(5001, 1, 'Phấn Lực Đầu Cầu sát thương không còn phụ thuộc vào nhanh \nnhẹn của bản thân, tăng tạm thời Bạo kích và Xuyên phòng ngự.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100158, 1, 'Phấn Lực Đầu Cầu', 1, 5, 0, 'SKILL115001'),
	(5002, 2, 'Tăng hiệu quả trị liệu của Khẩn Cấp Bao Trát, \ncó tỷ lệ tịnh hóa 1 debuff xấu của Pet.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100159, 1, 'Khẩn Cấp Bao Trát', 2, 5, 0, 'SKILL115031'),
	(5003, 1, 'Khi sử dụng Thối Độc Chi Đinh khiến đối thủ trúng độc, \nsau mỗi lượt đánh lượng HP của đối thủ sẽ tổn thất lớn.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000044, 1, 'Thối Độc Chi Đinh', 3, 5, 0, 'SKILL115021'),
	(5004, 1, 'Khi sử dụng Kích Tâm Thuật, gia tăng tỷ lệ hồi \nsinh Pet và miễn giảm sát thương.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100154, 1, 'Kích Tâm Thuật', 4, 5, 0, 'SKILL115091'),
	(5005, 2, 'Khi sử dụng Phá Giáp Kích, tăng tạm thời Bạo kích và Xuyên phòng ngự.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100165, 1, 'Phá Giáp Kích', 5, 5, 0, 'SKILL115061'),
	(5006, 2, 'Khi sử dụng Tấn Tiệp Thủ Hộ, sẽ gia tăng công kích, \nmiễn giảm sát thương, Tốc độ và Bạo kích.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000019, 1, 'Tấn Tiệp Thủ Hộ', 6, 5, 0, 'SKILL467201'),
	(6001, 1, 'Khi sử dụng Bài Sơn Đảo Hải, tăng tạm \nthời Chính xác và Xuyên phòng ngự.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000051, 1, 'Bài Sơn Đảo Hải', 1, 6, 0, 'SKILL116001'),
	(6002, 1, 'Khi sử dụng Hoành Tảo Thiên Quân sẽ không tạm tăng tốc độ, \ngia tăng số lượng mục tiêu, điều chỉnh sát thương của kỹ năng.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000053, 1, 'Hoành Tảo Thiên Quân', 2, 6, 0, 'SKILL116021'),
	(6003, 2, 'Khi sử dụng Ám Hồn, tăng tạm thời tốc độ, sau khi kết thúc \nchiêu khả năng miễn giảm sát thương bản thân giảm xuống.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000054, 1, 'Ám Hồn', 3, 6, 0, 'SKILL116031'),
	(6004, 1, 'Khi sử dụng Huyết Mê Cuồng Sát, tăng \ntạm thời Chính xác và Xuyên phòng ngự.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000055, 1, 'Huyết Mê Cuồng Sát', 4, 6, 0, 'SKILL116041'),
	(6005, 2, 'Khi sử dụng Táng Thần, tăng tạm thời Chính xác và \nXuyên phòng ngự, gia tăng sát thương của kỹ năng \n(dựa vào tỷ lệ tổn thất HP của bản thân để so sánh).\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000060, 1, 'Táng Thần', 5, 6, 0, 'SKILL116091'),
	(6006, 2, 'Khi sử dụng Nộ Lôi Chiến, gia tăng Bạo kích.\n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200000042, 1, 'Nộ Lôi Chiến', 6, 6, 0, 'SKILL467301'),
	(4001, 2, 'Khi sử dụng Phi Vũ kích hoạt chuỗi nguyên tố, tăng tạm thời \nBạo kích, nhận ngẫu nhiên 1 thuộc tính (Công ma pháp, \nXuyên phòng ngự, Sát thương ma pháp cuối, kháng Bạo kích, \nkháng Xuyên phòng ngự, miễn giảm sát thương) \n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100157, 1, 'Phi Vũ', 1, 4, 0, 'SKILL114001'),
	(4002, 2, 'Khi sử dụng Băng Trùy hoặc Cuồng Phong Đạn kích hoạt chuỗi \nnguyên tố, tăng tạm thời Bạo kích, nhận ngẫu nhiên 1 thuộc tính (\nCông ma pháp, Xuyên phòng ngự, tăng Sát thương ma pháp cuối, \nKháng bạo kích, kháng Xuyên phòng ngự, miễn giảm sát thương) \n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100150, 1, 'Thuộc Tính Thủy Phong I', 2, 4, 0, 'SKILL114011|SKILL114041'),
	(4003, 2, 'Khi sử dụng Viêm Bạo hoặc Vẫn Thạch, tăng tạm thời \nBạo kích, nhận ngẫu nhiên 1 thuộc tính( \nCông ma pháp, \nXuyên phòng ngự, tăng Sát thương ma pháp cuối, Kháng bạo \nkích, kháng Xuyên phòng ngự, miễn giảm sát thương) \n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100169, 1, 'Thuộc Tính Hỏa Thổ I', 3, 4, 0, 'SKILL114031|SKILL114021'),
	(4004, 1, 'Khi sử dụng Hải Vương Hống hoặc Vân Phong Biến Chuyển \nkích hoạt chuỗi nguyên tố , tăng tạm thời Bạo kích, nhận ngẫu \nnhiên 1 thuộc tính (Công ma pháp, Xuyên phòng ngự, tăng Sát \nthương ma pháp cuối, Kháng bạo kích, kháng Xuyên phòng ngự, \nmiễn giảm sát thương) \n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100160, 1, 'Thuộc Tính Thủy Phong II', 4, 4, 0, 'SKILL114081|SKILL114071'),
	(4005, 1, 'Khi sử dụng Nộ Hỏa Xung Thiên hoặc Đại Địa Chi Nộ kích \nhoạt chuỗi nguyên tố, tăng tạm thời Bạo kích, nhận ngẫu \nnhiên 1 thuộc tính ( Công ma pháp, Xuyên phòng ngự, tăng \nSát thương ma pháp cuối, Kháng bạo kích, kháng Xuyên phòng \nngự, miễn giảm sát thương) \n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100165, 1, 'Thuộc Tính Hỏa Thổ II', 5, 4, 0, 'SKILL114061|SKILL114051'),
	(4006, 1, 'Khi sử dụng Tinh Hà Chấn Động kích hoạt chuỗi nguyên tố, \ntăng tạm thời Bạo kích, nhận ngẫu nhiên 1 thuộc tính \n(Công ma pháp, Xuyên phòng ngự, tăng Sát thương ma pháp \ncuối, Kháng bạo kích, kháng Xuyên phòng ngự, miễn giảm sát thương) \n<font color=''#00FF00''>Chú ý: hiệu quả thực tế dựa trên cấp độ kỹ năng</font>', 4140200100167, 1, 'Tinh Hà Chấn Động', 6, 4, 0, 'SKILL114091');


--
-- PostgreSQL database dump complete
--

-- \unrestrict VzSpgSnCEjhYrIX2ym2ouuVLVOAe12XNzc6VZhgaMAGUKkdq2BAlgwzc3PnurAO


SET session_replication_role = origin;
