# TBL_RUNE_CHIP

| Property | Value |
|---|---|
| Table ID | 124 |
| Record count | 76 |
| JSON | `docs/database/game_data/TBL_RUNE_CHIP.json` |
| Client constant | `GamePredef.TBL_RUNE_CHIP = 124` |

## Purpose

Defines Mảnh Vỡ Phù Văn (Rune Chip / fragment) items used to exchange for higher-quality runes in the Decorate system. Each chip corresponds to a specific rune type and is collected in the player's chip bag. Accumulating enough chips (`num` threshold) allows an exchange for the target rune. The record count (76) matches the number of `canExchange=1` runes in [[TBL_DECO_RUNE]] exactly.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[124][chipId]` from a `RuneChipBag` slot (`RuneChipBag.as:621`). Also stored as `chipId` on player runtime chip-bag entries. |
| `name` | string | Vietnamese display name (e.g., `"Mảnh Vỡ Phù Văn Sinh"`). Displayed in `TipRuneChip.as:196` via `chipNameLabel.text`. |
| `iconCode` | int | Icon asset code (13-digit). Passed to `ResManager.getIconUrl(iconCode)` at `TipRuneChip.as:194`. |
| `kind` | int | Chip category matching the rune `kind` field: `1`=Nhân vật (character rune chip), `2`=Pet (pet rune chip). 38 records each. |
| `num` | int | Number of these chips required to perform one exchange for the target rune. Read in `TipRuneChip.as:189` as `_local_5 = _local_2["num"]`; displayed in tooltip as `Language.DECORATE_PANEL[61].replace("{num}", num).replace("{name}", runeName)`. |
| `rid` | int | ID of the target [[TBL_DECO_RUNE]] record this chip exchanges into. Read in `TipRuneChip.as:187` as `_local_3 = _local_2["rid"]`; used to fetch the rune's name and quality color for the tooltip. |

## Value distributions / sentinels

- `kind`: `1`×38, `2`×38. Exactly equal split between character and pet rune chips.
- `num`: observed as `10` in the first record (`"Mảnh Vỡ Phù Văn Sinh"`, `num=10`). `(inferred from data — only one sample confirmed; full distribution not enumerated)`.
- `rid`: references rune IDs in [[TBL_DECO_RUNE]] where `canExchange=1` (76 such runes, one chip per exchangeable rune).

## Client usage

- `TipRuneChip.as:184–197` — primary chip tooltip: reads `rid` to look up target rune's `qulity`/`name` in [[TBL_DECO_RUNE]], reads `name` and `num` for display text, reads `iconCode` for chip icon image.
- `RuneChipBag.as:619,621` — iterates player chip bag entries; reads `chipId` from each bag slot, loads `GameData.d[GamePredef.TBL_RUNE_CHIP][chipId]`, sets slot type to `GamePredef.TBL_RUNE_CHIP`.
- `DecoratePanel.as:9149` — builds a chip-count map keyed by `chipId` from player instance data.
- `DecoratePanel.as:9163` — reads `chipId` from a rune record to index the chip map.
- `PRSChipBag.as:455` — reads `chipId` from chip bag slot data (PRS variant of the Decorate panel).
- `PRSShowCvs.as:716` — compares `_local_18[_local_19]["chipId"]` to `_local_9["needChipId"]` to validate chip possession for an exchange.
- `PRSSlotItem.as:49,154,156` — stores `chipId` on a UI slot item; calls `_core.remote.call("exchangePRSChip", null, _core.cid, chipId)` to trigger the exchange RPC.

## Related tables

- `rid` → [[TBL_DECO_RUNE]] (target rune the chip exchanges into; only `canExchange=1` runes have a chip).
- `chipId` field on [[TBL_DECO_RUNE]] records back-references this table.
- Used within the Decorate system alongside [[TBL_DECO_SHOW]] and [[TBL_DECO_HOLE]].
