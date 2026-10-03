# Quest Loop System (TBL_QUEST_LOOP + type=7 children) + Per-Type Completion Semantics

Implemented 2026-07-04 per `docs/plans/2026-07-04_01_QUEST_LOOP_SYSTEM.md`. All hard gates (level, cooldown, guild membership, active-instance) are server-side; the client trusts `loopInfo.d[lid].canTake` and fires `takeLoop`/`cancelLoop` with zero local validation.

## Data model

- `player.character_quest_loops` (one row per character+loop): `character_id`, `loop_id`, `ft`, `take_date_ms` (epoch ms, anchors the refresh cooldown), `active`, `active_quest_id` (nullable, the currently-granted child qid), `updated_at`. Unique on `(character_id, loop_id)`.
- Migrations: `supabase/migrations/20260704170118_add_character_quest_loops.sql` (table), `supabase/migrations/20260704170210_quest_loop_functions.sql` (functions).
- Functions (all `language sql`, `set search_path to ''`): `player.get_character_quest_loops`, `player.upsert_character_quest_loop` (insert-or-update, `returning *`), `player.deactivate_character_quest_loop` (boolean, `with upd as (... returning 1) select exists(...)` — sets `active=false`, clears `active_quest_id`, keeps `ft`/`take_date_ms`), `player.get_completed_quest_ids_with_date` (`quest_id, max(completed_at)` grouped from `player.quest_history`).

## Domain + repository

- `internal/domain/quest/loop.go`: `LoopState` entity + `ToClientDTO()` (`{id, qid, takeDate, ft, finished:0}`, `id==qid==lid` always) + `CooldownEndsAtMs(refreshSeconds)` (anchors at `TakeDateMs`, reused by both cancel and full-cycle completion) + `LoopRepository` interface (`GetAll`, `Upsert`, `Deactivate`).
- `internal/infrastructure/persistence/postgres/quest_loop_repository.go`: pgx implementation over the three functions.

## Gamedata accessors

