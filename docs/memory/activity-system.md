# Activity System

## Send Combine And Boss Daily Activity Buttons

The "Sao Lap Lanh" activity icon is controlled by `startedActList`, while panel content is loaded by `getSendCombineAct`.

Client flow:

- `onChooseCharactor` calls `MAIN_ACTIVITY.initView(startedActList)`
- `updateActivityList` also feeds `MAIN_ACTIVITY.initView(...)`
- `ActivityCanvas` maps `GamePredef.SEND_COMBINE_PANEL` to `ViewManager.PANEL_SENDCOMBINE`
- `ActivityCanvas` maps `GamePredef.BOSS_DAILY` to `ViewManager.PANEL_BOSS_DAILY`
- `GamePredef.SEND_COMBINE_PANEL = 12`
- `GamePredef.BOSS_DAILY = 49`
- `SendCombineActPanel.init()` calls `getSendCombineAct` with responder `onGetSendCombineAct`
- `CallBack.onGetSendCombineAct` forwards payload into `PANEL_SENDCOMBINE`

Main activity visibility contract for these buttons:

- include entry with `id = 12`
- include entry with `id = 49`
- set `flag = true`
- include `sortType` matching activity id for deterministic ordering

Current Go login payload now includes all required activity entries in `startedActList`:

- Send Combine (`id=12`)
- VIP shop (`id=19`)
- Auto Task New / Chiến đấu nhanh (`id=48`)
- Boss Daily (`id=49`)

Panel data handlers remain active independently:

- Send Combine: `getSendCombineAct -> onGetSendCombineAct`
- Boss Daily: `bossDailyGetData` result and callback `onOpenBossDailyPanel`

## Send Combine Real Payload Contract

`SendCombineActPanel` and `SendCombineItem` work with object-keyed numeric fields for Send Combine data.

Required payload shape:

- top-level keys: `"0"`, `"1"`, ...
- activity fields:
  - `id` as string
  - `buyNum`
  - `currency`
  - `award`
  - `index`
  - `end`
  - `limit`
- nested `award` is also object-keyed with `"0"`, `"1"`, ...
- award item fields:
  - `itemType`, `quality`, `original`, `discount`
  - `itemId`, `stackNum`
  - `checkable`, `binded`

Current Go `GetSendCombineAct` now returns 5 activity bundles in this real shape and keeps callback `onGetSendCombineAct`.

## Send Combine Purchase RPC (`buySendCombine`)

`SendCombineItem` purchase button calls:

- `buySendCombine(combineId, cb1, cb2, cb3)`
- callback responder `onBuyCombine(int)`

Current Go activity handler now supports this contract.

Server behavior:

- validates package id from Send Combine config (`"0".."4"`)
- enforces package limit (`buyNum < limit`)
- computes selected awards using:
  - index `0` always included
  - indexes `1..3` included by checkbox when `checkable == "false"`
  - non-checkable awards (`checkable == "true"`) always included
- deducts total by `discount` sum of selected awards
- supports configured currencies:
  - `gold` -> character `gold`
  - `point` -> character `honor`
  - `integral` -> character `shopGold`
- grants each selected award item with `binded` flag
- returns latest `buyNum` as RPC result for `onBuyCombine`

Buy count state:

- tracked per character and package in activity handler memory map
- `getSendCombineAct` now injects this per-character `buyNum` into panel payload

Operational note:

- buy count is in-memory state in this scope and resets on process restart.

## Database-Backed Main Activity List

The login-time main activity payload can now be sourced from `data.data_tbl_activity` instead of only from hardcoded Go values.

Client contract:

- `onChooseCharactor.startedActList` initializes the activity bar
- `updateActivityList` reuses the same entry format at runtime
- `ActivityCanvas` expects 84 client activity ids (`0..83`)
- entries are ordered by `sortType`, then `id`
- `type` and `flag` must preserve the Flash client's existing visibility and mode behavior

Database/source-of-truth details:

- table: `data.data_tbl_activity`
- baseline rows: all 84 ids seeded in both migration and `supabase/seeds/data_tbl_activity.sql`
- known panel mappings currently annotated for ids `0`, `12`, `19`, `20`, `48`, and `49`

Server path:

