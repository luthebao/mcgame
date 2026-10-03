create sequence "player"."character_farm_plots_id_seq";


  create table "player"."character_farm_plots" (
    "id" bigint not null default nextval('player.character_farm_plots_id_seq'::regclass),
    "character_id" bigint not null,
    "plot_npc_id" integer not null,
    "crop_npc_id" integer not null,
    "harvest_item_template_id" integer not null,
    "harvest_count" integer not null default 1,
    "planted_at" timestamp with time zone not null,
    "ready_at" timestamp with time zone not null,
    "created_at" timestamp with time zone default CURRENT_TIMESTAMP,
    "updated_at" timestamp with time zone default CURRENT_TIMESTAMP
      );


alter sequence "player"."character_farm_plots_id_seq" owned by "player"."character_farm_plots"."id";

CREATE UNIQUE INDEX character_farm_plots_character_id_plot_npc_id_key ON player.character_farm_plots USING btree (character_id, plot_npc_id);

CREATE UNIQUE INDEX character_farm_plots_pkey ON player.character_farm_plots USING btree (id);

CREATE INDEX idx_character_farm_plots_character ON player.character_farm_plots USING btree (character_id);

CREATE INDEX idx_character_farm_plots_ready_at ON player.character_farm_plots USING btree (ready_at);

alter table "player"."character_farm_plots" add constraint "character_farm_plots_pkey" PRIMARY KEY using index "character_farm_plots_pkey";

alter table "player"."character_farm_plots" add constraint "character_farm_plots_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_farm_plots" validate constraint "character_farm_plots_character_id_fkey";

alter table "player"."character_farm_plots" add constraint "character_farm_plots_character_id_plot_npc_id_key" UNIQUE using index "character_farm_plots_character_id_plot_npc_id_key";


