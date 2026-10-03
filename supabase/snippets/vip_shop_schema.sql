-- VIP Shop persistence: shared 4h rotation, per-character override, sold-out markers, daily refresh counter.
-- Companion plan: docs/plans/2026-05-11_01_VIP_SHOP_REFACTOR.md
-- All function bodies are security invoker and schema-qualify every relation.

CREATE SCHEMA IF NOT EXISTS "shop";
ALTER SCHEMA "shop" OWNER TO "postgres";

-- Singleton row: the currently-active shared 4-hour rotation.
CREATE TABLE IF NOT EXISTS "shop"."vip_shop_rotation" (
    "id"             integer     NOT NULL DEFAULT 1,
    "rotation_epoch" bigint      NOT NULL,
    "starts_at"      timestamptz NOT NULL,
    "ends_at"        timestamptz NOT NULL,
    "shop_slot_ids"  integer[]   NOT NULL,
    "seed"           bigint      NOT NULL,
    "updated_at"     timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT vip_shop_rotation_pkey PRIMARY KEY ("id"),
    CONSTRAINT vip_shop_rotation_singleton CHECK ("id" = 1),
    CONSTRAINT vip_shop_rotation_window CHECK ("ends_at" > "starts_at"),
    CONSTRAINT vip_shop_rotation_slots_nonempty CHECK (array_length("shop_slot_ids", 1) > 0)
);
ALTER TABLE "shop"."vip_shop_rotation" OWNER TO "postgres";

-- Per-character override of the shared rotation, valid only for the rotation_epoch it was set against.
CREATE TABLE IF NOT EXISTS "shop"."vip_shop_character_override" (
    "character_id"      bigint      NOT NULL,
    "rotation_epoch"    bigint      NOT NULL,
    "override_slot_ids" integer[]   NOT NULL,
    "refreshed_at"      timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT vip_shop_character_override_pkey PRIMARY KEY ("character_id"),
    CONSTRAINT vip_shop_character_override_slots_nonempty CHECK (array_length("override_slot_ids", 1) > 0),
    CONSTRAINT vip_shop_character_override_character_fk
        FOREIGN KEY ("character_id") REFERENCES "player"."characters" ("id") ON DELETE CASCADE
);
ALTER TABLE "shop"."vip_shop_character_override" OWNER TO "postgres";

CREATE INDEX IF NOT EXISTS vip_shop_character_override_epoch_idx
    ON "shop"."vip_shop_character_override" ("rotation_epoch");

-- Sold-out markers, scoped to (character, rotation_epoch, slot). Old epochs are pruned by fn_get_or_seed_rotation.
CREATE TABLE IF NOT EXISTS "shop"."vip_shop_character_purchase" (
    "character_id"   bigint      NOT NULL,
    "rotation_epoch" bigint      NOT NULL,
    "shop_slot_id"   integer     NOT NULL,
    "amount"         integer     NOT NULL DEFAULT 1,
    "purchased_at"   timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT vip_shop_character_purchase_pkey PRIMARY KEY ("character_id", "rotation_epoch", "shop_slot_id"),
    CONSTRAINT vip_shop_character_purchase_amount_check CHECK ("amount" > 0),
    CONSTRAINT vip_shop_character_purchase_character_fk
        FOREIGN KEY ("character_id") REFERENCES "player"."characters" ("id") ON DELETE CASCADE
);
ALTER TABLE "shop"."vip_shop_character_purchase" OWNER TO "postgres";

CREATE INDEX IF NOT EXISTS vip_shop_character_purchase_epoch_idx
    ON "shop"."vip_shop_character_purchase" ("rotation_epoch");

-- Daily refresh counter. day_bucket is the civil date in Asia/Saigon (caller passes the correct date).
CREATE TABLE IF NOT EXISTS "shop"."vip_shop_refresh_counter" (
    "character_id"    bigint      NOT NULL,
    "day_bucket"      date        NOT NULL,
    "refresh_count"   integer     NOT NULL DEFAULT 0,
    "last_refresh_at" timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT vip_shop_refresh_counter_pkey PRIMARY KEY ("character_id", "day_bucket"),
    CONSTRAINT vip_shop_refresh_counter_count_check CHECK ("refresh_count" >= 0),
    CONSTRAINT vip_shop_refresh_counter_character_fk
        FOREIGN KEY ("character_id") REFERENCES "player"."characters" ("id") ON DELETE CASCADE
);
ALTER TABLE "shop"."vip_shop_refresh_counter" OWNER TO "postgres";

