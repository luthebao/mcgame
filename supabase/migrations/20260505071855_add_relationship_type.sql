alter table "player"."friends" add column "type" smallint not null default 0;

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.get_friend_relationships(p_character_id bigint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, group_id integer, nickname text, intimacy integer, created_at timestamp with time zone)
 LANGUAGE sql
 STABLE
 SET search_path TO ''
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
    where f.character_id = p_character_id and f.type = 0
    order by f.created_at desc;
$function$
;

CREATE OR REPLACE FUNCTION player.get_typed_relationships(p_character_id bigint, p_type smallint)
 RETURNS TABLE(id bigint, character_id bigint, other_id bigint, other_name text, group_id integer, nickname text, intimacy integer, created_at timestamp with time zone)
 LANGUAGE sql
 STABLE
 SET search_path TO ''
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
    where f.character_id = p_character_id and f.type = p_type
    order by f.created_at desc;
$function$
;


