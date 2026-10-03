create table "player"."character_pet_arena_entries" (
    "character_id" bigint not null,
    "season" integer not null,
    "team_name" text not null default ''::text,
    "conf_data" jsonb not null default '{}'::jsonb,
    "max_fights" integer not null default 20,
    "used_fights" integer not null default 0,
    "cooldown_ends_at_ms" bigint not null default 0,
    "last_rank" integer not null default '-1'::integer,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );


CREATE UNIQUE INDEX character_pet_arena_entries_pkey ON player.character_pet_arena_entries USING btree (character_id, season);

CREATE INDEX idx_character_pet_arena_entries_season ON player.character_pet_arena_entries USING btree (season, updated_at DESC);

alter table "player"."character_pet_arena_entries" add constraint "character_pet_arena_entries_pkey" PRIMARY KEY using index "character_pet_arena_entries_pkey";

alter table "player"."character_pet_arena_entries" add constraint "character_pet_arena_entries_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_pet_arena_entries" validate constraint "character_pet_arena_entries_character_id_fkey";
