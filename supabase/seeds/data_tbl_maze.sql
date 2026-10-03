SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict BulGea8vmBItUKtHwoADIYHqcmLfzMOZmOcjQplEiA9X0BV5DzcOtxjG0zvWb8l

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
-- Data for Name: data_tbl_maze; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_maze" ("id", "description", "max", "min", "name", "rate", "result_script") VALUES
	(1, 'Chuyển đến 1 vị trí ngẫu nhiêu trong phạm vi từ 1 - 2 ô', 54, 0, 'Tâm Khiêu Ma Phương', 50, NULL),
	(2, 'Chuyển đến Điểm Đầu hoặc Điểm Cuối', 54, 0, 'Không Gian Mộng Ảo', 50, NULL),
	(3, 'Giảm từ 1- 3 điểm hành động', 54, 0, 'Giảm Thiểu Hành Động', 50, NULL),
	(4, 'Tăng từ 1- 3 điểm hành động', 54, 0, 'Gia Tăng Hành Động', 50, NULL),
	(5, 'Hồi phục 1 lượng HP', 54, 0, 'Tuyền Thủy Sinh Mệnh', 40, NULL),
	(6, 'Giảm 1 lượng HP', 54, 0, 'Cạm Bẫy Chí Mạng', 20, NULL),
	(7, 'Tăng 1 lượng HP, tấn công, phòng ngự, tốc độ', 54, 0, 'Nữ Thần May Mắn', 40, NULL),
	(8, 'Có cơ hội mua được vật phẩm giảm giá', 54, 0, 'Giảm Giá Tinh Phẩm', 75, NULL),
	(9, 'Có cơ hội rút nhận bảo vật', 54, 0, 'Khai Mở Bảo Rương', 75, NULL),
	(10, 'Trả lời 1 lượng câu hỏi, lượng câu đáp đúng càng cao, phần thưởng càng nhiều', 54, 0, 'Đáp Án Trí Tuệ', 50, NULL),
	(11, 'Khi gặp Quái Vật Làm Loạn, nếu thất bại sẽ giảm 1 nửa HP', 54, 0, 'Quái Vật Làm Loạn', 160, NULL),
	(12, 'Khi gặp Tiểu Đội Tinh Anh, nếu thất bại sẽ giảm 1 nửa HP', 54, 0, 'Tiểu Đội Tinh Anh', 200, NULL),
	(13, 'Khi gặp Ngộ Lâm Ngộ Tập, nếu thất bại sẽ giảm 1 nửa HP', 54, 0, 'Mật Lâm Ngộ Tập', 100, NULL),
	(14, 'Khi khiêu chiến BOSS, nếu thất bại sẽ giảm 1 nửa HP', 54, 0, 'Khiêu Chiến BOSS', 40, NULL),
	(15, NULL, 0, 0, 'Phần Thưởng Cuối', 0, 'function getMazeFinalAward(cid){\r\tvar c = getCharactor(cid);\r\tvar nameStr = encode(TBL_CHARACTOR, cid, c.data.name);\r\tif(!c || !mazeData[cid]){\r\t\treturn;\r\t}\r\tvar currentRate = mazeData[cid].currentRate;\r\tif(!c.isRebirthed()){\r\t\t\t//没有转生的获得经验\r\t\taddChaExp(cid, Math.floor(BASIC_GET_EXP[c.level] * currentRate * 5));\r\t}\r\telse{\r\t\t//转生的获得功勋\r\t\tif(BASIC_GET_REEXP[c.levelRe]){\r\t\t\t//转生的获得功勋\r\t\t\ttrace(Math.floor(currentRate * BASIC_GET_REEXP[c.levelRe]));\r\t\t\ttrace(c.levelRe+" c.levelRe");\r\t\t\taddCharExpRe(c,  Math.floor(currentRate * BASIC_GET_REEXP[c.levelRe]));\r\t\t}else{\r\t\t\tsystemSay(cid, Lang.NPC_Script2159);\r\t\t}\r\t}\r\ttakePackageBySTWithBindedInit(cid, MAZE_FINAL_AWARD[mazeData[cid].level] );\r\t/*检测活跃度*/\r\tcheckDailyActProgress(c,36);\r\tsystemMidMsgBroadcast(Lang.NPC_Script1632.replace("{name}", nameStr));\t\r}\rgetMazeFinalAward(cid);');


--
-- PostgreSQL database dump complete
--

-- \unrestrict BulGea8vmBItUKtHwoADIYHqcmLfzMOZmOcjQplEiA9X0BV5DzcOtxjG0zvWb8l


SET session_replication_role = origin;
