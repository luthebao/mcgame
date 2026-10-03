drop function if exists "data"."lookup_schedule_boss_by_daily_id"(p_daily_boss_id integer);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.lookup_schedule_boss_by_daily_id(p_daily_boss_id integer)
 RETURNS TABLE(nid integer, tier text)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "nid", "tier"
      from "data"."data_tbl_schedule_boss"
     where "daily_boss_id" = "p_daily_boss_id"
       and "is_active" = true
     limit 1;
$function$
;


