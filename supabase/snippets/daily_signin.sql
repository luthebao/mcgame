-- Daily sign-in: per-character monthly state and reward catalogue.
-- Per-character state lives in player; the reward catalogue lives in data.
-- All functions stay security invoker and schema-qualify every relation.

CREATE TABLE IF NOT EXISTS "player"."character_daily_signins" (
    "character_id"        bigint     NOT NULL,
    "year"                integer    NOT NULL,
    "month"               integer    NOT NULL,
    "claimed_days_bitmap" bigint     NOT NULL DEFAULT 0,
    "crit_percent"        integer    NOT NULL DEFAULT 0,
    "lucky_award_claimed" boolean    NOT NULL DEFAULT false,
    "consume_limit_total" bigint     NOT NULL DEFAULT 0,
    "last_signed_at"      timestamptz,
    "updated_at"          timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT character_daily_signins_pkey PRIMARY KEY ("character_id", "year", "month"),
    CONSTRAINT character_daily_signins_month_check CHECK ("month" BETWEEN 1 AND 12),
    CONSTRAINT character_daily_signins_crit_check CHECK ("crit_percent" BETWEEN 0 AND 100)
);

ALTER TABLE "player"."character_daily_signins" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "data"."daily_signin_rewards" (
    "reward_id" integer  NOT NULL,
    "inc"       smallint NOT NULL,
    "item_id"   integer  NOT NULL,
    "quantity"  integer  NOT NULL,
    "weight"    integer  NOT NULL DEFAULT 1,
    "note"      text,
    CONSTRAINT daily_signin_rewards_pkey PRIMARY KEY ("reward_id"),
    CONSTRAINT daily_signin_rewards_inc_check CHECK ("inc" IN (1, 2, 4)),
    CONSTRAINT daily_signin_rewards_quantity_check CHECK ("quantity" > 0),
    CONSTRAINT daily_signin_rewards_weight_check CHECK ("weight" >= 0)
);

ALTER TABLE "data"."daily_signin_rewards" OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "player"."get_character_daily_signin"(
    "p_character_id" bigint, "p_year" integer, "p_month" integer
) RETURNS "player"."character_daily_signins"
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
DECLARE
    v_row "player"."character_daily_signins";
BEGIN
    SELECT * INTO v_row
    FROM "player"."character_daily_signins"
    WHERE "character_id" = "p_character_id"
      AND "year"         = "p_year"
      AND "month"        = "p_month";

    IF NOT FOUND THEN
        v_row.character_id        := "p_character_id";
        v_row.year                := "p_year";
        v_row.month               := "p_month";
        v_row.claimed_days_bitmap := 0;
        v_row.crit_percent        := 0;
        v_row.lucky_award_claimed := false;
        v_row.consume_limit_total := 0;
        v_row.last_signed_at      := NULL;
        v_row.updated_at          := now();
    END IF;

    RETURN v_row;
END;
$$;

ALTER FUNCTION "player"."get_character_daily_signin"(bigint, integer, integer) OWNER TO "postgres";

CREATE TYPE "player"."character_daily_signin_apply_result" AS (
    "row"           "player"."character_daily_signins",
    "day_set"       boolean,
    "award_set"     boolean,
    "crit_changed"  boolean
);

CREATE OR REPLACE FUNCTION "player"."upsert_character_daily_signin"(
    "p_character_id"        bigint,
    "p_year"                integer,
    "p_month"               integer,
    "p_day"                 integer,
    "p_crit_delta"          integer DEFAULT 0,
    "p_consume_delta"       bigint  DEFAULT 0,
    "p_set_award_claimed"   boolean DEFAULT false
) RETURNS "player"."character_daily_signin_apply_result"
LANGUAGE plpgsql
SECURITY INVOKER
AS $$
DECLARE
    v_pre        "player"."character_daily_signins";
    v_post       "player"."character_daily_signins";
    v_result     "player"."character_daily_signin_apply_result";
    v_day_bit    bigint;
    v_day_in_rng boolean;
BEGIN
    v_day_in_rng := "p_day" BETWEEN 1 AND 31;
    v_day_bit    := CASE WHEN v_day_in_rng THEN (1::bigint << ("p_day" - 1)) ELSE 0::bigint END;

    SELECT * INTO v_pre
    FROM "player"."character_daily_signins"
    WHERE "character_id" = "p_character_id" AND "year" = "p_year" AND "month" = "p_month"
    FOR UPDATE;

    INSERT INTO "player"."character_daily_signins" AS t (
        "character_id", "year", "month", "claimed_days_bitmap",
        "crit_percent", "lucky_award_claimed", "consume_limit_total",
        "last_signed_at", "updated_at"
    ) VALUES (
        "p_character_id", "p_year", "p_month", v_day_bit,
        GREATEST(0, LEAST(100, "p_crit_delta")),
        "p_set_award_claimed",
        GREATEST(0::bigint, "p_consume_delta"),
        CASE WHEN v_day_in_rng THEN now() ELSE NULL END,
        now()
    )
    ON CONFLICT ("character_id", "year", "month") DO UPDATE SET
        "claimed_days_bitmap" = t."claimed_days_bitmap" | EXCLUDED."claimed_days_bitmap",
        "crit_percent"        = GREATEST(0, LEAST(100, t."crit_percent" + "p_crit_delta")),
        "lucky_award_claimed" = t."lucky_award_claimed" OR "p_set_award_claimed",
        "consume_limit_total" = t."consume_limit_total" + GREATEST(0::bigint, "p_consume_delta"),
        "last_signed_at"      = CASE WHEN v_day_in_rng THEN now() ELSE t."last_signed_at" END,
        "updated_at"          = now()
    RETURNING * INTO v_post;

    v_result.row          := v_post;
    v_result.day_set      := v_day_in_rng AND (COALESCE(v_pre."claimed_days_bitmap", 0) & v_day_bit) = 0;
    v_result.award_set    := "p_set_award_claimed" AND NOT COALESCE(v_pre."lucky_award_claimed", false);
    v_result.crit_changed := v_post."crit_percent" > COALESCE(v_pre."crit_percent", 0);

    RETURN v_result;
END;
$$;

ALTER FUNCTION "player"."upsert_character_daily_signin"(bigint, integer, integer, integer, integer, bigint, boolean) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "data"."list_daily_signin_rewards"("p_inc" smallint DEFAULT NULL)
RETURNS SETOF "data"."daily_signin_rewards"
LANGUAGE sql
SECURITY INVOKER
AS $$
    SELECT *
    FROM "data"."daily_signin_rewards"
    WHERE ("p_inc" IS NULL OR "inc" = "p_inc")
      AND "weight" > 0
    ORDER BY "reward_id";
$$;

ALTER FUNCTION "data"."list_daily_signin_rewards"(smallint) OWNER TO "postgres";

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE ON TABLE "data"."daily_signin_rewards" TO "service_role";
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE ON TABLE "player"."character_daily_signins" TO "service_role";
