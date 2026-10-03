# NPC & Quest System

## NPC & Boss System

NPC handlers are in their own `npc` package (`internal/presentation/rtmp/handlers/npc/`) with dedicated files: `handler.go`, `npc_click.go`, `npc_interaction.go`, `npc_script.go`, `npc_func_other.go`.

NPC Classification (4 legacy types): NPCTypeNormal=1 (attackable), NPCTypeShop=2 (shop), NPCTypeQuest=3 (quest giver), NPCTypeBoss=4 (boss). Full NPCType enum has 29 types (see `architecture-protocol.md`).

Spawn Mechanisms: Static spawn (loaded from `player.npcs` table at map entry, sent via `createNpcs`). Dynamic spawn (boss by respawn timer, creatures by spawn rate from `TBL_MAP_CREATURE`).

MapCreatureTemplate fields: ID, Mid (map ID), Cid (creature ID), Level, BossFlag (1=boss), StartRate/EndRate (spawn percentage range), Exp, ExpMulti, BattleMode, UniqueFlag, QLevel.

CreatureTemplate fields: ID, Name, ClassID, QLevel, UseLv, attributes, aptitudes, combat properties, Skills (pipe-delimited), Catchable, GrowBase, Life, visual codes.

Combat Flow: Click NPC (`clickNpc` RPC) -> server checks type -> `hitNpc` RPC -> server creates battle -> turn-based processing -> rewards on victory.

## NPC Handler RPCs

`clickNpc`, `npcScript`, `npcFuncClick`, `npcFuncOther`. NPC handlers were separated from the combat package into their own `npc` package.

## NPC Healing System

Implemented `npcFuncOther` RPC handler for NPC type 8 (Heal).

Flow: Player clicks NPC -> `clickNpc` -> server sends `npcFuncInit` with `npcType: 8` -> client opens NpcFuncOther panel with options: ID 1=Heal character, ID 2=Heal pet (stub), ID 3=Heal both -> player confirms -> `npcFuncOther(npcId, funcId)` -> server validates, calculates cost, deducts money, restores HP/MP.

Cost Formula: `costMultiplier = min(BASIC_GET_MONEY[level] / 70000, 1)`, `healCost = ceil((missingHP + missingMP * 1.3) * costMultiplier)`. Uses `moneyBind` (ngan phieu) as default currency.

## Quest System

QuestTemplate fields: ID, Name, Type (1=main, 2=daily, 3=loop/class, 9=callboard), MinLevel, MaxLevel, StartNPC, FinishNPC, PreQuestType, Info, AwardExpRe, MoneyNum, MoneyType.

Objective Types (server `internal/domain/quest/objective.go`): KillMonster=1, CollectItem=2, TalkToNPC=3, ReachLevel=4, ExploreArea=5, UseItem=6, WinBattle=7, **SubmitPet=8**.

Server objective IDs intentionally differ from Flash `QUEST_REQUIRE_*` kinds (1=item / 2=creature / 3=pet). `GetInitialObjectives` maps TBL_QUEST_REQUIRE `kind` to the server enum and stores the row's `type` (TBL_ITEM_TEMPLATE=29 or TBL_EQUIPT_TEMPLATE=19) on `Objective.ItemTableType` and `q` on `Objective.Quality`. `Objective.ClientKind()` / `ClientTableType()` recover the Flash-side values for DTOs. See `internal/domain/quest/objective.go`.

Quest Flow: Click quest NPC -> GetNPCInteraction -> takeQuest RPC -> create QuestProgress. Progress updates: OnMonsterKilled, OnItemCollected, OnNPCInteracted. Completion: finishQuest RPC -> check all objectives -> give rewards.

Class Quest (type=3) dynamic rewards:

```text
completionIdx = completionCount % 10
EXP   = round((BASIC_GET_EXP[playerLevel] * CLASS_QUEST_MONEY_EXP_NUM[completionIdx] * 10) / 31.5)
Money = round((BASIC_GET_MONEY[playerLevel] * CLASS_QUEST_MONEY_EXP_NUM[completionIdx] * 3) / 31.5)
```

