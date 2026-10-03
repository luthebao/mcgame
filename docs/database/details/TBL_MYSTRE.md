# TBL_MYSTRE

| Property | Value |
|---|---|
| Table ID | 123 |
| Record count | 720 |
| JSON | `docs/database/game_data/TBL_MYSTRE.json` |
| Client constant | `GamePredef.TBL_PRS_CHIP = 123` (i.e., `GamePredef.TBL_MYSTRE = 123`) |

## Purpose

Defines all Mystery Treasure (Bí Bảo / MysTre) items that can be equipped on a character in the Decorate panel. Each record is one item at a specific star-and-level combination, granting a single stat bonus. The table is structured as a grid: 11 `kind` categories × 6 levels × 3 star tiers = 720 entries (with kinds 1 having 216 entries reflecting 6 item archetypes).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[123][id]`. Also used as the slot's `mid` in the player's mystery-item bag. |
| `name` | string | Vietnamese display name of the item (e.g., `"Bát Kỳ Ma Nha"`). Displayed in tooltip at `TipMysTreasure.as:324`. |
| `iconCode` | int | Asset code for the item icon. Read at `TipMysTreasure.as:321`: `ResManager.getIconUrl(iconCode)`. |
| `kind` | int | Equipment slot / category (1–11). Controls which slot on the Decorate panel accepts this item. Displayed as `MysTreShow.KIND_NAME[kind]` at `TipMysTreasure.as:325`. Values 1–5 have 72 entries each (two level/star tiers); values 6–11 have 36 entries each (one tier). |
| `level` | int | Rarity / quality tier (1–6). Determines the color of the item name via `TipDecoRune.QUL_COLOR[level]` at `TipMysTreasure.as:322`. Used as `_showArr` quality filter in `MysTreShow.as`. |
| `star` | int | Star power within the level (1–3). Displayed as star icons rendered in `TipMysTreasure.as:327–340`. |
| `propType` | int | Stat type this item boosts. Matches `AWAKEN_PROP_DICT` / `Language.TIPPROP_S` keys. Read at `TipMysTreasure.as:342`. Display formatting: raw integer for types 1,4,5,6,7,11; ÷10000 for types 8,9,13,14,31,32,58,61; ÷100 with `%` for types 34,59,60,62,63,71. |
| `propNum` | int | Magnitude of the stat bonus paired with `propType`. Read at `TipMysTreasure.as:350,360,368`. |
| `mysSil` | int | "Mystery silver" value (dissolution yield). When the player dissolves items in `DecoratePanel`, the total `mysSil × quantity` is computed at `DecoratePanel.as:4585–4586`. |
| `per` | int | Always `0` in this dump. Purpose not recovered from client usage — the field exists in the data row but is never read in any identified `.as` file. `(inferred from data — no client usage found)` |

## Value distributions / sentinels

- `kind`: 11 categories. Kind 1 has 216 entries (6 archetypes × 6 levels × 3 stars × 2); kinds 2–5 have 72 each; kinds 6–11 have 36 each.
- `level`: 1–6, 120 records per level.
- `star`: 1–3, 240 records per star.
- `per`: `0` on all 720 records.

## Client usage

- `TipMysTreasure.as:321–368` — full tooltip: reads `iconCode`, `level` (color), `name`, `kind`, `star`, `propType`, `propNum`.
- `DecoratePanel.as:4582–4586` — dissolution path: reads `mid`→`TBL_MYSTRE[mid].mysSil` × quantity for total silver.
- `MysTreBag.as:526,529` — bag rendering: loads `GameData.d[123][mid]`, sets `slot.type = GamePredef.TBL_MYSTRE`.
- `MysTreItem.as:167,171` — single item: reads `GameData.d[123][_mid]`, sets `slot.type = GamePredef.TBL_MYSTRE`.
- `MysTreShow.as:310` — uses secondary index `_dm.gameDataIndex[123][kind]` to retrieve all items of a given kind.
- `DecoratePanel.as:4584,8159,9179` — kind-dispatch: looks up by primary id and by kind index.
- `Slot.as:588,1531` — tooltip/drag dispatch routes `TBL_MYSTRE` type to `TOOLTIP_MYS_TREASURE`.
- `Core.as:2086` — template-type dispatch.

## Related tables

- `kind` grouping is indexed via `TBL_INDEX_ARRAY[TBL_MYSTRE] = "kind"` (secondary index in `GameData.as:8398`).
- Recipes that synthesize Mystre items: [[TBL_MYSTRE_RECIPE]].
- Output element after recipe crafting: [[TBL_ELEMENT_TEMPLATE]].
