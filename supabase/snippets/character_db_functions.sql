-- Database functions that replace long multi-statement SQL in Go repositories.
-- See CLAUDE.md: prefer schema-qualified Postgres functions over multi-line SQL in Go.

-- =============================================================================
-- Character SELECT: returns the 8-way joined character row in scanner order.
-- One function covers all four finders via nullable filter parameters.
-- =============================================================================

DROP FUNCTION IF EXISTS player.query_characters_full(bigint, uuid, integer, character varying);

CREATE OR REPLACE FUNCTION player.query_characters_full(
    p_id bigint DEFAULT NULL,
    p_account_id uuid DEFAULT NULL,
    p_map_id integer DEFAULT NULL,
    p_name character varying DEFAULT NULL
)
RETURNS TABLE (
    id bigint,
    account_id uuid,
    name character varying,
    class_id integer,
    gender integer,
    level integer,
    experience bigint,
    rebirth_level integer,
    rebirth_exp bigint,
    strength integer,
    agility integer,
    stamina integer,
    intelligence integer,
    spirit integer,
    attr_points integer,
    max_attr_points integer,
    distributed_attr_points integer,
    current_hp integer,
    current_mp integer,
    current_sp integer,
    max_hp integer,
    max_mp integer,
    max_sp integer,
    attack integer,
    defense integer,
    magic_attack integer,
    magic_defense integer,
    hit integer,
    dodge integer,
    critical integer,
    critical_dmg integer,
    speed integer,
    map_id integer,
    pos_x integer,
    pos_y integer,
    direction integer,
    guild_id bigint,
    money bigint,
    money_bind bigint,
    gold bigint,
    gold_bind bigint,
    guild_restore_contrib integer,
    guild_restore_donate integer,
    pop bigint,
    vip_type integer,
    vip_expires_at timestamptz,
    pm_exp bigint,
    pm_process_data jsonb,
    pm_findback boolean,
    dress_info text,
    bag_slots integer,
    bank_slots integer,
    pet_slots integer,
    temp_bag_slots integer,
    mx_temp_bag_slots integer,
    gm_level integer,
    selected_money_type integer,
    selected_gold_type integer,
    pet_guard_data jsonb,
    boss_daily jsonb,
    element_type text,
    element_rank integer,
    element_max boolean,
    apt_strength integer,
    apt_agility integer,
    apt_stamina integer,
    apt_intelligence integer,
    apt_energy integer,
    apt_strength_evolution integer,
    apt_agility_evolution integer,
    apt_stamina_evolution integer,
    apt_intelligence_evolution integer,
    apt_energy_evolution integer,
    cook_dex integer,
    fish_dex integer,
    plant_dex integer,
    medicine_dex integer,
    herb_dex integer,
    created_at timestamptz,
    last_active timestamptz,
    total_online bigint
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
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
        cs.max_hp,
        cs.max_mp,
        cs.max_sp,
        cs.attack,
        cs.defense,
        cs.magic_attack,
        cs.magic_defense,
        cs.hit,
        cs.dodge,
        cs.critical,
        cs.critical_dmg,
        cs.speed,
        c.map_id,
        c.pos_x,
        c.pos_y,
        c.direction,
        c.guild_id,
        w.money,
        w.money_bind,
        w.gold,
        w.gold_bind,
        COALESCE(c.guild_restore_contrib, 0),
        COALESCE(c.guild_restore_donate, 0),
        w.pop,
        COALESCE(c.vip_type, 0),
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
        COALESCE(c.gm_level, 0),
        w.selected_money_type,
        w.selected_gold_type,
        f.pet_guard_data,
        COALESCE(f.boss_daily, '{}'::jsonb),
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
        c.total_online
    FROM player.characters AS c
    INNER JOIN player.character_progression AS pr ON pr.character_id = c.id
    INNER JOIN player.character_attributes AS a ON a.character_id = c.id
    INNER JOIN player.character_combat_stats AS cs ON cs.character_id = c.id
    INNER JOIN player.character_wallet AS w ON w.character_id = c.id
    INNER JOIN player.character_resources AS r ON r.character_id = c.id
    INNER JOIN player.character_life_skills AS l ON l.character_id = c.id
    INNER JOIN player.character_feature_states AS f ON f.character_id = c.id
    WHERE (p_id IS NULL OR c.id = p_id)
      AND (p_account_id IS NULL OR c.account_id = p_account_id)
      AND (p_map_id IS NULL OR c.map_id = p_map_id)
      AND (p_name IS NULL OR c.name = p_name)
    ORDER BY
        CASE WHEN p_account_id IS NOT NULL THEN c.created_at END DESC,
        CASE WHEN p_map_id IS NOT NULL THEN c.name END ASC,
        c.id;
$$;

-- =============================================================================
-- Character CREATE: inserts core row + 7 sibling rows in a single call.
-- Returns the new character id.
-- =============================================================================

CREATE OR REPLACE FUNCTION player.create_character_full(
    p_account_id uuid,
    p_name character varying,
    p_class_id integer,
    p_gender integer,
    p_map_id integer,
    p_pos_x integer,
    p_pos_y integer,
    p_direction integer,
    p_guild_restore_contrib integer,
    p_guild_restore_donate integer,
    p_vip_type integer,
    p_vip_expires_at timestamptz,
    p_dress_info text,
    p_gm_level integer,
    p_created_at timestamptz,
    p_last_active timestamptz,
    p_total_online bigint,
    p_level integer,
    p_experience bigint,
    p_rebirth_level integer,
    p_rebirth_exp bigint,
    p_strength integer,
    p_agility integer,
    p_stamina integer,
    p_intelligence integer,
    p_spirit integer,
    p_attr_points integer,
    p_max_attr_points integer,
    p_distributed_attr_points integer,
    p_current_hp integer,
    p_current_mp integer,
    p_current_sp integer,
    p_apt_strength integer,
    p_apt_agility integer,
    p_apt_stamina integer,
    p_apt_intelligence integer,
    p_apt_energy integer,
    p_apt_strength_evolution integer,
    p_apt_agility_evolution integer,
    p_apt_stamina_evolution integer,
    p_apt_intelligence_evolution integer,
    p_apt_energy_evolution integer,
    p_max_hp integer,
    p_max_mp integer,
    p_max_sp integer,
    p_attack integer,
    p_defense integer,
    p_magic_attack integer,
    p_magic_defense integer,
    p_hit integer,
    p_dodge integer,
    p_critical integer,
    p_critical_dmg integer,
    p_speed integer,
    p_money bigint,
    p_money_bind bigint,
    p_gold bigint,
    p_gold_bind bigint,
    p_honor bigint,
    p_chivalry bigint,
    p_reputation bigint,
    p_pop bigint,
    p_selected_money_type integer,
    p_selected_gold_type integer,
    p_bag_slots integer,
    p_bank_slots integer,
    p_pet_slots integer,
    p_temp_bag_slots integer,
    p_mx_temp_bag_slots integer,
    p_cook_dex integer,
    p_fish_dex integer,
    p_plant_dex integer,
    p_medicine_dex integer,
    p_herb_dex integer,
    p_element_type text,
    p_element_rank integer,
    p_element_max boolean,
    p_pm_exp bigint,
    p_pm_process_data jsonb,
    p_pm_findback boolean,
    p_pet_guard_data jsonb,
    p_boss_daily jsonb
)
RETURNS bigint
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
DECLARE
    v_id bigint;
BEGIN
    INSERT INTO player.characters (
        account_id, name, class_id, gender,
        map_id, pos_x, pos_y, direction,
        guild_restore_contrib, guild_restore_donate,
        vip_type, vip_expires_at,
        dress_info, gm_level,
        created_at, last_active, total_online
    ) VALUES (
        p_account_id, p_name, p_class_id, p_gender,
        p_map_id, p_pos_x, p_pos_y, p_direction,
        p_guild_restore_contrib, p_guild_restore_donate,
        p_vip_type, p_vip_expires_at,
        p_dress_info, p_gm_level,
        p_created_at, p_last_active, p_total_online
    ) RETURNING id INTO v_id;

    INSERT INTO player.character_progression (character_id, level, experience, rebirth_level, rebirth_exp)
    VALUES (v_id, p_level, p_experience, p_rebirth_level, p_rebirth_exp);

    INSERT INTO player.character_attributes (
        character_id, strength, agility, stamina, intelligence, spirit, attr_points,
        max_attr_points, distributed_attr_points,
        current_hp, current_mp, current_sp,
        apt_strength, apt_agility, apt_stamina, apt_intelligence, apt_energy,
        apt_strength_evolution, apt_agility_evolution, apt_stamina_evolution, apt_intelligence_evolution, apt_energy_evolution
    ) VALUES (
        v_id, p_strength, p_agility, p_stamina, p_intelligence, p_spirit, p_attr_points,
        p_max_attr_points, p_distributed_attr_points,
        p_current_hp, p_current_mp, p_current_sp,
        p_apt_strength, p_apt_agility, p_apt_stamina, p_apt_intelligence, p_apt_energy,
        p_apt_strength_evolution, p_apt_agility_evolution, p_apt_stamina_evolution, p_apt_intelligence_evolution, p_apt_energy_evolution
    );

    INSERT INTO player.character_combat_stats (
        character_id, max_hp, max_mp, max_sp,
        attack, defense, magic_attack, magic_defense,
        hit, dodge, critical, critical_dmg, speed
    ) VALUES (
        v_id, p_max_hp, p_max_mp, p_max_sp,
        p_attack, p_defense, p_magic_attack, p_magic_defense,
        p_hit, p_dodge, p_critical, p_critical_dmg, p_speed
    );

    INSERT INTO player.character_wallet (
        character_id, money, money_bind, gold, gold_bind,
        honor, chivalry, reputation, pop,
        selected_money_type, selected_gold_type
    ) VALUES (
        v_id, p_money, p_money_bind, p_gold, p_gold_bind,
        p_honor, p_chivalry, p_reputation, p_pop,
        p_selected_money_type, p_selected_gold_type
    );

    INSERT INTO player.character_resources (
        character_id, bag_slots, bank_slots, pet_slots, temp_bag_slots, mx_temp_bag_slots
    ) VALUES (
        v_id, p_bag_slots, p_bank_slots, p_pet_slots, p_temp_bag_slots, p_mx_temp_bag_slots
    );

    INSERT INTO player.character_life_skills (
        character_id, cook_dex, fish_dex, plant_dex, medicine_dex, herb_dex
    ) VALUES (
        v_id, p_cook_dex, p_fish_dex, p_plant_dex, p_medicine_dex, p_herb_dex
    );

    INSERT INTO player.character_feature_states (
        character_id, element_type, element_rank, element_max,
        pm_exp, pm_process_data, pm_findback, pet_guard_data, boss_daily
    ) VALUES (
        v_id,
        COALESCE(NULLIF(p_element_type, ''), '0')::integer,
        p_element_rank, p_element_max,
        p_pm_exp, p_pm_process_data, p_pm_findback, p_pet_guard_data, p_boss_daily
    );

    RETURN v_id;
END;
$$;

-- =============================================================================
-- Character UPDATE: updates all 8 tables in a single transactional call.
-- Returns TRUE if the core row existed, FALSE otherwise.
-- =============================================================================

CREATE OR REPLACE FUNCTION player.update_character_full(
    p_id bigint,
    p_name character varying,
    p_class_id integer,
    p_gender integer,
    p_map_id integer,
    p_pos_x integer,
    p_pos_y integer,
    p_direction integer,
    p_guild_restore_contrib integer,
    p_guild_restore_donate integer,
    p_vip_type integer,
    p_vip_expires_at timestamptz,
    p_dress_info text,
    p_gm_level integer,
    p_last_active timestamptz,
    p_total_online bigint,
    p_level integer,
    p_experience bigint,
    p_rebirth_level integer,
    p_rebirth_exp bigint,
    p_strength integer,
    p_agility integer,
    p_stamina integer,
    p_intelligence integer,
    p_spirit integer,
    p_attr_points integer,
    p_max_attr_points integer,
    p_distributed_attr_points integer,
    p_current_hp integer,
    p_current_mp integer,
    p_current_sp integer,
    p_apt_strength integer,
    p_apt_agility integer,
    p_apt_stamina integer,
    p_apt_intelligence integer,
    p_apt_energy integer,
    p_apt_strength_evolution integer,
    p_apt_agility_evolution integer,
    p_apt_stamina_evolution integer,
    p_apt_intelligence_evolution integer,
    p_apt_energy_evolution integer,
    p_max_hp integer,
    p_max_mp integer,
    p_max_sp integer,
    p_attack integer,
    p_defense integer,
    p_magic_attack integer,
    p_magic_defense integer,
    p_hit integer,
    p_dodge integer,
    p_critical integer,
    p_critical_dmg integer,
    p_speed integer,
    p_money bigint,
    p_money_bind bigint,
    p_gold bigint,
    p_gold_bind bigint,
    p_pop bigint,
    p_selected_money_type integer,
    p_selected_gold_type integer,
    p_bag_slots integer,
    p_bank_slots integer,
    p_pet_slots integer,
    p_temp_bag_slots integer,
    p_mx_temp_bag_slots integer,
    p_cook_dex integer,
    p_fish_dex integer,
    p_plant_dex integer,
    p_medicine_dex integer,
    p_herb_dex integer,
    p_element_type text,
    p_element_rank integer,
    p_element_max boolean,
    p_pm_exp bigint,
    p_pm_process_data jsonb,
    p_pm_findback boolean,
    p_pet_guard_data jsonb,
    p_boss_daily jsonb
)
RETURNS boolean
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
DECLARE
    v_rows integer;
BEGIN
    UPDATE player.characters SET
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
    WHERE id = p_id;

    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows = 0 THEN
        RETURN FALSE;
    END IF;

    UPDATE player.character_progression SET
        level = p_level,
        experience = p_experience,
        rebirth_level = p_rebirth_level,
        rebirth_exp = p_rebirth_exp
    WHERE character_id = p_id;

    UPDATE player.character_attributes SET
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
    WHERE character_id = p_id;

    UPDATE player.character_combat_stats SET
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
        speed = p_speed
    WHERE character_id = p_id;

    UPDATE player.character_wallet SET
        money = p_money,
        money_bind = p_money_bind,
        gold = p_gold,
        gold_bind = p_gold_bind,
        pop = p_pop,
        selected_money_type = p_selected_money_type,
        selected_gold_type = p_selected_gold_type
    WHERE character_id = p_id;

    UPDATE player.character_resources SET
        bag_slots = p_bag_slots,
        bank_slots = p_bank_slots,
        pet_slots = p_pet_slots,
        temp_bag_slots = p_temp_bag_slots,
        mx_temp_bag_slots = p_mx_temp_bag_slots
    WHERE character_id = p_id;

    UPDATE player.character_life_skills SET
        cook_dex = p_cook_dex,
        fish_dex = p_fish_dex,
        plant_dex = p_plant_dex,
        medicine_dex = p_medicine_dex,
        herb_dex = p_herb_dex
    WHERE character_id = p_id;

    UPDATE player.character_feature_states SET
        element_type = COALESCE(NULLIF(p_element_type, ''), '0')::integer,
        element_rank = p_element_rank,
        element_max = p_element_max,
        pm_exp = p_pm_exp,
        pm_process_data = p_pm_process_data,
        pm_findback = p_pm_findback,
        pet_guard_data = p_pet_guard_data,
        boss_daily = p_boss_daily
    WHERE character_id = p_id;

    RETURN TRUE;
END;
$$;

-- =============================================================================
-- Character vitals update: writes current_hp/mp/sp + touches last_active.
-- =============================================================================

CREATE OR REPLACE FUNCTION player.update_character_vitals(
    p_id bigint,
    p_current_hp integer,
    p_current_mp integer,
    p_current_sp integer,
    p_last_active timestamptz
)
RETURNS void
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
BEGIN
    UPDATE player.character_attributes
    SET current_hp = p_current_hp,
        current_mp = p_current_mp,
        current_sp = p_current_sp
    WHERE character_id = p_id;

    UPDATE player.characters
    SET last_active = p_last_active
    WHERE id = p_id;
END;
$$;

-- =============================================================================
-- Guild member detail queries.
-- =============================================================================

CREATE OR REPLACE FUNCTION player.list_guild_members_detailed(p_guild_id bigint)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    character_id bigint,
    character_name character varying,
    character_level integer,
    character_class integer,
    character_exp bigint,
    rank integer,
    duty character varying,
    contribution_normal bigint,
    contribution_donate bigint,
    contribution_total bigint,
    contribution_weekly bigint,
    can_invite boolean,
    can_kick boolean,
    can_edit_announcement boolean,
    can_access_warehouse boolean,
    can_manage_warehouse boolean,
    joined_at timestamptz,
    last_online timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        gm.id,
        gm.guild_id,
        gm.character_id,
        c.name,
        pr.level,
        c.class_id,
        pr.experience,
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
    FROM player.guild_members AS gm
    INNER JOIN player.characters AS c ON gm.character_id = c.id
    INNER JOIN player.character_progression AS pr ON pr.character_id = c.id
    WHERE gm.guild_id = p_guild_id
    ORDER BY gm.rank ASC, gm.contribution_total DESC;
$$;

CREATE OR REPLACE FUNCTION player.get_guild_member_detailed(p_member_id bigint)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    character_id bigint,
    character_name character varying,
    character_level integer,
    character_class integer,
    character_exp bigint,
    rank integer,
    duty character varying,
    contribution_normal bigint,
    contribution_donate bigint,
    contribution_total bigint,
    contribution_weekly bigint,
    can_invite boolean,
    can_kick boolean,
    can_edit_announcement boolean,
    can_access_warehouse boolean,
    can_manage_warehouse boolean,
    joined_at timestamptz,
    last_online timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        gm.id,
        gm.guild_id,
        gm.character_id,
        c.name,
        pr.level,
        c.class_id,
        pr.experience,
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
    FROM player.guild_members AS gm
    INNER JOIN player.characters AS c ON gm.character_id = c.id
    INNER JOIN player.character_progression AS pr ON pr.character_id = c.id
    WHERE gm.id = p_member_id;
$$;

-- =============================================================================
-- Guild application detail queries.
-- =============================================================================

CREATE OR REPLACE FUNCTION player.get_guild_application_detailed(p_application_id bigint)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    character_id bigint,
    character_name character varying,
    character_class integer,
    character_level integer,
    character_exp bigint,
    message text,
    status integer,
    created_at timestamptz,
    processed_at timestamptz,
    processed_by bigint
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        ga.id,
        ga.guild_id,
        ga.character_id,
        c.name,
        c.class_id,
        pr.level,
        pr.experience,
        ga.message,
        ga.status,
        ga.created_at,
        ga.processed_at,
        ga.processed_by
    FROM player.guild_applications AS ga
    INNER JOIN player.characters AS c ON ga.character_id = c.id
    INNER JOIN player.character_progression AS pr ON pr.character_id = c.id
    WHERE ga.id = p_application_id;
$$;

CREATE OR REPLACE FUNCTION player.get_guild_application_by_character(p_character_id bigint)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    character_id bigint,
    character_name character varying,
    character_class integer,
    character_level integer,
    character_exp bigint,
    message text,
    status integer,
    created_at timestamptz,
    processed_at timestamptz,
    processed_by bigint
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        ga.id,
        ga.guild_id,
        ga.character_id,
        c.name,
        c.class_id,
        pr.level,
        pr.experience,
        ga.message,
        ga.status,
        ga.created_at,
        ga.processed_at,
        ga.processed_by
    FROM player.guild_applications AS ga
    INNER JOIN player.characters AS c ON ga.character_id = c.id
    INNER JOIN player.character_progression AS pr ON pr.character_id = c.id
    WHERE ga.character_id = p_character_id
    ORDER BY ga.id DESC
    LIMIT 1;
$$;

CREATE OR REPLACE FUNCTION player.list_guild_applications_detailed(p_guild_id bigint)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    character_id bigint,
    character_name character varying,
    character_class integer,
    character_level integer,
    character_exp bigint,
    message text,
    status integer,
    created_at timestamptz,
    processed_at timestamptz,
    processed_by bigint
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        ga.id,
        ga.guild_id,
        ga.character_id,
        c.name,
        c.class_id,
        pr.level,
        pr.experience,
        ga.message,
        ga.status,
        ga.created_at,
        ga.processed_at,
        ga.processed_by
    FROM player.guild_applications AS ga
    INNER JOIN player.characters AS c ON ga.character_id = c.id
    INNER JOIN player.character_progression AS pr ON pr.character_id = c.id
    WHERE ga.guild_id = p_guild_id
    ORDER BY ga.id ASC;
$$;
