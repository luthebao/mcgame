set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.delete_character_farm_plot(p_character_id bigint, p_plot_npc_id integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."character_farm_plots"
        where "character_id" = "p_character_id" and "plot_npc_id" = "p_plot_npc_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_expired_scene_items(p_now timestamp with time zone)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."scene_items"
        where "expires_at" is not null and "expires_at" <= "p_now"
        returning 1
    )
    select count(*) from del;
$function$
;

CREATE OR REPLACE FUNCTION player.delete_npc(p_id integer)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."npcs" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_scene_item(p_id bigint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."scene_items" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from del);
$function$
;

CREATE OR REPLACE FUNCTION player.delete_scene_items_by_map(p_map_id integer)
 RETURNS bigint
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with del as (
        delete from "player"."scene_items"
        where "map_id" = "p_map_id" and "is_static" = false
        returning 1
    )
    select count(*) from del;
$function$
;

CREATE OR REPLACE FUNCTION player.set_npc_active(p_id integer, p_active boolean)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "player"."npcs" set "is_active" = "p_active" where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION public.account_exists_by_username(p_username text)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select exists(select 1 from "public"."accounts" where "username" = "p_username");
$function$
;

CREATE OR REPLACE FUNCTION public.update_account_last_login(p_id uuid, p_last_login timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        update "public"."accounts"
        set "last_login" = "p_last_login"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;


