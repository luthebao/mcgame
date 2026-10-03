# Admin Dashboard

## Admin Send Item (Rewritten)

API endpoint: `POST /api/admin/players/send-item` on gameserver admin HTTP layer. Targets mcgame tables `player.characters`, `player.character_items`, `data.data_tbl_equipt_template`, `data.data_tbl_item_template`.

Online delivery: Item created in inventory + `onAddCharactorSlot` callback sent immediately (`deliveryMode = "live_session"`). Offline: DB write only (`deliveryMode = "database_only"`, `refreshRecommended = true`).

Current status (verified 2026-04-01): the shared application-layer equipment display contract has not yet been wired into `internal/infrastructure/adminhttp/send_item.go`. Admin send-item still builds equipment payload fields separately via `buildAdminEquipmentProperties()` (inline property map construction) and is the main remaining drift risk relative to runtime inventory/equipment callbacks.

Template table routing: `templateTableId=19` -> Equipment. `templateTableId=29` + `kind=6` -> Material; `kind=3` -> Quest; else -> Consumable.

Equipment properties: `mainProp1/2`, `prop1/2`, `activeProp/activePropNum`, `bindMainPropNum1/2`, `binded`, `color`, `upgradeNum`, `holeNum`, `t1..t10`, `flag/flag2/flag3`, `maker`, `endureLeft`, `endureMax`.

Dashboard UI exposes controls for: bind state, color, strengthen level, durability, maker, element, pre-name type, hole count, bind prop bonus, flag fields, and raw JSON property overrides.

## Admin Player Session API

Endpoints:

- `POST /api/admin/auth`: Validates `X-Admin-Secret` or `Authorization: Bearer <secret>`.
- `GET /api/admin/players/sessions`: Returns online character sessions with character ID, account ID, username, map ID, channel ID, last active time, connected time, hot-state position.

Auth: If `admin_http.secret` set, must match exactly. If empty and `development` environment, any non-empty secret accepted.

Docker: Line-server-1 exposes port 8080. Default: `MCGAME_ADMIN_HTTP_PORT=8080`, `MCGAME_ADMIN_HTTP_SECRET=admin`.

## Player Dashboard Data Sources

Source mapping: `player.characters` for base player data. `public.accounts` for optional account info. Live online state from admin session API. If auth DB unavailable, shows shortened `account_id`. If Redis unavailable, all shown as offline.

Local env: `GM_DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres?sslmode=disable`, `GM_REDIS_URL=redis://localhost:6379/0`.

## Box Items Management

Dashboard route `/dashboard/box-items` displays items that when opened/used grant other items. Three box types are identified:

- **Simple Box**: `use_type=1` and `I1>0` in `data_tbl_item_template` (grants item I1 with count I2)
- **Award Box**: Has entries in `data.data_tbl_item_award` (probability-based multi-rewards)
- **Gift Box**: Type 508/550, `use_type=1`, Vietnamese keywords in description (choose-one pet)

API route: `GET /api/box-items` runs 3 parallel Supabase queries (`vw_item_source`, `data_tbl_item_award`, `data_tbl_item_template`) and joins server-side. Supports search, type filter, sort direction, and pagination. Shared icon resolver extracted to `dashboard/src/lib/icons/resolver.ts`.

Current dashboard behavior: `/dashboard/box-items` no longer exposes the source-filter or sort-by dropdowns. It does expose a Type selector, and the API hard-restricts the list to `template_table_id = 29`, `kind = 5`, and item `template_type` in `{500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 527, 550, 551, 552}`. Selecting a type narrows within that same allowlist through the `templateType` query param.

Award editor lookup is type-aware:

