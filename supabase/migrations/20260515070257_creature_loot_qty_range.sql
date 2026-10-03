alter table "data"."data_tbl_creature_loot" add column "qty_max" integer not null default 1;

alter table "data"."data_tbl_creature_loot" add column "qty_min" integer not null default 1;

alter table "data"."data_tbl_creature_loot" add constraint "data_tbl_creature_loot_qty_check" CHECK (((qty_min >= 1) AND (qty_min <= qty_max))) not valid;

alter table "data"."data_tbl_creature_loot" validate constraint "data_tbl_creature_loot_qty_check";


