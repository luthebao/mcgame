SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict nHMnc24gRuCh28PyFW6AZAdwR9fAJ7xgXYaH03BGqeWpVeGb5qcdYldfIIaFCom

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
-- Data for Name: data_tbl_stars_template; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_stars_template" ("id", "add_prop", "add_value", "description", "level", "name", "req_exp", "req_level", "req_money", "req_seconds", "req_star_level", "res_code", "type") VALUES
	(1, 'hp', 1000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 1, 'Cung Bạch Dương', 0, 80, 300, 30, 0, 4130090100007, 1),
	(2, 'hp', 2000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 2, 'Cung Bạch Dương', 0, 85, 37200, 3720, 6, 4130090100007, 1),
	(3, 'hp', 3000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 3, 'Cung Bạch Dương', 0, 90, 182400, 18240, 12, 4130090100007, 1),
	(4, 'hp', 4000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 4, 'Cung Bạch Dương', 0, 95, 471600, 47160, 18, 4130090100007, 1),
	(5, 'hp', 5000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 5, 'Cung Bạch Dương', 0, 100, 904800, 90480, 24, 4130090100007, 1),
	(6, 'hp', 6000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 6, 'Cung Bạch Dương', 0, 105, 1482000, 148200, 30, 4130090100007, 1),
	(7, 'hp', 7000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 7, 'Cung Bạch Dương', 0, 110, 2203200, 220320, 36, 4130090100007, 1),
	(8, 'hp', 8000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 8, 'Cung Bạch Dương', 0, 115, 3068400, 306840, 42, 4130090100007, 1),
	(9, 'hp', 9000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 9, 'Cung Bạch Dương', 0, 120, 4077600, 407760, 48, 4130090100007, 1),
	(10, 'hp', 10000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 10, 'Cung Bạch Dương', 0, 125, 5230800, 523080, 54, 4130090100007, 1),
	(11, 'hp', 11000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 11, 'Cung Bạch Dương', 0, 130, 6528000, 652800, 60, 4130090100007, 1),
	(12, 'hp', 12000.00, 'Cung Bạch Dương năng lực dồi dào. Khi tu luyện Cung Bạch Dương sẽ làm tăng Giới hạn HP', 12, 'Cung Bạch Dương', 0, 135, 7969200, 796920, 66, 4130090100007, 1),
	(13, 'attack', 250.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 1, 'Cung Kim Ngưu', 0, 80, 4500, 450, 2, 4130090100008, 2),
	(14, 'attack', 500.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 2, 'Cung Kim Ngưu', 0, 85, 54000, 5400, 8, 4130090100008, 2),
	(15, 'attack', 750.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 3, 'Cung Kim Ngưu', 0, 90, 216000, 21600, 14, 4130090100008, 2),
	(16, 'attack', 1000.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 4, 'Cung Kim Ngưu', 0, 95, 522000, 52200, 20, 4130090100008, 2),
	(17, 'attack', 1250.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 5, 'Cung Kim Ngưu', 0, 100, 972000, 97200, 26, 4130090100008, 2),
	(18, 'attack', 1500.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 6, 'Cung Kim Ngưu', 0, 105, 1566000, 156600, 32, 4130090100008, 2),
	(19, 'attack', 1750.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 7, 'Cung Kim Ngưu', 0, 110, 2304000, 230400, 38, 4130090100008, 2),
	(20, 'attack', 2000.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 8, 'Cung Kim Ngưu', 0, 115, 3186000, 318600, 44, 4130090100008, 2),
	(21, 'attack', 2250.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 9, 'Cung Kim Ngưu', 0, 120, 4212000, 421200, 50, 4130090100008, 2),
	(22, 'attack', 2500.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 10, 'Cung Kim Ngưu', 0, 125, 5382000, 538200, 56, 4130090100008, 2),
	(23, 'attack', 2750.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 11, 'Cung Kim Ngưu', 0, 130, 6696000, 669600, 62, 4130090100008, 2),
	(24, 'attack', 3000.00, 'Cung Kim Ngưu, tính tình cố chấp, giận dữ bất thường. Khi tu luyện Cung Kim Ngưu sẽ tăng lực Tấn công vật lý', 12, 'Cung Kim Ngưu', 0, 135, 8154000, 815400, 68, 4130090100008, 2),
	(25, 'dodge', 0.40, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 1, 'Cung Song Tử', 0, 80, 18000, 1800, 4, 4130090100009, 3),
	(26, 'dodge', 0.80, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 2, 'Cung Song Tử', 0, 85, 108000, 10800, 10, 4130090100009, 3),
	(27, 'dodge', 1.20, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 3, 'Cung Song Tử', 0, 90, 324000, 32400, 16, 4130090100009, 3),
	(28, 'dodge', 1.60, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 4, 'Cung Song Tử', 0, 95, 684000, 68400, 22, 4130090100009, 3),
	(29, 'dodge', 2.00, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 5, 'Cung Song Tử', 0, 100, 1188000, 118800, 28, 4130090100009, 3),
	(30, 'dodge', 2.40, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 6, 'Cung Song Tử', 0, 105, 1836000, 183600, 34, 4130090100009, 3),
	(31, 'dodge', 2.80, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 7, 'Cung Song Tử', 0, 110, 2628000, 262800, 40, 4130090100009, 3),
	(32, 'dodge', 3.20, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 8, 'Cung Song Tử', 0, 115, 3564000, 356400, 46, 4130090100009, 3),
	(33, 'dodge', 3.60, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 9, 'Cung Song Tử', 0, 120, 4644000, 464400, 52, 4130090100009, 3),
	(34, 'dodge', 4.00, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 10, 'Cung Song Tử', 0, 125, 5868000, 586800, 58, 4130090100009, 3),
	(35, 'dodge', 4.40, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 11, 'Cung Song Tử', 0, 130, 7236000, 723600, 64, 4130090100009, 3),
	(36, 'dodge', 4.80, 'Cung Song Tử, tính khí thời tiết, khó đoán. Khi tu luyện Cung Song Tử sẽ tăng Né Tránh ', 12, 'Cung Song Tử', 0, 135, 8748000, 874800, 70, 4130090100009, 3),
	(37, 'defence', 800.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 1, 'Cung Cự Giải', 0, 80, 1200, 120, 1, 4130090100010, 4),
	(38, 'defence', 1600.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 2, 'Cung Cự Giải', 0, 85, 40800, 4080, 7, 4130090100010, 4),
	(39, 'defence', 2400.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 3, 'Cung Cự Giải', 0, 90, 189600, 18960, 13, 4130090100010, 4),
	(40, 'defence', 3200.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 4, 'Cung Cự Giải', 0, 95, 482400, 48240, 19, 4130090100010, 4),
	(41, 'defence', 4000.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 5, 'Cung Cự Giải', 0, 100, 919200, 91920, 25, 4130090100010, 4),
	(42, 'defence', 4800.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 6, 'Cung Cự Giải', 0, 105, 1500000, 150000, 31, 4130090100010, 4),
	(43, 'defence', 5600.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 7, 'Cung Cự Giải', 0, 110, 2224800, 222480, 37, 4130090100010, 4),
	(44, 'defence', 6400.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 8, 'Cung Cự Giải', 0, 115, 3093600, 309360, 43, 4130090100010, 4),
	(45, 'defence', 7200.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 9, 'Cung Cự Giải', 0, 120, 4106400, 410640, 49, 4130090100010, 4),
	(46, 'defence', 8000.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 10, 'Cung Cự Giải', 0, 125, 5263200, 526320, 55, 4130090100010, 4),
	(47, 'defence', 8800.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 11, 'Cung Cự Giải', 0, 130, 6564000, 656400, 61, 4130090100010, 4),
	(48, 'defence', 9600.00, 'Cung Cự Giải, thể chất kiện tráng. Khi tu luyện Cung Cự Giải sẽ tăng Phòng Ngự Vật Lý', 12, 'Cung Cự Giải', 0, 135, 8008800, 800880, 67, 4130090100010, 4),
	(49, 'critical', 0.20, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 1, 'Cung Sư Tử', 0, 80, 36000, 3600, 5, 4130090100011, 5),
	(50, 'critical', 0.40, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 2, 'Cung Sư Tử', 0, 85, 180000, 18000, 11, 4130090100011, 5),
	(51, 'critical', 0.60, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 3, 'Cung Sư Tử', 0, 90, 468000, 46800, 17, 4130090100011, 5),
	(52, 'critical', 0.80, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 4, 'Cung Sư Tử', 0, 95, 900000, 90000, 23, 4130090100011, 5),
	(53, 'critical', 1.00, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 5, 'Cung Sư Tử', 0, 100, 1476000, 147600, 29, 4130090100011, 5),
	(54, 'critical', 1.20, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 6, 'Cung Sư Tử', 0, 105, 2196000, 219600, 35, 4130090100011, 5),
	(55, 'critical', 1.40, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 7, 'Cung Sư Tử', 0, 110, 3060000, 306000, 41, 4130090100011, 5),
	(56, 'critical', 1.60, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 8, 'Cung Sư Tử', 0, 115, 4068000, 406800, 47, 4130090100011, 5),
	(57, 'critical', 1.80, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 9, 'Cung Sư Tử', 0, 120, 5220000, 522000, 53, 4130090100011, 5),
	(58, 'critical', 2.00, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 10, 'Cung Sư Tử', 0, 125, 6516000, 651600, 59, 4130090100011, 5),
	(59, 'critical', 2.20, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 11, 'Cung Sư Tử', 0, 130, 7956000, 795600, 65, 4130090100011, 5),
	(60, 'critical', 2.40, 'Cung Sư Tử, mạnh mẽ, có tài lãnh đạo. Khi tu luyện Cung Sư Tử sẽ tăng Bạo Kích', 12, 'Cung Sư Tử', 0, 135, 9540000, 954000, 71, 4130090100011, 5),
	(61, 'resiCritical', 0.20, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 1, 'Cung Xử Nữ', 0, 80, 18000, 1800, 4, 4130090100012, 6),
	(62, 'resiCritical', 0.40, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 2, 'Cung Xử Nữ', 0, 85, 108000, 10800, 10, 4130090100012, 6),
	(63, 'resiCritical', 0.60, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 3, 'Cung Xử Nữ', 0, 90, 324000, 32400, 16, 4130090100012, 6),
	(64, 'resiCritical', 0.80, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 4, 'Cung Xử Nữ', 0, 95, 684000, 68400, 22, 4130090100012, 6),
	(65, 'resiCritical', 1.00, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 5, 'Cung Xử Nữ', 0, 100, 1188000, 118800, 28, 4130090100012, 6),
	(66, 'resiCritical', 1.20, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 6, 'Cung Xử Nữ', 0, 105, 1836000, 183600, 34, 4130090100012, 6),
	(67, 'resiCritical', 1.40, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 7, 'Cung Xử Nữ', 0, 110, 2628000, 262800, 40, 4130090100012, 6),
	(68, 'resiCritical', 1.60, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 8, 'Cung Xử Nữ', 0, 115, 3564000, 356400, 46, 4130090100012, 6),
	(69, 'resiCritical', 1.80, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 9, 'Cung Xử Nữ', 0, 120, 4644000, 464400, 52, 4130090100012, 6),
	(70, 'resiCritical', 2.00, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 10, 'Cung Xử Nữ', 0, 125, 5868000, 586800, 58, 4130090100012, 6),
	(71, 'resiCritical', 2.20, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 11, 'Cung Xử Nữ', 0, 130, 7236000, 723600, 64, 4130090100012, 6),
	(72, 'resiCritical', 2.40, 'Cung Xử Nữ, tinh tế dịu dàng. Khi tu luyện Cung Xử Nữ sẽ tăng Kháng Bạo Kích', 12, 'Cung Xử Nữ', 0, 135, 8748000, 874800, 70, 4130090100012, 6),
	(73, 'hit', 0.40, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 1, 'Cung Thiên Bình', 0, 80, 36000, 3600, 5, 4130090100013, 7),
	(74, 'hit', 0.80, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 2, 'Cung Thiên Bình', 0, 85, 180000, 18000, 11, 4130090100013, 7),
	(75, 'hit', 1.20, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 3, 'Cung Thiên Bình', 0, 90, 468000, 46800, 17, 4130090100013, 7),
	(76, 'hit', 1.60, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 4, 'Cung Thiên Bình', 0, 95, 900000, 90000, 23, 4130090100013, 7),
	(77, 'hit', 2.00, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 5, 'Cung Thiên Bình', 0, 100, 1476000, 147600, 29, 4130090100013, 7),
	(78, 'hit', 2.40, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 6, 'Cung Thiên Bình', 0, 105, 2196000, 219600, 35, 4130090100013, 7),
	(79, 'hit', 2.80, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 7, 'Cung Thiên Bình', 0, 110, 3060000, 306000, 41, 4130090100013, 7),
	(80, 'hit', 3.20, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 8, 'Cung Thiên Bình', 0, 115, 4068000, 406800, 47, 4130090100013, 7),
	(81, 'hit', 3.60, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 9, 'Cung Thiên Bình', 0, 120, 5220000, 522000, 53, 4130090100013, 7),
	(82, 'hit', 4.00, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 10, 'Cung Thiên Bình', 0, 125, 6516000, 651600, 59, 4130090100013, 7),
	(83, 'hit', 4.40, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 11, 'Cung Thiên Bình', 0, 130, 7956000, 795600, 65, 4130090100013, 7),
	(84, 'hit', 4.80, 'Cung Thiên Bình, tinh tế, ưu tú. Khi tu luyện Cung Thiên Bình sẽ tăng độ Chính Xác', 12, 'Cung Thiên Bình', 0, 135, 9540000, 954000, 71, 4130090100013, 7),
	(85, 'debuffSuccRate', 0.20, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 1, 'Cung Hổ Cáp', 0, 80, 36000, 3600, 5, 4130090100014, 8),
	(86, 'debuffSuccRate', 0.40, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 2, 'Cung Hổ Cáp', 0, 85, 180000, 18000, 11, 4130090100014, 8),
	(87, 'debuffSuccRate', 0.60, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 3, 'Cung Hổ Cáp', 0, 90, 468000, 46800, 17, 4130090100014, 8),
	(88, 'debuffSuccRate', 0.80, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 4, 'Cung Hổ Cáp', 0, 95, 900000, 90000, 23, 4130090100014, 8),
	(89, 'debuffSuccRate', 1.00, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 5, 'Cung Hổ Cáp', 0, 100, 1476000, 147600, 29, 4130090100014, 8),
	(90, 'debuffSuccRate', 1.20, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 6, 'Cung Hổ Cáp', 0, 105, 2196000, 219600, 35, 4130090100014, 8),
	(91, 'debuffSuccRate', 1.40, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 7, 'Cung Hổ Cáp', 0, 110, 3060000, 306000, 41, 4130090100014, 8),
	(92, 'debuffSuccRate', 1.60, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 8, 'Cung Hổ Cáp', 0, 115, 4068000, 406800, 47, 4130090100014, 8),
	(93, 'debuffSuccRate', 1.80, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 9, 'Cung Hổ Cáp', 0, 120, 5220000, 522000, 53, 4130090100014, 8),
	(94, 'debuffSuccRate', 2.00, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 10, 'Cung Hổ Cáp', 0, 125, 6516000, 651600, 59, 4130090100014, 8),
	(95, 'debuffSuccRate', 2.20, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 11, 'Cung Hổ Cáp', 0, 130, 7956000, 795600, 65, 4130090100014, 8),
	(96, 'debuffSuccRate', 2.40, 'Cung Hổ Cáp, thần bí khó đoán. Khi tu luyện Cung Hổ Cáp sẽ tăng Chính Xác debuff', 12, 'Cung Hổ Cáp', 0, 135, 9540000, 954000, 71, 4130090100014, 8),
	(97, 'mAttack', 200.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 1, 'Cung Nhân Mã', 0, 80, 4500, 450, 2, 4130090100015, 9),
	(98, 'mAttack', 400.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 2, 'Cung Nhân Mã', 0, 85, 54000, 5400, 8, 4130090100015, 9),
	(99, 'mAttack', 600.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 3, 'Cung Nhân Mã', 0, 90, 216000, 21600, 14, 4130090100015, 9),
	(100, 'mAttack', 800.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 4, 'Cung Nhân Mã', 0, 95, 522000, 52200, 20, 4130090100015, 9),
	(101, 'mAttack', 1000.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 5, 'Cung Nhân Mã', 0, 100, 972000, 97200, 26, 4130090100015, 9),
	(102, 'mAttack', 1200.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 6, 'Cung Nhân Mã', 0, 105, 1566000, 156600, 32, 4130090100015, 9),
	(103, 'mAttack', 1400.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 7, 'Cung Nhân Mã', 0, 110, 2304000, 230400, 38, 4130090100015, 9),
	(104, 'mAttack', 1600.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 8, 'Cung Nhân Mã', 0, 115, 3186000, 318600, 44, 4130090100015, 9),
	(105, 'mAttack', 1800.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 9, 'Cung Nhân Mã', 0, 120, 4212000, 421200, 50, 4130090100015, 9),
	(106, 'mAttack', 2000.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 10, 'Cung Nhân Mã', 0, 125, 5382000, 538200, 56, 4130090100015, 9),
	(107, 'mAttack', 2200.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 11, 'Cung Nhân Mã', 0, 130, 6696000, 669600, 62, 4130090100015, 9),
	(108, 'mAttack', 2400.00, 'Cung Nhân Mã, tự do tự tại, không thích ràng buộc. Khi tu luyện Cung Nhân Mã sẽ tăng Tấn Công Ma Pháp', 12, 'Cung Nhân Mã', 0, 135, 8154000, 815400, 68, 4130090100015, 9),
	(110, 'mDefence', 1600.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 2, 'Cung Ma Kết', 0, 85, 40800, 4080, 7, 4130090100016, 10),
	(109, 'mDefence', 800.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 1, 'Cung Ma Kết', 0, 80, 1200, 120, 1, 4130090100016, 10),
	(111, 'mDefence', 2400.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 3, 'Cung Ma Kết', 0, 90, 189600, 18960, 13, 4130090100016, 10),
	(112, 'mDefence', 3200.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 4, 'Cung Ma Kết', 0, 95, 482400, 48240, 19, 4130090100016, 10),
	(113, 'mDefence', 4000.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 5, 'Cung Ma Kết', 0, 100, 919200, 91920, 25, 4130090100016, 10),
	(114, 'mDefence', 4800.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 6, 'Cung Ma Kết', 0, 105, 1500000, 150000, 31, 4130090100016, 10),
	(115, 'mDefence', 5600.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 7, 'Cung Ma Kết', 0, 110, 2224800, 222480, 37, 4130090100016, 10),
	(116, 'mDefence', 6400.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 8, 'Cung Ma Kết', 0, 115, 3093600, 309360, 43, 4130090100016, 10),
	(117, 'mDefence', 7200.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 9, 'Cung Ma Kết', 0, 120, 4106400, 410640, 49, 4130090100016, 10),
	(118, 'mDefence', 8000.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 10, 'Cung Ma Kết', 0, 125, 5263200, 526320, 55, 4130090100016, 10),
	(119, 'mDefence', 8800.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 11, 'Cung Ma Kết', 0, 130, 6564000, 656400, 61, 4130090100016, 10),
	(120, 'mDefence', 9600.00, 'Cung Ma Kết, ý chí kiên định, vững vàng. Khi tu luyện cung Ma Kết sẽ tăng Phòng Ngự Ma Pháp', 12, 'Cung Ma Kết', 0, 135, 8008800, 800880, 67, 4130090100016, 10),
	(121, 'debuffResiRate', 0.20, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 1, 'Cung Bảo Bình', 0, 80, 18000, 1800, 4, 4130090100017, 11),
	(122, 'debuffResiRate', 0.40, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 2, 'Cung Bảo Bình', 0, 85, 108000, 10800, 10, 4130090100017, 11),
	(123, 'debuffResiRate', 0.60, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 3, 'Cung Bảo Bình', 0, 90, 324000, 32400, 16, 4130090100017, 11),
	(124, 'debuffResiRate', 0.80, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 4, 'Cung Bảo Bình', 0, 95, 684000, 68400, 22, 4130090100017, 11),
	(125, 'debuffResiRate', 1.00, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 5, 'Cung Bảo Bình', 0, 100, 1188000, 118800, 28, 4130090100017, 11),
	(126, 'debuffResiRate', 1.20, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 6, 'Cung Bảo Bình', 0, 105, 1836000, 183600, 34, 4130090100017, 11),
	(127, 'debuffResiRate', 1.40, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 7, 'Cung Bảo Bình', 0, 110, 2628000, 262800, 40, 4130090100017, 11),
	(128, 'debuffResiRate', 1.60, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 8, 'Cung Bảo Bình', 0, 115, 3564000, 356400, 46, 4130090100017, 11),
	(129, 'debuffResiRate', 1.80, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 9, 'Cung Bảo Bình', 0, 120, 4644000, 464400, 52, 4130090100017, 11),
	(130, 'debuffResiRate', 2.00, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 10, 'Cung Bảo Bình', 0, 125, 5868000, 586800, 58, 4130090100017, 11),
	(131, 'debuffResiRate', 2.20, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 11, 'Cung Bảo Bình', 0, 130, 7236000, 723600, 64, 4130090100017, 11),
	(132, 'debuffResiRate', 2.40, 'Cung Bảo Bình, yêu hòa bình ghét chiến tranh. Khi tu luyện cung Bảo Bình sẽ tăng Khả năng kháng trạng thái có hại', 12, 'Cung Bảo Bình', 0, 135, 8748000, 874800, 70, 4130090100017, 11),
	(133, 'speed', 100.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 1, 'Cung Song Ngư', 0, 80, 9000, 900, 3, 4130090100018, 12),
	(134, 'speed', 200.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 2, 'Cung Song Ngư', 0, 85, 72000, 7200, 9, 4130090100018, 12),
	(135, 'speed', 300.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 3, 'Cung Song Ngư', 0, 90, 252000, 25200, 15, 4130090100018, 12),
	(136, 'speed', 400.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 4, 'Cung Song Ngư', 0, 95, 576000, 57600, 21, 4130090100018, 12),
	(137, 'speed', 500.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 5, 'Cung Song Ngư', 0, 100, 1044000, 104400, 27, 4130090100018, 12),
	(138, 'speed', 600.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 6, 'Cung Song Ngư', 0, 105, 1656000, 165600, 33, 4130090100018, 12),
	(139, 'speed', 700.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 7, 'Cung Song Ngư', 0, 110, 2412000, 241200, 39, 4130090100018, 12),
	(140, 'speed', 800.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 8, 'Cung Song Ngư', 0, 115, 3312000, 331200, 45, 4130090100018, 12),
	(141, 'speed', 900.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 9, 'Cung Song Ngư', 0, 120, 4356000, 435600, 51, 4130090100018, 12),
	(142, 'speed', 1000.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 10, 'Cung Song Ngư', 0, 125, 5544000, 554400, 57, 4130090100018, 12),
	(143, 'speed', 1100.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 11, 'Cung Song Ngư', 0, 130, 6876000, 687600, 63, 4130090100018, 12),
	(144, 'speed', 1200.00, 'Cung Song Ngư, nhạy bén khôn khéo. Khi tu luyện Cung Song Ngư sẽ tăng Tốc Độ', 12, 'Cung Song Ngư', 0, 135, 8352000, 835200, 69, 4130090100018, 12);


--
-- PostgreSQL database dump complete
--

-- \unrestrict nHMnc24gRuCh28PyFW6AZAdwR9fAJ7xgXYaH03BGqeWpVeGb5qcdYldfIIaFCom


SET session_replication_role = origin;
