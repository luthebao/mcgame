SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict S2wkIWnhxQUSebwXAQhj3uDKJ17j5Xp9Wy5X9JaNhYjai3TJXSZsguNovKoQx1U

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
-- Data for Name: data_tbl_skill_kind; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_skill_kind" ("id", "name") VALUES
	(1, '主动技能'),
	(2, '被动技能'),
	(3, 'Buff技能'),
	(4, '功能技能');


--
-- PostgreSQL database dump complete
--

-- \unrestrict S2wkIWnhxQUSebwXAQhj3uDKJ17j5Xp9Wy5X9JaNhYjai3TJXSZsguNovKoQx1U


SET session_replication_role = origin;
