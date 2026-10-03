set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.list_guild_skill_levels(p_guild_id bigint)
 RETURNS TABLE(skill_id integer, level integer)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
  select "skill_id", "level"
  from "player"."guild_skills"
  where "guild_id" = p_guild_id
  order by "skill_id";
$function$
;


