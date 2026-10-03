
  create table "data"."data_tbl_schedule_boss" (
    "nid" integer not null,
    "name" text not null,
    "map_id" integer not null,
    "level" integer not null,
    "kind" text not null default 'ground'::text,
    "tier" text not null default 'normal'::text,
    "channel_scope" text not null default 'all'::text,
    "description" text,
    "is_active" boolean not null default true,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );



  create table "player"."schedule_boss_state" (
    "nid" integer not null,
    "channel_id" integer not null,
    "is_alive" boolean not null default false,
    "last_killed_at" timestamp with time zone,
    "last_killer_id" bigint,
    "next_spawn_at" timestamp with time zone not null,
    "spawn_count" integer not null default 0,
    "updated_at" timestamp with time zone not null default now()
      );


CREATE UNIQUE INDEX data_tbl_schedule_boss_pkey ON data.data_tbl_schedule_boss USING btree (nid);

CREATE INDEX schedule_boss_state_due_idx ON player.schedule_boss_state USING btree (next_spawn_at) WHERE (NOT is_alive);

CREATE UNIQUE INDEX schedule_boss_state_pkey ON player.schedule_boss_state USING btree (nid, channel_id);

alter table "data"."data_tbl_schedule_boss" add constraint "data_tbl_schedule_boss_pkey" PRIMARY KEY using index "data_tbl_schedule_boss_pkey";

alter table "player"."schedule_boss_state" add constraint "schedule_boss_state_pkey" PRIMARY KEY using index "schedule_boss_state_pkey";

alter table "data"."data_tbl_schedule_boss" add constraint "data_tbl_schedule_boss_kind_check" CHECK ((kind = ANY (ARRAY['ground'::text, 'flying'::text]))) not valid;

alter table "data"."data_tbl_schedule_boss" validate constraint "data_tbl_schedule_boss_kind_check";

alter table "data"."data_tbl_schedule_boss" add constraint "data_tbl_schedule_boss_tier_check" CHECK ((tier = ANY (ARRAY['normal'::text, 'mythic'::text, 'special'::text]))) not valid;

alter table "data"."data_tbl_schedule_boss" validate constraint "data_tbl_schedule_boss_tier_check";

alter table "player"."schedule_boss_state" add constraint "schedule_boss_state_nid_fkey" FOREIGN KEY (nid) REFERENCES data.data_tbl_schedule_boss(nid) not valid;

alter table "player"."schedule_boss_state" validate constraint "schedule_boss_state_nid_fkey";


