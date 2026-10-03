set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.create_block_relationship(p_character_id bigint, p_other_id bigint, p_reason text)
 RETURNS TABLE(id bigint, created_at timestamp with time zone)
 LANGUAGE plpgsql
AS $function$
begin
    return query
    insert into player.blocks (
        character_id,
        blocked_id,
        reason,
        created_at
    )
    values (
        p_character_id,
        p_other_id,
        p_reason,
        current_timestamp
    )
    returning blocks.id, blocks.created_at;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_character_item(p_character_id bigint, p_template_id integer, p_item_type integer, p_slot_type integer, p_slot_index integer, p_stack_count integer, p_is_bound boolean, p_durability integer, p_max_durability integer, p_enchant_level integer, p_star_level integer, p_color_code integer, p_properties jsonb, p_created_at timestamp with time zone, p_updated_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.character_items (
        character_id,
        template_id,
        item_type,
        slot_type,
        slot_index,
        stack_count,
        is_bound,
        durability,
        max_durability,
        enchant_level,
        star_level,
        color_code,
        properties,
        created_at,
        updated_at
    )
    values (
        p_character_id,
        p_template_id,
        p_item_type,
        p_slot_type,
        p_slot_index,
        p_stack_count,
        p_is_bound,
        p_durability,
        p_max_durability,
        p_enchant_level,
        p_star_level,
        p_color_code,
        p_properties,
        p_created_at,
        p_updated_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_character_pet(p_character_id bigint, p_template_id integer, p_name text, p_level integer, p_experience bigint, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_ex integer, p_apt_agility_ex integer, p_apt_stamina_ex integer, p_apt_intelligence_ex integer, p_apt_energy_ex integer, p_grow_rate double precision, p_grow_rate_add double precision, p_upgrade_num integer, p_evolution_lv integer, p_element integer, p_current_hp integer, p_current_mp integer, p_max_hp integer, p_max_mp integer, p_is_following boolean, p_is_mounting boolean, p_property jsonb, p_created_at timestamp with time zone, p_updated_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.character_pets (
        character_id,
        template_id,
        name,
        level,
        experience,
        apt_strength,
        apt_agility,
        apt_stamina,
        apt_intelligence,
        apt_energy,
        apt_strength_ex,
        apt_agility_ex,
        apt_stamina_ex,
        apt_intelligence_ex,
        apt_energy_ex,
        grow_rate,
        grow_rate_add,
        upgrade_num,
        evolution_lv,
        element,
        current_hp,
        current_mp,
        max_hp,
        max_mp,
        is_following,
        is_mounting,
        property,
        created_at,
        updated_at
    )
    values (
        p_character_id,
        p_template_id,
        p_name,
        p_level,
        p_experience,
        p_apt_strength,
        p_apt_agility,
        p_apt_stamina,
        p_apt_intelligence,
        p_apt_energy,
        p_apt_strength_ex,
        p_apt_agility_ex,
        p_apt_stamina_ex,
        p_apt_intelligence_ex,
        p_apt_energy_ex,
        p_grow_rate,
        p_grow_rate_add,
        p_upgrade_num,
        p_evolution_lv,
        p_element,
        p_current_hp,
        p_current_mp,
        p_max_hp,
        p_max_mp,
        p_is_following,
        p_is_mounting,
        p_property,
        p_created_at,
        p_updated_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_friend_relationship(p_character_id bigint, p_other_id bigint, p_group_id integer, p_nickname text, p_intimacy integer)
 RETURNS TABLE(id bigint, created_at timestamp with time zone)
 LANGUAGE plpgsql
AS $function$
begin
    return query
    insert into player.friends (
        character_id,
        friend_id,
        group_id,
        nickname,
        intimacy,
        created_at
    )
    values (
        p_character_id,
        p_other_id,
        p_group_id,
        p_nickname,
        p_intimacy,
        current_timestamp
    )
    returning friends.id, friends.created_at;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_initial_battle_log(p_battle_type integer, p_participants jsonb, p_created_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.battle_logs (
        battle_type,
        participants,
        actions,
        result,
        created_at
    )
    values (
        p_battle_type,
        p_participants,
        '[]'::jsonb,
        '{}'::jsonb,
        p_created_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_quest_progress(p_character_id bigint, p_quest_id integer, p_status integer, p_objectives jsonb, p_started_at timestamp with time zone, p_completed_at timestamp with time zone, p_expires_at timestamp with time zone, p_completion_count integer, p_last_reset timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.character_quests (
        character_id,
        quest_id,
        status,
        objectives,
        started_at,
        completed_at,
        expires_at,
        completion_count,
        last_reset
    )
    values (
        p_character_id,
        p_quest_id,
        p_status,
        p_objectives,
        p_started_at,
        p_completed_at,
        p_expires_at,
        p_completion_count,
        p_last_reset
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.get_battle_log_by_id(p_id bigint)
 RETURNS SETOF player.battle_logs
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.battle_logs
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_battle_logs_by_participant(p_character_id text, p_limit integer)
 RETURNS SETOF player.battle_logs
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.battle_logs
    where participants @> jsonb_build_array(jsonb_build_object('id', p_character_id))
    order by created_at desc
    limit p_limit;
$function$
;

CREATE OR REPLACE FUNCTION player.get_blacklist_relationship_by_id(p_relationship_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, created_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        b.id,
        b.character_id,
        b.blocked_id as other_id,
        c.name as other_name,
        b.created_at
    from player.blocks as b
    join player.characters as c on c.id = b.blocked_id
    where b.id = p_relationship_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_blacklist_relationships(p_character_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, created_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        b.id,
        b.character_id,
        b.blocked_id as other_id,
        c.name as other_name,
        b.created_at
    from player.blocks as b
    join player.characters as c on c.id = b.blocked_id
    where b.character_id = p_character_id
    order by b.created_at desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_id_by_name(p_name text)
 RETURNS TABLE(id bigint, name text)
 LANGUAGE sql
 STABLE
AS $function$
    select
        c.id,
        c.name
    from player.characters as c
    where lower(c.name) = lower(p_name)
    limit 1;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_item_by_id(p_id bigint)
 RETURNS SETOF player.character_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_items
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_item_by_slot(p_character_id bigint, p_slot_type integer, p_slot_index integer)
 RETURNS SETOF player.character_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_items
    where character_id = p_character_id
      and slot_type = p_slot_type
      and slot_index = p_slot_index;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_item_slot_indexes(p_character_id bigint, p_slot_type integer)
 RETURNS SETOF integer
 LANGUAGE sql
 STABLE
AS $function$
    select slot_index
    from player.character_items
    where character_id = p_character_id
      and slot_type = p_slot_type
    order by slot_index;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_items_by_character(p_character_id bigint)
 RETURNS SETOF player.character_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_items
    where character_id = p_character_id
    order by slot_type, slot_index;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_items_by_slot_type(p_character_id bigint, p_slot_type integer)
 RETURNS SETOF player.character_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_items
    where character_id = p_character_id
      and slot_type = p_slot_type
    order by slot_index;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_pet_by_id(p_id bigint)
 RETURNS SETOF player.character_pets
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_pets
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_pets_by_character(p_character_id bigint)
 RETURNS SETOF player.character_pets
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_pets
    where character_id = p_character_id
    order by id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_quests(p_character_id bigint)
 RETURNS SETOF player.character_quests
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_quests
    where character_id = p_character_id
    order by started_at desc, id desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_quests_by_status(p_character_id bigint, p_status integer)
 RETURNS SETOF player.character_quests
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_quests
    where character_id = p_character_id
      and status = p_status
    order by
        case when p_status = 1 then completed_at else started_at end desc,
        id desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_social_info(p_character_id bigint)
 RETURNS TABLE(level integer, class_id integer)
 LANGUAGE sql
 STABLE
AS $function$
    select
        c.level,
        c.class_id
    from player.characters as c
    where c.id = p_character_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_completed_quest_ids(p_character_id bigint)
 RETURNS SETOF integer
 LANGUAGE sql
 STABLE
AS $function$
    select distinct quest_id
    from player.quest_history
    where character_id = p_character_id
    order by quest_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_following_character_pet(p_character_id bigint)
 RETURNS SETOF player.character_pets
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_pets
    where character_id = p_character_id
      and is_following = true
    limit 1;
$function$
;

CREATE OR REPLACE FUNCTION player.get_friend_relationship_by_id(p_relationship_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, group_id integer, nickname text, intimacy integer, created_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        f.id,
        f.character_id,
        f.friend_id as other_id,
        c.name as other_name,
        f.group_id,
        coalesce(f.nickname, '') as nickname,
        coalesce(f.intimacy, 0) as intimacy,
        f.created_at
    from player.friends as f
    join player.characters as c on c.id = f.friend_id
    where f.id = p_relationship_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_friend_relationships(p_character_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, group_id integer, nickname text, intimacy integer, created_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        f.id,
        f.character_id,
        f.friend_id as other_id,
        c.name as other_name,
        f.group_id,
        coalesce(f.nickname, '') as nickname,
        coalesce(f.intimacy, 0) as intimacy,
        f.created_at
    from player.friends as f
    join player.characters as c on c.id = f.friend_id
    where f.character_id = p_character_id
    order by f.created_at desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_quest_progress_by_character(p_character_id bigint, p_quest_id integer)
 RETURNS SETOF player.character_quests
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_quests
    where character_id = p_character_id
      and quest_id = p_quest_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_quest_progress_by_id(p_id bigint)
 RETURNS SETOF player.character_quests
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_quests
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_recent_battle_logs(p_limit integer)
 RETURNS SETOF player.battle_logs
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.battle_logs
    order by created_at desc
    limit p_limit;
$function$
;

CREATE OR REPLACE FUNCTION player.record_quest_history(p_character_id bigint, p_quest_id integer, p_completed_at timestamp with time zone, p_rewards_claimed jsonb)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.quest_history (
        character_id,
        quest_id,
        completed_at,
        rewards_claimed
    )
    values (
        p_character_id,
        p_quest_id,
        p_completed_at,
        p_rewards_claimed
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.save_battle_log(p_battle_type integer, p_participants jsonb, p_actions jsonb, p_result jsonb, p_created_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.battle_logs (
        battle_type,
        participants,
        actions,
        result,
        created_at
    )
    values (
        p_battle_type,
        p_participants,
        p_actions,
        p_result,
        p_created_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_battle_log(p_id bigint, p_participants jsonb, p_actions jsonb, p_result jsonb)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.battle_logs
    set participants = p_participants,
        actions = p_actions,
        result = p_result
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_item(p_id bigint, p_template_id integer, p_item_type integer, p_slot_type integer, p_slot_index integer, p_stack_count integer, p_is_bound boolean, p_durability integer, p_max_durability integer, p_enchant_level integer, p_star_level integer, p_color_code integer, p_properties jsonb, p_updated_at timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.character_items
    set template_id = p_template_id,
        item_type = p_item_type,
        slot_type = p_slot_type,
        slot_index = p_slot_index,
        stack_count = p_stack_count,
        is_bound = p_is_bound,
        durability = p_durability,
        max_durability = p_max_durability,
        enchant_level = p_enchant_level,
        star_level = p_star_level,
        color_code = p_color_code,
        properties = p_properties,
        updated_at = p_updated_at
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_pet(p_id bigint, p_template_id integer, p_name text, p_level integer, p_experience bigint, p_apt_strength integer, p_apt_agility integer, p_apt_stamina integer, p_apt_intelligence integer, p_apt_energy integer, p_apt_strength_ex integer, p_apt_agility_ex integer, p_apt_stamina_ex integer, p_apt_intelligence_ex integer, p_apt_energy_ex integer, p_grow_rate double precision, p_grow_rate_add double precision, p_upgrade_num integer, p_evolution_lv integer, p_element integer, p_current_hp integer, p_current_mp integer, p_max_hp integer, p_max_mp integer, p_is_following boolean, p_is_mounting boolean, p_property jsonb, p_updated_at timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.character_pets
    set template_id = p_template_id,
        name = p_name,
        level = p_level,
        experience = p_experience,
        apt_strength = p_apt_strength,
        apt_agility = p_apt_agility,
        apt_stamina = p_apt_stamina,
        apt_intelligence = p_apt_intelligence,
        apt_energy = p_apt_energy,
        apt_strength_ex = p_apt_strength_ex,
        apt_agility_ex = p_apt_agility_ex,
        apt_stamina_ex = p_apt_stamina_ex,
        apt_intelligence_ex = p_apt_intelligence_ex,
        apt_energy_ex = p_apt_energy_ex,
        grow_rate = p_grow_rate,
        grow_rate_add = p_grow_rate_add,
        upgrade_num = p_upgrade_num,
        evolution_lv = p_evolution_lv,
        element = p_element,
        current_hp = p_current_hp,
        current_mp = p_current_mp,
        max_hp = p_max_hp,
        max_mp = p_max_mp,
        is_following = p_is_following,
        is_mounting = p_is_mounting,
        property = p_property,
        updated_at = p_updated_at
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_quest_progress(p_id bigint, p_status integer, p_objectives jsonb, p_completed_at timestamp with time zone, p_expires_at timestamp with time zone, p_completion_count integer, p_last_reset timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update player.character_quests
    set status = p_status,
        objectives = p_objectives,
        completed_at = p_completed_at,
        expires_at = p_expires_at,
        completion_count = p_completion_count,
        last_reset = p_last_reset
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.create_account(p_id uuid, p_username text, p_password_hash text, p_secondary_password text, p_email text, p_vip_level integer, p_gold integer, p_is_banned boolean, p_ban_reason text, p_ban_expiry timestamp with time zone, p_created_at timestamp with time zone, p_last_login timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    insert into public.accounts (
        id,
        username,
        password_hash,
        secondary_password,
        email,
        vip_level,
        gold,
        is_banned,
        ban_reason,
        ban_expiry,
        created_at,
        last_login
    )
    values (
        p_id,
        p_username,
        p_password_hash,
        p_secondary_password,
        p_email,
        p_vip_level,
        p_gold,
        p_is_banned,
        p_ban_reason,
        p_ban_expiry,
        p_created_at,
        p_last_login
    );

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.get_account_by_id(p_id uuid)
 RETURNS SETOF public.accounts
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from public.accounts
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION public.get_account_by_username(p_username text)
 RETURNS SETOF public.accounts
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from public.accounts
    where username = p_username;
$function$
;

CREATE OR REPLACE FUNCTION public.update_account(p_id uuid, p_username text, p_password_hash text, p_secondary_password text, p_email text, p_vip_level integer, p_gold integer, p_is_banned boolean, p_ban_reason text, p_ban_expiry timestamp with time zone, p_last_login timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_count bigint;
begin
    update public.accounts
    set username = p_username,
        password_hash = p_password_hash,
        secondary_password = p_secondary_password,
        email = p_email,
        vip_level = p_vip_level,
        gold = p_gold,
        is_banned = p_is_banned,
        ban_reason = p_ban_reason,
        ban_expiry = p_ban_expiry,
        last_login = p_last_login
    where id = p_id;

    get diagnostics updated_count = row_count;
    return updated_count > 0;
end;
$function$
;


