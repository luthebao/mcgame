# Currency ↔ Feature Mapping (implementation-side view)

Last generated: 2026-05-07

## Why this doc exists

`docs/research/2026-05-07_01_PLAYER_MONEY_TYPE_CATALOG_RESEARCH.md` is keyed by **moneyType** (one row per Flash callback string, status = WIRED/PARTIAL/MISSING/STAT_FEATURE). Useful for auditing wallet plumbing, awkward for planning a feature PR — when we ship "Pet Real Soul" we touch three moneyTypes at once, when we ship "Magic Crystal" we touch three different ones, etc.

This doc re-pivots the same data into **feature buckets**. Each bucket lists every currency the feature reads or writes, the owning Go package, the RPC surface area, and what is still missing. Use it as the source of truth when scoping a feature PR.

Cross-references:

- `docs/research/2026-05-07_01_PLAYER_MONEY_TYPE_CATALOG_RESEARCH.md` — currency-keyed catalog (status, DTO key, gotchas).
- `docs/memory/currencies.md` — registry rules (where currencies live, hard-won lessons).
- `docs/memory/magic-crystal.md`, `docs/memory/pet-system.md`, `docs/memory/farm-life-skill.md` — feature memories.
- `supabase/seeds/data_tbl_stat_feature.sql` — registry of stat-feature subsystems (PRS, war_sprite, monster_heart, …).

## Status legend

- `WIRED` — currency persists, mutates through `Character.Add/DeductCurrency`, round-trips on login.
- `PARTIAL` — currency persists but the **owning feature** is not implemented (no service mutates it server-side).
- `MISSING` — neither persistence nor service is implemented.
- `STAT_FEATURE` — currency persists as a flat `character_currencies` row; the owning subsystem also has a JSONB state blob in `player.character_stat_features`. Both must be mutated atomically by the feature service.

A currency can be `WIRED` (wallet plumbing done) but its **feature** can still be `MISSING` (nothing burns the currency server-side). That distinction is the whole point of this doc.

---

## Feature index

