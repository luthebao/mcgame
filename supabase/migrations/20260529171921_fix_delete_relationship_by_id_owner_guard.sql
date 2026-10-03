set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.delete_relationship_by_id(p_id bigint, p_character_id bigint, p_relationship_type smallint)
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
            where "id" = "p_id" and "character_id" = "p_character_id"
            returning 1
        )
        select exists(select 1 from del) into v_deleted;
    elsif "p_relationship_type" = 1 then
        with del as (
            delete from "player"."blocks"
            where "id" = "p_id" and "character_id" = "p_character_id"
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


