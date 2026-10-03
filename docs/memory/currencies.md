# Currencies (moneyType ↔ DB ↔ DTO)

Last updated: 2026-05-07

## Where currencies live

- `player.character_currencies` — KV table `(character_id, currency_type, amount, season, expires_at)`. New scalar currencies do NOT need a schema change; pick a `currency_type` ID and add a switch case in `internal/infrastructure/persistence/postgres/character_repository_scan.go` (`scanCharacterCurrencies` + `upsertCharacterCurrencies`).
- `player.character_wallet` — primary wallet (`money`, `money_bind`, `gold`, `gold_bind`, `honor`, `chivalry`, `reputation`, `pop`, `selected_money_type`, `selected_gold_type`).
- `player.character_stat_features.state` (JSONB) — feature-resource currencies live inside the owning feature's blob (PRS, war_sprite, monster_heart, heiyaoshi, magic_array, stone_seal, stars). Don't duplicate them into `character_currencies`.

## The registries that must stay in sync

A new game-KV currency requires these in the same change:

1. `internal/domain/character/character.go` — `Currency*` constant, `Character` field (default 0 in `NewCharacter`), DTO key in `ToDTO`, `AddCurrency` + `DeductCurrency` switch case.
2. `internal/domain/character/currency_keys.go` — one `gameCurrencyDescriptors` row (`{TypeID, ClientKey, Label[, AlwaysPersist]}`) AND one `registerIntGameKV(typeID, get, set)` line in `init()`. That single call wires the admin click-to-edit accessor, the `loadCharacterCurrencies` scan path, and the `upsertCharacterCurrencies` writer simultaneously — `GetGameCurrencyTotal` derives from the same map and needs no edit.
3. `dashboard/src/types/player-management.ts` — `CURRENCY_OPTIONS` row (drives the click-to-edit tile in the wallet tab).

Notes:

- The Postgres scan/upsert (`internal/infrastructure/persistence/postgres/character_repository_scan.go`) iterates `character.GameKVCurrencyAccessors()` and looks up by typeID via `character.LookupGameKVAccessor` — there is no separate switch / map to maintain there. Setting `AlwaysPersist: true` on the descriptor is what makes the upsert write a `0` row (so admins see the slot before any income); the old standalone `alwaysPersistCurrency` function was removed.
- The admin server's earlier `validCurrencies` / `getCurrencyField` / `setCurrencyField` triplet has been replaced by `character.LookupCurrencyAccessor(clientKey) → CurrencyAccessor{Get, Set}`. Don't reintroduce a parallel map — extend the registry in `currency_keys.go` instead.

## Admin-dashboard wallet UX (Phase 5)

The wallet tab renders one `Card` per currency `group` (Primary, Battle, Event, Guild, Special, Magic Crystal, NPC Shop, Train Soul, Decoration, Cross-Realm, Daily/Misc, Progression). Each currency is a clickable tile; clicking opens a `Popover` with `[Mode: Add | Set]`, `[Amount]`, `Apply / Cancel`. Hitting Enter inside the amount field applies. The bottom "Modify Currency" form was removed — click-to-edit is the single way to mutate. Tiles with `editable: false` render disabled with a tooltip explaining where to edit them.

## Subsystem-owned currencies

Some currencies the client recognises as moneyType strings actually live in feature subsystems with their own mutation rules (daily resets, pet-specific bag limits, JSONB blobs). These render in the wallet tab as `editable: false` tiles so operators can SEE the current value but click-to-edit is disabled — they must use the owning panel.

- **`movePnt`** — owned by `farm.MagicEstateService` / `MagicEstateProfile`. Daily-reset action allowance with `MaxMovePnt` derived from level. Aliasing a setter would let admins write values that the daily reset cycle later clobbers. Edit via the Magic Estate panel only.

## Stat-feature currencies are NOT in JSONB — they are flat wallets

A common misconception: `realSoulStone`, `warSprite`, `monsterHeart`, `heiyaoshiPoint`, `pvePoint`, `stoneSealPoint`, `npPnt`, `elementPnt`, `energyStone`, etc. *look* like they belong inside their owning feature's JSONB state because the seed `data_tbl_stat_feature` lists features with matching `state_key` values. They don't.

`docs/client/object/Player.as` declares each as a private flat property with public get/set accessors:

```
private var _1070495180realSoulStone:Number = 0;
public function set realSoulStone(_arg_1:Number):void { ... }
```

