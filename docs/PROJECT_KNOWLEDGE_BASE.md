# MCGame Server - Project Knowledge Base

This file is an **index** of per-feature memory documents under `docs/memory/`. Each linked file is the authoritative source for that feature. When new learnings are merged, update or create the matching `docs/memory/<feature>.md` file — never edit this index to hold new content. Add a new bullet here only when you create a brand-new memory file.

> Last reorganized: 2026-05-03 (knowledge base split per feature).

## Game-Data Tables (full reference)

- [Game-Data Table Index](database/INDEX.md) — master index of **all 133 tables** in `docs/database/game_data/`, grouped by category, each linking to a per-table doc in `docs/database/details/<TBL>.md` documenting every key/column (type + function). Recovered from the Flash client (`docs/client/`) + JSON dumps. Gold-standard format: [TBL_MAP](database/details/TBL_MAP.md). The per-feature bullets below link individual table docs where relevant.

## Architecture & Protocol

- [Architecture & Protocol](memory/architecture-protocol.md) — RTMP/AMF0, channel isolation, creature hierarchy, RTMPE v6 fixes.
- [Login & Auth Flow](memory/login-auth-flow.md) — deployment modes, connection handling, character list, chooseCharactor, force-login, dual-device, kick, secondary password.
- [Handler Package Structure](memory/handler-package-structure.md) — feature directory layout under `internal/presentation/rtmp/handlers/`.
- [Application Services](memory/application-services.md) — full list of `internal/application/*` services and responsibilities.
- [RPC Reference](memory/rpc-reference.md) — rate limits, settings RPC, pet element payloads.
- [JSON Naming Convention](memory/json-naming.md) — camelCase rules for Flash compatibility.

## Battle, Combat & Skills

- [Battle & Combat System](memory/battle-combat.md) — turn flow, command handling, skill backend, animation effects, BattleService worker, damage formula, encounter balance, revive, solo-vs-pet, client protocol alignment.
- [PvP / APVP Gating](memory/pvp-apvp.md) — minimap PK toggle, PVPStartClient, target opt-in, 25s deadline.
- [Cross-Server Battle Flow](memory/cross-server-battle.md) — original-server vs battle-server routing.
- [Movement & Position](memory/movement-position.md) — udcp speed validation.
- [Group / Party System](memory/group-party.md) — invite/join/leave, leader transfer, AFK, transport follow-through, mList rules.

## Items, Equipment & Crafting

- [TBL_ITEM_TEMPLATE](database/details/TBL_ITEM_TEMPLATE.md) — 6468-row item catalog: type/kind/bindType/useType/propType/i1-i3/n1-n3 crafting pairs, jewel upgrade chains, duration field `t` semantics.
- [TBL_ITEM_INSTANCE](database/details/TBL_ITEM_INSTANCE.md) — runtime item-in-bag instances (empty static export); instance fields confirmed from AS client (tid, t expiry, color, binded, f, sid, stackNum, slotData short fields).
- [TBL_RECYCLING](database/details/TBL_RECYCLING.md) — Mystery Furnace recycle-value rules; type=1 rows keyed by itemId+color, type 2-18 rows are score-currency entries.
- [Item & Inventory System](memory/item-inventory.md) — item kinds, SID boundaries, flag fields, mixing, quality/prefix, display contract, item handler RPCs, potion healing, UseItem registry.
- [Equipment Tooltip Subsystems](memory/equipment-tooltip.md) — TipEquip, soul activation, stat bonuses, signature set, suit/jewels/sublimation/Ky Linh/pet stones, hole sockets, equip/unequip flow.
- [Equipment Modifications](memory/equipment-modifications.md) — change soul, change bind, disassemble (equResolve), star upgrade, change-level tier upgrade.
- [Crafting System](memory/crafting-system.md) — getMakeColor preview, quality tiers, custom material rates, prefix rules, maker signature, random elements, change-prefix, orange notice.
- [Bag/Bank Tab Routing](memory/bag-bank-tabs.md) — `moveItemToPage` for PAGE_TYPE_BAG / PAGE_TYPE_BANK.
- [Magic Weapon (Thần Khí)](memory/magic-weapon.md) — main + sub MW, slots 15-20, properties JSONB, stage tier, skills, two-phase reset, succinct, trans, resolve, repair.
- [HP/MP Bulk Recovery Targeting](memory/recovery-targeting.md) — fullHpRecoverByItem / fullMpRecoverByItem.

