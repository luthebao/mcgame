# War Sprite (Chiến Hồn Bạo Nộ) Panel

## Overview

Two-tab character progression panel (`PANEL_WAR_BATTLE = 958`, `GamePredef.WAR_SPRITE = 61`):

- **Page 1 — Thăng Cấp** — `warSprite` chain (`kind=1`), spends Dũng Khí Thạch (`CurrencyWarSprite=229`).
- **Page 2 — Tiến Hóa** — `battleSprite` chain (`kind=2`), spends Ý Chí Thạch (`CurrencyBattleSprite=230`).

Each page has **8 sprite types** (slot indices 1–8). Each slot has its own template chain spanning level 0–10 (max). At max level the row has `cost_num=0, cost_gold=0, next_id=0` and the client renders "Đã Max Cấp".

## Persistence

Slots into the existing **`player.character_stat_features`** JSONB store with `feature_key='war_sprite'` (`data_tbl_stat_feature` row 10 already registers it). **No new schema required.** State blob shape:

```json
{
  "wObj": { "1": <warTemplateId>, ..., "8": <warTemplateId> },
  "bObj": { "1": <battleTemplateId>, ..., "8": <battleTemplateId> }
}
```

Default values are the 16 root template IDs:

- warSprite roots: 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800
- battleSprite roots: 2100, 2200, 2300, 2400, 2500, 2600, 2700, 2800

`Service.GetState` lazy-initialises the row on first read (existing characters), and `Service.InitDefault` is invoked at character-create (new characters). `defaultWarSpriteState()` in `internal/application/statfeature/helpers.go` was updated to return `domainwsp.Default().ToClientPayload()` so even an uninitialised char gets the proper root pointers in the login payload.

## RPC surface

| RPC | Direction | Args | Purpose |
| --- | --- | --- | --- |
| `getSpWarData` | C → S (Responder) | none | Returns `{wObj, bObj}` |
| `addWarSprite` | C → S | `_lvlIndex:int (1..8)` | Level up using stones (kind=1) |
| `addWarSpriteGold` | C → S | `_lvlIndex` | Level up using gold (kind=1) |
| `addBattleSprite` | C → S | `_claIndex:int (1..8)` | Evolve using stones (kind=2) |
| `addBattleSpriteGold` | C → S | `_claIndex` | Evolve using gold (kind=2) |
| `getWSPBuffList` | C → S (Responder) | none | Aggregated `{propType: total}` |
| `updateWSPPanel` | S → C push | `{wObj, bObj}` | Sent after every successful upgrade |

Stone wallet delta is delivered automatically via `onUPP` (`currency.Service.Spend`/`Grant` already emits it; the toast is wired in `CallBack.as:2825/2833`).

## Cost rules

- `cost_num` is paid on the row you upgrade **from** (not the destination).
- `cost_num` for stones, `cost_gold` for gold path.
- Server re-derives both from `data.data_tbl_war_sprite` via `gamedata.Manager.GetWarSprite`. Never trust client-supplied costs.
- battleSprite stones are ~10× cheaper than gold (verified seed: `cost_gold=280, cost_num=28` at root).

## Property aggregation (`getWSPBuffList`)

**warSprite + warSprite × battleSprite%** — battleSprite acts as an additive percentage on top of the warSprite base, with battleSprite values stored as basis points (10000 = 100% factor):

```
for each sprite type i ∈ [1, 8]:
    for each prop slot j ∈ [1, 8]:
        if warT[i].p_t[j] != 0 and warT[i].p_n[j] != 0:
            total[p_t] += warT[i].p_n[j] + warT[i].p_n[j] × batT[i].p_n[j] / 10000
```

Implemented once in `domain/warsprite.AggregateMultiplied` and consumed by both `getWSPBuffList` (for the prop tooltip) and the combat-stat path (`statfeature/character.go::applyWarSpriteBonus`).

Worked examples (verified against the in-game expectation):

