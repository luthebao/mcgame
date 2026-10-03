  create table "player"."character_pet_fight_configs" (
    "character_id" bigint not null,
    "config_key" text not null,
    "conf_data" jsonb not null default '{}'::jsonb,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );


CREATE UNIQUE INDEX character_pet_fight_configs_pkey ON player.character_pet_fight_configs USING btree (character_id, config_key);

CREATE INDEX idx_character_pet_fight_configs_key ON player.character_pet_fight_configs USING btree (config_key);

alter table "player"."character_pet_fight_configs" add constraint "character_pet_fight_configs_pkey" PRIMARY KEY using index "character_pet_fight_configs_pkey";

alter table "player"."character_pet_fight_configs" add constraint "character_pet_fight_configs_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_pet_fight_configs" validate constraint "character_pet_fight_configs_character_id_fkey";
