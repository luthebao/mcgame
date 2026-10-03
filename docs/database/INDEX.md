# Game-Data Table Index

Per-table reference documentation for every table in `docs/database/game_data/`.
Each row links to a detailed `docs/database/details/<TBL>.md` file documenting **every key/column**, its type, and its function.

- **Scope:** recovered from the decompiled Flash client (`docs/client/`) and the JSON data dumps only — no server/Go code.
- **Gold standard / format reference:** [`details/TBL_MAP.md`](details/TBL_MAP.md).
- **Inference legend:** fields with no client-code usage are explicitly marked `(inferred from data — no client usage found)` in each doc.
- **Two table classes:**
  - **Static** (record count > 0) — game-data baked into the client; full per-key reference.
  - **Runtime / instance** (record count `0`) — per-character/account/live-state tables; JSON export is empty, so columns are recovered from client field usage. The `Table ID` is the `GamePredef` constant.

Totals: **133 tables** — ~87 static, ~46 runtime/instance.

---

## Maps & World

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_MAP](details/TBL_MAP.md) | 33 | 209 | Static map/scene definitions: dimensions, safe-point, connectivity, PvP/flight rules, encounter tuning, theming. |
| [TBL_MAP_CELL](details/TBL_MAP_CELL.md) | 60 | 1787 | Per-map grid cells carrying collision/decoration tile resource codes; builds the scene hit-test grid. |
| [TBL_MAZE](details/TBL_MAZE.md) | 99 | 15 | Event-cell type definitions for the Mê Trận labyrinth mini-game board (name, spawn weight, reward script). |
| [TBL_WAR_MAP](details/TBL_WAR_MAP.md) | 89 | 12 | 12 zodiac palace zones for the Tinh Cung Star Instance war system. |
| [TBL_WAR_SPRITE](details/TBL_WAR_SPRITE.md) | 130 | 176 | Chiến Hồn (War Spirit) upgrade tree: 16 chains × 11 levels with stat-bonus pairs and `nextId` chain. |
| [TBL_MEVENT_MAP](details/TBL_MEVENT_MAP.md) | 128 | 103 | Ordered board-cell path for the Bí Cảnh treasure hunt (position, facing, event-type ID). |
| [TBL_MEVENT_TYPE](details/TBL_MEVENT_TYPE.md) | 129 | 19 | Catalogue of 19 Bí Cảnh event-cell categories (name, NPC sprite, tooltip). |
| [TBL_POS](details/TBL_POS.md) | 72 | 0 | Runtime named map positions used as clickable chat hyperlinks. |
| [TBL_CHARACTOR_MAP](details/TBL_CHARACTOR_MAP.md) | 5 | 0 | Runtime character-to-map instance table (indexed by `cid`). |
| [TBL_GUILD_MAP](details/TBL_GUILD_MAP.md) | 24 | 0 | Runtime guild-to-map instance table (indexed by `gid`). |

## NPCs & Spawns

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_NPC](details/TBL_NPC.md) | 35 | 1943 | All world NPC definitions: type, map position, sprite assets, shop/quest/transport/script config, schedule. |
| [TBL_NPC_SKILL](details/TBL_NPC_SKILL.md) | 38 | 540 | NPC-to-skill loadout mapping (indexed by `nid`). |
| [TBL_NPC_CREATURE](details/TBL_NPC_CREATURE.md) | 36 | 1553 | Creature encounter roster for NPC battle nodes (probability range, boss tier, XP tuning). |
| [TBL_MAP_CREATURE](details/TBL_MAP_CREATURE.md) | 34 | 1192 | Open-world creature spawn table per map (probability, battleMode, withCloud gate, boss tier). |
| [TBL_NPC_PLAN](details/TBL_NPC_PLAN.md) | 63 | 0 | NPC-to-loot-plan mapping (empty; server-side join, indexed by `npcId`). |
| [TBL_NPC_QUEST](details/TBL_NPC_QUEST.md) | 37 | 0 | NPC-to-quest mapping (empty; server-side join, indexed by `nid`). |

