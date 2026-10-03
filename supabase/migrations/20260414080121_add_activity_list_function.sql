set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.list_activity_configs()
 RETURNS TABLE(id integer, name text, style_name text, panel_key text, feature_key text, sort_type integer, enable integer, type integer, flag integer, note text)
 LANGUAGE sql
 STABLE
AS $function$
    select
        activity.id,
        coalesce(activity.name, ''),
        coalesce(activity.style_name, ''),
        coalesce(activity.panel_key, ''),
        coalesce(activity.feature_key, ''),
        activity.sort_type,
        activity.enable,
        activity.type,
        activity.flag,
        coalesce(activity.note, '')
    from data.data_tbl_activity as activity
    order by activity.sort_type asc, activity.id asc;
$function$
;


