# Daily Sign-In

Two coexisting Flash panels share one server-side ledger:

- **DailySignInPanel** (`PANEL_DAILYSIGNINACT = 967`, `GamePredef.DAILYSIGNINACT = 65`) — modern monthly calendar, six RPCs.
- **SignInPanel** (`PANEL_SIGN_IN = 859`) — legacy 5-day rolling streak, two RPCs.

Both panels read from the same `player.character_daily_signins` row, so streaks/claims stay consistent regardless of which UI the player opens.

## RPCs and reply channels

| RPC | Reply channel | Notes |
|---|---|---|
| `initDailySignInActData` | inline Responder | full `time/conf/data` shape |
| `initDailySignInActConsumeLimit` | server push `oninitDailySignInActConsumeLimit` | reply nil; pushes cumulative spend |
| `dailySignInActDoSignin` | inline Responder + push `setBtnsDailySignInAct` | dual-channel matches AS3 expectation |
| `dailySignInActGetAward` | inline Responder (`Number`, 1=success) | reward delivered via standard `onAddCharactorSlot` |
| `dailySignInActRetroactive` | server push `setBtnsDailySignInAct` + `onDailySignInActDoSignin` | no inline reply; `onUPP` for Gold debit |
| `dailySignInUpActCrit` | server push `updateDailySignInActCrit` (Number) | `onUPP` for Gold debit |
| `getSignInData` | inline Responder | legacy 3-field shape |
| `signinNow` | inline Responder | redirects to modern DoSignin then projects legacy state |

`setBtnsDailySignInAct` carries the post-state `SignInData` sub-object (`actYear`, `actMonth`, `actDays` sparse-bool map, `crit`, `getAwardTime{day,flag}`).

## Persistence

`player.character_daily_signins`, composite PK `(character_id, year, month)`:

- `claimed_days_bitmap bigint` — bit `(day-1)` set when day-of-month is claimed (max 31 bits).
- `crit_percent int 0..100` — paid +5% steps.
- `lucky_award_claimed boolean` — single-shot per row.
- `consume_limit_total bigint` — running Gold (Vcoin) spend in this month-row, drives `oninitDailySignInActConsumeLimit`.
- `last_signed_at timestamptz`, `updated_at timestamptz`.

Two Postgres functions own the read/write paths (security invoker, schema-qualified):
- `player.get_character_daily_signin(p_character_id, p_year, p_month)` — returns the row, synthesising a zero-row when no entry exists yet.
- `player.upsert_character_daily_signin(p_character_id, p_year, p_month, p_day, p_crit_delta, p_consume_delta, p_set_award_claimed)` — idempotent OR-merge into the bitmap, sums crit/consume deltas (clamped 0..100 for crit), upserts in one statement.

Reward catalogue lives in `data.daily_signin_rewards (reward_id, inc, item_id, quantity, weight, note)` with read function `data.list_daily_signin_rewards(p_inc smallint default null)`. Seed file `supabase/seeds/data_daily_signin_rewards.sql` ships seven rows (1 daily, 3 surprise pool, 3 crit pool).

`inc` values: `1` daily slot (highest-weight wins, single pick), `2` surprise-day pool (weighted random), `4` crit-bonus pool (weighted random rolled at `crit_percent / 100` chance per sign-in).

Lucky-day tiers live in **`data.daily_signin_lucky_tiers (year, month, week_index, point_threshold, gold_amount, note)`** keyed `(year, month, week_index)` with read functions `data.list_daily_signin_lucky_tiers(year, month)` and `data.get_daily_signin_lucky_tier(year, month, week_index)`. Each row is one weekly bucket; the week index comes from `dailysignin.WeekOfMonth(day)` (1..7→1, 8..14→2, …, 29..31→5). The lucky-day claim grants `gold_amount` regular gold (NOT a `data.daily_signin_rewards` row), gated on `consume_limit_total >= point_threshold`. Seed file `supabase/seeds/data_daily_signin_lucky_tiers.sql` (May 2026 baseline: 499/500, 999/1000, 1999/2000, 4999/5000, 9999/10000).

## Day boundary

Server-local `time.Now()` throughout — matches every other lazy-reset feature in the codebase (BossDaily, online reward, quest call board). No cron, no UTC, no per-player TZ. The current month is computed on every read.

