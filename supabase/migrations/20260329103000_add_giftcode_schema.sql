CREATE TABLE IF NOT EXISTS "public"."giftcode_campaigns" (
    "id" bigserial PRIMARY KEY,
    "campaign_key" "text" NOT NULL CHECK ((length(btrim("campaign_key")) > 0)),
    "campaign_key_norm" "text" GENERATED ALWAYS AS (lower("campaign_key")) STORED,
    "name" "text" NOT NULL CHECK ((length(btrim("name")) > 0)),
    "description" "text",
    "status" smallint NOT NULL DEFAULT 1 CHECK (("status" = ANY (ARRAY[0, 1, 2]))),
    "starts_at" timestamp with time zone,
    "ends_at" timestamp with time zone,
    "max_total_uses" integer NOT NULL DEFAULT 0 CHECK (("max_total_uses" >= 0)),
    "max_uses_per_player" integer NOT NULL DEFAULT 1 CHECK (("max_uses_per_player" >= 0)),
    "redeemed_count" integer NOT NULL DEFAULT 0 CHECK (("redeemed_count" >= 0)),
    "created_by" "text",
    "created_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "meta" "jsonb" NOT NULL DEFAULT '{}'::"jsonb"
);

CREATE UNIQUE INDEX IF NOT EXISTS "uq_giftcode_campaigns_key_norm"
    ON "public"."giftcode_campaigns" USING "btree" ("campaign_key_norm");

CREATE INDEX IF NOT EXISTS "idx_giftcode_campaigns_status"
    ON "public"."giftcode_campaigns" USING "btree" ("status", "starts_at", "ends_at");

CREATE TABLE IF NOT EXISTS "public"."giftcode_codes" (
    "id" bigserial PRIMARY KEY,
    "campaign_id" bigint NOT NULL,
    "code" "text" NOT NULL CHECK ((length(btrim("code")) > 0)),
    "code_norm" "text" GENERATED ALWAYS AS (lower("code")) STORED,
    "status" smallint NOT NULL DEFAULT 1 CHECK (("status" = ANY (ARRAY[0, 1, 2]))),
    "max_uses" integer NOT NULL DEFAULT 1 CHECK (("max_uses" >= 0)),
    "redeemed_count" integer NOT NULL DEFAULT 0 CHECK (("redeemed_count" >= 0)),
    "last_redeemed_at" timestamp with time zone,
    "created_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "meta" "jsonb" NOT NULL DEFAULT '{}'::"jsonb"
);

CREATE UNIQUE INDEX IF NOT EXISTS "uq_giftcode_codes_code_norm"
    ON "public"."giftcode_codes" USING "btree" ("code_norm");

CREATE INDEX IF NOT EXISTS "idx_giftcode_codes_campaign_status"
    ON "public"."giftcode_codes" USING "btree" ("campaign_id", "status");

