SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict o2AN9iNfsm6HwUieEI9c6bSSsBeiy24RQjshpdGrp0ZXEBo2MuUMGggB54QIQy5

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
-- Data for Name: data_tbl_extend_position; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_extend_position" ("id", "build_type", "layer", "mid", "pos_dir", "pos_x", "pos_y", "tid") VALUES
	(2, 1, 0, 49, 0, 2317, 1255, 1),
	(9, 1, 0, 49, 0, 2821, 1111, 1),
	(7, 1, 0, 49, 0, 1560, 1608, 1),
	(8, 1, 0, 49, 0, 1935, 1858, 1),
	(1, 1, 0, 49, 0, 1315, 246, 1),
	(3, 1, 0, 49, 0, 1385, 731, 1),
	(6, 1, 0, 49, 0, 1113, 1884, 1),
	(5, 1, 0, 49, 0, 233, 1466, 1),
	(4, 1, 0, 49, 0, 376, 1101, 1),
	(10, 1, 0, 49, 0, 245, 407, 1),
	(11, 1, 0, 49, 0, 1766, 467, 1);


--
-- PostgreSQL database dump complete
--

-- \unrestrict o2AN9iNfsm6HwUieEI9c6bSSsBeiy24RQjshpdGrp0ZXEBo2MuUMGggB54QIQy5


SET session_replication_role = origin;
