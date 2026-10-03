
  create table "public"."game_tuning" (
    "key" text not null,
    "value" jsonb not null,
    "category" text not null default 'rates'::text,
    "description" text,
    "updated_at" timestamp with time zone not null default now()
      );



  create table "public"."gateway_config" (
    "id" smallint not null,
    "name" text not null,
    "url" text not null,
    "max_clients" integer not null default 1000,
    "auction" boolean not null default false,
    "guild" boolean not null default false,
    "status" text not null default 'online'::text,
    "sort_order" smallint not null default 0,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );



  create table "public"."gm_settings" (
    "key" text not null,
    "value" jsonb not null,
    "description" text,
    "updated_at" timestamp with time zone not null default now()
      );



  create table "public"."server_settings" (
    "key" text not null,
    "value" jsonb not null,
    "description" text,
    "updated_at" timestamp with time zone not null default now()
      );


CREATE UNIQUE INDEX game_tuning_pkey ON public.game_tuning USING btree (key);

CREATE UNIQUE INDEX gateway_config_pkey ON public.gateway_config USING btree (id);

CREATE UNIQUE INDEX gm_settings_pkey ON public.gm_settings USING btree (key);

CREATE UNIQUE INDEX server_settings_pkey ON public.server_settings USING btree (key);

alter table "public"."game_tuning" add constraint "game_tuning_pkey" PRIMARY KEY using index "game_tuning_pkey";

alter table "public"."gateway_config" add constraint "gateway_config_pkey" PRIMARY KEY using index "gateway_config_pkey";

alter table "public"."gm_settings" add constraint "gm_settings_pkey" PRIMARY KEY using index "gm_settings_pkey";

alter table "public"."server_settings" add constraint "server_settings_pkey" PRIMARY KEY using index "server_settings_pkey";

alter table "public"."game_tuning" add constraint "game_tuning_category_check" CHECK ((category = ANY (ARRAY['rates'::text, 'events'::text, 'features'::text]))) not valid;

alter table "public"."game_tuning" validate constraint "game_tuning_category_check";

alter table "public"."gateway_config" add constraint "gateway_config_status_check" CHECK ((status = ANY (ARRAY['online'::text, 'offline'::text, 'maintenance'::text]))) not valid;

alter table "public"."gateway_config" validate constraint "gateway_config_status_check";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.delete_gateway_config(p_id smallint)
 RETURNS boolean
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    with upd as (
        delete from "public"."gateway_config"
        where "id" = "p_id"
        returning 1
    )
    select exists(select 1 from upd);
$function$
;

CREATE OR REPLACE FUNCTION public.delete_kv_setting(p_table text, p_key text)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_regclass regclass;
    v_deleted boolean;
begin
    if p_table not in ('server_settings','game_tuning','gm_settings') then
        raise exception 'invalid config table: %', p_table using errcode = '22023';
    end if;
    v_regclass := ('public.' || p_table)::regclass;
    execute format(
        'with upd as (delete from %s where key = $1 returning 1) select exists(select 1 from upd)',
        v_regclass
    ) using p_key into v_deleted;
    return coalesce(v_deleted, false);
end;
$function$
;

CREATE OR REPLACE FUNCTION public.list_game_tuning()
 RETURNS SETOF public.game_tuning
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select * from "public"."game_tuning" order by "category", "key";
$function$
;

CREATE OR REPLACE FUNCTION public.list_gateway_config()
 RETURNS SETOF public.gateway_config
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select * from "public"."gateway_config"
    order by "sort_order" asc, "id" asc;
$function$
;

CREATE OR REPLACE FUNCTION public.list_gm_settings()
 RETURNS SETOF public.gm_settings
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select * from "public"."gm_settings" order by "key";
$function$
;

CREATE OR REPLACE FUNCTION public.list_server_settings()
 RETURNS SETOF public.server_settings
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    select * from "public"."server_settings" order by "key";
$function$
;

CREATE OR REPLACE FUNCTION public.notify_config_change()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_row jsonb;
    v_key text;
