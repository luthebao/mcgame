


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA IF NOT EXISTS "data";


ALTER SCHEMA "data" OWNER TO "postgres";


CREATE SCHEMA IF NOT EXISTS "player";


ALTER SCHEMA "player" OWNER TO "postgres";


CREATE SCHEMA IF NOT EXISTS "public";


ALTER SCHEMA "public" OWNER TO "pg_database_owner";


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE OR REPLACE FUNCTION "public"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_updated_at_column"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_achievement" (
    "id" integer NOT NULL,
    "award" numeric NOT NULL,
    "check" numeric NOT NULL,
    "color" numeric NOT NULL,
    "desc" "text",
    "description" "text",
    "detail" "text",
    "enable" numeric NOT NULL,
    "is_award" numeric,
    "kind" numeric NOT NULL,
    "name" "text",
    "position" numeric NOT NULL,
    "repeat_type" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_achievement" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_achievement_require" (
    "id" integer NOT NULL,
    "aid" numeric NOT NULL,
    "name" "text",
    "num" numeric NOT NULL,
    "show_type" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_achievement_require" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_answer" (
    "id" integer NOT NULL,
    "a" "text",
    "b" "text",
    "c" "text",
    "d" "text",
    "r" "text",
    "t" "text"
);


ALTER TABLE "data"."data_tbl_answer" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_artifact" (
    "id" integer NOT NULL,
    "item_num" numeric NOT NULL,
    "level" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "rate" numeric NOT NULL,
    "spirit_num" numeric NOT NULL,
    "tid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_artifact" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_awakening" (
    "id" integer NOT NULL,
    "item_num" numeric NOT NULL,
    "money" numeric NOT NULL,
    "name" "text",
    "points" numeric NOT NULL,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "rate" numeric NOT NULL,
    "req_level" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_awakening" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_awakening_skill" (
    "id" integer NOT NULL,
    "cost_points" numeric NOT NULL,
    "description" "text",
    "icon_code" numeric NOT NULL,
    "max_level" numeric NOT NULL,
    "name" "text",
    "position" numeric NOT NULL,
    "req_class" numeric NOT NULL,
    "req_points" numeric NOT NULL,
    "skill_code_name" "text"
);


ALTER TABLE "data"."data_tbl_awakening_skill" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_buff" (
    "id" integer NOT NULL,
    "buff" numeric NOT NULL,
    "code_name" "text",
    "description" "text",
    "effect_num" numeric NOT NULL,
    "effect_time" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "level" numeric NOT NULL,
    "name" "text",
    "percent_flag" numeric NOT NULL,
    "prop1" numeric,
    "prop2" numeric,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop5" numeric,
    "prop6" numeric,
    "prop_num1" numeric,
    "prop_num2" numeric,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "prop_num5" numeric,
    "prop_num6" numeric,
    "state" numeric NOT NULL,
    "target_type" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_buff" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_building" (
    "id" integer NOT NULL,
    "code_name" "text",
    "description" "text",
    "exp_cost" numeric NOT NULL,
    "func_script" "text",
    "gen_m_cost" numeric NOT NULL,
    "gold_cost" numeric NOT NULL,
    "icon_code" numeric,
    "icon_code_small" numeric NOT NULL,
    "level" numeric NOT NULL,
    "maintain_cost" numeric NOT NULL,
    "money_cost" numeric NOT NULL,
    "name" "text",
    "num_limit" numeric NOT NULL,
    "percent_flag" numeric NOT NULL,
    "post_building" numeric,
    "pre_building" "text",
    "prop1" numeric NOT NULL,
    "prop1_value" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop2_value" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop3_value" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop4_value" numeric NOT NULL,
    "rare_m_cost" numeric NOT NULL,
    "require_script" numeric,
    "res_code" numeric NOT NULL,
    "sp_m_cost" numeric,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_building" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_carve" (
    "id" integer NOT NULL,
    "costkp" numeric NOT NULL,
    "icon" numeric NOT NULL,
    "lev" numeric NOT NULL,
    "p" numeric NOT NULL,
    "part" numeric NOT NULL,
    "pv" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_carve" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_carve_award" (
    "id" integer NOT NULL,
    "award" numeric NOT NULL,
    "free_exchagne" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "lev" numeric NOT NULL,
    "pay_exchange_time" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_carve_award" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_carve_master" (
    "id" integer NOT NULL,
    "p1" numeric NOT NULL,
    "p2" numeric NOT NULL,
    "p3" numeric NOT NULL,
    "p4" numeric NOT NULL,
    "p5" numeric NOT NULL,
    "pv1" numeric NOT NULL,
    "pv2" numeric NOT NULL,
    "pv3" numeric NOT NULL,
    "pv4" numeric NOT NULL,
    "pv5" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_carve_master" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_class" (
    "id" integer NOT NULL,
    "apt_agility" numeric NOT NULL,
    "apt_energy" numeric NOT NULL,
    "apt_intelligence" numeric NOT NULL,
    "apt_stamina" numeric NOT NULL,
    "apt_strength" numeric NOT NULL,
    "att_agility" numeric NOT NULL,
    "att_energy" numeric NOT NULL,
    "att_intelligence" numeric NOT NULL,
    "att_stamina" numeric NOT NULL,
    "att_strength" numeric NOT NULL,
    "bright_code" numeric NOT NULL,
    "class_description" "text",
    "color_code_female1" numeric NOT NULL,
    "color_code_female2" numeric NOT NULL,
    "color_code_female3" numeric NOT NULL,
    "color_code_male1" numeric NOT NULL,
    "color_code_male2" numeric NOT NULL,
    "color_code_male3" numeric NOT NULL,
    "description_female" "text",
    "description_male" "text",
    "icon_code_female" numeric NOT NULL,
    "icon_code_male" numeric NOT NULL,
    "img_code_female" numeric NOT NULL,
    "img_code_male" numeric NOT NULL,
    "large_img_female" numeric NOT NULL,
    "large_img_male" numeric NOT NULL,
    "name" "text",
    "res_code_female" numeric NOT NULL,
    "res_code_female2" numeric NOT NULL,
    "res_code_male" numeric NOT NULL,
    "res_code_male2" numeric NOT NULL,
    "school_description" "text",
    "start_item" numeric,
    "start_skill" "text"
);


ALTER TABLE "data"."data_tbl_class" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creature" (
    "id" integer NOT NULL,
    "aiid" numeric,
    "apt_agility" numeric NOT NULL,
    "apt_energy" numeric NOT NULL,
    "apt_intelligence" numeric NOT NULL,
    "apt_stamina" numeric NOT NULL,
    "apt_strength" numeric NOT NULL,
    "att_agility" numeric NOT NULL,
    "att_energy" numeric NOT NULL,
    "att_intelligence" numeric NOT NULL,
    "att_luck" numeric NOT NULL,
    "att_stamina" numeric NOT NULL,
    "att_strength" numeric NOT NULL,
    "bright_code" numeric NOT NULL,
    "catchable" numeric NOT NULL,
    "class_id" numeric NOT NULL,
    "class_ids" numeric NOT NULL,
    "color_code" numeric NOT NULL,
    "element" numeric NOT NULL,
    "grow_base" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "is_bind" numeric NOT NULL,
    "life" numeric NOT NULL,
    "msg" "text",
    "name" "text",
    "prop_combo" numeric NOT NULL,
    "prop_counter" numeric NOT NULL,
    "prop_critical" numeric NOT NULL,
    "prop_defy" numeric NOT NULL,
    "prop_dodge" numeric NOT NULL,
    "prop_hit" numeric NOT NULL,
    "prop_reborn" numeric NOT NULL,
    "prop_speed" numeric NOT NULL,
    "q_level" numeric NOT NULL,
    "res_code" numeric NOT NULL,
    "resi_defy" numeric,
    "show_able" numeric NOT NULL,
    "skill" "text",
    "use_lv" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_creature" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creature_handbook" (
    "id" integer NOT NULL,
    "active_num1" numeric NOT NULL,
    "active_num2" numeric,
    "active_num3" numeric,
    "active_num4" numeric,
    "class_id" numeric NOT NULL,
    "discription" "text",
    "evolution_id" numeric,
    "mid" numeric,
    "name" "text",
    "percent_flag" numeric NOT NULL,
    "prop_num" numeric,
    "prop_type" numeric,
    "relate_id" numeric NOT NULL,
    "skill_id1" numeric,
    "skill_id2" numeric,
    "skill_id3" numeric,
    "skill_id4" numeric
);


ALTER TABLE "data"."data_tbl_creature_handbook" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creature_loot" (
    "id" integer NOT NULL,
    "b" numeric NOT NULL,
    "cid" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "qid" numeric NOT NULL,
    "quality" numeric NOT NULL,
    "rate" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_creature_loot" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creature_skill" (
    "id" integer NOT NULL,
    "cid" numeric NOT NULL,
    "position" numeric,
    "sid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_creature_skill" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creatureh_combine" (
    "id" integer NOT NULL,
    "dis_play" numeric NOT NULL,
    "line_combine" "text",
    "max_num" numeric NOT NULL,
    "name" "text",
    "p_num1" numeric NOT NULL,
    "p_num2" numeric NOT NULL,
    "p_num3" numeric NOT NULL,
    "pid_combine" "text",
    "prop_type1" numeric NOT NULL,
    "prop_type2" numeric NOT NULL,
    "prop_type3" numeric NOT NULL,
    "type_combine" "text"
);


ALTER TABLE "data"."data_tbl_creatureh_combine" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creatureh_contain" (
    "id" integer NOT NULL,
    "exp" numeric NOT NULL,
    "gold_num" numeric NOT NULL,
    "line" "text",
    "name" "text",
    "num" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_creatureh_contain" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creatureh_heart" (
    "id" integer NOT NULL,
    "color" numeric NOT NULL,
    "desc" "text",
    "exp" numeric NOT NULL,
    "heart_talent" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "name" "text",
    "prop_type" numeric NOT NULL,
    "propnum" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_creatureh_heart" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_creatureh_point" (
    "id" integer NOT NULL,
    "combine" "text",
    "goldnum" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "link_line" "text",
    "num" numeric NOT NULL,
    "quality" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_creatureh_point" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_credit" (
    "id" integer NOT NULL,
    "bind" numeric NOT NULL,
    "c_num1" numeric NOT NULL,
    "c_num2" numeric NOT NULL,
    "c_type1" numeric NOT NULL,
    "c_type2" numeric NOT NULL,
    "is_sell" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "limit_num" numeric NOT NULL,
    "limit_type" numeric NOT NULL,
    "position" numeric NOT NULL,
    "quality" numeric NOT NULL,
    "shop_id" numeric NOT NULL,
    "tab" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_credit" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_deco_hole" (
    "id" integer NOT NULL,
    "cost_num" numeric NOT NULL,
    "cost_sil" numeric NOT NULL,
    "level" numeric NOT NULL,
    "next_id" numeric NOT NULL,
    "num" numeric NOT NULL,
    "per" numeric NOT NULL,
    "position" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "prop_type1" numeric NOT NULL,
    "prop_type2" numeric NOT NULL,
    "prop_type3" numeric NOT NULL,
    "prop_type4" numeric NOT NULL,
    "rate" numeric NOT NULL,
    "target_type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_deco_hole" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_deco_rune" (
    "id" integer NOT NULL,
    "can_exchange" numeric NOT NULL,
    "chip_id" numeric NOT NULL,
    "exp" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "level" numeric NOT NULL,
    "name" "text",
    "next_id" numeric NOT NULL,
    "per" numeric NOT NULL,
    "prop_num" numeric NOT NULL,
    "prop_type" numeric NOT NULL,
    "qulity" numeric NOT NULL,
    "type" numeric NOT NULL,
    "up_exp" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_deco_rune" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_deco_show" (
    "id" integer NOT NULL,
    "active_gold" numeric NOT NULL,
    "description" "text",
    "icon_code" numeric NOT NULL,
    "link_id" numeric NOT NULL,
    "link_suit_id" numeric NOT NULL,
    "name" "text",
    "per" numeric NOT NULL,
    "position" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "prop_type1" numeric NOT NULL,
    "prop_type2" numeric NOT NULL,
    "prop_type3" numeric NOT NULL,
    "prop_type4" numeric NOT NULL,
    "res_code1" numeric,
    "res_code2" numeric,
    "res_code3" numeric NOT NULL,
    "res_code4" numeric NOT NULL,
    "res_code5" numeric NOT NULL,
    "res_code6" numeric NOT NULL,
    "suit_id" numeric NOT NULL,
    "t" numeric NOT NULL,
    "target_type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_deco_show" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_diary" (
    "id" integer NOT NULL,
    "act" numeric NOT NULL,
    "info" "text",
    "link_type" numeric NOT NULL,
    "max" numeric NOT NULL,
    "name" "text",
    "nid" numeric NOT NULL,
    "pos" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_diary" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_dress" (
    "id" integer NOT NULL,
    "color" numeric NOT NULL,
    "equipt_id" numeric NOT NULL,
    "is_open" numeric NOT NULL,
    "name" "text",
    "num1" numeric NOT NULL,
    "num2" numeric NOT NULL,
    "position" numeric NOT NULL,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "recipe_id" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_dress" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_equipt_suit" (
    "id" integer NOT NULL,
    "name" "text",
    "si_code_name" "text",
    "skill_description" "text",
    "suit_prop1" numeric NOT NULL,
    "suit_prop2" numeric NOT NULL,
    "suit_prop3" numeric NOT NULL,
    "suit_prop4" numeric NOT NULL,
    "suit_prop5" numeric NOT NULL,
    "suit_prop_num1" numeric NOT NULL,
    "suit_prop_num2" numeric NOT NULL,
    "suit_prop_num3" numeric NOT NULL,
    "suit_prop_num4" numeric NOT NULL,
    "suit_prop_num5" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_equipt_suit" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_equipt_template" (
    "id" integer NOT NULL,
    "active_equip_id" numeric NOT NULL,
    "active_prop_num" numeric NOT NULL,
    "active_prop_type" numeric NOT NULL,
    "artifact_skill" "text",
    "bind_prop_num" numeric NOT NULL,
    "bind_type" numeric,
    "bright_code" numeric NOT NULL,
    "color" numeric NOT NULL,
    "color_code" numeric,
    "description" "text",
    "endure_max" numeric NOT NULL,
    "gold" numeric NOT NULL,
    "hole_num" numeric NOT NULL,
    "honor" numeric,
    "icon_code" numeric NOT NULL,
    "info" "text",
    "is_test" numeric NOT NULL,
    "item_level" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "main_prop1" numeric NOT NULL,
    "main_prop2" numeric NOT NULL,
    "main_prop_num1" numeric NOT NULL,
    "main_prop_num2" numeric NOT NULL,
    "makable" numeric NOT NULL,
    "name" "text",
    "next_equ_tid" numeric NOT NULL,
    "position" numeric NOT NULL,
    "price" numeric NOT NULL,
    "pro_time" numeric,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "repairable" numeric NOT NULL,
    "req_class" "text",
    "req_class_id" "text",
    "req_level" numeric NOT NULL,
    "require_item1" numeric NOT NULL,
    "require_item2" numeric NOT NULL,
    "require_item3" numeric NOT NULL,
    "require_num1" numeric NOT NULL,
    "require_num2" numeric NOT NULL,
    "require_num3" numeric NOT NULL,
    "res_code" numeric,
    "res_code_female" numeric,
    "res_code_female2" numeric,
    "res_code_male" numeric,
    "res_code_male2" numeric,
    "single_flag" numeric,
    "stack_max" numeric NOT NULL,
    "succ_rate" numeric NOT NULL,
    "suit_id" numeric NOT NULL,
    "t" numeric NOT NULL,
    "tradable" numeric NOT NULL,
    "type" numeric NOT NULL,
    "use_type" numeric NOT NULL,
    "wav_code" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_equipt_template" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_explorer_medal" (
    "id" integer NOT NULL,
    "cost" numeric NOT NULL,
    "cost_gold" numeric NOT NULL,
    "name" "text",
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "prop_num5" numeric NOT NULL,
    "prop_num6" numeric NOT NULL,
    "prop_num7" numeric NOT NULL,
    "prop_num8" numeric NOT NULL,
    "prop_type1" numeric NOT NULL,
    "prop_type2" numeric NOT NULL,
    "prop_type3" numeric NOT NULL,
    "prop_type4" numeric NOT NULL,
    "prop_type5" numeric NOT NULL,
    "prop_type6" numeric NOT NULL,
    "prop_type7" numeric NOT NULL,
    "prop_type8" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_explorer_medal" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_extend_position" (
    "id" integer NOT NULL,
    "build_type" numeric NOT NULL,
    "layer" numeric NOT NULL,
    "mid" numeric NOT NULL,
    "pos_dir" numeric NOT NULL,
    "pos_x" numeric NOT NULL,
    "pos_y" numeric NOT NULL,
    "tid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_extend_position" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_fairy_tempalte" (
    "id" integer NOT NULL,
    "agi" numeric NOT NULL,
    "agi_g" numeric NOT NULL,
    "cc" numeric NOT NULL,
    "ener" numeric NOT NULL,
    "ener_g" numeric NOT NULL,
    "inte" numeric NOT NULL,
    "inte_g" numeric NOT NULL,
    "name" "text",
    "rc" numeric NOT NULL,
    "sta" numeric NOT NULL,
    "sta_g" numeric NOT NULL,
    "ste" numeric NOT NULL,
    "ste_g" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_fairy_tempalte" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_feast" (
    "id" integer NOT NULL,
    "at" "text",
    "aw" numeric NOT NULL,
    "inf" "text",
    "na" "text"
);


ALTER TABLE "data"."data_tbl_feast" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_guide" (
    "id" integer NOT NULL,
    "find_npc_id" numeric NOT NULL,
    "finish_type" numeric NOT NULL,
    "level" numeric NOT NULL,
    "mouse_x" numeric NOT NULL,
    "mouse_y" numeric NOT NULL,
    "prompt_text" "text",
    "prompt_type" numeric NOT NULL,
    "reference" numeric NOT NULL,
    "sc_npcid" numeric NOT NULL,
    "sc_other_id" numeric NOT NULL,
    "sc_pid" numeric NOT NULL,
    "sc_qname" "text",
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_guide" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_item_template" (
    "id" integer NOT NULL,
    "bind_type" numeric NOT NULL,
    "color" numeric NOT NULL,
    "color_code" numeric NOT NULL,
    "description" "text",
    "gold" numeric NOT NULL,
    "honor" numeric NOT NULL,
    "i1" numeric NOT NULL,
    "i2" numeric NOT NULL,
    "i3" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "info" "text",
    "is_test" numeric NOT NULL,
    "item_level" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "level" numeric NOT NULL,
    "makable" numeric NOT NULL,
    "n1" numeric NOT NULL,
    "n2" numeric NOT NULL,
    "n3" numeric NOT NULL,
    "name" "text",
    "next_jewel_tid" numeric NOT NULL,
    "price" numeric NOT NULL,
    "prop_type" numeric NOT NULL,
    "propl_num" numeric NOT NULL,
    "req_class" "text",
    "req_level" numeric NOT NULL,
    "res_code" numeric,
    "single_flag" numeric NOT NULL,
    "skill_id" numeric NOT NULL,
    "stack_max" numeric NOT NULL,
    "t" numeric NOT NULL,
    "tradable" numeric NOT NULL,
    "type" numeric NOT NULL,
    "use_type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_item_template" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_map" (
    "id" integer NOT NULL,
    "air_safe" numeric NOT NULL,
    "basic_battle_rate" numeric NOT NULL,
    "basic_max_num" numeric NOT NULL,
    "basic_min_num" numeric NOT NULL,
    "bright_code" numeric NOT NULL,
    "cl" "text",
    "color_code" numeric NOT NULL,
    "copy_flag" numeric NOT NULL,
    "dead" numeric NOT NULL,
    "exp_multi" numeric NOT NULL,
    "flyable" numeric NOT NULL,
    "g" numeric NOT NULL,
    "height" numeric NOT NULL,
    "info" "text",
    "land" numeric NOT NULL,
    "last_edit_time" numeric,
    "level" numeric NOT NULL,
    "lv" numeric NOT NULL,
    "m" numeric NOT NULL,
    "m_map" numeric NOT NULL,
    "name" "text",
    "pk" numeric NOT NULL,
    "pl_battle" "text",
    "pl_product" "text",
    "res_code" numeric NOT NULL,
    "s_area" "text",
    "s_map" numeric NOT NULL,
    "safe_flag" numeric NOT NULL,
    "safe_x" numeric NOT NULL,
    "safe_y" numeric NOT NULL,
    "t" numeric NOT NULL,
    "type" numeric NOT NULL,
    "width" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_map" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_map_cell" (
    "id" integer NOT NULL,
    "mid" numeric NOT NULL,
    "pos_x" numeric NOT NULL,
    "pos_y" numeric NOT NULL,
    "res_code" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_map_cell" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_map_creature" (
    "id" integer NOT NULL,
    "battle_mode" numeric NOT NULL,
    "boss_flag" numeric NOT NULL,
    "cid" numeric NOT NULL,
    "end_rate" numeric NOT NULL,
    "exp" numeric NOT NULL,
    "exp_multi" numeric NOT NULL,
    "exp_set" numeric NOT NULL,
    "level" numeric NOT NULL,
    "mid" numeric NOT NULL,
    "q_level" numeric NOT NULL,
    "start_rate" numeric NOT NULL,
    "unique_flag" numeric NOT NULL,
    "with_cloud" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_map_creature" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_maze" (
    "id" integer NOT NULL,
    "description" "text",
    "max" numeric NOT NULL,
    "min" numeric NOT NULL,
    "name" "text",
    "rate" numeric NOT NULL,
    "result_script" "text"
);


ALTER TABLE "data"."data_tbl_maze" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_medal" (
    "id" integer NOT NULL,
    "basic_tid" numeric,
    "clevel" numeric NOT NULL,
    "desc" "text",
    "exp" numeric,
    "icon_code" numeric NOT NULL,
    "join_tid" "text",
    "level" numeric NOT NULL,
    "name" "text",
    "preflag" numeric,
    "prop_type" numeric NOT NULL,
    "prop_val" numeric NOT NULL,
    "q" numeric NOT NULL,
    "sid" numeric NOT NULL,
    "up_exp" numeric
);


ALTER TABLE "data"."data_tbl_medal" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mevent_map" (
    "id" integer NOT NULL,
    "mevent_id" numeric NOT NULL,
    "pos" "text"
);


ALTER TABLE "data"."data_tbl_mevent_map" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mevent_type" (
    "id" integer NOT NULL,
    "name" "text",
    "npc_id" numeric NOT NULL,
    "tip" "text",
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mevent_type" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mineral_template" (
    "id" integer NOT NULL,
    "act_pnt" numeric NOT NULL,
    "color_code" numeric NOT NULL,
    "description" "text",
    "icon_code" numeric NOT NULL,
    "money" numeric NOT NULL,
    "name" "text",
    "num" numeric NOT NULL,
    "res_code1" numeric NOT NULL,
    "res_code2" numeric NOT NULL,
    "tid" numeric NOT NULL,
    "time" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mineral_template" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mount" (
    "id" integer NOT NULL,
    "add_rate" numeric,
    "debuff_basic" numeric NOT NULL,
    "debuff_per" numeric NOT NULL,
    "dress_id" numeric NOT NULL,
    "exp" numeric NOT NULL,
    "item_num" numeric,
    "level" numeric NOT NULL,
    "life_basic" numeric NOT NULL,
    "life_per" numeric NOT NULL,
    "mag_attack_basic" numeric NOT NULL,
    "mag_attack_per" numeric NOT NULL,
    "mag_defense_basic" numeric NOT NULL,
    "mag_defense_per" numeric NOT NULL,
    "mount_lev_limit" numeric NOT NULL,
    "phy_attack_basic" numeric NOT NULL,
    "phy_attack_per" numeric NOT NULL,
    "phy_defense_basic" numeric NOT NULL,
    "phy_defense_per" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mount" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mount_dress" (
    "id" integer NOT NULL,
    "debuff_basic" numeric NOT NULL,
    "debuff_per" numeric NOT NULL,
    "description" numeric,
    "effective_time" numeric NOT NULL,
    "gold" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "life_basic" numeric NOT NULL,
    "life_per" numeric NOT NULL,
    "mag_attack_basic" numeric NOT NULL,
    "mag_attack_per" numeric NOT NULL,
    "mag_defense_basic" numeric NOT NULL,
    "mag_defense_per" numeric NOT NULL,
    "name" "text",
    "phy_attack_basic" numeric NOT NULL,
    "phy_attack_per" numeric NOT NULL,
    "phy_defense_basic" numeric NOT NULL,
    "phy_defense_per" numeric NOT NULL,
    "res_code" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mount_dress" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mystre" (
    "id" integer NOT NULL,
    "icon_code" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "level" numeric NOT NULL,
    "mys_sil" numeric NOT NULL,
    "name" "text",
    "per" numeric NOT NULL,
    "prop_num" numeric NOT NULL,
    "prop_type" numeric NOT NULL,
    "star" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mystre" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mystre_recipe" (
    "id" integer NOT NULL,
    "icon_code" numeric NOT NULL,
    "level" numeric NOT NULL,
    "n1" numeric NOT NULL,
    "n2" numeric NOT NULL,
    "n3" numeric NOT NULL,
    "n4" numeric NOT NULL,
    "n5" numeric NOT NULL,
    "n6" numeric NOT NULL,
    "name" "text",
    "q1" numeric NOT NULL,
    "q2" numeric NOT NULL,
    "q3" numeric NOT NULL,
    "q4" numeric NOT NULL,
    "q5" numeric NOT NULL,
    "q6" numeric NOT NULL,
    "st" "text",
    "t1" numeric NOT NULL,
    "t2" numeric NOT NULL,
    "t3" numeric NOT NULL,
    "t4" numeric NOT NULL,
    "t5" numeric NOT NULL,
    "t6" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mystre_recipe" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mytc_detail" (
    "id" integer NOT NULL,
    "c1" "text",
    "c2" "text",
    "c3" "text",
    "c4" "text",
    "c5" "text",
    "c6" "text",
    "cost" numeric NOT NULL,
    "lev" numeric NOT NULL,
    "tid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_mytc_detail" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_mytc_suit" (
    "id" integer NOT NULL,
    "m1" numeric NOT NULL,
    "m2" numeric NOT NULL,
    "m3" numeric NOT NULL,
    "name" "text"
);


ALTER TABLE "data"."data_tbl_mytc_suit" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_name_lib" (
    "id" integer NOT NULL,
    "name" "text",
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_name_lib" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_npc" (
    "id" integer NOT NULL,
    "at" "text",
    "bright_code" numeric,
    "class_id" numeric NOT NULL,
    "color_code" numeric NOT NULL,
    "fd" numeric,
    "func_info" "text",
    "icon_code" numeric NOT NULL,
    "item" "text",
    "layer" numeric,
    "lk" numeric,
    "lv" numeric NOT NULL,
    "mini_map" numeric,
    "mirror" numeric NOT NULL,
    "name" "text",
    "news_off" numeric,
    "news_on" numeric,
    "num" numeric NOT NULL,
    "on_service_text" "text",
    "pos_dir" numeric NOT NULL,
    "pos_map_id" numeric,
    "pos_x" numeric NOT NULL,
    "pos_y" numeric NOT NULL,
    "qid" "text",
    "rand_off" numeric,
    "res_code" numeric NOT NULL,
    "rf" numeric NOT NULL,
    "script_off" "text",
    "shop_id" numeric,
    "skill" numeric,
    "sub_type" "text",
    "together" numeric,
    "type" numeric NOT NULL,
    "v" numeric
);


ALTER TABLE "data"."data_tbl_npc" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_npc_creature" (
    "id" integer NOT NULL,
    "boss_flag" numeric NOT NULL,
    "cid" numeric NOT NULL,
    "end_rate" numeric NOT NULL,
    "exp" numeric NOT NULL,
    "exp_multi" numeric NOT NULL,
    "exp_set" numeric NOT NULL,
    "level" numeric NOT NULL,
    "nid" numeric NOT NULL,
    "q_level" numeric NOT NULL,
    "start_rate" numeric NOT NULL,
    "unique_flag" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_npc_creature" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_npc_skill" (
    "id" integer NOT NULL,
    "nid" numeric NOT NULL,
    "position" numeric,
    "sid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_npc_skill" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_pet_contract" (
    "id" integer NOT NULL,
    "extra_num1" numeric NOT NULL,
    "extra_num2" numeric NOT NULL,
    "extra_num3" numeric NOT NULL,
    "extra_num4" numeric NOT NULL,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "req_exp" numeric NOT NULL,
    "req_num" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_pet_contract" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_pet_guard" (
    "id" integer NOT NULL,
    "cost_type" numeric NOT NULL,
    "desc" numeric,
    "gold" numeric NOT NULL,
    "lev" numeric NOT NULL,
    "num" numeric NOT NULL,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop_val1" numeric NOT NULL,
    "prop_val2" numeric NOT NULL,
    "prop_val3" numeric NOT NULL,
    "prop_val4" numeric NOT NULL,
    "sid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_pet_guard" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_pet_soul" (
    "id" integer NOT NULL,
    "chip" numeric NOT NULL,
    "color" numeric NOT NULL,
    "desc" "text",
    "exp" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "level" numeric NOT NULL,
    "name" "text",
    "price" numeric NOT NULL,
    "prop_type" numeric NOT NULL,
    "prop_val" numeric,
    "req_chip" numeric NOT NULL,
    "type" numeric NOT NULL,
    "up_exp" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_pet_soul" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_pet_stone" (
    "id" integer NOT NULL,
    "cost_sil" numeric NOT NULL,
    "energy_flag" numeric NOT NULL,
    "energy_id" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "level" numeric NOT NULL,
    "name" "text",
    "next_id" numeric NOT NULL,
    "prop_num" numeric NOT NULL,
    "prop_type" numeric NOT NULL,
    "resolve_num" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_pet_stone" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_pet_talent" (
    "id" integer NOT NULL,
    "basic_tid" numeric NOT NULL,
    "desc" "text",
    "exp" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "lv" numeric NOT NULL,
    "name" "text",
    "p" numeric NOT NULL,
    "preflag" numeric NOT NULL,
    "prop_type" numeric NOT NULL,
    "prop_val" numeric NOT NULL,
    "rlv" numeric NOT NULL,
    "sid" numeric NOT NULL,
    "up_exp" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_pet_talent" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_plan" (
    "id" integer NOT NULL,
    "b" numeric NOT NULL,
    "ii" numeric NOT NULL,
    "n" numeric NOT NULL,
    "p" numeric NOT NULL,
    "q" numeric NOT NULL,
    "qid" numeric NOT NULL,
    "r" numeric NOT NULL,
    "st" "text",
    "t" numeric NOT NULL,
    "ti" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_plan" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_pm_right" (
    "id" integer NOT NULL,
    "count_config" "text",
    "desc" "text",
    "desc2" "text",
    "sort_index" numeric NOT NULL,
    "type" numeric NOT NULL,
    "value1" numeric,
    "value2" numeric,
    "value3" numeric,
    "value4" numeric,
    "value5" numeric,
    "value6" numeric,
    "value7" numeric,
    "value8" numeric,
    "value9" numeric,
    "vip1" numeric NOT NULL,
    "vip2" numeric NOT NULL,
    "vip3" numeric NOT NULL,
    "vip4" numeric NOT NULL,
    "vip5" numeric NOT NULL,
    "vip6" numeric NOT NULL,
    "vip7" numeric NOT NULL,
    "vip8" numeric NOT NULL,
    "vip9" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_pm_right" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_prs_chip" (
    "id" integer NOT NULL,
    "cost_crystal" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "name" "text",
    "position" numeric NOT NULL,
    "show_id" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_prs_chip" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_prs_show" (
    "id" integer NOT NULL,
    "limit_time" numeric NOT NULL,
    "limit_type" numeric NOT NULL,
    "name" "text",
    "need_chip_id" numeric NOT NULL,
    "need_num" numeric NOT NULL,
    "p_n1" numeric NOT NULL,
    "p_n2" numeric NOT NULL,
    "p_n3" numeric NOT NULL,
    "p_n4" numeric NOT NULL,
    "p_n5" numeric NOT NULL,
    "p_n6" numeric NOT NULL,
    "p_n7" numeric NOT NULL,
    "p_n8" numeric NOT NULL,
    "p_t1" numeric NOT NULL,
    "p_t2" numeric NOT NULL,
    "p_t3" numeric NOT NULL,
    "p_t4" numeric NOT NULL,
    "p_t5" numeric NOT NULL,
    "p_t6" numeric NOT NULL,
    "p_t7" numeric NOT NULL,
    "p_t8" numeric NOT NULL,
    "position" numeric NOT NULL,
    "res_code" numeric NOT NULL,
    "tab" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_prs_show" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_prs_tree" (
    "id" integer NOT NULL,
    "cost_stone" numeric NOT NULL,
    "level" numeric NOT NULL,
    "next_id" numeric NOT NULL,
    "p_n1" numeric NOT NULL,
    "p_n2" numeric NOT NULL,
    "p_n3" numeric NOT NULL,
    "p_n4" numeric NOT NULL,
    "p_n5" numeric NOT NULL,
    "p_n6" numeric NOT NULL,
    "p_n7" numeric NOT NULL,
    "p_n8" numeric NOT NULL,
    "p_t1" numeric NOT NULL,
    "p_t2" numeric NOT NULL,
    "p_t3" numeric NOT NULL,
    "p_t4" numeric NOT NULL,
    "p_t5" numeric NOT NULL,
    "p_t6" numeric NOT NULL,
    "p_t7" numeric NOT NULL,
    "p_t8" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_prs_tree" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_quest" (
    "id" integer NOT NULL,
    "a_script_text" "text",
    "at" numeric NOT NULL,
    "award_exp_re" numeric,
    "color" numeric NOT NULL,
    "complete_text" "text",
    "finish_npc" numeric NOT NULL,
    "gender" numeric NOT NULL,
    "info" "text",
    "is_rebirth" numeric,
    "lm" numeric NOT NULL,
    "max_level" numeric NOT NULL,
    "min_level" numeric NOT NULL,
    "money_num" numeric NOT NULL,
    "money_type" numeric NOT NULL,
    "name" "text",
    "pre_quest_type" numeric NOT NULL,
    "qtest" "text",
    "req_class" "text",
    "rn" numeric NOT NULL,
    "rt" numeric NOT NULL,
    "script_give_up" "text",
    "start_npc" numeric NOT NULL,
    "start_text" "text",
    "sub_type" "text",
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_quest" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_quest_award" (
    "id" integer NOT NULL,
    "b" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "kind" numeric,
    "num" numeric,
    "q" numeric NOT NULL,
    "qid" numeric,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_quest_award" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_quest_loop" (
    "id" integer NOT NULL,
    "info" "text",
    "max_level" numeric NOT NULL,
    "min_level" numeric NOT NULL,
    "name" "text",
    "nid" numeric NOT NULL,
    "num" numeric NOT NULL,
    "refresh" numeric NOT NULL,
    "script_get" "text",
    "script_give_up" "text",
    "team" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_quest_loop" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_quest_pre" (
    "id" integer NOT NULL,
    "item_id" numeric NOT NULL,
    "kind" numeric,
    "num" numeric,
    "qid" numeric,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_quest_pre" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_quest_require" (
    "id" integer NOT NULL,
    "item_id" numeric NOT NULL,
    "kind" numeric,
    "num" numeric,
    "q" numeric NOT NULL,
    "qid" numeric,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_quest_require" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_recipe" (
    "id" integer NOT NULL,
    "color" numeric NOT NULL,
    "desc" "text",
    "icon_code" numeric NOT NULL,
    "is_open" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "money" numeric NOT NULL,
    "name" "text",
    "num" numeric NOT NULL,
    "position" numeric NOT NULL,
    "product" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_recipe" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_recipe_plan" (
    "id" integer NOT NULL,
    "num" numeric NOT NULL,
    "p" numeric NOT NULL,
    "rate" numeric NOT NULL,
    "recipe_id" numeric NOT NULL,
    "st" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_recipe_plan" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_recycling" (
    "id" integer NOT NULL,
    "color" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "type" numeric NOT NULL,
    "value" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_recycling" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_rune_chip" (
    "id" integer NOT NULL,
    "icon_code" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "name" "text",
    "num" numeric NOT NULL,
    "rid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_rune_chip" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_sceneitem_instance" (
    "id" integer NOT NULL,
    "bright_code" numeric,
    "color_code" numeric,
    "dead_line" numeric,
    "layer" numeric NOT NULL,
    "maker" numeric,
    "name" "text",
    "owner_id" numeric,
    "owner_type" numeric,
    "pos_dir" numeric NOT NULL,
    "pos_map_id" numeric NOT NULL,
    "from" integer DEFAULT 0,
    "pos_x" numeric NOT NULL,
    "pos_y" numeric NOT NULL,
    "tid" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_sceneitem_instance" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_sceneitem_template" (
    "id" integer NOT NULL,
    "bright_code" numeric NOT NULL,
    "color_code" numeric NOT NULL,
    "description" "text",
    "gold" numeric NOT NULL,
    "honor" numeric NOT NULL,
    "icon_code" numeric,
    "keep_time" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "name" "text",
    "price" numeric NOT NULL,
    "res_code" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_sceneitem_template" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_shop" (
    "id" integer NOT NULL,
    "name" "text",
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_shop" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_shop_slot" (
    "id" integer NOT NULL,
    "amount" numeric NOT NULL,
    "gold" numeric NOT NULL,
    "gt" numeric NOT NULL,
    "item_id" numeric NOT NULL,
    "money" numeric NOT NULL,
    "p_num1" numeric NOT NULL,
    "p_num2" numeric NOT NULL,
    "p_type1" numeric NOT NULL,
    "p_type2" numeric NOT NULL,
    "point" numeric NOT NULL,
    "position" numeric NOT NULL,
    "price_all" numeric,
    "quality" numeric NOT NULL,
    "r" numeric NOT NULL,
    "sale" numeric NOT NULL,
    "sid" numeric NOT NULL,
    "st" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_shop_slot" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_skill" (
    "id" integer NOT NULL,
    "area_attack" numeric NOT NULL,
    "attack_num" numeric NOT NULL,
    "buff_id" numeric NOT NULL,
    "buff_rate" numeric NOT NULL,
    "buff_round" numeric,
    "code_name" "text",
    "cost_guild_contrib" numeric NOT NULL,
    "cre_kind" "text",
    "description" "text",
    "dex_skill" numeric NOT NULL,
    "element" numeric NOT NULL,
    "ex_sid1" numeric NOT NULL,
    "ex_sid2" numeric NOT NULL,
    "ex_sid3" numeric NOT NULL,
    "ex_stone_sid" numeric,
    "exp_skill" numeric NOT NULL,
    "gold" numeric NOT NULL,
    "guild_dev_exp" numeric NOT NULL,
    "guild_dev_money" numeric NOT NULL,
    "icon_code" numeric NOT NULL,
    "info" "text",
    "is_test" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "level" numeric NOT NULL,
    "multi_attack" numeric NOT NULL,
    "name" "text",
    "price" numeric NOT NULL,
    "req_c_l" numeric NOT NULL,
    "req_class" "text",
    "req_level" numeric NOT NULL,
    "restore_sid" numeric NOT NULL,
    "restore_stone_sid" numeric,
    "script_req_l" "text",
    "target_num" numeric NOT NULL,
    "target_type" numeric NOT NULL,
    "type" numeric NOT NULL,
    "use_env" numeric NOT NULL,
    "use_hp" numeric NOT NULL,
    "use_item_id" numeric NOT NULL,
    "use_item_num" numeric NOT NULL,
    "use_item_type" numeric NOT NULL,
    "use_mp" numeric NOT NULL,
    "use_sp" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_skill" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_skill_kind" (
    "id" integer NOT NULL,
    "name" "text"
);


ALTER TABLE "data"."data_tbl_skill_kind" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_skill_pool" (
    "id" integer NOT NULL,
    "pi" numeric NOT NULL,
    "si" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_skill_pool" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_skill_type" (
    "id" integer NOT NULL,
    "kid" numeric NOT NULL,
    "name" "text"
);


ALTER TABLE "data"."data_tbl_skill_type" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_soul" (
    "id" integer NOT NULL,
    "prop1" numeric NOT NULL,
    "prop10" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop5" numeric NOT NULL,
    "prop6" numeric NOT NULL,
    "prop7" numeric NOT NULL,
    "prop8" numeric NOT NULL,
    "prop9" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num10" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "prop_num5" numeric NOT NULL,
    "prop_num6" numeric NOT NULL,
    "prop_num7" numeric NOT NULL,
    "prop_num8" numeric NOT NULL,
    "prop_num9" numeric NOT NULL,
    "require_num" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_soul" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_stars_template" (
    "id" integer NOT NULL,
    "add_prop" "text",
    "add_value" numeric NOT NULL,
    "description" "text",
    "level" numeric NOT NULL,
    "name" "text",
    "req_exp" numeric NOT NULL,
    "req_level" numeric NOT NULL,
    "req_money" numeric NOT NULL,
    "req_seconds" numeric NOT NULL,
    "req_star_level" numeric NOT NULL,
    "res_code" numeric NOT NULL,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_stars_template" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_sublimation" (
    "id" integer NOT NULL,
    "element_num" numeric NOT NULL,
    "item_num1" numeric NOT NULL,
    "item_num2" numeric NOT NULL,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "rate" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_sublimation" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_sublimation_pet" (
    "id" integer NOT NULL,
    "element_num" numeric NOT NULL,
    "item_num1" numeric NOT NULL,
    "item_num2" numeric NOT NULL,
    "prop1" numeric NOT NULL,
    "prop2" numeric NOT NULL,
    "prop3" numeric NOT NULL,
    "prop4" numeric NOT NULL,
    "prop_num1" numeric NOT NULL,
    "prop_num2" numeric NOT NULL,
    "prop_num3" numeric NOT NULL,
    "prop_num4" numeric NOT NULL,
    "rate" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_sublimation_pet" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_title" (
    "id" integer NOT NULL,
    "a" "text",
    "b" numeric NOT NULL,
    "i" "text",
    "k" numeric NOT NULL,
    "l" numeric NOT NULL,
    "n" "text",
    "s" numeric NOT NULL,
    "t" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_title" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_war_map" (
    "id" integer NOT NULL,
    "name" "text",
    "pid" "text",
    "rc" numeric,
    "type" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_war_map" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "data"."data_tbl_war_sprite" (
    "id" integer NOT NULL,
    "cost_gold" numeric NOT NULL,
    "cost_num" numeric NOT NULL,
    "kind" numeric NOT NULL,
    "level" numeric NOT NULL,
    "name" "text",
    "next_id" numeric NOT NULL,
    "p_n1" numeric NOT NULL,
    "p_n2" numeric NOT NULL,
    "p_n3" numeric NOT NULL,
    "p_n4" numeric NOT NULL,
    "p_n5" numeric NOT NULL,
    "p_n6" numeric NOT NULL,
    "p_n7" numeric NOT NULL,
    "p_n8" numeric NOT NULL,
    "p_t1" numeric NOT NULL,
    "p_t2" numeric NOT NULL,
    "p_t3" numeric NOT NULL,
    "p_t4" numeric NOT NULL,
    "p_t5" numeric NOT NULL,
    "p_t6" numeric NOT NULL,
    "p_t7" numeric NOT NULL,
    "p_t8" numeric NOT NULL
);


ALTER TABLE "data"."data_tbl_war_sprite" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "player"."auction_bids" (
    "id" bigint NOT NULL,
    "auction_id" bigint NOT NULL,
    "bidder_id" bigint NOT NULL,
    "bid_amount" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."auction_bids" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."auction_bids_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."auction_bids_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."auction_bids_id_seq" OWNED BY "player"."auction_bids"."id";



CREATE TABLE IF NOT EXISTS "player"."auctions" (
    "id" bigint NOT NULL,
    "seller_id" bigint NOT NULL,
    "template_id" integer NOT NULL,
    "stack_count" integer DEFAULT 1,
    "item_properties" "jsonb" DEFAULT '{}'::"jsonb",
    "start_price" bigint NOT NULL,
    "buyout_price" bigint,
    "current_bid" bigint,
    "currency_type" integer DEFAULT 0,
    "bidder_id" bigint,
    "bid_count" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "expires_at" timestamp with time zone NOT NULL,
    "status" integer DEFAULT 0
);


ALTER TABLE "player"."auctions" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."auctions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."auctions_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."auctions_id_seq" OWNED BY "player"."auctions"."id";



CREATE TABLE IF NOT EXISTS "player"."battle_logs" (
    "id" bigint NOT NULL,
    "battle_type" integer NOT NULL,
    "participants" "jsonb" NOT NULL,
    "actions" "jsonb" NOT NULL,
    "result" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."battle_logs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."battle_logs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."battle_logs_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."battle_logs_id_seq" OWNED BY "player"."battle_logs"."id";



CREATE TABLE IF NOT EXISTS "player"."blocks" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "blocked_id" bigint NOT NULL,
    "reason" "text",
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."blocks" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."blocks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."blocks_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."blocks_id_seq" OWNED BY "player"."blocks"."id";



CREATE TABLE IF NOT EXISTS "player"."character_achievements" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "achievement_id" integer NOT NULL,
    "progress" integer DEFAULT 0,
    "target" integer NOT NULL,
    "is_completed" boolean DEFAULT false,
    "is_claimed" boolean DEFAULT false,
    "completed_at" timestamp with time zone,
    "claimed_at" timestamp with time zone
);


ALTER TABLE "player"."character_achievements" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_achievements_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_achievements_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_achievements_id_seq" OWNED BY "player"."character_achievements"."id";



CREATE TABLE IF NOT EXISTS "player"."character_buffs" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "buff_id" integer NOT NULL,
    "buff_type" integer NOT NULL,
    "source" character varying(100),
    "duration_total" integer,
    "expires_at" timestamp with time zone,
    "rounds_left" integer,
    "battles_left" integer,
    "stack_count" integer DEFAULT 1,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_buffs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_buffs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_buffs_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_buffs_id_seq" OWNED BY "player"."character_buffs"."id";



CREATE TABLE IF NOT EXISTS "player"."character_currencies" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "currency_type" integer NOT NULL,
    "amount" bigint DEFAULT 0 NOT NULL,
    "season" integer DEFAULT 0,
    "expires_at" timestamp with time zone,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_currencies" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_currencies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_currencies_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_currencies_id_seq" OWNED BY "player"."character_currencies"."id";



CREATE TABLE IF NOT EXISTS "player"."character_decorations" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "decoration_type" integer NOT NULL,
    "decoration_id" integer NOT NULL,
    "is_equipped" boolean DEFAULT false,
    "expires_at" timestamp with time zone,
    "obtained_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_decorations" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_decorations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_decorations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_decorations_id_seq" OWNED BY "player"."character_decorations"."id";



CREATE TABLE IF NOT EXISTS "player"."character_fairies" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "fairy_id" integer NOT NULL,
    "name" character varying(50),
    "level" integer DEFAULT 1,
    "experience" bigint DEFAULT 0,
    "is_active" boolean DEFAULT false,
    "obtained_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_fairies" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_fairies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_fairies_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_fairies_id_seq" OWNED BY "player"."character_fairies"."id";



CREATE TABLE IF NOT EXISTS "player"."character_flyers" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "flyer_id" integer NOT NULL,
    "level" integer DEFAULT 1,
    "speed" integer DEFAULT 100,
    "is_active" boolean DEFAULT false,
    "expires_at" timestamp with time zone,
    "obtained_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_flyers" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_flyers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_flyers_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_flyers_id_seq" OWNED BY "player"."character_flyers"."id";



CREATE TABLE IF NOT EXISTS "player"."character_items" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "template_id" integer NOT NULL,
    "item_type" integer NOT NULL,
    "slot_type" integer NOT NULL,
    "slot_index" integer NOT NULL,
    "stack_count" integer DEFAULT 1,
    "is_bound" boolean DEFAULT false,
    "durability" integer,
    "max_durability" integer,
    "enchant_level" integer DEFAULT 0,
    "star_level" integer DEFAULT 0,
    "color_code" integer DEFAULT 0,
    "properties" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_items" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_items_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_items_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_items_id_seq" OWNED BY "player"."character_items"."id";



CREATE TABLE IF NOT EXISTS "player"."character_loops" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "loop_type" integer NOT NULL,
    "current_count" integer DEFAULT 0,
    "max_count" integer NOT NULL,
    "completed_today" integer DEFAULT 0,
    "last_reset" timestamp with time zone,
    "take_times" "jsonb" DEFAULT '[]'::"jsonb"
);


ALTER TABLE "player"."character_loops" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_loops_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_loops_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_loops_id_seq" OWNED BY "player"."character_loops"."id";



CREATE TABLE IF NOT EXISTS "player"."character_mounts" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "mount_id" integer NOT NULL,
    "level" integer DEFAULT 1,
    "experience" bigint DEFAULT 0,
    "is_active" boolean DEFAULT false,
    "expires_at" timestamp with time zone,
    "obtained_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_mounts" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_mounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_mounts_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_mounts_id_seq" OWNED BY "player"."character_mounts"."id";



CREATE TABLE IF NOT EXISTS "player"."character_pets" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "template_id" integer NOT NULL,
    "name" character varying(50) NOT NULL,
    "level" integer DEFAULT 1,
    "experience" bigint DEFAULT 0,
    "apt_strength" integer DEFAULT 50,
    "apt_agility" integer DEFAULT 50,
    "apt_stamina" integer DEFAULT 50,
    "apt_intelligence" integer DEFAULT 50,
    "apt_energy" integer DEFAULT 50,
    "apt_strength_ex" integer DEFAULT 0,
    "apt_agility_ex" integer DEFAULT 0,
    "apt_stamina_ex" integer DEFAULT 0,
    "apt_intelligence_ex" integer DEFAULT 0,
    "apt_energy_ex" integer DEFAULT 0,
    "grow_rate" numeric(5,3) DEFAULT 1.000,
    "grow_rate_add" numeric(5,3) DEFAULT 0.000,
    "upgrade_num" integer DEFAULT 0,
    "evolution_lv" integer DEFAULT 0,
    "element" integer DEFAULT 0,
    "current_hp" integer DEFAULT 100,
    "current_mp" integer DEFAULT 50,
    "max_hp" integer DEFAULT 100,
    "max_mp" integer DEFAULT 50,
    "is_following" boolean DEFAULT false,
    "is_mounting" boolean DEFAULT false,
    "property" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_pets" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_pets_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_pets_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_pets_id_seq" OWNED BY "player"."character_pets"."id";



CREATE TABLE IF NOT EXISTS "player"."character_quests" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "quest_id" integer NOT NULL,
    "status" integer DEFAULT 0 NOT NULL,
    "objectives" "jsonb" DEFAULT '[]'::"jsonb",
    "started_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "completed_at" timestamp with time zone,
    "expires_at" timestamp with time zone,
    "completion_count" integer DEFAULT 0,
    "last_reset" timestamp with time zone
);


ALTER TABLE "player"."character_quests" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_quests_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_quests_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_quests_id_seq" OWNED BY "player"."character_quests"."id";



CREATE TABLE IF NOT EXISTS "player"."character_runes" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "rune_id" integer NOT NULL,
    "slot_index" integer NOT NULL,
    "level" integer DEFAULT 1,
    "experience" bigint DEFAULT 0
);


ALTER TABLE "player"."character_runes" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_runes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_runes_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_runes_id_seq" OWNED BY "player"."character_runes"."id";



CREATE TABLE IF NOT EXISTS "player"."character_shop_limits" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "shop_id" integer NOT NULL,
    "item_template_id" integer NOT NULL,
    "purchased_count" integer DEFAULT 0,
    "limit_type" integer NOT NULL,
    "last_reset" timestamp with time zone
);


ALTER TABLE "player"."character_shop_limits" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_shop_limits_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_shop_limits_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_shop_limits_id_seq" OWNED BY "player"."character_shop_limits"."id";



CREATE TABLE IF NOT EXISTS "player"."character_skills" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "skill_id" integer NOT NULL,
    "level" integer DEFAULT 1,
    "exp" integer DEFAULT 0,
    "slot_position" integer,
    "is_auto" boolean DEFAULT false,
    "cooldown_end" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."character_skills" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_skills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_skills_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_skills_id_seq" OWNED BY "player"."character_skills"."id";



CREATE TABLE IF NOT EXISTS "player"."character_titles" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "title_id" integer NOT NULL,
    "is_active" boolean DEFAULT false,
    "obtained_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "expires_at" timestamp with time zone
);


ALTER TABLE "player"."character_titles" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."character_titles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."character_titles_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."character_titles_id_seq" OWNED BY "player"."character_titles"."id";



CREATE TABLE IF NOT EXISTS "player"."characters" (
    "id" bigint NOT NULL,
    "account_id" "uuid" NOT NULL,
    "name" character varying(50) NOT NULL,
    "class_id" integer NOT NULL,
    "gender" integer DEFAULT 0,
    "level" integer DEFAULT 1,
    "experience" bigint DEFAULT 0,
    "rebirth_level" integer DEFAULT 0,
    "rebirth_exp" bigint DEFAULT 0,
    "strength" integer DEFAULT 10,
    "agility" integer DEFAULT 10,
    "stamina" integer DEFAULT 10,
    "intelligence" integer DEFAULT 10,
    "spirit" integer DEFAULT 10,
    "attr_points" integer DEFAULT 0,
    "current_hp" integer DEFAULT 100,
    "current_mp" integer DEFAULT 50,
    "current_sp" integer DEFAULT 100,
    "max_hp" integer DEFAULT 100,
    "max_mp" integer DEFAULT 50,
    "max_sp" integer DEFAULT 100,
    "attack" integer DEFAULT 20,
    "defense" integer DEFAULT 10,
    "magic_attack" integer DEFAULT 20,
    "magic_defense" integer DEFAULT 10,
    "hit" integer DEFAULT 100,
    "dodge" integer DEFAULT 0,
    "critical" integer DEFAULT 5,
    "critical_dmg" integer DEFAULT 150,
    "speed" integer DEFAULT 100,
    "map_id" integer DEFAULT 1,
    "pos_x" integer DEFAULT 1000,
    "pos_y" integer DEFAULT 1000,
    "direction" integer DEFAULT 0,
    "money" bigint DEFAULT 0,
    "money_bind" bigint DEFAULT 0,
    "gold" integer DEFAULT 0,
    "gold_bind" integer DEFAULT 0,
    "dress_info" "text" DEFAULT ''::"text",
    "guild_id" bigint,
    "vip_type" integer DEFAULT 0,
    "vip_expires_at" timestamp with time zone,
    "honor" bigint DEFAULT 0,
    "chivalry" bigint DEFAULT 0,
    "awaken_level" integer DEFAULT 0,
    "awaken_points" integer DEFAULT 0,
    "awaken_points_used" integer DEFAULT 0,
    "star_level" integer DEFAULT 0,
    "soul_exp" bigint DEFAULT 0,
    "soul_level" integer DEFAULT 0,
    "soul_points" bigint DEFAULT 0,
    "move_points" integer DEFAULT 100,
    "max_move_points" integer DEFAULT 100,
    "activity_points" integer DEFAULT 100,
    "max_activity_points" integer DEFAULT 100,
    "vigor" integer DEFAULT 100,
    "max_vigor" integer DEFAULT 100,
    "bag_slots" integer DEFAULT 30,
    "bank_slots" integer DEFAULT 20,
    "pet_slots" integer DEFAULT 6,
    "temp_bag_slots" integer DEFAULT 0,
    "mx_temp_bag_slots" integer DEFAULT 0,
    "gm_level" integer DEFAULT 0,
    "reputation" bigint DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "last_active" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "total_online" bigint DEFAULT 0
);


ALTER TABLE "player"."characters" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."characters_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."characters_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."characters_id_seq" OWNED BY "player"."characters"."id";



CREATE TABLE IF NOT EXISTS "player"."chat_logs" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "character_name" character varying(50) NOT NULL,
    "channel" integer NOT NULL,
    "recipient_id" "uuid",
    "recipient_name" character varying(50),
    "message" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."chat_logs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."chat_logs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."chat_logs_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."chat_logs_id_seq" OWNED BY "player"."chat_logs"."id";



CREATE TABLE IF NOT EXISTS "player"."friend_requests" (
    "id" bigint NOT NULL,
    "from_id" bigint NOT NULL,
    "to_id" bigint NOT NULL,
    "message" "text" DEFAULT ''::"text",
    "status" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "processed_at" timestamp with time zone
);


ALTER TABLE "player"."friend_requests" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."friend_requests_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."friend_requests_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."friend_requests_id_seq" OWNED BY "player"."friend_requests"."id";



CREATE TABLE IF NOT EXISTS "player"."friends" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "friend_id" bigint NOT NULL,
    "group_id" integer DEFAULT 0,
    "nickname" character varying(50),
    "intimacy" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."friends" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."friends_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."friends_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."friends_id_seq" OWNED BY "player"."friends"."id";



CREATE TABLE IF NOT EXISTS "player"."game_data_templates" (
    "id" integer NOT NULL,
    "table_name" character varying(100) NOT NULL,
    "record_id" integer NOT NULL,
    "data" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."game_data_templates" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."game_data_templates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."game_data_templates_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."game_data_templates_id_seq" OWNED BY "player"."game_data_templates"."id";



CREATE TABLE IF NOT EXISTS "player"."guild_applications" (
    "id" bigint NOT NULL,
    "guild_id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "message" "text" DEFAULT ''::"text",
    "status" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "processed_at" timestamp with time zone,
    "processed_by" bigint
);


ALTER TABLE "player"."guild_applications" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."guild_applications_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."guild_applications_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."guild_applications_id_seq" OWNED BY "player"."guild_applications"."id";



CREATE TABLE IF NOT EXISTS "player"."guild_logs" (
    "id" bigint NOT NULL,
    "guild_id" bigint NOT NULL,
    "action_type" integer NOT NULL,
    "actor_id" bigint,
    "target_id" bigint,
    "details" "jsonb" DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."guild_logs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."guild_logs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."guild_logs_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."guild_logs_id_seq" OWNED BY "player"."guild_logs"."id";



CREATE TABLE IF NOT EXISTS "player"."guild_members" (
    "id" bigint NOT NULL,
    "guild_id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "rank" integer DEFAULT 3 NOT NULL,
    "duty" character varying(50) DEFAULT ''::character varying,
    "contribution_normal" bigint DEFAULT 0,
    "contribution_donate" bigint DEFAULT 0,
    "contribution_total" bigint DEFAULT 0,
    "contribution_weekly" bigint DEFAULT 0,
    "can_invite" boolean DEFAULT false,
    "can_kick" boolean DEFAULT false,
    "can_edit_announcement" boolean DEFAULT false,
    "can_access_warehouse" boolean DEFAULT false,
    "can_manage_warehouse" boolean DEFAULT false,
    "joined_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "last_online" timestamp with time zone
);


ALTER TABLE "player"."guild_members" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."guild_members_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."guild_members_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."guild_members_id_seq" OWNED BY "player"."guild_members"."id";



CREATE TABLE IF NOT EXISTS "player"."guild_skills" (
    "id" bigint NOT NULL,
    "guild_id" bigint NOT NULL,
    "skill_id" integer NOT NULL,
    "level" integer DEFAULT 1 NOT NULL
);


ALTER TABLE "player"."guild_skills" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."guild_skills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."guild_skills_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."guild_skills_id_seq" OWNED BY "player"."guild_skills"."id";



CREATE TABLE IF NOT EXISTS "player"."guild_warehouse" (
    "id" bigint NOT NULL,
    "guild_id" bigint NOT NULL,
    "slot_index" integer NOT NULL,
    "template_id" integer NOT NULL,
    "stack_count" integer DEFAULT 1,
    "properties" "jsonb" DEFAULT '{}'::"jsonb",
    "deposited_by" bigint,
    "deposited_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."guild_warehouse" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."guild_warehouse_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."guild_warehouse_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."guild_warehouse_id_seq" OWNED BY "player"."guild_warehouse"."id";



CREATE TABLE IF NOT EXISTS "player"."guilds" (
    "id" bigint NOT NULL,
    "name" character varying(50) NOT NULL,
    "leader_id" bigint NOT NULL,
    "level" integer DEFAULT 1 NOT NULL,
    "experience" bigint DEFAULT 0 NOT NULL,
    "population" integer DEFAULT 0 NOT NULL,
    "max_population" integer DEFAULT 50 NOT NULL,
    "icon" integer DEFAULT 0 NOT NULL,
    "funds" bigint DEFAULT 0 NOT NULL,
    "contribution_total" bigint DEFAULT 0 NOT NULL,
    "announcement" "text" DEFAULT ''::"text",
    "description" "text" DEFAULT ''::"text",
    "join_level_req" integer DEFAULT 1,
    "join_approval_required" boolean DEFAULT true,
    "activity_points" integer DEFAULT 0,
    "last_activity_reset" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."guilds" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."guilds_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."guilds_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."guilds_id_seq" OWNED BY "player"."guilds"."id";



CREATE TABLE IF NOT EXISTS "player"."item_souls" (
    "id" bigint NOT NULL,
    "item_id" bigint NOT NULL,
    "slot_index" integer NOT NULL,
    "soul_id" integer NOT NULL,
    "level" integer DEFAULT 1
);


ALTER TABLE "player"."item_souls" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."item_souls_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."item_souls_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."item_souls_id_seq" OWNED BY "player"."item_souls"."id";



CREATE TABLE IF NOT EXISTS "player"."mail_attachments" (
    "id" bigint NOT NULL,
    "mail_id" bigint NOT NULL,
    "slot_index" integer NOT NULL,
    "template_id" integer NOT NULL,
    "stack_count" integer DEFAULT 1,
    "is_bound" boolean DEFAULT false,
    "properties" "jsonb" DEFAULT '{}'::"jsonb"
);


ALTER TABLE "player"."mail_attachments" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."mail_attachments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."mail_attachments_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."mail_attachments_id_seq" OWNED BY "player"."mail_attachments"."id";



CREATE TABLE IF NOT EXISTS "player"."mails" (
    "id" bigint NOT NULL,
    "sender_id" bigint,
    "sender_name" character varying(50) NOT NULL,
    "recipient_id" bigint NOT NULL,
    "mail_type" integer DEFAULT 0 NOT NULL,
    "title" character varying(100) NOT NULL,
    "content" "text",
    "money" bigint DEFAULT 0,
    "gold" integer DEFAULT 0,
    "cod_price" bigint DEFAULT 0,
    "cod_currency" integer DEFAULT 0,
    "is_read" boolean DEFAULT false,
    "has_attachments" boolean DEFAULT false,
    "attachments_claimed" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "read_at" timestamp with time zone,
    "expires_at" timestamp with time zone,
    "template_id" integer
);


ALTER TABLE "player"."mails" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."mails_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."mails_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."mails_id_seq" OWNED BY "player"."mails"."id";



CREATE TABLE IF NOT EXISTS "player"."marriages" (
    "id" bigint NOT NULL,
    "partner1_id" bigint NOT NULL,
    "partner2_id" bigint NOT NULL,
    "ring_type" integer DEFAULT 1,
    "intimacy" integer DEFAULT 0,
    "wedding_date" timestamp with time zone,
    "wedding_venue" integer,
    "married_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "divorced_at" timestamp with time zone
);


ALTER TABLE "player"."marriages" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."marriages_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."marriages_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."marriages_id_seq" OWNED BY "player"."marriages"."id";



CREATE TABLE IF NOT EXISTS "player"."npcs" (
    "id" integer NOT NULL,
    "template_id" integer NOT NULL,
    "name" character varying(100) NOT NULL,
    "map_id" integer NOT NULL,
    "pos_x" integer NOT NULL,
    "pos_y" integer NOT NULL,
    "direction" integer DEFAULT 0,
    "npc_type" integer DEFAULT 1,
    "dialog_id" integer,
    "respawn_time" integer DEFAULT 0,
    "is_active" boolean DEFAULT true
);


ALTER TABLE "player"."npcs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."npcs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."npcs_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."npcs_id_seq" OWNED BY "player"."npcs"."id";



CREATE TABLE IF NOT EXISTS "player"."pet_arena_battles" (
    "id" bigint NOT NULL,
    "attacker_id" bigint NOT NULL,
    "defender_id" bigint NOT NULL,
    "attacker_pet_id" bigint,
    "defender_pet_id" bigint,
    "attacker_rating_before" integer NOT NULL,
    "defender_rating_before" integer NOT NULL,
    "winner_id" bigint,
    "rating_change" integer DEFAULT 0 NOT NULL,
    "battle_log" "jsonb" DEFAULT '[]'::"jsonb",
    "season" integer DEFAULT 1 NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."pet_arena_battles" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."pet_arena_battles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."pet_arena_battles_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."pet_arena_battles_id_seq" OWNED BY "player"."pet_arena_battles"."id";



CREATE TABLE IF NOT EXISTS "player"."pet_arena_rankings" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "pet_id" bigint,
    "rating" integer DEFAULT 1000 NOT NULL,
    "wins" integer DEFAULT 0 NOT NULL,
    "losses" integer DEFAULT 0 NOT NULL,
    "win_streak" integer DEFAULT 0 NOT NULL,
    "max_win_streak" integer DEFAULT 0 NOT NULL,
    "season" integer DEFAULT 1 NOT NULL,
    "tickets" integer DEFAULT 10 NOT NULL,
    "max_tickets" integer DEFAULT 10 NOT NULL,
    "last_ticket_refresh" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "last_fight_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."pet_arena_rankings" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."pet_arena_rankings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."pet_arena_rankings_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."pet_arena_rankings_id_seq" OWNED BY "player"."pet_arena_rankings"."id";



CREATE TABLE IF NOT EXISTS "player"."pet_arena_rewards" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "season" integer NOT NULL,
    "rank" integer NOT NULL,
    "rating" integer NOT NULL,
    "rewards_claimed" "jsonb" DEFAULT '{}'::"jsonb",
    "claimed_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."pet_arena_rewards" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."pet_arena_rewards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."pet_arena_rewards_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."pet_arena_rewards_id_seq" OWNED BY "player"."pet_arena_rewards"."id";



CREATE TABLE IF NOT EXISTS "player"."pet_skills" (
    "id" bigint NOT NULL,
    "pet_id" bigint NOT NULL,
    "skill_id" integer NOT NULL,
    "level" integer DEFAULT 1,
    "slot_position" integer
);


ALTER TABLE "player"."pet_skills" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."pet_skills_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."pet_skills_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."pet_skills_id_seq" OWNED BY "player"."pet_skills"."id";



CREATE TABLE IF NOT EXISTS "player"."quest_history" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "quest_id" integer NOT NULL,
    "completed_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "rewards_claimed" "jsonb"
);


ALTER TABLE "player"."quest_history" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."quest_history_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."quest_history_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."quest_history_id_seq" OWNED BY "player"."quest_history"."id";



CREATE TABLE IF NOT EXISTS "player"."scene_items" (
    "id" bigint NOT NULL,
    "template_id" integer NOT NULL,
    "map_id" integer NOT NULL,
    "pos_x" integer NOT NULL,
    "pos_y" integer NOT NULL,
    "stack_count" integer DEFAULT 1,
    "owner_id" bigint,
    "dropped_at" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "expires_at" timestamp without time zone,
    "is_static" boolean DEFAULT false
);


ALTER TABLE "player"."scene_items" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."scene_items_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."scene_items_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."scene_items_id_seq" OWNED BY "player"."scene_items"."id";



CREATE TABLE IF NOT EXISTS "player"."shop_purchases" (
    "id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "shop_id" integer NOT NULL,
    "item_template_id" integer NOT NULL,
    "quantity" integer DEFAULT 1 NOT NULL,
    "cost_type" integer NOT NULL,
    "cost_amount" bigint NOT NULL,
    "cost_type2" integer,
    "cost_amount2" bigint,
    "limit_type" integer,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."shop_purchases" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."shop_purchases_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."shop_purchases_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."shop_purchases_id_seq" OWNED BY "player"."shop_purchases"."id";



CREATE TABLE IF NOT EXISTS "player"."trade_items" (
    "id" bigint NOT NULL,
    "session_id" bigint NOT NULL,
    "player_id" bigint NOT NULL,
    "slot_index" integer NOT NULL,
    "item_id" bigint,
    "pet_id" bigint
);


ALTER TABLE "player"."trade_items" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."trade_items_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."trade_items_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."trade_items_id_seq" OWNED BY "player"."trade_items"."id";



CREATE TABLE IF NOT EXISTS "player"."trade_logs" (
    "id" bigint NOT NULL,
    "player1_id" "uuid" NOT NULL,
    "player2_id" "uuid" NOT NULL,
    "player1_name" character varying(50) NOT NULL,
    "player2_name" character varying(50) NOT NULL,
    "items_exchanged" "jsonb" NOT NULL,
    "money_exchanged" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE "player"."trade_logs" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."trade_logs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."trade_logs_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."trade_logs_id_seq" OWNED BY "player"."trade_logs"."id";



CREATE TABLE IF NOT EXISTS "player"."trade_sessions" (
    "id" bigint NOT NULL,
    "player1_id" bigint NOT NULL,
    "player2_id" bigint NOT NULL,
    "status" integer DEFAULT 0 NOT NULL,
    "player1_locked" boolean DEFAULT false,
    "player2_locked" boolean DEFAULT false,
    "player1_confirmed" boolean DEFAULT false,
    "player2_confirmed" boolean DEFAULT false,
    "player1_money" bigint DEFAULT 0,
    "player2_money" bigint DEFAULT 0,
    "player1_gold" integer DEFAULT 0,
    "player2_gold" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "completed_at" timestamp with time zone
);


ALTER TABLE "player"."trade_sessions" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "player"."trade_sessions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "player"."trade_sessions_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "player"."trade_sessions_id_seq" OWNED BY "player"."trade_sessions"."id";



CREATE TABLE IF NOT EXISTS "public"."accounts" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "username" character varying(50) NOT NULL,
    "password_hash" character varying(255) NOT NULL,
    "secondary_password" character varying(255),
    "email" character varying(100),
    "vip_level" integer DEFAULT 0,
    "gold" integer DEFAULT 0,
    "is_banned" boolean DEFAULT false,
    "ban_reason" "text",
    "ban_expiry" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "last_login" timestamp with time zone
);


ALTER TABLE "public"."accounts" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."giftcode_campaigns" (
    "id" bigint NOT NULL,
    "campaign_key" "text" NOT NULL CHECK ((length(btrim("campaign_key")) > 0)),
    "campaign_key_norm" "text" GENERATED ALWAYS AS (lower("campaign_key")) STORED,
    "name" "text" NOT NULL CHECK ((length(btrim("name")) > 0)),
    "description" "text",
    "status" smallint DEFAULT 1 NOT NULL CHECK (("status" = ANY (ARRAY[0, 1, 2]))),
    "starts_at" timestamp with time zone,
    "ends_at" timestamp with time zone,
    "max_total_uses" integer DEFAULT 0 NOT NULL CHECK (("max_total_uses" >= 0)),
    "max_uses_per_player" integer DEFAULT 1 NOT NULL CHECK (("max_uses_per_player" >= 0)),
    "redeemed_count" integer DEFAULT 0 NOT NULL CHECK (("redeemed_count" >= 0)),
    "created_by" "text",
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "meta" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL
);


ALTER TABLE "public"."giftcode_campaigns" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."giftcode_campaigns_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."giftcode_campaigns_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."giftcode_campaigns_id_seq" OWNED BY "public"."giftcode_campaigns"."id";



CREATE TABLE IF NOT EXISTS "public"."giftcode_codes" (
    "id" bigint NOT NULL,
    "campaign_id" bigint NOT NULL,
    "code" "text" NOT NULL CHECK ((length(btrim("code")) > 0)),
    "code_norm" "text" GENERATED ALWAYS AS (lower("code")) STORED,
    "status" smallint DEFAULT 1 NOT NULL CHECK (("status" = ANY (ARRAY[0, 1, 2]))),
    "max_uses" integer DEFAULT 1 NOT NULL CHECK (("max_uses" >= 0)),
    "redeemed_count" integer DEFAULT 0 NOT NULL CHECK (("redeemed_count" >= 0)),
    "last_redeemed_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updated_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "meta" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL
);


ALTER TABLE "public"."giftcode_codes" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."giftcode_codes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."giftcode_codes_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."giftcode_codes_id_seq" OWNED BY "public"."giftcode_codes"."id";



CREATE TABLE IF NOT EXISTS "public"."giftcode_rewards" (
    "id" bigint NOT NULL,
    "campaign_id" bigint NOT NULL,
    "sort_order" integer DEFAULT 0 NOT NULL,
    "reward_type" "text" NOT NULL CHECK ((length(btrim("reward_type")) > 0)),
    "amount" bigint DEFAULT 0 NOT NULL,
    "payload" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."giftcode_rewards" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."giftcode_rewards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."giftcode_rewards_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."giftcode_rewards_id_seq" OWNED BY "public"."giftcode_rewards"."id";



CREATE TABLE IF NOT EXISTS "public"."giftcode_redemptions" (
    "id" bigint NOT NULL,
    "campaign_id" bigint NOT NULL,
    "code_id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "redeemed_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "reward_snapshot" "jsonb" DEFAULT '[]'::"jsonb" NOT NULL,
    "meta" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL
);


ALTER TABLE "public"."giftcode_redemptions" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."giftcode_redemptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."giftcode_redemptions_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."giftcode_redemptions_id_seq" OWNED BY "public"."giftcode_redemptions"."id";



CREATE TABLE IF NOT EXISTS "public"."login_history" (
    "id" bigint NOT NULL,
    "account_id" "uuid" NOT NULL,
    "character_id" "uuid",
    "ip_address" "inet",
    "line_id" integer,
    "client_version" character varying(50),
    "login_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "logout_at" timestamp with time zone,
    "duration_seconds" integer,
    "was_successful" boolean DEFAULT true,
    "failure_reason" character varying(100)
);


ALTER TABLE "public"."login_history" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."login_history_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."login_history_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."login_history_id_seq" OWNED BY "public"."login_history"."id";



CREATE TABLE IF NOT EXISTS "public"."sessions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "account_id" "uuid" NOT NULL,
    "character_id" "uuid",
    "line_id" integer,
    "ip_address" "inet",
    "client_version" character varying(50),
    "is_active" boolean DEFAULT true,
    "created_at" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "last_activity" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "ended_at" timestamp with time zone
);


ALTER TABLE "public"."sessions" OWNER TO "postgres";


ALTER TABLE ONLY "player"."auction_bids" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."auction_bids_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."auctions" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."auctions_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."battle_logs" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."battle_logs_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."blocks" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."blocks_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_achievements" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_achievements_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_buffs" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_buffs_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_currencies" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_currencies_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_decorations" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_decorations_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_fairies" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_fairies_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_flyers" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_flyers_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_items" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_items_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_loops" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_loops_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_mounts" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_mounts_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_pets" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_pets_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_quests" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_quests_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_runes" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_runes_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_shop_limits" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_shop_limits_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_skills" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_skills_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."character_titles" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."character_titles_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."characters" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."characters_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."chat_logs" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."chat_logs_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."friend_requests" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."friend_requests_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."friends" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."friends_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."game_data_templates" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."game_data_templates_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."guild_applications" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."guild_applications_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."guild_logs" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."guild_logs_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."guild_members" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."guild_members_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."guild_skills" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."guild_skills_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."guild_warehouse" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."guild_warehouse_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."guilds" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."guilds_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."item_souls" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."item_souls_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."mail_attachments" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."mail_attachments_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."mails" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."mails_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."marriages" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."marriages_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."npcs" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."npcs_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."pet_arena_battles" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."pet_arena_battles_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."pet_arena_rankings" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."pet_arena_rankings_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."pet_arena_rewards" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."pet_arena_rewards_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."pet_skills" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."pet_skills_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."quest_history" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."quest_history_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."scene_items" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."scene_items_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."shop_purchases" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."shop_purchases_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."trade_items" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."trade_items_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."trade_logs" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."trade_logs_id_seq"'::"regclass");



ALTER TABLE ONLY "player"."trade_sessions" ALTER COLUMN "id" SET DEFAULT "nextval"('"player"."trade_sessions_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."giftcode_campaigns" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."giftcode_campaigns_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."giftcode_codes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."giftcode_codes_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."giftcode_rewards" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."giftcode_rewards_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."giftcode_redemptions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."giftcode_redemptions_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."login_history" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."login_history_id_seq"'::"regclass");



ALTER TABLE ONLY "data"."data_tbl_achievement"
    ADD CONSTRAINT "data_tbl_achievement_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_achievement_require"
    ADD CONSTRAINT "data_tbl_achievement_require_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_answer"
    ADD CONSTRAINT "data_tbl_answer_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_artifact"
    ADD CONSTRAINT "data_tbl_artifact_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_awakening"
    ADD CONSTRAINT "data_tbl_awakening_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_awakening_skill"
    ADD CONSTRAINT "data_tbl_awakening_skill_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_buff"
    ADD CONSTRAINT "data_tbl_buff_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_building"
    ADD CONSTRAINT "data_tbl_building_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_carve_award"
    ADD CONSTRAINT "data_tbl_carve_award_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_carve_master"
    ADD CONSTRAINT "data_tbl_carve_master_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_carve"
    ADD CONSTRAINT "data_tbl_carve_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_class"
    ADD CONSTRAINT "data_tbl_class_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creature_handbook"
    ADD CONSTRAINT "data_tbl_creature_handbook_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creature_loot"
    ADD CONSTRAINT "data_tbl_creature_loot_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creature"
    ADD CONSTRAINT "data_tbl_creature_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creature_skill"
    ADD CONSTRAINT "data_tbl_creature_skill_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creatureh_combine"
    ADD CONSTRAINT "data_tbl_creatureh_combine_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creatureh_contain"
    ADD CONSTRAINT "data_tbl_creatureh_contain_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creatureh_heart"
    ADD CONSTRAINT "data_tbl_creatureh_heart_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_creatureh_point"
    ADD CONSTRAINT "data_tbl_creatureh_point_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_credit"
    ADD CONSTRAINT "data_tbl_credit_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_deco_hole"
    ADD CONSTRAINT "data_tbl_deco_hole_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_deco_rune"
    ADD CONSTRAINT "data_tbl_deco_rune_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_deco_show"
    ADD CONSTRAINT "data_tbl_deco_show_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_diary"
    ADD CONSTRAINT "data_tbl_diary_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_dress"
    ADD CONSTRAINT "data_tbl_dress_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_equipt_suit"
    ADD CONSTRAINT "data_tbl_equipt_suit_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_equipt_template"
    ADD CONSTRAINT "data_tbl_equipt_template_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_explorer_medal"
    ADD CONSTRAINT "data_tbl_explorer_medal_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_extend_position"
    ADD CONSTRAINT "data_tbl_extend_position_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_fairy_tempalte"
    ADD CONSTRAINT "data_tbl_fairy_tempalte_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_feast"
    ADD CONSTRAINT "data_tbl_feast_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_guide"
    ADD CONSTRAINT "data_tbl_guide_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_item_template"
    ADD CONSTRAINT "data_tbl_item_template_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_map_cell"
    ADD CONSTRAINT "data_tbl_map_cell_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_map_creature"
    ADD CONSTRAINT "data_tbl_map_creature_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_map"
    ADD CONSTRAINT "data_tbl_map_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_maze"
    ADD CONSTRAINT "data_tbl_maze_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_medal"
    ADD CONSTRAINT "data_tbl_medal_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mevent_map"
    ADD CONSTRAINT "data_tbl_mevent_map_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mevent_type"
    ADD CONSTRAINT "data_tbl_mevent_type_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mineral_template"
    ADD CONSTRAINT "data_tbl_mineral_template_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mount_dress"
    ADD CONSTRAINT "data_tbl_mount_dress_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mount"
    ADD CONSTRAINT "data_tbl_mount_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mystre"
    ADD CONSTRAINT "data_tbl_mystre_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mystre_recipe"
    ADD CONSTRAINT "data_tbl_mystre_recipe_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mytc_detail"
    ADD CONSTRAINT "data_tbl_mytc_detail_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_mytc_suit"
    ADD CONSTRAINT "data_tbl_mytc_suit_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_name_lib"
    ADD CONSTRAINT "data_tbl_name_lib_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_npc_creature"
    ADD CONSTRAINT "data_tbl_npc_creature_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_npc"
    ADD CONSTRAINT "data_tbl_npc_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_npc_skill"
    ADD CONSTRAINT "data_tbl_npc_skill_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_pet_contract"
    ADD CONSTRAINT "data_tbl_pet_contract_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_pet_guard"
    ADD CONSTRAINT "data_tbl_pet_guard_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_pet_soul"
    ADD CONSTRAINT "data_tbl_pet_soul_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_pet_stone"
    ADD CONSTRAINT "data_tbl_pet_stone_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_pet_talent"
    ADD CONSTRAINT "data_tbl_pet_talent_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_plan"
    ADD CONSTRAINT "data_tbl_plan_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_pm_right"
    ADD CONSTRAINT "data_tbl_pm_right_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_prs_chip"
    ADD CONSTRAINT "data_tbl_prs_chip_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_prs_show"
    ADD CONSTRAINT "data_tbl_prs_show_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_prs_tree"
    ADD CONSTRAINT "data_tbl_prs_tree_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_quest_award"
    ADD CONSTRAINT "data_tbl_quest_award_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_quest_loop"
    ADD CONSTRAINT "data_tbl_quest_loop_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_quest"
    ADD CONSTRAINT "data_tbl_quest_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_quest_pre"
    ADD CONSTRAINT "data_tbl_quest_pre_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_quest_require"
    ADD CONSTRAINT "data_tbl_quest_require_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_recipe"
    ADD CONSTRAINT "data_tbl_recipe_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_recipe_plan"
    ADD CONSTRAINT "data_tbl_recipe_plan_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_recycling"
    ADD CONSTRAINT "data_tbl_recycling_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_rune_chip"
    ADD CONSTRAINT "data_tbl_rune_chip_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_sceneitem_instance"
    ADD CONSTRAINT "data_tbl_sceneitem_instance_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_sceneitem_template"
    ADD CONSTRAINT "data_tbl_sceneitem_template_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_shop"
    ADD CONSTRAINT "data_tbl_shop_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_shop_slot"
    ADD CONSTRAINT "data_tbl_shop_slot_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_skill_kind"
    ADD CONSTRAINT "data_tbl_skill_kind_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_skill"
    ADD CONSTRAINT "data_tbl_skill_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_skill_pool"
    ADD CONSTRAINT "data_tbl_skill_pool_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_skill_type"
    ADD CONSTRAINT "data_tbl_skill_type_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_soul"
    ADD CONSTRAINT "data_tbl_soul_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_stars_template"
    ADD CONSTRAINT "data_tbl_stars_template_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_sublimation_pet"
    ADD CONSTRAINT "data_tbl_sublimation_pet_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_sublimation"
    ADD CONSTRAINT "data_tbl_sublimation_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_title"
    ADD CONSTRAINT "data_tbl_title_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_war_map"
    ADD CONSTRAINT "data_tbl_war_map_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "data"."data_tbl_war_sprite"
    ADD CONSTRAINT "data_tbl_war_sprite_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."auction_bids"
    ADD CONSTRAINT "auction_bids_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."auctions"
    ADD CONSTRAINT "auctions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."battle_logs"
    ADD CONSTRAINT "battle_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."blocks"
    ADD CONSTRAINT "blocks_character_id_blocked_id_key" UNIQUE ("character_id", "blocked_id");



ALTER TABLE ONLY "player"."blocks"
    ADD CONSTRAINT "blocks_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_achievements"
    ADD CONSTRAINT "character_achievements_character_id_achievement_id_key" UNIQUE ("character_id", "achievement_id");



ALTER TABLE ONLY "player"."character_achievements"
    ADD CONSTRAINT "character_achievements_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_buffs"
    ADD CONSTRAINT "character_buffs_character_id_buff_id_key" UNIQUE ("character_id", "buff_id");



ALTER TABLE ONLY "player"."character_buffs"
    ADD CONSTRAINT "character_buffs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_currencies"
    ADD CONSTRAINT "character_currencies_character_id_currency_type_season_key" UNIQUE ("character_id", "currency_type", "season");



ALTER TABLE ONLY "player"."character_currencies"
    ADD CONSTRAINT "character_currencies_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_decorations"
    ADD CONSTRAINT "character_decorations_character_id_decoration_type_decorati_key" UNIQUE ("character_id", "decoration_type", "decoration_id");



ALTER TABLE ONLY "player"."character_decorations"
    ADD CONSTRAINT "character_decorations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_fairies"
    ADD CONSTRAINT "character_fairies_character_id_fairy_id_key" UNIQUE ("character_id", "fairy_id");



ALTER TABLE ONLY "player"."character_fairies"
    ADD CONSTRAINT "character_fairies_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_flyers"
    ADD CONSTRAINT "character_flyers_character_id_flyer_id_key" UNIQUE ("character_id", "flyer_id");



ALTER TABLE ONLY "player"."character_flyers"
    ADD CONSTRAINT "character_flyers_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_items"
    ADD CONSTRAINT "character_items_character_id_slot_type_slot_index_key" UNIQUE ("character_id", "slot_type", "slot_index");



ALTER TABLE ONLY "player"."character_items"
    ADD CONSTRAINT "character_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_loops"
    ADD CONSTRAINT "character_loops_character_id_loop_type_key" UNIQUE ("character_id", "loop_type");



ALTER TABLE ONLY "player"."character_loops"
    ADD CONSTRAINT "character_loops_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_mounts"
    ADD CONSTRAINT "character_mounts_character_id_mount_id_key" UNIQUE ("character_id", "mount_id");



ALTER TABLE ONLY "player"."character_mounts"
    ADD CONSTRAINT "character_mounts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_pets"
    ADD CONSTRAINT "character_pets_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_quests"
    ADD CONSTRAINT "character_quests_character_id_quest_id_key" UNIQUE ("character_id", "quest_id");



ALTER TABLE ONLY "player"."character_quests"
    ADD CONSTRAINT "character_quests_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_runes"
    ADD CONSTRAINT "character_runes_character_id_slot_index_key" UNIQUE ("character_id", "slot_index");



ALTER TABLE ONLY "player"."character_runes"
    ADD CONSTRAINT "character_runes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_shop_limits"
    ADD CONSTRAINT "character_shop_limits_character_id_shop_id_item_template_id_key" UNIQUE ("character_id", "shop_id", "item_template_id", "limit_type");



ALTER TABLE ONLY "player"."character_shop_limits"
    ADD CONSTRAINT "character_shop_limits_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_skills"
    ADD CONSTRAINT "character_skills_character_id_skill_id_key" UNIQUE ("character_id", "skill_id");



ALTER TABLE ONLY "player"."character_skills"
    ADD CONSTRAINT "character_skills_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."character_titles"
    ADD CONSTRAINT "character_titles_character_id_title_id_key" UNIQUE ("character_id", "title_id");



ALTER TABLE ONLY "player"."character_titles"
    ADD CONSTRAINT "character_titles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."characters"
    ADD CONSTRAINT "characters_name_key" UNIQUE ("name");



ALTER TABLE ONLY "player"."characters"
    ADD CONSTRAINT "characters_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."chat_logs"
    ADD CONSTRAINT "chat_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."friend_requests"
    ADD CONSTRAINT "friend_requests_from_id_to_id_key" UNIQUE ("from_id", "to_id");



ALTER TABLE ONLY "player"."friend_requests"
    ADD CONSTRAINT "friend_requests_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."friends"
    ADD CONSTRAINT "friends_character_id_friend_id_key" UNIQUE ("character_id", "friend_id");



ALTER TABLE ONLY "player"."friends"
    ADD CONSTRAINT "friends_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."game_data_templates"
    ADD CONSTRAINT "game_data_templates_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."game_data_templates"
    ADD CONSTRAINT "game_data_templates_table_name_record_id_key" UNIQUE ("table_name", "record_id");



ALTER TABLE ONLY "player"."guild_applications"
    ADD CONSTRAINT "guild_applications_guild_id_character_id_key" UNIQUE ("guild_id", "character_id");



ALTER TABLE ONLY "player"."guild_applications"
    ADD CONSTRAINT "guild_applications_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."guild_logs"
    ADD CONSTRAINT "guild_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."guild_members"
    ADD CONSTRAINT "guild_members_guild_id_character_id_key" UNIQUE ("guild_id", "character_id");



ALTER TABLE ONLY "player"."guild_members"
    ADD CONSTRAINT "guild_members_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."guild_skills"
    ADD CONSTRAINT "guild_skills_guild_id_skill_id_key" UNIQUE ("guild_id", "skill_id");



ALTER TABLE ONLY "player"."guild_skills"
    ADD CONSTRAINT "guild_skills_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."guild_warehouse"
    ADD CONSTRAINT "guild_warehouse_guild_id_slot_index_key" UNIQUE ("guild_id", "slot_index");



ALTER TABLE ONLY "player"."guild_warehouse"
    ADD CONSTRAINT "guild_warehouse_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."guilds"
    ADD CONSTRAINT "guilds_name_key" UNIQUE ("name");



ALTER TABLE ONLY "player"."guilds"
    ADD CONSTRAINT "guilds_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."item_souls"
    ADD CONSTRAINT "item_souls_item_id_slot_index_key" UNIQUE ("item_id", "slot_index");



ALTER TABLE ONLY "player"."item_souls"
    ADD CONSTRAINT "item_souls_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."mail_attachments"
    ADD CONSTRAINT "mail_attachments_mail_id_slot_index_key" UNIQUE ("mail_id", "slot_index");



ALTER TABLE ONLY "player"."mail_attachments"
    ADD CONSTRAINT "mail_attachments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."mails"
    ADD CONSTRAINT "mails_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."marriages"
    ADD CONSTRAINT "marriages_partner1_id_key" UNIQUE ("partner1_id");



ALTER TABLE ONLY "player"."marriages"
    ADD CONSTRAINT "marriages_partner2_id_key" UNIQUE ("partner2_id");



ALTER TABLE ONLY "player"."marriages"
    ADD CONSTRAINT "marriages_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."npcs"
    ADD CONSTRAINT "npcs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."pet_arena_battles"
    ADD CONSTRAINT "pet_arena_battles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."pet_arena_rankings"
    ADD CONSTRAINT "pet_arena_rankings_character_id_season_key" UNIQUE ("character_id", "season");



ALTER TABLE ONLY "player"."pet_arena_rankings"
    ADD CONSTRAINT "pet_arena_rankings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."pet_arena_rewards"
    ADD CONSTRAINT "pet_arena_rewards_character_id_season_key" UNIQUE ("character_id", "season");



ALTER TABLE ONLY "player"."pet_arena_rewards"
    ADD CONSTRAINT "pet_arena_rewards_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."pet_skills"
    ADD CONSTRAINT "pet_skills_pet_id_skill_id_key" UNIQUE ("pet_id", "skill_id");



ALTER TABLE ONLY "player"."pet_skills"
    ADD CONSTRAINT "pet_skills_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."quest_history"
    ADD CONSTRAINT "quest_history_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."scene_items"
    ADD CONSTRAINT "scene_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."shop_purchases"
    ADD CONSTRAINT "shop_purchases_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."trade_items"
    ADD CONSTRAINT "trade_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."trade_items"
    ADD CONSTRAINT "trade_items_session_id_player_id_slot_index_key" UNIQUE ("session_id", "player_id", "slot_index");



ALTER TABLE ONLY "player"."trade_logs"
    ADD CONSTRAINT "trade_logs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "player"."trade_sessions"
    ADD CONSTRAINT "trade_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."giftcode_campaigns"
    ADD CONSTRAINT "giftcode_campaigns_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."giftcode_codes"
    ADD CONSTRAINT "giftcode_codes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."giftcode_redemptions"
    ADD CONSTRAINT "giftcode_redemptions_code_id_character_id_key" UNIQUE ("code_id", "character_id");



ALTER TABLE ONLY "public"."giftcode_redemptions"
    ADD CONSTRAINT "giftcode_redemptions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."giftcode_rewards"
    ADD CONSTRAINT "giftcode_rewards_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."accounts"
    ADD CONSTRAINT "accounts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."accounts"
    ADD CONSTRAINT "accounts_username_key" UNIQUE ("username");



ALTER TABLE ONLY "public"."login_history"
    ADD CONSTRAINT "login_history_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_giftcode_campaigns_status" ON "public"."giftcode_campaigns" USING "btree" ("status", "starts_at", "ends_at");



CREATE INDEX "idx_giftcode_codes_campaign_status" ON "public"."giftcode_codes" USING "btree" ("campaign_id", "status");



CREATE INDEX "idx_giftcode_redemptions_campaign_character" ON "public"."giftcode_redemptions" USING "btree" ("campaign_id", "character_id");



CREATE INDEX "idx_giftcode_redemptions_character_redeemed_at" ON "public"."giftcode_redemptions" USING "btree" ("character_id", "redeemed_at" DESC);



CREATE INDEX "idx_giftcode_rewards_campaign" ON "public"."giftcode_rewards" USING "btree" ("campaign_id", "sort_order", "id");



CREATE UNIQUE INDEX "uq_giftcode_campaigns_key_norm" ON "public"."giftcode_campaigns" USING "btree" ("campaign_key_norm");



CREATE UNIQUE INDEX "uq_giftcode_codes_code_norm" ON "public"."giftcode_codes" USING "btree" ("code_norm");



CREATE INDEX "idx_auction_bids_auction" ON "player"."auction_bids" USING "btree" ("auction_id", "created_at" DESC);



CREATE INDEX "idx_auctions_bidder" ON "player"."auctions" USING "btree" ("bidder_id") WHERE ("bidder_id" IS NOT NULL);



CREATE INDEX "idx_auctions_expires" ON "player"."auctions" USING "btree" ("expires_at", "status") WHERE ("status" = 0);



CREATE INDEX "idx_auctions_seller" ON "player"."auctions" USING "btree" ("seller_id", "status");



CREATE INDEX "idx_auctions_template" ON "player"."auctions" USING "btree" ("template_id", "status");



CREATE INDEX "idx_battle_logs_time" ON "player"."battle_logs" USING "btree" ("created_at" DESC);



CREATE INDEX "idx_battle_logs_type" ON "player"."battle_logs" USING "btree" ("battle_type", "created_at" DESC);



CREATE INDEX "idx_blocks_character" ON "player"."blocks" USING "btree" ("character_id");



CREATE INDEX "idx_character_achievements_char" ON "player"."character_achievements" USING "btree" ("character_id");



CREATE INDEX "idx_character_achievements_completed" ON "player"."character_achievements" USING "btree" ("character_id", "is_completed");



CREATE INDEX "idx_character_buffs_char" ON "player"."character_buffs" USING "btree" ("character_id");



CREATE INDEX "idx_character_buffs_expires" ON "player"."character_buffs" USING "btree" ("expires_at") WHERE ("expires_at" IS NOT NULL);



CREATE INDEX "idx_character_currencies_char" ON "player"."character_currencies" USING "btree" ("character_id");



CREATE INDEX "idx_character_decorations_char" ON "player"."character_decorations" USING "btree" ("character_id");



CREATE INDEX "idx_character_decorations_equipped" ON "player"."character_decorations" USING "btree" ("character_id", "is_equipped") WHERE ("is_equipped" = true);



CREATE INDEX "idx_character_fairies_char" ON "player"."character_fairies" USING "btree" ("character_id");



CREATE INDEX "idx_character_flyers_char" ON "player"."character_flyers" USING "btree" ("character_id");



CREATE INDEX "idx_character_items_char" ON "player"."character_items" USING "btree" ("character_id");



CREATE INDEX "idx_character_items_slot" ON "player"."character_items" USING "btree" ("character_id", "slot_type");



CREATE INDEX "idx_character_items_template" ON "player"."character_items" USING "btree" ("template_id");



CREATE INDEX "idx_character_loops_char" ON "player"."character_loops" USING "btree" ("character_id");



CREATE INDEX "idx_character_mounts_char" ON "player"."character_mounts" USING "btree" ("character_id");



CREATE INDEX "idx_character_pets_char" ON "player"."character_pets" USING "btree" ("character_id");



CREATE INDEX "idx_character_pets_following" ON "player"."character_pets" USING "btree" ("character_id", "is_following") WHERE ("is_following" = true);



CREATE INDEX "idx_character_pets_template" ON "player"."character_pets" USING "btree" ("template_id");



CREATE INDEX "idx_character_quests_char" ON "player"."character_quests" USING "btree" ("character_id");



CREATE INDEX "idx_character_quests_expires" ON "player"."character_quests" USING "btree" ("expires_at") WHERE ("expires_at" IS NOT NULL);



CREATE INDEX "idx_character_quests_status" ON "player"."character_quests" USING "btree" ("character_id", "status");



CREATE INDEX "idx_character_runes_char" ON "player"."character_runes" USING "btree" ("character_id");



CREATE INDEX "idx_character_shop_limits_char" ON "player"."character_shop_limits" USING "btree" ("character_id");



CREATE INDEX "idx_character_skills_char" ON "player"."character_skills" USING "btree" ("character_id");



CREATE INDEX "idx_character_skills_slot" ON "player"."character_skills" USING "btree" ("character_id", "slot_position") WHERE ("slot_position" IS NOT NULL);



CREATE INDEX "idx_character_titles_active" ON "player"."character_titles" USING "btree" ("character_id", "is_active") WHERE ("is_active" = true);



CREATE INDEX "idx_character_titles_char" ON "player"."character_titles" USING "btree" ("character_id");



CREATE INDEX "idx_characters_account_id" ON "player"."characters" USING "btree" ("account_id");



CREATE INDEX "idx_characters_guild" ON "player"."characters" USING "btree" ("guild_id") WHERE ("guild_id" IS NOT NULL);



CREATE INDEX "idx_characters_honor" ON "player"."characters" USING "btree" ("honor" DESC) WHERE ("honor" > 0);



CREATE INDEX "idx_characters_map_id" ON "player"."characters" USING "btree" ("map_id");



CREATE INDEX "idx_characters_name" ON "player"."characters" USING "btree" ("name");



CREATE INDEX "idx_characters_online" ON "player"."characters" USING "btree" ("last_active" DESC);



CREATE INDEX "idx_chat_logs_channel" ON "player"."chat_logs" USING "btree" ("channel", "created_at" DESC);



CREATE INDEX "idx_chat_logs_char" ON "player"."chat_logs" USING "btree" ("character_id", "created_at" DESC);



CREATE INDEX "idx_chat_logs_time" ON "player"."chat_logs" USING "btree" ("created_at" DESC);



CREATE INDEX "idx_friend_requests_to" ON "player"."friend_requests" USING "btree" ("to_id", "status");



CREATE INDEX "idx_friends_character" ON "player"."friends" USING "btree" ("character_id");



CREATE INDEX "idx_friends_friend" ON "player"."friends" USING "btree" ("friend_id");



CREATE INDEX "idx_game_data_data" ON "player"."game_data_templates" USING "gin" ("data");



CREATE INDEX "idx_game_data_record" ON "player"."game_data_templates" USING "btree" ("table_name", "record_id");



CREATE INDEX "idx_game_data_table" ON "player"."game_data_templates" USING "btree" ("table_name");



CREATE INDEX "idx_guild_applications_guild" ON "player"."guild_applications" USING "btree" ("guild_id", "status");



CREATE INDEX "idx_guild_logs_guild" ON "player"."guild_logs" USING "btree" ("guild_id", "created_at" DESC);



CREATE INDEX "idx_guild_members_character" ON "player"."guild_members" USING "btree" ("character_id");



CREATE INDEX "idx_guild_members_guild" ON "player"."guild_members" USING "btree" ("guild_id");



CREATE INDEX "idx_guild_members_rank" ON "player"."guild_members" USING "btree" ("guild_id", "rank");



CREATE INDEX "idx_guild_skills_guild" ON "player"."guild_skills" USING "btree" ("guild_id");



CREATE INDEX "idx_guild_warehouse_guild" ON "player"."guild_warehouse" USING "btree" ("guild_id");



CREATE INDEX "idx_guilds_leader" ON "player"."guilds" USING "btree" ("leader_id");



CREATE INDEX "idx_guilds_level" ON "player"."guilds" USING "btree" ("level" DESC);



CREATE INDEX "idx_guilds_ranking" ON "player"."guilds" USING "btree" ("level" DESC, "experience" DESC);



CREATE INDEX "idx_item_souls_item" ON "player"."item_souls" USING "btree" ("item_id");



CREATE INDEX "idx_mail_attachments_mail" ON "player"."mail_attachments" USING "btree" ("mail_id");



CREATE INDEX "idx_mails_created" ON "player"."mails" USING "btree" ("recipient_id", "created_at" DESC);



CREATE INDEX "idx_mails_expires" ON "player"."mails" USING "btree" ("expires_at") WHERE ("expires_at" IS NOT NULL);



CREATE INDEX "idx_mails_recipient" ON "player"."mails" USING "btree" ("recipient_id", "is_read");



CREATE INDEX "idx_marriages_partners" ON "player"."marriages" USING "btree" ("partner1_id", "partner2_id");



CREATE INDEX "idx_npcs_map" ON "player"."npcs" USING "btree" ("map_id", "is_active");



CREATE INDEX "idx_npcs_template" ON "player"."npcs" USING "btree" ("template_id");



CREATE INDEX "idx_pet_arena_battles_attacker" ON "player"."pet_arena_battles" USING "btree" ("attacker_id", "created_at" DESC);



CREATE INDEX "idx_pet_arena_battles_defender" ON "player"."pet_arena_battles" USING "btree" ("defender_id", "created_at" DESC);



CREATE INDEX "idx_pet_arena_battles_season" ON "player"."pet_arena_battles" USING "btree" ("season", "created_at" DESC);



CREATE INDEX "idx_pet_arena_rankings_character" ON "player"."pet_arena_rankings" USING "btree" ("character_id");



CREATE INDEX "idx_pet_arena_rankings_season_rating" ON "player"."pet_arena_rankings" USING "btree" ("season", "rating" DESC);



CREATE INDEX "idx_pet_skills_pet" ON "player"."pet_skills" USING "btree" ("pet_id");



CREATE INDEX "idx_quest_history_char" ON "player"."quest_history" USING "btree" ("character_id");



CREATE INDEX "idx_quest_history_quest" ON "player"."quest_history" USING "btree" ("character_id", "quest_id");



CREATE INDEX "idx_scene_items_expires" ON "player"."scene_items" USING "btree" ("expires_at") WHERE ("expires_at" IS NOT NULL);



CREATE INDEX "idx_scene_items_map" ON "player"."scene_items" USING "btree" ("map_id");



CREATE INDEX "idx_scene_items_owner" ON "player"."scene_items" USING "btree" ("owner_id") WHERE ("owner_id" IS NOT NULL);



CREATE INDEX "idx_shop_purchases_char" ON "player"."shop_purchases" USING "btree" ("character_id", "created_at" DESC);



CREATE INDEX "idx_shop_purchases_item" ON "player"."shop_purchases" USING "btree" ("character_id", "item_template_id");



CREATE INDEX "idx_trade_logs_player1" ON "player"."trade_logs" USING "btree" ("player1_id", "created_at" DESC);



CREATE INDEX "idx_trade_logs_player2" ON "player"."trade_logs" USING "btree" ("player2_id", "created_at" DESC);



CREATE INDEX "idx_accounts_email" ON "public"."accounts" USING "btree" ("email");



CREATE INDEX "idx_accounts_username" ON "public"."accounts" USING "btree" ("username");



CREATE INDEX "idx_login_history_account" ON "public"."login_history" USING "btree" ("account_id", "login_at" DESC);



CREATE INDEX "idx_login_history_character" ON "public"."login_history" USING "btree" ("character_id", "login_at" DESC) WHERE ("character_id" IS NOT NULL);



CREATE INDEX "idx_sessions_account" ON "public"."sessions" USING "btree" ("account_id", "is_active");



CREATE INDEX "idx_sessions_character" ON "public"."sessions" USING "btree" ("character_id", "is_active") WHERE ("character_id" IS NOT NULL);



CREATE OR REPLACE TRIGGER "update_character_currencies_updated_at" BEFORE UPDATE ON "player"."character_currencies" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "update_guilds_updated_at" BEFORE UPDATE ON "player"."guilds" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



ALTER TABLE ONLY "player"."auction_bids"
    ADD CONSTRAINT "auction_bids_auction_id_fkey" FOREIGN KEY ("auction_id") REFERENCES "player"."auctions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."auction_bids"
    ADD CONSTRAINT "auction_bids_bidder_id_fkey" FOREIGN KEY ("bidder_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."auctions"
    ADD CONSTRAINT "auctions_bidder_id_fkey" FOREIGN KEY ("bidder_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."auctions"
    ADD CONSTRAINT "auctions_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."blocks"
    ADD CONSTRAINT "blocks_blocked_id_fkey" FOREIGN KEY ("blocked_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."blocks"
    ADD CONSTRAINT "blocks_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_achievements"
    ADD CONSTRAINT "character_achievements_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_buffs"
    ADD CONSTRAINT "character_buffs_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_currencies"
    ADD CONSTRAINT "character_currencies_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_decorations"
    ADD CONSTRAINT "character_decorations_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_fairies"
    ADD CONSTRAINT "character_fairies_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_flyers"
    ADD CONSTRAINT "character_flyers_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_items"
    ADD CONSTRAINT "character_items_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_loops"
    ADD CONSTRAINT "character_loops_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_mounts"
    ADD CONSTRAINT "character_mounts_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_pets"
    ADD CONSTRAINT "character_pets_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_quests"
    ADD CONSTRAINT "character_quests_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_runes"
    ADD CONSTRAINT "character_runes_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_shop_limits"
    ADD CONSTRAINT "character_shop_limits_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_skills"
    ADD CONSTRAINT "character_skills_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."character_titles"
    ADD CONSTRAINT "character_titles_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."characters"
    ADD CONSTRAINT "characters_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "player"."guilds"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "player"."chat_logs"
    ADD CONSTRAINT "chat_logs_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."friend_requests"
    ADD CONSTRAINT "friend_requests_from_id_fkey" FOREIGN KEY ("from_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."friend_requests"
    ADD CONSTRAINT "friend_requests_to_id_fkey" FOREIGN KEY ("to_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."friends"
    ADD CONSTRAINT "friends_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."friends"
    ADD CONSTRAINT "friends_friend_id_fkey" FOREIGN KEY ("friend_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_applications"
    ADD CONSTRAINT "guild_applications_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_applications"
    ADD CONSTRAINT "guild_applications_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "player"."guilds"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_applications"
    ADD CONSTRAINT "guild_applications_processed_by_fkey" FOREIGN KEY ("processed_by") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."guild_logs"
    ADD CONSTRAINT "guild_logs_actor_id_fkey" FOREIGN KEY ("actor_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."guild_logs"
    ADD CONSTRAINT "guild_logs_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "player"."guilds"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_logs"
    ADD CONSTRAINT "guild_logs_target_id_fkey" FOREIGN KEY ("target_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."guild_members"
    ADD CONSTRAINT "guild_members_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_members"
    ADD CONSTRAINT "guild_members_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "player"."guilds"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_skills"
    ADD CONSTRAINT "guild_skills_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "player"."guilds"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guild_warehouse"
    ADD CONSTRAINT "guild_warehouse_deposited_by_fkey" FOREIGN KEY ("deposited_by") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."guild_warehouse"
    ADD CONSTRAINT "guild_warehouse_guild_id_fkey" FOREIGN KEY ("guild_id") REFERENCES "player"."guilds"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."guilds"
    ADD CONSTRAINT "guilds_leader_id_fkey" FOREIGN KEY ("leader_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."item_souls"
    ADD CONSTRAINT "item_souls_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "player"."character_items"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."mail_attachments"
    ADD CONSTRAINT "mail_attachments_mail_id_fkey" FOREIGN KEY ("mail_id") REFERENCES "player"."mails"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."mails"
    ADD CONSTRAINT "mails_recipient_id_fkey" FOREIGN KEY ("recipient_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."mails"
    ADD CONSTRAINT "mails_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "player"."characters"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "player"."marriages"
    ADD CONSTRAINT "marriages_partner1_id_fkey" FOREIGN KEY ("partner1_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."marriages"
    ADD CONSTRAINT "marriages_partner2_id_fkey" FOREIGN KEY ("partner2_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."pet_arena_battles"
    ADD CONSTRAINT "pet_arena_battles_attacker_id_fkey" FOREIGN KEY ("attacker_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."pet_arena_battles"
    ADD CONSTRAINT "pet_arena_battles_defender_id_fkey" FOREIGN KEY ("defender_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."pet_arena_battles"
    ADD CONSTRAINT "pet_arena_battles_winner_id_fkey" FOREIGN KEY ("winner_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."pet_arena_rankings"
    ADD CONSTRAINT "pet_arena_rankings_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."pet_arena_rankings"
    ADD CONSTRAINT "pet_arena_rankings_pet_id_fkey" FOREIGN KEY ("pet_id") REFERENCES "player"."character_pets"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "player"."pet_arena_rewards"
    ADD CONSTRAINT "pet_arena_rewards_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."pet_skills"
    ADD CONSTRAINT "pet_skills_pet_id_fkey" FOREIGN KEY ("pet_id") REFERENCES "player"."character_pets"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."quest_history"
    ADD CONSTRAINT "quest_history_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."scene_items"
    ADD CONSTRAINT "scene_items_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "player"."characters"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "player"."shop_purchases"
    ADD CONSTRAINT "shop_purchases_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."trade_items"
    ADD CONSTRAINT "trade_items_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."trade_items"
    ADD CONSTRAINT "trade_items_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "player"."trade_sessions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "player"."trade_sessions"
    ADD CONSTRAINT "trade_sessions_player1_id_fkey" FOREIGN KEY ("player1_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "player"."trade_sessions"
    ADD CONSTRAINT "trade_sessions_player2_id_fkey" FOREIGN KEY ("player2_id") REFERENCES "player"."characters"("id");



ALTER TABLE ONLY "public"."giftcode_codes"
    ADD CONSTRAINT "giftcode_codes_campaign_id_fkey" FOREIGN KEY ("campaign_id") REFERENCES "public"."giftcode_campaigns"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."giftcode_redemptions"
    ADD CONSTRAINT "giftcode_redemptions_campaign_id_fkey" FOREIGN KEY ("campaign_id") REFERENCES "public"."giftcode_campaigns"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."giftcode_redemptions"
    ADD CONSTRAINT "giftcode_redemptions_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."giftcode_redemptions"
    ADD CONSTRAINT "giftcode_redemptions_code_id_fkey" FOREIGN KEY ("code_id") REFERENCES "public"."giftcode_codes"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."giftcode_rewards"
    ADD CONSTRAINT "giftcode_rewards_campaign_id_fkey" FOREIGN KEY ("campaign_id") REFERENCES "public"."giftcode_campaigns"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."login_history"
    ADD CONSTRAINT "login_history_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "public"."accounts"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."sessions"
    ADD CONSTRAINT "sessions_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "public"."accounts"("id") ON DELETE CASCADE;



GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "anon";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_campaigns" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_campaigns" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_campaigns" TO "service_role";



GRANT ALL ON SEQUENCE "public"."giftcode_campaigns_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."giftcode_campaigns_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."giftcode_campaigns_id_seq" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_codes" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_codes" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_codes" TO "service_role";



GRANT ALL ON SEQUENCE "public"."giftcode_codes_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."giftcode_codes_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."giftcode_codes_id_seq" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_redemptions" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_redemptions" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_redemptions" TO "service_role";



GRANT ALL ON SEQUENCE "public"."giftcode_redemptions_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."giftcode_redemptions_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."giftcode_redemptions_id_seq" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_rewards" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_rewards" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."giftcode_rewards" TO "service_role";



GRANT ALL ON SEQUENCE "public"."giftcode_rewards_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."giftcode_rewards_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."giftcode_rewards_id_seq" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."accounts" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."accounts" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."accounts" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."login_history" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."login_history" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."login_history" TO "service_role";



GRANT ALL ON SEQUENCE "public"."login_history_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."login_history_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."login_history_id_seq" TO "service_role";



GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."sessions" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."sessions" TO "authenticated";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE "public"."sessions" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO "service_role";







