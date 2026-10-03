alter table "player"."characters" add column "guild_restore_contrib" integer not null default 0;

alter table "player"."characters" add column "guild_restore_donate" integer not null default 0;
