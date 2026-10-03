SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict 4RLeEg8UImfYpz0bAimLXbxDkKv1aYUbceaT17MAJEFSiVrPP8q8bI3dzJ0kzQ7

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
-- Data for Name: data_tbl_creatureh_contain; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_creatureh_contain" ("id", "exp", "gold_num", "line", "name", "num") VALUES
	(11, 15400, 2400, '3|5|6|8|9|12', 'Hoang Nguyên Thời Kế', 10000),
	(12, 30800, 4800, '3|5|6|8|9|12', 'Hoang Nguyên Thời Kế', 12000),
	(13, 46200, 7200, '3|5|6|8|9|12', 'Hoang Nguyên Thời Kế', 14000),
	(14, 77000, 12000, '3|5|6|8|9|12', 'Hoang Nguyên Thời Kế', 16000),
	(15, 138600, 21600, '3|5|6|8|9|12', 'Hoang Nguyên Thời Kế', 18000),
	(16, 0, 0, '3|5|6|8|9|12', 'Hoang Nguyên Thời Kế', 20000),
	(21, 15400, 2400, '1|5|6|7|8|12', 'Hỏa Diệm Thánh Bôi', 10000),
	(22, 30800, 4800, '1|5|6|7|8|12', 'Hỏa Diệm Thánh Bôi', 12000),
	(23, 46200, 7200, '1|5|6|7|8|12', 'Hỏa Diệm Thánh Bôi', 14000),
	(24, 77000, 12000, '1|5|6|7|8|12', 'Hỏa Diệm Thánh Bôi', 16000),
	(25, 138600, 21600, '1|5|6|7|8|12', 'Hỏa Diệm Thánh Bôi', 18000),
	(26, 0, 0, '1|5|6|7|8|12', 'Hỏa Diệm Thánh Bôi', 20000),
	(31, 15400, 2400, '1|2|6|8|9|12', 'Vương Miện Pha Lê', 10000),
	(32, 30800, 4800, '1|2|6|8|9|12', 'Vương Miện Pha Lê', 12000),
	(33, 46200, 7200, '1|2|6|8|9|12', 'Vương Miện Pha Lê', 14000),
	(34, 77000, 12000, '1|2|6|8|9|12', 'Vương Miện Pha Lê', 16000),
	(35, 138600, 21600, '1|2|6|8|9|12', 'Vương Miện Pha Lê', 18000),
	(36, 0, 0, '1|2|6|8|9|12', 'Vương Miện Pha Lê', 20000),
	(41, 15400, 2400, '1|2|6|7|8|10', 'Tử Điện Bảo Thạch', 10000),
	(42, 30800, 4800, '1|2|6|7|8|10', 'Tử Điện Bảo Thạch', 12000),
	(43, 46200, 7200, '1|2|6|7|8|10', 'Tử Điện Bảo Thạch', 14000),
	(44, 77000, 12000, '1|2|6|7|8|10', 'Tử Điện Bảo Thạch', 16000),
	(45, 138600, 21600, '1|2|6|7|8|10', 'Tử Điện Bảo Thạch', 18000),
	(46, 0, 0, '1|2|6|7|8|10', 'Tử Điện Bảo Thạch', 20000),
	(51, 15400, 2400, '2|3|6|7|11|12', 'Quang Huy Chi Hoàn', 10000),
	(52, 30800, 4800, '2|3|6|7|11|12', 'Quang Huy Chi Hoàn', 12000),
	(53, 46200, 7200, '2|3|6|7|11|12', 'Quang Huy Chi Hoàn', 14000),
	(54, 77000, 12000, '2|3|6|7|11|12', 'Quang Huy Chi Hoàn', 16000),
	(55, 138600, 21600, '2|3|6|7|11|12', 'Quang Huy Chi Hoàn', 18000),
	(56, 0, 0, '2|3|6|7|11|12', 'Quang Huy Chi Hoàn', 20000);


--
-- PostgreSQL database dump complete
--

-- \unrestrict 4RLeEg8UImfYpz0bAimLXbxDkKv1aYUbceaT17MAJEFSiVrPP8q8bI3dzJ0kzQ7


SET session_replication_role = origin;