| # | Feature | Owning package | Currencies | Feature status |
|---|---------|----------------|------------|----------------|
| F01 | Primary Wallet | `internal/application/character` (+wallet) | `money`, `moneyBind`, `gold`, `goldBind`, `honor`, `chivalry`, `reputation`, `pop` | WIRED |
| F02 | Arena PVP & Achilles | `internal/application/pk` (+arena handler) | `btPnt`, `dogM`, `cbM`, `act`, `threePvpPnt` | PARTIAL — wallet wired; Achilles + 3v3 services unwritten |
| F03 | Pet Arena | `internal/application/petarena` | `paPnt`, `petPK_202504` | PARTIAL — `paPnt` flow exists; `petPK_202504` only as wallet |
| F04 | Pet Guard | `internal/application/pet` (`pet_guard.go`) | `petguardout`, `petguardin` | WIRED |
| F05 | Pet Chip / Mount fragments | `internal/application/pet` | `petChip` | WIRED |
| F06 | Pet Real Soul (PRS) | `internal/application/statfeature` (state) — **service missing** | `realSoulStone`, `realSoulCrystal`, `realSoulWater` | STAT_FEATURE — wallet wired; `updatePRSPanel` RPC handler missing |
| F07 | War Sprite | `internal/application/statfeature` (state) — **service missing** | `warSprite`, `battleSprite` | STAT_FEATURE — wallet wired; `updateWSPPanel` RPC handler missing |
| F08 | Monster Heart | `internal/application/statfeature` (state) — **service missing** | `monsterHeart`, `mhjingshi` | STAT_FEATURE — wallet wired; panel RPC + formula missing |
| F09 | Hắc Diệu Thạch (Heiyaoshi) | `internal/application/statfeature` (state) — **service missing** | `heiyaoshiPoint`, `heiyaoshiPoint2` | STAT_FEATURE — wallet wired; panel RPC missing |
| F10 | Pháp Tinh (Magic Crystal) | `internal/application/magiccrystal` | `magiccystalrec`, `magiccystalpre`, `magiccystallimit` | WIRED |
| F11 | Pet Talent (PVE) | `internal/application/pet` / `statfeature` (`pet_talent`) | `pvePoint` | STAT_FEATURE — wallet wired; PVE-grant + spend service missing |
| F12 | Pet Stone | `internal/application/pet` / `statfeature` (`pet_stone`) | `energyStone` | STAT_FEATURE — wallet wired; spend service missing |
| F13 | Stone Seal | `internal/application/statfeature` (`stone_seal`) | `stoneSealPoint` | STAT_FEATURE — wallet wired; engrave RPC missing |
| F14 | Magic Array / Stars / Soul / Astrology | `internal/application/star` (+`statfeature`) | `npPnt`, `elementPnt`, `starPnt`, `soulPnt` | STAT_FEATURE — wallet wired (`soulPnt` via `Character.SoulPoints`); upgrade RPCs missing |
| F15 | Decoration / Rune | (no package yet — handler `dress` covers cosmetic only) | `decoSilver`, `runeExp` | MISSING — wallet wired only |
| F16 | NPC Shop event currencies | `internal/presentation/rtmp/handlers/npc` + `internal/application/shop` | `wisdonCrystal`, `couragePoint`, `heroScore2507`, `xmCandy24`, `xcds2403p`, `shishangdian` | PARTIAL — generic NPC shop deducts via `LookupGameKVAccessor`; per-event income sources not implemented |
| F17 | Train Soul | `internal/application/character` (Train Soul columns) | `mysteryCrystal` | PARTIAL — wallet wired; Train Soul awakening uses `trainSoulLvl/Exp/soulChip`, but `mysteryCrystal` redeem flow is unimplemented |
| F18 | Cross-Realm (Yijie) | (no package yet) | `yijieElement` | MISSING — wallet wired only |
| F19 | Magic Estate / Daily / Rebate | `internal/application/farm` (`magic_estate.go`) | `movePnt`, `rebatepoint`, `exPoint`, `point` | PARTIAL — `movePnt` fully owned by farm; `rebatepoint`/`exPoint`/`point` are wallets without grant flow |
| F20 | Seasonal events | `internal/application/activity` + scattered grants | `yuandan*`, `lyP_*`, `vtP_*`, `ltP_*`, `lbP_*`, `smP_*`, `xP23*`, `fishPnt`, `christmas*`, `nationalDayPnt`, `wcPnt18`, `wcPnt18gold`, `a5Pnt`, `anni2017`, `d11Pnt2020`, `explorerPnt`, `st2312Pnt`, `txkc2508p`, `thBirthPnt5`, `mcbeans` | WIRED (wallets) — most activities use them as exchange-shop currencies through generic NPC handlers |
| F21 | Guild | `internal/application/guild` | `guildContrib` (`Normal`), `donateContrib` (`Donate`) | WIRED |
| F22 | Fashion / Shop Gold | `internal/application/shop` | `shishangdian` (= `ShopGold`) | WIRED — see F16 for spend flow |

---

## F01 · Primary Wallet

**Currencies:** `money`, `moneyBind`, `gold`, `goldBind`, `honor`, `chivalry`, `reputation`, `pop`.

| Currency | DTO key | Storage | Notes |
|----------|---------|---------|-------|
| `money` | `money` | `player.character_wallet.money` | Bạc |
| `moneyBind` | `moneyBind` | `…money_bind` | Bạc khóa |
| `gold` | `gold` | `…gold` | Vàng |
| `goldBind` | `goldBind` | `…gold_bind` | Vàng khóa |
| `honor` | `honor` | `…honor` | Danh vọng |

**Owning code:** `internal/domain/character/wallet.go`, `internal/application/character/*`, `internal/application/shop/service.go::ChangeMoneyType`.

**Sinks:** every shop, trade, repair, mail-COD, NPC purchase (`internal/presentation/rtmp/handlers/{shop,trade,npc,activity,quest,achievement,pet,marriage}`).

**Sources:** monster drops, quest rewards, daily logins, mail, trade.

**Status:** WIRED, no work needed. Confirm any new feature spending money routes through `Character.AddCurrency` / `DeductCurrency` to keep concurrent-spend safety.

---

## F02 · Arena PVP & Achilles (`pk`)

**Currencies:** `btPnt` (Đấu Trường), `dogM` (Huy Chương Cẩu), `cbM` (Huy Chương Achilles), `act` (Liên Minh / Group PvP), `threePvpPnt` (Dũng sĩ 3v3).