- `internal/gamedata/deferred_questloop.go`: `Cache.GetQuestLoop`/`GetAllQuestLoops` (TBL_QUEST_LOOP had no per-table accessor yet), `Manager.GetLoopChildren(pool)` — lazily indexes every type-7 TBL_QUEST row by parsed `sub_type "7-<pool>"`, memoised per `*Manager` (same pattern as `deferred_petstone.go`'s `PetStoneExSkillPool`).
- `internal/gamedata/predef/quest_type.go`: `QuestTypeNewbie=1`, `QuestTypeDaily=6`, `QuestTypeLoop=7` (kept separate from `QuestTypeClass`/`QuestTypeCallboard` in `quest_reward.go`, which stay with their reward-calc tables).
- Pool mapping lives in `loop_service.go`'s `loopChildPool(lid)`, not gamedata: pool == lid except lid 1 ("60 Vòng", disabled anyway via `min_level=200`) → pool 10.

## Application layer (`internal/application/quest/loop_service.go`)

All methods on the existing `*Service` (new file, not a new type — mirrors how `handlers/quest/{lifecycle,manager,helpers}.go` split the RTMP `Handler`). New `Service` fields: `loopRepo quest.LoopRepository`, `guildMembership GuildMembership` (narrow interface `IsInGuild(ctx, characterID) (bool, error)`, avoids an application→application hard dependency on `internal/application/guild`).

- `CanTakeLoop` — folds every gate (level range, guild membership for lid 2 only, no existing active state, cooldown elapsed on the inactive row) into one boolean; this is exactly what `loopInfo.d[lid].canTake` and the `takeLoop`/`cancelLoop` handlers surface.
- `TakeLoop` — creates the state row (`take_date_ms = now`, `ft=0`) and grants the first round via `grantLoopChild`.
- `grantLoopChild` — creates a `QuestProgress` bypassing `CanAcceptQuest`'s completed/level checks (rounds are server-auto-granted, `start_npc=-1`); deletes any stale row for that qid first to respect `unique(character_id, quest_id)`.
- `pickNextChild` — uniform random pick from `GetLoopChildren(pool)` filtered by rebirth-aware level range (mirrors `CanAcceptQuestWithSnapshot`), avoids the immediately-previous child id when ≥2 candidates remain. Deliberate approximation of the original `script_get` weighted pools — recorded, not revisited unless round variety feels wrong in play.
- `completeLoopChildQuest` — `CompleteQuest`'s branch for type-7 (dispatched via `IsLoopChild(questID)` at the top of `service.go`'s `CompleteQuest`). Reuses `syncCollectObjectives`/`consumeCollectObjectiveItems`/`applyRewards` unchanged, but: **no `RecordHistory` call** and the progress row is **always deleted** regardless of outcome (rounds repeat every cycle; recording them would poison `completedIds`/questLog and block re-grants). Extra return-map keys carry loop info to the handler: `rewards["loop"] = {id, ft}`, `rewards["loopNextQuest"] = *quest.QuestProgress` (typed nil when the cycle just completed — the handler's `rewards["loopNextQuest"].(*domainquest.QuestProgress)` type assertion succeeds either way; the `!= nil` check after it is what actually gates the push), `rewards["loopNpcIDs"] = []int`.
- `CancelLoop` — deletes the active child's `QuestProgress` (if any) and calls `Deactivate` (preserves `take_date_ms` as the cooldown anchor).
- `RepairLoop` (backs `loopRepaire`) — recreates the active round's progress if it's missing (lost child), otherwise just returns it as-is so the handler re-pushes `onAddChaQuest`.
- `GetActiveLoopStates` — feeds `initQuestManager`'s `"l"` field at login.
- `GetLoopInfoForNpc` — feeds `npcFuncInit`'s `loopInfo` for NPCs hosting one or more loops.

## Type-6 (daily) re-take — `internal/application/quest/daily_quest.go`

Completing a type-6 quest now (in `service.go`'s normal `CompleteQuest` path) records `quest_history` as usual **and then deletes** the `character_quests` row, so re-accept never hits the unique constraint. "Completed" therefore has to be re-derived from `quest_history` with a same-day cutoff — done via an **optional interface** rather than changing `quest.Repository`:

```go
type completionDateRepository interface {
    GetCompletedQuestIDsWithDate(ctx context.Context, characterID int64) (map[int]time.Time, error)
}
```

`Service.GetCompletedQuestIDs` (moved out of `service.go` into `daily_quest.go`, same method) type-asserts `s.questRepo` against this interface. Only `postgres.QuestRepository` and its `cache.CachedQuestRepository` wrapper implement it (both added a small passthrough method); test fakes that don't implement it simply get the undated base list, so **no existing `quest.Repository` fakes or the domain interface needed changes**. Filtering rule: exclude type-7 (defensive backstop — type-7 completions never reach `quest_history` in the first place since `completeLoopChildQuest` skips `RecordHistory`), include type-6 only if its latest `quest_history` completion is today (server local midnight), include every other type unconditionally (unchanged behavior).

Four call sites were redirected from `s.questRepo.GetCompletedQuestIDs` to `s.GetCompletedQuestIDs` so the filter actually applies everywhere "completed" gates re-take: `BuildQuestLogString`, `GetAvailableQuestsForCallBoard`, `GetAvailableQuestsForNpc`, `CanAcceptQuest`.

## Type-1 (newbie) cancel guard

`AbandonQuest` rejects with `pkgerrors.ErrQuestNotAvailable` when the template `Type==1`, checked before the active/status lookup. The `CancelQuest` RPC handler (`handlers/quest/lifecycle.go`) now pushes an `onCancelQuest{flag:false, qid, qn}` callback on **any** `AbandonQuest` failure (not just the type-1 case) in addition to returning the same shape as the RPC response — this unifies the previously-inconsistent "return-only, no push" failure path with the existing success path (which already did both), and the client only reads `flag` on failure either way.

## RTMP wire contract (`internal/presentation/rtmp/handlers/quest/`)

- `loop.go` (new): `TakeLoop`/`CancelLoop`/`LoopRepaire` handlers, registered in `handler.go`. All three are fire-and-forget (client sends no Responder) — every path, including failures, pushes the corresponding `onTakeLoop`/`onCancelLoopQuest` callback (`{flag:false}` shape) rather than relying on the RPC return value.
- `manager.go`: `InitQuestManager` adds `"l": {"<lid>": state.ToClientDTO()}` from `GetActiveLoopStates` (active states only — children ride in `q` via existing `character_quests`, so relogin resume is free). `GetLoopQuestStartTime` keeps its old `{startTime}` return (harmless legacy) and now **also pushes** `onGetLoopQuestStartTime` with `{"51": <today 00:00 epoch ms>}` — this was previously a fire-and-forget call from the client with the reply never delivered (see plan §1), so this dormant RPC is now functionally meaningful for the first time.
- `lifecycle.go`: `FinishQuest` — after the existing generic reward-callback block, if `rewards["loop"]` is present: push `onFinishLoopQuest` **first**, then `sendAddQuestCallback` for `rewards["loopNextQuest"]` if non-nil (reuses the exact same helper `takeQuest`/`takeLoop` use for `onAddChaQuest`, guaranteeing identical DTO shape), then `PushNpcQuestStates` for `rewards["loopNpcIDs"]`. This fixed ordering (onFinishLoopQuest always precedes the next round's onAddChaQuest) is guaranteed by the linear code structure, not by timing — verified by inspection since the existing RTMP test harness (`infrartmp.NewConnection` with a nil `net.Conn`) has no callback-order capture point.
- `npc/npc_interaction.go`: `buildNPCInteractionData` now calls `questService.GetLoopInfoForNpc` for a real `loopInfo` instead of the permanent `{d:nil, flag:false}` stub.

## Wiring (`cmd/gameserver/main.go`)

`questLoopRepo := postgres.NewQuestLoopRepository(gameDb)` → `questService.SetLoopRepository(questLoopRepo)`. `guildMembershipAdapter{guildService}` (implements `appquest.GuildMembership` via the existing `guildService.GetGuildByMember` — `nil, nil` return means not-in-guild) → `questService.SetGuildMembership(...)`, wired right after `guildService` construction (ordering across the rest of `main()` doesn't matter since nothing dispatches RPCs until the server starts listening at the end of `main`).

## quietMethods state (left as-is, not part of this change)

`takeLoop`/`cancelLoop`/`loopRepaire` are new and correctly absent from `dispatcher.go`'s `quietMethods` map (stay logged by default — no edit was needed). `initQuestManager` and `getLoopQuestStartTime` were **already** `quietMethods: true` from a prior session (when `getLoopQuestStartTime` was a dead no-op); both now carry more meaningful payloads (`"l"` field / a real push), but per the "only quiet after user confirmation, always ask first" rule I did not touch their existing quiet flags — flag this if you want them temporarily unquieted while verifying the loop flow end-to-end.

## Deliberate scope cuts (per plan §9, not implemented)

Milestone extras (Bảo Rương Thần Bí at rounds 5/10/15, Ấn Chương ≥ level 80, Kết Tinh Trí Thạch daily-3-cycles, guild contribution/exp payouts for lid 2), take costs (60/200 Vòng silver + vigor), team/group mechanics, seasonal loops 3/8/10 and legacy loop 1 (all naturally disabled via `min_level=200` in the seed data — no special-casing needed, confirmed in `CanTakeLoop`'s level gate).

## Cross-references

- [NPC & Quest System](npc-quest-system.md) — objective kinds, `CanAcceptQuestWithSnapshot`, `questLog` injection; this doc's type-6/type-7 changes touch the shared `GetCompletedQuestIDs` path documented there.
- `docs/plans/2026-07-04_01_QUEST_LOOP_SYSTEM.md` — full plan with wire-contract tables and open questions (§12).

## Post-implementation findings (2026-07-05 review)

- **Daily re-take bug (fixed).** `player.get_completed_quest_ids` reads `quest_history` (all-time), so the original `daily_quest.go` — which only excluded type-7 from the base list — left every past type-6 completion gating forever, defeating §11.2. Fixed: when the dated provider is available, type-6 IDs are dropped from the base list and re-added only if completed today. The unit-test fake originally masked this by deriving completed IDs from progress rows (deleted for dailies) instead of history; `fakeDatedQuestRepo.GetCompletedQuestIDs` now overrides to history-derived IDs to mirror production.
- **Loop kill rounds target createBoss-only bosses the server cannot spawn.** Verified from seeds: every Trị An child (4671→cid 775, 7667→cid 477) and Trừ Ma child (7668→837, 7669→1876, 7670→1875), plus the 12 "200 Vòng" kill rounds (qids 14001-14012 → cids 556, 566-576), target creatures with **no TBL_MAP_CREATURE spawn**. The server's `createBoss` scene RPC is an empty stub (`scene/handler.go:123` returns `onCreateBoss{}`), and no NPC's `sub_type` references these quest ids, so the quest-battle NPC bridge (`npc/quest_battle.go`, types 20/10/19) can't start them either.
- **Mitigation shipped:** `pickNextChild` now prefers "fightable" rounds (`loopChildIsFightable` — every kill require's creature must have a map spawn, backed by memoised `Manager.CreatureHasMapSpawn`), falling back to the raw pool only when nothing fightable exists. Net effect: 200 Vòng (912/924 fightable) never deals a dead round; Trị An/Trừ Ma (all-boss pools) still grant rounds but **cannot be completed end-to-end** until a boss-encounter channel exists.
- **Open follow-up (resolved 2026-07-05):** loop-boss encounters are now implemented — see "Loop-boss summon (implemented 2026-07-05)" below. 200 Vòng kill rounds (qids 14001-14012) remain excluded by `loopChildIsFightable`'s fallback filter; they use a different tag family and haven't been NPC-paired yet, so they still fall back to the raw pool rather than being playable end-to-end.

## Loop-boss summon (implemented 2026-07-05)

Per `docs/plans/2026-07-05_01_LOOP_BOSS_SUMMON.md`. Makes the 5 Trị An/Trừ Ma kill rounds completable end-to-end via two spawn modes, keyed off a single pairing table in `internal/application/quest/loop_boss.go` (`loopBossByQuest map[int]LoopBossSpec{NpcID, ItemID, Maps}`, plus derived npc→qid and item→qid reverse indexes):

- **Trị An (4671→npc 1143/item 2263, 7667→npc 2167/item 4843), item-summon mode:** taking the round grants the order item via the existing `questStartItemGrants` map + `grantQuestStartItems` helper (`handlers/quest/lifecycle.go`) — unchanged mechanism, just new map entries. Using the item (`handlers/item/use.go UseItem`, early-checked via `h.questService.LoopBossItemQuest(it.TemplateID)` before the normal use pipeline) calls `Service.SummonLoopBoss(ctx, charID, itemTemplateID, mapID, x, y)`, which gates on: item pairs to a quest, that quest is the character's active loop round (`active_quest_id` match via `loopRepo.GetAll`), and the round's kill objective is still unfinished (`loopRoundHasUnfinishedKill` — a kill objective exists and isn't complete). On success it registers an in-memory `LoopBossSummon{QuestID, NpcID, MapID, X: x+80, Y: y}` (one per character, later summons replace earlier ones) and the handler pushes `onBossOn` built from the NPC template (`internal/presentation/rtmp/handlers/item/loop_boss_use.go`). The item is **never consumed** — re-using it re-summons idempotently, which is also the recovery path after a server restart since the registry is memory-only by design (no DB table).
- **Trừ Ma (7668→npc 1173/maps 10,38,31; 7669→npc 2169/maps 27; 7670→npc 2168/maps 27), map-presence mode:** no item; `Service.ActiveLoopBossForScene(ctx, charID, mapID)` returns the boss whenever the character's active round is map-mode, `mapID` is in its allowed list, and the kill objective is unfinished, using the NPC template's own `pos_x/pos_y` (falling back to 1000,1000 only if both are exactly zero — 2168/2169/1173 already carry usable 1422/578 or similar). Two push paths cover this: (a) `scene/handler.go CreateBoss` (`world.go`) now merges `ActiveLoopBossForScene` entries into the existing world-boss `bossList` reply (keyed by npcID, both `posX/posY` and `x/y` included per the client-contract research on dynamic-entity position fallback) so a scene (re)load picks it up; (b) `handlers/quest/loop_boss.go`'s `pushLoopBossOnIfMapMode` fires an immediate `onBossOn` from `TakeLoop` and the loop-next-round branch of `FinishQuest` when the character is already standing on an allowed map when the round grants, so they don't have to reload the scene to see it appear.
- **Shared teardown** (`handlers/quest/loop_boss.go`'s `clearLoopBossForRound`, called from `FinishQuest`'s loop branch and `CancelLoop`): looks up the completed/cancelled round's `LoopBossSpec`; if paired, clears the in-memory summon (`ClearLoopBossSummon`), pushes `onBossOff(npcID)`, and — for item-summon rounds only — finds and deletes any leftover order item from the quest bag via the new `itemService.GetItemByTemplateID` + existing `DeleteItemByTemplateAndSlotType`, pushing `onDelCharactorSlot`. No-op (cheap early return) for rounds without a paired boss, so it's safe to call unconditionally on every loop completion/cancel.
- **Matcher fix** (`handlers/npc/quest_battle.go questBattleMatchesNPC`): all 5 boss NPC rows have `sub_type='all'` (not a parseable qid list) and their quest's `finish_npc` is the human quest-giver, not the boss itself — the existing matcher failed for all of them. Added a fallback branch: if `questIDs` is empty, check `h.questService.LoopBossNpcQuest(npcID)` before falling through to the `StartNPC`/`FinishNPC` check. This reuses the *existing* `resolveQuestBattleCreatureIDs` incomplete-objective loop unchanged — once the round's kill objective is already complete, that loop's existing `continue`-on-no-targets behavior naturally excludes the match, so a turn-in click still falls through to plain NPC interaction without any special-casing here.
- **New public accessor added to `application/item.Service`:** `GetItemByTemplateID(ctx, charID, templateID)` — thin wrapper around the existing private `findCarriedItemsByTemplateID` (already searched both quest bag and bag), needed so the handler can grab the order item's id/SID before deleting it for the `onDelCharactorSlot` push.
- **Deliberately not wired:** `scene/world.go ClickBoss`/`onClickBoss` (dead code, shadowed by `combat.HitNpc` — loop bosses fire `clickNpc` like any other NPC, confirmed in the flash-client-researcher memory). No new RPC methods were added, so `dispatcher.go`'s `quietMethods` map is untouched (`createBoss` was already quiet from a prior session; `useItem`/`takeLoop`/`cancelLoop` were already un-quieted).