- `internal/infrastructure/persistence/postgres/activity_repository.go` reads the table
- `internal/application/activity/activity_config_service.go` converts rows into `startedActList`
- `internal/presentation/rtmp/handlers/auth/login.go` uses that provider during `chooseCharactor`
- if the DB-backed read fails, login falls back to the default hardcoded `0..83` list so icons still appear

## Activity Icon Starter RPCs

Exposing all 84 activity icons made the client call a larger activity-panel RPC surface than the server previously implemented. The first compatibility pass now covers the confirmed live panel failures with safe starter payloads and preserved callback names.

Confirmed panels and RPCs:

- Daily Sign In Act: `initDailySignInActData`, `initDailySignInActConsumeLimit`
- Monster Heart: `initMonsterHeartData`
- XCDS: `getXCDSData`, `XCDSGetRank`
- Consume Notice: `getConsumeNoticeData`
- Pet PVE: `initPPVEPanel`, `getPPVERank`
- Show Time: `getShowTimeInfo`
- Explorer Medal: `initEMPanel`
- MCZD: `getMCZDData`
- Moyin Tuce: `getMYTCDataView`
- Huan Mo Ta Xiulian: `getHMTXLSData`
- Texunkecheng: `getTXKCData`

Implementation notes:

- handlers live in `internal/presentation/rtmp/handlers/activity/icon_panels.go`
- callback-driven panels still receive the callback names the Flash client expects, such as `onXCDSGetData`, `onGetShowTimeData`, `onMCZDGetData`, `onMYTCData`, `onHMTXLSData`, and `onTXKCGetData`
- lightweight player context is reused only where already available from `player.characters`, primarily character `level` and `anni_consume_point`
- the current goal is compatibility and log cleanup, not full gameplay completion for every activity panel

## Historical Activity Compatibility Backlog

The broader historical activity-icon backlog now has a second compatibility layer in `internal/presentation/rtmp/handlers/activity/backlog_panels.go`.

- it covers older methods such as `getStartingActList`, `getAutoTaskData`, `initTreasureBowl`, `initMonthWelfarePanelData`, `trialsPanelInit`, `teamCrossPKGetData`, `getCrossContentionTotalState`, `getGrouponInfo`, `getLuckDrawData`, `getLotteryData`, `getReturnRewardInfo`, and other backlog methods captured from old dev-server logs
- the daily sign-in RPCs (`initDailySignInActData`, `initDailySignInActConsumeLimit`, `dailySignInActDoSignin`, `dailySignInActGetAward`, `dailySignInActRetroactive`, `dailySignInUpActCrit`, `getSignInData`, `signinNow`) used to live as starter stubs in `icon_panels.go` and `backlog_panels.go`; they moved to a dedicated package at `internal/presentation/rtmp/handlers/dailysignin/` on 2026-05-03 and now share one ledger across both Flash panels — see [Daily Sign-In](daily-signin.md).
- the payload shapes are based on `docs/tools/data.txt` where possible, so starter objects reuse historical key names like `day`, `kp`, `timestr`, `validnum`, and the trials object keys `n`, `t`, `ut`, `a`, `kt`, `at`, `sc`, `nf`
- callback-driven methods preserve the Flash callback names from `docs/tools/new-encrypt/NewCallBack-log.as`, including `onAutoTaskLogin`, `onFreshCharTreasureBowl`, `onGetMonthlyWelfare`, `onUpdateTrialsCharData`, `onTeamCrossPKGetData`, `onGetCrossContentionTotalState`, `updateGrouponConf`, `updateGrouponStat`, and `showMazeLotteryPanel`
- date-like starter strings now use `month|day|yearTail` formatting through `legacyActivityDayStamp()`, matching the historical sample shapes found in client-side player snapshots
- `activePet` belongs to the pet feature, but it was part of the same compatibility sweep and is now handled in `internal/presentation/rtmp/handlers/pet/active.go` with the expected `updateActivatePetObj` callback

## Live Activity Broadcast (Admin Dashboard → Online Players)

Admin-dashboard CRUD on `data.data_tbl_activity` triggers a realtime push to every online client so the activity panel reloads without re-login.

