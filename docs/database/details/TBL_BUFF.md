# TBL_BUFF

| Property | Value |
|---|---|
| Table ID | 66 |
| Record count | 3182 |
| JSON | `docs/database/game_data/TBL_BUFF.json` |
| Client constant | `GamePredef.TBL_BUFF = 66` |

## Purpose

Defines every buff and debuff template in the game, covering both combat status conditions (stun, sleep, charm, poison) and persistent stat-modifier effects (passive buffs applied by skills). Each row describes what visual icon to show, whether the effect grants a positive or negative modifier, which stat attributes (`prop1`–`prop6`) the buff alters, and by how much (`propNum1`–`propNum6`), with `percentFlag` controlling whether the delta is flat or percentage-based.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Looked up via `GameData.d[66][buffId]` and via runtime instance field `vo.bid`. |
| `name` | string | Vietnamese display name shown in the buff tooltip (e.g., "Định Thân"). Read in `LongBuffCanvas.as:406/523/541`. |
| `description` | string | Long-form effect text shown in the tooltip body. Read in `BuffParser.as:41` and `LongBuffCanvas.as:410/523/541`. Embedded `\r` for line breaks. |
| `codeName` | string | Internal identifier string used by game logic (e.g., `"BUFFPROP"`, `"BUFF100171"`). Used as a dictionary key in `GamePredef.notDeleteBuff` (`TipSkill.as:376`) and to deduplicate buff instances in `LongBuffCanvas.as:289/534`. |
| `iconCode` | int | Asset code passed to `ResManager.getIconUrl(iconCode)` to load the buff icon image (`LongBuffCanvas.as:402/517`). |
| `buff` | bool(0/1) | `1` = beneficial buff (shown with positive framing); `0` = debuff/status condition. Read in `LongBuffCanvas.as:403/516` and `TipSkill.as:382`. Distribution: `0`×926, `1`×2256. |
| `type` | int | Buff scope/category. `0` = in-battle stat mod (636 records); `1` = out-of-battle status (116); `2` = out-of-battle debuff (36); `3` = persistent world buff (53); `4` = general leveled buff (2302); `5`/`6` = elf-specific status variants (3/36). (inferred from data — no client enum found mapping these values by name) |
| `kind` | int | Buff family / effect class. `3`×2522 (stat modifier, positive or negative); `1`×90 (hard CC / movement-prevention); `2`×181; `5`×30 (DoT); `6`×82; `7`×7 (HoT); `9`×32; `10`×11 (skill-use lockout / silence); `11`×49; `14`×9; `15`×67; `17`–`25` (miscellaneous). No named enum was found in the decompiled client mapping these values. (inferred from data distribution and description text) |
| `level` | int | Rank of this buff row within a multi-level buff family (0 = base/generic, 1–25+ for leveled variants). Displayed in the tooltip alongside `name` when `runtime_type` is `10` or `3` (`LongBuffCanvas.as:523`). |
| `state` | int | Links to a battle status-condition code applied when this buff is active: `-1` = no extra condition (2883 records); `0` = normal (128); `10` = stun/paralysis ("Định Thân" — cannot move or attack, items allowed); `20` = light daze; `30` = sleep/charm ("Mê Hồn"); `40` = poison ("Kịch Độc"); `70` = full paralysis/petrification ("Tê Liệt", "Thạch Hóa"); `110/120/130/140` = rarer condition codes. (inferred from data names and descriptions — no explicit enum in client) |
| `targetType` | int | Who the buff applies to: `1`×2886 = target/enemy; `2`×76 = self; `3`×220 = area. (inferred from data — no client enum found) |
| `effectNum` | int | Number of battle turns / ticks the buff lasts in combat. `0` = permanent or N/A; `9999999` = indefinite; other values are turn counts (e.g., `7`, `50`, `100`). Seen in `TipWing.as:1198` on non-buff data objects sharing the field name. |
| `effectTime` | int | Real-time duration in seconds for out-of-battle buffs. `0` = combat-only (no real-time limit); `9999999` = indefinite; typical values: `3`–`999999`. |
| `percentFlag` | int | Controls how `propNum` values are interpreted: `1` = percentage delta (propNum is a percent, `%` suffix appended by `BuffParser.as:74`); `0` = flat absolute value; `-1` = no stat modifier (CC-only buff). Read in `BuffParser.as:63`. Distribution: `1`×1847, `0`×727, `-1`×608. |
| `prop1`–`prop6` | int | Stat attribute IDs modified by this buff (up to 6 simultaneous). `0` = slot unused. Index into `GamePredef.BUFF_PROP_NAME_ARR`: `1`=HP, `2`=MP, `3`=SP, `4`=Công Vật Lý, `5`=Công Ma Pháp, `6`=Thủ Vật Lý, `7`=Thủ Ma Pháp, `8`=Chính Xác, `9`=Né Tránh, `10`=Phản Kích, `11`=Tốc Độ, `12`=Liên Kích, `13`=Bạo Kích, `14`=Bỏ Qua, `15`=Miễn Vật Lý, `16`=Miễn Ma Pháp, `17`=Kháng Choáng Váng, `18`=Kháng Hỗn Loạn, `19`=Kháng Hôn Mê. Iterated by index in `BuffParser.as:68`. |
| `propNum1`–`propNum6` | int/float | Delta values for the corresponding `prop` slot. Sign encodes direction: positive = increase, negative = decrease (e.g., `propNum1=-10` with `prop1=11` = −10% speed). Rendered as `propName + "+" + propNum` (or `"%"` suffix if `percentFlag=1`) in `BuffParser.as:73–78`. |