- `GET /api/box-items/award-options` now searches `vw_item_source` for `type=19/29`, `data.data_tbl_creature` for `type=12`, `data.data_tbl_buff` for `type=32`, `data.data_tbl_title` for `type=33`, and `data.data_tbl_skill` for `type=34`
- `/api/box-items/awards` resolves persisted `awardName` with the same source mapping, while legacy money/honor awards (`type=30`) and game-point awards (`type=35`) stay static-option based
- `data.data_tbl_item_award` now stores `quality`, `pre_name_type`, and `payload jsonb`; legacy `bound` was removed earlier and the new `payload` column keeps the row model extensible without replacing the table
- Admin box-item awards now support `12=pet`, `19=equipment`, `29=item`, `30=silver/gold/honor`, `31=experience`, `32=buff`, `33=title`, `34=skill`, and `35=game point/currency`, and each row exposes optional JSON `payload`
- Admin box-item awards allow `quality` for pet/item/equipment (`12`, `19`, `29`) and `preNameType` only for equipment (`19`); title and skill rewards are fixed-count rows
- `type 550` quest/gift items still prefer `data.data_tbl_item_award` rows before the description-based choose-one parser, so award-backed 550 boxes can now grant titles, skills, real timed buffs, and broader game-point currencies while the old description parser remains the fallback for pet-choice gift boxes with no award rows
- Server reward application maps description-based pet gift quality to `growBase * 10`, but `data.data_tbl_item_award` pet quality directly to the awarded pet grow rate. Award-backed item and pet boxes must pass slot-capacity checks before consumption so `ErrInventoryFull` leaves the box unchanged.
- Currency rewards from item awards (type `30` basic and type `35` game point) now flow through the structured-reward pipeline as `granted_currencies`. `internal/domain/character/currency_keys.go` is the single source of truth for currency type ID -> client `_arg_2` field key (e.g. `1 -> btPnt`, `15 -> fishPnt`, `26 -> petChip`) and Vietnamese label. `reward_callbacks.go` then emits `onAddMoney(charID, clientKey, delta, newTotal)` so the Flash client updates `_core.player[fieldKey]` and shows its built-in `sysBlueMsg` itself; the server no longer sends a separate `onSystemMidMsgOrNote` for those rewards. `onAddMoney` / `onMinusMoney` `_arg_2` value reference: [docs/research/2026-04-22_01_ON_ADD_MONEY_CALLBACK_RESEARCH.md](../research/2026-04-22_01_ON_ADD_MONEY_CALLBACK_RESEARCH.md).

### Box award weighted-picker model (2026-04-25)

The `rate` column in `data.data_tbl_item_award` is a **non-negative weight**, not a percent. The picker (`internal/application/item/award_picker.go`) uses v38-style semantics per box open:

1. Rows with `payload.guaranteed = true` are **always granted** (guaranteed bucket).
2. Remaining rows with `rate > 0` form the **pool bucket**. Exactly one pool row is selected per open:
   - `maxWeight = max(rate over pool)`, `roll = rng(1, maxWeight)`.
   - Eligible = pool rows where `rate >= roll`. If none qualify, all pool rows are eligible.
   - One row is picked uniformly from the eligible set.
3. Final grant = all guaranteed rows + the one picked pool row.

**Dashboard UI:** label is "Trọng số" (weight, no upper clamp), with a toggle "Phần thưởng cố định" that sets `payload.guaranteed`. An approx-% hint is shown per pool row: `rate / sum(pool weights)`.

**Backfill:** `cmd/scripts/backfill_award_guaranteed/main.go` marks legacy all-rate-100 item groups as `payload.guaranteed=true`. Dry-run by default; use `-write` to apply.

**Config examples** — three common patterns:

```text
Box A: single mandatory reward (old behavior preserved)
  row 1 | award_id=1001 | type=29 | count=1 | rate=100 | payload={}
  → rate=100 is the only pool row; it always wins. Same as before.

Box B: one guaranteed item + weighted loot (e.g. daily login box)
  row 1 | award_id=200  | type=30 | count=500  | rate=100 | payload={"guaranteed":true}   ← always: 500 bạc
  row 2 | award_id=2001 | type=29 | count=1    | rate=70  | payload={}                    ← 70% of pool weight
  row 3 | award_id=2002 | type=29 | count=1    | rate=30  | payload={}                    ← 30% of pool weight
  → player always gets 500 bạc, then gets item 2001 ~70% of the time or item 2002 ~30%.

Box C: tiered loot (common/rare/epic, no guaranteed rows)
  row 1 | award_id=3001 | type=29 | count=1 | rate=80  | payload={}   ← common   ~57%
  row 2 | award_id=3002 | type=29 | count=1 | rate=50  | payload={}   ← uncommon ~36%
  row 3 | award_id=3003 | type=29 | count=1 | rate=10  | payload={}   ← rare      ~7%
  → roll=1..80; rate≥roll: all three eligible on low rolls, only row1 eligible near roll=80.
    Approx odds: 80/(80+50+10)≈57%, 50/140≈36%, 10/140≈7%.
```

