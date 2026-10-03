# TBL_PET

| Property | Value |
|---|---|
| Table ID | 39 |
| Record count | 0 (empty export) |
| JSON | `docs/database/game_data/TBL_PET.json` |
| Client constant | `GamePredef.TBL_PET = 39` |

## Purpose

Runtime instance table holding each player's owned pet objects. No static rows exist in the client data dump because records are per-character and server-managed. The client builds a live lookup `gameData[39][petId]` from server-pushed data. The table is type-tagged with `LINK_TYPE_ARRAY[39] = "PET"` (`GamePredef.as:8551`) and the secondary index is `TBL_INDEX_ARRAY[39] = "cid"` (keyed by creature template ID, `GamePredef.as:8355`).

## Key reference

Fields confirmed from `.as` client usage (no static rows to inspect):

| Key | Type | Function |
|---|---|---|
| `id` | int | Pet instance ID. Used as `pet.slotData.id` in `PetConfigCanvas.as:144`, `PetPanel.as:1812`, `PetManagerPanel.as:8184`; passed to RPCs `petUpSkill`, `petDelSkill`, `petOpenSkill`. |
| `tid` | int | Creature template ID (`cid` in TBL_CREATURE). Used as `pet.slotData.tid` (`PetConfigCanvas.as:159`); also `pet.tid` (`FuncBag.as:535`) to resolve creature visuals. |
| `exp` | int | Accumulated XP of the pet instance. Converted to display level via `PetLogic.expToLv(exp)` (`PetManagerPanel.as:8186`, `TipCre.as:2035`). |
| `petName` | string | Player-assigned pet name. Displayed in `TipCre.as:2010` and `PetManagerPanel.as:8185,8198,8210,…`. |
| `colorCode` | int | Instance-level colour override. Used in `TipCre.as:2288–2290` and `PetManagerPanel.as:8858` to set nameplate colour, falling back to template `colorCode` if unset. |
| `qLevel` | int | Quality level of the pet (from creature template context). Used to index `CREATURE_QLEVEL`, `GOLD_PET_SKILLOPEN_Q`, and `ITEM_PET_SKILL_UP` arrays (`PetPanel.as`, `PetManagerPanel.as`). |

## Client usage

- `gameData[GamePredef.TBL_PET][petId]` — direct instance lookup in `PetConfigCanvas.as:211`, `PetPVEConfigCanvas.as:210`, `PetConfigCanvasActivity.as:235`.
- `player.petList` — runtime map of pet instances; iterated in `FuncBag.as:530`, `AIConfPanel.as:1506`, `AIConfPetArenaActPanel.as:1881`, `PetPVEAIConfPanel.as:1919`, `MCZDPetAIConfPanel.as:1872`.
- `TBL_INDEX_ARRAY[39] = "cid"` — secondary index for look-up by creature template id.
- `LINK_TYPE_ARRAY[39] = "PET"` — used by link/hyperlink dispatch in chat.
- Tooltip routing: `ToolTipUtil.as:74,85,269` routes `TBL_PET`-typed slots to the creature tooltip.

## Related tables

- `tid` (creature template ID) → [[TBL_CREATURE]] for visual/stat template.
- Pet skills indexed by `pid` (pet instance ID) in [[TBL_PET_SKILL]] (runtime).
- Pet soul slots indexed by `pid` in [[TBL_PET_SLOT]] (runtime).
- Guard placement references this table via `petGuardObj["petData"][sid]`.
