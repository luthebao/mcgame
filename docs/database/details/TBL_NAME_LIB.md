# TBL_NAME_LIB

| Property | Value |
|---|---|
| Table ID | 80 |
| Record count | 15834 |
| JSON | `docs/database/game_data/TBL_NAME_LIB.json` |
| Client constant | `GamePredef.TBL_NAME_LIB = 80` |

## Purpose

A large pool of Vietnamese name syllables and word fragments used by the random name generator at character creation. Records are partitioned by `type`, which indicates the gender and usage category (character name component vs. monster name component). The table is secondary-indexed by `type` on load (`TBL_INDEX_ARRAY[TBL_NAME_LIB] = "type"` — `GamePredef.as:8386`), allowing the client to draw from the correct bucket when generating a name.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. |
| `name` | string | A Vietnamese name syllable or word fragment (e.g. `"Nhã Tịnh"`, `"Lệ"`). Combined with other entries from the same or related type buckets to build a full random name. |
| `type` | int | Partition key. Determines which name pool this entry belongs to. Secondary index key so the client can look up all names of a given type in one step. See distributions below. |

## Value distributions / sentinels

`type` distribution (dominant buckets):

| type | count | Inferred use |
|---|---|---|
| 31 | 13216 | Monster / NPC name pool (largest pool; `31` is the dominant bucket) |
| 10 | 1477 | Female character given-name syllables |
| 21 | 504 | Male character given-name second syllable |
| 20 | 377 | Male character given-name first syllable |
| 11 | 202 | Female character given-name second syllable |
| 0 | 58 | Shared prefix or special-use pool |

(inferred from data — exact type semantics not traced to a named constant in client source; partition behavior confirmed by `TBL_INDEX_ARRAY[TBL_NAME_LIB] = "type"` in `GamePredef.as:8386`.)

## Client usage

`TBL_NAME_LIB` is registered in `GamePredef.as:8386` with `TBL_INDEX_ARRAY[TBL_NAME_LIB] = "type"`, meaning the table is loaded into the client's indexed game-data structure and bucketed by `type` for fast random sampling. No direct UI panel code referencing `TBL_NAME_LIB` by constant name was found outside `GamePredef.as`; the constant itself is defined and indexed but the random-name generator call site was not located in the exported `.as` files. The size of the pool (15,834 records) and the `type`-based indexing are consistent with a multi-bucket name-generation system used on the character-creation screen.

## Related tables

- No direct foreign-key links. Names generated from this table are used ephemerally at character creation; the chosen name is stored on the character record → [[TBL_CHARACTOR]].
