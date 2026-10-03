--
-- PostgreSQL database dump
--

-- \restrict J8u9bdPEkIqkGbpBd7gufKsvOm6OpXY3EGr6YrOO4Cmbh8jDnUJJtSvO7DV1On2

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
-- Data for Name: data_tbl_activity; Type: TABLE DATA; Schema: data; Owner: -
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE data.data_tbl_activity DISABLE TRIGGER ALL;

INSERT INTO data.data_tbl_activity (id, name, style_name, panel_key, feature_key, sort_type, enable, type, flag, note) VALUES
	(49, 'Boss Daily', 'Mowubiji', 'BOSS_DAILY', 'boss_daily', 49, true, 0, 1, NULL),
	(3, 'BtnTestAct', 'BtnTestAct', NULL, NULL, 3, false, 0, 1, NULL),
	(4, 'BtnConsumeAct', 'BtnConsumeAct', NULL, NULL, 4, false, 0, 1, NULL),
	(6, 'BtnBussinessAct', 'BtnBussinessAct', NULL, NULL, 6, false, 0, 1, NULL),
	(7, 'BtnWBAct', 'BtnWBAct', NULL, NULL, 7, false, 0, 1, NULL),
	(8, 'BtnLimitAct', 'BtnLimitAct', NULL, NULL, 8, false, 0, 1, NULL),
	(10, 'BtnNewPlayerAct', 'BtnNewPlayerAct', NULL, NULL, 10, false, 0, 1, NULL),
	(11, 'BtnFundAct', 'BtnFundAct', NULL, NULL, 11, false, 0, 1, NULL),
	(19, 'VIP Shop', 'BtnVipAct', 'VIP_SHOP_PANEL', 'vip_shop', 19, true, 0, 1, 'Shop vip'),
	(21, 'BtnLotteryAct', 'BtnLotteryAct', NULL, NULL, 21, false, 0, 1, 'Vòng quay may mắn'),
	(23, 'BtnLuckDrawAct', 'BtnLuckDrawAct', NULL, NULL, 23, false, 0, 1, 'Rut thăm trúng thưởng'),
	(30, 'BtnJiangLiZhaoHui', 'BtnJiangLiZhaoHui', NULL, NULL, 30, true, 0, 1, 'Hồi phục'),
	(33, 'BtnShuangShiYi', 'BtnShuangShiYi', NULL, NULL, 33, false, 0, 1, 'Thưởng May Mắn'),
	(31, 'BtnKuaFuJingJi', 'BtnKuaFuJingJi', NULL, NULL, 31, false, 0, 1, 'Tranh bá Liên SV'),
	(36, 'Jubaopen', 'Jubaopen', NULL, NULL, 36, false, 0, 1, 'Đào kho báu'),
	(37, 'Fanpai', 'Fanpai', NULL, NULL, 37, false, 0, 1, 'Lật Chữ'),
	(40, 'Fanpaichuangguan', 'Fanpaichuangguan', NULL, NULL, 40, false, 0, 1, 'Lật Bài truyền thuyết'),
	(42, 'Menghuimoli', 'Menghuimoli', NULL, NULL, 42, false, 0, 1, NULL),
	(45, 'BtnGrouponAct', 'BtnGrouponAct', NULL, NULL, 45, false, 0, 1, NULL),
	(46, 'summerGames', 'summerGames', NULL, NULL, 46, false, 0, 1, NULL),
	(47, 'ShiJieBei', 'ShiJieBei', NULL, NULL, 47, false, 0, 1, NULL),
	(48, 'Auto Task New', 'BtnAutoTaskActNew', 'AUTO_TASK_PANEL_NEW', 'auto_task_new', 48, false, 0, 1, NULL),
	(50, 'wawajiicon', 'wawajiicon', NULL, NULL, 50, false, 0, 1, NULL),
	(52, 'sirendinggou', 'sirendinggou', NULL, NULL, 52, false, 0, 1, NULL),
	(53, 'manjiujian', 'manjiujian', NULL, NULL, 53, false, 0, 1, NULL),
	(60, 'BloodyBattle', 'BloodyBattle', NULL, NULL, 60, false, 0, 1, 'huyết chiến cổ bích'),
	(65, 'dailySignInAct', 'dailySignInAct', NULL, NULL, 65, true, 0, 1, 'Báo danh nhận quà'),
	(5, 'BtnDailyGiftAct', 'BtnDailyGiftAct', NULL, NULL, 5, false, 0, 1, NULL),
	(67, 'stoneToGoldAct', 'stoneToGoldAct', NULL, NULL, 67, false, 0, 1, NULL),
	(69, 'mojinAct', 'mojinAct', NULL, NULL, 69, false, 0, 1, 'Đãi vàng'),
	(70, 'laodonggr', 'laodonggr', NULL, NULL, 70, false, 0, 1, 'Lao động vinh quang'),
	(73, 'summerGames', 'summerGames', NULL, NULL, 73, false, 0, 1, NULL),
	(74, 'moliyixia', 'moliyixia', NULL, NULL, 74, false, 0, 1, NULL),
	(76, 'pkgame', 'pkgame', NULL, NULL, 76, false, 0, 1, 'PK 5v5'),
	(77, 'PetPKBut', 'PetPKBut', NULL, NULL, 77, false, 0, 1, 'Pet PK'),
	(78, 'ConsumeNotice', 'ConsumeNotice', NULL, NULL, 78, false, 0, 1, 'Costume'),
	(83, 'mengchongzhidou', 'mengchongzhidou', NULL, NULL, 83, false, 0, 1, 'Festival Thần thú'),
	(54, 'rebateEveryday', 'rebateEveryday', NULL, NULL, 54, false, 0, 1, NULL),
	(56, 'monthWelfare', 'monthWelfare', NULL, NULL, 56, false, 0, 1, 'Lợi tức mua sắm'),
	(62, 'happyFrontLine', 'happyFrontLine', NULL, NULL, 62, false, 0, 1, 'bingo'),
	(2, 'BtnStarAct', 'BtnStarAct', NULL, NULL, 2, true, 2, 80, NULL),
	(1, 'BtnMonthAct', 'BtnMonthAct', NULL, NULL, 1, false, 0, 1, NULL),
	(13, 'BtnNineBossAct', 'BtnNineBossAct', NULL, NULL, 13, true, 2, 130, 'Kiếp nạn vô ưu'),
	(14, 'BtnCardAct', 'BtnCardAct', NULL, NULL, 14, true, 2, 80, 'Thẻ bài ma thuật'),
	(15, 'BtnWBAct', 'BtnWBAct', NULL, NULL, 15, true, 2, 50, 'Boss Thế giới'),
	(16, 'BtnAnswerAct', 'BtnAnswerAct', NULL, NULL, 16, true, 3, 0, 'Đố vui có thưởng'),
	(17, 'BtnDuiKangAct', 'BtnDuiKangAct', NULL, NULL, 17, true, 3, 0, 'Võ đài đông huyền'),
	(18, 'BtnSoulAct', 'BtnSoulAct', NULL, NULL, 18, true, 2, 80, 'Xủ quẻ'),
	(32, 'BtnPKZhengBa', 'BtnPKZhengBa', NULL, NULL, 32, true, 3, 0, 'Tranh bá PK'),
	(22, 'BtnJingJiAct', 'BtnJingJiAct', NULL, NULL, 22, true, 3, 0, 'Chiến trường dũng sĩ'),
	(25, 'BtnXiaLingYing', 'BtnXiaLingYing', NULL, NULL, 25, true, 3, 0, 'Lễ hội sôi động'),
	(27, 'BtnMiZhen', 'BtnMiZhen', NULL, NULL, 27, true, 2, 120, 'Mê trận'),
	(28, 'BtnZiRanZhiLi', 'BtnZiRanZhiLi', NULL, NULL, 28, true, 2, 50, 'Năng lượng tự nhiên'),
	(29, 'BtnJinHuaZhiShu', 'BtnJinHuaZhiShu', NULL, NULL, 29, true, 2, 50, 'Sách tiến hoá'),
	(20, 'Auto Task', 'BtnAutoTaskAct', 'AUTO_TASK_PANEL', 'auto_task', 20, true, 2, 50, 'Hoàn thành Phụ bản'),
	(34, 'Wuyouyuanzheng', 'Wuyouyuanzheng', NULL, NULL, 34, true, 3, 0, 'Viễn chinh'),
	(35, 'Chongwutianfu', 'Chongwutianfu', NULL, NULL, 35, true, 2, 80, 'Thiên Phú Pet'),
	(38, 'Huanjingxunbao', 'Huanjingxunbao', NULL, NULL, 38, true, 3, 0, 'Ảo cảnh tầm bảo'),
	(39, 'Dulayinshi', 'Dulayinshi', NULL, NULL, 39, true, 2, 50, 'Ấn Thạch'),
	(41, 'Zumaguangchang', 'Zumaguangchang', NULL, NULL, 41, true, 3, 0, 'Quảng trường kỳ thạch'),
	(43, 'Shilianzhidi', 'Shilianzhidi', NULL, NULL, 43, true, 2, 120, 'Vùng đất rèn luyện'),
	(44, 'Xiuluozhanchang', 'Xiuluozhanchang', NULL, NULL, 44, true, 3, 0, 'Chiến trường tula'),
	(51, 'shenmironglu', 'shenmironglu', NULL, NULL, 51, true, 2, 50, 'lò luyện thần khí'),
	(55, 'tripleTownBtn', 'tripleTownBtn', NULL, NULL, 55, true, 3, 0, 'Tiêu trừ hoàn lạc'),
	(58, 'PetRealSoul', 'PetRealSoul', NULL, NULL, 58, true, 2, 80, 'Chân hồn pet'),
	(59, 'mijinglixian', 'mijinglixian', NULL, NULL, 59, true, 2, 50, 'Thám hiểm bí cảnh'),
	(61, 'WarSprite', 'WarSprite', NULL, NULL, 61, true, 2, 80, 'chiến hồn'),
	(63, 'bazhounianqing', 'bazhounianqing', NULL, NULL, 63, true, 3, 0, 'đại tiệc sinh nhật'),
	(64, 'monsterHeart', 'monsterHeart', NULL, NULL, 64, true, 2, 50, 'Ma tâm'),
	(66, 'huannengshuijin', 'huannengshuijin', NULL, NULL, 66, true, 2, 50, 'Pha lê ảo năng'),
	(71, 'baoshijuling', 'baoshijuling', NULL, NULL, 71, true, 2, 100, 'Linh thạch'),
	(75, 'diaokekongjian', 'diaokekongjian', NULL, NULL, 75, true, 2, 80, 'Không gian điêu khắc'),
	(79, 'xiaochudasai', 'xiaochudasai', NULL, NULL, 79, true, 3, 0, 'Đại tiêu trừ'),
	(81, 'huanmotaxiulian', 'huanmotaxiulian', NULL, NULL, 81, true, 2, 50, 'Tu luyện ảo ma'),
	(82, 'moyintuce', 'moyintuce', NULL, NULL, 82, true, 2, 50, 'Bảng khắc'),
	(26, 'Btnshengzhewenzhang', 'Btnshengzhewenzhang', NULL, NULL, 26, true, 2, 80, 'Ấn chương'),
	(24, 'BtnZhenFaXiuLian', 'BtnZhenFaXiuLian', NULL, NULL, 24, true, 4, 1, 'Ma pháp bí trận'),
	(0, 'Daily Activity', 'BtnDailyAct', 'DAILY_ACTIVITY', 'daily_activity', 0, true, 0, 1, NULL),
	(57, 'heiyaoshiZhen', 'heiyaoshiZhen', NULL, NULL, 57, true, 2, 50, 'Hắc diệu thạch'),
	(68, 'qiling', 'qiling', NULL, NULL, 68, true, 2, 160, 'Cầu hồn - kỳ linh'),
	(72, 'tanxianzhexunzhang', 'tanxianzhexunzhang', NULL, NULL, 72, true, 2, 50, 'Thám hiểm'),
	(80, 'texunkecheng', 'texunkecheng', NULL, NULL, 80, true, 2, 50, 'Khoá học huấn luyện'),
	(9, 'BtnNewServerAct', 'BtnNewServerAct', NULL, NULL, 9, true, 0, 1, NULL),
	(12, 'Send Combine', 'BtnSendAct', 'SEND_COMBINE_PANEL', 'send_combine', 12, true, 0, 1, 'Sao Lấp Lánh');


ALTER TABLE data.data_tbl_activity ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

-- \unrestrict J8u9bdPEkIqkGbpBd7gufKsvOm6OpXY3EGr6YrOO4Cmbh8jDnUJJtSvO7DV1On2