## Money flow

`Retroactive` and `UpCrit` charge Gold (Vcoin equivalent). `debitGold` spends `GoldBind` first, then `Gold` — same precedence as `internal/application/activity/offline_delegation.go`. After a successful debit the handler pushes `onUPP{gold, goldDiff}` so the client header updates.

Default prices come from `Config.DefaultConfig()`:
- `RetroactivePrice = 50`
- `CritPrice = 100`
- `CritStep = 5`
- `SurpriseDay = 6` (Saturday)
- `LuckyDay = 4` (Thursday)
- `LevelGate = 50` (rule sheet item 7 — rejects all four action RPCs with `ErrLevelTooLow` for level < 50; `GetState` still serves the panel)
- `CloseOnKey = 1` (must be non-zero or `DailySignInPanel.as:3750` hides the +5% crit button)

Override via `Service.SetConfig` from main when the product wants different numbers per event window.

## Crit semantics

`crit_percent` is the per-sign-in probability to additionally roll an `inc=4` item from the catalogue. Pure RNG, injected via `rand.Source` (`Service.SetRandSource`) so tests can pin a seed. The roll happens **after** the daily reward grant.

**Auto-bump (2026-05-10 fix)**: every `DoSignin` and `Retroactive` call adds `cfg.CritStep` (default 5) to the meter via `ApplyInput.CritDelta` *before* the roll. On a successful roll the meter resets to 0 via `ApplyInput.ResetCrit=true`. Two-step: (1) initial Apply with `CritDelta`, (2) on roll-success a second Apply with `ResetCrit=true`. Paid `UpCrit` is the same +5%, just charged.

Crit auto-resets per month because the `(character_id, year, month)` PK starts each month with a fresh row at `crit_percent = 0` — no cron needed.

## Legacy projection

`Record.LegacyState(today)` derives the legacy `{continueSigninTime, signinedToday, signedYesterday}` shape from the modern bitmap. Streak is the consecutive-claimed run ending at today; values >5 wrap into the 1..5 cycle the legacy 5-slot UI expects. There is no separate legacy ledger.

## Activity hub registration

`getJXHDList` already includes the `"Dailysignin"` always-open window (`internal/presentation/rtmp/handlers/activity/panel.go`). The login-time `startedActList` may still need an entry with `id = 65` and `flag = true` to surface the activity-hub button — verify on first manual integration test.

## Migration

`supabase/migrations/20260503161805_daily_signin.sql` creates both tables, both Postgres functions, and the constraints. Migration applies cleanly from `supabase db reset`. Snippet preserved at `supabase/snippets/daily_signin.sql` for re-deriving.

## quietMethods

All eight RPCs start as `false` in `internal/infrastructure/rtmp/dispatcher.go` so logs are visible during dev. Flip to `true` after the user confirms the feature works end-to-end.

## Files

| Layer | Path |
|---|---|
| Domain | `internal/domain/dailysignin/{record,reward,repository}.go` |
| Application | `internal/application/dailysignin/service.go` |
| Repository | `internal/infrastructure/persistence/postgres/daily_signin_repository.go` |
| Handler | `internal/presentation/rtmp/handlers/dailysignin/{handler,dto,init_data,do_signin,get_award,retroactive,up_crit,legacy,grants}.go` |
| Migration | `supabase/migrations/20260503161805_daily_signin.sql` |
| Seed | `supabase/seeds/data_daily_signin_rewards.sql` |
| Wire-up | `cmd/gameserver/main.go` (monolith and line server) |

## Spend gate scope (v1)

`consume_limit_total` only tracks Vcoin spent inside the sign-in feature (Retroactive + UpCrit). It does **not** include shop, quest, mw, or any other gold/point spend during the event window. The Vietnamese rule sheet (rule 3) literally says "tổng cộng 499 (bao gồm vàng và điểm) trong thời gian sự kiện" which would imply a global spend ledger. We deferred that to v2; if/when product needs the broader counter, introduce `player.character_event_spend` and have every spend path call into it.

## Things that surprised me on this build

