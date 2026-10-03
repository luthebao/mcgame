SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict yfG8FIhotxedxMr1GmCg20qBygNYchIhPac7aqH9kfvymFbhNTzajXMu18EtWQm

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
-- Data for Name: data_tbl_mineral_template; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_mineral_template" ("id", "act_pnt", "color_code", "description", "icon_code", "money", "name", "num", "res_code1", "res_code2", "tid", "time") VALUES
	(9, 100, 180, '高级丝蛛，吐出的丝更加坚韧有力，也\r更适合作为打造装备的原料', 3060090000202, 10000, 'Nhện Tơ Hiếm', 50, 2060090000202, 2060090000203, 26, 60),
	(8, 100, 180, '由各种结晶体凝结成的冥智晶石，璀\r璨夺目', 3060090000200, 10000, 'Tinh Quái Hiếm', 50, 2060090000200, 2060090000201, 23, 60),
	(7, 100, 180, '高级树精灵，可以提供更优质的木料', 3060090000198, 10000, 'Tinh Thụ Hiếm', 50, 2060090000198, 2060090000199, 21, 60),
	(6, 100, 180, '高级岩怪，可以提炼出比普通岩怪更\r稀有的金属', 3060090000196, 10000, 'Nham Quái Hiếm', 50, 2060090000196, 2060090000197, 24, 60),
	(5, 100, 0, '远古巨熊，拥有着珍贵而温暖的毛皮', 3060090000204, 10000, 'Cự Hùng Thường', 100, 2060090000204, 2060090000205, 27, 60),
	(4, 100, 0, '生活在无忧大陆的特有蜘蛛，用其丝\r所织的布是人们生活不可或缺的材料', 3060090000202, 10000, 'Nhện Tơ Thường', 100, 2060090000202, 2060090000203, 25, 60),
	(3, 100, 0, '拥有神奇力量的结晶体，只需要一段\r时间就能结晶成矿', 3060090000200, 10000, 'Tinh Quái Thường', 100, 2060090000200, 2060090000201, 22, 60),
	(2, 100, 0, '树木的精灵，被驯服后就一直被用来\r养殖', 3060090000198, 10000, 'Tinh Thụ Thường', 100, 2060090000198, 2060090000199, 18, 60),
	(1, 100, 0, '岩石的精华随着岁月累积渐渐变成的\r生物', 3060090000196, 10000, 'Nham Quái Thường', 100, 2060090000196, 2060090000197, 7, 60),
	(10, 100, 180, '高级巨熊，坚韧的皮造就了其最强大\r的防御', 3060090000204, 10000, 'Cự Hùng Hiếm', 50, 2060090000204, 2060090000205, 28, 60);


--
-- PostgreSQL database dump complete
--

-- \unrestrict yfG8FIhotxedxMr1GmCg20qBygNYchIhPac7aqH9kfvymFbhNTzajXMu18EtWQm


SET session_replication_role = origin;