`CLASS_QUEST_MONEY_EXP_NUM`: `[0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5]`.

Callboard Quest (type=9) reward multiplier from `CALLBOARD_AWARD_NUM = [1, 2, 8, 12, 20]`: Color index 0=1x, 1=2x, 2=8x, 3=12x, 4=20x. `exp = template.awardExp * CALLBOARD_AWARD_NUM[color]`, `money = template.moneyNum * CALLBOARD_AWARD_NUM[color]`.

Money type mapping: case 0=Money (default), case 1=MoneyBind, case 2=Money, case 3=Gold, case 4=GoldBind.

Quest visibility filter (`CanAcceptQuestWithSnapshot`) mirrors Flash `Player.canTakeQuest` (Player.as:1824–1911):
1. Skip if active or already completed.
2. Effective level uses `RebirthLvl` when quest `is_rebirth > 0`, else `Level`. Reject outside `[min_level, max_level]`.
3. Quest `gender` uses Flash `GamePredef`: `0`=MALE, `1`=FEMALE, `2`=NONE. Reject only when `gender != 2` and `char.Gender != gender` — every seed row currently has `gender=2`, so an inverted check (e.g. `gender > 0 && char.Gender != gender`) silently filters every quest and a brand-new character sees no NPC quest icons or NPC dialog quests.
4. Reject if `req_class` (pipe-delimited) is set and excludes `char.ClassID`.
5. Walk `data_tbl_quest_pre`:
   - `kind=1` (item): require `CountCarriedItemsByTemplateID >= num` (always AND).
   - `kind=2` (quest): branch on `pre_quest_type` — `==1` requires every prereq quest finished (AND); `==2` requires at least one finished (OR). Any other value (including `0`) ignores `kind=2` rows entirely, mirroring the Flash client switch which only handles 1 and 2.

