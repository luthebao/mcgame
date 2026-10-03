# TBL_MEDAL

| Property | Value |
|---|---|
| Table ID | 98 |
| Record count | 573 |
| JSON | `docs/database/game_data/TBL_MEDAL.json` |
| Client constant | `GamePredef.TBL_MEDAL = 98` |

## Purpose

Defines all medal templates in the Ấn Chương (seal/medal) system. Medals are equippable items that grant a single `propType`/`propVal` stat bonus. They are organized into lineages sharing a `basicTid` (base medal family), within which `level` tracks upgrade progression. The system supports composition via `joinTid` (combining multiple medal lineages), quality tiers (`q`), and appearance slot assignment (`sid`). Medals can also be consumed for EXP (`exp`) and upgraded using `upExp`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Accessed via `GameData.d[98][medalId]` and `LINK_TYPE_ARRAY[TBL_MEDAL] = "MEDAL"`. |
| `name` | string | Vietnamese display name (e.g., `"Ấn Chương Lục Quân"`). Shown in `MedalPanel` slot labels. |
| `desc` | string | Tooltip description text. Read in `TipMedal.as` for tooltip body. |
| `iconCode` | string | Asset code passed to `ResManager.getIconUrl(iconCode)` for icon rendering (`TipMedal.as:794`). |
| `sid` | int | Slot position ID indicating which equipment slot the medal occupies. Looked up in `GamePredef.MEDAL_EQUIPT_SID[sid]` for display name (`TipMedal.as:796`). Values below 2000 are player-worn slots (`TipMedal.as:802`). Secondary index: `TBL_INDEX_ARRAY2[TBL_MEDAL] = "sid"`. |
| `basicTid` | int | Family ID linking all upgrade tiers of the same medal lineage. Primary index: `TBL_INDEX_ARRAY[TBL_MEDAL] = "basicTid"`. Used in `MedalPanel.as:2345` and `TipMedal.as:833` to enumerate all tiers: `gameDataIndex[TBL_MEDAL][basicTid]`. |
| `level` | int | Upgrade tier within the basicTid family (0 = base, 1–10 observed). Compared in `TipMedal.as:860`: only same-level medals that satisfy `joinTid` compose. |
| `clevel` | int | Character level required to equip/upgrade this medal. Checked in `TipMedal.as:811`, `MedalPanel.as:3694`, `MedalSlot.as:188`. Values include 10, 100, 105, 110, etc. |
| `exp` | int | EXP yield when the medal is consumed (disassembled). Displayed in `MedalPanel.as:4102` via `breakExp.label = medalData.exp`. |
| `upExp` | int | EXP required to upgrade this medal to the next tier. Shown in `TipMedal.as:881` and `MedalPanel.as:2337`. Compared against `player.medalExp` in `MedalPanel.as:3694`. |
| `propType` | int | Stat type ID of the medal's bonus. Looked up in `GamePredef.MEDAL_PROP_NAME[propType]` for display (`TipMedal.as:849`, `MedalPanel.as:2266`). |
| `propVal` | int | Stat bonus value (scaled ×100; displayed as `propVal / 100`). Shown in `MedalPanel.as:2266, 2338`. |
| `q` | int | Quality tier: `0`×138, `1`×107, `2`×102, `3`×102, `4`×124. `(inferred from data — no direct .q read found in UI files; likely gates what composition recipes are available)` |
| `joinTid` | string | Pipe-delimited list of `basicTid` values whose medals combine with this one for synthesis (e.g., `"|133|12|100|23|78|"`). Empty string (413 records) = no synthesis. Read in `TipMedal.as:858–866` to detect composable medals. |
| `preflag` | string | Prefix flag: `"1"` (110 records) = medal has a special prefix applied to the displayed name (`TipMedal.as:850`). Empty otherwise. |

## Value distributions / sentinels

- `q`: `0`×138, `1`×107, `2`×102, `3`×102, `4`×124.
- `level`: `0`×34, `1`×54, `2`×54, `3`×54, `4`×54, `5`×54, `6`×54, `7`×54, `8`×54, `9`×54, `10`×53.
- `preflag`: `""`×463, `"1"`×110.
- `joinTid`: `""`×413, various pipe-lists×160 (synthesis recipes).
- `propType`: spans values 1–63 with 26 distinct stat types represented.
- `clevel`: most records require level 100 (54 records) or 105 (50), with a spread from 10 to 115.

## Client usage

- `MedalPanel.as:2212` — sets slot type to `GamePredef.TBL_MEDAL`.
- `MedalPanel.as:2263–2266` — `GameData.d[TBL_MEDAL][slotGiid]`; reads `propType`, `propVal` for stat display.
- `MedalPanel.as:2337–2349` — reads `upExp`, `propType`, `propVal`; iterates `gameDataIndex[TBL_MEDAL][basicTid]` for next-level preview.
- `MedalPanel.as:3694` — compares `upExp` against `player.medalExp` to enable upgrade button.
- `MedalPanel.as:4102` — reads `exp` for disassembly EXP label.
- `TipMedal.as:794–885` — reads `iconCode`, `sid`, `clevel`, `propType`, `propVal`, `upExp`, `basicTid`, `joinTid`, `preflag` for full tooltip rendering.
- `MedalSlot.as:174, 188` — slot type check and `clevel` gate.
- `LinkEventUtil.as:160–161` — `"L_MEDAL"` link resolves to `TBL_MEDAL` for in-chat medal linking.
- `Slot.as:253, 583, 1521` — `TBL_MEDAL` case handling in generic slot.
- `ToolTipUtil.as:95, 279` — routes `TBL_MEDAL` type to `TipMedal` component.

## Related tables

- `basicTid` self-references other `TBL_MEDAL.id` records (upgrade lineage).
- `joinTid` references `TBL_MEDAL.basicTid` values for synthesis.
- `sid` → `GamePredef.MEDAL_EQUIPT_SID` (slot name lookup).
- Medal instance state (equipped, EXP) is runtime/character-scoped (not in this static export).