## Pets

- [Pet System](memory/pet-system.md) — leveling, attribute points, life meter, cache read order, client-state contract, slot opening, follow scene, skill slot opening, pet guard, skill book, eligibility, equipment, bind/skill-delete, bag summon.
- [Pet Guard](memory/pet-guard.md) — 5×5 slot grid, `upGuardSid` gold-cost upgrade flow, petguardout token follow-up.
- [Pet PVE](memory/pet_ppve.md) — Không Gian Điêu Khắc tower: login wire (petPVEData/petTalentInfo/petStoneBag populated from state), 6 panel RPCs, tiered gold + KP exchanges, two-marker daily reset, deferrals.

## Progression & Systems

- [TBL_ACHIEVEMENT](database/details/TBL_ACHIEVEMENT.md) — 604 achievement definitions; kind/type dual-index, color tiers, isAward claim state, enable gate.
- [TBL_ACHIEVEMENT_REQUIRE](database/details/TBL_ACHIEVEMENT_REQUIRE.md) — 739 completion conditions per achievement; showType (hidden/enum/progress), aid→TBL_ACHIEVEMENT FK.
- [TBL_GUIDE](database/details/TBL_GUIDE.md) — 46 new-player tutorial steps; type-sequence engine in Core.as, saveGuideLog RPC, promptType bubble/alert.
- [TBL_DIARY](database/details/TBL_DIARY.md) — 44 daily activity tasks; act points, max daily cap, linkType NPC/panel shortcut, updateDiaryData push.
- [TBL_FEAST](database/details/TBL_FEAST.md) — 32 seasonal festival events; na/inf/aw/at fields; getCurrentFeast + takeFeastGift RPC pair.
- [TBL_PM_RIGHT](database/details/TBL_PM_RIGHT.md) — 35 VIP privilege rows; value1-9 per tier, vip1-9 enable flags, type 1/2/3/4, countConfig daily cap.
- [TBL_BUILDING](database/details/TBL_BUILDING.md) — 18 guild/estate building templates; codeName level-chain, pre/postBuilding prereqs, prop1-4 stat grants, funcScript embedded AS.

## Quests, NPCs & Achievements

