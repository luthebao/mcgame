drop function if exists "player"."query_characters_full"(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.query_characters_full(p_id bigint DEFAULT NULL::bigint, p_account_id uuid DEFAULT NULL::uuid, p_map_id integer DEFAULT NULL::integer, p_name character varying DEFAULT NULL::character varying)
 RETURNS TABLE(id bigint, account_id uuid, name character varying, class_id integer, gender integer, level integer, experience bigint, rebirth_level integer, rebirth_exp bigint, strength integer, agility integer, stamina integer, intelligence integer, spirit integer, attr_points integer, max_attr_points integer, distributed_attr_points integer, current_hp integer, current_mp integer, current_sp integer, map_id integer, pos_x integer, pos_y integer, direction integer, guild_id bigint, money bigint, money_bind bigint, gold bigint, gold_bind bigint, guild_restore_contrib integer, guild_restore_donate integer, pop bigint, vip_type integer, vip_expires_at timestamp with time zone, pm_exp bigint, pm_process_data jsonb, pm_findback boolean, dress_info text, bag_slots integer, bank_slots integer, pet_slots integer, temp_bag_slots integer, mx_temp_bag_slots integer, gm_level integer, selected_money_type integer, selected_gold_type integer, pet_guard_data jsonb, boss_daily jsonb, element_type text, element_rank integer, element_max boolean, apt_strength integer, apt_agility integer, apt_stamina integer, apt_intelligence integer, apt_energy integer, apt_strength_evolution integer, apt_agility_evolution integer, apt_stamina_evolution integer, apt_intelligence_evolution integer, apt_energy_evolution integer, cook_dex integer, fish_dex integer, plant_dex integer, medicine_dex integer, herb_dex integer, created_at timestamp with time zone, last_active timestamp with time zone, total_online bigint, class_apt_strength integer, class_apt_agility integer, class_apt_stamina integer, class_apt_intelligence integer, class_apt_energy integer, honor bigint, chivalry bigint, reputation bigint, vigor integer, max_vigor integer)
 LANGUAGE sql
 SET search_path TO ''
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
        cls.apt_energy::integer,
        w.honor,
        w.chivalry,
        w.reputation,
        r.vigor,
        r.max_vigor
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

revoke execute on function player.query_characters_full(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying) from public, anon, authenticated;
grant execute on function player.query_characters_full(p_id bigint, p_account_id uuid, p_map_id integer, p_name character varying) to service_role;


