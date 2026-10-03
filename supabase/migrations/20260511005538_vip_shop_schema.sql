create schema if not exists "shop";


  create table "shop"."vip_shop_character_override" (
    "character_id" bigint not null,
    "rotation_epoch" bigint not null,
    "override_slot_ids" integer[] not null,
    "refreshed_at" timestamp with time zone not null default now()
      );



  create table "shop"."vip_shop_character_purchase" (
    "character_id" bigint not null,
    "rotation_epoch" bigint not null,
    "shop_slot_id" integer not null,
    "amount" integer not null default 1,
    "purchased_at" timestamp with time zone not null default now()
      );



  create table "shop"."vip_shop_refresh_counter" (
    "character_id" bigint not null,
    "day_bucket" date not null,
    "refresh_count" integer not null default 0,
    "last_refresh_at" timestamp with time zone not null default now()
      );



  create table "shop"."vip_shop_rotation" (
    "id" integer not null default 1,
    "rotation_epoch" bigint not null,
    "starts_at" timestamp with time zone not null,
    "ends_at" timestamp with time zone not null,
    "shop_slot_ids" integer[] not null,
    "seed" bigint not null,
    "updated_at" timestamp with time zone not null default now()
      );


CREATE INDEX vip_shop_character_override_epoch_idx ON shop.vip_shop_character_override USING btree (rotation_epoch);

CREATE UNIQUE INDEX vip_shop_character_override_pkey ON shop.vip_shop_character_override USING btree (character_id);

CREATE INDEX vip_shop_character_purchase_epoch_idx ON shop.vip_shop_character_purchase USING btree (rotation_epoch);

CREATE UNIQUE INDEX vip_shop_character_purchase_pkey ON shop.vip_shop_character_purchase USING btree (character_id, rotation_epoch, shop_slot_id);

CREATE UNIQUE INDEX vip_shop_refresh_counter_pkey ON shop.vip_shop_refresh_counter USING btree (character_id, day_bucket);

CREATE UNIQUE INDEX vip_shop_rotation_pkey ON shop.vip_shop_rotation USING btree (id);

alter table "shop"."vip_shop_character_override" add constraint "vip_shop_character_override_pkey" PRIMARY KEY using index "vip_shop_character_override_pkey";

alter table "shop"."vip_shop_character_purchase" add constraint "vip_shop_character_purchase_pkey" PRIMARY KEY using index "vip_shop_character_purchase_pkey";

alter table "shop"."vip_shop_refresh_counter" add constraint "vip_shop_refresh_counter_pkey" PRIMARY KEY using index "vip_shop_refresh_counter_pkey";

alter table "shop"."vip_shop_rotation" add constraint "vip_shop_rotation_pkey" PRIMARY KEY using index "vip_shop_rotation_pkey";

alter table "shop"."vip_shop_character_override" add constraint "vip_shop_character_override_character_fk" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "shop"."vip_shop_character_override" validate constraint "vip_shop_character_override_character_fk";

alter table "shop"."vip_shop_character_override" add constraint "vip_shop_character_override_slots_nonempty" CHECK ((array_length(override_slot_ids, 1) > 0)) not valid;

alter table "shop"."vip_shop_character_override" validate constraint "vip_shop_character_override_slots_nonempty";

alter table "shop"."vip_shop_character_purchase" add constraint "vip_shop_character_purchase_amount_check" CHECK ((amount > 0)) not valid;

alter table "shop"."vip_shop_character_purchase" validate constraint "vip_shop_character_purchase_amount_check";

alter table "shop"."vip_shop_character_purchase" add constraint "vip_shop_character_purchase_character_fk" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "shop"."vip_shop_character_purchase" validate constraint "vip_shop_character_purchase_character_fk";

alter table "shop"."vip_shop_refresh_counter" add constraint "vip_shop_refresh_counter_character_fk" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "shop"."vip_shop_refresh_counter" validate constraint "vip_shop_refresh_counter_character_fk";

alter table "shop"."vip_shop_refresh_counter" add constraint "vip_shop_refresh_counter_count_check" CHECK ((refresh_count >= 0)) not valid;

alter table "shop"."vip_shop_refresh_counter" validate constraint "vip_shop_refresh_counter_count_check";

alter table "shop"."vip_shop_rotation" add constraint "vip_shop_rotation_singleton" CHECK ((id = 1)) not valid;

alter table "shop"."vip_shop_rotation" validate constraint "vip_shop_rotation_singleton";

alter table "shop"."vip_shop_rotation" add constraint "vip_shop_rotation_slots_nonempty" CHECK ((array_length(shop_slot_ids, 1) > 0)) not valid;

alter table "shop"."vip_shop_rotation" validate constraint "vip_shop_rotation_slots_nonempty";

alter table "shop"."vip_shop_rotation" add constraint "vip_shop_rotation_window" CHECK ((ends_at > starts_at)) not valid;

