set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.create_guild_application(p_guild_id bigint, p_character_id bigint, p_message text, p_status integer)
 RETURNS TABLE(id bigint, created_at timestamp with time zone)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."guild_applications" (
        "guild_id", "character_id", "message", "status"
    ) values (
        "p_guild_id", "p_character_id", "p_message", "p_status"
    )
    returning "id", "created_at";
$function$
;

CREATE OR REPLACE FUNCTION player.delete_guild_application(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."guild_applications" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_guild_warehouse_slot(p_guild_id bigint, p_slot_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."guild_warehouse"
        where "guild_id" = "p_guild_id" and "id" = "p_slot_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_relationship(p_character_id bigint, p_other_id bigint, p_relationship_type smallint)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_deleted boolean := false;
begin
    if "p_relationship_type" = 0 then
        with del as (
            delete from "player"."friends"
            where "character_id" = "p_character_id" and "friend_id" = "p_other_id"
            returning 1
        )
        select exists(select 1 from del) into v_deleted;
    elsif "p_relationship_type" = 1 then
        with del as (
            delete from "player"."blocks"
            where "character_id" = "p_character_id" and "blocked_id" = "p_other_id"
            returning 1
        )
        select exists(select 1 from del) into v_deleted;
    else
        raise exception 'invalid relationship type %', "p_relationship_type";
    end if;
    return v_deleted;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.delete_relationship_by_id(p_id bigint, p_relationship_type smallint)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_deleted boolean := false;
begin
    if "p_relationship_type" = 0 then
        with del as (
            delete from "player"."friends" where "id" = "p_id"
            returning 1
        )
        select exists(select 1 from del) into v_deleted;
    elsif "p_relationship_type" = 1 then
        with del as (
            delete from "player"."blocks" where "id" = "p_id"
            returning 1
        )
        select exists(select 1 from del) into v_deleted;
    else
        raise exception 'invalid relationship type %', "p_relationship_type";
    end if;
    return v_deleted;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_name_by_id(p_character_id bigint)
 RETURNS text
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "name" from "player"."characters" where "id" = "p_character_id";
$function$
;

CREATE OR REPLACE FUNCTION player.list_guild_skill_ids(p_guild_id bigint)
 RETURNS TABLE(skill_id integer)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "skill_id"
    from "player"."guild_skills"
    where "guild_id" = "p_guild_id"
    order by "skill_id" asc;
$function$
;

CREATE OR REPLACE FUNCTION player.relationship_exists(p_character_id bigint, p_other_id bigint, p_relationship_type smallint)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_exists boolean := false;
begin
    if "p_relationship_type" = 0 then
        select exists(
            select 1 from "player"."friends"
            where "character_id" = "p_character_id" and "friend_id" = "p_other_id"
        ) into v_exists;
    elsif "p_relationship_type" = 1 then
        select exists(
            select 1 from "player"."blocks"
            where "character_id" = "p_character_id" and "blocked_id" = "p_other_id"
        ) into v_exists;
    else
        raise exception 'invalid relationship type %', "p_relationship_type";
    end if;
    return v_exists;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.update_guild_member_rank(p_guild_id bigint, p_character_id bigint, p_rank integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."guild_members"
        set "rank" = "p_rank"
        where "guild_id" = "p_guild_id" and "character_id" = "p_character_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.update_guild_warehouse_slot(p_guild_id bigint, p_slot_id bigint, p_slot_index integer, p_stack_count integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."guild_warehouse"
        set "slot_index" = "p_slot_index",
            "stack_count" = "p_stack_count"
        where "guild_id" = "p_guild_id" and "id" = "p_slot_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_guild_skill(p_guild_id bigint, p_skill_id integer)
 RETURNS void
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."guild_skills" ("guild_id", "skill_id", "level")
    values ("p_guild_id", "p_skill_id", 1)
    on conflict ("guild_id", "skill_id")
    do update set "skill_id" = excluded."skill_id";
$function$
;