## Creatures & Combat

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_CREATURE](details/TBL_CREATURE.md) | 12 | 2016 | Core monster/pet template: class, element, aptitude growth, capture difficulty, combat stats, asset codes. |
| [TBL_CREATURE_SKILL](details/TBL_CREATURE_SKILL.md) | 14 | 1861 | Creature-to-skill loadout map (`cid` → `sid`). |
| [TBL_CREATURE_LOOT](details/TBL_CREATURE_LOOT.md) | 13 | 1669 | Creature drop table; item refs, rate in 1/10000, quest-gated and bind-on-drop flags. |
| [TBL_CREATURE_HANDBOOK](details/TBL_CREATURE_HANDBOOK.md) | 100 | 92 | Pet compendium (Thần Thú Đồ Giám): collection thresholds, activation bonuses, evolution chain, skills. |
| [TBL_CRE_POINT](details/TBL_CRE_POINT.md) | 15 | 0 | Runtime creature-point accumulation table (empty). |
| [TBL_CREATUREH_HEART](details/TBL_CREATUREH_HEART.md) | 131 | 1938 | Ma Tâm (Monster Heart) item definitions: origin, type, stat bonus, quality tier for socketing. |
| [TBL_CREATUREH_COMBINE](details/TBL_CREATUREH_COMBINE.md) | 132 | 1710 | Heart-combination bonus recipes (which placements yield what stat bonus). |
| [TBL_CREATUREH_CONTAIN](details/TBL_CREATUREH_CONTAIN.md) | 133 | 30 | The 5 heart containers × 6 upgrade levels (costs, socket capacity, active lines). |
| [TBL_CREATUREH_POINT](details/TBL_CREATUREH_POINT.md) | 134 | 35 | The 7 socket slots per container (unlock costs, heart-type restriction, combination links). |

## Quests

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_QUEST](details/TBL_QUEST.md) | 45 | 5530 | Quest templates: type/subType, lifecycle (pre→require→award), level/class/rebirth gates, reward currency. |
| [TBL_QUEST_AWARD](details/TBL_QUEST_AWARD.md) | 46 | 1437 | Per-quest award rows (item/pet/skill kind, quality gate, bound-on-award flag). |
| [TBL_QUEST_REQUIRE](details/TBL_QUEST_REQUIRE.md) | 47 | 4765 | Per-quest objective rows (collect/kill/submit, table ref, quality constraint, target count). |
| [TBL_QUEST_PRE](details/TBL_QUEST_PRE.md) | 64 | 2007 | Per-quest unlock prerequisites (carry item / prior quest), combined AND/OR via `preQuestType`. |
| [TBL_QUEST_LOOP](details/TBL_QUEST_LOOP.md) | 58 | 11 | Repeatable loop-quest series (NPC, rounds, refresh cooldown, team, server scripts). |
| [TBL_ANSWER](details/TBL_ANSWER.md) | 61 | 3627 | Quiz question bank (question text, 4 options, correct key); used by Maze & Answer events. |
| [TBL_CHARACTOR_QUEST](details/TBL_CHARACTOR_QUEST.md) | 7 | 0 | Runtime per-character active quest state (empty). |
| [TBL_CHARACTOR_QUEST_KILL](details/TBL_CHARACTOR_QUEST_KILL.md) | 65 | 0 | Runtime per-character kill-progress counters (empty). |

