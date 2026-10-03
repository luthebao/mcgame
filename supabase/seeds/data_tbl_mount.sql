SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict LTTh00LjPNJPynRpTxbMbS3nm10vNIUgFgwO5rzkAJVaDGS5sClT4jlsMr9fG1B

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
-- Data for Name: data_tbl_mount; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_mount" ("id", "add_rate", "debuff_basic", "debuff_per", "dress_id", "exp", "item_num", "level", "life_basic", "life_per", "mag_attack_basic", "mag_attack_per", "mag_defense_basic", "mag_defense_per", "mount_lev_limit", "phy_attack_basic", "phy_attack_per", "phy_defense_basic", "phy_defense_per", "type") VALUES
	(29, 4, 0.00, 20, 14, 30, 5, 8, 0, 40, 0, 40, 0, 40, 37, 0, 40, 0, 40, 2),
	(28, 2, 0.00, 20, 13, 30, 12, 7, 0, 32, 0, 32, 0, 32, 33, 0, 32, 0, 32, 2),
	(27, 3, 0.00, 20, 12, 30, 8, 6, 0, 28, 0, 28, 0, 28, 29, 0, 28, 0, 28, 2),
	(26, 3, 0.00, 20, 12, 40, 5, 5, 0, 24, 0, 24, 0, 24, 25, 0, 24, 0, 24, 2),
	(25, 4, 0.00, 20, 3, 50, 12, 4, 0, 20, 0, 20, 0, 20, 21, 0, 20, 0, 20, 2),
	(24, 2, 0.00, 12, 2, 30, 12, 3, 0, 12, 0, 12, 0, 12, 17, 0, 12, 0, 12, 2),
	(23, 2, 0.00, 6, 2, 30, 8, 2, 0, 6, 0, 6, 0, 6, 13, 0, 6, 0, 6, 2),
	(22, 3, 0.00, 2, 1, 40, 5, 1, 0, 2, 0, 2, 0, 2, 9, 0, 2, 0, 2, 2),
	(21, 4, 0.00, 0, 1, 50, 2, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 2),
	(20, NULL, 9.99, 0, 0, 90000, NULL, 19, 57547, 0, 11509, 0, 46037, 0, 0, 14387, 0, 46037, 0, 1),
	(19, NULL, 9.99, 0, 0, 74540, NULL, 18, 50089, 0, 10018, 0, 40071, 0, 0, 12522, 0, 40071, 0, 1),
	(18, NULL, 8.53, 0, 0, 61340, NULL, 17, 42631, 0, 8526, 0, 34104, 0, 0, 10658, 0, 34104, 0, 1),
	(17, NULL, 7.22, 0, 0, 50015, NULL, 16, 36086, 0, 7217, 0, 28869, 0, 0, 9021, 0, 28869, 0, 1),
	(16, NULL, 6.07, 0, 0, 40360, NULL, 15, 30357, 0, 6071, 0, 24285, 0, 0, 7589, 0, 24285, 0, 1),
	(15, NULL, 5.07, 0, 0, 32225, NULL, 14, 25362, 0, 5072, 0, 20289, 0, 0, 6340, 0, 20289, 0, 1),
	(14, NULL, 4.20, 0, 0, 25420, NULL, 13, 21008, 0, 4202, 0, 16806, 0, 0, 5252, 0, 16806, 0, 1),
	(13, NULL, 3.44, 0, 0, 19800, NULL, 12, 17209, 0, 3442, 0, 13767, 0, 0, 4302, 0, 13767, 0, 1),
	(12, NULL, 2.78, 0, 0, 15210, NULL, 11, 13893, 0, 2779, 0, 11115, 0, 0, 3473, 0, 11115, 0, 1),
	(11, NULL, 2.21, 0, 0, 11505, NULL, 10, 11026, 0, 2205, 0, 8820, 0, 0, 2756, 0, 8820, 0, 1),
	(10, NULL, 1.72, 0, 0, 8560, NULL, 9, 8594, 0, 1719, 0, 6875, 0, 0, 2149, 0, 6875, 0, 1),
	(9, NULL, 1.32, 0, 0, 6260, NULL, 8, 6577, 0, 1315, 0, 5261, 0, 0, 1644, 0, 5261, 0, 1),
	(8, NULL, 0.99, 0, 0, 4485, NULL, 7, 4928, 0, 986, 0, 3943, 0, 0, 1232, 0, 3943, 0, 1),
	(7, NULL, 0.72, 0, 0, 3145, NULL, 6, 3614, 0, 723, 0, 2892, 0, 0, 904, 0, 2892, 0, 1),
	(6, NULL, 0.52, 0, 0, 2150, NULL, 5, 2588, 0, 518, 0, 2070, 0, 0, 647, 0, 2070, 0, 1),
	(5, NULL, 0.36, 0, 0, 1420, NULL, 4, 1797, 0, 359, 0, 1437, 0, 0, 449, 0, 1437, 0, 1),
	(4, NULL, 0.24, 0, 0, 895, NULL, 3, 1201, 0, 240, 0, 961, 0, 0, 300, 0, 961, 0, 1),
	(3, NULL, 0.15, 0, 0, 525, NULL, 2, 743, 0, 149, 0, 594, 0, 0, 186, 0, 594, 0, 1),
	(2, NULL, 0.08, 0, 0, 270, NULL, 1, 400, 0, 80, 0, 320, 0, 0, 100, 0, 320, 0, 1),
	(1, NULL, 0.03, 0, 0, 100, NULL, 0, 155, 0, 31, 0, 124, 0, 0, 39, 0, 124, 0, 1),
	(30, 3, 0.00, 20, 16, 20, 8, 9, 0, 52, 0, 52, 0, 52, 40, 0, 52, 0, 52, 2),
	(31, 2, 0.00, 20, 18, 20, 12, 10, 0, 74, 0, 74, 0, 74, 40, 0, 74, 0, 74, 2),
	(32, 2, 0.00, 20, 15, 20, 16, 11, 0, 86, 0, 86, 0, 86, 40, 0, 86, 0, 86, 2),
	(33, 1, 0.00, 20, 17, 20, 24, 12, 0, 100, 0, 100, 0, 100, 40, 0, 100, 0, 100, 2);


--
-- PostgreSQL database dump complete
--

-- \unrestrict LTTh00LjPNJPynRpTxbMbS3nm10vNIUgFgwO5rzkAJVaDGS5sClT4jlsMr9fG1B


SET session_replication_role = origin;
