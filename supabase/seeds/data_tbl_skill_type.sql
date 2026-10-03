SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict cA6nyfNyI2hRBEKVYTBS5XRZZzerQ5v2pCGMVQPN6mfwChRGpVg6cpMfWLeatMF

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
-- Data for Name: data_tbl_skill_type; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_skill_type" ("id", "kid", "name") VALUES
	(1, 1, '物理近战'),
	(2, 2, '物理远程(子弹)'),
	(3, 3, '魔法直接伤害'),
	(4, 8, '魔法子弹伤害'),
	(5, 5, '魔法恢复'),
	(6, 4, '状态施加'),
	(7, 6, '状态清除'),
	(8, 7, '功能伤害'),
	(9, 9, '功能恢复'),
	(10, 10, '其他(被动等)'),
	(11, 11, '护卫');


--
-- PostgreSQL database dump complete
--

-- \unrestrict cA6nyfNyI2hRBEKVYTBS5XRZZzerQ5v2pCGMVQPN6mfwChRGpVg6cpMfWLeatMF


SET session_replication_role = origin;
