# TBL_CLASS

| Property | Value |
|---|---|
| Table ID | 11 |
| Record count | 6 |
| JSON | `docs/database/game_data/TBL_CLASS.json` |
| Client constant | `GamePredef.TBL_CLASS = 11` |

## Purpose

Defines the 6 playable character classes (Chiến Binh, Nhạc Công, Danh Y, Xạ Thủ, Thợ Săn, Hiệp Sĩ). Stores per-class base attributes, growth aptitudes, display assets (icon/sprite/res codes), color customization, lore text, and starting skill sets. Loaded as a flat array — `TBL_INDEX_ARRAY[TBL_CLASS] = null` and `TBL_INDEX_ARRAY2[TBL_CLASS] = null` (no secondary index; accessed by array position via `getGameDataList(GamePredef.TBL_CLASS)[classId - 1]`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (1–6). Matches `Creature.classId` / `player.classId`. |
| `name` | string | Display name of the class (e.g. `"Chiến Binh"`). Shown in item class-restriction tooltips (`TipItem.as:999`, `TipEquip.as:1616`, `TipWing.as:2116`). |
| `classDescription` | string | Pipe-delimited lore block rendered on the class-select screen (`CharSelectCanvas.as:2753`, `ClassHeadCanvas.as:113–115`). Format: `"Tag1|Line1|Tag2|Line2|…"`. |
| `schoolDescription` | string | Extended school/faction lore paragraph. Displayed below `classDescription` on class selection. |
| `descriptionMale` | string | Character backstory shown for the male variant of this class. |
| `descriptionFemale` | string | Character backstory shown for the female variant. |
| `aptStrength` | int | Strength aptitude (growth rate in ±20% notation). Shown in `TipCre.as:1192`. Max value in data: 2500 (Chiến Binh, Hiệp Sĩ). |
| `aptAgility` | int | Agility aptitude. |
| `aptStamina` | int | Stamina aptitude. |
| `aptIntelligence` | int | Intelligence aptitude. |
| `aptEnergy` | int | Energy/spirit aptitude. |
| `attStrength` | int | Base strength stat at character creation. Used in `TipCre.as:2037/2349`. |
| `attAgility` | int | Base agility stat. |
| `attStamina` | int | Base stamina stat. |
| `attIntelligence` | int | Base intelligence stat. |
| `attEnergy` | int | Base energy stat. |
| `resCodeMale` | int | SWF resource code for the male character sprite. Used to load/compare the player's current appearance (`CharSelectCanvas.as:2743`, `CallBack.as:3460`, `CreatureView.as:10006`). |
| `resCodeFemale` | int | SWF resource code for the female character sprite (`DressPanel.as:2786`, `PVPGroupPanel.as:2130`). |
| `resCodeMale2` | int | Secondary male res code (alternate pose or costume layer). |
| `resCodeFemale2` | int | Secondary female res code. |
| `iconCodeMale` | int | Icon code passed to `ResManager.getIconUrl()` for the male class avatar (`ClassHeadCanvas.as:123/183`). |
| `iconCodeFemale` | int | Icon code for the female class avatar (`ClassHeadCanvas.as:124/191`). |
| `imgCodeMale` | int | Mid-size portrait code for male (`CharactorSelectCanvas.as:286` uses `largeImgMale`; `imgCode` is the medium variant). |
| `imgCodeFemale` | int | Mid-size portrait code for female. |
| `largeImgMale` | int | Large character portrait code for male, used on character selection screen (`CharactorSelectCanvas.as:286`, `CharSelectCanvas.as:2745`). |
| `largeImgFemale` | int | Large character portrait for female (`CharSelectCanvas.as:2751`). |
| `colorCodeMale1` | int | Primary hue-shift offset for male sprite colorization (`CharSelectCanvas.as:2744`). |
| `colorCodeMale2` | int | Secondary hue-shift offset for male. Value `"-100"` in sample = negative offset. |
| `colorCodeMale3` | int | Tertiary hue-shift offset for male. |
| `colorCodeFemale1` | int | Primary hue-shift offset for female sprite (`CharSelectCanvas.as:2750`). |
| `colorCodeFemale2` | int | Secondary hue-shift offset for female. |
| `colorCodeFemale3` | int | Tertiary hue-shift offset for female. |
| `brightCode` | int | Lighting/brightness preset applied to the character's view object (`StageMain.as:255`, `CreatureView.as:7189`). `0` = default. |
| `startItem` | string | Pipe-delimited list of item template IDs granted at character creation. Empty string for all 6 classes in this export (no starter items configured). |
| `startSkill` | pipe-list | Pipe-delimited list of skill IDs granted at creation (e.g. `"1010|1086"`). Two skills per class. References [[TBL_SKILL]]. |

## Value distributions / sentinels

Aptitude values by class (str/agi/sta/int/eng):

| id | name | aptStr | aptAgi | aptSta | aptInt | aptEng |
|---|---|---|---|---|---|---|
| 1 | Chiến Binh | 2300 | 2100 | 2500 | 1500 | 1600 |
| 2 | Nhạc Công | 1500 | 2200 | 1600 | 2200 | 2500 |
| 3 | Danh Y | 1800 | 1500 | 1900 | 2400 | 2400 |
| 4 | Xạ Thủ | 1600 | 1700 | 1700 | 2700 | 2300 |
| 5 | Thợ Săn | 2000 | 2000 | 2000 | 2000 | 2000 |
| 6 | Hiệp Sĩ | 2500 | 2200 | 2200 | 1500 | 1600 |

- `brightCode`: all 6 = `0`.
- `startItem`: all 6 = `""` (empty; starter items not configured in this data export).

## Client usage

- `CharSelectCanvas.as:2743–2753` — reads `resCodeMale/Female`, `colorCodeMale/Female1`, `largeImgMale/Female`, `classDescription` for the class selection UI.
- `ClassHeadCanvas.as:113–124/183–191` — `classDescription` split on `|`, `iconCodeMale/Female` passed to `ResManager.getIconUrl()`.
- `TipItem.as:999`, `TipEquip.as:1616`, `TipWing.as:2116` — iterates `getGameDataList(TBL_CLASS)` to build the "usable by" class-name string for tooltips.
- `TipCre.as:1192–1194/2037–2038/2349–2350` — `aptStrength/Agility/Stamina` and `attStrength/Agility` displayed in creature/pet tooltip pentagon.
- `CallBack.as:3460` — `resCodeMale/Female` used to set player character visual on login.
- `CreatureView.as:10006–10010` — `resCodeMale/Female` compared against `gameObject.resCode` to validate character appearance.
- `DressPanel.as:2786`, `PVPGroupPanel.as:2126/2130` — `resCodeMale/Female` for dress preview and PvP group card display.
- `StageMain.as:255`, `CreatureView.as:7189` — `brightCode` applied to scene object.

## Related tables

- `startSkill` → [[TBL_SKILL]] (skill IDs granted at creation).
- `startItem` → [[TBL_ITEM_TEMPLATE]] or [[TBL_EQUIPT_TEMPLATE]] (item template IDs; empty in this export).
- `resCodeMale/Female` → asset system (SWF resource codes, not a game-data table).
- `id` is referenced by `Creature.classId` / `player.classId` → [[TBL_CHARACTOR]].