- War type 1 maxed (`id=1110`, HP `p_n=3000`) + battle type 1 maxed (`id=2110`, HP `p_n=40000` = 400%) → 3000 + 3000×400% = **15000 HP**.
- War level 1 (`p_n=150`) + battle level 1 (`p_n=400` = 4%) → 150 + 150×4% = **156 HP**.
- battleSprite at root (`p_n=0`): contribution = warSprite alone (e.g., 150 HP at war level 1) — leveling war sprite still pays off without any battle investment; battle sprite only adds an additional percentage.

Server returns raw integers via `getWSPBuffList`; the client applies per-type display scaling. **The combat-stat path applies the same scaling server-side** before adding to `EquipmentStatBonuses` so the character's stat panel matches the panel-displayed delta:

| Prop type | Display divisor (client) | Server scaling before `applyCharacterPropBonus` |
| --- | --- | --- |
| 1, 4, 6, 11 (HP, Atk, Def, Speed) | none | none |
| 13, 14, 31, 61 (Crit, Pen, AntiCrit, AntiPen) | ÷ 10000 | ÷ 10000 |
| 59, 60, 62, 63 (FinalDamage Reduce/Add) | ÷ 100 | ÷ 100 |
| 5, 7 (markers) | not displayed | passthrough (`NormalizeCharacterPropType` drops them) |

The scaling helper is `statfeature.scaleWarSpriteRawValue` in `internal/application/statfeature/character.go`. Without it, `+12 Critical` shown in the panel becomes `120000` in the stat panel because the raw 120000 lands directly in `bonuses.Flat[PropCritical]`.

## Per-type prop signatures (verified from seed root rows)

| Type | Name | `p_t1..8` |
| --- | --- | --- |
| 1 | Rừng Rậm Lá Đỏ | 1, 4, 5, 11, 59, 62, 61, 0 |
| 2 | Sương Đông Tiền Dạ | 4, 5, 6, 7, 13, 60, 63, 14 |
| 3 | Chỉ Chiến Chi Thương | 1, 6, 7, 13, 59, 60, 14, 0 |
| 4 | Ước Nguyện Viễn Cổ | 4, 5, 6, 7, 31, 60, 63, 14 |
| 5 | Phong Chi Thánh Tích | 1, 6, 7, 11, 59, 60, 14, 0 |
| 6 | Mộng Cảnh Phỉ Thúy | 11, 13, 31, 62, 63, 61, 0, 0 |
| 7 | Thiên Quốc Chi Môn | 11, 13, 31, 59, 62, 61, 0, 0 |
| 8 | Pháp Tắc Thời Quang | 1, 4, 5, 31, 62, 63, 61, 0 |

The `p_t` profile is **fixed per sprite type** across all 11 levels of its chain; only `p_n` grows with level.

## Server architecture

Mirrors the heiyaoshi pattern exactly:

- **Domain** `internal/domain/warsprite/` — `state.go` (`State{WObj, BObj}`, `Default`, `Decode`, `Encode`, `ToClientPayload`, `Get/Set`), `template.go` (`IsMaxed`, `NextID`, `StoneCost`, `GoldCost`, `PropPairs`), `errors.go`.
- **Application** `internal/application/warsprite/service.go` — injects `domainfeature.Repository`, `CharacterAccessor`, `*gamedata.Manager`. Methods: `GetState`, `Upgrade`, `AggregateBonuses`/`AggregateWarSpriteBonuses`, `InitDefault`.
- **Presentation** `internal/presentation/rtmp/handlers/warsprite/` — `handler.go`, `helpers.go`, `actions.go`. `Handler.handleUpgrade` is the shared entry point for the four upgrade flows.
- **Statfeature integration** `internal/application/statfeature/service.go` — adds `WarSpriteBonusProvider` interface + `SetWarSpriteBonusProvider(p)` + `AggregateWarSpriteBonuses(ctx, charID)`. Provider is satisfied by the war sprite service.
- **Character creation hook** `internal/application/character/service.go:Create` — calls `seedWarSpriteState` after `seedClassStarterSkills` via the new `WarSpriteInitializer` interface (set by main.go).

## Wiring