- **Trigger:** `dashboard/src/app/api/activities/route.ts` fires fire-and-forget `POST` to `${GAME_SERVER_HTTP_URL}/api/admin/activities/broadcast` with `{ action: "create" | "update" | "delete", id }` after each successful Supabase write. 2 s `AbortSignal.timeout`; failures only log and never block the user-facing response.
- **Endpoint:** `internal/infrastructure/adminhttp/activity_broadcast.go::handleActivityBroadcast`
  - `update` → `StartedActivityService.BuildChangeViewEntry(id)`. If row's `type == 0` (the simple show/hide case), broadcasts `updateActivityState` with `{id, sortType, flag: 0|1}` where `flag` is the **state code** (`0` = hide, `1` = show, `2` = show-with-badge — NOT the DB `flag` column). Falls back to full-list reload when `type ∈ {2, 3, 4}` because gated rows need per-player evaluation that `ActivityCanvas.changeView` does not do (see `ActivityCanvas.as:1513-1524` for the strict 0/1/2 switch).
  - `create` / `delete` → `BuildStartedActList(ctx)` → `BroadcastToAll("updateActivityList", list)`. Full re-init via Flash `CallBack.as:889 updateActivityList` → `MAIN_ACTIVITY.initView(obj)`. Required because `changeView` cannot add or remove rows.

- **Two flag schemas with the same name (do not confuse):**
  - **Login `startedActList` array element** — `flag` is dual-purpose: with `type=2` it's a level threshold, with `type=4` an exp gate, with `type=0` a boolean show/hide, with `type=3` a state code (same 0/1/2 semantics as `updateActivityState` — see "Type=3 state-label trap" below). Built by `ActivityConfig.StartedActEntry()`.
  - **Per-row `updateActivityState` payload** — `flag` is a state code: `0=hide`, `1=show`, `2=show-with-state-badge`. Built by `ActivityConfig.ChangeViewEntry()` (returns `(entry, fallback)`).
  - Sending the login-shape entry into `updateActivityState` is a silent no-op because the `switch` only matches 0/1/2.

- **Type=3 state-label trap (red "Đang báo danh"/"Đang thao tác" label):**
  - Client `ActivityCanvas.as::initView` routes `type=3` rows through `changeView()` (line 1230), which switches on `flag`: `0` → delete icon, `1` → `showActivityInfo(id, 1, sortType)` → red label "Đang báo danh" ("Registering", `Language.ACTIVITY_CANVAS[1]`), `2` → "Đang thao tác" ("Operating", `Language.ACTIVITY_CANVAS[0]`). The label is drawn under the icon in `#FF0000`.
  - **Ordinary always-visible icons must use `type=0 flag=1`**, not `type=3`. With `type=0`, `StartedActEntry()` emits `flag: true` (bool, no `type` field) → client falls through to `if (flag)` (line 1258) → plain icon, no state label.
  - The implicit contract is enforced by `handler_test.go:476` (`sendCombineEntry["flag"] == true` bool) but only against the fallback `defaultStartedActList()` path. The real DB-backed path is not unit-tested for label correctness, so seed mistakes silently reach production. Audit `data.data_tbl_activity` with `WHERE type = 3 AND flag IN (1, 2)` whenever activity rows are added or edited — every match is a red label on the player's panel and must be intentional.
- **Wiring:** `cmd/gameserver/main.go` passes `startedActivityService` into both `adminhttp.NewServer` call sites (monolith ~line 563, line server ~line 1133). `SessionProvider` interface gained `BroadcastToAll(method, data)`; the `*rtmp.Server` already satisfies it.
- **Persistence touch:** `ActivityConfigRepository.Get(ctx, id)` was added to support the per-row update payload; postgres impl uses a parameterized inline `select … where id = $1` (no DB function — only one call site). `pkgerrors.ErrNotFound` is the contract for missing rows.
- **Trust boundary:** Admin HTTP currently has no in-Go auth; the dashboard's Next.js `requireAdminSession` is the only gate. The Go endpoint is bound to the admin-only HTTP port. Do not expose it externally.
- **Fragile invariant:** This works because `ActivityConfigRepository.List` reads fresh from Postgres on every call (`activity_config_service.go::BuildStartedActList`). If anyone introduces an in-memory cache for activity configs, the broadcast endpoint must invalidate it before broadcasting, or the push will deliver stale data.
- **Tests:** `internal/infrastructure/adminhttp/activity_broadcast_test.go` covers update/create/delete success paths, 404 on missing id, 400 on unknown action, 405 on non-POST.
