revoke delete on table "player"."character_combat_stats" from "service_role";

revoke insert on table "player"."character_combat_stats" from "service_role";

revoke references on table "player"."character_combat_stats" from "service_role";

revoke select on table "player"."character_combat_stats" from "service_role";

revoke trigger on table "player"."character_combat_stats" from "service_role";

revoke truncate on table "player"."character_combat_stats" from "service_role";

revoke update on table "player"."character_combat_stats" from "service_role";

alter table "player"."character_combat_stats" drop constraint "character_combat_stats_character_id_fkey";

drop function if exists "player"."create_character_full"(p_account_id uuid, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_max_hp integer, p_max_mp integer, p_max_sp integer, p_attack integer, p_defense integer, p_magic_attack integer, p_magic_defense integer, p_hit integer, p_dodge integer, p_critical integer, p_critical_dmg integer, p_speed integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_honor bigint, p_chivalry bigint, p_reputation bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb);

drop function if exists "player"."create_character_full"(p_account_id uuid, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_max_hp integer, p_max_mp integer, p_max_sp integer, p_attack integer, p_defense integer, p_magic_attack integer, p_magic_defense integer, p_hit integer, p_dodge integer, p_critical integer, p_critical_dmg integer, p_speed integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_honor bigint, p_chivalry bigint, p_reputation bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb);

drop view if exists "player"."characters_full";

drop function if exists "player"."query_characters_full"(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying);

drop function if exists "player"."update_character_full"(p_id bigint, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_max_hp integer, p_max_mp integer, p_max_sp integer, p_attack integer, p_defense integer, p_magic_attack integer, p_magic_defense integer, p_hit integer, p_dodge integer, p_critical integer, p_critical_dmg integer, p_speed integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb);

drop function if exists "player"."update_character_full"(p_id bigint, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_max_hp integer, p_max_mp integer, p_max_sp integer, p_attack integer, p_defense integer, p_magic_attack integer, p_magic_defense integer, p_hit integer, p_dodge integer, p_critical integer, p_critical_dmg integer, p_speed integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb);

alter table "player"."character_combat_stats" drop constraint "character_combat_stats_pkey";

drop index if exists "player"."character_combat_stats_pkey";