## Items & Equipment

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_EQUIPT_TEMPLATE](details/TBL_EQUIPT_TEMPLATE.md) | 19 | 1872 | Static template for all equippables: stats, asset codes, crafting reqs, class restrictions, soul-activation. |
| [TBL_EQUIPT_SUIT](details/TBL_EQUIPT_SUIT.md) | 73 | 250 | Equipment set (suit) bonuses: `suitId` → up to 5 tier-gated stat bonuses + skill description. |
| [TBL_EQUIPT_INSTANCE](details/TBL_EQUIPT_INSTANCE.md) | 18 | 0 | Runtime per-character equipment instances (refinement, durability, bind, sockets) — server-pushed. |
| [TBL_EQUIPT_TYPE](details/TBL_EQUIPT_TYPE.md) | 21 | 0 | Empty reference table; superseded by hardcoded `ITEM_TYPE_*` constants. |
| [TBL_EQUIPT_JEWEL](details/TBL_EQUIPT_JEWEL.md) | 20 | 0 | Runtime per-equipment jewel-socket table (which gems are socketed); fetched via `getJewelData`. |
| [TBL_ITEM_TEMPLATE](details/TBL_ITEM_TEMPLATE.md) | 29 | 6468 | Core item catalog: consumables, materials, jewels, formulas; drives tooltips, crafting, type routing. |
| [TBL_ITEM_INSTANCE](details/TBL_ITEM_INSTANCE.md) | 28 | 0 | Runtime per-character item-in-bag instances (empty); `tid`, expiry, color, bind, stack. |
| [TBL_RECYCLING](details/TBL_RECYCLING.md) | 115 | 322 | Mystery Furnace recycle-value rules (per-item score / score-currency entries). |
| [TBL_SCENEITEM_TEMPLATE](details/TBL_SCENEITEM_TEMPLATE.md) | 50 | 399 | World scene-object templates: teleport portals (type 3) + decorative props (type 2001). |
| [TBL_SCENEITEM_INSTANCE](details/TBL_SCENEITEM_INSTANCE.md) | 49 | 1094 | Placed scene-object instances (indexed by `posMapId` / `ownerId`; layer/mirror render flags). |

## Economy & Loot

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_PLAN](details/TBL_PLAN.md) | 42 | 31630 | Loot/reward drop-plan entries; item ref + probability + quantity, `st="type-sourceId"` compound key. |
| [TBL_SHOP](details/TBL_SHOP.md) | 53 | 121 | Shop directory (type 1 NPC gold/money, type 2 event/score). |
| [TBL_SHOP_SLOT](details/TBL_SHOP_SLOT.md) | 51 | 2542 | Per-shop purchasable slots: multi-currency pricing, stack cap, visibility flag (indexed by `sid`). |
| [TBL_CREDIT](details/TBL_CREDIT.md) | 107 | 252 | NPC score-exchange items: currency cost, weekly/monthly caps, bind-on-exchange. |
| [TBL_PLAN_KIND](details/TBL_PLAN_KIND.md) | 62 | 0 | Empty; intended plan-category classifier. |
| [TBL_PLAN_REQUIRE](details/TBL_PLAN_REQUIRE.md) | 44 | 0 | Empty; intended per-plan prerequisites (`pid` → TBL_PLAN). |
| [TBL_PLAN_AWARD](details/TBL_PLAN_AWARD.md) | 43 | 0 | Empty; intended supplemental guaranteed-award rows (`pid` → TBL_PLAN). |
| [TBL_AUCTION](details/TBL_AUCTION.md) | 1 | 0 | Runtime auction-house listings (indexed by ownerId/itemKind/itemType). |
| [TBL_MAIL](details/TBL_MAIL.md) | 32 | 0 | Runtime player inbox (sender, subject, attachments, COD, read date). |

