  create table "player"."character_magic_estate_bag" (
    "character_id" bigint not null,
    "slot_index" integer not null,
    "template_id" integer not null,
    "num" bigint not null,
    "color_code" integer not null default 0,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );



  create table "player"."character_magic_estate_slots" (
    "character_id" bigint not null,
    "slot_id" integer not null,
    "mineral_id" integer not null,
    "num" integer not null,
    "max_num" integer not null,
    "cooldown_ends_at_ms" bigint not null default 0,
    "harvest_flag" boolean not null default false,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );



  create table "player"."character_magic_estates" (
    "character_id" bigint not null,
    "exp" integer not null default 0,
    "actpoint" integer not null default 0,
    "max_actpoint" integer not null default 0,
    "farm_num" integer not null default 2,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );


CREATE UNIQUE INDEX character_magic_estate_bag_pkey ON player.character_magic_estate_bag USING btree (character_id, slot_index);

CREATE UNIQUE INDEX character_magic_estate_slots_pkey ON player.character_magic_estate_slots USING btree (character_id, slot_id);

CREATE UNIQUE INDEX character_magic_estates_pkey ON player.character_magic_estates USING btree (character_id);

CREATE INDEX idx_character_magic_estate_bag_character ON player.character_magic_estate_bag USING btree (character_id);

CREATE INDEX idx_character_magic_estate_slots_character ON player.character_magic_estate_slots USING btree (character_id);

alter table "player"."character_magic_estate_bag" add constraint "character_magic_estate_bag_pkey" PRIMARY KEY using index "character_magic_estate_bag_pkey";

alter table "player"."character_magic_estate_slots" add constraint "character_magic_estate_slots_pkey" PRIMARY KEY using index "character_magic_estate_slots_pkey";

alter table "player"."character_magic_estates" add constraint "character_magic_estates_pkey" PRIMARY KEY using index "character_magic_estates_pkey";

alter table "player"."character_magic_estate_bag" add constraint "character_magic_estate_bag_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_magic_estate_bag" validate constraint "character_magic_estate_bag_character_id_fkey";

alter table "player"."character_magic_estate_slots" add constraint "character_magic_estate_slots_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_magic_estate_slots" validate constraint "character_magic_estate_slots_character_id_fkey";

alter table "player"."character_magic_estates" add constraint "character_magic_estates_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_magic_estates" validate constraint "character_magic_estates_character_id_fkey";
