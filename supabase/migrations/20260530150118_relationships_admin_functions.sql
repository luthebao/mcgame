set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.change_relationship_type(p_id bigint, p_type smallint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."friends" set type = p_type
        where id = p_id and p_type in (0, 2, 3, 4, 5)
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.create_typed_relationship(p_character_id bigint, p_other_id bigint, p_type smallint, p_group_id integer, p_nickname text, p_intimacy integer)
 RETURNS TABLE(id bigint, created_at timestamp with time zone)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "player"."friends"(character_id, friend_id, type, group_id, nickname, intimacy)
    values (p_character_id, p_other_id, p_type, p_group_id, p_nickname, p_intimacy)
    on conflict (character_id, friend_id) do update set
        type = excluded.type,
        group_id = excluded.group_id,
        nickname = excluded.nickname,
        intimacy = excluded.intimacy
    returning "player"."friends".id, "player"."friends".created_at;
$function$
;

CREATE OR REPLACE FUNCTION player.delete_relationship_by_id_any(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with df as (
        delete from "player"."friends" where id = p_id returning 1
    ), db as (
        delete from "player"."blocks" where id = p_id returning 1
    )
    select exists(select 1 from df) or exists(select 1 from db);
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_relationships(p_character_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, type smallint, group_id integer, nickname text, intimacy integer, created_at timestamp with time zone)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select
        f.id,
        f.character_id,
        f.friend_id as other_id,
        c.name::text as other_name,
        f.type,
        f.group_id,
        f.nickname::text as nickname,
        f.intimacy,
        f.created_at
    from "player"."friends" as f
    join "player"."characters" as c on c.id = f.friend_id
    where f.character_id = p_character_id
    union all
    select
        b.id,
        b.character_id,
        b.blocked_id as other_id,
        c.name::text as other_name,
        1::smallint as type,
        null::int as group_id,
        b.reason::text as nickname,
        null::int as intimacy,
        b.created_at
    from "player"."blocks" as b
    join "player"."characters" as c on c.id = b.blocked_id
    where b.character_id = p_character_id;
$function$
;

CREATE OR REPLACE FUNCTION player.update_relationship_group(p_id bigint, p_group_id integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."friends" set group_id = p_group_id where id = p_id returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.update_relationship_intimacy(p_id bigint, p_intimacy integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."friends" set intimacy = p_intimacy where id = p_id returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION player.update_relationship_nickname(p_id bigint, p_nickname text)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."friends" set nickname = p_nickname where id = p_id returning 1
    )
    select exists(select 1 from upd);
$function$
;


