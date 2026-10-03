
  create table "data"."data_tbl_stat_feature" (
    "id" integer not null,
    "feature_key" text not null,
    "name" text,
    "target_scope" text not null default 'character'::text,
    "config_table" text,
    "state_table" text,
    "state_key" text,
    "panel_key" text,
    "primary_rpc" text,
    "primary_callback" text,
    "bonus_strategy" text not null default 'state_only'::text,
    "bonus_ready" integer not null default 0,
    "enable" integer not null default 1,
    "note" text
      );


alter table "data"."data_tbl_stat_feature" enable row level security;

CREATE UNIQUE INDEX data_tbl_stat_feature_feature_key_key ON data.data_tbl_stat_feature USING btree (feature_key);

CREATE UNIQUE INDEX data_tbl_stat_feature_pkey ON data.data_tbl_stat_feature USING btree (id);

alter table "data"."data_tbl_stat_feature" add constraint "data_tbl_stat_feature_pkey" PRIMARY KEY using index "data_tbl_stat_feature_pkey";

alter table "data"."data_tbl_stat_feature" add constraint "data_tbl_stat_feature_bonus_ready_check" CHECK ((bonus_ready = ANY (ARRAY[0, 1]))) not valid;

alter table "data"."data_tbl_stat_feature" validate constraint "data_tbl_stat_feature_bonus_ready_check";

alter table "data"."data_tbl_stat_feature" add constraint "data_tbl_stat_feature_enable_check" CHECK ((enable = ANY (ARRAY[0, 1]))) not valid;

alter table "data"."data_tbl_stat_feature" validate constraint "data_tbl_stat_feature_enable_check";

alter table "data"."data_tbl_stat_feature" add constraint "data_tbl_stat_feature_target_scope_check" CHECK ((target_scope = ANY (ARRAY['character'::text, 'pet'::text, 'hybrid'::text]))) not valid;

alter table "data"."data_tbl_stat_feature" validate constraint "data_tbl_stat_feature_target_scope_check";

grant delete on table "data"."data_tbl_stat_feature" to "service_role";

grant insert on table "data"."data_tbl_stat_feature" to "service_role";

grant references on table "data"."data_tbl_stat_feature" to "service_role";

grant select on table "data"."data_tbl_stat_feature" to "service_role";

grant trigger on table "data"."data_tbl_stat_feature" to "service_role";

grant truncate on table "data"."data_tbl_stat_feature" to "service_role";

grant update on table "data"."data_tbl_stat_feature" to "service_role";


  create table "player"."character_stat_features" (
    "character_id" bigint not null,
    "feature_key" text not null,
    "state" jsonb not null default '{}'::jsonb,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );


alter table "player"."character_stat_features" enable row level security;


  create table "player"."pet_stat_features" (
    "pet_id" bigint not null,
    "feature_key" text not null,
    "state" jsonb not null default '{}'::jsonb,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );


alter table "player"."pet_stat_features" enable row level security;

CREATE INDEX character_stat_features_feature_key_idx ON player.character_stat_features USING btree (feature_key);

CREATE UNIQUE INDEX character_stat_features_pkey ON player.character_stat_features USING btree (character_id, feature_key);

CREATE INDEX pet_stat_features_feature_key_idx ON player.pet_stat_features USING btree (feature_key);

CREATE UNIQUE INDEX pet_stat_features_pkey ON player.pet_stat_features USING btree (pet_id, feature_key);

alter table "player"."character_stat_features" add constraint "character_stat_features_pkey" PRIMARY KEY using index "character_stat_features_pkey";

alter table "player"."pet_stat_features" add constraint "pet_stat_features_pkey" PRIMARY KEY using index "pet_stat_features_pkey";

alter table "player"."character_stat_features" add constraint "character_stat_features_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_stat_features" validate constraint "character_stat_features_character_id_fkey";

alter table "player"."pet_stat_features" add constraint "pet_stat_features_pet_id_fkey" FOREIGN KEY (pet_id) REFERENCES player.character_pets(id) ON DELETE CASCADE not valid;

alter table "player"."pet_stat_features" validate constraint "pet_stat_features_pet_id_fkey";

grant delete on table "player"."character_stat_features" to "service_role";

grant insert on table "player"."character_stat_features" to "service_role";

grant references on table "player"."character_stat_features" to "service_role";

grant select on table "player"."character_stat_features" to "service_role";

grant trigger on table "player"."character_stat_features" to "service_role";

grant truncate on table "player"."character_stat_features" to "service_role";

grant update on table "player"."character_stat_features" to "service_role";

grant delete on table "player"."pet_stat_features" to "service_role";

grant insert on table "player"."pet_stat_features" to "service_role";

grant references on table "player"."pet_stat_features" to "service_role";

grant select on table "player"."pet_stat_features" to "service_role";

grant trigger on table "player"."pet_stat_features" to "service_role";

grant truncate on table "player"."pet_stat_features" to "service_role";

grant update on table "player"."pet_stat_features" to "service_role";