`cmd/gameserver/main.go` wires both the foreground server block (around line 482) and the admin/daemon block (around line 1021):

```go
warSpriteService := appwarsprite.NewService(statFeatureRepo, charService, gameDataManager, log)
warSpriteHandler := warspritehandler.NewHandler(warSpriteService, log)
warSpriteHandler.SetItemService(itemService)
warSpriteHandler.SetCharacterService(charService)
warSpriteHandler.RegisterHandlers(dispatcher)
statFeatureService.SetWarSpriteBonusProvider(warSpriteService)
charService.SetWarSpriteInitializer(warSpriteService)
```

`internal/infrastructure/rtmp/dispatcher.go` `quietMethods`: the 6 RPC names start non-quiet by design. After end-to-end QA, set them to `true` per the project workflow.

## Combat-stat integration (live)

War sprite bonuses flow into damage calculations through the existing stat-feature pipeline:

```text
combat.encounter.go:414     → equipStatsProvider.AggregateEquipmentStats(ctx, charID)
item/equip_stats.go:48      → charBonusProvider.AggregateCharacterStatBonuses(...)
statfeature/character.go    → applyWarSpriteBonus(state)
                            → domainwsp.AggregateMultiplied(state, gameDataManager.GetWarSprite)
                            → for each (p_t, total): applyCharacterPropBonus
applyCharacterPropBonus     → NormalizeCharacterPropType maps p_t → domainchar.Prop*
                            → bonuses.AddFlat / AddFloat / AddPercent
```

Because war sprite state lives in `character_stat_features`, the moment `Service.Upgrade` upserts the row, the next combat-stat pull picks up the new template IDs and re-runs the multiplier aggregation. No separate bonus-provider plumbing is needed.

End-to-end proof: `internal/application/warsprite/integration_test.go::TestUpgrade_FlowsIntoCombatStatBonuses` — upgrades both warSprite and battleSprite slot 1 to level 1, then asserts `statfeature.AggregateCharacterStatBonuses` returns `Flat[PropMaxHP] = 156` (= 150 + 150 × 400 / 10000).

Both `getWSPBuffList` (the panel tooltip) and combat-stat aggregation share `domain/warsprite.AggregateMultiplied`, so they cannot drift in formula.

## Earning loop (Dũng Khí Thạch / Ý Chí Thạch)

Currencies are already wired (typeIDs 229/230). GM grants work today (`/add warSprite N`, `/add battleSprite N`). To wire item-use, mail, shop, quest, and daily sign-in, add `currency.Service.Grant(ctx, charID, domainchar.Currency{War|Battle}Sprite, amount)` calls in the respective application packages. Toast on delta is automatic.

## Test fixture cheatsheet

Seed values used in `service_test.go` (verified against `data_tbl_war_sprite.sql`):

- Root id=1100 (kind=1, type=1): `cost_num=350, cost_gold=350, next_id=1101`.
- Level-1 id=1101: `p_t=[1,4,5,11,59,62,61,0], p_n=[150,38,38,15,2,2,100,0]`.
- Max id=1110 (kind=1 type=1): `next_id=0, cost_num=0, cost_gold=0`.
- Root id=2100 (kind=2 type=1): `cost_num=28, cost_gold=280` (note: stones are 10× cheaper than gold for kind=2).

## Critical files

- Client (read-only): `WarSpritePanel.as`, `CallBack.as:1704-1712,2825-2837`, `Player.as:2251-2252`, `Language.as:8472-8521`.
- Codegen: `internal/gamedata/models/war_sprite.go` (uses `float64` for ID/Cost/NextID — convert to int via `domainwsp.NextID/StoneCost/GoldCost`).
- Seed: `supabase/seeds/data_tbl_war_sprite.sql` (176 rows = 8 types × 11 levels × 2 kinds), `supabase/seeds/data_tbl_stat_feature.sql:38` (war_sprite registry).
- Plan + research: `docs/plans/2026-05-10_01_WAR_SPRITE.md`, `docs/research/2026-05-10_01_WAR_SPRITE_RESEARCH.md`.