The Flash QuestManager "Can Take" panel filters quests entirely on the client via `Player.canTakeQuest`, which reads the pipe-delimited `player.questLog`. The server therefore injects `data["questLog"] = "|id1|id2|...|"` into the player UPP in `buildShowCharacterInfoPayload` (auth/characters.go), built from `quest_history` via `questService.GetCompletedQuestIDs`. The earlier `completedIds` field on `initQuestManager` is unused by the client (this field is unrelated to the loop system's newer `"l"` field on the same response, added by [Quest Loop System](quest-loop-system.md)).

M3 (2026-05-29): `questLog` is now also injected into `cData` in `buildOnChooseCharactorPayload` (auth/login.go L536) via `questService.BuildQuestLogString(ctx, charID)` — returns `|id1|id2|...|` (leading+trailing pipe) from completed quests. Without this every completed quest re-appears available at login. Top-level `qn` is now an int scalar (count of active quests) — NOT the `questDTOs` slice; the Flash `Player.qn:int` cannot coerce an array. Active quest DTOs are delivered exclusively by `initQuestManager` (quest/manager.go) which re-fetches them on demand.

M9 (2026-07-04): `GetCompletedQuestIDs` moved out of `service.go` into `internal/application/quest/daily_quest.go` and is no longer a plain passthrough to the repository — it now excludes type-7 loop-child ids always and excludes type-6 daily quests once their latest `quest_history` completion is more than a day old (so dailies re-open after their `character_quests` row is deleted on completion). `BuildQuestLogString` and every other quest-availability check (`CanAcceptQuest`, `GetAvailableQuestsForNpc`, `GetAvailableQuestsForCallBoard`) now call this filtered `Service.GetCompletedQuestIDs` instead of hitting `s.questRepo.GetCompletedQuestIDs` directly, so the date-aware exclusion applies everywhere "completed" gates re-take. See [Quest Loop System](quest-loop-system.md) for the full mechanism (an optional `completionDateRepository` interface, not a `quest.Repository` interface change, so no existing repo fakes needed updating).

## Quest Requirement Catalog (TBL_QUEST_REQUIRE)

Authoritative Flash source: `QuestPanel.checkBag/checkEquipt/checkPet` (`docs/client/view/view/compDragable/QuestPanel.as:975–1247`), `QuestCanvas.as:1040–1123`, `DataManager.as:626–693`, `Basic.colorByGrowRate / getColorByQuality`. Constants in `GamePredef.as:340–358` cap requirement kinds at 3 — no gold / achievement / level rows exist in the schema.

| kind | type | Meaning | Server objective | Active progress sync | Turn-in consumption |
|------|------|---------|------------------|----------------------|---------------------|
| 1 | 29 (TBL_ITEM_TEMPLATE) | Collect consumable / quest item | `ObjectiveCollectItem` + `ItemTableType=29` | `syncCollectObjectives` counts bag + quest-bag by template, optionally filtered by exact color when `q ≥ 0` | `ConsumeCarriedItemsByTemplate` (delete or shrink stack) |
| 1 | 19 (TBL_EQUIPT_TEMPLATE) | Collect equipment instance | `ObjectiveCollectItem` + `ItemTableType=19` + `Quality` | Same as above; equipment color filter is **exact match** `getColorByQuality(q)` per `QuestPanel.as:1104` | Same as above; equipment instances are deleted as stacks of 1 |
| 2 | 12 (TBL_CREATURE) | Kill `num` creatures of template `itemId` | `ObjectiveKillMonster` | Incrementally pushed by `OnMonsterKilled`; `questKill` array reports remaining | Not consumable |
| 3 | 12 (TBL_CREATURE) | Surrender owned pets of template `itemId` | `ObjectiveSubmitPet` + `Quality` | `syncCollectObjectives` walks `petRepo`, requires `pet.TemplateID==itemId AND pet.Name==creatureTemplate.Name AND colorByGrowRate(pet.growRate) ≥ colorByGrowRate(q/10)` | Lowest-`growRate` qualifying pet is deleted via `DeletePet` (moves equipped pet gear back to bag), `onDelPet` callback sent per consumed pet |

`q` semantics:
- Collect objectives (kind=1, both equipment and consumable rows): `q < 0` skips the color filter — most consumable rows use `q=-1`. `q >= 0` requires an **exact** colorCode match equal to `EquipmentColorCodeFromQuality(q)` (= `(q+4)/5`), mirroring Flash `Core.getItemNumByColor` and `QuestPanel.checkEquipt`.
- Pet submit (kind=3): threshold `growRate = q / 10` with a **≥** comparison. Most rows use `q=1` (any pet passes); meaningful tiers exist at `q=12` (≥ blue) and `q=15` (≥ blue/purple cutoff). Mapping table in `internal/domain/pet/quality.go::PetGrowRateBands = [1.1, 1.3, 1.6, 2.0, 2.5]`.
- `syncCollectObjectives` lazily loads the full `petRepo` pet list only when at least one active quest has a SubmitPet objective; cost is bounded by typical pet counts (< 50 per char) and is reused across all pet objectives on the quest.

## Quest Prerequisite Catalog (TBL_QUEST_PRE)

Flash source: `Player.canTakeQuest:1824–1911`. Constants: `QUEST_PRE_ITEM=1`, `QUEST_PRE_QUEST=2`.

| kind | type | Meaning |
|------|------|---------|
| 1 | 29 | Player must **carry** `num` copies of TBL_ITEM_TEMPLATE `itemId`. Server respects `pre.Type` when counting: `CountCarriedItemsByTemplate(charID, itemId, 29, -1)` so an equipment instance with the same id cannot satisfy a consumable prereq. |
| 2 | 45 / -1 | Prerequisite quest gate; quest template's `pre_quest_type` decides AND (`==1`) vs OR (`==2`). Flash switches only on `kind`, so `type=-1` is functionally identical to `type=45`. |

## Quest-Battle, Tracker, and Accept-Time Handoff Rules

See `quest-battle-rules.md`.