CREATE TABLE IF NOT EXISTS "public"."giftcode_rewards" (
    "id" bigserial PRIMARY KEY,
    "campaign_id" bigint NOT NULL,
    "sort_order" integer NOT NULL DEFAULT 0,
    "reward_type" "text" NOT NULL CHECK ((length(btrim("reward_type")) > 0)),
    "amount" bigint NOT NULL DEFAULT 0,
    "payload" "jsonb" NOT NULL DEFAULT '{}'::"jsonb",
    "created_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS "idx_giftcode_rewards_campaign"
    ON "public"."giftcode_rewards" USING "btree" ("campaign_id", "sort_order", "id");

CREATE TABLE IF NOT EXISTS "public"."giftcode_redemptions" (
    "id" bigserial PRIMARY KEY,
    "campaign_id" bigint NOT NULL,
    "code_id" bigint NOT NULL,
    "character_id" bigint NOT NULL,
    "redeemed_at" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reward_snapshot" "jsonb" NOT NULL DEFAULT '[]'::"jsonb",
    "meta" "jsonb" NOT NULL DEFAULT '{}'::"jsonb"
);

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'giftcode_redemptions'
          AND column_name = 'player_id'
    ) THEN
        ALTER TABLE "public"."giftcode_redemptions"
            DROP CONSTRAINT IF EXISTS "giftcode_redemptions_code_id_player_id_key";

        ALTER TABLE "public"."giftcode_redemptions"
            DROP CONSTRAINT IF EXISTS "giftcode_redemptions_player_id_fkey";

        ALTER TABLE "public"."giftcode_redemptions"
            RENAME COLUMN "player_id" TO "character_id";
    END IF;

    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'giftcode_campaigns'
          AND column_name = 'server_id'
    ) THEN
        ALTER TABLE "public"."giftcode_campaigns"
            DROP CONSTRAINT IF EXISTS "giftcode_campaigns_server_id_fkey";

        ALTER TABLE "public"."giftcode_campaigns"
            DROP COLUMN "server_id";
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'giftcode_codes_campaign_id_fkey'
          AND conrelid = 'public.giftcode_codes'::regclass
    ) THEN
        ALTER TABLE "public"."giftcode_codes"
            ADD CONSTRAINT "giftcode_codes_campaign_id_fkey"
            FOREIGN KEY ("campaign_id") REFERENCES "public"."giftcode_campaigns"("id") ON DELETE CASCADE;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'giftcode_rewards_campaign_id_fkey'
          AND conrelid = 'public.giftcode_rewards'::regclass
    ) THEN
        ALTER TABLE "public"."giftcode_rewards"
            ADD CONSTRAINT "giftcode_rewards_campaign_id_fkey"
            FOREIGN KEY ("campaign_id") REFERENCES "public"."giftcode_campaigns"("id") ON DELETE CASCADE;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'giftcode_redemptions_campaign_id_fkey'
          AND conrelid = 'public.giftcode_redemptions'::regclass
    ) THEN
        ALTER TABLE "public"."giftcode_redemptions"
            ADD CONSTRAINT "giftcode_redemptions_campaign_id_fkey"
            FOREIGN KEY ("campaign_id") REFERENCES "public"."giftcode_campaigns"("id") ON DELETE CASCADE;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'giftcode_redemptions_code_id_fkey'
          AND conrelid = 'public.giftcode_redemptions'::regclass
    ) THEN
        ALTER TABLE "public"."giftcode_redemptions"
            ADD CONSTRAINT "giftcode_redemptions_code_id_fkey"
            FOREIGN KEY ("code_id") REFERENCES "public"."giftcode_codes"("id") ON DELETE CASCADE;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'giftcode_redemptions_character_id_fkey'
          AND conrelid = 'public.giftcode_redemptions'::regclass
    ) THEN
        ALTER TABLE "public"."giftcode_redemptions"
            ADD CONSTRAINT "giftcode_redemptions_character_id_fkey"
            FOREIGN KEY ("character_id") REFERENCES "player"."characters"("id") ON DELETE CASCADE;
    END IF;

    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'giftcode_redemptions'
          AND column_name = 'server_id'
    ) THEN
        ALTER TABLE "public"."giftcode_redemptions"
            DROP CONSTRAINT IF EXISTS "giftcode_redemptions_server_id_fkey";

        ALTER TABLE "public"."giftcode_redemptions"
            DROP COLUMN "server_id";
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'giftcode_redemptions_code_id_character_id_key'
          AND conrelid = 'public.giftcode_redemptions'::regclass
    ) THEN
        ALTER TABLE "public"."giftcode_redemptions"
            ADD CONSTRAINT "giftcode_redemptions_code_id_character_id_key"
            UNIQUE ("code_id", "character_id");
    END IF;
END $$;

DROP TABLE IF EXISTS "public"."game_servers";

DROP INDEX IF EXISTS "public"."idx_giftcode_campaigns_server_status";
DROP INDEX IF EXISTS "public"."idx_giftcode_redemptions_campaign_player";
DROP INDEX IF EXISTS "public"."idx_giftcode_redemptions_player_redeemed_at";
DROP INDEX IF EXISTS "public"."idx_game_servers_status";
DROP INDEX IF EXISTS "public"."uq_game_servers_server_key_norm";

CREATE INDEX IF NOT EXISTS "idx_giftcode_campaigns_status"
    ON "public"."giftcode_campaigns" USING "btree" ("status", "starts_at", "ends_at");

CREATE INDEX IF NOT EXISTS "idx_giftcode_redemptions_campaign_character"
    ON "public"."giftcode_redemptions" USING "btree" ("campaign_id", "character_id");

CREATE INDEX IF NOT EXISTS "idx_giftcode_redemptions_character_redeemed_at"
    ON "public"."giftcode_redemptions" USING "btree" ("character_id", "redeemed_at" DESC);
