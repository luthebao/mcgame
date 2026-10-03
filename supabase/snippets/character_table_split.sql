-- Split player.characters into 8 feature-scoped tables.
-- See docs/plans/2026-04-18_01_CHARACTER_TABLE_SPLIT_PLAN.md

BEGIN;

-- ============================================================================
-- 1. New feature-scoped tables (strict 1:1 with player.characters)
-- ============================================================================

CREATE TABLE player.character_progression (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    level int NOT NULL DEFAULT 1,
    experience bigint NOT NULL DEFAULT 0,
    rebirth_level int NOT NULL DEFAULT 0,
    rebirth_exp bigint NOT NULL DEFAULT 0,
    awaken_level int NOT NULL DEFAULT 0,
    awaken_points int NOT NULL DEFAULT 0,
    awaken_points_used int NOT NULL DEFAULT 0,
    star_level int NOT NULL DEFAULT 0,
    soul_level int NOT NULL DEFAULT 0,
    soul_exp bigint NOT NULL DEFAULT 0,
    soul_points bigint NOT NULL DEFAULT 0
);

CREATE TABLE player.character_attributes (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    strength int NOT NULL DEFAULT 10,
    agility int NOT NULL DEFAULT 10,
    stamina int NOT NULL DEFAULT 10,
    intelligence int NOT NULL DEFAULT 10,
    spirit int NOT NULL DEFAULT 10,
    attr_points int NOT NULL DEFAULT 0,
    max_attr_points int NOT NULL DEFAULT 0,
    distributed_attr_points int NOT NULL DEFAULT 0,
    current_hp int NOT NULL DEFAULT 100,
    current_mp int NOT NULL DEFAULT 50,
    current_sp int NOT NULL DEFAULT 100,
    apt_strength int NOT NULL DEFAULT 0,
    apt_strength_evolution int NOT NULL DEFAULT 0,
    apt_agility int NOT NULL DEFAULT 0,
    apt_agility_evolution int NOT NULL DEFAULT 0,
    apt_stamina int NOT NULL DEFAULT 0,
    apt_stamina_evolution int NOT NULL DEFAULT 0,
    apt_intelligence int NOT NULL DEFAULT 0,
    apt_intelligence_evolution int NOT NULL DEFAULT 0,
    apt_energy int NOT NULL DEFAULT 0,
    apt_energy_evolution int NOT NULL DEFAULT 0
);

CREATE TABLE player.character_combat_stats (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    max_hp int NOT NULL DEFAULT 100,
    max_mp int NOT NULL DEFAULT 50,
    max_sp int NOT NULL DEFAULT 100,
    attack int NOT NULL DEFAULT 20,
    defense int NOT NULL DEFAULT 10,
    magic_attack int NOT NULL DEFAULT 20,
    magic_defense int NOT NULL DEFAULT 10,
    hit int NOT NULL DEFAULT 100,
    dodge int NOT NULL DEFAULT 0,
    critical int NOT NULL DEFAULT 5,
    critical_dmg int NOT NULL DEFAULT 150,
    speed int NOT NULL DEFAULT 100
);

CREATE TABLE player.character_wallet (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    money bigint NOT NULL DEFAULT 0,
    money_bind bigint NOT NULL DEFAULT 0,
    gold bigint NOT NULL DEFAULT 0,
    gold_bind bigint NOT NULL DEFAULT 0,
    honor bigint NOT NULL DEFAULT 0,
    chivalry bigint NOT NULL DEFAULT 0,
    reputation bigint NOT NULL DEFAULT 0,
    pop bigint NOT NULL DEFAULT 0,
    selected_money_type int NOT NULL DEFAULT 1,
    selected_gold_type int NOT NULL DEFAULT 3
);

CREATE TABLE player.character_resources (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    move_points int NOT NULL DEFAULT 100,
    max_move_points int NOT NULL DEFAULT 100,
    activity_points int NOT NULL DEFAULT 100,
    max_activity_points int NOT NULL DEFAULT 100,
    vigor int NOT NULL DEFAULT 100,
    max_vigor int NOT NULL DEFAULT 100,
    bag_slots int NOT NULL DEFAULT 1,
    bank_slots int NOT NULL DEFAULT 1,
    pet_slots int NOT NULL DEFAULT 6,
    temp_bag_slots int NOT NULL DEFAULT 0,
    mx_temp_bag_slots int NOT NULL DEFAULT 0
);

CREATE TABLE player.character_life_skills (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    cook_dex int NOT NULL DEFAULT 0,
    fish_dex int NOT NULL DEFAULT 0,
    herb_dex int NOT NULL DEFAULT 0,
    medicine_dex int NOT NULL DEFAULT 0,
    plant_dex int NOT NULL DEFAULT 0
);

