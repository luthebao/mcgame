set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.add_character_title(p_character_id bigint, p_title_id integer)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."character_titles" ("character_id", "title_id", "is_active")
    values ("p_character_id", "p_title_id", false)
    on conflict ("character_id", "title_id") do nothing;
$function$
;

CREATE OR REPLACE FUNCTION player.clear_character_following_pets(p_character_id bigint, p_now timestamp with time zone)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_pets"
        set "is_following" = false,
            "updated_at" = "p_now"
        where "character_id" = "p_character_id"
          and "is_following" = true
        returning 1
    )
    select count(*) from upd;
$function$
;

CREATE OR REPLACE FUNCTION player.count_character_items_by_slot_type(p_character_id bigint, p_slot_type integer)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select count(*)
    from "player"."character_items"
    where "character_id" = "p_character_id"
      and "slot_type" = "p_slot_type";
$function$
;

CREATE OR REPLACE FUNCTION player.count_character_pets(p_character_id bigint)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select count(*)
    from "player"."character_pets"
    where "character_id" = "p_character_id";
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character_buff(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_buffs" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character_item(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_items" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character_items_by_character(p_character_id bigint)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_items" where "character_id" = "p_character_id"
        returning 1
    )
    select count(*) from del;
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character_pet(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_pets" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_character_skill(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_skills" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_expired_character_buffs(p_character_id bigint, p_now timestamp with time zone)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_buffs"
        where "character_id" = "p_character_id"
          and "expires_at" is not null
          and "expires_at" <= "p_now"
        returning 1
    )
    select count(*) from del;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_buff(p_id bigint)
 RETURNS SETOF player.character_buffs
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."character_buffs"
    where "id" = "p_id";
$function$
;

CREATE OR REPLACE FUNCTION player.has_character_skill(p_character_id bigint, p_skill_id integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select exists(
        select 1
        from "player"."character_skills"
        where "character_id" = "p_character_id" and "skill_id" = "p_skill_id"
    );
$function$
;

CREATE OR REPLACE FUNCTION player.list_character_buffs(p_character_id bigint)
 RETURNS SETOF player.character_buffs
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select *
    from "player"."character_buffs"
    where "character_id" = "p_character_id"
    order by "id";
$function$
;

CREATE OR REPLACE FUNCTION player.move_character_item(p_id bigint, p_slot_type integer, p_slot_index integer, p_now timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_items"
        set "slot_type" = "p_slot_type",
            "slot_index" = "p_slot_index",
            "updated_at" = "p_now"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.set_pet_follow_state(p_pet_id bigint, p_is_following boolean, p_now timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_pets"
        set "is_following" = "p_is_following",
            "updated_at" = "p_now"
        where "id" = "p_pet_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_item_stack(p_id bigint, p_stack_count integer, p_now timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_items"
        set "stack_count" = "p_stack_count",
            "updated_at" = "p_now"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_skill_cooldown(p_id bigint, p_cooldown timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_skills"
        set "cooldown_end" = "p_cooldown"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.update_character_skill_slot(p_id bigint, p_slot integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."character_skills"
        set "slot_position" = "p_slot"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_buff(p_character_id bigint, p_buff_id integer, p_buff_type integer, p_source text, p_duration_total integer, p_expires_at timestamp with time zone, p_rounds_left integer, p_battles_left integer, p_stack_count integer)
 RETURNS SETOF player.character_buffs
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."character_buffs" (
        "character_id", "buff_id", "buff_type", "source", "duration_total",
        "expires_at", "rounds_left", "battles_left", "stack_count", "created_at"
    ) values (
        "p_character_id", "p_buff_id", "p_buff_type", "p_source", "p_duration_total",
        "p_expires_at", "p_rounds_left", "p_battles_left", "p_stack_count", now()
    )
    on conflict ("character_id", "buff_id") do update set
        "buff_type"      = excluded."buff_type",
        "source"         = excluded."source",
        "duration_total" = excluded."duration_total",
        "expires_at"     = excluded."expires_at",
        "rounds_left"    = excluded."rounds_left",
        "battles_left"   = excluded."battles_left",
        "stack_count"    = excluded."stack_count",
        "created_at"     = now()
    returning *;
$function$
;


