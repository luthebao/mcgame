SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict 6xvdppV9UlQkZAhcSnJkhZiWZHudbRABfz6Ep4Zh9VIAgnCSy6dvVnMhUgGfDIu

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
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."accounts" ("id", "username", "password_hash", "secondary_password", "email", "vip_level", "gold", "is_banned", "ban_reason", "ban_expiry", "created_at", "last_login") VALUES
	('00000000-0000-0000-0000-000000000002', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'admin@example.com', 10, 10000, false, NULL, NULL, '2026-03-28 18:36:47.61598+00', '2026-03-28 18:36:47.61598+00'),
	('00000000-0000-0000-0000-000000000001', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'admin@example.com', 0, 10000, false, '', NULL, '2026-03-28 18:36:47.614699+00', '2026-04-14 05:28:18.492836+00');


--
-- PostgreSQL database dump complete
--

-- \unrestrict 6xvdppV9UlQkZAhcSnJkhZiWZHudbRABfz6Ep4Zh9VIAgnCSy6dvVnMhUgGfDIu


SET session_replication_role = origin;
