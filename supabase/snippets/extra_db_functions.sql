-- DB functions replacing remaining long SQL in Go repositories.
-- Covers gamedata_repository, guild_repository_extra, magic_estate_repository, marriage_repository.

-- =============================================================================
-- Game data: pet + item instance client-format payloads
-- =============================================================================

CREATE OR REPLACE FUNCTION player.get_pet_client(p_pet_id bigint)
RETURNS jsonb
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT to_jsonb(t)
    FROM (
        SELECT
            id,
            template_id AS tid,
            character_id AS owner_id,
            name AS "petName",
            grow_rate AS "growRate",
            upgrade_num AS "upgradeNum",
            level,
            experience AS exp,
            apt_strength AS "aptStrength",
            apt_agility AS "aptAgility",
            apt_stamina AS "aptStamina",
            apt_intelligence AS "aptIntelligence",
            apt_energy AS "aptEnergy",
            apt_strength_ex AS "aptStrengthEx",
            apt_agility_ex AS "aptAgilityEx",
            apt_stamina_ex AS "aptStaminaEx",
            apt_intelligence_ex AS "aptIntelligenceEx",
            apt_energy_ex AS "aptEnergyEx",
            grow_rate_add AS "growRateAdd",
            evolution_lv AS "evolutionLv",
            element,
            current_hp AS "currentHp",
            current_mp AS "currentMp",
            max_hp AS "hpMax",
            max_mp AS "mpMax",
            is_following AS "isFollowing",
            is_mounting AS "isMounting",
            property,
            created_at AS "createdAt",
            updated_at AS "updatedAt"
        FROM player.character_pets
        WHERE id = p_pet_id
    ) t;
$$;

CREATE OR REPLACE FUNCTION player.list_pet_clients()
RETURNS SETOF jsonb
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT to_jsonb(t)
    FROM (
        SELECT
            id,
            template_id AS tid,
            character_id AS owner_id,
            name AS "petName",
            grow_rate AS "growRate",
            upgrade_num AS "upgradeNum",
            level,
            experience AS exp,
            apt_strength AS "aptStrength",
            apt_agility AS "aptAgility",
            apt_stamina AS "aptStamina",
            apt_intelligence AS "aptIntelligence",
            apt_energy AS "aptEnergy",
            apt_strength_ex AS "aptStrengthEx",
            apt_agility_ex AS "aptAgilityEx",
            apt_stamina_ex AS "aptStaminaEx",
            apt_intelligence_ex AS "aptIntelligenceEx",
            apt_energy_ex AS "aptEnergyEx",
            grow_rate_add AS "growRateAdd",
            evolution_lv AS "evolutionLv",
            element,
            current_hp AS "currentHp",
            current_mp AS "currentMp",
            max_hp AS "hpMax",
            max_mp AS "mpMax",
            is_following AS "isFollowing",
            is_mounting AS "isMounting",
            property,
            created_at AS "createdAt",
            updated_at AS "updatedAt"
        FROM player.character_pets
        ORDER BY id
    ) t;
$$;

CREATE OR REPLACE FUNCTION player.get_item_instance_client(p_item_id bigint, p_client_type integer)
RETURNS jsonb
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT to_jsonb(t)
    FROM (
        SELECT
            id,
            CASE
                WHEN slot_type = 1 THEN 1 + slot_index
                WHEN slot_type = 0 THEN 2100 + slot_index + 1
                WHEN slot_type = 2 THEN 300 + slot_index + 1
                ELSE slot_index
            END AS sid,
            template_id AS giid,
            p_client_type AS type,
            id AS "itemId",
            template_id AS tid,
            stack_count AS "stackNum",
            is_bound AS "isBound",
            item_type AS "itemType",
            template_id AS "tplId",
            slot_type AS "slotType",
            slot_index AS "slotIndex",
            enchant_level AS "enchantLv",
            star_level AS "starLv",
            color_code AS "colorCode",
            durability,
            max_durability AS "maxDurability",
            properties
        FROM player.character_items
        WHERE id = p_item_id
    ) t;
$$;

-- =============================================================================
-- Guild: list, contribution, warehouse, log helpers
-- =============================================================================

