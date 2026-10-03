SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict RRy6TjfZXq6jxRhnBvYLTo1MwkHCgBlUoVEynFpxgrpI4d0zv2eJMLdZRRkjiZb

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
-- Data for Name: data_tbl_prs_chip; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_prs_chip" ("id", "cost_crystal", "icon_code", "name", "position", "show_id") VALUES
	(1, 200, 3060100001245, 'Mảnh Nữ Thần Âm Nhạc', 1, 1),
	(2, 620, 3060100001247, 'Mảnh Nữ Thần Ánh Trăng', 2, 2),
	(3, 300, 3060100001238, 'Mảnh Nữ Thần Tự Do', 3, 3),
	(4, 1000, 3060100001239, 'Mảnh Nữ Thần Hỏa Diệm', 4, 4),
	(5, 400, 3060100001244, 'Mảnh Nữ Thần Chiến Binh', 5, 5),
	(6, 1220, 3060100001246, 'Mảnh Nữ Thần Hòa Bình', 6, 6),
	(7, 500, 3060100001243, 'Mảnh Nữ Thần Tình Yêu', 7, 7),
	(8, 1500, 3060100001242, 'Mảnh Nữ Thần Thánh Khiết', 8, 8),
	(9, 600, 3060100001241, 'Mảnh Nữ Thần Tư Pháp', 9, 9),
	(10, 2000, 3060100001240, 'Mảnh Thần Hậu Gabriel', 10, 10);


--
-- PostgreSQL database dump complete
--

-- \unrestrict RRy6TjfZXq6jxRhnBvYLTo1MwkHCgBlUoVEynFpxgrpI4d0zv2eJMLdZRRkjiZb


SET session_replication_role = origin;
