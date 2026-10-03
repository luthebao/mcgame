-- Update DB functions that referenced columns moved out of player.characters.

CREATE OR REPLACE FUNCTION player.get_character_progression(p_character_id bigint)
RETURNS TABLE (
    character_id bigint,
    awaken_level integer,
    awaken_points integer,
    awaken_points_used integer,
    soul_level integer,
    soul_exp bigint,
    soul_points bigint
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        c.id,
        p.awaken_level,
        p.awaken_points,
        p.awaken_points_used,
        p.soul_level,
        p.soul_exp,
        p.soul_points
    FROM player.characters AS c
    INNER JOIN player.character_progression AS p ON p.character_id = c.id
    WHERE c.id = p_character_id;
$$;

CREATE OR REPLACE FUNCTION player.get_character_social_info(p_character_id bigint)
RETURNS TABLE (
    level integer,
    class_id integer
)
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT
        p.level,
        c.class_id
    FROM player.characters AS c
    INNER JOIN player.character_progression AS p ON p.character_id = c.id
    WHERE c.id = p_character_id;
$$;
