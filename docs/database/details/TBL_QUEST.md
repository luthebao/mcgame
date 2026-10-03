# TBL_QUEST

| Property | Value |
|---|---|
| Table ID | 45 |
| Record count | 5530 |
| JSON | `docs/database/game_data/TBL_QUEST.json` |
| Client constant | `GamePredef.TBL_QUEST = 45` |

## Purpose

Defines every static quest template in the game: lifecycle metadata (giver NPC, completion NPC, dialogue text), eligibility gates (level range, class, rebirth tier, prerequisite quests), reward parameters (EXP, currency type/amount, item award mode), and display color. The client builds two secondary indexes: `TBL_INDEX_ARRAY[45] = "subType"`, `TBL_INDEX_ARRAY2[45] = "startNpc"`, and `TBL_INDEX_ARRAY3[45] = "type"`, enabling lookup by quest category, giver NPC, and type bucket simultaneously.

## Quest lifecycle

```
preQuestType check (AND/OR of TBL_QUEST_PRE entries)
  → minLevel / maxLevel gate (or levelRe if isRebirth > 0)
  → reqClass / gender gate
  → Player talks to startNpc → startText displayed
  → Quest active (TBL_QUEST_REQUIRE defines objectives; TBL_CHARACTOR_QUEST tracks progress)
  → Player returns to finishNpc (or same NPC if startNpc == finishNpc)
  → completeText displayed → TBL_QUEST_AWARD items granted
```

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up as `GameData.d[45][id]`. |
| `name` | string | Vietnamese display name of the quest. Shown in quest list, system messages, and auto-path chat links (`QuestManager.as:613`, `QuestPanel.as:308`). |
| `info` | string | Short objective description shown in the quest tracker panel (`QuestCanvas.as:1127`, `QuestManager.as:666,835`). |
| `type` | int | Quest category enum (see distributions). Maps to `GamePredef.QUEST_TYPE_*` constants. Used to bucket quests in `QuestManager` list view (`QuestManager.as:630–634`). |
| `subType` | string | Compound sub-classification in the form `"<type>-<variant>"` (e.g., `"7-9"` for loop quest variant 9) or `"-1"` for none. The client splits on `"-"` to extract the loop sub-type index (`QuestPanel.as:891`, `QuestManager.as:988`). |
| `color` | int | Quest name display color code. `0`=default (4748), `1`=special yellow (563), `2`–`4`=rarer tints. Read directly to format the clickable chat link (`QuestManager.as:634`, `QuestPanel.as:303`). |
| `startNpc` | int | NPC id (→ [[TBL_NPC]]) that gives the quest. `-1` means any NPC matching the player's classId. Drives auto-pathfinding via `setNpcState` (`QuestPanel.as:348`, `QuestManager.as:646`). Secondary index key. |
| `finishNpc` | int | NPC id (→ [[TBL_NPC]]) that accepts quest completion. `-1` = same class-NPC logic as `startNpc`. Used for auto-navigation and delivery dialogue (`QuestPanel.as:325–390`, `QuestCanvas.as:1176`). |
| `startText` | string | NPC dialogue shown when the quest is offered (`QuestPanel.as:952`). |
| `completeText` | string | NPC dialogue shown on quest completion (`QuestPanel.as:829`). |
| `awardExp` | int | Fixed EXP awarded on completion. `0` means dynamically computed (class quests use a level-scaled formula instead). Client reads `_arg_1.data.awardExp` at `QuestCanvas.as:1218`. |
| `awardExpRe` | string | Always empty in this dump (5530/5530 blank). Likely a reserved field for rebirth-EXP reward. `(inferred from data — no client usage found)` |
| `moneyType` | int | Currency type of the money reward. `-1`=none (16), `0`=none/legacy (204), `1`=bound silver, `2`=silver, `3`=bound gold, `4`=gold, `10`=battle EXP, `11`=activity points. Read in `QuestCanvas.as:1240–1261`. |
| `moneyNum` | int | Amount of currency awarded. Used alongside `moneyType` at `QuestCanvas.as:1261`. |
| `at` | int | Award distribution mode: `1`=all players receive all items (5393), `2`=player chooses one item from the award list (134), `3`=class-filtered items (only items whose `reqClass` matches the player's class) (3). Controls bag-space check and slot selection in `QuestPanel.as:985–1010`, `QuestCanvas.as:1279,1329`. |
| `rt` | int | Secondary reward currency type. `0`=none. Non-zero values mirror `moneyType` encoding (1=bound silver, 2=silver, 3=bound gold, 4=gold, 10=battle EXP, 11=activity points, 13=another currency type). Used in `QuestCanvas.as:1013–1036`. |
| `rn` | int | Amount of the secondary reward currency (`rt`). `0`=none. Read alongside `rt` at `QuestCanvas.as:1013`. |
| `minLevel` | int | Minimum player level to accept this quest. When `isRebirth > 0`, compared against `player.levelRe` instead (`Player.as:1840–1857`). |
| `maxLevel` | int | Maximum player level to accept. Same rebirth substitution as `minLevel`. |
| `isRebirth` | int (or empty) | `0` or empty = normal level check; `1` = quest is for rebirth characters only (gates on `levelRe` instead of `level`). Checked at `Player.as:1840`, `QuestManager.as:1061`. |
| `reqClass` | string | Pipe-wrapped class ID allow-list (`"\|1\|"`, `"all"`, etc.). `"all"` = any class (5409). Checked via `indexOf` at `Player.as:1865`. |
| `gender` | int | Gender restriction. Always `2` in this dump (5530/5530), which is `GamePredef.GENDER_NONE` (no restriction). Checked at `Player.as:1859`. |
| `preQuestType` | int | How prerequisite quests (TBL_QUEST_PRE) are evaluated: `0`=no prerequisites needed (11), `1`=AND — all prerequisite quests must be completed (5481), `2`=OR — at least one prerequisite quest must be completed (38). Checked at `Player.as:1882–1904`. |
| `lm` | int | Activity / daily sub-category flag. `-1`=none (5319). When `lm > 0` on a `QUEST_TYPE_ACTIVITY` quest, the client labels it `"[Hàng Ngày]"` (Daily) in the quest prefix (`QuestPanel.as:877`, Language `QUESTGUIDE_S[19]`). Values 1–10 observed. |
| `qtest` | string | Always empty in this dump. Reserved for internal QA/test flags. `(inferred from data — no client usage found)` |
| `scriptGiveUp` | string | Server-side script executed when the player abandons the quest. Empty for most quests. `(inferred from data — no client usage found in UI layer; server-executed)` |
| `aScriptText` | string | Award script identifier or tooltip key. When non-empty (length > 3), displayed as an extra award icon with a tooltip via `ResManager.ICON_QUEST_AWARD` in `QuestCanvas.as:1334–1342`. |
| `startText` | string | See above (listed once — same field). |

## Value distributions / sentinels

- `type`: `1`×140 (Newhand/Tutorial), `2`×790 (Main), `3`×285 (Class), `4`×775 (World), `6`×810 (Activity), `7`×1395 (Loop), `9`×712 (Callboard), `10`×211 (Growup), `11`×320 (Guild), `12`×92 (Lucky).
  - Type enum: `QUEST_TYPE_NEWHAND=1`, `QUEST_TYPE_MAIN=2`, `QUEST_TYPE_CLASS=3`, `QUEST_TYPE_WORLD=4`, `QUEST_TYPE_BUSINESS=5` (0 records), `QUEST_TYPE_ACTIVITY=6`, `QUEST_TYPE_LOOP=7`, `QUEST_TYPE_CHALLENGE=8` (0 records), `QUEST_TYPE_CALLBOARD=9`, `QUEST_TYPE_GROWUP=10`, `QUEST_TYPE_GUILD=11`, `QUEST_TYPE_LUCKY=12`.
- `subType`: `"-1"`×2744 (no sub-type), `"7-9"`×924 (most common loop sub-type), `"3-0"`×285, `"7-2"`×275, etc. Pattern: `"<type>-<variantId>"`.
- `at`: `1`×5393, `2`×134, `3`×3.
- `moneyType`: `2`×4279 (silver, dominant), `1`×990 (bound silver), `0`×204 (none), `3`×39 (bound gold), `-1`×16 (none/legacy), `10`×2 (battle EXP).
- `isRebirth`: empty×5462, `0`×23, `1`×45.
- `preQuestType`: `1`×5481, `2`×38, `0`×11.
- `lm`: `-1`×5319, `1`×121, `2`×31, others sparse.
- `gender`: `2`×5530 (all quests gender-neutral in this dump).
- `reqClass`: `"all"`×5409, pipe-wrapped single class×15 each (classes 1–6), mixed multi-class combos for the remainder.

## Client usage

- `QuestPanel.as` — primary quest accept/complete flow; reads `startNpc`, `finishNpc`, `startText`, `completeText`, `color`, `type`, `at`, `lm`, `name`, `subType`.
- `QuestManager.as` — quest list panel; groups by `type`, sorts by `color` and `minLevel`; reads `name`, `lm`, `isRebirth`, `maxLevel`, `minLevel`, `subType`, `nid` (loop), `num` (loop), `refresh` (loop).
- `QuestCanvas.as` — quest detail/reward display; reads `awardExp`, `moneyType`, `moneyNum`, `at`, `rt`, `rn`, `startNpc`, `finishNpc`, `aScriptText`, `lm`.
- `Player.as:1838–1904` — eligibility check on quest accept; reads `isRebirth`, `minLevel`, `maxLevel`, `gender`, `reqClass`, `preQuestType`.
- `DataManager.as:625` — assembles quest VO with `.pre` from `TBL_QUEST_PRE`.

## Related tables

- `startNpc` / `finishNpc` → [[TBL_NPC]]
- quest awards → [[TBL_QUEST_AWARD]] (keyed by `qid`)
- quest requirements/objectives → [[TBL_QUEST_REQUIRE]] (keyed by `qid`)
- quest prerequisites → [[TBL_QUEST_PRE]] (keyed by `qid`)
- active player quest state → [[TBL_CHARACTOR_QUEST]] (runtime, keyed by `cid`)
- kill-progress tracking → [[TBL_CHARACTOR_QUEST_KILL]] (runtime)
- loop quest metadata → [[TBL_QUEST_LOOP]] (referenced via `subType` `"7-<id>"`)
