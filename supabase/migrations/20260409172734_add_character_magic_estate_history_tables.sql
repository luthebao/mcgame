create sequence "player"."character_magic_estate_logs_id_seq";


  create table "player"."character_magic_estate_logs" (
    "id" bigint not null default nextval('player.character_magic_estate_logs_id_seq'::regclass),
    "character_id" bigint not null,
    "log_time_ms" bigint not null,
    "result" integer not null,
    "guest" boolean not null default false,
    "cid" bigint not null default 0,
    "tid" bigint not null default 0,
    "name" text not null default ''::text,
    "item_template_id" integer not null default 0,
    "num" integer not null default 0,
    "no_replay" boolean not null default true,
    "battle_id" bigint not null default 0,
    "created_at" timestamp with time zone not null default now()
      );



  create table "player"."character_magic_estate_replays" (
    "character_id" bigint not null,
    "battle_id" bigint not null,
    "name" text not null default ''::text,
    "timestamp_text" text not null default ''::text,
    "created_at" timestamp with time zone not null default now()
      );


alter sequence "player"."character_magic_estate_logs_id_seq" owned by "player"."character_magic_estate_logs"."id";

CREATE UNIQUE INDEX character_magic_estate_logs_pkey ON player.character_magic_estate_logs USING btree (id);

CREATE UNIQUE INDEX character_magic_estate_replays_pkey ON player.character_magic_estate_replays USING btree (character_id, battle_id);

CREATE INDEX idx_character_magic_estate_logs_character ON player.character_magic_estate_logs USING btree (character_id, log_time_ms DESC);

CREATE INDEX idx_character_magic_estate_replays_character ON player.character_magic_estate_replays USING btree (character_id, created_at DESC);

alter table "player"."character_magic_estate_logs" add constraint "character_magic_estate_logs_pkey" PRIMARY KEY using index "character_magic_estate_logs_pkey";

alter table "player"."character_magic_estate_replays" add constraint "character_magic_estate_replays_pkey" PRIMARY KEY using index "character_magic_estate_replays_pkey";

alter table "player"."character_magic_estate_logs" add constraint "character_magic_estate_logs_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_magic_estate_logs" validate constraint "character_magic_estate_logs_character_id_fkey";

alter table "player"."character_magic_estate_replays" add constraint "character_magic_estate_replays_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_magic_estate_replays" validate constraint "character_magic_estate_replays_character_id_fkey";
