SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict qQ1fLUOxUmO4Xdww7R7EAdc8doDNqnMAR98CwQTBuGkWDKYg7ZDPWwAV7h5dp0d

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
-- Data for Name: data_tbl_fairy_tempalte; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_fairy_tempalte" ("id", "agi", "agi_g", "cc", "ener", "ener_g", "inte", "inte_g", "name", "rc", "sta", "sta_g", "ste", "ste_g") VALUES
	(1, 5, 5.0, 0, 5, 5.0, 5, 5.0, 'Thiên Sứ Poli', 2060100300001, 5, 5.0, 5, 5.0),
	(2, 15, 15.0, 0, 5, 5.0, 6, 6.0, 'Rocky', 2060100300002, 6, 6.0, 8, 8.0),
	(3, 6, 6.0, 0, 15, 15.0, 8, 8.0, 'Băng Nữ Koura', 2060100300003, 6, 6.0, 5, 5.0),
	(4, 8, 8.0, 0, 6, 6.0, 5, 5.0, 'Puca', 2060100300004, 15, 15.0, 6, 6.0),
	(5, 5, 5.0, 0, 5, 5.0, 5, 5.0, 'Rồng Xanh Abu', 2060100300005, 10, 10.0, 15, 15.0),
	(6, 5, 5.0, 0, 10, 10.0, 15, 15.0, 'Yêu Tinh Nicole', 2060100300006, 5, 5.0, 5, 5.0),
	(7, 6, 6.0, 0, 15, 15.0, 8, 8.0, 'Tuần Lộc Miya', 2060100300007, 6, 6.0, 5, 5.0),
	(9, 15, 15.0, 0, 5, 5.0, 6, 6.0, 'Minions', 2060100300009, 6, 6.0, 8, 8.0),
	(8, 8, 8.0, 0, 6, 6.0, 5, 5.0, 'Thiên Sứ Bụt', 2060100300008, 15, 15.0, 6, 6.0),
	(11, 6, 6.0, 0, 15, 15.0, 8, 8.0, 'Thần Chết', 2060100300011, 6, 6.0, 5, 5.0),
	(10, 5, 5.0, 0, 5, 5.0, 5, 5.0, 'Casper', 2060100300010, 5, 5.0, 5, 5.0),
	(12, 8, 8.0, 0, 6, 6.0, 6, 6.0, 'Hàn Sương Băng Long', 2060100300012, 16, 16.0, 6, 6.0),
	(13, 6, 6.0, 0, 16, 16.0, 8, 8.0, 'U Độc Minh Phượng', 2060100300013, 6, 6.0, 6, 6.0),
	(14, 16, 16.0, 0, 6, 6.0, 6, 6.0, 'Thánh Quang Thiên Sứ', 2060100300014, 6, 6.0, 8, 8.0),
	(15, 15, 15.0, 0, 5, 5.0, 6, 6.0, 'Bánh Ú Ú', 2060100300015, 6, 6.0, 8, 8.0),
	(16, 15, 15.0, 0, 5, 5.0, 6, 6.0, 'Thỏ Núng Nính', 2060100300016, 6, 6.0, 8, 8.0),
	(17, 5, 5.0, 0, 5, 5.0, 5, 5.0, 'Cặp Ma Lực', 2060100300017, 10, 10.0, 15, 15.0);


--
-- PostgreSQL database dump complete
--

-- \unrestrict qQ1fLUOxUmO4Xdww7R7EAdc8doDNqnMAR98CwQTBuGkWDKYg7ZDPWwAV7h5dp0d


SET session_replication_role = origin;
