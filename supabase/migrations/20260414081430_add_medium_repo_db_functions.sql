set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.create_character_skill(p_character_id bigint, p_skill_id integer, p_level integer, p_exp integer, p_slot_position integer, p_is_auto boolean, p_cooldown_end timestamp with time zone, p_created_at timestamp with time zone)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.character_skills (
        character_id,
        skill_id,
        level,
        exp,
        slot_position,
        is_auto,
        cooldown_end,
        created_at
    )
    values (
        p_character_id,
        p_skill_id,
        p_level,
        p_exp,
        p_slot_position,
        p_is_auto,
        p_cooldown_end,
        p_created_at
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_npc(p_template_id integer, p_name text, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_npc_type integer, p_dialog_id integer, p_respawn_time integer, p_is_active boolean)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare
    new_id integer;
begin
    insert into player.npcs (
        template_id,
        name,
        map_id,
        pos_x,
        pos_y,
        direction,
        npc_type,
        dialog_id,
        respawn_time,
        is_active
    )
    values (
        p_template_id,
        p_name,
        p_map_id,
        p_pos_x,
        p_pos_y,
        p_direction,
        p_npc_type,
        p_dialog_id,
        p_respawn_time,
        p_is_active
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.create_scene_item(p_template_id integer, p_map_id integer, p_pos_x integer, p_pos_y integer, p_stack_count integer, p_owner_id bigint, p_dropped_at timestamp without time zone, p_expires_at timestamp without time zone, p_is_static boolean)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
declare
    new_id bigint;
begin
    insert into player.scene_items (
        template_id,
        map_id,
        pos_x,
        pos_y,
        stack_count,
        owner_id,
        dropped_at,
        expires_at,
        is_static
    )
    values (
        p_template_id,
        p_map_id,
        p_pos_x,
        p_pos_y,
        p_stack_count,
        p_owner_id,
        p_dropped_at,
        p_expires_at,
        p_is_static
    )
    returning id into new_id;

    return new_id;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.get_active_mount(p_character_id bigint)
 RETURNS TABLE(character_id bigint, mount_id integer, level integer, experience bigint, is_active boolean)
 LANGUAGE sql
 STABLE
AS $function$
    select
        cm.character_id,
        cm.mount_id,
        cm.level,
        cm.experience,
        cm.is_active
    from player.character_mounts as cm
    where cm.character_id = p_character_id
      and cm.is_active = true
    order by cm.level desc, cm.mount_id desc
    limit 1;
$function$
;

CREATE OR REPLACE FUNCTION player.get_active_special_title(p_character_id bigint)
 RETURNS TABLE(title_id integer)
 LANGUAGE sql
 STABLE
AS $function$
    select ct.title_id
    from player.character_titles as ct
    inner join data.data_tbl_title as dt on ct.title_id = dt.id
    where ct.character_id = p_character_id
      and ct.is_active = true
      and (ct.expires_at is null or ct.expires_at > now())
      and dt.s in (1, 2)
    limit 1;
$function$
;

CREATE OR REPLACE FUNCTION player.get_active_title(p_character_id bigint)
 RETURNS TABLE(title_id integer)
 LANGUAGE sql
 STABLE
AS $function$
    select ct.title_id
    from player.character_titles as ct
    inner join data.data_tbl_title as dt on ct.title_id = dt.id
    where ct.character_id = p_character_id
      and ct.is_active = true
      and (ct.expires_at is null or ct.expires_at > now())
      and dt.s not in (1, 2)
    limit 1;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_farm_plot(p_character_id bigint, p_plot_npc_id integer)
 RETURNS TABLE(id bigint, character_id bigint, plot_npc_id integer, crop_npc_id integer, harvest_item_template_id integer, harvest_count integer, total_harvest_count integer, shared_harvester_ids bigint[], planted_at timestamp with time zone, ready_at timestamp with time zone, created_at timestamp with time zone, updated_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        cfp.id,
        cfp.character_id,
        cfp.plot_npc_id,
        cfp.crop_npc_id,
        cfp.harvest_item_template_id,
        cfp.harvest_count,
        cfp.total_harvest_count,
        cfp.shared_harvester_ids,
        cfp.planted_at,
        cfp.ready_at,
        cfp.created_at,
        cfp.updated_at
    from player.character_farm_plots as cfp
    where cfp.character_id = p_character_id
      and cfp.plot_npc_id = p_plot_npc_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_farm_plots(p_character_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, plot_npc_id integer, crop_npc_id integer, harvest_item_template_id integer, harvest_count integer, total_harvest_count integer, shared_harvester_ids bigint[], planted_at timestamp with time zone, ready_at timestamp with time zone, created_at timestamp with time zone, updated_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        cfp.id,
        cfp.character_id,
        cfp.plot_npc_id,
        cfp.crop_npc_id,
        cfp.harvest_item_template_id,
        cfp.harvest_count,
        cfp.total_harvest_count,
        cfp.shared_harvester_ids,
        cfp.planted_at,
        cfp.ready_at,
        cfp.created_at,
        cfp.updated_at
    from player.character_farm_plots as cfp
    where cfp.character_id = p_character_id
    order by cfp.plot_npc_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_progression(p_character_id bigint)
 RETURNS TABLE(character_id bigint, awaken_level integer, awaken_points integer, awaken_points_used integer, soul_level integer, soul_exp bigint, soul_points bigint)
 LANGUAGE sql
 STABLE
AS $function$
    select
        c.id,
        c.awaken_level,
        c.awaken_points,
        c.awaken_points_used,
        c.soul_level,
        c.soul_exp,
        c.soul_points
    from player.characters as c
    where c.id = p_character_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_skill_by_id(p_id bigint)
 RETURNS SETOF player.character_skills
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_skills
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_skill_by_skill_id(p_character_id bigint, p_skill_id integer)
 RETURNS SETOF player.character_skills
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_skills
    where character_id = p_character_id
      and skill_id = p_skill_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_skill_by_slot(p_character_id bigint, p_slot_position integer)
 RETURNS SETOF player.character_skills
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_skills
    where character_id = p_character_id
      and slot_position = p_slot_position;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_skills_by_character(p_character_id bigint)
 RETURNS SETOF player.character_skills
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.character_skills
    where character_id = p_character_id
    order by skill_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_special_titles(p_character_id bigint)
 RETURNS SETOF integer
 LANGUAGE sql
 STABLE
AS $function$
    select ct.title_id
    from player.character_titles as ct
    inner join data.data_tbl_title as dt on ct.title_id = dt.id
    where ct.character_id = p_character_id
      and (ct.expires_at is null or ct.expires_at > now())
      and dt.s in (1, 2)
    order by ct.obtained_at desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_titles(p_character_id bigint)
 RETURNS SETOF integer
 LANGUAGE sql
 STABLE
AS $function$
    select ct.title_id
    from player.character_titles as ct
    where ct.character_id = p_character_id
      and (ct.expires_at is null or ct.expires_at > now())
    order by ct.obtained_at desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_farm_plots_by_npc_ids(p_plot_npc_ids integer[])
 RETURNS TABLE(id bigint, character_id bigint, plot_npc_id integer, crop_npc_id integer, harvest_item_template_id integer, harvest_count integer, total_harvest_count integer, shared_harvester_ids bigint[], planted_at timestamp with time zone, ready_at timestamp with time zone, created_at timestamp with time zone, updated_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select distinct on (cfp.plot_npc_id)
        cfp.id,
        cfp.character_id,
        cfp.plot_npc_id,
        cfp.crop_npc_id,
        cfp.harvest_item_template_id,
        cfp.harvest_count,
        cfp.total_harvest_count,
        cfp.shared_harvester_ids,
        cfp.planted_at,
        cfp.ready_at,
        cfp.created_at,
        cfp.updated_at
    from player.character_farm_plots as cfp
    where cfp.plot_npc_id = any(p_plot_npc_ids)
    order by cfp.plot_npc_id, cfp.updated_at desc, cfp.id desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_latest_farm_plot(p_plot_npc_id integer)
 RETURNS TABLE(id bigint, character_id bigint, plot_npc_id integer, crop_npc_id integer, harvest_item_template_id integer, harvest_count integer, total_harvest_count integer, shared_harvester_ids bigint[], planted_at timestamp with time zone, ready_at timestamp with time zone, created_at timestamp with time zone, updated_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        cfp.id,
        cfp.character_id,
        cfp.plot_npc_id,
        cfp.crop_npc_id,
        cfp.harvest_item_template_id,
        cfp.harvest_count,
        cfp.total_harvest_count,
        cfp.shared_harvester_ids,
        cfp.planted_at,
        cfp.ready_at,
        cfp.created_at,
        cfp.updated_at
    from player.character_farm_plots as cfp
    where cfp.plot_npc_id = p_plot_npc_id
    order by cfp.updated_at desc, cfp.id desc
    limit 1;
$function$
;

CREATE OR REPLACE FUNCTION player.get_npc_by_id(p_id integer)
 RETURNS SETOF player.npcs
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.npcs
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_npcs_by_map(p_map_id integer)
 RETURNS SETOF player.npcs
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.npcs
    where map_id = p_map_id
      and is_active = true
    order by id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_npcs_by_template_id(p_template_id integer)
 RETURNS SETOF player.npcs
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.npcs
    where template_id = p_template_id
    order by id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_scene_item_by_id(p_id bigint)
 RETURNS SETOF player.scene_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.scene_items
    where id = p_id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_scene_items_by_map(p_map_id integer, p_now timestamp without time zone)
 RETURNS SETOF player.scene_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.scene_items
    where map_id = p_map_id
      and (expires_at is null or expires_at > p_now)
    order by id;
$function$
;

CREATE OR REPLACE FUNCTION player.get_scene_items_by_owner(p_owner_id bigint, p_now timestamp without time zone)
 RETURNS SETOF player.scene_items
 LANGUAGE sql
 STABLE
AS $function$
    select *
    from player.scene_items
    where owner_id = p_owner_id
      and (expires_at is null or expires_at > p_now)
    order by dropped_at desc;
$function$
;

CREATE OR REPLACE FUNCTION player.has_title(p_character_id bigint, p_title_id integer)
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    select exists(
        select 1
        from player.character_titles as ct
        where ct.character_id = p_character_id
          and ct.title_id = p_title_id
          and (ct.expires_at is null or ct.expires_at > now())
    );
$function$
;

CREATE OR REPLACE FUNCTION player.list_character_feature_states(p_character_id bigint)
 RETURNS TABLE(feature_key text, state jsonb)
 LANGUAGE sql
 STABLE
AS $function$
    select
        csf.feature_key,
        coalesce(csf.state, '{}'::jsonb)
    from player.character_stat_features as csf
    where csf.character_id = p_character_id
    order by csf.feature_key;
$function$
;

CREATE OR REPLACE FUNCTION player.list_pet_feature_states(p_pet_id bigint)
 RETURNS TABLE(feature_key text, state jsonb)
 LANGUAGE sql
 STABLE
AS $function$
    select
        psf.feature_key,
        coalesce(psf.state, '{}'::jsonb)
    from player.pet_stat_features as psf
    where psf.pet_id = p_pet_id
    order by psf.feature_key;
$function$
;

CREATE OR REPLACE FUNCTION player.set_active_special_title(p_character_id bigint, p_title_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    activated_rows integer := 0;
begin
    update player.character_titles as ct
    set is_active = false
    where ct.character_id = p_character_id
      and exists (
          select 1
          from data.data_tbl_title as dt
          where dt.id = ct.title_id
            and dt.s in (1, 2)
      );

    if p_title_id > 0 then
        update player.character_titles as ct
        set is_active = true
        where ct.character_id = p_character_id
          and ct.title_id = p_title_id
          and exists (
              select 1
              from data.data_tbl_title as dt
              where dt.id = ct.title_id
                and dt.s in (1, 2)
          );

        get diagnostics activated_rows = row_count;
        return activated_rows > 0;
    end if;

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.set_active_title(p_character_id bigint, p_title_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    activated_rows integer := 0;
begin
    update player.character_titles as ct
    set is_active = false
    where ct.character_id = p_character_id
      and not exists (
          select 1
          from data.data_tbl_title as dt
          where dt.id = ct.title_id
            and dt.s in (1, 2)
      );

    if p_title_id > 0 then
        update player.character_titles
        set is_active = true
        where character_id = p_character_id
          and title_id = p_title_id;

        get diagnostics activated_rows = row_count;
        return activated_rows > 0;
    end if;

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_skill(p_id bigint, p_skill_id integer, p_level integer, p_exp integer, p_slot_position integer, p_is_auto boolean, p_cooldown_end timestamp with time zone)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_rows integer := 0;
begin
    update player.character_skills
    set skill_id = p_skill_id,
        level = p_level,
        exp = p_exp,
        slot_position = p_slot_position,
        is_auto = p_is_auto,
        cooldown_end = p_cooldown_end
    where id = p_id;

    get diagnostics updated_rows = row_count;
    return updated_rows > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_npc(p_id integer, p_template_id integer, p_name text, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_npc_type integer, p_dialog_id integer, p_respawn_time integer, p_is_active boolean)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    updated_rows integer := 0;
begin
    update player.npcs
    set template_id = p_template_id,
        name = p_name,
        map_id = p_map_id,
        pos_x = p_pos_x,
        pos_y = p_pos_y,
        direction = p_direction,
        npc_type = p_npc_type,
        dialog_id = p_dialog_id,
        respawn_time = p_respawn_time,
        is_active = p_is_active
    where id = p_id;

    get diagnostics updated_rows = row_count;
    return updated_rows > 0;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_farm_plot(p_character_id bigint, p_plot_npc_id integer, p_crop_npc_id integer, p_harvest_item_template_id integer, p_harvest_count integer, p_total_harvest_count integer, p_shared_harvester_ids bigint[], p_planted_at timestamp with time zone, p_ready_at timestamp with time zone)
 RETURNS TABLE(id bigint, created_at timestamp with time zone, updated_at timestamp with time zone)
 LANGUAGE plpgsql
AS $function$
begin
    return query
    insert into player.character_farm_plots (
        character_id,
        plot_npc_id,
        crop_npc_id,
        harvest_item_template_id,
        harvest_count,
        total_harvest_count,
        shared_harvester_ids,
        planted_at,
        ready_at
    )
    values (
        p_character_id,
        p_plot_npc_id,
        p_crop_npc_id,
        p_harvest_item_template_id,
        p_harvest_count,
        p_total_harvest_count,
        p_shared_harvester_ids,
        p_planted_at,
        p_ready_at
    )
    on conflict (character_id, plot_npc_id)
    do update set
        crop_npc_id = excluded.crop_npc_id,
        harvest_item_template_id = excluded.harvest_item_template_id,
        harvest_count = excluded.harvest_count,
        total_harvest_count = excluded.total_harvest_count,
        shared_harvester_ids = excluded.shared_harvester_ids,
        planted_at = excluded.planted_at,
        ready_at = excluded.ready_at,
        updated_at = current_timestamp
    returning id, created_at, updated_at;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_feature_state(p_character_id bigint, p_feature_key text, p_state jsonb)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    insert into player.character_stat_features (character_id, feature_key, state)
    values (p_character_id, p_feature_key, p_state)
    on conflict (character_id, feature_key)
    do update set
        state = excluded.state,
        updated_at = now();

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_pet_feature_state(p_pet_id bigint, p_feature_key text, p_state jsonb)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
begin
    insert into player.pet_stat_features (pet_id, feature_key, state)
    values (p_pet_id, p_feature_key, p_state)
    on conflict (pet_id, feature_key)
    do update set
        state = excluded.state,
        updated_at = now();

    return true;
end;
$function$
;


