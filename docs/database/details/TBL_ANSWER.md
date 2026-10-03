# TBL_ANSWER

| Property | Value |
|---|---|
| Table ID | 61 |
| Record count | 3627 |
| JSON | `docs/database/game_data/TBL_ANSWER.json` |
| Client constant | `GamePredef.TBL_ANSWER = 61` |

## Purpose

Stores the question bank for in-game quiz events (Maze question panels and the general Answer panel). Each row is a single multiple-choice question with four answer options and the correct answer key. The table has no secondary index (`TBL_INDEX_ARRAY[61] = null`), so the client accesses questions by direct id: `GameData.d[61][questionId]` (`MazeQuestionPanel.as:281`).

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this question. Looked up directly as `GameData.d[61][id]`. |
| `t` | string | Question text (Vietnamese). Displayed in the quiz UI as the question prompt. Read at `AnswerPanel.as:379`, `MazeQuestionPanel.as:284`. |
| `a` | string | Answer option A text. Displayed on button `sela` (`AnswerPanel.as:380`, `MazeQuestionPanel.as:284`). |
| `b` | string | Answer option B text. Displayed on button `selb` (`AnswerPanel.as:381`, `MazeQuestionPanel.as:284`). |
| `c` | string | Answer option C text. Displayed on button `selc` (`AnswerPanel.as:382`, `MazeQuestionPanel.as:284`). |
| `d` | string | Answer option D text. Displayed on button `seld` (`AnswerPanel.as:383`, `MazeQuestionPanel.as:284`). |
| `r` | string | Correct answer key: `"A"`, `"B"`, `"C"`, or `"D"` (3 records use lowercase `"c"` — data inconsistency). Client compares the player's choice against `r` at `MazeQuestionPanel.as:459`: `if (_local_3.r == _arg_1)`. |

## Value distributions / sentinels

- `r`: `"A"`×897, `"B"`×1133, `"C"`×897, `"D"`×697, `"c"`×3 (lowercase — data inconsistency; server/client string comparison may fail for these 3 rows unless case-insensitive).
- Answer distribution is broadly balanced (A: 25%, B: 31%, C: 25%, D: 19%).

## Client usage

- `MazeQuestionPanel.as:281–284` — fetches question by `id` from `GameData.d[TBL_ANSWER]`, populates `mazeQuestion` text field replacing `{question}`, `{a}`, `{b}`, `{c}`, `{d}` placeholders.
- `MazeQuestionPanel.as:459` — compares player's answer string against `r` to count correct answers (`_rightNum`). After all questions answered, calls RPC `answerMazeQuestion` with `{answerNum, rightNum}`.
- `MazeQuestionPanel.as:478` — same pattern in a second question-display path.
- `AnswerPanel.as:379–383` — sets `answerTitle.text = answerData.t` and button labels from `a`, `b`, `c`, `d`.
- `QuestioningPanel.as:717` — `_qObj = gameData[TBL_ANSWER][arg_1.qid]` — fetches a question when the server pushes a quiz event with a `qid` field.
- `MQDTPanel.as:265` — same pattern for a distinct quiz panel variant.

## Related tables

- No foreign-key links to other game tables. Questions are standalone.
- Used by quest-type events and maze events; the question id list is supplied at runtime by the server, not stored in this table.