begin
    v_row := case tg_op when 'DELETE' then to_jsonb(old) else to_jsonb(new) end;
    v_key := coalesce(v_row ->> 'key', v_row ->> 'id', '');
    perform pg_notify(
        'config_change',
        json_build_object(
            'table', tg_table_name,
            'key', v_key,
            'op', tg_op
        )::text
    );
    return null;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.set_kv_setting(p_table text, p_key text, p_value jsonb, p_description text DEFAULT NULL::text, p_category text DEFAULT NULL::text)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
declare
    v_regclass regclass;
begin
    if p_table not in ('server_settings','game_tuning','gm_settings') then
        raise exception 'invalid config table: %', p_table using errcode = '22023';
    end if;
    v_regclass := ('public.' || p_table)::regclass;

    if p_table = 'game_tuning' then
        execute format(
            'insert into %s (key, value, category, description) values ($1, $2, coalesce($3, ''rates''), $4)
             on conflict (key) do update set value = excluded.value, category = excluded.category, description = coalesce(excluded.description, %s.description)',
            v_regclass, v_regclass
        ) using p_key, p_value, p_category, p_description;
    else
        execute format(
            'insert into %s (key, value, description) values ($1, $2, $3)
             on conflict (key) do update set value = excluded.value, description = coalesce(excluded.description, %s.description)',
            v_regclass, v_regclass
        ) using p_key, p_value, p_description;
    end if;

    return true;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.touch_updated_at()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
begin
    new."updated_at" := now();
    return new;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.upsert_gateway_config(p_id smallint, p_name text, p_url text, p_max_clients integer, p_auction boolean, p_guild boolean, p_status text, p_sort_order smallint)
 RETURNS public.gateway_config
 LANGUAGE sql
 SET search_path TO ''
AS $function$
    insert into "public"."gateway_config" (
        "id","name","url","max_clients","auction","guild","status","sort_order"
    )
    values (
        "p_id","p_name","p_url","p_max_clients","p_auction","p_guild","p_status","p_sort_order"
    )
    on conflict ("id") do update
    set "name" = excluded."name",
        "url" = excluded."url",
        "max_clients" = excluded."max_clients",
        "auction" = excluded."auction",
        "guild" = excluded."guild",
        "status" = excluded."status",
        "sort_order" = excluded."sort_order"
    returning *;
$function$
;

grant delete on table "public"."game_tuning" to "anon";

grant insert on table "public"."game_tuning" to "anon";

grant references on table "public"."game_tuning" to "anon";

grant select on table "public"."game_tuning" to "anon";

grant trigger on table "public"."game_tuning" to "anon";

grant truncate on table "public"."game_tuning" to "anon";

grant update on table "public"."game_tuning" to "anon";

grant delete on table "public"."game_tuning" to "authenticated";

grant insert on table "public"."game_tuning" to "authenticated";

grant references on table "public"."game_tuning" to "authenticated";

grant select on table "public"."game_tuning" to "authenticated";

grant trigger on table "public"."game_tuning" to "authenticated";

grant truncate on table "public"."game_tuning" to "authenticated";

grant update on table "public"."game_tuning" to "authenticated";

grant delete on table "public"."game_tuning" to "service_role";

grant insert on table "public"."game_tuning" to "service_role";

grant references on table "public"."game_tuning" to "service_role";

grant select on table "public"."game_tuning" to "service_role";

grant trigger on table "public"."game_tuning" to "service_role";

grant truncate on table "public"."game_tuning" to "service_role";

grant update on table "public"."game_tuning" to "service_role";

grant delete on table "public"."gateway_config" to "anon";

grant insert on table "public"."gateway_config" to "anon";

grant references on table "public"."gateway_config" to "anon";

grant select on table "public"."gateway_config" to "anon";

grant trigger on table "public"."gateway_config" to "anon";

grant truncate on table "public"."gateway_config" to "anon";

grant update on table "public"."gateway_config" to "anon";

grant delete on table "public"."gateway_config" to "authenticated";

grant insert on table "public"."gateway_config" to "authenticated";

grant references on table "public"."gateway_config" to "authenticated";

grant select on table "public"."gateway_config" to "authenticated";

grant trigger on table "public"."gateway_config" to "authenticated";

