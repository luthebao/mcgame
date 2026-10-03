# TBL_EQUIPT_INSTANCE

| Property | Value |
|---|---|
| Table ID | 18 |
| Record count | 0 (empty — runtime instance table) |
| JSON | `docs/database/game_data/TBL_EQUIPT_INSTANCE.json` |
| Client constant | `GamePredef.TBL_EQUIPT_INSTANCE = 18` |

## Purpose

Runtime per-character equipment instance table. Each row represents one physical copy of an equippable item owned by a player: its template reference, refinement quality, durability, jewel sockets, bound status, active properties, and cosmetic overrides. No static rows exist in the client game-data dump. The server sends instance objects as AMF0 objects; the client stores them in its runtime data store and accesses them as `GameData.d[18][instanceId]`. The client link-type is `"EQ"` (`GamePredef.LINK_TYPE_ARRAY[18] = "EQ"`), used in chat-link formatting.

Classification: **per-character, per-slot runtime instance** — one row per equipment item in the game world (bag, equipped, bank).

## Key reference

Fields recovered from `TipEquip.as` (`_arg_1.inst.*`) and `Slot.as`/`EquipFunc.as` (`slotData.*` short form):

| Field | Type | Function |
|---|---|---|
| `id` | int | Instance unique ID. Used to identify the slot and send to RPCs (e.g. `jewelSet`, `jewelDel`, `getJewelData`). |
| `tid` | int | Template ID → [[TBL_EQUIPT_TEMPLATE]]. `GameData.d[19][inst.tid]` retrieves the template. (`TipEquip.as:3047`, `Slot.as:1095`) |
| `q` | int | Refinement quality level (upgrade/forge stars). Used as index into `GamePredef.EQUIPT_QUALITY[]` to compute stat multipliers (`TipEquip.as:1150`). Also drives the color prefix via `getColorByQuality(q)` and `getPreByQuality(q)`. `q >= 5` triggers the bind-bonus display; `q >= 15` triggers a further bonus tier. |
| `binded` | int | Bind state: `0` = unbound, `>0` = bound (soul-bonded). Triggers bind-bonus display branch in `TipEquip.as:3212`. (`EquipFunc.as:2741/10686`, `TipEquip.as:2853/2865/3212`) |
| `holeNum` | int | Number of jewel socket holes currently unlocked on this instance (0–10). Iterated to display jewel slots in `TipEquip.as:3259–3287`. |
| `endureLeft` | float | Current durability. Displayed as `Number(inst.endureLeft).toFixed(1)` (`TipEquip.as:3383/3387`). |
| `endureMax` | int | Instance durability cap (may differ from template `endureMax` after repairs). (`TipEquip.as:3389`) |
| `color` | int | Instance color-code override (applies color prefix/glow). `int(inst.color) > 0` activates color display in `TipEquip.as:3022`. |
| `preNameType` | int | Prefix name type index (e.g. `GamePredef.PRE_EQU_NAME[preNameType]`). Shown as a quality prefix before the item name (`TipEquip.as:3023`). |
| `upgradeNum` | int | Number of upgrade levels applied (artifact/magic weapon stage). Used as index into `GamePredef.EQUIPT_STAR_NUM[]` and `GamePredef.MW_GROW_MAP[]` for stat growth (`TipEquip.as:2876–3195`). |
| `mainProp1` | int | Instance main stat type 1 (may differ from template after rerolling). Same `EQUIPT_PROP_NAME` index. (`TipEquip.as:3178–3185`) |
| `mainPropNum1` | int | Instance value for `mainProp1`. (`TipEquip.as:2895/3182/3185`) |
| `mainProp2` | int | Instance main stat type 2. (`TipEquip.as:3188`) |
| `mainPropNum2` | int | Instance value for `mainProp2`. (`TipEquip.as:3192/3195`) |
| `bindMainPropNum1` | int | Bound-bonus value for `mainProp1` (shown as `X%` when bound). (`TipEquip.as:3215/3217/3231/3233`) |
| `bindMainPropNum2` | int | Bound-bonus value for `mainProp2`. (`TipEquip.as:3219/3225/3235/3241`) |
| `prop1` | int | Instance secondary stat type 1. (`TipEquip.as:3198`) |
| `propNum1` | int | Value for instance `prop1`. (`TipEquip.as:3200`) |
| `prop2` | int | Instance secondary stat type 2. (`TipEquip.as:3202`) |
| `propNum2` | int | Value for instance `prop2`. (`TipEquip.as:3204`) |
| `activeProp` | int | Soul (active property) type currently activated on the instance. Indexed into `GamePredef.EQUIPT_ACTIVE_NAME[]` for display (`EquipFunc.as:2873/11406`). |
| `activePropNum` | int | Soul property magnitude (percentage). Shown as `activePropNum%` in `TipEquip.as:2590/2605`. |
| `element` | int | Element affinity (for elemental equipment). `int(inst.element) > 0` triggers element display in `TipEquip.as:3006/3008`. |
| `t` | int | Expiry timestamp (Unix epoch ms). `new Date(Number(inst.t))` in `TipEquip.as:2838`. `0` or absent = permanent. |
| `t1` | int | Skill ID for artifact magic weapon skill display (`TipEquip.as:2951`). Links to [[TBL_SKILL]]. |
| `flag` | string | JSON-encoded upgrade enchantment data. Parsed with `JSONUtil.JSONfy(inst.flag)` (`TipEquip.as:3028/3161`). Empty string = no enchantment. |
| `flag2` | string | Secondary enchantment/bonus flag data. Read at `TipEquip.as:3085`. |
| `flag3` | string | Tertiary flag (parsed as JSON in `TipEquip.as:3323`). |
| `maker` | string | Character name of the crafter. Displayed as `inst.maker + Language.TIPEQUIP_S[23]` (`TipEquip.as:3396/3398`). |
| `b` | int | Short-form bind status on the `slotData` object (used by `Slot`-level tooltip, not the full `inst` object). `slotData.b <= 0` = unbound branch in `TipEquip.as:1213`; `slotData.b > 0` = bound branch at `1901`. |
| `sid` | int | Slot position ID in the player's inventory/equipment grid. Used in RPC calls (`EquipFunc.as:1450/1463`, `CallBack.as:861`) to identify which bag/equip slot holds the instance. |

