drop index if exists "player"."idx_characters_honor";


  create table "player"."character_attributes" (
    "character_id" bigint not null,
    "strength" integer not null default 10,
    "agility" integer not null default 10,
    "stamina" integer not null default 10,
    "intelligence" integer not null default 10,
    "spirit" integer not null default 10,
    "attr_points" integer not null default 0,
    "current_hp" integer not null default 100,
    "current_mp" integer not null default 50,
    "current_sp" integer not null default 100,
    "apt_strength" integer not null default 0,
    "apt_strength_evolution" integer not null default 0,
    "apt_agility" integer not null default 0,
    "apt_agility_evolution" integer not null default 0,
    "apt_stamina" integer not null default 0,
    "apt_stamina_evolution" integer not null default 0,
    "apt_intelligence" integer not null default 0,
    "apt_intelligence_evolution" integer not null default 0,
    "apt_energy" integer not null default 0,
    "apt_energy_evolution" integer not null default 0
      );



  create table "player"."character_combat_stats" (
    "character_id" bigint not null,
    "max_hp" integer not null default 100,
    "max_mp" integer not null default 50,
    "max_sp" integer not null default 100,
    "attack" integer not null default 20,
    "defense" integer not null default 10,
    "magic_attack" integer not null default 20,
    "magic_defense" integer not null default 10,
    "hit" integer not null default 100,
    "dodge" integer not null default 0,
    "critical" integer not null default 5,
    "critical_dmg" integer not null default 150,
    "speed" integer not null default 100
      );



  create table "player"."character_feature_states" (
    "character_id" bigint not null,
    "element_type" integer not null default 0,
    "element_rank" integer not null default 0,
    "element_max" boolean not null default false,
    "pm_exp" bigint not null default 0,
    "pm_process_data" jsonb not null default '{}'::jsonb,
    "pm_findback" boolean not null default false,
    "pet_guard_data" jsonb not null default '{"lvData": {}, "petData": {}}'::jsonb,
    "boss_daily" jsonb default '{}'::jsonb
      );



  create table "player"."character_life_skills" (
    "character_id" bigint not null,
    "cook_dex" integer not null default 0,
    "fish_dex" integer not null default 0,
    "herb_dex" integer not null default 0,
    "medicine_dex" integer not null default 0,
    "plant_dex" integer not null default 0
      );



  create table "player"."character_progression" (
    "character_id" bigint not null,
    "level" integer not null default 1,
    "experience" bigint not null default 0,
    "rebirth_level" integer not null default 0,
    "rebirth_exp" bigint not null default 0,
    "awaken_level" integer not null default 0,
    "awaken_points" integer not null default 0,
    "awaken_points_used" integer not null default 0,
    "star_level" integer not null default 0,
    "soul_level" integer not null default 0,
    "soul_exp" bigint not null default 0,
    "soul_points" bigint not null default 0
      );



  create table "player"."character_resources" (
    "character_id" bigint not null,
    "move_points" integer not null default 100,
    "max_move_points" integer not null default 100,
    "activity_points" integer not null default 100,
    "max_activity_points" integer not null default 100,
    "vigor" integer not null default 100,
    "max_vigor" integer not null default 100,
    "bag_slots" integer not null default 1,
    "bank_slots" integer not null default 1,
    "pet_slots" integer not null default 6,
    "temp_bag_slots" integer not null default 0,
    "mx_temp_bag_slots" integer not null default 0
      );



  create table "player"."character_wallet" (
    "character_id" bigint not null,
    "money" bigint not null default 0,
    "money_bind" bigint not null default 0,
    "gold" bigint not null default 0,
    "gold_bind" bigint not null default 0,
    "honor" bigint not null default 0,
    "chivalry" bigint not null default 0,
    "reputation" bigint not null default 0,
    "pop" bigint not null default 0,
    "selected_money_type" integer not null default 1,
    "selected_gold_type" integer not null default 3
      );


alter table "player"."characters" drop column "activity_points";

alter table "player"."characters" drop column "agility";

alter table "player"."characters" drop column "apt_agility";

alter table "player"."characters" drop column "apt_agility_evolution";

