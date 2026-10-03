SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict WHdp2HBQASU5Xj6pHbvDLlYPTuHtExazg18brTSFQCSxFj6HvebYaJUfin0vc9z

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
-- Data for Name: data_tbl_stat_feature; Type: TABLE DATA; Schema: data; Owner: -
--

INSERT INTO data.data_tbl_stat_feature (id, feature_key, name, target_scope, config_table, state_table, state_key, panel_key, primary_rpc, primary_callback, bonus_strategy, bonus_ready, enable, note) VALUES
	(1, 'awakening', 'Awakening', 'character', 'data.data_tbl_awakening', 'player.characters', 'awakenLevel,awakenPoint,awakenPointUsed,awakenPointDict', 'AWAKENING_PANEL', NULL, 'updateAwakening', 'template_level', 1, 1, 'Uses existing character columns plus optional point dictionary state.'),
	(2, 'soul', 'Train Soul', 'character', 'data.data_tbl_soul', 'player.characters', 'trainSoulLvl,trainSoulExp,soulChip', 'TRAIN_SOUL_PANEL', NULL, NULL, 'template_level', 1, 1, 'Uses existing soul columns for level, exp, and point state.'),
	(3, 'mount', 'Mount', 'character', 'data.data_tbl_mount', 'player.character_mounts', 'active mount row', 'MOUNTPANEL_U[0]', NULL, 'onMountOn', 'mount_level_row', 1, 1, 'Uses the active mount row and mount level templates.'),
	(4, 'magic_array', 'Magic Array', 'character', 'data.data_tbl_stars_template', 'player.character_stat_features', 'astrologicData', 'MAGIC_ARRAY_PANEL', NULL, 'onGetAstrologicData', 'stars_now_map', 1, 1, 'Reads astrologicData.starsNow and resolves per type and level.'),
	(5, 'heiyaoshi', 'Heiyaoshi', 'character', NULL, 'player.character_stat_features', 'heiyaoshi', 'HEIYAOSHI_PANEL', NULL, NULL, 'resolved_buff_map', 1, 1, 'Consumes the resolved Buff map directly from persisted player state.'),
	(6, 'stone_seal', 'Stone Seal', 'character', 'data.data_tbl_prs_tree,data.data_tbl_prs_show,data.data_tbl_prs_chip', 'player.character_stat_features', 'stoneSeal', 'STONE_SEAL_PANEL', NULL, 'stoneSealOnEquipChange', 'state_only', 0, 1, 'Reserved for player state and callbacks while formula details remain under research.'),
	(7, 'prs', 'Pet Real Soul', 'character', 'data.data_tbl_prs_tree,data.data_tbl_prs_show,data.data_tbl_prs_chip', 'player.character_stat_features', 'prs', 'PANEL_PET_REAl_SOUL', NULL, 'updatePRSPanel', 'prs_template_ids', 1, 1, 'Applies PRS tree or show ids when they are present in persisted state.'),
	(8, 'medal', 'Medal', 'character', 'data.data_tbl_medal', 'player.character_stat_features', 'medal', 'MEDAL_PANEL', NULL, 'onUpMedal', 'template_id', 1, 1, 'Applies medal template bonuses when the persisted state includes a medal template id.'),
	(9, 'explorer_medal', 'Explorer Medal', 'character', 'data.data_tbl_explorer_medal', 'player.character_stat_features', 'explorerMedalInfo', 'EXPLORER_MEDAL_PANEL', NULL, 'updateEMPanel', 'info_string', 1, 1, 'Parses the explorerMedalInfo string and resolves the medal template.'),
	(10, 'war_sprite', 'War Sprite', 'character', 'data.data_tbl_war_sprite', 'player.character_stat_features', 'warSprite', 'WAR_SPRITE_PANEL', NULL, 'updateWSPPanel', 'template_map', 1, 1, 'Aggregates both wObj and bObj template maps from persisted state.'),
	(11, 'monster_heart', 'Monster Heart', 'character', 'data.data_tbl_creatureh_heart,data.data_tbl_creatureh_combine,data.data_tbl_creatureh_contain,data.data_tbl_creatureh_point', 'player.character_stat_features', 'monsterHeart', 'MONSTER_HEART_PANEL', NULL, NULL, 'state_only', 0, 1, 'State persistence is ready; full stat resolution still needs formula research.'),
	(12, 'active_pet', 'Active Pet Collection', 'character', NULL, 'player.character_stat_features', 'activePetData', 'ACTIVE_PET_PANEL', NULL, NULL, 'state_only', 0, 1, 'Persists the root login payload state expected by the client collection UI.'),
	(13, 'contract_pet', 'Contract Pet', 'character', NULL, 'player.character_stat_features', 'contractPet', 'CONTRACT_PET_PANEL', NULL, NULL, 'state_only', 0, 1, 'Persists contract pet training state for future server-side formulas.'),
	(14, 'pet_talent', 'Pet Talent', 'pet', 'data.data_tbl_pet_talent', 'player.pet_stat_features', 'petTalent', 'PANEL_PET_TALENT', NULL, 'onFillOrTakeOffTalentStone', 'slotted_template_ids', 1, 1, 'Reads equipped talent slots and applies the referenced talent templates.'),
	(15, 'pet_stone', 'Pet Stone', 'pet', 'data.data_tbl_pet_stone', 'player.pet_stat_features', 'petStone', 'PANEL_PET_STONE', NULL, 'updatePetStoneBagData', 'slotted_template_ids', 1, 1, 'Reads equipped pet stone slots and applies the referenced stone templates.'),
	(16, 'magic_crystal', 'Pháp Tinh', 'character', NULL, 'player.character_stat_features', 'magicCrystalData', 'magicCrystal', 'initMagicCrystalData', 'onInitMagicCrystalData', 'state_only', 1, 1, 'Magic Crystal panel state (16 slots; bonus mirrors GamePredef.MAGIC_CRYSTAL_UP catalog).'),
	(17, 'stars', 'Cung Hoàng Đạo', 'character', NULL, 'player.character_stat_features', 'starsData', 'charactor', 'beginStarLvUp', 'onBeginStarLvUp', 'state_only', 0, 1, 'Character zodiac star upgrade state. Phase K2 scaffolding only — RPC handlers + bonus strategy not yet wired (see docs/research/2026-05-05_02_STAR_SUBSYSTEM_RESEARCH.md).');


--
-- PostgreSQL database dump complete
--

-- \unrestrict WHdp2HBQASU5Xj6pHbvDLlYPTuHtExazg18brTSFQCSxFj6HvebYaJUfin0vc9z


SET session_replication_role = origin;

