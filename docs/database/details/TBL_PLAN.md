# TBL_PLAN

| Property | Value |
|---|---|
| Table ID | 42 |
| Record count | 31630 |
| JSON | `docs/database/game_data/TBL_PLAN.json` |
| Client constant | `GamePredef.TBL_PLAN = 42` |

## Purpose

Defines every individual loot/reward entry for the game's drop-plan system. A "plan" is a single item that may be awarded from a source (creature kill, quest completion, lotto draw, event, etc.). The server selects from the rows matching a given `st` (source type + source ID) by rolling against each row's `r` drop probability. The primary index is `st` (`GameData.as:8358: TBL_INDEX_ARRAY[TBL_PLAN] = "st"`), allowing fast lookup of all plan entries for a given source.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Accessed as `GameData.d[42][id]` for direct lookup, or grouped by `st` via the primary index. |
| `st` | string | Source identifier, format `"<t>-<sourceId>"`. The prefix digit equals `t`; the second segment is the source entity's ID (e.g. creature ID, scene-item ID, quest ID). This is the index key: all plan entries for one source share the same `st`. Example: `"3-161"` = creature 161's drop table. |
| `t` | int | Source type code (matches `st` prefix). Values: `1`=scene item loot, `2`=equip-template source, `3`=creature drop (largest group, 15 922 rows), `4`=dungeon/scene chest loot, `5`–`18`=various event/quest/activity source types. `(inferred from data — no client usage found for the enum mapping)` |
| `ti` | int | Template table ID of the item to award. Matches a `GamePredef.TBL_*` constant: `29`=TBL_ITEM_TEMPLATE (most common), `19`=TBL_EQUIPT_TEMPLATE, `12`=TBL_CREATURE (pet capture). Used as `GameData.d[ti][ii]` to look up the item template. Confirmed: `LottoPanel.as:3060`, `GameIntroPanel.as:4447`, `DoubleElevenPanel.as:867`. |
| `ii` | int | Item ID within the `ti` table (the template row ID). Together `ti`+`ii` form a fully-qualified item reference. Confirmed: `GameIntroPanel.as:4448`, `DoubleElevenPanel.as:868`. |
| `n` | int | Quantity / stack count to award. Most entries give `1`; multi-stack consumables use higher values (5, 10, 20, 50…). Read as `.n` in `GameIntroPanel.as:4449` and `LottoPanel.as:3084`. |
| `r` | float | Drop rate / probability weight (0.0–1.0 range observed: `0.010000`–`1.000000`). Used by the server's `getPlanByRate` roll. Values like `0.010000` (1%) or `1.000000` (guaranteed). `(inferred from data; client reads name but does not directly use the numeric value for rolls)` |
| `q` | float | Quality / growth-rate hint for the awarded item. When `ti=12` (creature/pet), `q` is the pet's growth rate displayed with `colorByGrowRate(q)`. When `ti=19` (equipment), `q*10+6` is used as a quality level override for the link token. Accessed at `LottoPanel.as:3050`, `LottoPanel.as:3079`, `AutoTaskPanel.as:886`, `TaskSweepPanel.as:1483`. `0.00` = no quality override (use template default). |
| `b` | int | Bind-on-pickup flag. `1` = item awarded bound, `0` = unbound, `-1` = special/no-bind sentinel. `100` appears on 14 rows (inferred: permanent/untradeable). Distribution: `0`×8046, `1`×23512, `-1`×58, `100`×14. `(inferred from data — no direct client usage of this field found)` |
| `p` | int | Plan condition / sub-kind ID. `0` (majority, 29 719 rows) = no condition. Nonzero values appear to reference a sub-plan or conditional requirement ID (e.g., values 11–116 that cluster as IDs). Client checks `_arg_1.p > 10` at `LottoPanel.as:3017` to branch display logic. `-1` on 118 rows = disabled/excluded. `(inferred from data)` |
| `qid` | int | Quest ID prerequisite. `-1` on 31 615 rows = no quest requirement. Nonzero values (e.g., `5143`, `5215`) link to TBL_QUEST, restricting this drop to players who have (or have completed) that quest. |

## Value distributions / sentinels

- `t` (source type): `3`×15 922 (creature drops), `2`×6 321, `14`×665, `15`×736, `16`×720, `17`×570, `9`×1 818, `4`×2 974 (scene chests), `10`×617, `13`×340, `11`×287, `1`×150 (scene-item), `5`×208.
- `ti` (template table): overwhelmingly `29` (TBL_ITEM_TEMPLATE); `19` (TBL_EQUIPT_TEMPLATE) and `12` (TBL_CREATURE) also appear.
- `n` (quantity): `1`×25 001 (79%), then 2, 3, 5, 10 in decreasing frequency.
- `b` (bind): `1`×23 512 (bound), `0`×8 046 (unbound).
- `r` (rate): `1.000000` (guaranteed) is common; rates as low as `0.010000` (1%).
- `q` (quality): `0.00` on most rows (no override); non-zero only when `ti=19` or `ti=12`.
- `qid`: `-1`×31 615; only 15 rows have a quest prerequisite.

## Client usage

- `GameIntroPanel.as:4444–4449` — reads `ti`, `ii`, `n` from a plan entry to populate a reward-preview slot (`DiscountSlot.type`, `.giid`, `.stackNum`).
- `GameIntroPanel.as:7122–7125` — same pattern for a "continual reward" slot.
- `GameIntroPanel.as:7392–7394` — daily reward slot.
- `LottoPanel.as:2051, 3116` — accesses `gameData[TBL_PLAN][id]` to display lotto award previews; reads `ti`, `ii`, `q`, `n`, `cl`.
- `LottoPanel.as:3017` — conditional: `if _arg_1.p > 10` branches display.
- `LottoPanel.as:3050` — `(Number(_arg_1.q) * 10) + 6` to derive equipment quality code.
- `LottoPanel.as:3060` — `if _arg_1.ti == GamePredef.TBL_ITEM_TEMPLATE` to branch item vs. equipment display.
- `LottoPanel.as:3079` — `colorByGrowRate(_arg_1.q)` for creature/pet color.
- `DoubleElevenPanel.as:867–868` — reads `ti`, `ii` from plan to set slot type and item ID.
- `TaskSweepPanel.as:1483, 1876, 1885, 1890` — reads `q`, `n` for task-sweep award display.
- `AutoTaskPanel.as:886–887, 1099–1114` — reads `q`, `ti`, `ii`, `n` for auto-task award preview.
- `MazeLotteryPanel.as:461` — `GameData.d[TBL_PLAN][_arg_1.planId[i]]` to show maze lottery awards.
- Primary index `TBL_INDEX_ARRAY[TBL_PLAN] = "st"` (`GameData.as:8358`) — buckets all plan entries by source type-id, enabling `O(1)` lookup of all drops for a given creature or event.

## Related tables

- `ti` → [[TBL_ITEM_TEMPLATE]] (when `ti=29`), [[TBL_EQUIPT_TEMPLATE]] (when `ti=19`), [[TBL_CREATURE]] (when `ti=12`).
- `qid` → [[TBL_QUEST]] (quest prerequisite).
- `st` second segment → creature ID in [[TBL_CREATURE]] (when `t=3`), NPC/scene item ID (other `t` values).
- Sub-plan tables (all empty in current export): [[TBL_PLAN_KIND]] (id=62), [[TBL_PLAN_REQUIRE]] (id=44), [[TBL_PLAN_AWARD]] (id=43).