## Skills & Buffs

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_SKILL](details/TBL_SKILL.md) | 52 | 4914 | Core skill template: combat/life/pet/guild/artifact skills; costs, targeting, element, buff triggers, gates. |
| [TBL_SKILL_KIND](details/TBL_SKILL_KIND.md) | 55 | 4 | Enum lookup for the 4 skill-kind categories. |
| [TBL_SKILL_TYPE](details/TBL_SKILL_TYPE.md) | 57 | 11 | Enum lookup for 11 skill sub-types (linked to parent kind). |
| [TBL_SKILL_POOL](details/TBL_SKILL_POOL.md) | 56 | 315 | Join table mapping pool IDs (`pi`) to skill IDs (`si`). |
| [TBL_SKILL_EXPAND](details/TBL_SKILL_EXPAND.md) | 54 | 0 | Empty; reserved skill-expansion table. |
| [TBL_CHARACTOR_SKILL](details/TBL_CHARACTOR_SKILL.md) | 8 | 0 | Runtime per-character skill instances (`sid`, `position`, `kind`). |
| [TBL_BUFF](details/TBL_BUFF.md) | 66 | 3182 | Buff/debuff templates: up to 6 stat-modifier pairs, percentFlag, CC state code, icon, tooltip. |
| [TBL_CHARACTOR_BUFF](details/TBL_CHARACTOR_BUFF.md) | 3 | 0 | Runtime per-character active buffs (indexed by `cid`; `bid` → TBL_BUFF). |

## Pets

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_PET_SOUL](details/TBL_PET_SOUL.md) | 94 | 840 | Soul-gem definitions (stat bonus, quality, chip cost, level/XP chain) socketed into pet soul slots. |
| [TBL_PET_TALENT](details/TBL_PET_TALENT.md) | 101 | 1024 | Pet talent-tree nodes per level (stat type/power, XP cost, prereq); indexed by `basicTid`/`sid`. |
| [TBL_PET_CONTRACT](details/TBL_PET_CONTRACT.md) | 117 | 50 | Pet Contract (Khế Ước Thú) upgrade ladder: 4 stat pairs/level, XP+item cost, max 50. |
| [TBL_PET_GUARD](details/TBL_PET_GUARD.md) | 135 | 120 | Pet Guard slot tiers (4 types × 30 levels): 4 stat bonuses, gold/resource cost. |
| [TBL_PET_STONE](details/TBL_PET_STONE.md) | 136 | 132 | Pet Stone (Mệnh Thạch) chains (22 types × 6 levels): single stat bonus, `nextId` chain, energy link. |
| [TBL_SUBLIMATION](details/TBL_SUBLIMATION.md) | 108 | 50 | Player equipment Sublimation tiers: attack/defence pairs, elemental %, success rate, material cost. |
| [TBL_SUBLIMATION_PET](details/TBL_SUBLIMATION_PET.md) | 112 | 50 | Pet equipment Sublimation tiers (same schema, applies to pet gear). |
| [TBL_PET](details/TBL_PET.md) | 39 | 0 | Runtime per-character pet instances (`tid`, exp, name, colorCode, qLevel). |
| [TBL_PET_SKILL](details/TBL_PET_SKILL.md) | 40 | 0 | Runtime per-pet skill slots (grouped by `pid`). |
| [TBL_PET_SLOT](details/TBL_PET_SLOT.md) | 41 | 0 | Runtime per-pet soul-socket slots (grouped by `pid`). |
| [TBL_PETFIGHT](details/TBL_PETFIGHT.md) | 81 | 0 | Runtime Pet Fight arena battle records (`replayPetFight`). |

## Mounts & Cosmetics

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_MOUNT](details/TBL_MOUNT.md) | 96 | 33 | Mount dress upgrade-level ladder: skins, EXP caps, material costs, level gates, stat bonuses. |
| [TBL_MOUNT_DRESS](details/TBL_MOUNT_DRESS.md) | 97 | 18 | Mount costume catalog: name, asset codes, gold price, optional duration, stat bonuses. |
| [TBL_DRESS](details/TBL_DRESS.md) | 104 | 93 | Fashion wardrobe (costumes + flyers): visual `equiptId`, activation costs, up to 4 stat grants, recipe links. |
| [TBL_FAIRY_TEMPALTE](details/TBL_FAIRY_TEMPALTE.md) | 86 | 17 | Fairy companion species templates: base stats + per-level growth rates, sprite/colour codes. |
| [TBL_FAIRY](details/TBL_FAIRY.md) | 87 | 0 | Runtime per-character fairy instances (`tid`, exp, state, stats + growth). |
| [TBL_DECORATE](details/TBL_DECORATE.md) | 121 | 0 | Decorate/rune/mystery-treasure system; pure server-push channel, `GameData.d[121]` never read. |

