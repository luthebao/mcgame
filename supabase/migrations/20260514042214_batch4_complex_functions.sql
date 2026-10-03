set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.get_activity_config(p_id integer)
 RETURNS TABLE(id integer, name text, style_name text, panel_key text, feature_key text, sort_type integer, enable boolean, type integer, flag integer, note text)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select
        "id",
        coalesce("name", '') as "name",
        coalesce("style_name", '') as "style_name",
        coalesce("panel_key", '') as "panel_key",
        coalesce("feature_key", '') as "feature_key",
        "sort_type",
        "enable",
        "type",
        "flag",
        coalesce("note", '') as "note"
    from "data"."data_tbl_activity"
    where "id" = "p_id";
$function$
;

CREATE OR REPLACE FUNCTION player.character_exists_by_name(p_name text)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select exists(select 1 from "player"."characters" where "name" = "p_name");
$function$
;

CREATE OR REPLACE FUNCTION player.count_game_data_rows(p_table text)
 RETURNS bigint
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_regclass regclass;
    v_count bigint;
begin
    v_regclass := "p_table"::regclass;
    execute format('select count(*) from %s', v_regclass) into v_count;
    return v_count;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."characters" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character_quest(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_quests" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_game_data_template(p_table text, p_record_id integer)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    delete from "player"."game_data_templates"
    where "table_name" = "p_table" and "record_id" = "p_record_id";
$function$
;

CREATE OR REPLACE FUNCTION player.delete_game_data_templates_by_table(p_table text)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    delete from "player"."game_data_templates"
    where "table_name" = "p_table";
$function$
;

CREATE OR REPLACE FUNCTION player.delete_magic_estate_replay(p_character_id bigint, p_battle_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_magic_estate_replays"
        where "character_id" = "p_character_id" and "battle_id" = "p_battle_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_interface_settings(p_character_id bigint)
 RETURNS jsonb
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "interface_settings"
    from "player"."character_interface_settings"
    where "character_id" = "p_character_id";
$function$
;

CREATE OR REPLACE FUNCTION player.get_game_data_row(p_table text, p_id integer)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_regclass regclass;
    v_data jsonb;
begin
    v_regclass := "p_table"::regclass;
    execute format('select to_jsonb(t.*) from %s t where id = $1', v_regclass)
        into v_data
        using "p_id";
    return v_data;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.list_character_achievements(p_character_id bigint)
 RETURNS SETOF player.character_achievements
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."character_achievements"
    where "character_id" = "p_character_id"
    order by "achievement_id";
$function$
;

CREATE OR REPLACE FUNCTION player.list_claimed_character_achievements(p_character_id bigint)
 RETURNS TABLE(achievement_id integer, claim_count integer)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "achievement_id", 1
    from "player"."character_achievements"
    where "character_id" = "p_character_id"
      and "is_claimed" = true;
$function$
;

CREATE OR REPLACE FUNCTION player.list_game_data_rows(p_table text)
 RETURNS SETOF jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_regclass regclass;
begin
    v_regclass := "p_table"::regclass;
    return query execute format('select to_jsonb(t.*) from %s t order by id', v_regclass);
end;
$function$
;

CREATE OR REPLACE FUNCTION player.mark_character_achievement_claimed(p_character_id bigint, p_achievement_id integer, p_claimed_at timestamp with time zone)
 RETURNS SETOF player.character_achievements
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    update "player"."character_achievements"
    set "is_claimed" = true,
        "claimed_at" = "p_claimed_at"
    where "character_id" = "p_character_id"
      and "achievement_id" = "p_achievement_id"
    returning *;
$function$
;

CREATE OR REPLACE FUNCTION player.mark_character_achievement_completed(p_character_id bigint, p_achievement_id integer, p_completed_at timestamp with time zone)
 RETURNS SETOF player.character_achievements
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    update "player"."character_achievements"
    set "is_completed" = true,
        "completed_at" = "p_completed_at"
    where "character_id" = "p_character_id"
      and "achievement_id" = "p_achievement_id"
    returning *;
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_position(p_id bigint, p_map_id integer, p_pos_x integer, p_pos_y integer, p_direction integer, p_last_active timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."characters"
        set "map_id" = "p_map_id",
            "pos_x" = "p_pos_x",
            "pos_y" = "p_pos_y",
            "direction" = "p_direction",
            "last_active" = "p_last_active"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_achievement(p_character_id bigint, p_achievement_id integer, p_progress integer, p_target integer, p_is_completed boolean, p_is_claimed boolean, p_completed_at timestamp with time zone, p_claimed_at timestamp with time zone)
 RETURNS SETOF player.character_achievements
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."character_achievements" (
        "character_id", "achievement_id", "progress", "target",
        "is_completed", "is_claimed", "completed_at", "claimed_at"
    ) values (
        "p_character_id", "p_achievement_id", "p_progress", "p_target",
        "p_is_completed", "p_is_claimed", "p_completed_at", "p_claimed_at"
    )
    on conflict ("character_id", "achievement_id") do update set
        "progress"     = excluded."progress",
        "target"       = excluded."target",
        "is_completed" = excluded."is_completed",
        "is_claimed"   = excluded."is_claimed",
        "completed_at" = excluded."completed_at",
        "claimed_at"   = excluded."claimed_at"
    returning *;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_interface_settings(p_character_id bigint, p_settings jsonb)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."character_interface_settings" ("character_id", "interface_settings")
    values ("p_character_id", "p_settings")
    on conflict ("character_id") do update set
        "interface_settings" = excluded."interface_settings",
        "updated_at" = now();
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_game_data_template(p_table text, p_record_id integer, p_data jsonb)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."game_data_templates" ("table_name", "record_id", "data")
    values ("p_table", "p_record_id", "p_data")
    on conflict ("table_name", "record_id")
    do update set "data" = excluded."data";
$function$
;


