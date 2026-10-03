# TBL_STARS_TEMPLATE

| Property | Value |
|---|---|
| Table ID | 88 |
| Record count | 144 |
| JSON | `docs/database/game_data/TBL_STARS_TEMPLATE.json` |
| Client constant | `GamePredef.TBL_STARS_TEMPLATE = 88` |

## Purpose

Defines all star cultivation nodes in the Tinh Cung (Star Palace / Zodiac) system. The 12 zodiac types (`type` 1–12) each have 12 levels (1–12), yielding 144 records total. Each node specifies the stat it grants (`addProp`), the value added at this level (`addValue`), cultivation requirements (player level, money, time, star-level prereq, EXP cost), a display icon, and a description. The client uses this table for the Character Panel star tabs, upgrade timers, and level-up RPC calls.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up directly as `GameData.d[88][id]`. Also referenced via `starData.currentId` and `starData.nextId` fields on the player's star instance data. |
| `name` | string | Vietnamese display name of the zodiac sign + level combination (e.g., `"Cung Bạch Dương"`). Displayed in `CharactorPanel.as:8853` and tooltip at `TipStarReq.as:199`. |
| `description` | string | Flavour/lore text for this star node. Displayed in `ta_desc.htmlText` at `CharactorPanel.as:8854,8861`. |
| `type` | int | Zodiac type / slot index (1–12). Corresponds to character panel star slot positions. Secondary index: `TBL_INDEX_ARRAY[TBL_STARS_TEMPLATE] = "type"` (`GameData.as:8388`); `TBL_INDEX_ARRAY2[TBL_STARS_TEMPLATE] = "level"`. Each type maps to one `addProp` stat (see distribution). |
| `level` | int | Level within the zodiac type (1–12). Read at `CharactorPanel.as:8853`: label shows `"{name} Lv.{level}"`. |
| `addProp` | string | Stat property key this node boosts (e.g., `"hp"`, `"attack"`, `"defence"`, `"speed"`). 12 distinct values, one per `type`. Used via `STAR_PROP_DIC[type]` which maps type→display name at `TipStarReq.as:204`. |
| `addValue` | float | Stat amount added at this level (shown as integer when whole). Displayed as `addValue1` (current) and `addValue2` (next) in `TipStarReq.as:204,205` and `StarAdditionPanel.as:557`. |
| `reqLevel` | int | Minimum player level to begin this star upgrade. Checked at `TipStarReq.as:230`; text colored red if unmet. Values are multiples of 5 (80–175 range seen). |
| `reqMoney` | int | Gold (or bound gold per `GLOBAL_SETTING.defaultMoney`) required. Checked at `TipStarReq.as:238`. |
| `reqSeconds` | int | Cultivation duration in seconds. Used to compute the countdown timer started in `CharactorPanel.as:3133,9157–9160`. |
| `reqStarLevel` | int | Minimum total star level across all zodiac types required to unlock. Checked by summing levels at `TipStarReq.as:219–222`. `0` = no prerequisite. |
| `reqExp` | int | Star EXP cost to level up. Displayed at `TipStarReq.as:201`. |
| `resCode` | int | Asset code for the star icon. Loaded via `ResManager.getIconUrl(resCode)` at `CharactorPanel.as:9142`. |

## Value distributions / sentinels

- `type`: 12 values (1–12), 12 records each (one per level).
- `level`: 12 values (1–12), 12 records each (one per type).
- `addProp` by `type` (verified from data):
  - type 1 → `hp`, type 2 → `attack`, type 3 → `dodge`, type 4 → `defence`, type 5 → `critical`,
  - type 6 → `resiCritical`, type 7 → `hit`, type 8 → `debuffSuccRate`, type 9 → `mAttack`,
  - type 10 → `mDefence`, type 11 → `debuffResiRate`, type 12 → `speed`.
- `reqLevel`: 80 at level 1, scaling up in 5-point steps to 175 at level 12 (12 distinct values × 12 types).

## Client usage

- `CharactorPanel.as:3241,3752` — uses `_core.data.gameDataIndex2[88][1]` (type-index, level-sub-index) to seed initial star data.
- `CharactorPanel.as:3418,3247,3758` — `getNextStarId()` / `nextId` computation: walks the indexed structure to find the next node.
- `CharactorPanel.as:4649` — fires `_core.remote.call("beginStarLvUp", ..., starData.nextId)` — sends the target `id` of the desired star level.
- `CharactorPanel.as:8839–8861` — reads `currentId` and `nextId` records; displays name, level, description, addValue1/2.
- `CharactorPanel.as:9139–9144` — update during active leveling: reads `resCode` and `name` for the countdown icon.
- `StarIcon.as:138–210` — reads `currentId`/`nextId` records for addValue comparison and display.
- `StarAdditionPanel.as:544,557` — reads `tid`→`TBL_STARS_TEMPLATE[tid]` to display current bonus and STAR_PROP_DIC lookup.
- `TipStarReq.as:199–244` — full requirement tooltip: reads `name`, `level`, `reqStarLevel`, `reqExp`, `reqLevel`, `reqMoney`, `type` (for STAR_PROP_DIC), `addValue`.
- `StarInstanceMap.as:573,590` — reads `tid` from instance data → `TBL_STARS_TEMPLATE[tid]` for map annotations.
- `StarEffectPanel.as:249` — reads template for effect display.

## Related tables

- Secondary index: `TBL_INDEX_ARRAY[88] = "type"`, `TBL_INDEX_ARRAY2[88] = "level"` — allows `gameDataIndex[88][type][level]` lookups.
- Player star instance data (`starsData`, `starData.currentId`, `starData.nextId`) is runtime/character-scoped.
- This is the same system documented in `docs/memory/stars-tinh-cung.md`.
