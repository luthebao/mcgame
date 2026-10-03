set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.add_guild_member(p_guild_id bigint, p_character_id bigint, p_rank integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    insert into player.guild_members (guild_id, character_id, rank)
    values (p_guild_id, p_character_id, p_rank);

    update player.characters
    set guild_id = p_guild_id
    where id = p_character_id;

    update player.guilds
    set population = population + 1
    where id = p_guild_id;

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_character(p_account_id uuid, p_name text, p_class_id integer, p_gender integer, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_max_hp integer, p_max_mp integer, p_max_sp integer, p_attack integer, p_defense integer, p_magic_attack integer, p_magic_defense integer, p_hit integer, p_dodge integer, p_critical integer, p_critical_dmg integer, p_speed integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_dress_info text, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_selected_money_type integer, p_selected_gold_type integer, p_pet_guard_data jsonb, p_boss_daily jsonb, p_awaken_level integer, p_awaken_points integer, p_awaken_points_used integer, p_soul_level integer, p_soul_exp bigint, p_soul_points bigint, p_element_type text, p_element_rank integer, p_element_max boolean, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_created_at timestamp with time zone, p_last_active timestamp with time zone, p_total_online bigint)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.characters (
        account_id,
        name,
        class_id,
        gender,
        level,
        experience,
        rebirth_level,
        rebirth_exp,
        strength,
        agility,
        stamina,
        intelligence,
        spirit,
        attr_points,
        current_hp,
        current_mp,
        current_sp,
        max_hp,
        max_mp,
        max_sp,
        attack,
        defense,
        magic_attack,
        magic_defense,
        hit,
        dodge,
        critical,
        critical_dmg,
        speed,
        map_id,
        pos_x,
        pos_y,
        direction,
        money,
        money_bind,
        gold,
        gold_bind,
        dress_info,
        bag_slots,
        bank_slots,
        pet_slots,
        temp_bag_slots,
        mx_temp_bag_slots,
        selected_money_type,
        selected_gold_type,
        pet_guard_data,
        boss_daily,
        awaken_level,
        awaken_points,
        awaken_points_used,
        soul_level,
        soul_exp,
        soul_points,
        element_type,
        element_rank,
        element_max,
        apt_strength,
        apt_agility,
        apt_stamina,
        apt_intelligence,
        apt_energy,
        apt_strength_evolution,
        apt_agility_evolution,
        apt_stamina_evolution,
        apt_intelligence_evolution,
        apt_energy_evolution,
        created_at,
        last_active,
        total_online
    )
    values (
        p_account_id,
        p_name,
        p_class_id,
        p_gender,
        p_level,
        p_experience,
        p_rebirth_level,
        p_rebirth_exp,
        p_strength,
        p_agility,
        p_stamina,
        p_intelligence,
        p_spirit,
        p_attr_points,
        p_current_hp,
        p_current_mp,
        p_current_sp,
        p_max_hp,
        p_max_mp,
        p_max_sp,
        p_attack,
        p_defense,
        p_magic_attack,
        p_magic_defense,
        p_hit,
        p_dodge,
        p_critical,
        p_critical_dmg,
        p_speed,
        p_map_id,
        p_pos_x,
        p_pos_y,
        p_direction,
        p_money,
        p_money_bind,
        p_gold,
        p_gold_bind,
        p_dress_info,
        p_bag_slots,
        p_bank_slots,
        p_pet_slots,
        p_temp_bag_slots,
        p_mx_temp_bag_slots,
        p_selected_money_type,
        p_selected_gold_type,
        p_pet_guard_data,
        p_boss_daily,
        p_awaken_level,
        p_awaken_points,
        p_awaken_points_used,
        p_soul_level,
        p_soul_exp,
        p_soul_points,
        coalesce(nullif(p_element_type, ''), '0')::integer,
        p_element_rank,
        p_element_max,
        p_apt_strength,
        p_apt_agility,
        p_apt_stamina,
        p_apt_intelligence,
        p_apt_energy,
        p_apt_strength_evolution,
        p_apt_agility_evolution,
        p_apt_stamina_evolution,
        p_apt_intelligence_evolution,
        p_apt_energy_evolution,
        p_created_at,
        p_last_active,
        p_total_online
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_guild(p_name text, p_leader_id bigint, p_level integer, p_experience bigint, p_population integer, p_max_population integer, p_icon integer, p_funds bigint, p_contribution_total bigint, p_announcement text, p_description text, p_join_level_req integer, p_join_approval_required boolean, p_activity_points integer)
 RETURNS TABLE(id bigint, created_at timestamp with time zone, updated_at timestamp with time zone)
 LANGUAGE plpgsql
AS $function$
begin
    return query
    insert into player.guilds (
        name,
        leader_id,
        level,
        experience,
        population,
        max_population,
        icon,
        funds,
        contribution_total,
        announcement,
        description,
        join_level_req,
        join_approval_required,
        activity_points
    )
    values (
        p_name,
        p_leader_id,
        p_level,
        p_experience,
        p_population,
        p_max_population,
        p_icon,
        p_funds,
        p_contribution_total,
        p_announcement,
        p_description,
        p_join_level_req,
        p_join_approval_required,
        p_activity_points
    )
    returning guilds.id, guilds.created_at, guilds.updated_at;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_pet_arena_battle(p_attacker_id bigint, p_defender_id bigint, p_attacker_pet_id bigint, p_defender_pet_id bigint, p_attacker_rating_before integer, p_defender_rating_before integer, p_winner_id bigint, p_rating_change integer, p_battle_log jsonb, p_season integer, p_created_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.pet_arena_battles (
        attacker_id,
        defender_id,
        attacker_pet_id,
        defender_pet_id,
        attacker_rating_before,
        defender_rating_before,
        winner_id,
        rating_change,
        battle_log,
        season,
        created_at
    )
    values (
        p_attacker_id,
        p_defender_id,
        p_attacker_pet_id,
        p_defender_pet_id,
        p_attacker_rating_before,
        p_defender_rating_before,
        p_winner_id,
        p_rating_change,
        p_battle_log,
        p_season,
        p_created_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_pet_arena_ranking(p_character_id bigint, p_pet_id bigint, p_rating integer, p_wins integer, p_losses integer, p_win_streak integer, p_max_win_streak integer, p_season integer, p_tickets integer, p_max_tickets integer, p_last_ticket_refresh timestamp with time zone, p_last_fight_at timestamp with time zone, p_created_at timestamp with time zone, p_updated_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.pet_arena_rankings (
        character_id,
        pet_id,
        rating,
        wins,
        losses,
        win_streak,
        max_win_streak,
        season,
        tickets,
        max_tickets,
        last_ticket_refresh,
        last_fight_at,
        created_at,
        updated_at
    )
    values (
        p_character_id,
        p_pet_id,
        p_rating,
        p_wins,
        p_losses,
        p_win_streak,
        p_max_win_streak,
        p_season,
        p_tickets,
        p_max_tickets,
        p_last_ticket_refresh,
        p_last_fight_at,
        p_created_at,
        p_updated_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.delete_guild(p_guild_id bigint)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    update player.characters
    set guild_id = null
    where guild_id = p_guild_id;

    delete from player.guilds
    where id = p_guild_id;

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.find_pet_arena_opponents(p_season integer, p_character_id bigint, p_rating integer, p_limit integer)
 RETURNS SETOF player.pet_arena_rankings
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.pet_arena_rankings
    where season = p_season
      and character_id != p_character_id
      and rating between p_rating - 200 and p_rating + 200
      and pet_id is not null
    order by abs(rating - p_rating)
    limit p_limit;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_currencies(p_character_id bigint)
 RETURNS TABLE(currency_type integer, amount bigint)
 LANGUAGE sql
 STABLE
AS $function$
    select
        cc.currency_type,
        cc.amount
    from player.character_currencies as cc
    where cc.character_id = p_character_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_guild_by_id(p_guild_id bigint)
 RETURNS SETOF player.guilds
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.guilds
    where id = p_guild_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_guild_by_member_id(p_character_id bigint)
 RETURNS SETOF player.guilds
 LANGUAGE sql
 STABLE
AS $function$
    select g.*
    from player.guilds as g
    inner join player.guild_members as gm on g.id = gm.guild_id
    where gm.character_id = p_character_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_guild_by_name(p_name text)
 RETURNS SETOF player.guilds
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.guilds
    where name = p_name;
$function$
;

CREATE OR REPLACE FUNCTION player.get_guild_members(p_guild_id bigint)
 RETURNS TABLE(id bigint, guild_id bigint, character_id bigint, character_name text, character_level integer, character_class integer, rank integer, duty text, contribution_normal bigint, contribution_donate bigint, contribution_total bigint, contribution_weekly bigint, can_invite boolean, can_kick boolean, can_edit_announcement boolean, can_access_warehouse boolean, can_manage_warehouse boolean, joined_at timestamp with time zone, last_online timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        gm.id,
        gm.guild_id,
        gm.character_id,
        c.name as character_name,
        c.level as character_level,
        c.class_id as character_class,
        gm.rank,
        gm.duty,
        gm.contribution_normal,
        gm.contribution_donate,
        gm.contribution_total,
        gm.contribution_weekly,
        gm.can_invite,
        gm.can_kick,
        gm.can_edit_announcement,
        gm.can_access_warehouse,
        gm.can_manage_warehouse,
        gm.joined_at,
        gm.last_online
    from player.guild_members as gm
    inner join player.characters as c on gm.character_id = c.id
    where gm.guild_id = p_guild_id
    order by gm.rank asc, gm.contribution_total desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_pet_arena_battle(p_battle_id bigint)
 RETURNS SETOF player.pet_arena_battles
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.pet_arena_battles
    where id = p_battle_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_pet_arena_battle_history(p_character_id bigint, p_limit integer)
 RETURNS SETOF player.pet_arena_battles
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.pet_arena_battles
    where attacker_id = p_character_id
       or defender_id = p_character_id
    order by created_at desc
    limit p_limit;
$function$
;

CREATE OR REPLACE FUNCTION player.get_pet_arena_rank(p_character_id bigint, p_season integer)
 RETURNS integer
 LANGUAGE sql
 STABLE
AS $function$
    select count(*)::integer + 1
    from player.pet_arena_rankings as r1
    where r1.season = p_season
      and r1.rating > (
          select rating
          from player.pet_arena_rankings
          where character_id = p_character_id
            and season = p_season
      );
$function$
;

CREATE OR REPLACE FUNCTION player.get_pet_arena_ranking(p_character_id bigint, p_season integer)
 RETURNS SETOF player.pet_arena_rankings
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.pet_arena_rankings
    where character_id = p_character_id
      and season = p_season;
$function$
;

CREATE OR REPLACE FUNCTION player.get_pet_arena_reward(p_character_id bigint, p_season integer)
 RETURNS SETOF player.pet_arena_rewards
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.pet_arena_rewards
    where character_id = p_character_id
      and season = p_season;
$function$
;

CREATE OR REPLACE FUNCTION player.get_top_pet_arena_rankings(p_season integer, p_limit integer, p_offset integer)
 RETURNS SETOF player.pet_arena_rankings
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.pet_arena_rankings
    where season = p_season
    order by rating desc, wins desc
    limit p_limit
    offset p_offset;
$function$
;

CREATE OR REPLACE FUNCTION player.list_character_details()
 RETURNS TABLE(id bigint, account_id uuid, name text, class_id integer, gender integer, level integer, experience bigint, rebirth_level integer, rebirth_exp bigint, strength integer, agility integer, stamina integer, intelligence integer, spirit integer, attr_points integer, current_hp integer, current_mp integer, current_sp integer, max_hp integer, max_mp integer, max_sp integer, attack integer, defense integer, magic_attack integer, magic_defense integer, hit integer, dodge integer, critical integer, critical_dmg integer, speed integer, map_id integer, pos_x integer, pos_y integer, direction integer, money bigint, money_bind bigint, gold bigint, gold_bind bigint, vip_type integer, vip_expires_at timestamp with time zone, pm_exp bigint, pm_process_data jsonb, pm_findback boolean, dress_info text, bag_slots integer, bank_slots integer, pet_slots integer, temp_bag_slots integer, mx_temp_bag_slots integer, selected_money_type integer, selected_gold_type integer, pet_guard_data jsonb, boss_daily jsonb, awaken_level integer, awaken_points integer, awaken_points_used integer, soul_level integer, soul_exp bigint, soul_points bigint, element_type text, element_rank integer, element_max boolean, apt_strength integer, apt_agility integer, apt_stamina integer, apt_intelligence integer, apt_energy integer, apt_strength_evolution integer, apt_agility_evolution integer, apt_stamina_evolution integer, apt_intelligence_evolution integer, apt_energy_evolution integer, created_at timestamp with time zone, last_active timestamp with time zone, total_online bigint)
 LANGUAGE sql
 STABLE
AS $function$
    select
        c.id,
        c.account_id,
        c.name,
        c.class_id,
        c.gender,
        c.level,
        c.experience,
        c.rebirth_level,
        c.rebirth_exp,
        c.strength,
        c.agility,
        c.stamina,
        c.intelligence,
        c.spirit,
        c.attr_points,
        c.current_hp,
        c.current_mp,
        c.current_sp,
        c.max_hp,
        c.max_mp,
        c.max_sp,
        c.attack,
        c.defense,
        c.magic_attack,
        c.magic_defense,
        c.hit,
        c.dodge,
        c.critical,
        c.critical_dmg,
        c.speed,
        c.map_id,
        c.pos_x,
        c.pos_y,
        c.direction,
        c.money,
        c.money_bind,
        c.gold,
        c.gold_bind,
        coalesce(c.vip_type, 0),
        c.vip_expires_at,
        coalesce(c.pm_exp, 0),
        coalesce(c.pm_process_data, '{}'::jsonb),
        coalesce(c.pm_findback, false),
        c.dress_info,
        c.bag_slots,
        c.bank_slots,
        c.pet_slots,
        c.temp_bag_slots,
        c.mx_temp_bag_slots,
        c.selected_money_type,
        c.selected_gold_type,
        coalesce(c.pet_guard_data, '{"lvData":{},"petData":{}}'::jsonb),
        coalesce(c.boss_daily, '{}'::jsonb),
        coalesce(c.awaken_level, 0),
        coalesce(c.awaken_points, 0),
        coalesce(c.awaken_points_used, 0),
        coalesce(c.soul_level, 0),
        coalesce(c.soul_exp, 0),
        coalesce(c.soul_points, 0),
        coalesce(c.element_type, 0)::text,
        c.element_rank,
        c.element_max,
        c.apt_strength,
        c.apt_agility,
        c.apt_stamina,
        c.apt_intelligence,
        c.apt_energy,
        c.apt_strength_evolution,
        c.apt_agility_evolution,
        c.apt_stamina_evolution,
        c.apt_intelligence_evolution,
        c.apt_energy_evolution,
        c.created_at,
        c.last_active,
        c.total_online
    from player.characters as c;
$function$
;

CREATE OR REPLACE FUNCTION player.remove_guild_member(p_guild_id bigint, p_character_id bigint)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    delete from player.guild_members
    where guild_id = p_guild_id
      and character_id = p_character_id;

    update player.characters
    set guild_id = null
    where id = p_character_id;

    update player.guilds
    set population = population - 1
    where id = p_guild_id;

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_character(p_id bigint, p_name text, p_class_id integer, p_gender integer, p_level integer, p_experience bigint, p_rebirth_level integer, p_rebirth_exp bigint, p_strength integer, p_agility integer, p_stamina integer, p_intelligence integer, p_spirit integer, p_attr_points integer, p_current_hp integer, p_current_mp integer, p_current_sp integer, p_max_hp integer, p_max_mp integer, p_max_sp integer, p_attack integer, p_defense integer, p_magic_attack integer, p_magic_defense integer, p_hit integer, p_dodge integer, p_critical integer, p_critical_dmg integer, p_speed integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_money bigint, p_money_bind bigint, p_gold bigint, p_gold_bind bigint, p_vip_type integer, p_vip_expires_at timestamp with time zone, p_pm_exp bigint, p_pm_process_data jsonb, p_pm_findback boolean, p_dress_info text, p_bag_slots integer, p_bank_slots integer, p_pet_slots integer, p_temp_bag_slots integer, p_mx_temp_bag_slots integer, p_selected_money_type integer, p_selected_gold_type integer, p_pet_guard_data jsonb, p_boss_daily jsonb, p_awaken_level integer, p_awaken_points integer, p_awaken_points_used integer, p_soul_level integer, p_soul_exp bigint, p_soul_points bigint, p_element_type text, p_element_rank integer, p_element_max boolean, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_evolution integer, p_apt_agility_evolution integer, p_apt_stamina_evolution integer, p_apt_intelligence_evolution integer, p_apt_energy_evolution integer, p_last_active timestamp with time zone, p_total_online bigint)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.characters
    set name = p_name,
        class_id = p_class_id,
        gender = p_gender,
        level = p_level,
        experience = p_experience,
        rebirth_level = p_rebirth_level,
        rebirth_exp = p_rebirth_exp,
        strength = p_strength,
        agility = p_agility,
        stamina = p_stamina,
        intelligence = p_intelligence,
        spirit = p_spirit,
        attr_points = p_attr_points,
        current_hp = p_current_hp,
        current_mp = p_current_mp,
        current_sp = p_current_sp,
        max_hp = p_max_hp,
        max_mp = p_max_mp,
        max_sp = p_max_sp,
        attack = p_attack,
        defense = p_defense,
        magic_attack = p_magic_attack,
        magic_defense = p_magic_defense,
        hit = p_hit,
        dodge = p_dodge,
        critical = p_critical,
        critical_dmg = p_critical_dmg,
        speed = p_speed,
        map_id = p_map_id,
        pos_x = p_pos_x,
        pos_y = p_pos_y,
        direction = p_direction,
        money = p_money,
        money_bind = p_money_bind,
        gold = p_gold,
        gold_bind = p_gold_bind,
        vip_type = p_vip_type,
        vip_expires_at = p_vip_expires_at,
        pm_exp = p_pm_exp,
        pm_process_data = p_pm_process_data,
        pm_findback = p_pm_findback,
        dress_info = p_dress_info,
        bag_slots = p_bag_slots,
        bank_slots = p_bank_slots,
        pet_slots = p_pet_slots,
        temp_bag_slots = p_temp_bag_slots,
        mx_temp_bag_slots = p_mx_temp_bag_slots,
        selected_money_type = p_selected_money_type,
        selected_gold_type = p_selected_gold_type,
        pet_guard_data = p_pet_guard_data,
        boss_daily = p_boss_daily,
        awaken_level = p_awaken_level,
        awaken_points = p_awaken_points,
        awaken_points_used = p_awaken_points_used,
        soul_level = p_soul_level,
        soul_exp = p_soul_exp,
        soul_points = p_soul_points,
        element_type = coalesce(nullif(p_element_type, ''), '0')::integer,
        element_rank = p_element_rank,
        element_max = p_element_max,
        apt_strength = p_apt_strength,
        apt_agility = p_apt_agility,
        apt_stamina = p_apt_stamina,
        apt_intelligence = p_apt_intelligence,
        apt_energy = p_apt_energy,
        apt_strength_evolution = p_apt_strength_evolution,
        apt_agility_evolution = p_apt_agility_evolution,
        apt_stamina_evolution = p_apt_stamina_evolution,
        apt_intelligence_evolution = p_apt_intelligence_evolution,
        apt_energy_evolution = p_apt_energy_evolution,
        last_active = p_last_active,
        total_online = p_total_online
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_guild(p_name text, p_level integer, p_experience bigint, p_max_population integer, p_icon integer, p_funds bigint, p_announcement text, p_description text, p_join_level_req integer, p_join_approval_required boolean, p_id bigint)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.guilds
    set name = p_name,
        level = p_level,
        experience = p_experience,
        max_population = p_max_population,
        icon = p_icon,
        funds = p_funds,
        announcement = p_announcement,
        description = p_description,
        join_level_req = p_join_level_req,
        join_approval_required = p_join_approval_required,
        updated_at = current_timestamp
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_pet_arena_ranking(p_id bigint, p_pet_id bigint, p_rating integer, p_wins integer, p_losses integer, p_win_streak integer, p_max_win_streak integer, p_tickets integer, p_last_ticket_refresh timestamp with time zone, p_last_fight_at timestamp with time zone, p_updated_at timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.pet_arena_rankings
    set pet_id = p_pet_id,
        rating = p_rating,
        wins = p_wins,
        losses = p_losses,
        win_streak = p_win_streak,
        max_win_streak = p_max_win_streak,
        tickets = p_tickets,
        last_ticket_refresh = p_last_ticket_refresh,
        last_fight_at = p_last_fight_at,
        updated_at = p_updated_at
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_currency(p_character_id bigint, p_currency_type integer, p_amount bigint)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    insert into player.character_currencies (
        character_id,
        currency_type,
        amount,
        season,
        updated_at
    )
    values (
        p_character_id,
        p_currency_type,
        p_amount,
        0,
        now()
    )
    on conflict (character_id, currency_type, season)
    do update
    set amount = excluded.amount,
        updated_at = now();

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_pet_arena_reward(p_character_id bigint, p_season integer, p_rank integer, p_rating integer, p_rewards_claimed jsonb, p_claimed_at timestamp with time zone, p_created_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    reward_id bigint;
begin
    insert into player.pet_arena_rewards (
        character_id,
        season,
        rank,
        rating,
        rewards_claimed,
        claimed_at,
        created_at
    )
    values (
        p_character_id,
        p_season,
        p_rank,
        p_rating,
        p_rewards_claimed,
        p_claimed_at,
        p_created_at
    )
    on conflict (character_id, season)
    do update
    set rank = excluded.rank,
        rating = excluded.rating,
        rewards_claimed = excluded.rewards_claimed,
        claimed_at = excluded.claimed_at
    returning id into reward_id;

    return reward_id;
end;
$function$
;