alter table "shop"."vip_shop_rotation" validate constraint "vip_shop_rotation_window";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION shop.fn_apply_personal_refresh(p_character_id bigint, p_rotation_epoch bigint, p_override_slot_ids integer[], p_day_bucket date, p_max_per_day integer)
 RETURNS TABLE(allowed boolean, new_count integer)
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
DECLARE
    v_count integer;
BEGIN
    INSERT INTO "shop"."vip_shop_refresh_counter"
        (character_id, day_bucket, refresh_count, last_refresh_at)
    VALUES
        (p_character_id, p_day_bucket, 0, now())
    ON CONFLICT (character_id, day_bucket) DO NOTHING;

    SELECT c.refresh_count INTO v_count
    FROM "shop"."vip_shop_refresh_counter" AS c
    WHERE c.character_id = p_character_id
      AND c.day_bucket   = p_day_bucket
    FOR UPDATE;

    IF v_count >= p_max_per_day THEN
        RETURN QUERY SELECT false, v_count;
        RETURN;
    END IF;

    UPDATE "shop"."vip_shop_refresh_counter"
       SET refresh_count   = v_count + 1,
           last_refresh_at = now()
     WHERE character_id = p_character_id
       AND day_bucket   = p_day_bucket;

    INSERT INTO "shop"."vip_shop_character_override"
        (character_id, rotation_epoch, override_slot_ids, refreshed_at)
    VALUES
        (p_character_id, p_rotation_epoch, p_override_slot_ids, now())
    ON CONFLICT (character_id) DO UPDATE
        SET rotation_epoch    = EXCLUDED.rotation_epoch,
            override_slot_ids = EXCLUDED.override_slot_ids,
            refreshed_at      = EXCLUDED.refreshed_at;

    DELETE FROM "shop"."vip_shop_character_purchase"
     WHERE character_id   = p_character_id
       AND rotation_epoch = p_rotation_epoch;

    RETURN QUERY SELECT true, v_count + 1;
END;
$function$
;

CREATE OR REPLACE FUNCTION shop.fn_get_or_seed_rotation(p_epoch bigint, p_starts_at timestamp with time zone, p_ends_at timestamp with time zone, p_seed bigint, p_slot_ids integer[])
 RETURNS TABLE(rotation_epoch bigint, starts_at timestamp with time zone, ends_at timestamp with time zone, shop_slot_ids integer[], seed bigint, reseeded boolean)
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
DECLARE
    v_existing_epoch bigint;
    v_did_reseed     boolean := false;
BEGIN
    LOCK TABLE "shop"."vip_shop_rotation" IN EXCLUSIVE MODE;

    SELECT r.rotation_epoch INTO v_existing_epoch
    FROM "shop"."vip_shop_rotation" AS r
    WHERE r.id = 1;

    IF v_existing_epoch IS NULL OR v_existing_epoch <> p_epoch THEN
        INSERT INTO "shop"."vip_shop_rotation"
            (id, rotation_epoch, starts_at, ends_at, shop_slot_ids, seed, updated_at)
        VALUES
            (1, p_epoch, p_starts_at, p_ends_at, p_slot_ids, p_seed, now())
        ON CONFLICT (id) DO UPDATE
            SET rotation_epoch = EXCLUDED.rotation_epoch,
                starts_at      = EXCLUDED.starts_at,
                ends_at        = EXCLUDED.ends_at,
                shop_slot_ids  = EXCLUDED.shop_slot_ids,
                seed           = EXCLUDED.seed,
                updated_at     = now();

        DELETE FROM "shop"."vip_shop_character_override" AS o
         WHERE o.rotation_epoch <> p_epoch;

        DELETE FROM "shop"."vip_shop_character_purchase" AS p
         WHERE p.rotation_epoch <> p_epoch;

        v_did_reseed := true;
    END IF;

    RETURN QUERY
        SELECT r.rotation_epoch, r.starts_at, r.ends_at, r.shop_slot_ids, r.seed, v_did_reseed
        FROM "shop"."vip_shop_rotation" AS r
        WHERE r.id = 1;
END;
$function$
;

CREATE OR REPLACE FUNCTION shop.fn_record_purchase(p_character_id bigint, p_rotation_epoch bigint, p_shop_slot_id integer, p_amount integer)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
DECLARE
    v_rows integer := 0;
BEGIN
    INSERT INTO "shop"."vip_shop_character_purchase"
        (character_id, rotation_epoch, shop_slot_id, amount, purchased_at)
    VALUES
        (p_character_id, p_rotation_epoch, p_shop_slot_id, p_amount, now())
    ON CONFLICT (character_id, rotation_epoch, shop_slot_id) DO NOTHING;

    GET DIAGNOSTICS v_rows = ROW_COUNT;
    RETURN v_rows > 0;
END;
$function$
;