alter table "player"."characters" drop column "apt_energy";

alter table "player"."characters" drop column "apt_energy_evolution";

alter table "player"."characters" drop column "apt_intelligence";

alter table "player"."characters" drop column "apt_intelligence_evolution";

alter table "player"."characters" drop column "apt_stamina";

alter table "player"."characters" drop column "apt_stamina_evolution";

alter table "player"."characters" drop column "apt_strength";

alter table "player"."characters" drop column "apt_strength_evolution";

alter table "player"."characters" drop column "attack";

alter table "player"."characters" drop column "attr_points";

alter table "player"."characters" drop column "awaken_level";

alter table "player"."characters" drop column "awaken_points";

alter table "player"."characters" drop column "awaken_points_used";

alter table "player"."characters" drop column "bag_slots";

alter table "player"."characters" drop column "bank_slots";

alter table "player"."characters" drop column "boss_daily";

alter table "player"."characters" drop column "chivalry";

alter table "player"."characters" drop column "cook_dex";

alter table "player"."characters" drop column "critical";

alter table "player"."characters" drop column "critical_dmg";

alter table "player"."characters" drop column "current_hp";

alter table "player"."characters" drop column "current_mp";

alter table "player"."characters" drop column "current_sp";

alter table "player"."characters" drop column "defense";

alter table "player"."characters" drop column "dodge";

alter table "player"."characters" drop column "element_max";

alter table "player"."characters" drop column "element_rank";

alter table "player"."characters" drop column "element_type";

alter table "player"."characters" drop column "experience";

alter table "player"."characters" drop column "fish_dex";

alter table "player"."characters" drop column "gold";

alter table "player"."characters" drop column "gold_bind";

alter table "player"."characters" drop column "herb_dex";

alter table "player"."characters" drop column "hit";

alter table "player"."characters" drop column "honor";

alter table "player"."characters" drop column "intelligence";

alter table "player"."characters" drop column "level";

alter table "player"."characters" drop column "magic_attack";

alter table "player"."characters" drop column "magic_defense";

alter table "player"."characters" drop column "max_activity_points";

alter table "player"."characters" drop column "max_hp";

alter table "player"."characters" drop column "max_move_points";

alter table "player"."characters" drop column "max_mp";

alter table "player"."characters" drop column "max_sp";

alter table "player"."characters" drop column "max_vigor";

alter table "player"."characters" drop column "medicine_dex";

alter table "player"."characters" drop column "money";

alter table "player"."characters" drop column "money_bind";

alter table "player"."characters" drop column "move_points";

alter table "player"."characters" drop column "mx_temp_bag_slots";

alter table "player"."characters" drop column "pet_guard_data";

alter table "player"."characters" drop column "pet_slots";

alter table "player"."characters" drop column "plant_dex";

alter table "player"."characters" drop column "pm_exp";

alter table "player"."characters" drop column "pm_findback";

alter table "player"."characters" drop column "pm_process_data";

alter table "player"."characters" drop column "pop";

alter table "player"."characters" drop column "rebirth_exp";

alter table "player"."characters" drop column "rebirth_level";

alter table "player"."characters" drop column "reputation";

alter table "player"."characters" drop column "selected_gold_type";

alter table "player"."characters" drop column "selected_money_type";

alter table "player"."characters" drop column "soul_exp";

alter table "player"."characters" drop column "soul_level";

alter table "player"."characters" drop column "soul_points";

alter table "player"."characters" drop column "speed";

alter table "player"."characters" drop column "spirit";

alter table "player"."characters" drop column "stamina";

alter table "player"."characters" drop column "star_level";

alter table "player"."characters" drop column "strength";

alter table "player"."characters" drop column "temp_bag_slots";

alter table "player"."characters" drop column "vigor";

CREATE UNIQUE INDEX character_attributes_pkey ON player.character_attributes USING btree (character_id);

CREATE UNIQUE INDEX character_combat_stats_pkey ON player.character_combat_stats USING btree (character_id);

CREATE UNIQUE INDEX character_feature_states_pkey ON player.character_feature_states USING btree (character_id);

