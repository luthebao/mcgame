# TBL_CREATURE_HANDBOOK

| Property | Value |
|---|---|
| Table ID | 100 |
| Record count | 92 |
| JSON | `docs/database/game_data/TBL_CREATURE_HANDBOOK.json` |
| Client constant | `GamePredef.TBL_CREATURE_HANDBOOK = 100` |

## Purpose

The "Pet Compendium" (Thần Thú Đồ Giám) — one entry per collectible pet species. Tracks the target capture count (`activeNum1`) needed to unlock a species' handbook bonus, the stat bonus awarded on activation (`propType`/`propNum`), display information (name, description, habitat map), and up to 4 special skills unlocked through collection milestones. Entries are organised into 10 "kind" categories (`classId` 1–10) matching `PET_KIND_*` constants. The client uses three parallel indexes: by `classId` (PetHandbook tree view), by `id` (detail panel lookup), and by `relateId` (PetEvolutionPanel evolution chain lookup).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Second-level index: `TBL_INDEX_ARRAY2[TBL_CREATURE_HANDBOOK] = "id"`. Accessed directly to fetch handbook detail (`PetHandbook.as:4206`). |
| `classId` | int | Pet kind category (1–10). Maps to `Language.PET_KIND_*` constants: `1`=Hệ người (Human), `2`=Hệ dã thú (Animal), `3`=Hệ thực vật (Plant), `4`=Hệ máy (Machine), `5`=Hệ ác ma (Devil), `6`=Hệ long (Dragon), `7`=BOSS, `8`=Special, `9`=New, `10`=New2. Primary index: `TBL_INDEX_ARRAY[TBL_CREATURE_HANDBOOK] = "classId"`. Used to build the PetHandbook tree (`PetHandbook.as:3504`). Each value 1–9 has exactly 10 records; value `10` has 2. |
| `name` | string | Vietnamese display name of the handbook entry (e.g., `"Tuần Lộc Mị Ảnh"`). Shown in the handbook tree list (`PetHandbook.as:3505`). |
| `discription` | string | Vietnamese flavour/lore description of the pet species, shown as `"Mô tả:{disc}"` in the handbook detail panel (`PetHandbook.as:3926`, language string `PET_HANDBOOK_PANEL_U[108]`). |
| `mid` | int | Map ID where this pet species is typically found/capturable. Foreign key → [[TBL_MAP]].`id`. Rendered as a coloured map name in the handbook (`PetHandbook.as:3899–3901`). Empty string when no habitat is specified. |
| `relateId` | int | Foreign key → [[TBL_CREATURE]].`id`. The primary creature template this handbook entry represents. Third-level index: `TBL_INDEX_ARRAY3[TBL_CREATURE_HANDBOOK] = "relateId"`. Used by PetEvolutionPanel (`PetEvolutionPanel.as:1969, 2794, 2895`) to resolve the evolution chain. |
| `evolutionId` | int | Foreign key → [[TBL_CREATURE]].`id` of the evolved form. Empty when the species has no evolution. PetHandbook checks `!evolutionId` to hide the evolution button (`PetHandbook.as:3769`). |
| `activeNum1` | int | Number of pets of this species the player must collect to activate the handbook bonus. Displayed in the progress bar (`PetHandbook.as:3768`, `3801–3808`). Always `1500` in this dataset. |
| `activeNum2` | int | Secondary activation threshold (tier 2 bonus). `0` or empty in current data; reserved for higher milestone tiers. (inferred from data — field present but all-zero in export) |
| `activeNum3` | int | Tier 3 activation threshold. Empty in current data. (inferred from data — field present but unused in export) |
| `activeNum4` | int | Tier 4 activation threshold. Empty in current data. (inferred from data — field present but unused in export) |
| `percentFlag` | bool(0/1) | Bonus value interpretation: `0`=flat value, `1`=percentage. Used in the activation-effect display string selection (`PetHandbook.as:3783–3789`): `0` → `PET_HANDBOOK_PANEL_U[86]` (flat), `1` → `PET_HANDBOOK_PANEL_U[84]` (percent). Always `0` in this dataset. |
| `propType` | int | Stat type for the handbook activation bonus. Looked up in `Language.PROP_NAME_U[propType]` for display. Empty on 67 of 92 records (no stat bonus). Non-empty values include `4`, `5`, `6`, `7`, `11`, `13`, `31`, `32`, `58` — these are stat-type indices from the shared `PROP_NAME_U` language table. |
| `propNum` | int | Magnitude of the handbook activation bonus for `propType`. Paired with `percentFlag` to format the bonus string. Empty when `propType` is empty. |
| `skillId1` | int | First special skill unlocked at the handbook collection milestone → TBL_SKILL.`id`. Loaded into `skillSlot1` in the handbook UI (`PetHandbook.as:3885–3891`). `0` or empty = no skill. |
| `skillId2` | int | Second handbook skill (→ TBL_SKILL). |
| `skillId3` | int | Third handbook skill (→ TBL_SKILL). |
| `skillId4` | int | Fourth handbook skill (→ TBL_SKILL). |

## Value distributions / sentinels

- `classId`: `1`–`9`×10 each (balanced across 9 main kinds), `10`×2 (New2 category, sparse).
- `percentFlag`: `0`×92 — no percentage-type bonuses in this dataset.
- `activeNum1`: `1500`×92 — uniform collection threshold across all species.
- `propType`: empty×67 (no bonus), non-empty×25 (stat bonus species).
- `evolutionId`: empty×~70, non-empty×~22 (species with an evolved form).
- `mid`: empty×~60 (no habitat), non-empty×~32 (species tied to a specific map).

## Client usage

- `PetHandbook.as:3504` — primary index `gameDataIndex[TBL_CREATURE_HANDBOOK][classId]` builds the pet tree by kind, reading `name`, `id`, `relateId` per entry.
- `PetHandbook.as:3766` — secondary index `gameDataIndex2[TBL_CREATURE_HANDBOOK][handbookId]` fetches the selected species' detail: `activeNum1`, `evolutionId`, `propType`, `propNum`, `percentFlag`, `mid`, `discription`, `skillId1`–`skillId4`.
- `PetHandbook.as:4206` — direct lookup `gameDataIndex[TBL_CREATURE_HANDBOOK][cid]` to cross-reference creature IDs during collection counting.
- `PetHandbook.as:5582` — direct `GameData.d[TBL_CREATURE_HANDBOOK][id]` access during evolution state check.
- `PetEvolutionPanel.as:1969, 2794, 2895` — third index `gameDataIndex3[TBL_CREATURE_HANDBOOK][relateId]` resolves which handbook entry a given creature template belongs to, enabling evolution chain navigation.
- `GamePredef.as:8394, 8477, 8548` — three indexes registered: `classId` (primary), `id` (secondary), `relateId` (tertiary).

## Related tables

- `relateId` → [[TBL_CREATURE]]: the base creature template for this handbook entry.
- `evolutionId` → [[TBL_CREATURE]]: the evolved form's creature template.
- `mid` → [[TBL_MAP]]: habitat map where the pet can be caught.
- `skillId1`–`skillId4` → TBL_SKILL: milestone skills unlocked by completing the handbook entry.
