SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict SFuXHeKEPBiD3hkfTRHgXeckMRQTBqUyqW8X73FGhLrFiEKOmpWNSxOI6wn5yC0

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
-- Data for Name: data_tbl_rune_chip; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_rune_chip" ("id", "icon_code", "kind", "name", "num", "rid") VALUES
	(1, 4030200200352, 1, 'Mảnh Vỡ Phù Văn Sinh', 10, 21),
	(2, 4030200200353, 1, 'Mảnh Vỡ Phù Văn Công', 10, 61),
	(3, 4030200200354, 1, 'Mảnh Vỡ Phù Văn Công', 10, 101),
	(4, 4030200200355, 1, 'Mảnh Vỡ Phù Văn Phòn', 10, 141),
	(5, 4030200200356, 1, 'Mảnh Vỡ Phù Văn Phòn', 10, 181),
	(6, 4030200200357, 1, 'Mảnh Vỡ Phù Văn Tốc ', 10, 221),
	(7, 4030200200358, 1, 'Mảnh Vỡ Phù Văn Chín', 10, 261),
	(8, 4030200200359, 1, 'Mảnh Vỡ Phù Văn Né T', 10, 301),
	(9, 4030200200360, 1, 'Mảnh Vỡ Phù Văn Bạo ', 10, 341),
	(10, 4030200200361, 1, 'Mảnh Vỡ Phù Văn Khán', 10, 381),
	(11, 4030200200362, 1, 'Mảnh Vỡ Phù Văn Xuyê', 10, 421),
	(12, 4030200200363, 1, 'Mảnh Vỡ Phù Văn Khán', 10, 461),
	(13, 4030200200364, 1, 'Mảnh Vỡ Phù Văn Debu', 10, 501),
	(14, 4030200200365, 1, 'Mảnh Vỡ Phù Văn Khán', 10, 541),
	(15, 4030200200366, 1, 'Mảnh Vỡ Phù Văn Tăng', 10, 581),
	(16, 4030200200367, 1, 'Mảnh Vỡ Phù Văn Giảm', 10, 621),
	(17, 4030200200368, 1, 'Mảnh Vỡ Phù Văn Tăng', 10, 661),
	(18, 4030200200369, 1, 'Mảnh Vỡ Phù Văn Giảm', 10, 701),
	(19, 4030200200370, 1, 'Mảnh Vỡ Phù Văn Miễn', 10, 741),
	(20, 4030200200552, 2, 'Mảnh Vỡ Phù Văn Sinh', 10, 781),
	(21, 4030200200553, 2, 'Mảnh Vỡ Phù Văn Công', 10, 821),
	(22, 4030200200554, 2, 'Mảnh Vỡ Phù Văn Công', 10, 861),
	(23, 4030200200555, 2, 'Mảnh Vỡ Phù Văn Phòn', 10, 901),
	(24, 4030200200556, 2, 'Mảnh Vỡ Phù Văn Phòn', 10, 941),
	(25, 4030200200557, 2, 'Mảnh Vỡ Phù Văn Tốc ', 10, 981),
	(26, 4030200200558, 2, 'Mảnh Vỡ Phù Văn Chín', 10, 1021),
	(27, 4030200200559, 2, 'Mảnh Vỡ Phù Văn Né T', 10, 1061),
	(28, 4030200200560, 2, 'Mảnh Vỡ Phù Văn Bạo ', 10, 1101),
	(29, 4030200200561, 2, 'Mảnh Vỡ Phù Văn Khán', 10, 1141),
	(30, 4030200200562, 2, 'Mảnh Vỡ Phù Văn Xuyê', 10, 1181),
	(31, 4030200200563, 2, 'Mảnh Vỡ Phù Văn Khán', 10, 1221),
	(32, 4030200200564, 2, 'Mảnh Vỡ Phù Văn Debu', 10, 1261),
	(33, 4030200200565, 2, 'Mảnh Vỡ Phù Văn Khán', 10, 1301),
	(34, 4030200200566, 2, 'Mảnh Vỡ Phù Văn Tăng', 10, 1341),
	(35, 4030200200567, 2, 'Mảnh Vỡ Phù Văn Giảm', 10, 1381),
	(36, 4030200200568, 2, 'Mảnh Vỡ Phù Văn Tăng', 10, 1421),
	(37, 4030200200569, 2, 'Mảnh Vỡ Phù Văn Giảm', 10, 1461),
	(38, 4030200200570, 2, 'Mảnh Vỡ Phù Văn Miễn', 10, 1501),
	(39, 4030200200372, 1, 'Mảnh Vỡ Phù Văn Sinh', 10, 31),
	(40, 4030200200373, 1, 'Mảnh Vỡ Phù Văn Công', 10, 71),
	(41, 4030200200374, 1, 'Mảnh Vỡ Phù Văn Công', 10, 111),
	(42, 4030200200375, 1, 'Mảnh Vỡ Phù Văn Phòn', 10, 151),
	(43, 4030200200376, 1, 'Mảnh Vỡ Phù Văn Phòn', 10, 191),
	(44, 4030200200377, 1, 'Mảnh Vỡ Phù Văn Tốc ', 10, 231),
	(45, 4030200200378, 1, 'Mảnh Vỡ Phù Văn Chín', 10, 271),
	(46, 4030200200379, 1, 'Mảnh Vỡ Phù Văn Né T', 10, 311),
	(47, 4030200200380, 1, 'Mảnh Vỡ Phù Văn Bạo ', 10, 351),
	(48, 4030200200381, 1, 'Mảnh Vỡ Phù Văn Khán', 10, 391),
	(49, 4030200200382, 1, 'Mảnh Vỡ Phù Văn Xuyê', 10, 431),
	(50, 4030200200383, 1, 'Mảnh Vỡ Phù Văn Khán', 10, 471),
	(51, 4030200200384, 1, 'Mảnh Vỡ Phù Văn Debu', 10, 511),
	(52, 4030200200385, 1, 'Mảnh Vỡ Phù Văn Khán', 10, 551),
	(53, 4030200200386, 1, 'Mảnh Vỡ Phù Văn Tăng', 10, 591),
	(54, 4030200200387, 1, 'Mảnh Vỡ Phù Văn Giảm', 10, 631),
	(55, 4030200200388, 1, 'Mảnh Vỡ Phù Văn Tăng', 10, 671),
	(56, 4030200200389, 1, 'Mảnh Vỡ Phù Văn Giảm', 10, 711),
	(57, 4030200200390, 1, 'Mảnh Vỡ Phù Văn Miễn', 10, 751),
	(58, 4030200200572, 2, 'Mảnh Vỡ Phù Văn Sinh', 10, 791),
	(59, 4030200200573, 2, 'Mảnh Vỡ Phù Văn Công', 10, 831),
	(60, 4030200200574, 2, 'Mảnh Vỡ Phù Văn Công', 10, 871),
	(61, 4030200200575, 2, 'Mảnh Vỡ Phù Văn Phòn', 10, 911),
	(62, 4030200200576, 2, 'Mảnh Vỡ Phù Văn Phòn', 10, 951),
	(63, 4030200200577, 2, 'Mảnh Vỡ Phù Văn Tốc ', 10, 991),
	(64, 4030200200578, 2, 'Mảnh Vỡ Phù Văn Chín', 10, 1031),
	(65, 4030200200579, 2, 'Mảnh Vỡ Phù Văn Né T', 10, 1071),
	(66, 4030200200580, 2, 'Mảnh Vỡ Phù Văn Bạo ', 10, 1111),
	(67, 4030200200581, 2, 'Mảnh Vỡ Phù Văn Khán', 10, 1151),
	(68, 4030200200582, 2, 'Mảnh Vỡ Phù Văn Xuyê', 10, 1191),
	(69, 4030200200583, 2, 'Mảnh Vỡ Phù Văn Khán', 10, 1231),
	(70, 4030200200584, 2, 'Mảnh Vỡ Phù Văn Debu', 10, 1271),
	(71, 4030200200585, 2, 'Mảnh Vỡ Phù Văn Khán', 10, 1311),
	(72, 4030200200586, 2, 'Mảnh Vỡ Phù Văn Tăng', 10, 1351),
	(73, 4030200200587, 2, 'Mảnh Vỡ Phù Văn Giảm', 10, 1391),
	(74, 4030200200588, 2, 'Mảnh Vỡ Phù Văn Tăng', 10, 1431),
	(75, 4030200200589, 2, 'Mảnh Vỡ Phù Văn Giảm', 10, 1471),
	(76, 4030200200590, 2, 'Mảnh Vỡ Phù Văn Miễn', 10, 1511);


--
-- PostgreSQL database dump complete
--

-- \unrestrict SFuXHeKEPBiD3hkfTRHgXeckMRQTBqUyqW8X73FGhLrFiEKOmpWNSxOI6wn5yC0


SET session_replication_role = origin;