## Enhancement Systems

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_CARVE](details/TBL_CARVE.md) | 138 | 960 | Per-node upgrade steps for the Văn Chỉ (KP) carving system; ID encodes part/icon/level. |
| [TBL_CARVE_AWARD](details/TBL_CARVE_AWARD.md) | 139 | 150 | Văn Chỉ floor-milestone rewards (item, KP, free/paid exchange quotas). |
| [TBL_CARVE_MASTER](details/TBL_CARVE_MASTER.md) | 140 | 48 | Master-level permanent stat bonuses (up to 5 prop/value pairs). |
| [TBL_DECO_HOLE](details/TBL_DECO_HOLE.md) | 118 | 204 | Upgrade levels for the 4 Hồn Khí rune-hole slots (stat bonus, cost, success rate per level). |
| [TBL_DECO_RUNE](details/TBL_DECO_RUNE.md) | 119 | 1520 | Phù Văn rune gems socketed into holes (one named rune × quality × level, with XP/stat). |
| [TBL_DECO_SHOW](details/TBL_DECO_SHOW.md) | 120 | 20 | Hồn Khí decorative gear: 4-position cosmetic with stat bonuses, suit grouping, visuals, duration. |
| [TBL_RUNE_CHIP](details/TBL_RUNE_CHIP.md) | 124 | 76 | Mảnh Vỡ Phù Văn chip fragments exchangeable for runes. |
| [TBL_PRS_TREE](details/TBL_PRS_TREE.md) | 125 | 50 | 50-level PRS Spirit talent tree; soul-stone cost + up to 8 cumulative stat bonuses per node. |
| [TBL_PRS_SHOW](details/TBL_PRS_SHOW.md) | 126 | 22 | 22 unlockable PRS spirit skins (chip-exchange / item tabs), each up to 8 stat bonuses. |
| [TBL_PRS_CHIP](details/TBL_PRS_CHIP.md) | 127 | 10 | 10 fragment chips exchangeable for PRS show spirits at a crystal cost. |
| [TBL_MYSTRE](details/TBL_MYSTRE.md) | 123 | 720 | Mystery Treasure equips (11 kinds × 6 levels × 3 star tiers); single stat bonus + dissolution value. |
| [TBL_MYSTRE_RECIPE](details/TBL_MYSTRE_RECIPE.md) | 122 | 66 | Mystery Treasure crafting recipes (up to 6 ingredient triplets → element output). |
| [TBL_SOUL](details/TBL_SOUL.md) | 116 | 100 | 100-level soul-awakening progression (point threshold + 10 stat bonuses per level). |
| [TBL_STARS_TEMPLATE](details/TBL_STARS_TEMPLATE.md) | 88 | 144 | 12 zodiac types × 12 levels of star cultivation (addProp/value, level/money/time/exp reqs). |
| [TBL_ARTIFACT](details/TBL_ARTIFACT.md) | 102 | 300 | Magic Weapon Stage upgrades (6 templates × 50 stages); spirituality + catalyst cost, success rate. |
| [TBL_ELEMENT_TEMPLATE](details/TBL_ELEMENT_TEMPLATE.md) | 16 | 0 | Empty; element-item templates referenced as crafting outputs in TBL_MYSTRE_RECIPE. |
| [TBL_ELEMENT_JEWEL](details/TBL_ELEMENT_JEWEL.md) | 17 | 0 | Empty; elemental jewel sub-variant/instance table (indexed by `eid`). |