Picker logs at DEBUG: `item_id`, `pool_size`, `guaranteed_size`, `max_weight`, `rolled_value`, `eligible_count`, `picked_award_id`.

## Pet Item Filter

Dashboard filter `petFilter=pet_equipment`: SQL `template_table_id = 19 AND kind = 9` (pet equipment). Does not yet include pet support items (type 512/513).

## Player Management Redesign (2026-04-18)

`/dashboard/players/[id]` now renders one tab per post-split `player.character_*` sub-table. Layout: Overview · Progression · Attributes · Combat Stats · Wallet · Resources · Life Skills · GM. Page shell is thin; each tab lives in `dashboard/src/app/dashboard/players/[id]/_tabs/*.tsx`. Most edit tabs use the shared `CharacterFieldForm` primitive (`_components/character-field-form.tsx`) for the read-grid + dirty-field edit pattern, while Progression uses a dedicated incremental panel for Up level and Add exp.

Backend `POST /api/admin/players/action` dispatches by `action`, split across domain files:

- `player_action.go` — types, dispatcher, `applyCharacterChange` helper
- `player_action_ops.go` — `kick`, `transport`, `set_gm_level`, `player_detail` (+ `enrichAdminDTO` adds base stats like `baseAttack/baseDefense/experience/rebirthLvl` that `Character.ToDTO` omits)
- `player_action_character.go` — `set_attributes` (+ aptitudes), `advance_progression`, legacy `set_progression`, `set_combat_stats`, `set_life_skills`
- `player_action_economy.go` — `set_currency`, `set_resources`
- `player_action_inventory.go` — `remove_item`, `update_item`

All character-edit executors push `onUPP` via `pushUPPToConnection` when the player is online (see `BuildUPPPayload`), so edits reflect immediately in the Flash HUD. Map picker uses Supabase `data.data_tbl_map` via `GET /api/maps/list` (admin-gated, 5-min `revalidate`). Primary wallet labels are `Money / Bind Money / Gold / Bind Gold` (the Flash client uses Vietnamese "Bind" prefix convention, not "Bound").

The Progression tab no longer exposes absolute rebirth, awaken, or soul setters. It now sends `advance_progression` with positive-only `levelDelta` and `experienceDelta` values. Level gains use `Character.RaiseLevelTo(current + delta)` so attribute points, max attribute points, stat growth, and exp reset stay aligned with server logic. Exp gains use `Character.GainExperience(amount)` so additive exp follows the same server-side level-up rules as normal gameplay.

The Resources tab now edits `bagSlotNum` and `bankSlotNum` as bag and bank page counts, not raw slot totals. Server-side `set_resources` derives `bagSlots` and `bankSlots` from those counts, keeps legacy slot-total payloads only as validated compatibility input, and syncs `PetSlots` with persisted `PetMaxNum`.

Resource editing follows the client limits exactly: bag count only covers regular pages 1-7, while quest and pet pages stay default; bank count covers pages 1-5.

Not yet exposed through the Go `character.Character` struct (DB columns exist post-split but unmapped): `chivalry`, `reputation`, `move_points`/`max_move_points`, `activity_points`/`max_activity_points`, `vigor`/`max_vigor`, `star_level`, `element_type`/`element_rank`/`element_max`. Adding these requires extending the domain model + `character_repository_scan` + setters before they can be edited.

## Player Items & Pets Tabs (2026-04-18)

Two more tabs under `/dashboard/players/[id]`: **Items** and **Pets** — visualize like the Flash client's `Túi đồ` / pet window. Data fetched through the same `POST /api/admin/players/action` endpoint with new actions:

