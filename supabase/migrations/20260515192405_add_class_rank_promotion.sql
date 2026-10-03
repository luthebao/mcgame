alter table "player"."character_progression" add column "class_rank" smallint not null default 0;

alter table "player"."character_progression" add column "quest_n" integer not null default 0;

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.get_character_class_progress(p_character_id bigint)
 RETURNS TABLE(class_rank smallint, quest_n integer)
 LANGUAGE sql
 STABLE
 SET search_path TO ''
AS $function$
  select p.class_rank, p.quest_n
  from "player"."character_progression" p
  where p.character_id = p_character_id;
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_class_progress(p_character_id bigint, p_class_rank smallint, p_quest_n integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
  update "player"."character_progression"
    set class_rank = p_class_rank,
        quest_n = p_quest_n
    where character_id = p_character_id
  returning true;
$function$
;

revoke execute on function player.get_character_class_progress(p_character_id bigint) from public, anon, authenticated;
grant execute on function player.get_character_class_progress(p_character_id bigint) to service_role;

revoke execute on function player.upsert_character_class_progress(p_character_id bigint, p_class_rank smallint, p_quest_n integer) from public, anon, authenticated;
grant execute on function player.upsert_character_class_progress(p_character_id bigint, p_class_rank smallint, p_quest_n integer) to service_role;