| Currency | Earned in | Spent on |
|----------|-----------|----------|
| `btPnt` | Arena ladder fights | Arena exchange shop |
| `dogM` | "Cẩu" 1v1 mode wins | Achilles shop, NPC titles |
| `cbM` | Achilles rank rewards | Achilles equipment shop |
| `act` | Group PvP / battlefield | Group PvP shop |
| `threePvpPnt` | 3v3 ladder (pkApvpStart3v3 — currently stub) | 3v3 exchange shop |

**Owning code:** `internal/application/pk/*`, `internal/presentation/rtmp/handlers/pk/*`, `combat/*`. Group PvP handler still under `stub/`.

**Status:** PARTIAL.

- WIRED: wallet for all five currencies.
- MISSING: server-side fight result hooks that grant `cbM` (Achilles), `act` (Group PvP), `threePvpPnt` (3v3). The 1v1 / arena ladder grants `btPnt` and `dogM` partially through `pk` + `apvp` flows; review those before extending.

**Implementation pointers:**

- The grant-side wrapper should be a single helper in `pk/service.go` (e.g. `awardArenaWin(charID, mode)`) that switches on mode → currency ID → `Character.AddCurrency` → `onAddMoney` callback.
- 3v3 / Group PvP RPCs (`pkApvpStart3v3`, `groupPvpEnd`) are still in `handlers/stub/handler.go` — implementing them is gated by SQLi-test obligation per CLAUDE.md (search-string sinks).

---

## F03 · Pet Arena (`petarena`)

**Currencies:** `paPnt` (regular), `petPK_202504` (event activity).

**Owning code:** `internal/application/petarena/*`, `internal/presentation/rtmp/handlers/petarena/*`.

**Status:** PARTIAL.

