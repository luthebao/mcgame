# TBL_FAIRY_TEMPALTE

| Property | Value |
|---|---|
| Table ID | 86 |
| Record count | 17 |
| JSON | `docs/database/game_data/TBL_FAIRY_TEMPALTE.json` |
| Client constant | `GamePredef.TBL_FAIRY_TEMPALTE = 86` |

## Purpose

Defines the static template catalog for fairy companions (known as "thiên sứ" / angel companions). Each row describes one fairy species: its base stats at level 1 and per-level growth rates for all five attributes, plus visual asset codes. Player-owned fairy instances (stored server-side) reference a template via `tid`; the client joins to this table at runtime to resolve the display name, sprite, and stat calculations shown in `FairyManagerPanel`. Note: the table name contains a typo (`TEMPALTE` not `TEMPLATE`) that is replicated verbatim in `GamePredef.as`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[GamePredef.TBL_FAIRY_TEMPALTE][id]` (`CallBack.as:8408`, `FairyManagerPanel.as:1155`). Referenced by fairy instance field `tid`. |
| `name` | string | Vietnamese display name of the fairy species (e.g., `"Thiên Sứ Poli"`, `"Rocky"`). Shown in `FairyManagerPanel` via `tData.name` at `:1378`. |
| `cc` | int | Color code for the fairy's name plate / visual tint. `0` on all 17 records (default). If a fairy instance overrides `cc`, that takes precedence: `showCanvas.color = (fairyData.cc ? fairyData.cc : tData.cc)` (`FairyManagerPanel.as:1853`). |
| `rc` | int (13-digit) | Resource code for the fairy sprite SWF. Passed to `ResManager.getResUrl(tData.rc)` at `FairyManagerPanel.as:1848`. |
| `sta` | int | Base Stamina (thể lực) at level 1. Displayed at `FairyManagerPanel.as:1874`. Range: 5–16 across templates. |
| `staG` | float | Per-level Stamina growth rate (e.g., `"5.0"`, `"6.0"`). Used in stat formula: `sta + (level-1) * (staG + qualityBonus)` at `FairyManagerPanel.as:1874`. |
| `ste` | int | Base Strength (sức mạnh) at level 1. Displayed at `FairyManagerPanel.as:1876`. |
| `steG` | float | Per-level Strength growth rate. |
| `agi` | int | Base Agility (nhanh nhẹn) at level 1. Displayed at `FairyManagerPanel.as:1878`. Range: 5–15. |
| `agiG` | float | Per-level Agility growth rate. |
| `inte` | int | Base Intelligence (trí tuệ) at level 1. Displayed at `FairyManagerPanel.as:1880`. |
| `inteG` | float | Per-level Intelligence growth rate. |
| `ener` | int | Base Energy (năng lượng) at level 1. Displayed at `FairyManagerPanel.as:1882`. |
| `enerG` | float | Per-level Energy growth rate. |

## Value distributions / sentinels

- `cc`: `0`×17 — colour overrides are exclusive to instance data, not templates.
- Base stats (`sta`, `ste`, `agi`, `inte`, `ener`): range 5–16. Most templates are specialised (one attribute raised to 15–16, others at 5–8), except template `id=1` which is the "balanced" entry (all 5s).
- Growth rates (`*G`): float strings. Range 5.0–16.0, mirroring the same specialisation pattern as base stats.
- `rc`: all values follow the 13-digit asset code pattern `206010030000N`.

## Client usage

- `FairyManagerPanel.as:1155` — `_core.data.getData(TBL_FAIRY_TEMPALTE, fairy.tid)` called in `onAddFairy` to resolve template from incoming instance; stores result as `fairy.tData`.
- `FairyManagerPanel.as:1606` — `gameData[TBL_FAIRY_TEMPALTE][fairy.tid]` used when rebuilding the fairy list display.
- `FairyManagerPanel.as:1845–1853` — `tData.rc` loaded as sprite URL; `tData.cc` used as fallback colour if instance `cc` is absent.
- `FairyManagerPanel.as:1867–1883` — all five stat pairs (`sta`/`staG` … `ener`/`enerG`) read from the **instance** (which has been decorated with template values by `onAddFairy`) to compute `base + (level-1) * (growth + qualityBonus)`.
- `FairyDetailCanvas.as:345–349` — same stat formula applied using `_arg_1.ste/sta/agi/inte/ener` and `*G` growth fields (reads from a combined instance+template object).
- `FairySkinCanvas.as:206/426` — `GameData.d[TBL_FAIRY_TEMPALTE]` iterated to list all available fairy skins.
- `AnniversarySignInPanel.as:1301` — hard-coded `GameData.d[TBL_FAIRY_TEMPALTE][17]` to fetch a specific fairy for a sign-in reward.
- `CallBack.as:8408` — reads from this table (exact context: fairy endure/alert logic).

## Related tables

- `id` referenced by fairy instance field `tid` → [[TBL_FAIRY]] (runtime fairy instances, empty static export).
- Fairy instance stat computation requires cross-referencing both this table (base/growth) and the runtime instance (`exp`, `level`, quality bonus).
