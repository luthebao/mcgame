set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.deactivate_character_quest_loop(p_character_id bigint, p_loop_id integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_quest_loops"
        set "active" = false, "active_quest_id" = null, "updated_at" = now()
        where "character_id" = p_character_id and "loop_id" = p_loop_id and "active" = true
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_quest_loops(p_character_id bigint)
 RETURNS SETOF player.character_quest_loops
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."character_quest_loops"
    where "character_id" = p_character_id
    order by "loop_id";
$function$
;

CREATE OR REPLACE FUNCTION player.get_completed_quest_ids_with_date(p_character_id bigint)
 RETURNS TABLE(quest_id integer, completed_at timestamp with time zone)
 LANGUAGE sql
 STABLE
 SET search_path TO ''
AS $function$
    select "quest_id", max("completed_at") as "completed_at"
    from "player"."quest_history"
    where "character_id" = p_character_id
    group by "quest_id"
    order by "quest_id";
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_quest_loop(p_character_id bigint, p_loop_id integer, p_ft integer, p_take_date_ms bigint, p_active boolean, p_active_quest_id integer)
 RETURNS SETOF player.character_quest_loops
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."character_quest_loops" (
        "character_id", "loop_id", "ft", "take_date_ms", "active", "active_quest_id"
    )
    values (
        p_character_id, p_loop_id, p_ft, p_take_date_ms, p_active, p_active_quest_id
    )
    on conflict ("character_id", "loop_id") do update set
        "ft" = excluded."ft",
        "take_date_ms" = excluded."take_date_ms",
        "active" = excluded."active",
        "active_quest_id" = excluded."active_quest_id",
        "updated_at" = now()
    returning *;
$function$
;


