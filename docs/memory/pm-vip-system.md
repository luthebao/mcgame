# PM / VIP System

## PM/VIP Persist And Sync

PM state is now persisted on `player.characters` and mirrored into `public.accounts.vip_level`.

- persisted character fields:
  - `vip_type`
  - `vip_expires_at`
  - `pm_exp`
  - `pm_process_data`
  - `pm_findback`
- effective `pmLevel` is computed only while entitlement is active
- level calculation uses client thresholds from `PmPanel.as`
- effective level is `max(vip_type, pm_level_from_exp)`, clamped to `1..9`

`buyPm` server contract:

- package `1` costs `688` gold and adds `30` days
- package `2` costs `1688` gold and adds `90` days
- package `3` costs `2888` gold and adds `180` days
- PM purchase now floors `pmExp` to the purchased package's base PM threshold, so a first `buyPm(2)` starts at `15000` and a first `buyPm(3)` starts at `45000`
- downgrade RPC abuse is rejected server-side while PM is still active
- successful purchase also sends `onBuyPm`, compatibility alias `onAddPm`, `onAddMoney("gold", -cost, newGold)`, `onUPP({"gold": ...})`, and `updateScenePmLevel`

Daily PM exp:

- `chooseCharactor` now grants daily PM exp once per day while PM is active
- daily grant uses package type amounts from the client rules text: VIP type `1 -> 500`, `2 -> 1000`, `3 -> 2000`
- PM exp changes now reuse one application-layer mutation path and can drive `addOrMinusPmExp`
- internal PM exp/login bookkeeping stays in `PMProcessData`, but `initPmData.processFlag` now only exposes numeric PM right entries to the Flash panel
- PM findback eligibility is now produced from a tracked per-day snapshot of eligible daily `type=2` PM rights when right `24` is available, and the grant is limited to once per day through internal `PMProcessData` markers
- stale PM findback markers are cleared when PM entitlement expires

Sync surfaces now carrying `pmLevel`:

- `onChooseCharactor.cData`
- scene player payloads and creature adapters
- chat `onSay`
- whisper payloads

Normalization behavior:

- expired PM is cleared during `initPmData`
- expired PM is also cleared during `chooseCharactor`
- `accounts.vip_level` is mirrored from the active character state during PM panel reads, purchases, and character select

VIP shop entitlement:

- `getVipShopConfig`
- `getVipShopCharConfig`
- `buyVipShopItem`

All three now require an active PM entitlement server-side, not just the Flash UI gate.

## PM Operation Claim RPC (`doPmOperation`)

The Flash PM panel calls `doPmOperation(index)` to claim panel rewards and expects callback `flushProcesFlag({index, day, type, time})`.

The Flash client sends the PM right id as a string label name, not a numeric AMF value. The shared activity `parseIntArg` helper now accepts trimmed numeric strings so `doPmOperation("2")`, `doPmOperation("10")`, and the same client pattern in other activity handlers are treated as valid input.

Server handling now reads right definitions from `data_tbl_pm_right` through `gamedata.Manager.GetPmRight`.

Validation rules:

- character must have active PM
- right must be enabled for current PM level (`vip1..vip9`)
- only right `type=2` and `type=4` are handled as claim operations
- `type=2` enforces cycle count from `countConfig` and persists `pm_process_data`
- `type=4` requires `pm_findback=true` and consumes it

Error callback contract:

- expired or outdated claim: `onSystemSay("Hôm qua đã nhận hoặc quá hạn nhận")`
- PM right `2` coupon claim is now implemented server-side as a `moneyBind` reward using the per-level `value1..value9` amount from `TBL_PM_RIGHT`, followed by the normal `onAddMoney(..., "moneyBind", ...)` and `onUPP({"moneyBind": ...})` callbacks
- already reached claim limit: `onSystemSay("Bạn đã nhận thưởng, vui lòng quay lại sau!")`

Current server reward mapping in this scope:

- right `id=3`: persist a PM-only character stat feature under `pm_daily_buff`, map PM levels `1..9` onto the `BUFF114044` family (`2504`, `2505`, `2506`, `2507`, `2508`, `2509`, `2510`, `3308`, `3309`), emit `upLongBuff({id, bid, type:3})`, and refresh `onUPP` so the buff is visible immediately and applied through the normal stat bonus pipeline
- right `id=7`: grant item template `3630` using level-based quantity
- right `id=10`: grant monthly VIP bag template `3231 + min(pmLevel, 7)`

Safety guard:

- unsupported PM `type=2` rewards no longer fall through into a silent success path
- if a PM right is eligible but its reward mapping has not been implemented yet, the handler now stops before persisting `pm_process_data` and returns `onSystemSay("Phần thưởng VIP này hiện chưa hỗ trợ")` instead of the bag-full fallback
- this guard currently protects unresolved PM rights such as `id=1` and `id=13` until their concrete reward behavior is implemented

Character percent bonus application now handles percentage boosts to physical and magic defense as well as HP and attack so percent-based buff-template rows can flow through the shared item and stat-feature bonus pipeline.

RPC rate limiting now includes `doPmOperation` at `1000ms`.
