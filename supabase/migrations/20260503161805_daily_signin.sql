create table "data"."daily_signin_rewards" (
    "reward_id" integer not null,
    "inc" smallint not null,
    "item_id" integer not null,
    "quantity" integer not null,
    "weight" integer not null default 1,
    "note" text
);

create table "player"."character_daily_signins" (
    "character_id" bigint not null,
    "year" integer not null,
    "month" integer not null,
    "claimed_days_bitmap" bigint not null default 0,
    "crit_percent" integer not null default 0,
    "lucky_award_claimed" boolean not null default false,
    "consume_limit_total" bigint not null default 0,
    "last_signed_at" timestamp with time zone,
    "updated_at" timestamp with time zone not null default now()
);

create unique index daily_signin_rewards_pkey on data.daily_signin_rewards using btree (reward_id);

create unique index character_daily_signins_pkey on player.character_daily_signins using btree (character_id, year, month);

alter table "data"."daily_signin_rewards" add constraint "daily_signin_rewards_pkey" primary key using index "daily_signin_rewards_pkey";

alter table "player"."character_daily_signins" add constraint "character_daily_signins_pkey" primary key using index "character_daily_signins_pkey";

alter table "data"."daily_signin_rewards" add constraint "daily_signin_rewards_inc_check" check ((inc = any (array[1, 2, 4]))) not valid;

alter table "data"."daily_signin_rewards" validate constraint "daily_signin_rewards_inc_check";

alter table "data"."daily_signin_rewards" add constraint "daily_signin_rewards_quantity_check" check ((quantity > 0)) not valid;

alter table "data"."daily_signin_rewards" validate constraint "daily_signin_rewards_quantity_check";

alter table "data"."daily_signin_rewards" add constraint "daily_signin_rewards_weight_check" check ((weight >= 0)) not valid;

alter table "data"."daily_signin_rewards" validate constraint "daily_signin_rewards_weight_check";

alter table "player"."character_daily_signins" add constraint "character_daily_signins_crit_check" check (((crit_percent >= 0) and (crit_percent <= 100))) not valid;

alter table "player"."character_daily_signins" validate constraint "character_daily_signins_crit_check";

alter table "player"."character_daily_signins" add constraint "character_daily_signins_month_check" check (((month >= 1) and (month <= 12))) not valid;

alter table "player"."character_daily_signins" validate constraint "character_daily_signins_month_check";

set check_function_bodies = off;

create or replace function data.list_daily_signin_rewards(p_inc smallint default null::smallint)
 returns setof data.daily_signin_rewards
 language sql
 security invoker
 set search_path to ''
as $function$
    select *
    from "data"."daily_signin_rewards"
    where ("p_inc" is null or "inc" = "p_inc")
      and "weight" > 0
    order by "reward_id";
$function$;

create or replace function player.get_character_daily_signin(p_character_id bigint, p_year integer, p_month integer)
 returns player.character_daily_signins
 language plpgsql
 security invoker
 set search_path to ''
as $function$
declare
    v_row "player"."character_daily_signins";
begin
    select * into v_row
    from "player"."character_daily_signins"
    where "character_id" = "p_character_id"
      and "year"         = "p_year"
      and "month"        = "p_month";

    if not found then
        v_row.character_id        := "p_character_id";
        v_row.year                := "p_year";
        v_row.month               := "p_month";
        v_row.claimed_days_bitmap := 0;
        v_row.crit_percent        := 0;
        v_row.lucky_award_claimed := false;
        v_row.consume_limit_total := 0;
        v_row.last_signed_at      := null;
        v_row.updated_at          := now();
    end if;

    return v_row;
end;
$function$;

create type player.character_daily_signin_apply_result as (
    "row"          player.character_daily_signins,
    day_set        boolean,
    award_set      boolean,
    crit_changed   boolean
);

create or replace function player.upsert_character_daily_signin(
    p_character_id bigint,
    p_year integer,
    p_month integer,
    p_day integer,
    p_crit_delta integer default 0,
    p_consume_delta bigint default 0,
    p_set_award_claimed boolean default false
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
begin
    v_day_in_rng := "p_day" between 1 and 31;
    v_day_bit    := case when v_day_in_rng then (1::bigint << ("p_day" - 1)) else 0::bigint end;

    select * into v_pre
    from "player"."character_daily_signins"
    where "character_id" = "p_character_id" and "year" = "p_year" and "month" = "p_month"
    for update;

    insert into "player"."character_daily_signins" as t (
        "character_id", "year", "month", "claimed_days_bitmap",
        "crit_percent", "lucky_award_claimed", "consume_limit_total",
        "last_signed_at", "updated_at"
    ) values (
        "p_character_id", "p_year", "p_month", v_day_bit,
        greatest(0, least(100, "p_crit_delta")),
        "p_set_award_claimed",
        greatest(0::bigint, "p_consume_delta"),
        case when v_day_in_rng then now() else null end,
        now()
    )
    on conflict ("character_id", "year", "month") do update set
        "claimed_days_bitmap" = t."claimed_days_bitmap" | excluded."claimed_days_bitmap",
        "crit_percent"        = greatest(0, least(100, t."crit_percent" + "p_crit_delta")),
        "lucky_award_claimed" = t."lucky_award_claimed" or "p_set_award_claimed",
        "consume_limit_total" = t."consume_limit_total" + greatest(0::bigint, "p_consume_delta"),
        "last_signed_at"      = case when v_day_in_rng then now() else t."last_signed_at" end,
        "updated_at"          = now()
    returning * into v_post;

    v_result.row          := v_post;
    v_result.day_set      := v_day_in_rng and (coalesce(v_pre."claimed_days_bitmap", 0) & v_day_bit) = 0;
    v_result.award_set    := "p_set_award_claimed" and not coalesce(v_pre."lucky_award_claimed", false);
    v_result.crit_changed := v_post."crit_percent" > coalesce(v_pre."crit_percent", 0);

    return v_result;
end;
$function$;

grant select, insert, update, delete, references, trigger, truncate on table data.daily_signin_rewards to service_role;
grant select, insert, update, delete, references, trigger, truncate on table player.character_daily_signins to service_role;