drop table "player"."character_combat_stats";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.create_character_full(p_account_id uuid, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_honor bigint, p_chivalry bigint, p_reputation bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    v_id bigint;
begin
    insert into player.characters (
        account_id, name, class_id, gender,
        map_id, pos_x, pos_y, direction,
        guild_restore_contrib, guild_restore_donate,
        vip_type, vip_expires_at,
        dress_info, gm_level,
        created_at, last_active, total_online
    ) values (
        p_account_id, p_name, p_class_id, p_gender,
        p_map_id, p_pos_x, p_pos_y, p_direction,
        p_guild_restore_contrib, p_guild_restore_donate,
        p_vip_type, p_vip_expires_at,
        p_dress_info, p_gm_level,
        p_created_at, p_last_active, p_total_online
    ) returning id into v_id;

    insert into player.character_progression (character_id, level, experience, rebirth_level, rebirth_exp)
    values (v_id, p_level, p_experience, p_rebirth_level, p_rebirth_exp);

    insert into player.character_attributes (
        character_id, strength, agility, stamina, intelligence, spirit, attr_points,
        max_attr_points, distributed_attr_points,
        current_hp, current_mp, current_sp,
        apt_strength, apt_agility, apt_stamina, apt_intelligence, apt_energy,
        apt_strength_evolution, apt_agility_evolution, apt_stamina_evolution, apt_intelligence_evolution, apt_energy_evolution
    ) values (
        v_id, p_strength, p_agility, p_stamina, p_intelligence, p_spirit, p_attr_points,
        p_max_attr_points, p_distributed_attr_points,
        p_current_hp, p_current_mp, p_current_sp,
        p_apt_strength, p_apt_agility, p_apt_stamina, p_apt_intelligence, p_apt_energy,
        p_apt_strength_evolution, p_apt_agility_evolution, p_apt_stamina_evolution, p_apt_intelligence_evolution, p_apt_energy_evolution
    );

    insert into player.character_wallet (
        character_id, money, money_bind, gold, gold_bind,
        honor, chivalry, reputation, pop,
        selected_money_type, selected_gold_type
    ) values (
        v_id, p_money, p_money_bind, p_gold, p_gold_bind,
        p_honor, p_chivalry, p_reputation, p_pop,
        p_selected_money_type, p_selected_gold_type
    );

    insert into player.character_resources (
        character_id, bag_slots, bank_slots, pet_slots, temp_bag_slots, mx_temp_bag_slots
    ) values (
        v_id, p_bag_slots, p_bank_slots, p_pet_slots, p_temp_bag_slots, p_mx_temp_bag_slots
    );

    insert into player.character_life_skills (
        character_id, cook_dex, fish_dex, plant_dex, medicine_dex, herb_dex
    ) values (
        v_id, p_cook_dex, p_fish_dex, p_plant_dex, p_medicine_dex, p_herb_dex
    );

    insert into player.character_feature_states (
        character_id, element_type, element_rank, element_max,
        pm_exp, pm_process_data, pm_findback, pet_guard_data, boss_daily
    ) values (
        v_id,
        coalesce(nullif(p_element_type, ''), '0')::integer,
        p_element_rank, p_element_max,
        p_pm_exp, p_pm_process_data, p_pm_findback, p_pet_guard_data, p_boss_daily
    );

    return v_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_full(p_id bigint, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    v_rows integer;
begin
    update player.characters set
        name = p_name,
        class_id = p_class_id,
        gender = p_gender,
        map_id = p_map_id,
        pos_x = p_pos_x,
        pos_y = p_pos_y,
        direction = p_direction,
        guild_restore_contrib = p_guild_restore_contrib,
        guild_restore_donate = p_guild_restore_donate,
        vip_type = p_vip_type,
        vip_expires_at = p_vip_expires_at,
        dress_info = p_dress_info,
        gm_level = p_gm_level,
        last_active = p_last_active,
        total_online = p_total_online
    where id = p_id;

    get diagnostics v_rows = row_count;
    if v_rows = 0 then
        return false;
    end if;

    update player.character_progression set
        level = p_level,
        experience = p_experience,
        rebirth_level = p_rebirth_level,
        rebirth_exp = p_rebirth_exp
    where character_id = p_id;

    update player.character_attributes set
        strength = p_strength,
        agility = p_agility,
        stamina = p_stamina,
        intelligence = p_intelligence,
        spirit = p_spirit,
        attr_points = p_attr_points,
        max_attr_points = p_max_attr_points,
        distributed_attr_points = p_distributed_attr_points,
        current_hp = p_current_hp,
        current_mp = p_current_mp,
        current_sp = p_current_sp,
        apt_strength = p_apt_strength,
        apt_agility = p_apt_agility,
        apt_stamina = p_apt_stamina,
        apt_intelligence = p_apt_intelligence,
        apt_energy = p_apt_energy,
        apt_strength_evolution = p_apt_strength_evolution,
        apt_agility_evolution = p_apt_agility_evolution,
        apt_stamina_evolution = p_apt_stamina_evolution,
        apt_intelligence_evolution = p_apt_intelligence_evolution,
        apt_energy_evolution = p_apt_energy_evolution
    where character_id = p_id;

    update player.character_wallet set
        money = p_money,
        money_bind = p_money_bind,
        gold = p_gold,
        gold_bind = p_gold_bind,
        pop = p_pop,
        selected_money_type = p_selected_money_type,
        selected_gold_type = p_selected_gold_type
    where character_id = p_id;

    update player.character_resources set
        bag_slots = p_bag_slots,
        bank_slots = p_bank_slots,
        pet_slots = p_pet_slots,
        temp_bag_slots = p_temp_bag_slots,
        mx_temp_bag_slots = p_mx_temp_bag_slots
    where character_id = p_id;

    update player.character_life_skills set
        cook_dex = p_cook_dex,
        fish_dex = p_fish_dex,
        plant_dex = p_plant_dex,
        medicine_dex = p_medicine_dex,
        herb_dex = p_herb_dex
    where character_id = p_id;

    update player.character_feature_states set
        element_type = coalesce(nullif(p_element_type, ''), '0')::integer,
        element_rank = p_element_rank,
        element_max = p_element_max,
        pm_exp = p_pm_exp,
        pm_process_data = p_pm_process_data,
        pm_findback = p_pm_findback,
        pet_guard_data = p_pet_guard_data,
        boss_daily = p_boss_daily
    where character_id = p_id;

    return true;
end;
$function$
;

create or replace view "player"."characters_full" as  SELECT c.id,
    c.account_id,
    c.name,
    c.class_id,
    c.gender,
    p.level,
    p.experience,
    p.rebirth_level,
    p.rebirth_exp,
    a.strength,
    a.agility,
    a.stamina,
    a.intelligence,
    a.spirit,
    a.attr_points,
    a.current_hp,
    a.current_mp,
    a.current_sp,
    NULL::integer AS max_hp,
    NULL::integer AS max_mp,
    NULL::integer AS max_sp,
    NULL::integer AS attack,
    NULL::integer AS defense,
    NULL::integer AS magic_attack,
    NULL::integer AS magic_defense,
    NULL::integer AS hit,
    NULL::integer AS dodge,
    NULL::integer AS critical,
    NULL::integer AS critical_dmg,
    NULL::integer AS speed,
    c.map_id,
    c.pos_x,
    c.pos_y,
    c.direction,
    w.money,
    w.money_bind,
    w.gold,
    w.gold_bind,
    c.guild_id,
    c.vip_type,
    c.vip_expires_at,
    w.honor,
    w.chivalry,
    p.awaken_level,
    p.awaken_points,
    p.awaken_points_used,
    p.star_level,
    p.soul_exp,
    p.soul_level,
    p.soul_points,
    r.move_points,
    r.max_move_points,
    r.activity_points,
    r.max_activity_points,
    r.vigor,
    r.max_vigor,
    r.bag_slots,
    r.bank_slots,
    r.pet_slots,
    r.temp_bag_slots,
    r.mx_temp_bag_slots,
    c.gm_level,
    w.reputation,
    c.created_at,
    c.last_active,
    c.total_online,
    f.element_type,
    f.element_rank,
    f.element_max,
    w.selected_money_type,
    w.selected_gold_type,
    a.apt_agility,
    a.apt_agility_evolution,
    a.apt_energy,
    a.apt_energy_evolution,
    a.apt_intelligence,
    a.apt_intelligence_evolution,
    a.apt_stamina,
    a.apt_stamina_evolution,
    a.apt_strength,
    a.apt_strength_evolution,
    f.pet_guard_data,
    f.pm_exp,
    f.pm_process_data,
    f.pm_findback,
    l.cook_dex,
    l.fish_dex,
    l.herb_dex,
    l.medicine_dex,
    l.plant_dex,
    c.guild_restore_contrib,
    c.guild_restore_donate,
    w.pop,
    f.boss_daily,
    c.dress_info
   FROM ((((((player.characters c
     LEFT JOIN player.character_progression p ON ((p.character_id = c.id)))
     LEFT JOIN player.character_attributes a ON ((a.character_id = c.id)))
     LEFT JOIN player.character_wallet w ON ((w.character_id = c.id)))
     LEFT JOIN player.character_resources r ON ((r.character_id = c.id)))
     LEFT JOIN player.character_life_skills l ON ((l.character_id = c.id)))
     LEFT JOIN player.character_feature_states f ON ((f.character_id = c.id)));


CREATE OR REPLACE FUNCTION player.query_characters_full(p_id bigint DEFAULT NULL::bigint, p_account_id uuid DEFAULT NULL::uuid, p_map_id integer DEFAULT NULL::integer, p_name character varying DEFAULT NULL::character varying)
 RETURNS TABLE(id bigint, account_id uuid, name character varying, class_id integer, gender integer, level integer, experience bigint, rebirth_level integer, rebirth_exp bigint, strength integer, agility integer, stamina integer, intelligence integer, spirit integer, attr_points integer, max_attr_points integer, distributed_attr_points integer, current_hp integer, current_mp integer, current_sp integer, map_id integer, pos_x integer, pos_y integer, direction integer, guild_id bigint, money bigint, money_bind bigint, gold bigint, gold_bind bigint, guild_restore_contrib integer, guild_restore_donate integer, pop bigint, vip_type integer, vip_expires_at timestamp with time zone, pm_exp bigint, pm_process_data jsonb, pm_findback boolean, dress_info text, bag_slots integer, bank_slots integer, pet_slots integer, temp_bag_slots integer, mx_temp_bag_slots integer, gm_level integer, selected_money_type integer, selected_gold_type integer, pet_guard_data jsonb, boss_daily jsonb, element_type text, element_rank integer, element_max boolean, apt_strength integer, apt_agility integer, apt_stamina integer, apt_intelligence integer, apt_energy integer, apt_strength_evolution integer, apt_agility_evolution integer, apt_stamina_evolution integer, apt_intelligence_evolution integer, apt_energy_evolution integer, cook_dex integer, fish_dex integer, plant_dex integer, medicine_dex integer, herb_dex integer, created_at timestamp with time zone, last_active timestamp with time zone, total_online bigint, class_apt_strength integer, class_apt_agility integer, class_apt_stamina integer, class_apt_intelligence integer, class_apt_energy integer)
 LANGUAGE sql
AS $function$
    select
        c.id,
        c.account_id,
        c.name,
        c.class_id,
        c.gender,
        pr.level,
        pr.experience,
        pr.rebirth_level,
        pr.rebirth_exp,
        a.strength,
        a.agility,
        a.stamina,
        a.intelligence,
        a.spirit,
        a.attr_points,
        a.max_attr_points,
        a.distributed_attr_points,
        a.current_hp,
        a.current_mp,
        a.current_sp,
        c.map_id,
        c.pos_x,
        c.pos_y,
        c.direction,
        c.guild_id,
        w.money,
        w.money_bind,
        w.gold,
        w.gold_bind,
        coalesce(c.guild_restore_contrib, 0),
        coalesce(c.guild_restore_donate, 0),
        w.pop,
        coalesce(c.vip_type, 0),
        c.vip_expires_at,
        f.pm_exp,
        f.pm_process_data,
        f.pm_findback,
        c.dress_info,
        r.bag_slots,
        r.bank_slots,
        r.pet_slots,
        r.temp_bag_slots,
        r.mx_temp_bag_slots,
        coalesce(c.gm_level, 0),
        w.selected_money_type,
        w.selected_gold_type,
        f.pet_guard_data,
        coalesce(f.boss_daily, '{}'::jsonb),
        f.element_type::text,
        f.element_rank,
        f.element_max,
        a.apt_strength,
        a.apt_agility,
        a.apt_stamina,
        a.apt_intelligence,
        a.apt_energy,
        a.apt_strength_evolution,
        a.apt_agility_evolution,
        a.apt_stamina_evolution,
        a.apt_intelligence_evolution,
        a.apt_energy_evolution,
        l.cook_dex,
        l.fish_dex,
        l.plant_dex,
        l.medicine_dex,
        l.herb_dex,
        c.created_at,
        c.last_active,
        c.total_online,
        cls.apt_strength::integer,
        cls.apt_agility::integer,
        cls.apt_stamina::integer,
        cls.apt_intelligence::integer,
        cls.apt_energy::integer
    from player.characters as c
    inner join player.character_progression as pr on pr.character_id = c.id
    inner join player.character_attributes as a on a.character_id = c.id
    inner join player.character_wallet as w on w.character_id = c.id
    inner join player.character_resources as r on r.character_id = c.id
    inner join player.character_life_skills as l on l.character_id = c.id
    inner join player.character_feature_states as f on f.character_id = c.id
    inner join data.data_tbl_class as cls on cls.id = c.class_id
    where (p_id is null or c.id = p_id)
      and (p_account_id is null or c.account_id = p_account_id)
      and (p_map_id is null or c.map_id = p_map_id)
      and (p_name is null or c.name = p_name)
    order by
        case when p_account_id is not null then c.created_at end desc,
        case when p_map_id is not null then c.name end asc,
        c.id;
$function$
;

grant select on player.characters_full to service_role;
grant select on player.characters_full to authenticated;
grant select on player.characters_full to anon;

alter view "player"."characters_full" set (security_invoker = on);

alter function player.create_character_full(p_account_id uuid, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_honor bigint, p_chivalry bigint, p_reputation bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb) set search_path = '';
revoke execute on function player.create_character_full(p_account_id uuid, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_honor bigint, p_chivalry bigint, p_reputation bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb) from public, anon, authenticated;
grant execute on function player.create_character_full(p_account_id uuid, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_honor bigint, p_chivalry bigint, p_reputation bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb) to service_role;

alter function player.update_character_full(p_id bigint, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb) set search_path = '';
revoke execute on function player.update_character_full(p_id bigint, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb) from public, anon, authenticated;
grant execute on function player.update_character_full(p_id bigint, p_name character varying, p_class_id integer, p_gender integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_guild_restore_contrib integer, p_guild_restore_donate integer, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_dress_info text, p_gm_level integer, p_last_active timestamp with time zone, p_total_online bigint, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_max_attr_points integer, p_distributed_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_pop bigint, p_selected_money_type integer, p_selected_gold_type integer, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_cook_dex integer, p_fish_dex integer, p_plant_dex integer, p_medicine_dex integer, p_herb_dex integer, p_element_type text, p_element_rank integer, p_element_max boolean, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_pet_guard_data jsonb, p_boss_daily jsonb) to service_role;

alter function player.query_characters_full(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying) set search_path = '';
revoke execute on function player.query_characters_full(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying) from public, anon, authenticated;
grant execute on function player.query_characters_full(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying) to service_role;

