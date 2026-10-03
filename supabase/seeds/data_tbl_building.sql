SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict rb6MxI4izNzwGe2WworTcSWFoKgkYepsuRfqk7eedoCrtcJv7GtBFhqd3Fg71n0

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
-- Data for Name: data_tbl_building; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_building" ("id", "code_name", "description", "exp_cost", "func_script", "gen_m_cost", "gold_cost", "icon_code", "icon_code_small", "level", "maintain_cost", "money_cost", "name", "num_limit", "percent_flag", "post_building", "pre_building", "prop1", "prop1_value", "prop2", "prop2_value", "prop3", "prop3_value", "prop4", "prop4_value", "rare_m_cost", "require_script", "res_code", "sp_m_cost", "type") VALUES
	(1, 'EXT_POINT', NULL, 0, 'var obj = {name:Lang.BUILDING_funcScript1,func:"extInfo",bid:build.id};\rfuncList.push(obj);\raddBuildFunc(build,"extInfo",extInfo);', 0, 0, NULL, 3060090000097, 0, 0, 0, 'Đất trống', -1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 2060090000099, NULL, 3),
	(2, 'BUILD100001', 'Đây là đại sảnh bang hội của bạn, là cơ sở để xây dựng và thăng cấp tất cả các công trình cấp 1.', 0, NULL, 0, 0, 4030200180030, 3060090000096, 1, 0, 0, 'Đại sảnh cấp 1', 1, 0, NULL, NULL, 4, 1, 1, 20, 0, 0, 0, 0, 0, NULL, 2060090000098, 0, 1),
	(17, 'BUILD100002', 'Đây là nhà ở cấp 6 trong bang hội của bạn, mỗi ngôi nhà sẽ gia tăng giới hạn số thành viên trong bang hội.', 3696000, NULL, 2700, 0, 4030200180028, 3060090000095, 6, 0, 1155000, 'Nhà cấp 6', 2, 0, NULL, '16|14', 1, 70, 0, 0, 0, 0, 0, 0, 1500, NULL, 2060090000107, 800, 1),
	(3, 'BUILD100002', 'Đây là nhà ở cấp 1 trong bang hội của bạn, mỗi ngôi nhà sẽ gia tăng giới hạn số thành viên trong bang hội.', 192000, NULL, 300, 0, 4030200180028, 3060090000095, 1, 0, 60000, 'Nhà cấp 1', 2, 0, NULL, '2', 1, 20, 0, 0, 0, 0, 0, 0, 0, NULL, 2060090000097, 100, 1),
	(4, 'BUILD100004', 'Đây là học viện cấp 1 trong bang hội của bạn, tại đây có thể phát triển và thăng cấp kỹ năng bang hội.', 1008000, 'flst.push({label:Lang.BUILDING_funcScript2,func:"showGuildSkillPanel"});\rNpcScript.addFunc(player,npc,"showGuildSkillPanel",showGuildSkillPanel);', 1500, 0, 4030200180029, 3060090000098, 1, 0, 630000, 'Học viện cấp 1', 1, 0, NULL, '6', 0, 0, 0, 0, 0, 0, 0, 0, 800, NULL, 2060090000095, 1000, 1),
	(5, 'BUILD100003', 'Đây là kho bạc cấp 1 trong bang hội của bạn, tại đây có thể tiến hành quyên góp cho bang hội.', 0, 'flst.push({label:Lang.BUILDING_funcScript3,func:"showGuildWarehouse"});\rNpcScript.addFunc(player,npc,"showGuildWarehouse",showGuildWarehouse);\r\rflst.push({label:Lang.BUILDING_funcScript4,func:"showDonatePanel"});\rNpcScript.addFunc(player,npc,"showDonatePanel",showDonatePanel);', 0, 0, 4030200180027, 3060090000099, 1, 0, 0, 'Kho cấp 1', 1, 0, NULL, '2', 5, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 2060090000096, 0, 1),
	(6, 'BUILD100001', 'Đây là đại sảnh cấp 2 trong bang hội của bạn, là cơ sở để xây dựng và thăng cấp tất cả các công trình cấp 2.', 2016000, NULL, 3000, 0, 4030200180030, 3060090000096, 2, 0, 1260000, 'Đại sảnh cấp 2', 1, 0, NULL, '2|3|5', 4, 2, 1, 20, 0, 0, 0, 0, 1600, NULL, 2060090000098, 2000, 1),
	(7, 'BUILD100001', 'Đây là đại sảnh cấp 3 trong bang hội của bạn, là cơ sở để xây dựng và thăng cấp tất cả các công trình cấp 3.', 3840000, NULL, 6000, 0, 4030200180030, 3060090000096, 3, 0, 2400000, 'Đại sảnh cấp 3', 1, 0, NULL, '6|8|5|4', 4, 3, 1, 20, 0, 0, 0, 0, 3000, NULL, 2060090000105, 3200, 1),
	(16, 'BUILD100001', 'Đây là đại sảnh cấp 6 trong bang hội của bạn, là cơ sở để xây dựng và thăng cấp tất cả các công trình cấp 6.', 18480000, NULL, 27000, 0, 4030200180030, 3060090000096, 6, 0, 11550000, 'Đại sảnh cấp 6', 1, 0, NULL, '12|14|15|4', 4, 6, 1, 20, 0, 0, 0, 0, 14000, NULL, 2060090000108, 8000, 1),
	(8, 'BUILD100002', 'Đây là nhà ở cấp 2 trong bang hội của bạn, mỗi ngôi nhà sẽ gia tăng giới hạn số thành viên trong bang hội.', 403200, NULL, 300, 0, 4030200180028, 3060090000095, 2, 0, 126000, 'Nhà cấp 2', 2, 0, NULL, '6|3', 1, 30, 0, 0, 0, 0, 0, 0, 160, NULL, 2060090000097, 200, 1),
	(9, 'BUILD100002', 'Đây là nhà ở cấp 3 trong bang hội của bạn, mỗi ngôi nhà sẽ gia tăng giới hạn số thành viên trong bang hội.', 768000, NULL, 600, 0, 4030200180028, 3060090000095, 3, 0, 240000, 'Nhà cấp 3', 2, 0, NULL, '7|8', 1, 40, 0, 0, 0, 0, 0, 0, 300, NULL, 2060090000104, 320, 1),
	(10, 'EXT_POINT', NULL, 0, NULL, 0, 0, 4030200180031, 3060090000097, 0, 0, 0, 'Đang xây', -1, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 2060090000099, 0, 1),
	(11, 'BUILD100001', 'Đây là đại sảnh cấp 4 trong bang hội của bạn, là cơ sở để xây dựng và thăng cấp tất cả các công trình cấp 3.', 6840000, NULL, 11000, 0, 4030200180030, 3060090000096, 4, 0, 4275000, 'Đại sảnh cấp 4', 1, 0, NULL, '7|9|5|4', 4, 4, 1, 20, 0, 0, 0, 0, 5000, NULL, 2060090000105, 4600, 1),
	(12, 'BUILD100001', 'Đây là đại sảnh cấp 5 trong bang hội của bạn, là cơ sở để xây dựng và thăng cấp tất cả các công trình cấp 3.', 11520000, NULL, 18000, 0, 4030200180030, 3060090000096, 5, 0, 7200000, 'Đại sảnh cấp 5', 1, 0, NULL, '11|13|15|4', 4, 5, 1, 20, 0, 0, 0, 0, 9000, NULL, 2060090000108, 6200, 1),
	(13, 'BUILD100002', 'Đây là nhà ở cấp 4 trong bang hội của bạn, mỗi ngôi nhà sẽ gia tăng giới hạn số thành viên trong bang hội.', 1368000, NULL, 1100, 0, 4030200180028, 3060090000095, 4, 0, 427500, 'Nhà cấp 4', 2, 0, NULL, '11|9', 1, 50, 0, 0, 0, 0, 0, 0, 500, NULL, 2060090000104, 460, 1),
	(14, 'BUILD100002', 'Đây là nhà ở cấp 5 trong bang hội của bạn, mỗi ngôi nhà sẽ gia tăng giới hạn số thành viên trong bang hội.', 2304000, NULL, 1800, 0, 4030200180028, 3060090000095, 5, 0, 720000, 'Nhà cấp 5', 2, 0, NULL, '12|13', 1, 60, 0, 0, 0, 0, 0, 0, 900, NULL, 2060090000107, 620, 1),
	(15, 'BUILD100003', 'Đây là kho bạc cấp 2 trong bang hội của bạn, tại đây có thể tiến hành quyên góp cho bang hội.', 2052000, 'flst.push({label:Lang.BUILDING_funcScript3,func:"showGuildWarehouse"});\rNpcScript.addFunc(player,npc,"showGuildWarehouse",showGuildWarehouse);\r\rflst.push({label:Lang.BUILDING_funcScript4,func:"showDonatePanel"});\rNpcScript.addFunc(player,npc,"showDonatePanel",showDonatePanel);', 3300, 0, 4030200180027, 3060090000099, 2, 0, 1282500, 'Kho cấp 2', 1, 0, NULL, '11|5', 5, 2, 0, 0, 0, 0, 0, 0, 1500, NULL, 2060090000103, 1380, 1),
	(18, 'BUILD100004', 'Đây là học viện cấp 2 trong bang hội của bạn, tại đây có thể phát triển và thăng cấp kỹ năng bang hội.', 9240000, 'flst.push({label:Lang.BUILDING_funcScript2,func:"showGuildSkillPanel"});\rNpcScript.addFunc(player,npc,"showGuildSkillPanel",showGuildSkillPanel);', 13500, 0, 4030200180029, 3060090000098, 2, 0, 5800000, 'Học viện cấp 2', 1, 0, NULL, '4|16', 0, 0, 0, 0, 0, 0, 0, 0, 7200, NULL, 2060090000095, 4000, 1);


--
-- PostgreSQL database dump complete
--

-- \unrestrict rb6MxI4izNzwGe2WworTcSWFoKgkYepsuRfqk7eedoCrtcJv7GtBFhqd3Fg71n0


SET session_replication_role = origin;
