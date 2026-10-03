alter table "player"."character_farm_plots"
  add column "total_harvest_count" integer not null default 1,
  add column "shared_harvester_ids" bigint[] not null default '{}';

update "player"."character_farm_plots"
set "total_harvest_count" = "harvest_count"
where "total_harvest_count" = 1 and "harvest_count" <> 1;