- [NPC & Quest System](memory/npc-quest-system.md) — NPC types, healing, quest templates, objective types, visibility filter, questLog injection.
- [Quest Battle Rules](memory/quest-battle-rules.md) — type 20 vs type 10 NPC quest battles, tracker name fix, accept-time handoff items.
- [Quest Start Grants](memory/quest-start-grants.md) — `data_tbl_quest.start_grant_item` catalog-driven accept-time item grants.
- [Class-Rank Promotion](memory/class-rank-promotion.md) — `cl ∈ {0..5}` Kiến Tập→Tông Sư progression, class-quest auto-bump, skill `req_c_l` gate, `onUPP({cl})` toast.
- [Achievement System](memory/achievement-system.md) — login snapshot, getAchieveAward claim flow, title-style rewards.
- [TBL_QUEST](database/details/TBL_QUEST.md) — 5530 quest templates; type/subType enum, lifecycle (pre→require→award), level/class/rebirth gates, moneyType reward currency, at award-mode.
- [TBL_QUEST_AWARD](database/details/TBL_QUEST_AWARD.md) — 1437 award rows keyed by qid; kind (item/pet/skill), type (table ref), q (quality gate), b (bound flag).
- [TBL_QUEST_REQUIRE](database/details/TBL_QUEST_REQUIRE.md) — 4765 objective rows keyed by qid; kind (collect/kill/pet), type (table ref), q (quality constraint).
- [TBL_QUEST_PRE](database/details/TBL_QUEST_PRE.md) — 2007 prerequisite rows; kind (item/prior quest), preQuestType AND/OR logic in TBL_QUEST.
- [TBL_QUEST_LOOP](database/details/TBL_QUEST_LOOP.md) — 11 repeatable loop-quest series; nid NPC, num rounds, refresh cooldown, team composition, server-side scriptGet/scriptGiveUp.
- [Quest Loop System](memory/quest-loop-system.md) — TBL_QUEST_LOOP + type=7 "Nhiệm Vụ Vòng" repeatable series, takeLoop/cancelLoop/loopRepaire RPCs, type-1 cancel guard, type-6 daily re-take gating, Trị An/Trừ Ma loop-boss summon.
- [TBL_ANSWER](database/details/TBL_ANSWER.md) — 3627 quiz questions; t/a/b/c/d/r fields for Maze and Answer panel events.
- [TBL_CHARACTOR_QUEST](database/details/TBL_CHARACTOR_QUEST.md) — runtime per-character active quest state (empty static export); fields confirmed from AS client.
- [TBL_CHARACTOR_QUEST_KILL](database/details/TBL_CHARACTOR_QUEST_KILL.md) — runtime per-character kill-progress counters (empty static export); charactorQuestId + num fields confirmed.

## Titles

- [Title System](memory/title-system.md) — `data_tbl_title` schema, title→buff `bd` payload, catalog wiring.

## Social Relationships

- [Social Relationships](memory/social-relationships.md) — `player.friends.type` column, `get_typed_relationships` DB function, tutor handler follow-up.

## Guild

- [Guild System](memory/guild-system.md) — domain layout, DB schema, 18-key wire shape (M5 parity), skillData flow, stubs/open questions for iconCode/daliyCost/etc.

## Magic Crystal

- [Magic Crystal](memory/magic-crystal.md) — Pháp Tinh 4-slot panel persisted via stat-feature JSONB (`feature_key='magic_crystal'`).

## Hắc Diệu Thạch

- [Heiyaoshi (Hắc Diệu Thạch)](memory/heiyaoshi.md) — 20-figure two-stage progression panel, two pools (`heiyaoshiPoint`/`heiyaoshiPoint2`), state-blob `feature_key='heiyaoshi'`, topology extracted via `cmd/extract-heiyaoshi`.

## Chiến Hồn Bạo Nộ

- [War Sprite (Chiến Hồn)](memory/warsprite.md) — 8-slot × 2-tab progression panel, two stones (`warSprite`/`battleSprite`), `feature_key='war_sprite'`, no new schema (reuses `character_stat_features`).

## Ma Vật Tâm

- [Monster Heart (Ma Vật Tâm)](memory/monster-heart.md) — 5-box × 7-hole panel; `monsterHeartSet`/`monsterHeartReMove` RPCs; `feature_key='monster_heart'`; pushes `onInitViewProp` + `updateMonsterHeartPanel`.

## Marriage

- [Marriage System](memory/marriage-system.md) — `player.marriages` schema, request/respond flow, `marriage_audit_log`, divorce/wedding-scheduling follow-ups.

## Star (Cung Hoàng Đạo)

- [Star System](memory/star-system.md) — 12 zodiac × 12 levels, Begin/Finish/Cancel lifecycle, stat-feature `feature_key='stars'` JSONB.
- [Star Instance System](memory/star-instance-system.md) — Tinh Giới Thập Nhị Cung 12×12 PvE grid, daily attempts, lifetime scores, starPnt awards.
- [Astrology System](memory/astrology-system.md) — 12-cung pick/refresh panel (getAstrologicData/refreshStars/pickStar), `feature_key='magic_array'` JSONB, formula award eval.
- [Mystery Treasure (Mật Bảo)](memory/mystery-treasure.md) — bag fetch RPCs (onGetMysBookData/onGetMysMakeData/onGetMysBagData/onGetChipBagData/getMysTreBuffByKind/getMysTreBuffSimpleData), `feature_key='mystery_treasure'` JSONB, shared BagToWire encoder, updateMysTreBag outbound helper.

