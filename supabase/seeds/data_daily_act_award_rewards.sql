--
-- PostgreSQL database dump
--

-- \restrict MkaDhkbECVM3bkP5fl9GTwNEW51wST0QZcst5FeEbdCHX6rZS3K9OTjq49bHhd3

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
-- Data for Name: daily_act_award_rewards; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO data.daily_act_award_rewards (tier, threshold, item_id, quantity, bound, icon_giid, note) VALUES (0, 30, 2003, 1, true, 3255, 'Bảo rương năng nổ tier 0 (30 điểm)');
INSERT INTO data.daily_act_award_rewards (tier, threshold, item_id, quantity, bound, icon_giid, note) VALUES (1, 60, 2004, 1, true, 3256, 'Bảo rương năng nổ tier 1 (60 điểm)');
INSERT INTO data.daily_act_award_rewards (tier, threshold, item_id, quantity, bound, icon_giid, note) VALUES (2, 120, 2005, 1, true, 3257, 'Bảo rương năng nổ tier 2 (120 điểm)');
INSERT INTO data.daily_act_award_rewards (tier, threshold, item_id, quantity, bound, icon_giid, note) VALUES (3, 210, 2006, 1, true, 3258, 'Bảo rương năng nổ tier 3 (210 điểm)');
INSERT INTO data.daily_act_award_rewards (tier, threshold, item_id, quantity, bound, icon_giid, note) VALUES (4, 360, 2007, 1, true, 3259, 'Bảo rương năng nổ tier 4 (360 điểm)');


--
-- PostgreSQL database dump complete
--

-- \unrestrict MkaDhkbECVM3bkP5fl9GTwNEW51wST0QZcst5FeEbdCHX6rZS3K9OTjq49bHhd3

