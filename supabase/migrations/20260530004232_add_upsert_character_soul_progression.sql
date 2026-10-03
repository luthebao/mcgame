set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.upsert_character_soul_progression(p_character_id bigint, p_soul_level integer, p_soul_exp bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    WITH upd AS (
        UPDATE "player"."character_progression"
        SET
            soul_level = p_soul_level,
            soul_exp   = p_soul_exp
        WHERE character_id = p_character_id
        RETURNING 1
    )
    SELECT EXISTS (SELECT 1 FROM upd);
$function$
;


