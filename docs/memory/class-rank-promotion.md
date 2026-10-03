# Class-Rank Promotion (Phổ Cập)

Players advance through six class ranks (`cl ∈ {0..5}`: Kiến Tập → Sơ Cấp → Trung Cấp → Cao Cấp → Chuyên Gia → Tông Sư) by completing class quests (`quest.Type == 3`). Each rank gates which skills the player may learn via `data_tbl_skill.req_c_l`. Reincarnation skills (`req_c_l == 10`) gate on `character.rebirth_exp > 0` and are a parallel system, not a 7th rank.

## DB

- `player.character_progression.class_rank smallint not null default 0`
- `player.character_progression.quest_n integer not null default 0` (cumulative quest count; feeds the reward-multiplier formula)
- `player.get_character_class_progress(bigint)` returns `(class_rank, quest_n)`
- `player.upsert_character_class_progress(bigint, smallint, int)` returns boolean

Both functions are `language sql`, `security invoker`, `set search_path to ''`. Schema lives in migration `20260515192405_add_class_rank_promotion.sql`.

## Go model

- `character.Character.ClassRank int` and `character.Character.QuestN int` (`internal/domain/character/character.go`).
- DTO emits `"cl"` and `"qn"` (and `"expRe"`) — `Character.ToDTO()`.
- Repository hydration: `loadCharacterClassProgress` is called after every `FindBy*` (alongside `loadCharacterCurrencies`).
- Repository persistence: `upsertCharacterClassProgress` is called from `Update()` after `upsertCharacterCurrencies`.

## Wire-level emit sites

| Site | Behaviour |
|------|-----------|
| `auth.characterListEntry` | Returns `cl`/`qn` on every character-select row. |
| `auth.buildShowCharacterInfoPayload` | Returns real `char.ClassRank` (was hard-coded `0`). Also emits `qn`, `expRe`. |
| `group.groupCharacterPayload` | Includes `cl` and `qn` for `groupCharactorList` rows. |
| `quest.FinishQuest` handler | Sends `onUPP({cl: newRank})` whenever `applyRewards` returns `rewards["classRankUp"]`. |

## Promotion semantics

`internal/application/quest/service.go:applyRewards`:

1. Detects `questTpl.Type == predef.QuestTypeClass` (3).
2. For class quests, EXP and money use the dynamic formula `predef.CalcClassQuestExp(char.Level, char.QuestN)` / `predef.CalcClassQuestMoney(...)` — pre-bump `QuestN`, matching the client's `CLASS_QUEST_MONEY_EXP_NUM` table (`[0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5]`).
3. Always increments `char.QuestN`.
4. If class quest, bumps `char.ClassRank` (clamped at `classRankMax = 5` — silent skip at ceiling).
5. Adds `rewards["classRankUp"] = newRank` only when the rank actually changed.
6. `s.charRepo.Update(ctx, char)` persists both columns via `upsertCharacterClassProgress`.

## Skill-learn gate

`internal/application/skill/service.go:validateClassRankRequirement`:

- `template.ReqCL <= 0` → always allowed.
- `template.ReqCL == 10` → requires `char.RebirthExp > 0`, else `pkgerrors.ErrSkillRequiresRebirth`.
- Otherwise → `char.ClassRank >= int(template.ReqCL)`, else `pkgerrors.ErrInsufficientClassRank`.

Tests: `TestLearnSkill_RejectsBelowClassRank`, `TestLearnSkill_AllowsAtClassRank`, `TestLearnSkill_RejectsRebirthSkillWithoutRebirth`, `TestLearnSkill_AllowsRebirthSkillAfterRebirth`.

## Flash client contract (informational)

- Field on payloads: `cl` (Player.as:50), `qn` (Player.as:110).
- Rank-prefix display: `CLASS_LEVEL[cl] + className` (e.g. "Sơ Cấp Chiến Binh").
- Promotion toast: `CallBack.onUPP` `case "cl":` → blue system message `Bạn đã phổ cập thành: {prefix}{className}` (`CALLBACK_S[25]`).
- Skill tooltip required rank: `TipReqSkill.as:845`, replace `{proGrade}` with `CLASS_LEVEL[reqCL]`.
- Class ID → race mapping (from `req_class |N|` markers in `data_tbl_item_template`): 1=Bàn Địa, 2=Liêu Vân, 3=Linh Vũ, 4=Thiên Khung, 5=Huyền Lâm, 6=Lưu Hỏa.

## Open follow-ups

- Per-class promotion certificate items (`Bàn Địa Sơ Cấp Chứng Nhận`, etc.) are seeded but currently flavor-only; quest completion is the canonical promotion trigger. If item-driven promotion is needed later, plug an effect handler into `internal/application/item/service.go:typeHandlers`.
- Admin dashboard does not yet expose `class_rank` editing; once added, follow the [Admin edits push realtime](../../..) pattern and push `onUPP({cl: newRank})` to online players.
- No memory of class-rank reset on rebirth (`expRe` increment). If the design later resets `cl` to 0 on rebirth, push `onUPP({cl: 0})` from the rebirth handler.

## Reference

- Research: [`../research/2026-05-16_01_CLASS_LEVEL_PROMOTION_RESEARCH.md`](../research/2026-05-16_01_CLASS_LEVEL_PROMOTION_RESEARCH.md)
- Plan: [`../plans/2026-05-16_01_CLASS_LEVEL_PROMOTION.md`](../plans/2026-05-16_01_CLASS_LEVEL_PROMOTION.md)