CREATE OR REPLACE FUNCTION player.list_guilds_full()
RETURNS TABLE (
    id bigint,
    name character varying,
    leader_id bigint,
    level integer,
    experience bigint,
    population integer,
    max_population integer,
    icon integer,
    funds bigint,
    contribution_total bigint,
    announcement text,
    description text,
    join_level_req integer,
    join_approval_required boolean,
    activity_points integer,
    last_activity_reset timestamptz,
    created_at timestamptz,
    updated_at timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        g.id, g.name, g.leader_id, g.level, g.experience, g.population, g.max_population,
        g.icon, g.funds, g.contribution_total, g.announcement, g.description,
        g.join_level_req, g.join_approval_required, g.activity_points,
        g.last_activity_reset, g.created_at, g.updated_at
    FROM player.guilds AS g
    ORDER BY g.id ASC;
$$;

CREATE OR REPLACE FUNCTION player.add_guild_member_contribution(
    p_guild_id bigint,
    p_character_id bigint,
    p_normal bigint,
    p_donate bigint,
    p_total bigint
)
RETURNS void
LANGUAGE sql
SECURITY INVOKER
AS $$
    UPDATE player.guild_members
    SET contribution_normal = contribution_normal + p_normal,
        contribution_donate = contribution_donate + p_donate,
        contribution_total = contribution_total + p_total,
        contribution_weekly = contribution_weekly + p_total
    WHERE guild_id = p_guild_id AND character_id = p_character_id;
$$;

CREATE OR REPLACE FUNCTION player.set_guild_member_contribution(
    p_guild_id bigint,
    p_character_id bigint,
    p_normal bigint,
    p_donate bigint,
    p_total bigint
)
RETURNS void
LANGUAGE sql
SECURITY INVOKER
AS $$
    UPDATE player.guild_members
    SET contribution_normal = p_normal,
        contribution_donate = p_donate,
        contribution_total = p_total,
        contribution_weekly = p_total
    WHERE guild_id = p_guild_id AND character_id = p_character_id;
$$;

CREATE OR REPLACE FUNCTION player.update_guild_leader(
    p_guild_id bigint,
    p_old_leader_id bigint,
    p_new_leader_id bigint,
    p_leader_rank integer,
    p_member_rank integer
)
RETURNS void
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
BEGIN
    UPDATE player.guilds
    SET leader_id = p_new_leader_id,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_guild_id;

    UPDATE player.guild_members
    SET rank = p_leader_rank
    WHERE guild_id = p_guild_id AND character_id = p_new_leader_id;

    UPDATE player.guild_members
    SET rank = p_member_rank
    WHERE guild_id = p_guild_id AND character_id = p_old_leader_id;
END;
$$;

CREATE OR REPLACE FUNCTION player.list_guild_warehouse_slots(p_guild_id bigint)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    slot_index integer,
    template_id integer,
    stack_count integer
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT id, guild_id, slot_index, template_id, stack_count
    FROM player.guild_warehouse
    WHERE guild_id = p_guild_id
    ORDER BY slot_index ASC;
$$;

CREATE OR REPLACE FUNCTION player.upsert_guild_warehouse_material(
    p_guild_id bigint,
    p_template_id integer,
    p_count integer
)
RETURNS TABLE (
    id bigint,
    guild_id bigint,
    slot_index integer,
    template_id integer,
    stack_count integer
)
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
DECLARE
    v_id bigint;
    v_slot_index integer;
    v_stack integer;
BEGIN
    UPDATE player.guild_warehouse
    SET stack_count = stack_count + p_count
    WHERE guild_id = p_guild_id AND template_id = p_template_id
    RETURNING guild_warehouse.id, guild_warehouse.slot_index, guild_warehouse.stack_count
    INTO v_id, v_slot_index, v_stack;

    IF FOUND THEN
        id := v_id;
        guild_id := p_guild_id;
        slot_index := v_slot_index;
        template_id := p_template_id;
        stack_count := v_stack;
        RETURN NEXT;
        RETURN;
    END IF;

    SELECT COALESCE(MIN(s), 0)
    FROM generate_series(0, COALESCE((SELECT MAX(w.slot_index) FROM player.guild_warehouse w WHERE w.guild_id = p_guild_id) + 1, 0)) AS s
    WHERE s NOT IN (SELECT w.slot_index FROM player.guild_warehouse w WHERE w.guild_id = p_guild_id)
    INTO v_slot_index;

    INSERT INTO player.guild_warehouse (guild_id, slot_index, template_id, stack_count)
    VALUES (p_guild_id, v_slot_index, p_template_id, p_count)
    RETURNING guild_warehouse.id, guild_warehouse.slot_index, guild_warehouse.stack_count
    INTO v_id, v_slot_index, v_stack;

    id := v_id;
    guild_id := p_guild_id;
    slot_index := v_slot_index;
    template_id := p_template_id;
    stack_count := v_stack;
    RETURN NEXT;
END;
$$;

CREATE OR REPLACE FUNCTION player.insert_guild_log(
    p_guild_id bigint,
    p_action_type integer,
    p_actor_id bigint,
    p_target_id bigint,
    p_details jsonb
)
RETURNS void
LANGUAGE sql
SECURITY INVOKER
AS $$
    INSERT INTO player.guild_logs (guild_id, action_type, actor_id, target_id, details)
    VALUES (p_guild_id, p_action_type, NULLIF(p_actor_id, 0), NULLIF(p_target_id, 0), p_details);
$$;

CREATE OR REPLACE FUNCTION player.load_latest_guild_log_details(
    p_guild_id bigint,
    p_action_type integer
)
RETURNS jsonb
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT details
    FROM player.guild_logs
    WHERE guild_id = p_guild_id AND action_type = p_action_type
    ORDER BY id DESC
    LIMIT 1;
$$;

-- =============================================================================
-- Magic estate
-- =============================================================================

CREATE OR REPLACE FUNCTION player.get_magic_estate_profile(p_character_id bigint)
RETURNS TABLE (
    character_id bigint,
    exp integer,
    actpoint integer,
    max_actpoint integer,
    move_pnt integer,
    max_move_pnt integer,
    farm_num integer
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT character_id, exp, actpoint, max_actpoint, move_pnt, max_move_pnt, farm_num
    FROM player.character_magic_estates
    WHERE character_id = p_character_id;
$$;

CREATE OR REPLACE FUNCTION player.list_magic_estate_slots(p_character_id bigint)
RETURNS TABLE (
    slot_id integer,
    mineral_id integer,
    num integer,
    max_num integer,
    cooldown_ends_at_ms bigint,
    harvest_flag boolean
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT slot_id, mineral_id, num, max_num, cooldown_ends_at_ms, harvest_flag
    FROM player.character_magic_estate_slots
    WHERE character_id = p_character_id
    ORDER BY slot_id;
$$;

CREATE OR REPLACE FUNCTION player.list_magic_estate_bag(p_character_id bigint)
RETURNS TABLE (
    slot_index integer,
    template_id integer,
    num bigint,
    color_code integer
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT slot_index, template_id, num, color_code
    FROM player.character_magic_estate_bag
    WHERE character_id = p_character_id
    ORDER BY slot_index;
$$;

CREATE OR REPLACE FUNCTION player.upsert_magic_estate_full(
    p_character_id bigint,
    p_exp integer,
    p_actpoint integer,
    p_max_actpoint integer,
    p_move_pnt integer,
    p_max_move_pnt integer,
    p_farm_num integer,
    p_slots jsonb,
    p_bag jsonb
)
RETURNS void
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
BEGIN
    INSERT INTO player.character_magic_estates (
        character_id, exp, actpoint, max_actpoint, move_pnt, max_move_pnt, farm_num
    ) VALUES (
        p_character_id, p_exp, p_actpoint, p_max_actpoint, p_move_pnt, p_max_move_pnt, p_farm_num
    )
    ON CONFLICT (character_id)
    DO UPDATE SET
        exp = EXCLUDED.exp,
        actpoint = EXCLUDED.actpoint,
        max_actpoint = EXCLUDED.max_actpoint,
        move_pnt = EXCLUDED.move_pnt,
        max_move_pnt = EXCLUDED.max_move_pnt,
        farm_num = EXCLUDED.farm_num,
        updated_at = now();

    DELETE FROM player.character_magic_estate_slots WHERE character_id = p_character_id;
    INSERT INTO player.character_magic_estate_slots (
        character_id, slot_id, mineral_id, num, max_num, cooldown_ends_at_ms, harvest_flag
    )
    SELECT
        p_character_id,
        (e->>'slot_id')::integer,
        (e->>'mineral_id')::integer,
        (e->>'num')::integer,
        (e->>'max_num')::integer,
        (e->>'cooldown_ends_at_ms')::bigint,
        (e->>'harvest_flag')::boolean
    FROM jsonb_array_elements(COALESCE(p_slots, '[]'::jsonb)) AS e;

    DELETE FROM player.character_magic_estate_bag WHERE character_id = p_character_id;
    INSERT INTO player.character_magic_estate_bag (
        character_id, slot_index, template_id, num, color_code
    )
    SELECT
        p_character_id,
        (e->>'slot_index')::integer,
        (e->>'template_id')::integer,
        (e->>'num')::bigint,
        (e->>'color_code')::integer
    FROM jsonb_array_elements(COALESCE(p_bag, '[]'::jsonb)) AS e;
END;
$$;

CREATE OR REPLACE FUNCTION player.list_magic_estate_logs(p_character_id bigint, p_limit integer)
RETURNS TABLE (
    id bigint,
    character_id bigint,
    log_time_ms bigint,
    result integer,
    guest boolean,
    cid bigint,
    tid bigint,
    name text,
    item_template_id integer,
    num integer,
    no_replay boolean,
    battle_id bigint,
    created_at timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT id, character_id, log_time_ms, result, guest, cid, tid, name, item_template_id, num, no_replay, battle_id, created_at
    FROM player.character_magic_estate_logs
    WHERE character_id = p_character_id
    ORDER BY log_time_ms DESC, id DESC
    LIMIT p_limit;
$$;

CREATE OR REPLACE FUNCTION player.list_magic_estate_replays(p_character_id bigint, p_limit integer)
RETURNS TABLE (
    character_id bigint,
    battle_id bigint,
    name text,
    timestamp_text text,
    created_at timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT character_id, battle_id, name, timestamp_text, created_at
    FROM player.character_magic_estate_replays
    WHERE character_id = p_character_id
    ORDER BY created_at DESC, battle_id DESC
    LIMIT p_limit;
$$;

CREATE OR REPLACE FUNCTION player.save_magic_estate_replay(
    p_character_id bigint,
    p_battle_id bigint,
    p_name text,
    p_timestamp text
)
RETURNS void
LANGUAGE sql
SECURITY INVOKER
AS $$
    INSERT INTO player.character_magic_estate_replays (
        character_id, battle_id, name, timestamp_text
    ) VALUES (p_character_id, p_battle_id, p_name, p_timestamp)
    ON CONFLICT (character_id, battle_id)
    DO UPDATE SET
        name = EXCLUDED.name,
        timestamp_text = EXCLUDED.timestamp_text,
        created_at = now();
$$;

CREATE OR REPLACE FUNCTION player.save_magic_estate_log(
    p_character_id bigint,
    p_log_time_ms bigint,
    p_result integer,
    p_guest boolean,
    p_cid bigint,
    p_tid bigint,
    p_name text,
    p_item_template_id integer,
    p_num integer,
    p_no_replay boolean,
    p_battle_id bigint
)
RETURNS TABLE (id bigint, created_at timestamptz)
LANGUAGE sql
SECURITY INVOKER
AS $$
    INSERT INTO player.character_magic_estate_logs (
        character_id, log_time_ms, result, guest, cid, tid, name, item_template_id, num, no_replay, battle_id
    ) VALUES (
        p_character_id, p_log_time_ms, p_result, p_guest, p_cid, p_tid, p_name, p_item_template_id, p_num, p_no_replay, p_battle_id
    )
    RETURNING character_magic_estate_logs.id, character_magic_estate_logs.created_at;
$$;

-- =============================================================================
-- Marriage
-- =============================================================================

CREATE OR REPLACE FUNCTION player.find_marriage_by_partner(p_character_id bigint)
RETURNS TABLE (
    id bigint,
    partner1_id bigint,
    partner2_id bigint,
    ring_type integer,
    intimacy integer,
    married_at timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT id, partner1_id, partner2_id, ring_type, intimacy, married_at
    FROM player.marriages
    WHERE divorced_at IS NULL
      AND (partner1_id = p_character_id OR partner2_id = p_character_id)
    LIMIT 1;
$$;

CREATE OR REPLACE FUNCTION player.create_marriage(
    p_partner1_id bigint,
    p_partner2_id bigint,
    p_ring_type integer,
    p_intimacy integer,
    p_married_at timestamptz
)
RETURNS TABLE (id bigint, married_at timestamptz)
LANGUAGE sql
SECURITY INVOKER
AS $$
    INSERT INTO player.marriages (partner1_id, partner2_id, ring_type, intimacy, married_at)
    VALUES (p_partner1_id, p_partner2_id, p_ring_type, p_intimacy, p_married_at)
    RETURNING marriages.id, marriages.married_at;
$$;

CREATE OR REPLACE FUNCTION player.list_marriage_ranks(p_offset integer, p_limit integer)
RETURNS TABLE (
    id bigint,
    partner1_id bigint,
    partner1_name character varying,
    partner2_id bigint,
    partner2_name character varying,
    ring_type integer,
    intimacy integer,
    married_at timestamptz
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        m.id,
        m.partner1_id,
        c1.name,
        m.partner2_id,
        c2.name,
        m.ring_type,
        m.intimacy,
        m.married_at
    FROM player.marriages AS m
    JOIN player.characters AS c1 ON c1.id = m.partner1_id
    JOIN player.characters AS c2 ON c2.id = m.partner2_id
    WHERE m.divorced_at IS NULL
    ORDER BY m.intimacy DESC, m.married_at ASC
    OFFSET p_offset
    LIMIT p_limit;
$$;
