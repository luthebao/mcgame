
  create table "data"."daily_act_award_rewards" (
    "tier" smallint not null,
    "threshold" integer not null,
    "item_id" integer not null,
    "quantity" integer not null default 1,
    "bound" boolean not null default true,
    "icon_giid" integer not null,
    "note" text
      );


alter table "data"."daily_act_award_rewards" enable row level security;


  create table "player"."character_daily_act" (
    "character_id" bigint not null,
    "day" date not null,
    "vitality_points" integer not null default 0,
    "award_claimed" boolean not null default false,
    "awarded_tier" smallint,
    "awarded_at" timestamp with time zone,
    "task_counts" jsonb not null default '{}'::jsonb,
    "first_login_at" timestamp with time zone,
    "online_seconds_offline" integer not null default 0,
    "updated_at" timestamp with time zone not null default now()
      );


alter table "player"."character_daily_act" enable row level security;

CREATE UNIQUE INDEX daily_act_award_rewards_pkey ON data.daily_act_award_rewards USING btree (tier);

CREATE INDEX character_daily_act_character_id_idx ON player.character_daily_act USING btree (character_id);

CREATE UNIQUE INDEX character_daily_act_pkey ON player.character_daily_act USING btree (character_id, day);

alter table "data"."daily_act_award_rewards" add constraint "daily_act_award_rewards_pkey" PRIMARY KEY using index "daily_act_award_rewards_pkey";

alter table "player"."character_daily_act" add constraint "character_daily_act_pkey" PRIMARY KEY using index "character_daily_act_pkey";

alter table "data"."daily_act_award_rewards" add constraint "daily_act_award_rewards_threshold_positive" CHECK ((threshold > 0)) not valid;

alter table "data"."daily_act_award_rewards" validate constraint "daily_act_award_rewards_threshold_positive";

alter table "data"."daily_act_award_rewards" add constraint "daily_act_award_rewards_tier_range" CHECK (((tier >= 0) AND (tier <= 4))) not valid;

alter table "data"."daily_act_award_rewards" validate constraint "daily_act_award_rewards_tier_range";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION data.list_daily_act_award_rewards()
 RETURNS TABLE(tier smallint, threshold integer, item_id integer, quantity integer, bound boolean, icon_giid integer, note text)
 LANGUAGE sql
 STABLE
AS $function$
    select tier, threshold, item_id, quantity, bound, icon_giid, note
    from data.daily_act_award_rewards
    order by tier;
$function$
;

DROP FUNCTION IF EXISTS player.claim_character_daily_act_award(bigint, date, smallint, integer);

CREATE OR REPLACE FUNCTION player.claim_character_daily_act_award(p_character_id bigint, p_day date, p_tier smallint)
 RETURNS TABLE(success boolean, vitality_points integer)
 LANGUAGE plpgsql
AS $function$
declare
    v_existing player.character_daily_act%rowtype;
    v_required integer;
begin
    select threshold into v_required
    from data.daily_act_award_rewards
    where tier = p_tier;

    if v_required is null then
        return query select false, 0;
        return;
    end if;

    select * into v_existing
    from player.character_daily_act
    where character_id = p_character_id and day = p_day
    for update;

    if not found or v_existing.award_claimed then
        return query select false, coalesce(v_existing.vitality_points, 0);
        return;
    end if;

    if v_existing.vitality_points < v_required then
        return query select false, v_existing.vitality_points;
        return;
    end if;

    update player.character_daily_act
    set award_claimed = true,
        awarded_tier = p_tier,
        awarded_at = now(),
        updated_at = now()
    where character_id = p_character_id and day = p_day;

    return query select true, v_existing.vitality_points;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.get_character_daily_act(p_character_id bigint, p_day date)
 RETURNS TABLE(character_id bigint, day date, vitality_points integer, award_claimed boolean, awarded_tier smallint, awarded_at timestamp with time zone, task_counts jsonb, first_login_at timestamp with time zone, online_seconds_offline integer, updated_at timestamp with time zone)
 LANGUAGE sql
 STABLE
AS $function$
    select
        coalesce(r.character_id, p_character_id),
        coalesce(r.day, p_day),
        coalesce(r.vitality_points, 0),
        coalesce(r.award_claimed, false),
        r.awarded_tier,
        r.awarded_at,
        coalesce(r.task_counts, '{}'::jsonb),
        r.first_login_at,
        coalesce(r.online_seconds_offline, 0),
        coalesce(r.updated_at, now())
    from (select 1) base
    left join player.character_daily_act r
        on r.character_id = p_character_id and r.day = p_day;