## Stats, Aptitude & Buffs

- [Unified Stat Formula](memory/unified-stat-formula.md) — `stats.BuildBaseStats(Profile)`, shared coefficients, character/pet/creature/boss inputs, life multiplier.
- [Aptitude Stats System](memory/aptitude-stats.md) — base/aptitude/evolution/final stat layers.
- [Stat Feature Foundation](memory/stat-feature-foundation.md) — `data_tbl_stat_feature` catalog, character/pet feature state tables, awakening/soul/mount/etc.
- [Buff System](memory/buff-system.md) — `player.character_buffs`, initLongBuff/upLongBuff/delBuff, PM right 3 wiring.
- [EXP & Level-Up](memory/exp-leveling.md) — SendExpAndLevelUpCallbacks, BuildUPPPayload, /stat command, slot semantics, gold int4→bigint fix.

## Element, Dress & Appearance

- [Element System](memory/element-system.md) — 0-6 enum, character ee/en/ef, change-element flow, star progression placeholders.
- [Dress System](memory/dress-system.md) — recipes, chips, makeAllChips, dressInfo seeding, fake/hide costume resolution, transform suppression, dress-book stat bonuses, recieveGoods.
- [Chat Link Formatter](memory/chat-link-formatter.md) — EQ/IT anchor rebuild, tokenized link expansion.

## Creatures & Combat

- [TBL_CREATURE](database/details/TBL_CREATURE.md) — monster/pet template; classId/classIds, element, aptitude growth, capture difficulty, combat props, and asset codes.
- [TBL_CREATURE_SKILL](database/details/TBL_CREATURE_SKILL.md) — creature-to-skill loadout mapping; indexed by cid, links TBL_CREATURE → TBL_SKILL.
- [TBL_CREATURE_LOOT](database/details/TBL_CREATURE_LOOT.md) — creature drop table; per-item rate (1/10 000), quest gate, bind-on-drop flag.
- [TBL_CREATURE_HANDBOOK](database/details/TBL_CREATURE_HANDBOOK.md) — pet compendium entries; collection threshold, stat bonus, habitat map, evolution chain, handbook skills.
- [TBL_CRE_POINT](database/details/TBL_CRE_POINT.md) — creature point accumulation (empty static export); runtime/instance-scoped, LINK_TYPE="EL".

## NPCs & Spawns

- [TBL_NPC](database/details/TBL_NPC.md) — all world NPCs; type, position, sprite, shop/quest/transport/script config, availability schedule.
- [TBL_NPC_SKILL](database/details/TBL_NPC_SKILL.md) — NPC-to-skill loadout mapping; indexed by nid, links TBL_NPC → TBL_SKILL.
- [TBL_NPC_CREATURE](database/details/TBL_NPC_CREATURE.md) — creature encounter roster for NPC battle nodes; probability range, boss tier, XP tuning.
- [TBL_MAP_CREATURE](database/details/TBL_MAP_CREATURE.md) — open-world creature spawn table per map; probability range, battleMode, withCloud gate.
- [TBL_NPC_PLAN](database/details/TBL_NPC_PLAN.md) — NPC-to-loot-plan mapping (empty static export); indexed by npcId.
- [TBL_NPC_QUEST](database/details/TBL_NPC_QUEST.md) — NPC-to-quest mapping (empty static export); indexed by nid, server-side join table.

## Mounts & Cosmetics

