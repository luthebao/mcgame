SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict pP7MXFdiU4SsOpvLnYpEWNelCL2UJaQU7GKPGAciIArgLtB7GtIRqX8zCc6SpQ0

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
-- Data for Name: data_tbl_quest_loop; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO "data"."data_tbl_quest_loop" ("id", "info", "max_level", "min_level", "name", "nid", "num", "refresh", "script_get", "script_give_up", "team") VALUES
	(1, 'Điều kiện nhận:1.Cấp độ người chơi ≥40, 1 người nhận.2.Tiêu hao 5 điểm sức lực và 1 lượng bạc (tùy vào cấp độ nhân vật)Hướng dẫn liên quan:<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng thì cần phải đợi 12 tiếng sau mới có thể nhận lại.</font>2.Cứ mỗi hoàn thành 1 vòng nhiệm vụ thì sẽ nhận được tiền và kinh nghiệm, số vòng càng cao thì phần thưởng càng nhiều, nếu hoàn thành được vòng cuối cùng thì còn có thể nhận được phần thưởng.', 150, 200, 'Nhiệm Vụ 60 Vòng', 48, 60, 43200, NULL, '""', 0),
	(8, 'Điều kiện nhận: 1.Cấp độ người chơi ≥ 50, 1 người nhận, đồng thời phải biến hình thành Tiểu Cương Thi. Hướng dẫn liên quan: <font color="#FF0000">1. Nếu bỏ cuộc giữa chừng thì cần phải đợi 10 phút sau mới có thể nhận lại.</font> 2. Nhiệm vụ gồm 10 vòng, hoàn thành 1 vòng sẽ nhận được phần thưởng kinh nghiệm. Số vòng càng cao phần thưởng càng nhiều.', 160, 200, 'Nhiệm Vụ Vong Hồn', 250, 10, 600, NULL, NULL, 0),
	(4, 'Điều kiện nhận: \r1.Cấp độ ≥30, 1 người nhận. \rHướng dẫn: \r<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc đã hoàn thành 1 vòng (10 nhiệm vụ) thì cần phải đợi sang ngày mới có thể nhận lại. </font>\r2.Khi giết quái thành công sẽ có cơ hội nhận Bản Đồ Kho Báu và Bản Đồ Kho Báu Cao Cấp. \r3.Hoàn thành nhiệm vụ sẽ nhận được exp, ngân phiếu, bạc, số vòng càng cao thì phần thưởng càng nhiều, hoàn thành 3 vòng nhiệm vụ sẽ nhận được chiến tích. \r4.Khi hoàn thành ở vòng 5 và 10 sẽ nhận được Bảo Rương Thần Bí. \r5.Người chơi cấp 80 trở lên hoàn thành vòng 10 còn nhận được Ấn Chương Bất Khuất.', 160, 30, 'Nhiệm Vụ Trị An', 277, 10, 600, '""', NULL, 0),
	(5, 'Điều kiện nhận: \r1.Cấp độ ≥50, 1 người nhận. \rHướng dẫn: \r<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc đã hoàn thành 1 vòng (20 nhiệm vụ) thì cần phải đợi sang ngày mới có thể nhận lại. </font>\r<font color="#FF0000">2.Nếu pet tham chiến có cấp độ lớn hơn người chơi 5 cấp thì sẽ không nhận được kinh nghiệm. </font>\r3.Mỗi khi hoàn thành 1 vòng thì pet tham chiến sẽ nhận được kinh nghiệm. Số vòng càng cao, phần thưởng càng nhiều.\r4.Khi hoàn thành ở vòng 10 và 20 sẽ nhận được Bảo Rương Thần Bí.', 160, 50, 'Rèn Luyện Pet', 280, 20, 600, '""', NULL, 0),
	(6, 'Điều kiện nhận: \r1.Cấp độ ≥70, 1 hoặc nhóm nhận. \rHướng dẫn: \r<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc đã hoàn thành 1 vòng (20 nhiệm vụ) thì cần phải đợi sang ngày mới có thể nhận lại. </font>\r2.Mỗi lần khiêu chiến với NPC của 6 gia tộc sẽ ngẫu nhiên nhận được phần thưởng, số vòng càng cao, phần thưởng càng nhiều. \r3.Hoàn thành mỗi vòng nhiệm vụ sẽ nhận được exp,  số vòng càng cao, phần thưởng càng nhiều. \r4.Khi hoàn thành ở vòng 10 và 20 sẽ nhận được Bảo Rương Thần Bí.', 160, 70, 'Nhiệm Vụ Tu Luyện', 434, 20, 600, '""', NULL, 1),
	(3, 'Điều kiện nhận: \r1.Cấp độ người chơi≥50，1 nam 1 nữ lập nhóm，phải là bạn bè，nhóm trưởng nhận nhiệm vụ. \rHướng dẫn liên quan:<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc sau khi làm xong thì phải chờ 10 phút sau mới có thể nhận lại.</font> \r2.Nhiệm vụ có 10 vòng, mỗi lần xong 1 vòng đều nhận được kinh nghiệm, bạc và điểm thưởng nhiệm vụ. Số vòng càng cao thì phần thưởng càng nhiều. Hoàn thành xong vòng cuối còn có xác suất nhận được phần thưởng đặc biệt.', 200, 200, 'Nhiệm Vụ Lễ Tình Nhân', 246, 10, 600, 'var script_FT = add(ft, 1);\rvar script_planIndex = 0;\r/*systemSay(cid ,"领取时当前环数 = "+script_FT);*/\rscript_planIndex = getRandomIdx([2000, 2000, 2000, 2000, 2000, 2000]);\rvar spt_List = ["9-2-1", "9-2-2" ,"9-2-3", "9-2-4", "9-2-5", "9-2-6"];\rvar quest_ID = getQuestByRate(spt_List[script_planIndex], player.level);\r/*systemSay(cid,"抽取库st = "+spt_List[script_planIndex]);*/', NULL, 2),
	(9, 'Điều kiện nhận: 1.Cấp độ người chơi ≥ 70, 1 người nhận. 2.Tiêu hao 1 lượng bạc nhất định (tùy thuộc vào cấp độ nhân vật). Hướng dẫn liên quan:<font color="#FF0000">1.  Nếu bỏ cuộc giữa chừng thì cần phải đợi 72 tiếng sau mới có thể nhận lại.</font>2. Cứ mỗi hoàn thành 1 vòng nhiệm vụ thì sẽ nhận được phần thưởng kinh nghiệm, số vòng càng cao thì phần thưởng càng nhiều. (Cứ 10 vòng nhiệm vụ sẽ tạo thành 1 đợt tuần hoàn. Trong mỗi đợt tuần hoàn, phần thưởng  sẽ tăng dần theo thứ tự các vòng. Đồng thời cứ mỗi lần hoàn thành 10 vòng nhiệm vụ, mức độ phần thưởng cũng được nâng cao. Ví dụ như phần thưởng vòng 19 sẽ cao hơn phần thưởng vòng 18. Nhưng thông thường thì phần thưởng vòng 20 lại thấy hơn phần thưởng vòng 19, cao hơn phần thưởng vòng 10). Hoàn thành vòng 50 nhận được 1 Nguyên Liệu Cấp 5. Hoàn thành vòng 100 nhận được 1 Bảo Thạch Cao Cấp (<font color="#FF0000">như Linh Hồn Thạch Đặc Cấp</font>). Hoàn thành vòng 150 nhận được 1 Nội Đơn giúp tăng phẩm chất Pet (<font color="#FF0000">Nội Đơn Huyền Thú</font>). Hoàn thành vòng 200 nhận được 1 quyển Yếu Quyết Ma Thú Cao Cấp (<font color="#FF0000">như Báo Chi Tấn Tiệp Cao Cấp</font>)。Hoàn thành 50 vòng nhận được <font color="#FF0000">Thuộc Tính Lông Vũ</font>，Hoàn thành 200 vòng nhận được <font color="#FF0000">Công Thức Dung Hợp Lông Vũ</font>。 ', 160, 70, 'Nhiệm Vụ 200 Vòng', 48, 200, 259200, NULL, 'var spt_logObj = {};var spt_client = clientByCid(cid);if(spt_client){\tvar spt_ip = spt_client.ip;}spt_logObj.type= "200环任务放弃"; spt_logObj.cid = cid;spt_logObj.num = ft; spt_logObj.info = "放弃任务玩家的信息";//spt_logObj.kint = 1; spt_logObj.kchar = spt_ip; addEventLog(spt_logObj);', 0),
	(10, 'Điều kiện nhận: Nhóm 2 người cấp 50 trở lên. Hướng dẫn: <font color="#FF0000">1. Nếu bỏ cuộc giữa chùng hoặc sau khi làm xong phải chờ 10 phút sau mới có thể nhận lại. </font>2. Nhiệm vụ này có 10 vòng. Cứ mỗi lần hoàn thành 1 vòng nhiệm vụ sẽ nhận được kinh nghiệm, bạc và điểm thưởng sự kiện. Số vòng càng cao thì phần thưởng càng nhiều. Hoàn thành vòng nhiệm vụ cuối sẽ có cơ hội nhận phần thưởng đặc biệt.', 160, 200, 'Nhiệm Vụ Halloween', 1519, 10, 600, 'var script_FT = add(ft, 1);var script_planIndex = 0;/*systemSay(cid ,"领取时当前环数 = "+script_FT);*/script_planIndex = getRandomIdx([3000, 3000, 3000, 4000]);var spt_List = ["9-6-1", "9-6-2" ,"9-6-3", "9-6-4"];var quest_ID = getQuestByRate(spt_List[script_planIndex], player.level);/*systemSay(cid,"抽取库st = "+spt_List[script_planIndex]);*/', NULL, 2),
	(2, 'Điều kiện nhận: 1.Phải gia nhập 1 bang hội. 2.Cấp độ ≥30, 1 người nhận. Hướng dẫn: <font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc đã hoàn thành 1 vòng (15 nhiệm vụ) thì cần phải đợi sang ngày mới có thể nhận lại. </font>2.Hoàn thành mỗi vòng sẽ nhận được exp, điểm cống hiến bang hội, exp bang và tiền vàng bang, số vòng càng cao, phần thưởng càng nhiều.\n3.Khi hoàn thành ở vòng 5, 10, 15 sẽ nhận được Bảo Rương Thần Bí.\n4.Khi hoàn thành vòng 30 sẽ có cơ hội nhận Công thức nấu ăn (Bang hội cấp 3 - nhận công thức cấp 4, Bang hội cấp 4 - nhận công thức cấp 4-6, Bang hội cấp 6 - nhận công thức cấp 5-7) và Công thức dung hợp lông vũ.\n5.Người chơi cấp 80 trở lên khi hoàn thành nhiệm vụ 30 còn nhận được Ấn Chương Huy Nguyệt.\t\t\t\t\t\t\t\t\t', 160, 30, 'Nhiệm Vụ Bang Hội', 1069, 15, 600, 'var script_planIndex = getRandomIdx([20 ,40 ,0 ,40]);var spt_List = ["9-5-1" ,"9-5-2" ,"9-5-3" ,"9-5-4"];var quest_ID = getQuestByRate(spt_List[script_planIndex], player.level);/*if(isSmallThan(player.level, 80)){\tscript_planIndex = getRandomIdx([20 ,40 ,0 ,40]);}systemSay(cid,"抽取库st = "+spt_List[script_planIndex]);*/', NULL, 0),
	(16, 'Điều kiện nhận: \r1.Cấp độ ≥50, 1 hoặc nhóm nhận. \rHướng dẫn: \r<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc đã hoàn thành 1 vòng (10 nhiệm vụ) thì cần phải đợi sang ngày mới có thể nhận lại. </font>\r2.Hoàn thành mỗi vòng nhiệm vụ sẽ nhận được exp, số vòng càng cao, phần thưởng càng nhiều, xác suất nhận được Thâm Hồng Tinh và Hoán Thần Thạch. \r3.Khi hoàn thành ở vòng 5, 10 sẽ nhận được Bảo Rương Thần Bí.. \r4.Khi hoàn thành vòng 10 sẽ nhận được thần khí chính cao cấp. \r5.Người chơi cấp 80 trở lên khi hoàn thành vòng 10 sẽ nhận được Ấn Chương Bất Khuất, xác suất nhận Ấn Chương Huy Nguyệt. \r6.Mỗi ngày hoàn thành 3 vòng nhiệm vụ sẽ có cơ hội nhận Kết Tinh Trí Thạch (dùng để đổi trang bị pet ở Tiệm Pet Tôn Lệ - Đông Huyền Thành). \r', 160, 50, 'Nhiệm Vụ Trừ Ma', 3, 10, 600, '""', NULL, 1),
	(7, 'Điều kiện nhận: \r1.Cấp độ ≥50, 1 hoặc nhóm nhận. \rHướng dẫn: \r<font color="#FF0000">1.Nếu bỏ cuộc giữa chừng hoặc đã hoàn thành 1 vòng (10 nhiệm vụ) thì cần phải đợi 10 phút sau mới có thể nhận lại. </font>\r2.Đội khó khi khiêu chiến Thượng Cổ Ma Thần sẽ tăng theo số vòng nhiệm vụ. \r3.Mỗi lần hoàn thành 1 vòng nhiệm vụ sẽ nhận được điểm thần tu, số vòng càng cao, phần thưởng càng nhiều. \r4.Khi nhóm hoàn thành vòng nhiệm vụ thứ 10, nhóm trưởng và thành viên có cơ hội nhận Kết Tinh Thần Tu.', 160, 50, 'Nhiệm Vụ Thần Tu', 929, 10, 600, '""', NULL, 1);


--
-- PostgreSQL database dump complete
--

-- \unrestrict pP7MXFdiU4SsOpvLnYpEWNelCL2UJaQU7GKPGAciIArgLtB7GtIRqX8zCc6SpQ0


SET session_replication_role = origin;