CREATE TABLE player.character_feature_states (
    character_id bigint PRIMARY KEY REFERENCES player.characters(id) ON DELETE CASCADE,
    element_type int NOT NULL DEFAULT 0,
    element_rank int NOT NULL DEFAULT 0,
    element_max boolean NOT NULL DEFAULT false,
    pm_exp bigint NOT NULL DEFAULT 0,
    pm_process_data jsonb NOT NULL DEFAULT '{}'::jsonb,
    pm_findback boolean NOT NULL DEFAULT false,
    pet_guard_data jsonb NOT NULL DEFAULT '{"lvData":{},"petData":{}}'::jsonb,
    boss_daily jsonb DEFAULT '{}'::jsonb
);

-- ============================================================================
-- 2. Backfill from existing player.characters rows
-- ============================================================================

INSERT INTO player.character_progression (character_id, level, experience, rebirth_level, rebirth_exp, awaken_level, awaken_points, awaken_points_used, star_level, soul_level, soul_exp, soul_points)
SELECT id, COALESCE(level,1), COALESCE(experience,0), COALESCE(rebirth_level,0), COALESCE(rebirth_exp,0), COALESCE(awaken_level,0), COALESCE(awaken_points,0), COALESCE(awaken_points_used,0), COALESCE(star_level,0), COALESCE(soul_level,0), COALESCE(soul_exp,0), COALESCE(soul_points,0)
FROM player.characters;

INSERT INTO player.character_attributes (character_id, strength, agility, stamina, intelligence, spirit, attr_points, current_hp, current_mp, current_sp, apt_strength, apt_strength_evolution, apt_agility, apt_agility_evolution, apt_stamina, apt_stamina_evolution, apt_intelligence, apt_intelligence_evolution, apt_energy, apt_energy_evolution)
SELECT id, COALESCE(strength,10), COALESCE(agility,10), COALESCE(stamina,10), COALESCE(intelligence,10), COALESCE(spirit,10), COALESCE(attr_points,0), COALESCE(current_hp,100), COALESCE(current_mp,50), COALESCE(current_sp,100), COALESCE(apt_strength,0), COALESCE(apt_strength_evolution,0), COALESCE(apt_agility,0), COALESCE(apt_agility_evolution,0), COALESCE(apt_stamina,0), COALESCE(apt_stamina_evolution,0), COALESCE(apt_intelligence,0), COALESCE(apt_intelligence_evolution,0), COALESCE(apt_energy,0), COALESCE(apt_energy_evolution,0)
FROM player.characters;

INSERT INTO player.character_combat_stats (character_id, max_hp, max_mp, max_sp, attack, defense, magic_attack, magic_defense, hit, dodge, critical, critical_dmg, speed)
SELECT id, COALESCE(max_hp,100), COALESCE(max_mp,50), COALESCE(max_sp,100), COALESCE(attack,20), COALESCE(defense,10), COALESCE(magic_attack,20), COALESCE(magic_defense,10), COALESCE(hit,100), COALESCE(dodge,0), COALESCE(critical,5), COALESCE(critical_dmg,150), COALESCE(speed,100)
FROM player.characters;

INSERT INTO player.character_wallet (character_id, money, money_bind, gold, gold_bind, honor, chivalry, reputation, pop, selected_money_type, selected_gold_type)
SELECT id, COALESCE(money,0), COALESCE(money_bind,0), COALESCE(gold,0), COALESCE(gold_bind,0), COALESCE(honor,0), COALESCE(chivalry,0), COALESCE(reputation,0), COALESCE(pop,0), COALESCE(selected_money_type,1), COALESCE(selected_gold_type,3)
FROM player.characters;

INSERT INTO player.character_resources (character_id, move_points, max_move_points, activity_points, max_activity_points, vigor, max_vigor, bag_slots, bank_slots, pet_slots, temp_bag_slots, mx_temp_bag_slots)
SELECT id, COALESCE(move_points,100), COALESCE(max_move_points,100), COALESCE(activity_points,100), COALESCE(max_activity_points,100), COALESCE(vigor,100), COALESCE(max_vigor,100), COALESCE(bag_slots,1), COALESCE(bank_slots,1), COALESCE(pet_slots,6), COALESCE(temp_bag_slots,0), COALESCE(mx_temp_bag_slots,0)
FROM player.characters;

INSERT INTO player.character_life_skills (character_id, cook_dex, fish_dex, herb_dex, medicine_dex, plant_dex)
SELECT id, COALESCE(cook_dex,0), COALESCE(fish_dex,0), COALESCE(herb_dex,0), COALESCE(medicine_dex,0), COALESCE(plant_dex,0)
FROM player.characters;

