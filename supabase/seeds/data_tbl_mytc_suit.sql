SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict sxeWcLv6QSJ5o0gObbY5IogQUZqe6pVwuvPQv0Rf8zalAPaypjzX2JGxW2Jcy0n

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
-- Data for Name: data_tbl_mytc_suit; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_mytc_suit" ("id", "m1", "m2", "m3", "name") VALUES
	(1, 2352, 2326, 1964, 'Trang 1'),
	(3, 2331, 2382, 2376, 'Trang 3'),
	(2, 2329, 1966, 2375, 'Trang 2'),
	(4, 1970, 2327, 2384, 'Trang 4'),
	(5, 2386, 1962, 2333, 'Trang 5'),
	(6, 2400, 2380, 1961, 'Trang 6'),
	(7, 2402, 1974, 2381, 'Trang 7'),
	(8, 2416, 2417, 2418, 'Trang 8');


--
-- PostgreSQL database dump complete
--

-- \unrestrict sxeWcLv6QSJ5o0gObbY5IogQUZqe6pVwuvPQv0Rf8zalAPaypjzX2JGxW2Jcy0n


SET session_replication_role = origin;
