set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.get_ppve_rank(p_char_id bigint, p_limit integer)
 RETURNS jsonb
 LANGUAGE sql
 STABLE
 SET search_path TO ''
AS $function$
  WITH ranked AS (
    SELECT
      csf.character_id,
      c.name,
      c.class_id,
      coalesce(cp.level, 0) AS level,
      (csf.state->>'ppvefloor')::int AS floor_num,
      row_number() OVER (
        ORDER BY (csf.state->>'ppvefloor')::int DESC, csf.character_id ASC
      ) - 1 AS rk
    FROM "player"."character_stat_features" csf
    JOIN "player"."characters" c ON c.id = csf.character_id
    LEFT JOIN "player"."character_progression" cp ON cp.character_id = csf.character_id
    WHERE csf.feature_key = 'pet_pve'
      AND coalesce((csf.state->>'ppvefloor')::int, 0) > 0
  )
  SELECT jsonb_build_object(
    'rank', coalesce((
      SELECT jsonb_agg(
        jsonb_build_object(
          'cid', r.character_id::text,
          'name', r.name,
          'classId', r.class_id::text,
          'level', r.level,
          'floorNum', r.floor_num
        ) ORDER BY r.rk
      )
      FROM ranked r
      WHERE r.rk < p_limit
    ), '[]'::jsonb),
    'myRank', coalesce((SELECT rk FROM ranked WHERE character_id = p_char_id), -1)
  );
$function$
;

REVOKE EXECUTE ON FUNCTION player.get_ppve_rank(bigint, integer) FROM public, anon, authenticated;
GRANT  EXECUTE ON FUNCTION player.get_ppve_rank(bigint, integer) TO service_role;