## Client usage

- **`TipEquip.as`** — full inst object rendered in the advanced equipment tooltip (lines 2836–3407).
- **`Slot.as:1093–1095`** — `equIns.tid` → template lookup; `slotData.q` → quality display.
- **`EquipFunc.as`** — `binded`, `activeProp`, `activePropNum`, `holeNum` used in the upgrade/soul/jewel UI panels.
- **`CallBack.as:416/823/1560`** — `q` and `n` (name) used in broadcast drop/loot messages.
- **`LottoPanel.as:3034–3055`** — `ii` (item instance ID), `ti` (table id=18), `cl` (color), `q` (quality) used in lotto reward broadcast formatting.
- **`EquipFuncBag.as:1572–1615`** — `upItemType = GamePredef.TBL_EQUIPT_INSTANCE` set when adding equip items to upgrade queue.
- `LINK_TYPE_ARRAY[18] = "EQ"` — chat-link prefix for equipment instance hyperlinks.
- `TBL_INDEX_ARRAY[18] = null` — no secondary index; accessed only by primary ID.

## Related tables

- `tid` → [[TBL_EQUIPT_TEMPLATE]] (the static template definition).
- `t1` → [[TBL_SKILL]] (artifact weapon skill).
- Jewel sockets → [[TBL_EQUIPT_JEWEL]] (keyed by this instance's `id` as `eid`).
- `sid` / slot position → [[TBL_SLOT]] (if it exists) or server-side bag layout.
