# Daily Act Panel (DailyActPanel — ViewManager 20001)

## Scope
Server-side support for the Flash client's `DailyActPanel` ("Sự kiện hàng ngày"): diary task counters, vitality/activity points, online-minute counter, and the activity-chest claim button.

## RPCs
| Method | Direction | Args | Response |
|---|---|---|---|
| `getDailyPanelAwardState` | client → server | none | `{gameintro, txkcBtn, txkcBtn2, fback, autot, vip}` (all bool) |
| `getCharDiaryData` | client → server | none | `{<taskId>: count, ..., act: int, ad: bool}` |
| `getTodayOnlineTime` | client → server | none | `{t: minutes_today, f: online_step_claimed}` |
| `getDailyActAward` | client → server | `tier int16` (0..4) | `{f: bool}` |
| `updateDiaryData` | server → client (push) | — | `{id: string, val: int, act: int, num?: int}` |

## Persistence
- `player.character_daily_act` (character_id, day, vitality_points, award_claimed, awarded_tier, awarded_at, task_counts JSONB, first_login_at, online_seconds_offline, updated_at). PK: (character_id, day).
- `data.daily_act_award_rewards` (tier 0..4, threshold, item_id, quantity, bound, icon_giid, note).
- All access goes through schema-qualified Postgres functions: `player.get_character_daily_act`, `player.touch_character_daily_act_login`, `player.increment_character_daily_act_task`, `player.claim_character_daily_act_award`, `data.list_daily_act_award_rewards`.
- Migration: `supabase/migrations/20260510095051_daily_act_panel.sql`.

## Day boundary
Server-local `time.Now()` truncated to date. Same convention as Boss Daily and Daily Sign-In.

## Vitality flow
- One funnel: `DailyActService.IncrementTask(charID, taskID, countDelta, actDelta)`.
- Producers v1: `OnLogin` → task `"29"` (+1 count, +1 act). All other diary tasks (1..28, 30) remain to be wired by their owning features.
- Every increment broadcasts `updateDiaryData` to the character's connection if online.

## Award claim
- Client always sends one tier index per click (0..4). Single claim per day (`award_claimed` bool covers all tiers).
- Claim grants a configured item via `itemService.AddItemWithBind` on success. `awarded_tier` and `awarded_at` are recorded for audit.

## Online time
- Tracked as "first login of day" + offline carry-over seconds. Reported in **minutes** in `getTodayOnlineTime`. `f` returns 0 in v1 (the online-step gift machine still lives in the in-memory `Handler.rewardStates`).

## Broadcaster adapter
- `DailyActBroadcaster` interface is satisfied by `*rtmp.Server.BroadcastToCharacter` (added at `internal/infrastructure/rtmp/server.go` line 309). No separate helper file was created — the method lives directly on the RTMP server struct. Wire in `main.go` with `dailyActService.SetBroadcaster(rtmpServer)`.

## Bootstrap wiring
- `main.go` has two near-duplicate bootstrap paths. `dailyActService` is constructed and injected at **both** sites (search for `dailySigninService` to locate them). The event bus `Register(dailyActService)` call also appears twice correspondingly.

## File layout
- `internal/domain/dailyact/{record,award,repository}.go`
- `internal/application/activity/daily_act_service.go`
- `internal/infrastructure/persistence/postgres/daily_act_repository.go`
- `internal/presentation/rtmp/handlers/activity/{progress.go,rewards.go,daily_act.go,handler.go}` (existing files modified; `daily_act.go` created)
- `supabase/migrations/20260510095051_daily_act_panel.sql`
- `supabase/seeds/data_daily_act_award_rewards.sql`

## Out of scope (todo for owners)
- Wiring task ids 1..28 and 30 from their producing features (dungeons, quests, pet duel, friend-farm, monster-kill counters). Each calls `DailyActService.IncrementTask(charID, "<id>", delta, actDelta)`.
- Real values for `getDailyPanelAwardState` (currently hardcoded `gameintro=true`).
- Persisting the online-step `f` index across restarts.

## Quiet methods
- `getCharDiaryData`, `getDailyPanelAwardState`, `getTodayOnlineTime`: already `true` (silenced) in `dispatcher.go`.
- `getDailyActAward`: set to `false` during dev (dispatcher.go line 98); flip to `true` only after the first end-to-end claim is confirmed by the user.
