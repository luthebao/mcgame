# TBL_FAIRY

| Property | Value |
|---|---|
| Table ID | 87 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_FAIRY.json` |
| Client constant | `GamePredef.TBL_FAIRY = 87` |

## Purpose

Runtime/instance table for player-owned fairy companions. The static JSON export is empty because rows are per-character server-side state, not design-time records. Each fairy instance belongs to one player character and is delivered from the server as part of the login or fairy-panel RPC response. The client stores received instances in `_core.player.fairyList` (an Object keyed by fairy `id`), not in the `GameData.d[87]` slot — no `GameData.d[TBL_FAIRY]` read was found in the codebase, confirming the table slot is unused for lookup; the constant exists only to reserve the table ID.

## Key reference

Fields confirmed from `.as` usage on fairy instance objects (`_core.player.fairyList[id]`, `_arg_1` in `onAddFairy`):

| Key | Type | Function |
|---|---|---|
| `id` | int | Instance primary key. Used as the key in `fairyList` map and passed to RPCs like `changeFairyState` (`FairyManagerPanel.as:1235`). |
| `tid` | int | Foreign key → `TBL_FAIRY_TEMPALTE.id`. Resolved to `tData` via `getData(TBL_FAIRY_TEMPALTE, tid)` in `onAddFairy` (`FairyManagerPanel.as:1155`). |
| `name` | string | Display name of this instance (may override template name). Shown in alert messages and list label (`FairyManagerPanel.as:1117`, `FairyManagerPanel.as:1173`). |
| `exp` | int | Accumulated fairy experience. Level is derived client-side via `FairyLogic.expToLv(exp)` (`FairyManagerPanel.as:1122`, `FairyManagerPanel.as:1867`). |
| `state` | int | Active/inactive flag. `1` = active (deployed), other = inactive. Checked at `FairyManagerPanel.as:1230`, `1362`, `1397`, `1425`. |
| `cc` | int | Instance-level colour-code override for the fairy's nameplate/tint. `0` = use template `cc`. Checked at `FairyManagerPanel.as:1853`. |
| `sta` | int | Stamina base value (may be template value copied onto instance or overridden). Used in stat display formula alongside `staG` (`FairyManagerPanel.as:1874`). |
| `staG` | float | Stamina growth rate per level. Sourced from template but carried on instance object after `onAddFairy` decoration. |
| `ste` | int | Strength base value. |
| `steG` | float | Strength growth rate. |
| `agi` | int | Agility base value. |
| `agiG` | float | Agility growth rate. |
| `inte` | int | Intelligence base value. |
| `inteG` | float | Intelligence growth rate. |
| `ener` | int | Energy base value. |
| `enerG` | float | Energy growth rate. |
| `tData` | Object | Client-side decoration: the resolved `TBL_FAIRY_TEMPALTE` row, attached to the instance by `onAddFairy`. Not a server field. |
| `skillFlag` | Object | Client-side decoration: map of skill-slot index → skill data. Populated by `FairySkillCanvas.as:1181/1191`. Not a server field. |

## Client usage

- `FairyManagerPanel.as:1153–1163` (`onAddFairy`) — receives a fairy instance object from the server, resolves `tid` → template, decorates with `tData`, stores in `player.fairyList[id]`.
- `FairyManagerPanel.as:1610` — `player.fairyList = _arg_1` (bulk assignment from an `initFairyList`-style callback).
- `FairyManagerPanel.as:1355–1381` — iterates `player.fairyList` to build the active-fairy selection list.
- `FairyManagerPanel.as:1867–1883` — reads `exp`, `sta`/`staG`…`ener`/`enerG`, `state` for the stat display panel.
- `FairySkillCanvas.as:1179–1191` — adds `skillFlag` sub-map to a fairy instance.
- `Player.as:36` — `public var fairyList:Object` declaration; iterated at `:782`.
- `GamePredef.TBL_FAIRY = 87` declared at `GamePredef.as:578` but `GameData.d[87]` is never read — the constant reserves the slot only.

## Related tables

- `tid` → [[TBL_FAIRY_TEMPALTE]] (static species definition: base stats, growth, sprite).