## Crafting & Medals

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_RECIPE](details/TBL_RECIPE.md) | 105 | 185 | Named costume/fashion recipe blueprints; drives `exchangeRecipe` RPC and recipe UI. |
| [TBL_RECIPE_PLAN](details/TBL_RECIPE_PLAN.md) | 106 | 362 | Per-recipe ingredient/output plan rows (`recipeId` → TBL_RECIPE). |
| [TBL_MINERAL_TEMPLATE](details/TBL_MINERAL_TEMPLATE.md) | 83 | 10 | Farm creature templates: sprite assets, harvest item (`tid`), quantity, cooldown, shop price. |
| [TBL_MYTC_SUIT](details/TBL_MYTC_SUIT.md) | 142 | 8 | 8 Mặc Ý Tụ Cẩm fashion-crafting suit groups (up to 3 equip templates each). |
| [TBL_MYTC_DETAIL](details/TBL_MYTC_DETAIL.md) | 143 | 80 | Per-suit, per-level (1–10) stat-bonus rows; `c1–c6` encode class-specific prop pipe-lists. |
| [TBL_EXPLORER_MEDAL](details/TBL_EXPLORER_MEDAL.md) | 137 | 100 | 100-level Explorer Medal tiers (silver/gold cost, up to 8 stat bonuses). |
| [TBL_MEDAL](details/TBL_MEDAL.md) | 98 | 573 | Ấn Chương (seal/medal) templates organized into `basicTid` lineages (upgrade EXP, quality, synthesis). |
| [TBL_JEWEL_TEMPLATE](details/TBL_JEWEL_TEMPLATE.md) | 31 | 0 | Empty; jewel template definitions absent in this build (handled via TBL_ITEM_TEMPLATE). |
| [TBL_JEWEL_INSTANCE](details/TBL_JEWEL_INSTANCE.md) | 30 | 0 | Empty; runtime per-player socketed jewel instances. |

## Character & Account

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_CLASS](details/TBL_CLASS.md) | 11 | 6 | 6 playable class templates: base attrs, aptitude growth, gender res/icon codes, lore, starting items/skills. |
| [TBL_TITLE](details/TBL_TITLE.md) | 59 | 472 | Player title definitions: display name, nameplate style, buff ID, kind, rank. |
| [TBL_NAME_LIB](details/TBL_NAME_LIB.md) | 80 | 15834 | Random name generator pool (Vietnamese syllables partitioned by `type`). |
| [TBL_EXTEND_POSITION](details/TBL_EXTEND_POSITION.md) | 71 | 11 | Fixed world spawn positions for building-type objects (map, template, coords, direction, layer). |
| [TBL_CHARACTOR](details/TBL_CHARACTOR.md) | 2 | 0 | Runtime per-character record: stats, position, gold, title, cosmetics, progression. |
| [TBL_ACCOUNT](details/TBL_ACCOUNT.md) | 0 | 0 | Runtime account record (account ID, email index, account level). |
| [TBL_CHARACTOR_SLOT](details/TBL_CHARACTOR_SLOT.md) | 9 | 0 | Runtime character inventory: one record per bag/equip slot (item ref, type, bind). |
| [TBL_CHARACTOR_INTERFACE](details/TBL_CHARACTOR_INTERFACE.md) | 4 | 0 | Runtime character UI settings (chat flags, effects/model toggles, FPS, music). |
| [TBL_CHARACTOR_TITLE](details/TBL_CHARACTOR_TITLE.md) | 10 | 0 | Runtime character title ownership (which TBL_TITLE entries are unlocked). |
| [TBL_CHARACTOR_PLAN_TYPE](details/TBL_CHARACTOR_PLAN_TYPE.md) | 6 | 0 | Runtime character build-plan selection (opaque; constant registered, no field usage). |

