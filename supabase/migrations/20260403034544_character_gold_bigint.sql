alter table "player"."characters" alter column "gold" set data type bigint using "gold"::bigint;

alter table "player"."characters" alter column "gold_bind" set data type bigint using "gold_bind"::bigint;