## Value distributions / sentinels

- `type`: `0`×636, `1`×116, `2`×36, `3`×53, `4`×2302, `5`×3, `6`×36.
- `kind`: `3`×2522 (dominant — stat mod), `2`×181, `6`×82, `1`×90, `11`×49, `15`×67, `9`×32, `5`×30, `17`×16, `18`×15, `10`×11, `20`×13, `22`×13, `23`×15, `24`×10, `14`×9, `7`×7, `19`×6, `21`×6, `25`×1, `4`×1, `0`×1.
- `percentFlag`: `1`×1847 (percent), `0`×727 (flat), `-1`×608 (no stat effect).
- `targetType`: `1`×2886, `3`×220, `2`×76.
- `state`: `-1`×2883 (no condition), `0`×128, `40`×91 (poison), `10`×19 (stun), `130`×11, `140`×10, `70`×17 (paralysis), `30`×14 (sleep/charm), `20`×6, `110`×2, `120`×1.
- `buff`: `1`×2256, `0`×926.
- `effectTime` sentinel `9999999`×1911 (indefinite), `0`×1049 (combat-only).
- `effectNum` sentinel `9999999`×1911 (indefinite), `0`×978 (N/A).

## Client usage

- `BuffParser.as:23/60` — central utility that loads a buff by ID from `GamePredef.TBL_BUFF` and builds a human-readable stat-summary string by iterating `prop1`–`prop6` / `propNum1`–`propNum6` with `percentFlag` formatting.
- `LongBuffCanvas.as:281/288/392/508` — loads buff data by `vo.bid` (runtime instance ID); reads `iconCode`, `name`, `description`, `buff`, `codeName`, `level` for the persistent-buff bar UI.
- `TipSkill.as:363` — loads buff linked to a skill via `_arg_1.temp.buffId`; reads `codeName`, `buff` to decide whether to render it as a dispellable status in the skill tooltip.
- `UserBarCanvas.as:2407/2409/2706/2708/3047/3049` — reads `codeName` to check against `awakenPointDict` for awakening-skill icons displayed in the action bar.
- `GamePredef.notDeleteBuff` (GamePredef.as:3258) — a static whitelist object keyed by `codeName` (e.g., `"buff_elf_1"`) that marks buffs the client should not allow the player to manually dispel.
- `TBL_INDEX_ARRAY[TBL_BUFF] = null` (GamePredef.as:8381) — this table has no secondary index; records are accessed by raw `id`.

## Related tables

- `buffId` foreign key used by [[TBL_SKILL]] (each skill row carries a `buffId` referencing the buff it applies).
- `codeName` cross-referenced against `GamePredef.notDeleteBuff` dictionary.
- Runtime buff instances on characters reference TBL_BUFF rows via `bid`; see [[TBL_CHARACTOR_BUFF]] for the character-scoped instance table.
