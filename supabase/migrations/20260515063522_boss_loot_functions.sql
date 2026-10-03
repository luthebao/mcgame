set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.list_active_boss_loot()
 RETURNS TABLE(id bigint, boss_nid integer, item_id integer, quality integer, rate integer, qty_min integer, qty_max integer, bound boolean, type integer, tier_filter text, source_filter text, qid integer)
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "id",
           "boss_nid",
           "item_id",
           "quality",
           "rate",
           "qty_min",
           "qty_max",
           "bound",
           "type",
           "tier_filter",
           "source_filter",
           "qid"
      from "data"."data_tbl_boss_loot"
     where "is_active" = true;
$function$
;

CREATE OR REPLACE FUNCTION data.lookup_schedule_boss_by_daily_id(p_daily_boss_id integer)
 RETURNS integer
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select "nid"
      from "data"."data_tbl_schedule_boss"
     where "daily_boss_id" = "p_daily_boss_id"
       and "is_active" = true
     limit 1;
$function$
;


