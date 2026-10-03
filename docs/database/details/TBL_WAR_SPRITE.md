# TBL_WAR_SPRITE

| Property | Value |
|---|---|
| Table ID | 130 |
| Record count | 176 |
| JSON | `docs/database/game_data/TBL_WAR_SPRITE.json` |
| Client constant | `GamePredef.TBL_WAR_SPRITE = 130` |

## Purpose

Defines the upgrade tree for "Chiến Hồn" (War Spirits / Battle Souls) used in the Tinh Cung (Star Palace) war system. Each record represents one spirit at a specific upgrade level (0–10). Records are linked into a leveling chain via `nextId`: upgrading a spirit replaces its current entry with the `nextId` entry. Two parallel `kind` categories (1 and 2) cover 16 distinct spirit types × 11 levels = 176 records. The client reads this table to display stat bonuses, upgrade costs, and available stat types.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. IDs follow the pattern `<base> + <level>` (e.g., spirit 1100 at level 0, 1101 at level 1, … 1110 at level 10). |
| `name` | string | Vietnamese display name of the spirit (e.g., `"Rừng Rậm Lá Đỏ"` = Red-Leaf Dense Forest). The name stays constant across all levels of the same spirit chain. |
| `kind` | int | Spirit category: `1` = offensive/physical spirits (88 records), `2` = defensive/support spirits (88 records). Read by `WarSpritePropCvs.as:44,203` to determine which label to display (`Language.WAR_SPRITE[6]` or `Language.WAR_SPRITE[7]`). |
| `level` | int | Current upgrade level of this spirit entry (0–10). Displayed as `"Lv{num}"` in `WarSpriteCvs.as:132`. |
| `nextId` | int | ID of the next-level record for this spirit chain. `0` when the spirit is at max level (level 10). Read by `WarSpritePanel.as:2975,2979,3545` to walk the upgrade chain and show before/after stat comparisons. |
| `costGold` | int | Gold cost to upgrade this spirit to the next level. Read by `WarSpritePanel.as:1676,2432` for the upgrade confirmation. `0` at max level (level 10). Range: 0–6160. |
| `costNum` | int | "Dũng Khí Thạch" (Battle-Stone) material cost to perform the upgrade. Shown in `WarSpritePanel.as:3097` as `Language.WAR_SPRITE[9].replace("{num}", costNum)` and `3121` as `Language.WAR_SPRITE[17].replace("{num}", costNum)`. `0` at max level. |
| `pT1`–`pT8` | int | Property type IDs (1–8) for up to 8 stat bonuses this spirit grants. Each non-zero value is an index into `Language.WAR_SPRITE_PROP[]`. `0` means the slot is unused. Known type mappings: `1`=HP, `4`=Attack, `5`=Unknown, `6`=Defense, `7`=Unknown, `11`=Speed, `13`=Crit, `14`=EXP Bonus, `59`=Reduce Final Physical Dmg, `60`=Reduce Final Magic Dmg, `61`=Unknown, `62`=Increase Final Physical Dmg, `63`=Increase Final Magic Dmg. |
| `pN1`–`pN8` | int | Property values (numerators × 100, i.e., displayed as `value / 100` percent) paired with `pT1`–`pT8`. `0` when the corresponding `pT` slot is unused. Read by `WarSpritePropCvs.as:219–226` and `WarSpritePanel.as:2989–3052`. |

## Value distributions / sentinels

- `kind`: `1`×88, `2`×88 (exact 50/50 split; 8 spirits per kind × 11 levels each).
- `level`: 16 records at each level 0–10 (uniform distribution confirming 16 spirit chains).
- `nextId`: `0`×16 (all max-level entries), non-zero for levels 0–9.
- `costGold` / `costNum`: both `0` at level 10 (max); increase progressively through levels 0–9. Max observed `costGold` = 6160.
- `pT1`: always `1` (HP) for kind=1 and kind=2 records with `pT1=1` (88 records); some records have `pT1=4` (Attack, 44 records) or `pT1=11` (Speed, 44 records).
- `pN*`: `0` at level 0 for most spirits (no stat bonus at base); non-zero values accumulate through leveling (level 10 example: `pN1=3000` → 30% HP bonus).

## Client usage

- `WarSpriteCvs.as:130–132` — loads `GameData.d[GamePredef.TBL_WAR_SPRITE][wspId]`, reads `level` for the level label.
- `WarSpritePropCvs.as:211,219–232` — loads spirit data, iterates `pT1`–`pT8` / `pN1`–`pN8` pairs dynamically using `_local_2[("pT" + n)]` and `_local_2[("pN" + n)]` to build the property list display. Uses `kind` to choose the panel title.
- `WarSpritePanel.as:1675–1676` — reads `costGold` for upgrade gold cost.
- `WarSpritePanel.as:2973–3052` — chains through `nextId` to get current and next-level entries, then iterates `pT`/`pN` pairs to show stat gain comparison.
- `WarSpritePanel.as:3097,3121,3562` — reads `costNum` for "Dũng Khí Thạch" (Battle Stone) cost display.
- `ActivityCanvas.as:798` — `GamePredef.WAR_SPRITE` activity button triggers the `WarSpritePanel` via the activity panel.

## Related tables

- Part of the Tinh Cung system alongside [[TBL_WAR_MAP]] (the 12 zodiac palace zones these spirits are used in).