## Progression & Systems

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_AWAKENING](details/TBL_AWAKENING.md) | 113 | 77 | Awakening levels: gold+item cost, success rate, up to 2 stat bonuses, milestone skill-point grants. |
| [TBL_AWAKENING_SKILL](details/TBL_AWAKENING_SKILL.md) | 114 | 36 | 6 passive awakening skills per class: point cost, class/position filter, maxLevel, prereq. |
| [TBL_ACHIEVEMENT](details/TBL_ACHIEVEMENT.md) | 74 | 604 | Achievement definitions with kind/type dual-index, color tiers, claim state, enable gate. |
| [TBL_ACHIEVEMENT_REQUIRE](details/TBL_ACHIEVEMENT_REQUIRE.md) | 75 | 739 | Per-achievement completion conditions; `showType` controls rendering; `aid` → TBL_ACHIEVEMENT. |
| [TBL_GUIDE](details/TBL_GUIDE.md) | 79 | 46 | New-player tutorial step definitions; sequence engine in `Core.as` + `saveGuideLog` RPC. |
| [TBL_DIARY](details/TBL_DIARY.md) | 85 | 44 | Daily activity task catalog: act-point rewards, daily cap, NPC/panel shortcuts. |
| [TBL_FEAST](details/TBL_FEAST.md) | 67 | 32 | Seasonal festival event records (display fields, server schedule, gift-claim RPC). |
| [TBL_PM_RIGHT](details/TBL_PM_RIGHT.md) | 95 | 35 | VIP privilege rows: `value1–9` per tier, `vip1–9` enable flags, interaction modes, daily caps. |
| [TBL_BUILDING](details/TBL_BUILDING.md) | 70 | 18 | Guild/estate building templates: level chain, pre/post prereqs, stat grants, embedded `funcScript`. |

## Social & Guild

| Table | ID | Records | Purpose |
|---|---|---|---|
| [TBL_GUILD](details/TBL_GUILD.md) | 23 | 0 | Runtime guild record: identity, leader, finances, member capacity, bag-slot tier. |
| [TBL_GUILD_MEMBER](details/TBL_GUILD_MEMBER.md) | 25 | 0 | Runtime membership row: character↔guild link, rank, packed note, contrib points, online status. |
| [TBL_GUILD_RANK](details/TBL_GUILD_RANK.md) | 26 | 0 | Runtime per-guild rank-tier config: display name + 6 binary permission flags. |
| [TBL_GUILD_SLOT](details/TBL_GUILD_SLOT.md) | 27 | 0 | Runtime guild-warehouse item slots (position, item instance, stack, type). |
| [TBL_MARRIAGE](details/TBL_MARRIAGE.md) | 76 | 0 | Runtime marriage-seeking posts / directed proposals. |
| [TBL_COUPLE](details/TBL_COUPLE.md) | 78 | 0 | Runtime committed-couple record (male/female IDs+names, timestamp, ceremony type). |
| [TBL_WEDDING_BOOK](details/TBL_WEDDING_BOOK.md) | 77 | 0 | Runtime wedding bookings (couple, scheduled date, server-line, guest-entry flag). |
| [TBL_RELATIONSHIP](details/TBL_RELATIONSHIP.md) | 48 | 0 | Runtime directed social-graph row (other, type: friend/blacklist/enemy/tutor/sworn). |
| [TBL_FEEDBACK](details/TBL_FEEDBACK.md) | 22 | 0 | Runtime player feedback/report table (indexed by session guid). |
| [TBL_BATTLE_REPORT](details/TBL_BATTLE_REPORT.md) | 84 | 0 | Runtime battle-result log (transient callback payloads; no persistent client table). |
| [TBL_FARM](details/TBL_FARM.md) | 82 | 0 | Runtime per-character farm record (owner, exp/level, plot count + per-plot mine state). |

---

*Generated by parallel client-research agents. Source of truth: `docs/client/` (ActionScript) + `docs/database/game_data/` (JSON). No server/Go code consulted, per scope.*
