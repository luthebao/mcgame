SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict zADozBlyKq5TyfVbSthBjEbSCifz3GAajpzZLY1KC9e38bYLenRfG2zZvq2cLmU

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
-- Data for Name: data_tbl_mount_dress; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_mount_dress" ("id", "debuff_basic", "debuff_per", "description", "effective_time", "gold", "icon_code", "life_basic", "life_per", "mag_attack_basic", "mag_attack_per", "mag_defense_basic", "mag_defense_per", "name", "phy_attack_basic", "phy_attack_per", "phy_defense_basic", "phy_defense_per", "res_code", "type") VALUES
	(1, 0.00, 0, NULL, 0, 0, 4130220001000, 0, 0, 0, 0, 0, 0, 'Bạch Hổ', 0, 0, 0, 0, 2050080010005, 1),
	(2, 0.00, 0, NULL, 0, 0, 4130220001001, 0, 0, 0, 0, 0, 0, 'U Linh Hổ', 0, 0, 0, 0, 2050080010004, 1),
	(3, 0.00, 0, NULL, 0, 0, 4130220001002, 0, 0, 0, 0, 0, 0, 'Hổ Vàng Răng Kiếm', 0, 0, 0, 0, 2050080010006, 1),
	(6, 0.31, 0, NULL, 720, 268, 4130220001003, 1553, 0, 311, 0, 1242, 0, 'Bông Gòn', 388, 0, 1242, 0, 2050080010007, 1),
	(7, 0.00, 8, NULL, 720, 288, 4130220001004, 0, 8, 0, 8, 0, 8, 'Viêm Lang', 0, 8, 0, 8, 2050080010008, 1),
	(8, 0.00, 0, NULL, 720, 288, 4130220001005, 0, 0, 0, 0, 0, 0, 'Cửu Vĩ Hồ', 0, 0, 0, 0, 2050080010009, 1),
	(9, 0.00, 8, NULL, 720, 388, 4130220001006, 0, 8, 0, 8, 0, 8, 'Hồng Liên Bôn Lôi', 0, 8, 0, 8, 2050080010010, 1),
	(10, 0.00, 0, NULL, 720, 388, 4130220001007, 1553, 0, 311, 0, 1242, 0, 'Hàn Sương Thiểm Điện', 388, 0, 1242, 0, 2050080010011, 1),
	(11, 0.00, 8, NULL, 720, 388, 4130220001008, 0, 8, 0, 8, 0, 8, 'Viễn Cổ Chiến Hùng', 0, 8, 0, 8, 2050080010012, 1),
	(14, 0.00, 0, NULL, 0, 0, 4130220001011, 0, 0, 0, 0, 0, 0, 'Hấp Huyết Nha', 0, 0, 0, 0, 2050080010015, 1),
	(12, 0.00, 0, NULL, 0, 0, 4130220001009, 0, 0, 0, 0, 0, 0, 'Hàn Băng Nha', 0, 0, 0, 0, 2050080010013, 1),
	(13, 0.00, 0, NULL, 0, 0, 4130220001010, 0, 0, 0, 0, 0, 0, 'Thương Lam Nha', 0, 0, 0, 0, 2050080010014, 1),
	(15, 0.00, 0, NULL, 0, 0, 4130220001012, 0, 0, 0, 0, 0, 0, 'Cơ Giáp Ma Long', 0, 0, 0, 0, 2050080010016, 1),
	(16, 0.00, 0, NULL, 0, 0, 4130220001013, 0, 0, 0, 0, 0, 0, 'Tê Giác Thiết Giáp', 0, 0, 0, 0, 2050080010017, 1),
	(17, 0.00, 0, NULL, 0, 0, 4130220001014, 0, 0, 0, 0, 0, 0, 'Chiến Hoàng Bá Thiên Hổ', 0, 0, 0, 0, 2050080010018, 1),
	(18, 0.00, 0, NULL, 0, 0, 4130220001015, 0, 0, 0, 0, 0, 0, 'Kim Khải Chiến Tượng', 0, 0, 0, 0, 2050080010019, 1),
	(19, 0.00, 0, NULL, 0, 388, 4130220001016, 0, 0, 0, 0, 0, 0, 'Niên Thú', 0, 0, 0, 0, 2050080010020, 1),
	(20, 0.00, 0, NULL, 720, 588, 4130220001999, 0, 0, 0, 0, 0, 0, 'Burin', 0, 0, 0, 0, 2050080010021, 1);


--
-- PostgreSQL database dump complete
--

-- \unrestrict zADozBlyKq5TyfVbSthBjEbSCifz3GAajpzZLY1KC9e38bYLenRfG2zZvq2cLmU


SET session_replication_role = origin;