CREATE UNIQUE INDEX character_life_skills_pkey ON player.character_life_skills USING btree (character_id);

CREATE UNIQUE INDEX character_progression_pkey ON player.character_progression USING btree (character_id);

CREATE UNIQUE INDEX character_resources_pkey ON player.character_resources USING btree (character_id);

CREATE UNIQUE INDEX character_wallet_pkey ON player.character_wallet USING btree (character_id);

alter table "player"."character_attributes" add constraint "character_attributes_pkey" PRIMARY KEY using index "character_attributes_pkey";

alter table "player"."character_combat_stats" add constraint "character_combat_stats_pkey" PRIMARY KEY using index "character_combat_stats_pkey";

alter table "player"."character_feature_states" add constraint "character_feature_states_pkey" PRIMARY KEY using index "character_feature_states_pkey";

alter table "player"."character_life_skills" add constraint "character_life_skills_pkey" PRIMARY KEY using index "character_life_skills_pkey";

alter table "player"."character_progression" add constraint "character_progression_pkey" PRIMARY KEY using index "character_progression_pkey";

alter table "player"."character_resources" add constraint "character_resources_pkey" PRIMARY KEY using index "character_resources_pkey";

alter table "player"."character_wallet" add constraint "character_wallet_pkey" PRIMARY KEY using index "character_wallet_pkey";

alter table "player"."character_attributes" add constraint "character_attributes_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_attributes" validate constraint "character_attributes_character_id_fkey";

alter table "player"."character_combat_stats" add constraint "character_combat_stats_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_combat_stats" validate constraint "character_combat_stats_character_id_fkey";

alter table "player"."character_feature_states" add constraint "character_feature_states_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_feature_states" validate constraint "character_feature_states_character_id_fkey";

alter table "player"."character_life_skills" add constraint "character_life_skills_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_life_skills" validate constraint "character_life_skills_character_id_fkey";

alter table "player"."character_progression" add constraint "character_progression_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_progression" validate constraint "character_progression_character_id_fkey";

alter table "player"."character_resources" add constraint "character_resources_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_resources" validate constraint "character_resources_character_id_fkey";

alter table "player"."character_wallet" add constraint "character_wallet_character_id_fkey" FOREIGN KEY (character_id) REFERENCES player.characters(id) ON DELETE CASCADE not valid;

alter table "player"."character_wallet" validate constraint "character_wallet_character_id_fkey";

create or replace view "player"."characters_full" as  SELECT c.id,
    c.account_id,
    c.name,
    c.class_id,
    c.gender,
    p.level,
    p.experience,
    p.rebirth_level,
    p.rebirth_exp,
    a.strength,
    a.agility,
    a.stamina,
    a.intelligence,
    a.spirit,
    a.attr_points,
    a.current_hp,
    a.current_mp,
    a.current_sp,
    cs.max_hp,
    cs.max_mp,
    cs.max_sp,
    cs.attack,
    cs.defense,
    cs.magic_attack,
    cs.magic_defense,
    cs.hit,
    cs.dodge,
    cs.critical,
    cs.critical_dmg,
    cs.speed,
    c.map_id,
    c.pos_x,
    c.pos_y,
    c.direction,
    w.money,
    w.money_bind,
    w.gold,
    w.gold_bind,
    c.guild_id,
    c.vip_type,
    c.vip_expires_at,
    w.honor,
    w.chivalry,
    p.awaken_level,
    p.awaken_points,
    p.awaken_points_used,
    p.star_level,
    p.soul_exp,
    p.soul_level,
    p.soul_points,
    r.move_points,
    r.max_move_points,
    r.activity_points,
    r.max_activity_points,
    r.vigor,
    r.max_vigor,
    r.bag_slots,
    r.bank_slots,
    r.pet_slots,
    r.temp_bag_slots,
    r.mx_temp_bag_slots,
    c.gm_level,
    w.reputation,
    c.created_at,
    c.last_active,
    c.total_online,
    f.element_type,
    f.element_rank,
    f.element_max,
    w.selected_money_type,
    w.selected_gold_type,
    a.apt_agility,
    a.apt_agility_evolution,
    a.apt_energy,
    a.apt_energy_evolution,
    a.apt_intelligence,
    a.apt_intelligence_evolution,
    a.apt_stamina,
    a.apt_stamina_evolution,
    a.apt_strength,
    a.apt_strength_evolution,
    f.pet_guard_data,
    f.pm_exp,
    f.pm_process_data,
    f.pm_findback,
    l.cook_dex,
    l.fish_dex,
    l.herb_dex,
    l.medicine_dex,
    l.plant_dex,
    c.guild_restore_contrib,
    c.guild_restore_donate,
    w.pop,
    f.boss_daily,
    c.dress_info
   FROM (((((((player.characters c
     LEFT JOIN player.character_progression p ON ((p.character_id = c.id)))
     LEFT JOIN player.character_attributes a ON ((a.character_id = c.id)))
     LEFT JOIN player.character_combat_stats cs ON ((cs.character_id = c.id)))
     LEFT JOIN player.character_wallet w ON ((w.character_id = c.id)))
     LEFT JOIN player.character_resources r ON ((r.character_id = c.id)))
     LEFT JOIN player.character_life_skills l ON ((l.character_id = c.id)))
     LEFT JOIN player.character_feature_states f ON ((f.character_id = c.id)));


