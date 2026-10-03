SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict xO7AtdKiGiytRjEJA3CY8sX6XNizcEgSzD5wZsTB6TYNSQA71qldmnRCpwe9XVC

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
-- Data for Name: data_tbl_deco_show; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_deco_show" ("id", "active_gold", "description", "icon_code", "link_id", "link_suit_id", "name", "per", "position", "prop_num1", "prop_num2", "prop_num3", "prop_num4", "prop_type1", "prop_type2", "prop_type3", "prop_type4", "res_code1", "res_code2", "res_code3", "res_code4", "res_code5", "res_code6", "suit_id", "t", "target_type") VALUES
	(1, 188, 'Chỉ có Hiền Vương mới điều khiển được', 4030200200838, 1, 1, 'Mũ Solomon', 0, 1, 500, 0, 0, 0, 1, 0, 0, 0, 2080130102031, 0, 2080130102035, 0, 2080130102040, 0, 2, 1, 3),
	(2, 588, 'Ánh sáng vương giả chiếu rọi thiên hạ', 4030200200839, 1, 1, 'Giáp Solonmon', 0, 2, 65, 65, 0, 0, 4, 5, 0, 0, 2080130102032, 0, 2080130102032, 2080130102041, 2080130102036, 2080130102041, 2, 1, 3),
	(3, 388, 'Chỉ bậc vương giả mới có', 4030200200840, 1, 1, 'Ấn Solomon', 0, 3, 65, 65, 0, 0, 4, 5, 0, 0, 2080130102033, 0, 2080130102037, 0, 2080130102042, 0, 2, 1, 3),
	(4, 788, 'Pháp trận thần bí', 4030200200841, 1, 1, 'Trận Solomon', 0, 4, 50, 0, 0, 0, 11, 0, 0, 0, 2080130102034, 2080130102034, 2080130102039, 2080130102039, 2080130102043, 2080130102043, 2, 1, 3),
	(6, 888, 'Bảo hộ của thần thánh', 4030200200843, 2, 4, 'Giáp Thánh Đế', 0, 2, 100, 100, 0, 0, 4, 5, 0, 0, 2080130102020, 0, 2080130102020, 2080130102024, 2080130102028, 2080130102024, 3, 1, 3),
	(5, 388, 'Chứng nhân của đại thiên sứ', 4030200200842, 2, 4, 'Mũ Thánh Đế', 0, 1, 800, 0, 0, 0, 1, 0, 0, 0, 2080130102019, 0, 2080130102023, 0, 2080130102027, 0, 3, 1, 3),
	(7, 688, 'Chỉ những dũng sĩ được chọn mới có', 4030200200844, 2, 4, 'Ấn Thánh Đế', 0, 3, 100, 100, 0, 0, 4, 5, 0, 0, 2080130102021, 0, 2080130102025, 0, 2080130102029, 0, 3, 1, 3),
	(8, 1288, 'Pháp trận thiên sứ', 4030200200845, 2, 4, 'Trận Thánh Đế', 0, 4, 80, 0, 0, 0, 11, 0, 0, 0, 2080130102022, 2080130102022, 2080130102026, 2080130102026, 2080130102030, 2080130102030, 3, 1, 3),
	(9, 388, 'Nhìn rõ mọi nhân tâm', 4030200200846, 1, 2, 'Mũ Mộng Ma', 0, 1, 800, 0, 0, 0, 1, 0, 0, 0, 2080130102044, NULL, 2080130102048, 0, 2080130102052, 0, 1, 1, 3),
	(10, 888, 'Chỉ người khống chế tâm ma mới có', 4030200200847, 1, 2, 'Giáp Mộng Ma', 0, 2, 100, 100, 0, 0, 4, 5, 0, 0, 2080130102045, NULL, 2080130102049, 0, 2080130102053, 0, 1, 1, 3),
	(11, 688, 'Dấu tích của mộng quỷ', 4030200200848, 1, 2, 'Ấn Mộng Ma', 0, 3, 100, 100, 0, 0, 4, 5, 0, 0, 2080130102046, NULL, 2080130102050, 0, 2080130102054, 0, 1, 1, 3),
	(12, 1288, 'Pháp trận mộng quỷ', 4030200200849, 1, 2, 'Trận Mộng Ma', 0, 4, 80, 0, 0, 0, 11, 0, 0, 0, 2080130102047, 2080130102047, 2080130102051, 2080130102051, 2080130102055, 2080130102055, 1, 1, 3),
	(13, 688, 'Như ý cát tường', 4030200200850, 2, 3, 'Mũ Tân Xuân', 0, 1, 1100, 0, 0, 0, 1, 0, 0, 0, 2080130102056, NULL, 2080130102060, 0, 2080130102065, 0, 4, 1, 3),
	(14, 1188, 'Vạn vật hồi xuân', 4030200200851, 2, 3, 'Giáp Tân Xuân', 0, 2, 140, 140, 0, 0, 4, 5, 0, 0, NULL, 2080130102057, 2080130102062, 2080130102061, 2080130102066, 2080130102061, 4, 1, 3),
	(15, 888, 'Cung chúc phát tài', 4030200200852, 2, 3, 'Ấn Tân Xuân', 0, 3, 140, 140, 0, 0, 4, 5, 0, 0, 2080130102058, NULL, 2080130102063, 0, 2080130102067, 0, 4, 1, 3),
	(16, 1688, 'Phúc tinh cao chiếu', 4030200200853, 2, 3, 'Trận Tân Xuân', 0, 4, 110, 0, 0, 0, 11, 0, 0, 0, 2080130102059, 2080130102059, 2080130102064, 2080130102064, 2080130102068, 2080130102068, 4, 1, 3),
	(17, 988, 'Vương miện của cửu ngũ chí tôn\r', 4030200200889, 3, 5, 'Hoàng Giả Quan', 0, 1, 1400, 0, 0, 0, 1, 0, 0, 0, 2080130102071, NULL, 2080130102072, 0, 2080130102073, 0, 5, 1, 3),
	(18, 1488, 'Huyền hoàng nhị khí, \nnhật nguyệt doanh trắc', 4030200200890, 3, 5, 'Hoàng Giả Quang', 0, 2, 180, 180, 0, 0, 4, 5, 0, 0, 2080130102074, 2080130102075, 2080130102076, 2080130102077, 2080130102078, 2080130102079, 5, 1, 3),
	(19, 1088, 'Huyền sương chi trận, \nhàn khí bức nhân\r', 4030200200891, 3, 5, 'Hoàng Giả Ấn', 0, 3, 180, 180, 0, 0, 4, 5, 0, 0, 2080130102080, NULL, 2080130102081, 0, 2080130102082, 0, 5, 1, 3),
	(20, 2188, 'Lạc địa sinh liên, trời đất kinh sợ\r', 4030200200892, 3, 5, 'Hoàng Giả Trận', 0, 4, 140, 0, 0, 0, 11, 0, 0, 0, 2080130102083, NULL, 2080130102084, 0, 2080130102085, 0, 5, 1, 3);


--
-- PostgreSQL database dump complete
--

-- \unrestrict xO7AtdKiGiytRjEJA3CY8sX6XNizcEgSzD5wZsTB6TYNSQA71qldmnRCpwe9XVC


SET session_replication_role = origin;
