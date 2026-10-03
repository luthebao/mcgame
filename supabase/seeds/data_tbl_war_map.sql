SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict Yd3GPaDIJ0hpsubo3lFECuaJ3XApmek1c9twKFDnfNMySOtFbpxVT23FsBUcFpH

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
-- Data for Name: data_tbl_war_map; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_war_map" ("id", "name", "pid", "rc", "type") VALUES
	(1, 'Cung Bạch Dương', '10-1', NULL, 1),
	(2, 'Cung Kim Ngưu', '10-2', NULL, 1),
	(3, 'Cung Song Tử', '10-3', NULL, 1),
	(4, 'Cung Cự Giải', '10-4', NULL, 1),
	(5, 'Cung Sư Tử', '10-5', NULL, 1),
	(6, 'Cung Xử Nữ', '10-6', NULL, 1),
	(7, 'Cung Thiên Bình', '10-7', NULL, 1),
	(8, 'Cung Hổ Cáp', '10-8', NULL, 1),
	(9, 'Cung Nhân Mã', '10-9', NULL, 1),
	(10, 'Cung Ma Kết', '10-10', NULL, 1),
	(11, 'Cung Bảo Bình', '10-11', NULL, 1),
	(12, 'Cung Song Ngư', '10-12', NULL, 1);


--
-- PostgreSQL database dump complete
--

-- \unrestrict Yd3GPaDIJ0hpsubo3lFECuaJ3XApmek1c9twKFDnfNMySOtFbpxVT23FsBUcFpH


SET session_replication_role = origin;
