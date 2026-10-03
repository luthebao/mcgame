# TBL_RELATIONSHIP

| Property | Value |
|---|---|
| Table ID | 48 |
| Record count | 0 |
| JSON | `docs/database/game_data/TBL_RELATIONSHIP.json` |
| Client constant | `GamePredef.TBL_RELATIONSHIP = 48` |

## Purpose

Runtime per-character social-graph table. Each row records one directed social link from the authenticated character (`selfId`) to another character (`otherId`): friend, blacklist, enemy, teacher/student, sworn-brother, or an extended type. The client caches the full list as `relationShipList` in `IMPanel` and uses it to populate the Friends, Enemies, Blacklist, Mentor, and Sworn-Brother sub-panels.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key — relationship row ID. Used to key `relationShipList[id]` in the client cache (`IMPanel.as:1899`). |
| `selfId` | int | Character ID of the authenticated player — the "from" side of the directed edge. Primary index (`TBL_INDEX_ARRAY[TBL_RELATIONSHIP] = "selfId"`). |
| `otherId` | int | Character ID of the related character — the "to" side. Secondary index (`TBL_INDEX_ARRAY2[TBL_RELATIONSHIP] = "otherId"`). Used in system-message hyperlinks (`IMPanel.as:1903`, `1909`, `1915`, `2185–2197`). |
| `name` | string | Display name of `otherId` character. Shown in list labels and system broadcast messages (`IMPanel.as:2118`, `2125`, `2132`). |
| `type` | int | Relationship category. Maps to `GamePredef.RELATIONSHIP_TYPE = [1, 2, 3, 4, 5, 6]`: `1` = friend, `2` = blacklist, `3` = enemy, `4` = tutor/teacher, `5` = sworn-brother, `6` = student (inferred — type 6 not explicitly branched in observed code). Determines which sub-list the record is added to (`IMPanel.as:3424–3492`). |
| `num` | int | Relationship count or contribution metric (used in system-message template `{relationShipListNum}`) (`IMPanel.as:2117`). Exact semantic unclear from static analysis. `(inferred from data — no client usage found beyond message substitution)` |
| `data` | Object | Optional online-presence sub-object. When non-null, contains `exp` (raw XP) and `classId` fields; signals the related character is online. Used to derive `level` and `class` display strings (`IMPanel.as:3428–3490`). |

## Value distributions / sentinels

Not applicable — empty export; all rows are live-server instances.

`type` to UI bucket mapping (from `GamePredef.RELATIONSHIP_TYPE = [1, 2, 3, 4, 5, 6]`, indexed 0–5):
- `RELATIONSHIP_TYPE[0]` = `1` → Friends list (`friendAC`)
- `RELATIONSHIP_TYPE[1]` = `2` → Blacklist (`blackAC`)
- `RELATIONSHIP_TYPE[2]` = `3` → Enemies list (`enemyAC`)
- `RELATIONSHIP_TYPE[4]` = `5` → Tutors/teachers list (`tutorAC`)
- `RELATIONSHIP_TYPE[5]` = `6` → Sworn-brothers list (`brotherAC`)

## Client usage

- `IMPanel.as:1895–1920` — `onAddRelationship(_arg_1)` stores `_arg_1` in `relationShipList[_arg_1.id]`, then fires system mid-note based on `type`.
- `IMPanel.as:3415–3500` — `buildList()` re-populates all five `ArrayCollection`s from `relationShipList`; resolves `level` and `class` from `data` sub-object when present.
- `IMPanel.as:2183–2201` — delete handler removes from `relationShipList` and fires system message via `otherId` + `name`.
- `IMPanel.as:2104–2132` — system-message templates fill `{relationShipListName}` and `{relationShipListNum}` from cached record fields.
- `CallBack.as:2122–2127` — `onAddRelationship(_arg_1)` routes to `IMPanel.onAddRelationship`.
- `CallBack.as:5414–5419` — `onAddRelationByName(_arg_1: Number, _arg_2: int)` routes to the same panel.

## Related tables

- `selfId` → [[TBL_CHARACTOR]] (owner character).
- `otherId` → [[TBL_CHARACTOR]] (related character).
- `data.classId` → [[TBL_CLASS]] (for class name display when online).
- Type `4` (tutor) relates to the mentor system alongside teacher/student data in [[TBL_CHARACTOR]].