grant delete on table "player"."character_attributes" to "service_role";

grant insert on table "player"."character_attributes" to "service_role";

grant references on table "player"."character_attributes" to "service_role";

grant select on table "player"."character_attributes" to "service_role";

grant trigger on table "player"."character_attributes" to "service_role";

grant truncate on table "player"."character_attributes" to "service_role";

grant update on table "player"."character_attributes" to "service_role";

grant delete on table "player"."character_combat_stats" to "service_role";

grant insert on table "player"."character_combat_stats" to "service_role";

grant references on table "player"."character_combat_stats" to "service_role";

grant select on table "player"."character_combat_stats" to "service_role";

grant trigger on table "player"."character_combat_stats" to "service_role";

grant truncate on table "player"."character_combat_stats" to "service_role";

grant update on table "player"."character_combat_stats" to "service_role";

grant delete on table "player"."character_feature_states" to "service_role";

grant insert on table "player"."character_feature_states" to "service_role";

grant references on table "player"."character_feature_states" to "service_role";

grant select on table "player"."character_feature_states" to "service_role";

grant trigger on table "player"."character_feature_states" to "service_role";

grant truncate on table "player"."character_feature_states" to "service_role";

grant update on table "player"."character_feature_states" to "service_role";

grant delete on table "player"."character_life_skills" to "service_role";

grant insert on table "player"."character_life_skills" to "service_role";

grant references on table "player"."character_life_skills" to "service_role";

grant select on table "player"."character_life_skills" to "service_role";

grant trigger on table "player"."character_life_skills" to "service_role";

grant truncate on table "player"."character_life_skills" to "service_role";

grant update on table "player"."character_life_skills" to "service_role";

grant delete on table "player"."character_progression" to "service_role";

grant insert on table "player"."character_progression" to "service_role";

grant references on table "player"."character_progression" to "service_role";

grant select on table "player"."character_progression" to "service_role";

grant trigger on table "player"."character_progression" to "service_role";

grant truncate on table "player"."character_progression" to "service_role";

grant update on table "player"."character_progression" to "service_role";

grant delete on table "player"."character_resources" to "service_role";

grant insert on table "player"."character_resources" to "service_role";

grant references on table "player"."character_resources" to "service_role";

grant select on table "player"."character_resources" to "service_role";

grant trigger on table "player"."character_resources" to "service_role";

grant truncate on table "player"."character_resources" to "service_role";

grant update on table "player"."character_resources" to "service_role";

grant delete on table "player"."character_wallet" to "service_role";

grant insert on table "player"."character_wallet" to "service_role";

grant references on table "player"."character_wallet" to "service_role";

grant select on table "player"."character_wallet" to "service_role";

grant trigger on table "player"."character_wallet" to "service_role";

grant truncate on table "player"."character_wallet" to "service_role";

grant update on table "player"."character_wallet" to "service_role";