-- shop.fn_get_or_seed_rotation: idempotent reseed of the singleton.
-- If the stored epoch already matches p_epoch, no-op and returns existing row.
-- Otherwise, replaces the singleton, then prunes overrides and purchases tied to stale epochs.
-- The deterministic Fisher-Yates selection is performed by Go before calling, and passed in via p_slot_ids.
CREATE OR REPLACE FUNCTION "shop"."fn_get_or_seed_rotation"(
    p_epoch     bigint,
    p_starts_at timestamptz,
    p_ends_at   timestamptz,
    p_seed      bigint,
    p_slot_ids  integer[]
) RETURNS TABLE (
    rotation_epoch bigint,
    starts_at      timestamptz,
    ends_at        timestamptz,
    shop_slot_ids  integer[],
    seed           bigint,
    reseeded       boolean
)
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = ''
AS $$
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
$$;
ALTER FUNCTION "shop"."fn_get_or_seed_rotation"(bigint, timestamptz, timestamptz, bigint, integer[])
    OWNER TO "postgres";
REVOKE ALL ON FUNCTION "shop"."fn_get_or_seed_rotation"(bigint, timestamptz, timestamptz, bigint, integer[]) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION "shop"."fn_get_or_seed_rotation"(bigint, timestamptz, timestamptz, bigint, integer[]) TO authenticated;
GRANT EXECUTE ON FUNCTION "shop"."fn_get_or_seed_rotation"(bigint, timestamptz, timestamptz, bigint, integer[]) TO service_role;

-- shop.fn_apply_personal_refresh: race-safe daily-cap enforcement + override/purchase reset.
-- Locks the counter row, verifies usage < max, increments, then upserts the override and clears
-- the character's purchase markers for the active rotation. Returns (allowed, new_count).
-- The cost-per-refresh decision lives in Go (the user-authored nextRefresh helper); this function
-- only enforces the hard cap atomically.
CREATE OR REPLACE FUNCTION "shop"."fn_apply_personal_refresh"(
    p_character_id      bigint,
    p_rotation_epoch    bigint,
    p_override_slot_ids integer[],
    p_day_bucket        date,
    p_max_per_day       integer
) RETURNS TABLE (
    allowed   boolean,
    new_count integer
)
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = ''
AS $$
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
$$;
ALTER FUNCTION "shop"."fn_apply_personal_refresh"(bigint, bigint, integer[], date, integer)
    OWNER TO "postgres";
REVOKE ALL ON FUNCTION "shop"."fn_apply_personal_refresh"(bigint, bigint, integer[], date, integer) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION "shop"."fn_apply_personal_refresh"(bigint, bigint, integer[], date, integer) TO authenticated;
GRANT EXECUTE ON FUNCTION "shop"."fn_apply_personal_refresh"(bigint, bigint, integer[], date, integer) TO service_role;

-- shop.fn_record_purchase: insert sold-out marker; returns false if already present (race-safe).
CREATE OR REPLACE FUNCTION "shop"."fn_record_purchase"(
    p_character_id   bigint,
    p_rotation_epoch bigint,
    p_shop_slot_id   integer,
    p_amount         integer
) RETURNS boolean
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = ''
AS $$
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
$$;
ALTER FUNCTION "shop"."fn_record_purchase"(bigint, bigint, integer, integer)
    OWNER TO "postgres";
REVOKE ALL ON FUNCTION "shop"."fn_record_purchase"(bigint, bigint, integer, integer) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION "shop"."fn_record_purchase"(bigint, bigint, integer, integer) TO authenticated;
GRANT EXECUTE ON FUNCTION "shop"."fn_record_purchase"(bigint, bigint, integer, integer) TO service_role;
