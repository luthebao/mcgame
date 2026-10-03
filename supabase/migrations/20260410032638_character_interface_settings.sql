  create table "player"."character_interface_settings" (
    "character_id" bigint not null,
    "interface_settings" jsonb not null default '{}'::jsonb,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone not null default now()
      );


CREATE UNIQUE INDEX character_interface_settings_pkey ON player.character_interface_settings USING btree (character_id);

alter table "player"."character_interface_settings" add constraint "character_interface_settings_pkey" PRIMARY KEY using index "character_interface_settings_pkey";

alter table "player"."character_interface_settings" add constraint "character_interface_settings_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_interface_settings" validate constraint "character_interface_settings_character_id_fkey";
