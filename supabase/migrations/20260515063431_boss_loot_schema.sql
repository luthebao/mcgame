create sequence "data"."data_tbl_boss_loot_id_seq";

alter table "data"."data_tbl_schedule_boss" drop constraint "data_tbl_schedule_boss_kind_check";


  create table "data"."data_tbl_boss_loot" (
    "id" bigint not null default nextval('data.data_tbl_boss_loot_id_seq'::regclass),
    "boss_nid" integer not null,
    "item_id" integer not null,
    "quality" integer not null default 0,
    "rate" integer not null,
    "qty_min" integer not null default 1,
    "qty_max" integer not null default 1,
    "bound" boolean not null default false,
    "type" integer not null default 0,
    "tier_filter" text,
    "source_filter" text,
    "qid" integer,
    "notes" text,
    "is_active" boolean not null default true,
    "created_at" timestamp with time zone not null default now()
      );


alter table "data"."data_tbl_schedule_boss" add column "daily_boss_id" integer;

alter sequence "data"."data_tbl_boss_loot_id_seq" owned by "data"."data_tbl_boss_loot"."id";

CREATE INDEX data_tbl_boss_loot_by_boss_idx ON data.data_tbl_boss_loot USING btree (boss_nid) WHERE is_active;

CREATE UNIQUE INDEX data_tbl_boss_loot_pkey ON data.data_tbl_boss_loot USING btree (id);

CREATE UNIQUE INDEX data_tbl_schedule_boss_daily_boss_id_key ON data.data_tbl_schedule_boss USING btree (daily_boss_id) WHERE (daily_boss_id IS NOT NULL);

alter table "data"."data_tbl_boss_loot" add constraint "data_tbl_boss_loot_pkey" PRIMARY KEY using index "data_tbl_boss_loot_pkey";

alter table "data"."data_tbl_boss_loot" add constraint "data_tbl_boss_loot_boss_nid_fkey" FOREIGN KEY (boss_nid) REFERENCES data.data_tbl_schedule_boss(nid) not valid;

alter table "data"."data_tbl_boss_loot" validate constraint "data_tbl_boss_loot_boss_nid_fkey";

alter table "data"."data_tbl_boss_loot" add constraint "data_tbl_boss_loot_qty_check" CHECK (((qty_min >= 1) AND (qty_min <= qty_max))) not valid;

alter table "data"."data_tbl_boss_loot" validate constraint "data_tbl_boss_loot_qty_check";

alter table "data"."data_tbl_boss_loot" add constraint "data_tbl_boss_loot_rate_check" CHECK (((rate > 0) AND (rate <= 50000))) not valid;

alter table "data"."data_tbl_boss_loot" validate constraint "data_tbl_boss_loot_rate_check";

alter table "data"."data_tbl_boss_loot" add constraint "data_tbl_boss_loot_source_check" CHECK (((source_filter IS NULL) OR (source_filter = ANY (ARRAY['schedule'::text, 'daily'::text])))) not valid;

alter table "data"."data_tbl_boss_loot" validate constraint "data_tbl_boss_loot_source_check";

alter table "data"."data_tbl_boss_loot" add constraint "data_tbl_boss_loot_tier_check" CHECK (((tier_filter IS NULL) OR (tier_filter = ANY (ARRAY['normal'::text, 'mythic'::text, 'special'::text])))) not valid;

alter table "data"."data_tbl_boss_loot" validate constraint "data_tbl_boss_loot_tier_check";

alter table "data"."data_tbl_schedule_boss" add constraint "data_tbl_schedule_boss_kind_check" CHECK ((kind = ANY (ARRAY['ground'::text, 'flying'::text, 'daily_only'::text]))) not valid;

alter table "data"."data_tbl_schedule_boss" validate constraint "data_tbl_schedule_boss_kind_check";