$function$
;

CREATE OR REPLACE FUNCTION player.increment_character_daily_act_task(p_character_id bigint, p_day date, p_task_id text, p_count_delta integer, p_act_delta integer)
 RETURNS TABLE(new_count integer, vitality_points integer, award_claimed boolean)
 LANGUAGE plpgsql
AS $function$
declare
    v_existing player.character_daily_act%rowtype;
    v_current integer;
    v_new_count integer;
    v_new_act integer;
begin
    select * into v_existing
    from player.character_daily_act
    where character_id = p_character_id and day = p_day
    for update;

    if not found then
        insert into player.character_daily_act (character_id, day, task_counts, vitality_points, updated_at)
        values (
            p_character_id,
            p_day,
            jsonb_build_object(p_task_id, p_count_delta),
            greatest(0, p_act_delta),
            now()
        );
        return query select p_count_delta::int, greatest(0, p_act_delta)::int, false;
        return;
    end if;

    v_current := coalesce((v_existing.task_counts ->> p_task_id)::int, 0);
    v_new_count := v_current + p_count_delta;
    v_new_act := greatest(0, v_existing.vitality_points + p_act_delta);

    update player.character_daily_act
    set task_counts = v_existing.task_counts || jsonb_build_object(p_task_id, v_new_count),
        vitality_points = v_new_act,
        updated_at = now()
    where character_id = p_character_id and day = p_day;

    return query select v_new_count, v_new_act, v_existing.award_claimed;
end;
$function$
;

CREATE OR REPLACE FUNCTION player.touch_character_daily_act_login(p_character_id bigint, p_day date, p_now timestamp with time zone)
 RETURNS TABLE(is_first_today boolean, first_login_at timestamp with time zone)
 LANGUAGE plpgsql
AS $function$
declare
    v_existing player.character_daily_act%rowtype;
begin
    select * into v_existing
    from player.character_daily_act
    where character_id = p_character_id and day = p_day
    for update;

    if not found then
        insert into player.character_daily_act (character_id, day, first_login_at, updated_at)
        values (p_character_id, p_day, p_now, p_now);
        return query select true, p_now;
        return;
    end if;

    if v_existing.first_login_at is null then
        update player.character_daily_act
        set first_login_at = p_now,
            updated_at = p_now
        where character_id = p_character_id and day = p_day;
        return query select true, p_now;
        return;
    end if;

    return query select false, v_existing.first_login_at;
end;
$function$
;


  create policy "daily_act_award_rewards_service_role"
  on "data"."daily_act_award_rewards"
  as permissive
  for all
  to service_role
using (true)
with check (true);



  create policy "character_daily_act_service_role"
  on "player"."character_daily_act"
  as permissive
  for all
  to service_role
using (true)
with check (true);

CREATE OR REPLACE FUNCTION player.revert_character_daily_act_award(p_character_id bigint, p_day date, p_tier smallint)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
    v_existing player.character_daily_act%rowtype;
begin
    select * into v_existing
    from player.character_daily_act
    where character_id = p_character_id and day = p_day
    for update;

    if not found or not v_existing.award_claimed or v_existing.awarded_tier is distinct from p_tier then
        return false;
    end if;

    update player.character_daily_act
    set award_claimed = false,
        awarded_tier = null,
        awarded_at = null,
        updated_at = now()
    where character_id = p_character_id and day = p_day;

    return true;
end;
$function$
;

revoke all on function player.get_character_daily_act(bigint, date) from public;
revoke all on function player.touch_character_daily_act_login(bigint, date, timestamptz) from public;
revoke all on function player.increment_character_daily_act_task(bigint, date, text, integer, integer) from public;
revoke all on function player.claim_character_daily_act_award(bigint, date, smallint) from public;
revoke all on function data.list_daily_act_award_rewards() from public;
revoke all on function player.revert_character_daily_act_award(bigint, date, smallint) from public;

grant execute on function player.get_character_daily_act(bigint, date) to service_role;
grant execute on function player.touch_character_daily_act_login(bigint, date, timestamptz) to service_role;
grant execute on function player.increment_character_daily_act_task(bigint, date, text, integer, integer) to service_role;
grant execute on function player.claim_character_daily_act_award(bigint, date, smallint) to service_role;
grant execute on function data.list_daily_act_award_rewards() to service_role;
grant execute on function player.revert_character_daily_act_award(bigint, date, smallint) to service_role;