- WIRED: `paPnt` deduction in pet arena fight resolution.
- PARTIAL: `petPK_202504` — wallet exists; the **client also self-decrements `_core.player.petPK = currentNum`**. Confirm the DTO ships `petPK` (not just `petArenaActPoint`). If we send only `petArenaActPoint`, the local cache stays stale until relogin (see Risk #3 in the catalog).

**Action items:**

1. Audit `Character.ToDTO` for a `petPK` key. If absent, dual-emit `petPK` and `petArenaActPoint` so the client `hasOwnProperty` test passes for either.
2. Wire the `petPK_202504` event-shop redeem into `handlers/petarena` (currently routes through generic NPC shop).

---

## F04 · Pet Guard (`pet/pet_guard.go`)

**Currencies:** `petguardout`, `petguardin`.

**Owning code:** `internal/application/pet/pet_guard*` and `internal/presentation/rtmp/handlers/pet/pet_guard.go`.

**Status:** WIRED. Both are persisted at currency type IDs 200/201 (private range; see `docs/memory/currencies.md` "Currency ID ranges").

**Pattern note:** This was the **first** post-`GamePredef` private-range pair. Use the same pattern for any new client-only moneyType: `Currency*` constant ≥ 200, `Character` field, descriptor row, `registerIntGameKV(...)` in `init()`. No schema change.

---

## F05 · Pet Chip / Mount fragments

**Currencies:** `petChip`.

**Owning code:** `internal/application/pet/*` (mount/pet fragment exchange).

**Status:** WIRED. Spent in pet upgrade NPCs; granted by activity / events.

---

## F06 · Pet Real Soul (`prs`) — STAT_FEATURE

**Currencies:** `realSoulStone` (Chân Hồn Thạch), `realSoulCrystal` (Kết Tinh Thần Dụ), `realSoulWater` (Lộ Thu Thập).

**Owning code:** `internal/application/statfeature/*` (currently state-only). RPC `updatePRSPanel` is the canonical client→server entry per `data_tbl_stat_feature.id=7`. Handler **not yet implemented**.

**State blob:** `player.character_stat_features.state_key='prs'` JSONB — holds tree node unlocks, equipped show/chip ids. The three currencies are **not** inside that JSONB; they are flat `character_currencies` rows (IDs 226-228). Both must mutate together for an unlock.

**Status:** STAT_FEATURE.

- WIRED: wallet for all three currencies, JSONB state shell (passes through login DTO).
- MISSING: PRS upgrade service (`unlockNode`, `equipShow`, `equipChip`) that deducts the three currencies and writes back the JSONB.

**Implementation pointers (canonical recipe):**

1. Add `internal/application/prs/service.go` (mirror `magiccrystal/service.go`).
2. RPC handler `internal/presentation/rtmp/handlers/prs/handler.go` registers `updatePRSPanel` (and any sub-RPCs).
3. Service does: load `feature_state` row → `char.DeductCurrency(CurrencyRealSoulStone, cost)` → mutate JSONB → `char.SaveStatFeature(...)` → emit `onMinusMoneyNew` with all three deltas.
4. Apply bonus through `bonus_strategy='prs_template_ids'` (already implemented in stat-feature foundation).

**Reference data:** `data.data_tbl_prs_tree`, `data.data_tbl_prs_show`, `data.data_tbl_prs_chip` (already seeded).

---

## F07 · War Sprite (`war_sprite`) — STAT_FEATURE

**Currencies:** `warSprite` (Dũng Khí Thạch), `battleSprite` (Ý Chí Thạch).

**Owning code:** `internal/application/statfeature/*` (state-only). RPC `updateWSPPanel` (`data_tbl_stat_feature.id=10`). Handler **not yet implemented**.

**State blob:** `state_key='warSprite'` JSONB — holds two sub-maps (`wObj` for "warrior" sprites, `bObj` for "battle" sprites). Each currency funds its respective sub-map.

**Status:** STAT_FEATURE.

- WIRED: wallets, state shell, login DTO.
- MISSING: spawn / fuse RPC service.

**Note:** `bonus_strategy='template_map'` is already wired in stat-feature foundation, so once `state` is mutated correctly the bonus pipeline works.

---

## F08 · Monster Heart (`monster_heart`) — STAT_FEATURE

**Currencies:** `monsterHeart` (Ma Năng), `mhjingshi` (Tâm Tinh Thạch).

**Owning code:** `internal/application/statfeature/*` (state-only). No primary RPC yet (`primary_rpc=NULL`). Handler **not yet implemented**.

**State blob:** `state_key='monsterHeart'` JSONB. Reference tables: `data_tbl_creatureh_heart`, `data_tbl_creatureh_combine`, `data_tbl_creatureh_contain`, `data_tbl_creatureh_point`.

**Status:** STAT_FEATURE.

- WIRED: wallets, state shell.
- MISSING: combine/upgrade RPC; bonus formula research (`bonus_ready=0` in seed).

---

## F09 · Hắc Diệu Thạch (`heiyaoshi`) — STAT_FEATURE

**Currencies:** `heiyaoshiPoint` (pool 1), `heiyaoshiPoint2` (pool 2).

**Owning code:** `internal/application/statfeature/*` (state-only). Handler **not yet implemented**.

**State blob:** `state_key='heiyaoshi'` — holds `actPoint`, `Buff`, `actLine` maps. The two currencies are *separate* numeric resources that gate `actPoint`/`actLine` upgrades.

**Status:** STAT_FEATURE.

- WIRED: wallets, state shell, login DTO.
- MISSING: panel RPC (likely `updateHYSPanel` or equivalent — needs Flash trace).

**Disambiguation alert:** the JSONB key `heiyaoshi` and the moneyType `heiyaoshiPoint*` share the prefix. **Never store** the numeric resource inside the JSONB (per `docs/memory/currencies.md` rule); always mutate them as wallet currencies and refresh the JSONB blob through the panel RPC.

---

## F10 · Pháp Tinh / Magic Crystal (`magiccrystal`) — REFERENCE IMPLEMENTATION

**Currencies:** `magiccystalrec` (Bụi — recovery dust), `magiccystalpre` (Pha Lê Vĩnh Hằng — premium), `magiccystallimit` (Pha Lê Cực Hạn — limit).

**Owning code:** `internal/application/magiccrystal/{service,encoding}.go`, `internal/presentation/rtmp/handlers/magiccrystal/{handler,actions}.go`.

**RPCs:** `initMagicCrystalData`, `MagicCrystalActive`, `MagicCrystalUp`, `MagicCrystalAddPower`, `MagicCrystalRecovery`.

**Pattern (use as the template for F06-F09, F11-F14):**

```go
if err := char.DeductCurrency(domainchar.CurrencyMagicCrystalRec, cost); err != nil {
    return nil, err
}
state, err := s.featureRepo.LoadFeatureState(ctx, char.ID, FeatureMagicCrystal)
// mutate state JSONB
if err := s.featureRepo.SaveFeatureState(ctx, state); err != nil {
    return nil, err
}
return &Result{
    Updates: []Update{{Field: FieldRec, NewTotal: char.MagicCrystalRec}},
}, nil
```

Then the RPC handler emits a single `onMinusMoneyNew` payload bundling all three currencies' updates if the call mutates more than one (e.g. `RecoveryDustCost` deducts `magiccystalrec` and refunds `magiccystalpre` + `magiccystallimit`).

**Status:** WIRED.

---

## F11 · Pet Talent (PVE) — STAT_FEATURE (per pet)

**Currencies:** `pvePoint`.

**Owning code:** `internal/application/statfeature/*` for state, `internal/application/pet/*` for pet-scoped operations. RPC `onFillOrTakeOffTalentStone` is the talent-slot mutator (`data_tbl_stat_feature.id=14`, `target_scope='pet'`).

**State blob:** `player.pet_stat_features.state_key='petTalent'` (per-pet, not per-character).

**Subtlety:** `pvePoint` is a *character* currency (flat row in `character_currencies` ID 235), but the *talent state* it funds lives on the **active pet's** `pet_stat_features` row. Talent-stone equip/take-off must read the active pet, mutate its JSONB, and deduct `CurrencyPvePoint` from the character.

**Client also refreshes `PANEL_PET_TALENT_FUNC` and `PANEL_PET_TALENT`** on `pvePoint` deduction — server doesn't need to drive that, the client does it locally.

**Status:** STAT_FEATURE.

- WIRED: wallet, JSONB state shell.
- MISSING: talent-stone fill / take-off service that ties the two together. The `onFillOrTakeOffTalentStone` callback already has a stat-feature bonus strategy (`slotted_template_ids`); only the deduction + JSONB mutation is missing.

---

## F12 · Pet Stone — STAT_FEATURE (per pet)

**Currencies:** `energyStone` (Tụ Linh Thạch).

**Owning code:** `internal/application/statfeature/*` for state. RPC `updatePetStoneBagData` (`data_tbl_stat_feature.id=15`, `target_scope='pet'`).

**State blob:** `player.pet_stat_features.state_key='petStone'`.

**Note (per admin dashboard):** `energyStone` is **character-scoped** despite the panel name — it's a single wallet on the character, not per-pet. Petstones ARE per-pet (the JSONB is on `pet_stat_features`), but the energy currency that buys them is on the character.

**Status:** STAT_FEATURE.

- WIRED: wallet, state shell.
- MISSING: pet-stone-bag mutation RPC + slot equip / take-off.

---

## F13 · Stone Seal (`stone_seal`) — STAT_FEATURE

**Currencies:** `stoneSealPoint`.

**Owning code:** `internal/application/statfeature/*` (state-only). RPC `stoneSealOnEquipChange` (callback name from seed; client probably calls `updateStoneSealPanel` or similar — Flash trace needed).

**State blob:** `state_key='stoneSeal'` JSONB. Reference data shares the PRS tables.

**Status:** STAT_FEATURE.

- WIRED: wallet, state shell.
- MISSING: engrave / upgrade service. `bonus_ready=0` in seed — formula research needed.

---

## F14 · Magic Array / Stars / Soul / Astrology (`star`)

**Currencies:** `npPnt` (Năng Lượng Tự Nhiên — natural / np-points), `elementPnt` (Nguyên Tố — magic-array element), `starPnt` (star points — `Character.SoulPoints`-adjacent), `soulPnt` (soul points — `Character.SoulPoints`).

**Owning code:** `internal/application/star/*`, `internal/presentation/rtmp/handlers/star/handler.go`. Stat features `magic_array` (id=4) and `stars` (id=17) hold the upgrade state.

**Storage pivot:** `soulPnt` is a *sentinel TypeID 0* accessor — the value is `Character.SoulPoints`, persisted via `character_progression`, NOT `character_currencies`. Don't add a scan/upsert case (per `currencies.md` rule). All three other currencies are flat `character_currencies` rows (IDs 235-238).

**Status:** PARTIAL → MISSING for upgrade flow.

- WIRED: wallets (all four), `astrologicData` JSONB, `starsData` JSONB shells.
- WIRED in seed: `bonus_strategy='stars_now_map'` for magic_array.
- MISSING: `beginStarLvUp` RPC handler (callback `onBeginStarLvUp`); element / np-point spend RPCs; star upgrade flow.
- See `docs/research/2026-05-05_02_STAR_SUBSYSTEM_RESEARCH.md` for the deferred design notes.

---

## F15 · Decoration / Rune

**Currencies:** `decoSilver` (Bí Ngân), `runeExp` (Exp Phù Văn).

**Owning code:** none yet. Decoration is referenced by `DECORATE_PANEL` constants in client; rune is a separate equip-tier system.

**Status:** MISSING.

- WIRED: wallets only.
- MISSING: decoration / rune services entirely. Likely a new `internal/application/decoration` package; until then, the only mutation path is admin dashboard click-to-edit.

---

## F16 · NPC Shop event currencies

**Currencies:** `wisdonCrystal` (note typo — keep as-is), `couragePoint`, `heroScore2507`, `xmCandy24`, `xcds2403p`, `shishangdian`.

**Owning code:** `internal/presentation/rtmp/handlers/npc/npc_func_other.go` (generic shop deduction via `LookupGameKVAccessor`). `internal/application/shop/service.go` for shop item lookup.

**Status:** PARTIAL.

- WIRED: wallets; generic NPC purchase flow that deducts arbitrary `currency_type` IDs.
- MISSING: per-event income paths. These currencies are awarded by:
  - `wisdonCrystal` — equipment quench (drops on quenching from a higher tier?). Source unknown.
  - `couragePoint` — daily courage activities (`PANEL_COURAGE`?).
  - `heroScore2507` — limited-time event 2025-07; income via dungeon clears.
  - `xmCandy24` — Christmas 2024 event giveaways.
  - `xcds2403p` — cross-server activity 2024-03 event.
  - `shishangdian` — fashion-shop currency. Spend WIRED. Income source from chu-niên / activity boxes.

**Action:** when each event is implemented, add the grant call (`Character.AddCurrency(CurrencyXxx, amount)` + `onAddMoney`).

---

## F17 · Train Soul (`soul`)

**Currencies:** `mysteryCrystal` (Kết Tinh Thần Bí — TRAIN_SOUL_PANEL[12]).

**Owning code:** Train Soul state is on `player.characters` (`trainSoulLvl`, `trainSoulExp`, `soulChip`) per `data_tbl_stat_feature.id=2`. Service not yet implemented.

**Status:** PARTIAL.

- WIRED: `mysteryCrystal` wallet, Train Soul level/exp columns.
- MISSING: redeem / awaken RPC. Train Soul upgrade likely consumes both `soulChip` and `mysteryCrystal`.

---

## F18 · Cross-Realm (Yijie)

**Currencies:** `yijieElement` (Nguyên Tố Cao Năng — MAGIC_ARRAY_PANEL_U[45]).

**Owning code:** none yet.

**Status:** MISSING. Cross-realm is a future feature; currency wallet is in place so admin can hand out previews.

---

## F19 · Magic Estate / Daily / Rebate

**Currencies:** `movePnt` (Điểm Hành Động), `rebatepoint` (Ma Lực Chi Tinh), `exPoint` (Đổi Điểm Thưởng), `point` (generic event point).

**Owning code:** `internal/application/farm/magic_estate.go` for `movePnt`. The other three have no service yet.

**Storage pivot for `movePnt`:** owned by `farm.MagicEstateProfile` with a daily reset (`MaxMovePnt` derived from level). The accessor for `movePnt` is admin-read-only (`editable: false`) precisely because the daily-reset writer would clobber any direct wallet write. **This is the model for any "daily-allowance" currency** — keep ownership in the feature service, expose read-only in the admin wallet tab.

**Status:**

- `movePnt`: WIRED (read), feature owns mutation.
- `rebatepoint` / `exPoint` / `point`: PARTIAL (wallets only, no service).

---

## F20 · Seasonal events (catalog only)

All listed event currencies are **wallet-WIRED**. Per `docs/memory/currencies.md` substring rule, year-suffixed variants (`yuandan24`, `christmas25`, `lyP_2026`, …) all map to the same currency_type ID. Spend flows are routed through generic NPC shops (`NPC_SHOP_PANEL[*]`) which already support arbitrary `currency_type` deduction.

| Family | Currency ID | Substring matched | Notes |
|--------|-------------|--------------------|-------|
| `yuandan*` | 10 | `indexOf("yuandan") >= 0` | Lunar New Year |
| `lyP_*` | 11 | `indexOf("lyP") >= 0` | Lunar |
| `vtP_*` | 12 | `indexOf("vtP") >= 0` | Valentine |
| `ltP_*` | 13 | `indexOf("ltP") >= 0` | Lantern |
| `lbP_*` | 14 | `indexOf("lbP") >= 0` | Labor |
| `xP23*` | 16 | substring match | Qixi |
| `smP_*` | 17 | `indexOf("smP") >= 0` | Summer |
| `christmas*` | 22 | `indexOf("christmas") >= 0` | Christmas |
| Other | 15, 18, 25, 29, 30, 31, 49, 58, 60, 62, 64, 69 | exact match | See catalog research |

**Status:** WIRED. Income paths attach per event activation.

---

## F21 · Guild

**Currencies:** `guildContrib` (Cống Hiến Bang Hội, `CurrencyNormalContrib`), `donateContrib` (Cống Hiến Quyên Góp, `CurrencyDonateContrib`).

**Owning code:** `internal/application/guild/*`.

**Status:** WIRED.

---

## F22 · Fashion / Shop Gold (`shop`)

**Currencies:** `shishangdian` (= `Character.ShopGold`).

**Owning code:** `internal/application/shop/*`.

**Status:** WIRED. The legacy `FashionPoints()` stub returning 0 has been removed; DTO emits `shishangdian = c.ShopGold` directly. Spend flow is generic NPC shop.

---

## Implementation priority recommendations

The biggest "shared feature → multiple currencies" wins are F06-F09 because each unlocks a complete subsystem with one PR:

1. **F06 PRS** (3 currencies, full panel) — `data.data_tbl_prs_*` already seeded; `bonus_ready=1`. Highest leverage.
2. **F10 Magic Crystal** — already wired; use as living reference.
3. **F07 War Sprite** (2 currencies, full panel) — `bonus_ready=1`, only RPC layer needed.
4. **F09 Heiyaoshi** (2 currencies) — similar shape.
5. **F11/F12 Pet Talent / Pet Stone** (1 currency each, per-pet state) — slightly different (per-pet JSONB), but tight scope.
6. **F02 Achilles + Group PvP + 3v3** — high SQLi blast radius (search-string sinks); pair with the security regression pack from CLAUDE.md.
7. **F13 Stone Seal**, **F08 Monster Heart** — blocked on formula research (`bonus_ready=0`).
8. **F14 Magic Array / Stars** — see existing star research; defer until stat-feature foundation finishes.
9. **F15 Decoration**, **F18 Yijie**, **F17 Train Soul redeem**, **F19 daily-currency services** — fresh-build features; size depends on feature spec.

## How to use this doc when scoping a PR

1. Pick a feature row (F06-F22).
2. Read its **Currencies** column — these are all the moneyTypes the PR will touch.
3. Read **Owning code** — the PR's package boundary.
4. Read **Status / MISSING** — the implementation gap.
5. Confirm wallet plumbing is `WIRED` in the catalog research (`docs/research/2026-05-07_01_PLAYER_MONEY_TYPE_CATALOG_RESEARCH.md`). If `MISSING`, do that first (one-liner descriptor + accessor per currency).
6. Mirror the Magic Crystal pattern (F10) for service shape: load state → `Deduct/AddCurrency` per touched ID → mutate JSONB if STAT_FEATURE → emit one `onMinusMoneyNew` bundling all deltas.
7. Update `docs/memory/<feature>.md` after merging (per CLAUDE.md rule).

## Risks repeated from the catalog (for convenience)

- **DTO key === moneyType.** Any new accessor MUST emit a DTO key matching the moneyType lowercase-for-lowercase, including client typos (`wisdonCrystal`).
- **Substring families share one currency_type ID.** Don't allocate per-year IDs — balances will fragment.
- **STAT_FEATURE currencies are flat wallets, NOT JSONB fields** — duplicating storage desyncs.
- **Direct client writes** (`wcPnt18*` → `worldCupPoint`, `petPK_202504` → `petPK`) — DTO must keep the directly-mutated field fresh on every relevant push.
- **GM/SQL safety** — every new spend/grant goes through `Character.Add/DeductCurrency`, never raw SQL; trade/auction sinks need `SELECT … FOR UPDATE`.
