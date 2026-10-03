set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.list_active_schedule_bosses()
 RETURNS TABLE(nid integer, name text, map_id integer, level integer, kind text, tier text, channel_scope text, description text, is_active boolean)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "nid",
           "name",
           "map_id",
           "level",
           "kind",
           "tier",
           "channel_scope",
           coalesce("description", '') as "description",
           "is_active"
    from "data"."data_tbl_schedule_boss"
    where "is_active" = true;
$function$
;

CREATE OR REPLACE FUNCTION player.fetch_due_schedule_boss_spawns(p_now timestamp with time zone)
 RETURNS SETOF player.schedule_boss_state
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."schedule_boss_state"
    where not "is_alive" and "next_spawn_at" <= "p_now";
$function$
;

CREATE OR REPLACE FUNCTION player.get_schedule_boss_state(p_nid integer, p_channel_id integer)
 RETURNS SETOF player.schedule_boss_state
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."schedule_boss_state"
    where "nid" = "p_nid" and "channel_id" = "p_channel_id";
$function$
;

CREATE OR REPLACE FUNCTION player.insert_missing_schedule_boss_states(p_states jsonb)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."schedule_boss_state" (
        "nid", "channel_id", "is_alive", "next_spawn_at", "updated_at"
    )
    select s."nid", s."channel_id", s."is_alive", s."next_spawn_at", now()
    from jsonb_to_recordset("p_states")
        as s("nid" integer, "channel_id" integer, "is_alive" boolean, "next_spawn_at" timestamptz)
    on conflict ("nid", "channel_id") do nothing;
$function$
;

CREATE OR REPLACE FUNCTION player.list_alive_schedule_bosses(p_channel_id integer)
 RETURNS SETOF player.schedule_boss_state
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."schedule_boss_state"
    where "channel_id" = "p_channel_id" and "is_alive";
$function$
;

CREATE OR REPLACE FUNCTION player.list_schedule_boss_keys()
 RETURNS TABLE(nid integer, channel_id integer)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "nid", "channel_id"
    from "player"."schedule_boss_state";
$function$
;

CREATE OR REPLACE FUNCTION player.mark_schedule_boss_alive(p_nid integer, p_channel_id integer, p_now timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."schedule_boss_state"
        set "is_alive" = true, "updated_at" = "p_now"
        where "nid" = "p_nid"
          and "channel_id" = "p_channel_id"
          and not "is_alive"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.mark_schedule_boss_killed(p_nid integer, p_channel_id integer, p_killer_id bigint, p_next_spawn_at timestamp with time zone, p_now timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."schedule_boss_state"
        set "is_alive"       = false,
            "last_killed_at" = "p_now",
            "last_killer_id" = "p_killer_id",
            "next_spawn_at"  = "p_next_spawn_at",
            "spawn_count"    = "spawn_count" + 1,
            "updated_at"     = "p_now"
        where "nid" = "p_nid"
          and "channel_id" = "p_channel_id"
          and "is_alive"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_schedule_boss_state(p_nid integer, p_channel_id integer, p_is_alive boolean, p_last_killed_at timestamp with time zone, p_last_killer_id bigint, p_next_spawn_at timestamp with time zone, p_spawn_count integer)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."schedule_boss_state" (
        "nid", "channel_id", "is_alive", "last_killed_at",
        "last_killer_id", "next_spawn_at", "spawn_count", "updated_at"
    ) values (
        "p_nid", "p_channel_id", "p_is_alive", "p_last_killed_at",
        "p_last_killer_id", "p_next_spawn_at", "p_spawn_count", now()
    )
    on conflict ("nid", "channel_id") do update set
        "is_alive"       = excluded."is_alive",
        "last_killed_at" = excluded."last_killed_at",
        "last_killer_id" = excluded."last_killer_id",
        "next_spawn_at"  = excluded."next_spawn_at",
        "spawn_count"    = excluded."spawn_count",
        "updated_at"     = now();
$function$
;