- [TBL_MOUNT](database/details/TBL_MOUNT.md) — mount dress upgrade-level ladder; type 1=base skin rows, type 2=upgrade steps with exp/itemNum/dressId.
- [TBL_MOUNT_DRESS](database/details/TBL_MOUNT_DRESS.md) — mount costume catalog; name, resCode, iconCode, gold price, effectiveTime, stat bonuses.
- [TBL_DRESS](database/details/TBL_DRESS.md) — fashion wardrobe (costumes + flyers); equiptId visual link, prop1-4 stat grants, activation costs, recipes.
- [TBL_FAIRY_TEMPALTE](database/details/TBL_FAIRY_TEMPALTE.md) — fairy companion species templates; base stats (sta/ste/agi/inte/ener) and per-level growth rates.
- [TBL_FAIRY](database/details/TBL_FAIRY.md) — runtime fairy instances (empty static export); instance fields confirmed from AS client.
- [TBL_DECORATE](database/details/TBL_DECORATE.md) — decorate/rune/mystery-treasure panel (empty static export); server-driven via initDecoratePanel RPC.
- [TBL_SCENEITEM_TEMPLATE](database/details/TBL_SCENEITEM_TEMPLATE.md) — world scene-object templates; type 3=teleport portals (interactive), type 2001=decorative props; resCode drives SWF asset load.
- [TBL_SCENEITEM_INSTANCE](database/details/TBL_SCENEITEM_INSTANCE.md) — 1094 placed scene-object instances; posMapId secondary index; tid→TBL_SCENEITEM_TEMPLATE; posX/posY/layer/posDir placement fields.

## Activity Panels & VIP

- [Activity System](memory/activity-system.md) — Send Combine + Boss Daily buttons, real Send Combine payload, buySendCombine, DB-backed activity list, icon starter RPCs, historical compatibility backlog.
- [Boss Daily Panel](memory/boss-daily.md) — `bossDailyGetData` + `onOpenBossDailyPanel` payload.
- [Schedule Boss System](memory/schedule-boss.md) — per-channel ground-boss respawn loop with cooldown-based scheduler, kill hook in `combat.EndBattle`, and scene-join dead-boss filter.
- [Boss Loot System](memory/boss-loot.md) — unified `data_tbl_boss_loot` shared by schedule + daily kills, canonical `schedule_boss.nid` key, `BossContext` on `combat.Battle`, kill detection in `combat.EndBattle`. Also covers the box-items-style `type` dispatch (30/31/35) used by both boss_loot AND creature_loot for currency / exp / wallet drops + the admin editor at `/dashboard/boss-loot`.
- [Daily Sign-In](memory/daily-signin.md) — modern `DailySignInPanel` + legacy `SignInPanel`, single per-month ledger, Gold-priced retroactive/crit, `inc` reward pools.
- [Daily Act Panel](memory/daily-act.md) — DailyActPanel diary tasks, vitality points, activity-chest claim, and `updateDiaryData` push.
- [VIP Shop](memory/vip-shop.md) — getVipShopConfig contract, slot fields, activity icon visibility.
- [PM / VIP System](memory/pm-vip-system.md) — VIP persistence, buyPm, daily PM exp, doPmOperation, PM right rewards.
- [PM Reward Binding & Right 13 Transform](memory/pm-reward-binding.md) — bound-policy alignment, daily transform via TBL_CREATURE.

## Shops & Economy

- [Shop System](memory/shop-system.md) — direct NPC routing, shop purchase bag-slot sync.
- [Currencies (moneyType ↔ DB ↔ DTO)](memory/currencies.md) — KV persistence model, DTO/moneyType key alignment, Flash hasOwnProperty trap, Vietnamese label sources.
- [TBL_SHOP](database/details/TBL_SHOP.md) — 121-row shop directory; type 1=NPC gold/money shops, type 2=event/point shops; sid primary key.
- [TBL_SHOP_SLOT](database/details/TBL_SHOP_SLOT.md) — 2542 purchasable item slots; multi-currency pricing (gold/money/point/pType1-2), amount limits, st visibility flag.
- [TBL_CREDIT](database/details/TBL_CREDIT.md) — 252 NPC score-exchange entries; cType1/cNum1 score currency cost, limitType per-player purchase caps, bind-on-exchange.

