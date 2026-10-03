# Equipment Modifications

## Change Soul Modes (Full vs Partial)

Research: `docs/research/2026-04-03_01_CHANGE_SOUL_FEATURE_RESEARCH.md`

The client sends `changeSoulRadioGroup.selectedValue` as `args[2]` (1=full change, 2=partial change). The server previously treated this as a material quantity, which accidentally gave correct cost/material consumption but never distinguished the two modes.

Fixed in `internal/presentation/rtmp/handlers/item/change_soul.go`:

- **Mode 1 (Full change)**: 1 Soul Stone + 50k silver. Re-rolls both attribute type AND value. Returns type `"1"` response, stores pending, waits for `sureChangeSoul` confirmation. Response fields: `ap`/`apn` = current (old), `apro`/`apropnum` = new.
- **Mode 2 (Partial change)**: 2 Soul Stones + 100k silver. Keeps existing attribute type, re-rolls value only. Auto-applied immediately. Returns type `"2"` with comparison fields: `apro` = new value, `apropnum` = old value, `apropnu` = old value.
- **First activation** (no existing soul): Falls through to full change flow regardless of mode.

Soul stone materials by equipment required level: 1659 (level 1-60), 1660 (61-80), 1661 (81-100), 1662 (101+).

## Change Bind (Locked Attribute Change)

Research: `docs/research/2026-04-03_02_CHANGE_BIND_FEATURE_RESEARCH.md`

Handler: `internal/presentation/rtmp/handlers/item/change_bind.go`. RPCs: `changeBind`, `sureChangeBind`.

Re-rolls `bindMainPropNum1` and `bindMainPropNum2` on equipment. Cost: 30,000 silver + 1 material (from `equipTpl.RequireItem2`). Preview-confirm flow like changeElement.

Response: `{f, ii, n, b1 (old bind1), b11 (new bind1), b2 (old bind2), b12 (new bind2), mainProp1, mainProp2}`. Client compares old vs new for each prop (UP/DOWN/EQUAL).

Confirm response uses `"f": "sure"` (string, not `"true"`). Reject returns `"f": "false"`.

## Equipment Disassemble (Phân Giải)

Research: `docs/research/2026-04-03_03_EQUIP_RESOLVE_FEATURE_RESEARCH.md`

Handler: `internal/presentation/rtmp/handlers/item/resolve.go`. RPC: `equResolve(equipmentID, passwordMD5)`.

Destroys equipment and returns crafting materials (all bound). Requirements: `colorCode >= 1`, not currently equipped, secondary password verified. Returns materials from template `requireItem1/2/3` + `requireNum1/2/3`.

Material color tier: Trác Việt (preNameType == 5) keeps same colorCode. All other prefixes get colorCode - 1. Capped at max 5 (Orange).

Response: truthy = success, falsy = failure. No preview-confirm flow.

## Equipment Star Upgrade System

Research: `docs/research/2026-04-03_04_STAR_UPGRADE_FEATURE_RESEARCH.md`

Handler: `internal/presentation/rtmp/handlers/item/star.go`. RPCs: `starOne`, `starAll`, `getStarNum`.

Uses Thăng Tinh Thạch (Star Stones, template ID 5) to increase equipment star level 0-10.

### Star Success Rates

`rate = EQUIPT_STAR_SUCCESS[currentStar] * stoneCount / 5`

| Star | Base Rate (5 stones) |
| ---- | -------------------- |
| 0→1 | 100% |
| 1→2 | 100% |
| 2→3 | 100% |
| 3→4 | 90% |
| 4→5 | 80% |
| 5→6 | 70% |
| 6→7 | 60% |
| 7→8 | 50% |
| 8→9 | 30% |
| 9→10 | 30% |

### Failure Penalty

Star 0-7 failure: star stays the same. Star 8+ failure (upgrading to 9 or 10): star drops to 0.

### Star Stat Multiplier

`EQUIPT_STAR_NUM = [1, 1.1, 1.21, 1.33, 1.46, 1.61, 1.77, 1.94, 2.14, 2.36, 2.6]`

Applied to `mainPropNum1` and `mainPropNum2` ONLY during stat aggregation in `equip_stats.go`. Formula: `displayedValue = floor(basePropNum * EQUIPT_STAR_NUM[starLevel])`. Secondary props, bind props, gems, and set bonuses are NOT multiplied.

### upgradeNum DTO Field

The Flash client reads `inst.upgradeNum` (not `starLv`) for star level display in tooltips (`TipEquip.as`, `TipCre.as`). The item DTO now maps `upgradeNum = StarLevel`. The gdc helper prioritizes `starLv → upgradeNum` over `enchantLv → upgradeNum`.

### RPC Protocol

`starOne(stoneCount, equipmentID, stoneItemID)` — single attempt.
`starAll(stoneCount, equipmentID, maxTarget, stoneItemID)` — loop until target/failure/out of stones.
`getStarNum(equipmentID)` — returns int.

Response: `{equSlotId, starSlotId, num (remaining stones), starNum (new star level), flag (success bool)}`.

## Equipment Tier Upgrade (changeLevel)

Research: `docs/research/2026-04-02_01_CHANGE_LEVEL_EQUIPMENT_UPGRADE_RESEARCH.md`

Status: Researched, handler file exists at `internal/presentation/rtmp/handlers/item/change_level.go`.

RPC: `changeLevel` replaces equipment with the next-tier template via `nextEquTid`.

Request: `{e: equipID, i1: {flag, idx}, i2: {flag, idx}, i3: {flag, idx}}` where `flag=false` means idx is instance ID, `flag=true` means idx is temp bag slot.

Cost: `(reqLevel * reqLevel) * MONEY_EQUFUNC_MAKE` where `MONEY_EQUFUNC_MAKE = 10`.

Flow: Load equipment → verify `nextEquTid > 0` → load next-tier template → resolve 3 materials → validate color matching (all same tier) → deduct silver → consume materials → delete old equipment → create new equipment in same slot → send callbacks. If equipped, must also refresh HP/MP, stats, equip active list, appearance, and element state.

Response: success `{f: true, e: oldID, i: newID, n: equipmentDTO, sid: slotID}`, failure `{f: false}`.