INSERT INTO player.character_feature_states (character_id, element_type, element_rank, element_max, pm_exp, pm_process_data, pm_findback, pet_guard_data, boss_daily)
SELECT id, COALESCE(element_type,0), COALESCE(element_rank,0), COALESCE(element_max,false), COALESCE(pm_exp,0), COALESCE(pm_process_data,'{}'::jsonb), COALESCE(pm_findback,false), COALESCE(pet_guard_data,'{"lvData":{},"petData":{}}'::jsonb), COALESCE(boss_daily,'{}'::jsonb)
FROM player.characters;

-- ============================================================================
-- 3. Drop moved columns from player.characters
-- ============================================================================

ALTER TABLE player.characters
    DROP COLUMN level,
    DROP COLUMN experience,
    DROP COLUMN rebirth_level,
    DROP COLUMN rebirth_exp,
    DROP COLUMN awaken_level,
    DROP COLUMN awaken_points,
    DROP COLUMN awaken_points_used,
    DROP COLUMN star_level,
    DROP COLUMN soul_level,
    DROP COLUMN soul_exp,
    DROP COLUMN soul_points,
    DROP COLUMN strength,
    DROP COLUMN agility,
    DROP COLUMN stamina,
    DROP COLUMN intelligence,
    DROP COLUMN spirit,
    DROP COLUMN attr_points,
    DROP COLUMN current_hp,
    DROP COLUMN current_mp,
    DROP COLUMN current_sp,
    DROP COLUMN apt_strength,
    DROP COLUMN apt_strength_evolution,
    DROP COLUMN apt_agility,
    DROP COLUMN apt_agility_evolution,
    DROP COLUMN apt_stamina,
    DROP COLUMN apt_stamina_evolution,
    DROP COLUMN apt_intelligence,
    DROP COLUMN apt_intelligence_evolution,
    DROP COLUMN apt_energy,
    DROP COLUMN apt_energy_evolution,
    DROP COLUMN max_hp,
    DROP COLUMN max_mp,
    DROP COLUMN max_sp,
    DROP COLUMN attack,
    DROP COLUMN defense,
    DROP COLUMN magic_attack,
    DROP COLUMN magic_defense,
    DROP COLUMN hit,
    DROP COLUMN dodge,
    DROP COLUMN critical,
    DROP COLUMN critical_dmg,
    DROP COLUMN speed,
    DROP COLUMN money,
    DROP COLUMN money_bind,
    DROP COLUMN gold,
    DROP COLUMN gold_bind,
    DROP COLUMN honor,
    DROP COLUMN chivalry,
    DROP COLUMN reputation,
    DROP COLUMN pop,
    DROP COLUMN selected_money_type,
    DROP COLUMN selected_gold_type,
    DROP COLUMN move_points,
    DROP COLUMN max_move_points,
    DROP COLUMN activity_points,
    DROP COLUMN max_activity_points,
    DROP COLUMN vigor,
    DROP COLUMN max_vigor,
    DROP COLUMN bag_slots,
    DROP COLUMN bank_slots,
    DROP COLUMN pet_slots,
    DROP COLUMN temp_bag_slots,
    DROP COLUMN mx_temp_bag_slots,
    DROP COLUMN cook_dex,
    DROP COLUMN fish_dex,
    DROP COLUMN herb_dex,
    DROP COLUMN medicine_dex,
    DROP COLUMN plant_dex,
    DROP COLUMN element_type,
    DROP COLUMN element_rank,
    DROP COLUMN element_max,
    DROP COLUMN pm_exp,
    DROP COLUMN pm_process_data,
    DROP COLUMN pm_findback,
    DROP COLUMN pet_guard_data,
    DROP COLUMN boss_daily;

-- ============================================================================
-- 4. Backward-compat view that preserves the pre-split column shape
-- ============================================================================

CREATE OR REPLACE VIEW player.characters_full
WITH (security_invoker = on) AS
SELECT
    c.id,
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
FROM player.characters c
LEFT JOIN player.character_progression p ON p.character_id = c.id
LEFT JOIN player.character_attributes a ON a.character_id = c.id
LEFT JOIN player.character_combat_stats cs ON cs.character_id = c.id
LEFT JOIN player.character_wallet w ON w.character_id = c.id
LEFT JOIN player.character_resources r ON r.character_id = c.id
LEFT JOIN player.character_life_skills l ON l.character_id = c.id
LEFT JOIN player.character_feature_states f ON f.character_id = c.id;

-- ============================================================================
-- 5. Grants for service_role on the new tables and the view
-- ============================================================================

GRANT ALL ON player.character_progression TO service_role;
GRANT ALL ON player.character_attributes TO service_role;
GRANT ALL ON player.character_combat_stats TO service_role;
GRANT ALL ON player.character_wallet TO service_role;
GRANT ALL ON player.character_resources TO service_role;
GRANT ALL ON player.character_life_skills TO service_role;
GRANT ALL ON player.character_feature_states TO service_role;
GRANT SELECT ON player.characters_full TO service_role;

COMMIT;