## Economy & Loot

- [TBL_PLAN](database/details/TBL_PLAN.md) — 31630 loot/drop plan entries; ti+ii item reference, r drop rate, n quantity, st source-type-id compound index key.
- [TBL_PLAN_KIND](database/details/TBL_PLAN_KIND.md) — plan category table (empty static export); GamePredef id=62.
- [TBL_PLAN_REQUIRE](database/details/TBL_PLAN_REQUIRE.md) — plan prerequisite table (empty static export); pid→TBL_PLAN, GamePredef id=44.
- [TBL_PLAN_AWARD](database/details/TBL_PLAN_AWARD.md) — supplemental award table (empty static export); pid→TBL_PLAN, GamePredef id=43.
- [TBL_AUCTION](database/details/TBL_AUCTION.md) — auction house runtime table (empty static export); ownerId/itemKind/itemType indexes; fields from AuctionPanel.as.
- [TBL_MAIL](database/details/TBL_MAIL.md) — player inbox runtime table (empty static export); receiverId index; fields from MailPanel.as.

## Farm & Life Skill

- [Farm & Life Skill](memory/farm-life-skill.md) — farm domain, vigor model, visual stage overlays, planting one-plot rule, seed gates, life-skill (Trồng Trọt) book learning, upgrade flow, PlantDex sync.

## Database, Cache & Infrastructure

- [Gateway Config & Runtime Config](memory/gateway-config-runtime.md) — `public.gateway_config` + `server_settings` / `game_tuning` / `gm_settings` tables, LISTEN/NOTIFY hot-reload, mode collapse to monolith/line, dashboard CRUD pages.
- [Database & Infrastructure](memory/database-infrastructure.md) — Supabase deployment, dev compose, Redis cache, giftcode tables, infra layer, migrations, game-data export, seed sync, missing-cell remediation, character table split, DB-function workflow.
- [Cache Write-Behind Contract](memory/cache-write-behind.md) — `Cached*Repository.Update` write-behind, quest repo wiring, debug player-data dump flag.
- [Resource Hash Restore Workflow](memory/resource-hash-workflow.md) — `restore_resources`, `crawl-res`, missing-path backfill.

## Admin Dashboard

- [Dashboard](memory/dashboard.md) — send-item, sessions API, data sources, box-items management, pet filter, player-management redesign, items/pets tabs.

## Tooling & Roadmap

- [Development Roadmap](memory/development-roadmap.md) — 12-phase roadmap status as of 2026-04-04.

## Monitoring

- [Monitoring](memory/monitoring.md) — Grafana / Prometheus / exporters, app metrics, alerting thresholds.

## Live-Log Wire-Protocol Study

- [Live-Log Protocol Overview](research/2026-05-29_01_LIVELOG_PROTOCOL_OVERVIEW_RESEARCH.md) — master index for the max-level (PigHero0206) RTMPE/AMF0 capture study: source & method, direction semantics, login→play sequence, OUT/IN catalog, links to the 13 sub-docs (#02–13), the Go parity gap matrix (#14), and the implementation plan.

---

## Working with this knowledge base

- After implementing a feature, find the matching `docs/memory/*.md` file and append/update the relevant section.
- If a feature does not have a memory file yet, create a new file under `docs/memory/<feature-name>.md` and add a one-line entry to this index above.
- Do not embed feature notes back into this index file — the index is intentionally short and link-only so it stays scannable.
- Cross-feature notes (e.g. a battle change that also touches pets) should be split: put each feature's part in its own memory file and cross-link with relative paths like `[Pet System](pet-system.md)`.
- Security-sensitive learnings live in `docs/research/2026-05-02_01_SECURITY_EXPLOIT_VALIDATION.md` and `docs/research/2026-05-02_02_FMS_CLIENT_SQLI_EXPLOITS.md`; the rules they encode appear in `CLAUDE.md` / `AGENTS.md`.