The stat-feature JSONB holds *progression state* — which PRS tree nodes are unlocked, which war-sprite templates are equipped, the panel's `actPoint`/`Buff`/`actLine` maps for heiyaoshi. The numeric resource counts that gate those upgrades are flat top-level player properties that flow through `onAddMoney` / `onMinusMoneyNew` like any other currency.

Phase 3 (2026-05-07) wired all 14 of these as flat `character_currencies` entries (IDs 226-239) following the Phase 2 pattern. Same accessor registry, same dashboard click-to-edit support, no schema changes.

## Currency ID ranges

- **0-71**: Reserved for `GamePredef.CURRENCY_*` (the IDs the Flash client knows). Use these for any currency that has a `CURRENCY_*` constant in `GamePredef.as`.
- **72-199**: Reserved. Don't allocate here.
- **200+**: Private range for currencies the client recognises by `moneyType` string but for which `GamePredef` has no `CURRENCY_*` constant. Used for `petguardout` (200), `petguardin` (201), the Phase-2 batch (`wisdonCrystal` 213 through `threePvpPnt` 225), and the Phase-3 batch (`realSoulStone` 226 through `stoneSealPoint` 239). Increment-only — never reuse.
- **TypeID 0**: Sentinel for "this accessor's value is NOT in `player.character_currencies`". The accessor's `Get/Set` go directly to a `Character` field that is persisted by another writer (e.g. `character_progression`). Used by `soulPnt` → `Character.SoulPoints` (persisted via the existing progression writer in `characterUpdater.Update`). Do NOT add scan/upsert cases for these in `character_repository_scan.go`; the field's normal save path handles them.

## Hard-won rules

- **DTO key === client moneyType.** Flash's `onMinusMoneyNew` updates `_core.player[moneyType]` only when `_core.player.hasOwnProperty(moneyType)` is true. If the DTO emits `mcBeans` while the moneyType is `mcbeans`, the toast fires but the cached number stays stale until relogin. We hit this exact bug; keys are now lowercase `mcbeans`. Same lesson applies to `shishangdian`.
- **Mirror client typos exactly.** The client moneyType `wisdonCrystal` is misspelled (should be "wisdom"). The DTO/server keys mirror the typo — fixing it server-side would break the `hasOwnProperty` round-trip.
- **`shishangdian` mirrors `ShopGold`.** The DTO field is the moneyType. There is no separate "fashion points" — the legacy `FashionPoints()` helper was a stub returning 0 and has been removed.
- **`petguardout` / `petguardin` are persisted at currency type IDs 200 / 201.** These are private-range IDs (≥100) since `GamePredef.CURRENCY_*` only allocates up to 71. Never reuse a public ID.
- **`anni2017` is the live anniversary currency** — despite the year in the moneyType, it's the canonical "anniversary point" register. Don't retire it.
- **Substring-matched families (`yuandan*`, `christmas*`, `xP23*`, `lyP_*`, `vtP_*`, `ltP_*`, `lbP_*`, `smP_*`)** map to ONE stable currency_type each. Year-suffixed variants must NOT each get their own ID, or balances fragment.
- **Direct client-side writes (`wcPnt18*` → `_core.player.worldCupPoint*`, `petPK_202504` → `_core.player.petPK`).** The client decrements those fields locally on top of the moneyType update. Server `currentNum` is authoritative; ensure the DTO field is also kept fresh.

## Vietnamese label sources

Labels for toasts and admin UI are sourced from `Language.GAMEPREDEF_S[*]` (see `docs/research/2026-05-07_01_PLAYER_MONEY_TYPE_CATALOG_RESEARCH.md` for the index map) or per-panel string tables (`PRS_PANEL`, `WAR_SPRITE`, `MONSTER_HEART`, `HEIYAOSHI_PANEL`, `NPC_SHOP_PANEL`, etc.). Mirror the client text exactly so toasts and admin UI agree.

## See also

- `docs/research/2026-05-07_01_PLAYER_MONEY_TYPE_CATALOG_RESEARCH.md` — full catalog of every Flash moneyType, current persistence status, risks (currency-keyed view).
- `docs/research/2026-05-07_02_CURRENCY_FEATURE_MAPPING_RESEARCH.md` — feature-keyed view (F01-F22): which currencies each subsystem touches, owning Go package, RPC entry points, implementation priority. Use this when scoping a feature PR.
- `docs/plans/2026-05-07_01_PLAYER_MONEY_TYPE_PERSISTENCE_PLAN.md` — phased rollout plan + dashboard inline-edit design.
