# TBL_CREATURE

| Property | Value |
|---|---|
| Table ID | 12 |
| Record count | 2016 |
| JSON | `docs/database/game_data/TBL_CREATURE.json` |
| Client constant | `GamePredef.TBL_CREATURE = 12` |

## Purpose

Static template for every creature in the world: wild monsters, NPCs, and capturable pets. The client builds a primary lookup `GameData.d[12][id]` and a secondary index keyed by `classId` (`TBL_INDEX_ARRAY[12] = "classId"`). Both monster battles and the pet system (TipCre, PetManagerPanel, PetHandbook, SmallGame capture mini-game) read from this table. `LINK_TYPE_ARRAY[12] = "M"` marks creatures as game-object entities.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Accessed as `GameData.d[12][id]`. Referenced in [[TBL_CREATURE_SKILL]] and [[TBL_CREATURE_LOOT]] as `cid`. |
| `name` | string | Vietnamese display name (e.g. `"Kẻ Lang Thang"`). Shown in TipCre tooltip and pet panels. Names sometimes include `【...】` variant annotations stripped by `.split("【")[0]` in the UI. |
| `classId` | int | Creature class (1–7). Maps to `GamePredef.CREATURE_CLASS_*` constants: `1`=Human, `2`=Monster, `3`=Plant, `4`=Machine, `5`=Devil, `6`=Dragon, `7`=Boss. Drives `CREATURE_CLASS_NAME` / `CREATURE_CLASS_INFO` tooltips (`TipCre.as:2284–2285`). Secondary index key for this table. |
| `classIds` | int | Extended creature type classification (1–16); values 8–16 cover additional sub-types not present in `classId` (e.g. `10`=guardian/fairy pet, `11`=generic pet, `12`=mount-type). PetGuardPanel checks `classIds == 10` to restrict guardian pet slots (`PetGuardPanel.as:1611`); PetHandbook checks `classIds != 10` to restrict evolution options (`PetHandbook.as:2431`). |
| `qLevel` | int | Quality tier of the creature (0–5); selects prefix from `GamePredef.CREATURE_QLEVEL` array (e.g. index `1`=common, `2`=rare, `3`=elite). Shown alongside `classId` in pet tooltip (`TipCre.as:2284`). Also gates skill-up item cost multiplier (`PetManagerPanel.as:7605`). |
| `element` | int | Elemental affinity: `0`=none, `1`=Light, `2`=Dark, `3`=Wind, `4`=Thunder, `5`=Water, `6`=Fire. Mapped to color and name via `GamePredef.ELEMENT_COLOR` / `ELEMENT_NAME` (`TipCre.as:2347`). Pet icon also shows element sprite `ResManager.ELEMENT_KIND[element]` (`PetManagerPanel.as:8876`). |
| `resCode` | int | SWF asset code for the creature sprite. Passed to `ResManager.getResUrl(resCode)` to load the battle/map sprite (`TipCre.as:2287`, `GameIntroPanel.as:8108`). |
| `iconCode` | int | Icon asset code. Passed to `ResManager.getIconUrl(iconCode)` for UI portrait display (`PetCanvas.as:667`, `TipMonsterHeart.as:368`). Also compared in the SmallGame capture mini-game (`SmallGame.as:35`). |
| `catchable` | int | Capture difficulty: `0`=uncatchable ("Không thể bắt", `TIPCRE_S[1]`); `>0`=capture difficulty level shown in tooltip (`TIPCRE_S[15]`). Checked in SmallGame (`SmallGame.as:29`) and PetHandbook (`PetHandbook.as:3903`). 1821 of 2016 records are uncatchable (`0`). |
| `useLv` | int | Minimum player level required to equip/use this pet. Shown as "Cấp độ mang theo: {useLv}" (`TIPCRE_S[11]`, `TipCre.as:2297`). Checked before pet can be deployed (`PetManagerPanel.as:9372`, `BagPanel.as:11075`). |
| `life` | int | Base HP of the creature template. Displayed in creature tooltip (`TipCre.as:2361`). Range: 3 500–9 999 999. |
| `growBase` | float | Growth coefficient for pet attribute scaling per level. Displayed as "grow rate" in TipCre (`TipCre.as:2359`). Typical values: `0.80` (969 records) or `1.00` (1043 records). Also drives `colorByGrowRate` in PetFuncPanel evolution check. |
| `attStrength` | int | Base Strength attribute. Shown in pet stat display (`TipCre.as:2349`). Range 0–60 000. |
| `attAgility` | int | Base Agility attribute (`TipCre.as:2350`). |
| `attStamina` | int | Base Stamina attribute (`TipCre.as:2351`). |
| `attIntelligence` | int | Base Intelligence attribute (`TipCre.as:2352`). |
| `attEnergy` | int | Base Energy/Spirit attribute (`TipCre.as:2353`). |
| `attLuck` | int | Base Luck attribute. Nearly always `0`; one record has `10`. (inferred from data — no UI display confirmed) |
| `aptStrength` | int | Aptitude cap for Strength growth (shown with `±20%` tolerance in TipCre, `TipCre.as:1192`). Drives the pentagon chart display (`TipCre.as:2363`). Range 0–60 000. |
| `aptAgility` | int | Aptitude cap for Agility (`TipCre.as:1193`, `2355`). |
| `aptStamina` | int | Aptitude cap for Stamina (`TipCre.as:1194`, `2356`). |
| `aptIntelligence` | int | Aptitude cap for Intelligence (`TipCre.as:1195`, `2357`). |
| `aptEnergy` | int | Aptitude cap for Energy (`TipCre.as:1196`, `2358`). |
| `propHit` | int | Base hit (accuracy) combat stat. Copied onto the runtime `Player` object (`Player.as:89`). (inferred from data — no direct UI template read found) |
| `propDodge` | int | Base dodge (evasion) combat stat (`Player.as:114`). (inferred from data — no direct UI template read found) |
| `propCritical` | int | Base critical strike rate (`Player.as:38`). (inferred from data — no direct UI template read found) |
| `propSpeed` | int | Base speed stat (`Player.as:137`). (inferred from data — no direct UI template read found) |
| `propCombo` | int | Base combo attack rate (`Player.as:182`). (inferred from data — no direct UI template read found) |
| `propCounter` | int | Base counter-attack rate (`Player.as:84`). (inferred from data — no direct UI template read found) |
| `propDefy` | int | Base status-defiance / CC resistance (`Player.as:156`). (inferred from data — no direct UI template read found) |
| `propReborn` | int | Resurrection/rebirth combat property. Mostly `0`; non-zero on 45 elite/boss records. (inferred from data — no direct UI template read found) |
| `resiDefy` | int | Penetration resistance ("Kháng Xuyên", `Language.WAR_SPRITE_PROP_TOTAL[61]`). Shown in WarSpritePanel. Sentinel values: `10000` (68 records) and `99999` (21 records) indicate near-total or absolute penetration immunity. Empty string on 821 records (treated as `0`). |
| `aiid` | int | AI behaviour profile ID. Empty on 1874 records (no special AI); non-empty values (e.g. `202`, `111`) reference an AI definition. (inferred from data — no client field usage found outside GameData loading) |
| `skill` | string | JSON array string of active skill definitions (appears as `"["` prefix when non-empty). Used only server-side at battle initialisation; no direct client template-field read found. (inferred from data — no direct client UI read confirmed) |
| `colorCode` | int | Hue rotation value for the creature sprite tint. `0`=no tint (1176 records), `180` and `-180`=red/inverted palette (boss recolours). Applied at render time. |
| `brightCode` | int | Brightness/lighting preset code. `0`=default (1480 records); non-zero values are sprite lighting overrides. |
| `isBind` | bool(0/1) | Whether the creature is bound-to-account when caught as a pet. Only 1 record has `1`. |
| `showAble` | int | Visibility/display flag: `-1`=visible on map (1890 records), `1`=hidden/special spawn (124 records), `0`=invisible (2 records). (inferred from data — no direct UI read confirmed) |
| `msg` | pipe-list | Pipe-separated `\|` Vietnamese combat quotes / flavor dialogue shown to the player during encounter (e.g. `"Ai nói sao biển không thể sinh sống ở sa mạc chứ?|..."`. 710 of 2016 records are non-empty. (inferred from data and string format — no direct `temp.msg` client UI read found) |
| `propCombo` | int | (see above; duplicate alias in data — covered under propCombo) |

## Value distributions / sentinels

- `catchable`: `0`×1821 (uncatchable monsters), `1`–`12`×195 (capturable pets at varying difficulty).
- `classId`: `1`×307 (Human), `2`×200 (Monster), `3`×137 (Plant), `4`×156 (Machine), `5`×424 (Devil), `6`×72 (Dragon), `7`×720 (Boss).
- `classIds`: `11`×739, `12`×386, `10`×136, `5`×144 — extends `classId` with finer pet sub-type classification.
- `element`: `0`×1804 (no element), 1–6 ×36–42 each.
- `isBind`: `0`×2015, `1`×1.
- `showAble`: `-1`×1890, `1`×124, `0`×2.
- `qLevel`: range 0–5.
- `growBase`: `1.00`×1043, `0.80`×969; outliers `0.00`, `0.50`, `1.50`, `9.99` (one each).
- `resiDefy`: `0`×935, empty×821 (=0), `10000`×68, `99999`×21 (near-full penetration immunity).
- `useLv`: `200`×689, `0`×337, `1`×279, `50`×134, `80`×113 — most catchable pets require lv 200 (endgame gate).
- `aiid`: empty×1874 (default AI); 142 non-empty records spread across ~25 distinct AI IDs.

## Client usage

- `TipCre.as:1192–1196, 2283–2363` — primary template reader: name, classId, qLevel, element, iconCode, resCode, useLv, catchable, att*, apt*, growBase, life, colorCode, all rendered in the creature tooltip.
- `SmallGame.as:29, 35` — capture mini-game: filters by `catchable > 0` and matches by `iconCode`.
- `PetManagerPanel.as:7605, 8874–8877, 9372, 9375` — pet management panel reads classId, element, useLv, qLevel for display and gating.
- `PetHandbook.as:2431, 3903–3908` — pet handbook reads catchable, classIds for display and evolution gating.
- `GameIntroPanel.as:6749–6754, 8108` — intro/showcase panel reads classId, element, useLv, resCode.
- `PetEvolutionPanel.as:2239, 4685, 4705` — evolution panel checks classId and classIds.
- `PetFuncPanel.as:2427, 2902, 4487` — pet functions panel reads classIds, growBase.
- `PetGuardPanel.as:1611, 1699, 2459` / `PetGuardInSidePanel.as` — guardian pet panel requires `classIds == 10` and `useLv >= 50`.
- `BagPanel.as:11075` — bag slot checks `useLv > player.level` before equipping.
- `Creature.as:25–70` — runtime creature object carries `aptStrength`, `aptAgility`, `aptStamina`, `aptIntelligence`, `aptEnergy`, `growBase`, `resCode`, `iconCode`, `element`, `catchable`, `qLevel` as live properties populated from this template.

## Related tables

- `id` → [[TBL_CREATURE_SKILL]] (`.cid`): skill loadout per creature.
- `id` → [[TBL_CREATURE_LOOT]] (`.cid`): drop table per creature.
- `id` → [[TBL_CREATURE_HANDBOOK]] (`.relateId`): pet compendium entry linking back to this template.
- `element` → [[TBL_ELEMENT_TEMPLATE]] (element stats and interaction rules).
- Spawn roster: [[TBL_MAP_CREATURE]] references these IDs for per-map encounter pools.
