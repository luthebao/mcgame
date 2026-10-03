
  create table "data"."daily_signin_lucky_tiers" (
    "year" smallint not null,
    "month" smallint not null,
    "week_index" smallint not null,
    "point_threshold" bigint not null default 0,
    "gold_amount" bigint not null default 0,
    "note" text
      );


CREATE UNIQUE INDEX daily_signin_lucky_tiers_pkey ON data.daily_signin_lucky_tiers USING btree (year, month, week_index);

alter table "data"."daily_signin_lucky_tiers" add constraint "daily_signin_lucky_tiers_pkey" PRIMARY KEY using index "daily_signin_lucky_tiers_pkey";

alter table "data"."daily_signin_lucky_tiers" add constraint "daily_signin_lucky_tiers_gold_chk" CHECK ((gold_amount >= 0)) not valid;

alter table "data"."daily_signin_lucky_tiers" validate constraint "daily_signin_lucky_tiers_gold_chk";

alter table "data"."daily_signin_lucky_tiers" add constraint "daily_signin_lucky_tiers_month_check" CHECK (((month >= 1) AND (month <= 12))) not valid;

alter table "data"."daily_signin_lucky_tiers" validate constraint "daily_signin_lucky_tiers_month_check";

alter table "data"."daily_signin_lucky_tiers" add constraint "daily_signin_lucky_tiers_threshold_chk" CHECK ((point_threshold >= 0)) not valid;

alter table "data"."daily_signin_lucky_tiers" validate constraint "daily_signin_lucky_tiers_threshold_chk";

alter table "data"."daily_signin_lucky_tiers" add constraint "daily_signin_lucky_tiers_week_check" CHECK (((week_index >= 1) AND (week_index <= 5))) not valid;

alter table "data"."daily_signin_lucky_tiers" validate constraint "daily_signin_lucky_tiers_week_check";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.get_daily_signin_lucky_tier(p_year smallint, p_month smallint, p_week_index smallint)
 RETURNS data.daily_signin_lucky_tiers
 LANGUAGE plpgsql
 STABLE
 SET search_path TO ''
AS $function$
declare
    v_row "data"."daily_signin_lucky_tiers";
begin
    select * into v_row
    from "data"."daily_signin_lucky_tiers"
    where "year"       = "p_year"
      and "month"      = "p_month"
      and "week_index" = "p_week_index";

    if not found then
        v_row.year            := "p_year";
        v_row.month           := "p_month";
        v_row.week_index      := "p_week_index";
        v_row.point_threshold := 0;
        v_row.gold_amount     := 0;
        v_row.note            := null;
    end if;

    return v_row;
end;
$function$
;

CREATE OR REPLACE FUNCTION data.list_daily_signin_lucky_tiers(p_year smallint, p_month smallint)
 RETURNS SETOF data.daily_signin_lucky_tiers
 LANGUAGE sql
 STABLE
 SET search_path TO ''
AS $function$
    select *
    from "data"."daily_signin_lucky_tiers"
    where "year"  = "p_year"
      and "month" = "p_month"
    order by "week_index";
$function$
;

CREATE OR REPLACE FUNCTION player.upsert_character_daily_signin(p_character_id bigint, p_year integer, p_month integer, p_day integer, p_crit_delta integer DEFAULT 0, p_consume_delta bigint DEFAULT 0, p_set_award_claimed boolean DEFAULT false, p_reset_crit boolean DEFAULT false)
 RETURNS player.character_daily_signin_apply_result
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_pre        "player"."character_daily_signins";
    v_post       "player"."character_daily_signins";
    v_result     "player"."character_daily_signin_apply_result";
    v_day_bit    bigint;
    v_day_in_rng boolean;
    v_init_crit  integer;
begin
    v_day_in_rng := "p_day" between 1 and 31;
    v_day_bit    := case when v_day_in_rng then (1::bigint << ("p_day" - 1)) else 0::bigint end;

    select * into v_pre
    from "player"."character_daily_signins"
    where "character_id" = "p_character_id" and "year" = "p_year" and "month" = "p_month"
    for update;

    v_init_crit := case
        when "p_reset_crit" then 0
        else greatest(0, least(100, "p_crit_delta"))
    end;

    insert into "player"."character_daily_signins" as t (
        "character_id", "year", "month", "claimed_days_bitmap",
        "crit_percent", "lucky_award_claimed", "consume_limit_total",
        "last_signed_at", "updated_at"
    ) values (
        "p_character_id", "p_year", "p_month", v_day_bit,
        v_init_crit,
        "p_set_award_claimed",
        greatest(0::bigint, "p_consume_delta"),
        case when v_day_in_rng then now() else null end,
        now()
    )
    on conflict ("character_id", "year", "month") do update set
        "claimed_days_bitmap" = t."claimed_days_bitmap" | excluded."claimed_days_bitmap",
        "crit_percent"        = case
            when "p_reset_crit" then 0
            else greatest(0, least(100, t."crit_percent" + "p_crit_delta"))
        end,
        "lucky_award_claimed" = t."lucky_award_claimed" or "p_set_award_claimed",
        "consume_limit_total" = t."consume_limit_total" + greatest(0::bigint, "p_consume_delta"),
        "last_signed_at"      = case when v_day_in_rng then now() else t."last_signed_at" end,
        "updated_at"          = now()
    returning * into v_post;

    v_result.row          := v_post;
    v_result.day_set      := v_day_in_rng and (coalesce(v_pre."claimed_days_bitmap", 0) & v_day_bit) = 0;
    v_result.award_set    := "p_set_award_claimed" and not coalesce(v_pre."lucky_award_claimed", false);
    v_result.crit_changed := v_post."crit_percent" <> coalesce(v_pre."crit_percent", 0);

    return v_result;
end;
$function$
;

grant delete on table "data"."daily_signin_lucky_tiers" to "service_role";

grant insert on table "data"."daily_signin_lucky_tiers" to "service_role";

grant references on table "data"."daily_signin_lucky_tiers" to "service_role";

grant select on table "data"."daily_signin_lucky_tiers" to "service_role";

grant trigger on table "data"."daily_signin_lucky_tiers" to "service_role";

grant truncate on table "data"."daily_signin_lucky_tiers" to "service_role";

grant update on table "data"."daily_signin_lucky_tiers" to "service_role";