- The Flash client expects **two** reply channels for `dailySignInActDoSignin`: an inline Responder and a separate `CallBack.onDailySignInActDoSignin` push. The handler emits both because the panel handlers are idempotent and the dual-channel ambiguity in the AS3 isn't worth guessing.
- `dailySignInActRetroactive` and `dailySignInUpActCrit` have **no Responder** — the only "reply" path is a `setBtnsDailySignInAct` / `updateDailySignInActCrit` server push. Returning a non-nil from the handler does nothing client-side.
- The crit mechanic is undefined in the AS3; the panel only displays the number. Server semantics ("roll an inc=4 bonus on each sign-in with crit/100 probability") is invented here and becomes the contract.
- `data.actDays` is a sparse map keyed by **string** (`strconv.Itoa(day)`), not int. The AS3 reads `actDays[dateNow.date]` where `dateNow.date` is a Number; AMF marshalling round-trips string-keyed object correctly because Flash treats numeric and string keys interchangeably for plain Object.
- The legacy `getSignInData` / `signinNow` system uses a 3-field shape (`continueSigninTime`, `signinedToday`, `signedYesterday`), **not** the `dailyAward / dailyDisc / contiLoginGet / lastSigninTime` shape that the previous activity-package stub returned. The stub was wrong; the new handler returns the correct shape per AS3 `SignInPanel.onGetSignInData`.

## Things that surprised me on the 2026-05-10 fix

- `DailySignInPanel.as:3750` makes `closeOnKey == 0` **hide the +5% crit button entirely**. The first build shipped `closeOnKey: 0` because the AS3 reads like a "is this disabled?" flag — it isn't. It's a "is this feature enabled?" flag, opposite polarity. Default is now `1`.
- `conf.luckyPoint` and `conf.luckyGold` are **1-based arrays of length 6** with index 0 unused. Sending zero-fillers `[0,0,0,0,0,0]` made the panel render every weekly tier as "0 points → 0 gold". The fix builds these arrays from `data.daily_signin_lucky_tiers` rows.
- The lucky-day reward is **gold (the recharge-refund amount)**, not an item from the surprise pool. The previous build called `grantFromBundle(IncSurpriseDay, true)` in `GetAward` — wrong reward kind delivered through the wrong code path. Fix: credit `tier.GoldAmount` to `char.Gold` and push `onUPP{gold, goldDiff:+amount}`. `Outcome.GoldSpent < 0` flags a credit; `pushGoldCredit` mirrors `pushGoldDebit`.
- The Vietnamese rule sheet says "Mỗi ngày điểm danh **hoặc bổ sung điểm danh**" auto-bumps crit by 5% — both signin AND retroactive. The previous build bumped neither (only paid `UpCrit` did). Fix: `Apply` calls in `DoSignin` and `Retroactive` now carry `CritDelta: cfg.CritStep`. The roll then uses the *post-bump* value, so a player at 95% who signs in is guaranteed to crit at 100%.
- On a successful crit, the meter must reset to 0. The repository's original `Apply` had no way to set `crit_percent = 0` absolutely. Added `ApplyInput.ResetCrit bool` and a corresponding `p_reset_crit boolean` arg on `player.upsert_character_daily_signin`. Reset is a separate Apply call that runs only on roll-success, so the bump-then-roll-then-reset is two transactions (acceptable race window per the plan's risk register).
- `getAwardTime.day` should NOT be set unless the player is actually eligible. The previous build returned the next luckyDay every time, leading to the panel enabling the claim button whenever `dateNow.date == that day` even if the streak/spend gates would reject server-side. Fix: `computeAwardDay` now checks streak + threshold and returns `0` when the player isn't eligible. The button only enables when the server says so.
- Surprise-day reward (`inc=2`) requires the full streak-through-today, not just "it is the surpriseDay". The Vietnamese rule sheet specifies "nếu bạn đã điểm danh đủ tất cả các ngày trước đó". Added the `IsStreakComplete` guard inside `DoSignin`.
- Level gate at 50 must apply to every action (DoSignin, Retroactive, UpCrit, GetAward) but NOT to `GetState` — the panel must still render for level <50 players (showing the rules and the empty calendar) so they know what they're working toward. The yellow message "Cần đạt cấp 50 trở lên để tham gia." fires only when an action is attempted.