- `get_inventory` (read) — returns all items for the character grouped by `slotType`/`slotIndex`, enriched with template name/iconCode/resCode. Implemented in `player_action_inventory_read.go`. Extended `ItemProvider` with `FindByCharacterID`.
- `get_pets` (read) — returns `Pet.ToDetailDTO()` list + `petSlots`. Implemented in `player_action_pets.go`.
- `update_pet` — optional-field update (name, level, experience, upgradeNum, evolutionLv, all aptitudes base/ex, element, isFollowing/Mounting, isBound). Calls `RecalculateStats`, saves via `PetProvider.Save`, pushes `onUpdatePet` callback to the live connection when present.
- `delete_pet` — ownership-checked delete via `PetProvider.Delete`, pushes `onDeletePet` callback when live.

`PetProvider` interface (`server.go`) is satisfied by `cache.CachedPetRepository` and wired at both `cmd/gameserver/main.go` call sites to `adminhttp.NewServer`.

UI:

- `items-tab.tsx`: equipment panel on the left (11 slots around a character placeholder, arranged in two columns) + bag pager on the right with pages `1..N` (driven by `bagSlots / 30`), `N.vụ` (QuestBag SID 2311-2340), and `Pet` (PetItemBag SID 2341-2370). 6-column slot grid; colored 2px borders match `ColorCode` → quality tier; `+N` enchant badge top-left, stack count bottom-right, `B` (bound) top-right. Hover tooltip shows template name, IDs, stats, durability. Click opens dialog to edit `stackCount / colorCode / enchantLevel / starLevel / durability / maxDurability / isBound` via `update_item`, or delete via `remove_item`.
- `pets-tab.tsx`: responsive card grid (2–5 cols). Each card shows name, level, element, star count, bound badge. Tooltip shows id/exp/evolution/aptitudes/grow/HP/MP. Click opens dialog to edit all pet fields exposed by `update_pet` or delete via `delete_pet`.

Hooks: `usePlayerInventory` / `usePlayerPets` in `hooks/use-player-inventory.ts`. Types + slot-type constants + `COLOR_PREFIX` + `EQUIP_SLOT_LABELS` live in `types/player-management.ts`.

## Player-Adjust Redesign + Centralized Toasts (2026-05-30)

Plan: [docs/plans/2026-05-30_01_ADMIN_PLAYER_ADJUST_REDESIGN.md](../plans/2026-05-30_01_ADMIN_PLAYER_ADJUST_REDESIGN.md). Research: [docs/research/2026-05-30_01_ADMIN_PLAYER_ADJUST_GAP_AND_REDESIGN_RESEARCH.md](../research/2026-05-30_01_ADMIN_PLAYER_ADJUST_GAP_AND_REDESIGN_RESEARCH.md).

`/dashboard/players/[id]` shell rebuilt on Radix `Tabs orientation="vertical"`: sticky `_components/player-hero.tsx` (name/level/online/GM + stat chips) + left category sidebar `_components/player-nav.tsx` driven by `_lib/nav.ts` (categories Core · Combat · Economy · Inventory · Customization · Systems; `PlayerNavStrip` is the under-`lg` horizontal fallback). Tab content + the `_tabs/*` components are unchanged.

**Feedback is centralized**: `usePlayerAction` (`hooks/use-player-detail.ts`) fires `toast.success`/`toast.error` (sonner, already mounted in `layout.tsx`) on every mutation. Per-tab inline `ActionStatus`/status banners were removed across overview/progression/gm/combat-stats/wallet/items/pets/dress-panel + `character-field-form`; pre-submit validation uses `toast.error`. `_components/add-item-dialog.tsx` uses a separate send path (no hook toast) so it keeps its own inline status. New dashboard work should rely on the hook toasts, not inline status echoes.

Added `starPnt` ("Điểm Tinh Cung") to `CURRENCY_OPTIONS`. Progression tab gained a "Set Progression (direct)" card using the existing `set_progression` action for `soulLevel`/`soulExp`/`soulPoints` (`soulPoints` == the `soulPnt` wallet register).

## Feature-State Admin Actions + Game Systems Tab (2026-05-30)

Plan: [docs/plans/2026-05-30_02_ADMIN_FEATURE_STATE_ACTIONS.md](../plans/2026-05-30_02_ADMIN_FEATURE_STATE_ACTIONS.md).

Two new `POST /api/admin/players/action` actions surface the `character_stat_features` JSONB systems with **no DB migration** (reuse the existing `StatFeatureRepository`):

