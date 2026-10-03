drop function if exists player.upsert_character_daily_signin(
    bigint, integer, integer, integer, integer, bigint, boolean
);

create or replace function player.upsert_character_daily_signin(
    p_character_id      bigint,
    p_year              integer,
    p_month             integer,
    p_day               integer,
    p_crit_delta        integer  default 0,
    p_consume_delta     bigint   default 0,
    p_set_award_claimed boolean  default false,
    p_reset_crit        boolean  default false
)
 returns player.character_daily_signin_apply_result
 language plpgsql
 security invoker
 set search_path to ''
as $function$
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
$function$;
