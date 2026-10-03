create table if not exists data.daily_signin_lucky_tiers (
    year             smallint not null,
    month            smallint not null,
    week_index       smallint not null,
    point_threshold  bigint   not null default 0,
    gold_amount      bigint   not null default 0,
    note             text,
    primary key (year, month, week_index),
    constraint daily_signin_lucky_tiers_month_check    check (month between 1 and 12),
    constraint daily_signin_lucky_tiers_week_check     check (week_index between 1 and 5),
    constraint daily_signin_lucky_tiers_threshold_chk  check (point_threshold >= 0),
    constraint daily_signin_lucky_tiers_gold_chk       check (gold_amount >= 0)
);

create or replace function data.list_daily_signin_lucky_tiers(
    p_year smallint,
    p_month smallint
) returns setof data.daily_signin_lucky_tiers
language sql
stable
security invoker
set search_path to ''
as $$
    select *
    from "data"."daily_signin_lucky_tiers"
    where "year"  = "p_year"
      and "month" = "p_month"
    order by "week_index";
$$;

create or replace function data.get_daily_signin_lucky_tier(
    p_year smallint,
    p_month smallint,
    p_week_index smallint
) returns data.daily_signin_lucky_tiers
language plpgsql
stable
security invoker
set search_path to ''
as $$
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
$$;

grant select, insert, update, delete, references, trigger, truncate on table data.daily_signin_lucky_tiers to service_role;