- `get_feature_states` (read) — `executeGetFeatureStates` lists feature states, filtered to the allow-list. Response `data.states = [{featureKey, state}]`.
- `set_feature_state` (write) — `executeSetFeatureState` validates `featureKey ∈ allow-list` + object-shape, upserts via `UpsertCharacterFeatureState`. `deliveryMode: "database_only"` (no push callback; online players see changes on next panel open / relog). Value validation is permissive (GM override).

Implemented in `internal/infrastructure/adminhttp/player_action_feature_state.go` (+`_test.go`). Allow-list is built from `internal/domain/statfeature` `Feature*` constants: `monster_heart`, `rune`, `rune_chip`, `magic_array`, `mystery_treasure`, `deco_hole`, `explorer_medal`, `pet_pve` (Mystery Exchange excluded — only credits `mystery_crystal`). A narrow `StatFeatureStore` interface (`server.go`) is injected via `NewServer` and wired from `cmd/gameserver/main.go` (the only caller; tests build `Server{}` directly).

Dashboard: `_tabs/feature-state-tab.tsx` + `hooks/use-feature-states.ts` (query key `["feature-states", id]`, `refetchOnWindowFocus:false` so background refetch can't wipe unsaved edits) + the `FEATURE_SYSTEMS` registry in `types/player-management.ts`. Guided scalar fields exist for `explorer_medal` (composed `"level|score"` `info` string), `pet_pve` (ppvefloor/freeTime), `mystery_treasure` (skiLvl/skiPt), `magic_array` (pickCount/refreshCount/buyPickCount), `rune` (upLvlHole). `monster_heart`, `rune_chip`, and `deco_hole` are **raw-JSON-only** (deco_hole's nested `positions.{1-4}.showLvl` shape is unsafe for flat scalar edits). Tab lives under the "Systems" nav category as "Game Systems".

## Relationship Admin Actions + Relationships Tab (2026-05-30)

Plan: [docs/plans/2026-05-30_03_ADMIN_RELATIONSHIP_ACTIONS.md](../plans/2026-05-30_03_ADMIN_RELATIONSHIP_ACTIONS.md).

Three `POST /api/admin/players/action` actions manage the social graph (`player.friends` types 0,2-5 + `player.blocks` type 1):

- `get_relationships` — `ListByCharacterAll` → `data.relationships = [{id, otherId, otherName, type, groupId, nickname, intimacy, createdAt}]`.
- `set_relationship` — update when `relationshipId>0` (applies only provided intimacy/nickname/groupId/type; rejects changing type to Black=1 with a 400); else create (type 0-5; resolves `otherName` via `GetCharacterIDByName`; rejects `otherId==charID`; type=1 → block path, 0/2-5 → `CreateTyped`; optional `mirror` creates the reverse friends-table row). `deliveryMode: "database_only"` (relog).
- `delete_relationship` — `DeleteByIDAny` (friends or blocks by id).

Migration `supabase/migrations/20260530150118_relationships_admin_functions.sql` adds 7 `player` functions (captured via `supabase db diff`, applied to local Supabase `supabase_db_mcgame-server-spb`): `create_typed_relationship` (upsert `ON CONFLICT (character_id, friend_id)`), `update_relationship_intimacy`/`_nickname`/`_group`, `change_relationship_type` (guards type∈{0,2,3,4,5}), `delete_relationship_by_id_any`, `get_character_relationships` (union friends + blocks; blocks `reason`→nickname, type=1). Repo methods added to `relationship_repository.go`; `createBlock` now persists `rel.Nickname` as the block reason (RTMP path passes empty, so unchanged there). A narrow `RelationshipStore` interface is injected via `adminhttp.NewServer` (wired in `main.go` with the existing `relationshipRepo`).

Dashboard: `_tabs/relationships-tab.tsx` + `hooks/use-relationships.ts` (`["relationships", id]`, `refetchOnWindowFocus:false`) + `Relationship` type/`RELATIONSHIP_TYPES` in `types/player-management.ts`. New **Social** nav category. Table + per-row edit dialog + delete + create form (other id/name, type select, optional group/nickname/intimacy, mirror toggle via the existing `Switch` — no Checkbox primitive in repo). Bidirectionality: rows are one-directional; symmetric types (Friend/Couple/Brother) use the `mirror` flag to also write the reverse row.