grant truncate on table "public"."gateway_config" to "authenticated";

grant update on table "public"."gateway_config" to "authenticated";

grant delete on table "public"."gateway_config" to "service_role";

grant insert on table "public"."gateway_config" to "service_role";

grant references on table "public"."gateway_config" to "service_role";

grant select on table "public"."gateway_config" to "service_role";

grant trigger on table "public"."gateway_config" to "service_role";

grant truncate on table "public"."gateway_config" to "service_role";

grant update on table "public"."gateway_config" to "service_role";

grant delete on table "public"."gm_settings" to "anon";

grant insert on table "public"."gm_settings" to "anon";

grant references on table "public"."gm_settings" to "anon";

grant select on table "public"."gm_settings" to "anon";

grant trigger on table "public"."gm_settings" to "anon";

grant truncate on table "public"."gm_settings" to "anon";

grant update on table "public"."gm_settings" to "anon";

grant delete on table "public"."gm_settings" to "authenticated";

grant insert on table "public"."gm_settings" to "authenticated";

grant references on table "public"."gm_settings" to "authenticated";

grant select on table "public"."gm_settings" to "authenticated";

grant trigger on table "public"."gm_settings" to "authenticated";

grant truncate on table "public"."gm_settings" to "authenticated";

grant update on table "public"."gm_settings" to "authenticated";

grant delete on table "public"."gm_settings" to "service_role";

grant insert on table "public"."gm_settings" to "service_role";

grant references on table "public"."gm_settings" to "service_role";

grant select on table "public"."gm_settings" to "service_role";

grant trigger on table "public"."gm_settings" to "service_role";

grant truncate on table "public"."gm_settings" to "service_role";

grant update on table "public"."gm_settings" to "service_role";

grant delete on table "public"."server_settings" to "anon";

grant insert on table "public"."server_settings" to "anon";

grant references on table "public"."server_settings" to "anon";

grant select on table "public"."server_settings" to "anon";

grant trigger on table "public"."server_settings" to "anon";

grant truncate on table "public"."server_settings" to "anon";

grant update on table "public"."server_settings" to "anon";

grant delete on table "public"."server_settings" to "authenticated";

grant insert on table "public"."server_settings" to "authenticated";

grant references on table "public"."server_settings" to "authenticated";

grant select on table "public"."server_settings" to "authenticated";

grant trigger on table "public"."server_settings" to "authenticated";

grant truncate on table "public"."server_settings" to "authenticated";

grant update on table "public"."server_settings" to "authenticated";

grant delete on table "public"."server_settings" to "service_role";

grant insert on table "public"."server_settings" to "service_role";

grant references on table "public"."server_settings" to "service_role";

grant select on table "public"."server_settings" to "service_role";

grant trigger on table "public"."server_settings" to "service_role";

grant truncate on table "public"."server_settings" to "service_role";

grant update on table "public"."server_settings" to "service_role";

CREATE TRIGGER trg_game_tuning_notify AFTER INSERT OR DELETE OR UPDATE ON public.game_tuning FOR EACH ROW EXECUTE FUNCTION public.notify_config_change();

CREATE TRIGGER trg_game_tuning_touch BEFORE UPDATE ON public.game_tuning FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();

CREATE TRIGGER trg_gateway_config_notify AFTER INSERT OR DELETE OR UPDATE ON public.gateway_config FOR EACH ROW EXECUTE FUNCTION public.notify_config_change();

CREATE TRIGGER trg_gateway_config_touch BEFORE UPDATE ON public.gateway_config FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();

CREATE TRIGGER trg_gm_settings_notify AFTER INSERT OR DELETE OR UPDATE ON public.gm_settings FOR EACH ROW EXECUTE FUNCTION public.notify_config_change();

CREATE TRIGGER trg_gm_settings_touch BEFORE UPDATE ON public.gm_settings FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();

CREATE TRIGGER trg_server_settings_notify AFTER INSERT OR DELETE OR UPDATE ON public.server_settings FOR EACH ROW EXECUTE FUNCTION public.notify_config_change();

CREATE TRIGGER trg_server_settings_touch BEFORE UPDATE ON public.server_settings FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();


