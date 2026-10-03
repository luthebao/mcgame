# Achievement Snapshot and Claim Baseline

The first achievement slice now has both login snapshot hydration and a minimal claim flow that matches the Flash client contract without inventing missing reward metadata:

- `onChooseCharactor` should seed `achieveLog`, `achieveReqLog`, `takeAchieveAwardLog`, and `cData.achPnt` from `achievement.Service.LoadSnapshot()`.
- `data_tbl_achievement.award` currently behaves as achievement points for the panel total (`achPnt`), not as a structured claim reward payload.
- `getAchieveAward` now safely marks `player.character_achievements.is_claimed = true` through the achievement service and pushes `updateAchieveAwardLog({aid, num})` so the client hides the claim button.
- Title-style rewards are safe when `is_award == 2` and the achievement name matches exactly one `TBL_TITLE.n` row. In that case the server grants the title, refreshes either `onAddTitle({f,t,ct})` or `onAddActTitle(cts)` based on the title list bucket, and then pushes `onAchieveTitle(name)`.
- If the title-name lookup is ambiguous, the server still records the achievement as claimed and skips the title grant rather than guessing.

## Structured rewards (added 2026-05-05)

`data.data_tbl_achievement` now has three nullable columns: `reward_type SMALLINT`, `reward_id INTEGER`, `reward_qty INTEGER`. Migration `supabase/migrations/20260505081133_add_achievement_reward_columns.sql`. All existing rows have NULL — new claims with `reward_type` set will dispatch through `handlers/achievement/rewards.go::grantStructuredReward` after the existing flow completes.

Reward type registry (constants in `rewards.go`):

| `reward_type` | Action                                                                                    |
|---------------|-------------------------------------------------------------------------------------------|
| `1` (money)   | `char.Money += reward_qty`, char saved, `onAddMoney(charID, "money", qty, balance)` push |
| `2` (gold)    | `char.Gold += reward_qty`, char saved, `onAddMoney(charID, "gold", qty, balance)` push   |
| `3` (item)    | `itemService.AddItemToSlot(reward_id, reward_qty, ItemTypeQuest, SlotTypeBag)` then `onAddItem` + `onAddCharactorSlot` |
| `4` (title)   | `titleService.GrantTitle(reward_id)` then `SendTitleGrantedCallback` (only if newly added) |

The handler is wired in `cmd/gameserver/main.go` via `achievementHandler.SetItemService(itemService)` and `SetCharacterService(charService)` (two call sites: dev path ~L384, prod path ~L919).

### Out of scope for this slice

- **No backfill from `desc`.** Free-text reward descriptions are not parsed — that's a separate ticket and could invite injection if done carelessly.
- **No EXP reward type.** EXP grants need level-up handling and aren't covered here.
- **No double-grant guard beyond `is_claimed`.** Once `repo.MarkClaimed` flips, the structured reward fires once. If the structured reward step itself partially fails (e.g. inventory full), the claim is still recorded as claimed — players have to contact a GM. A future hardening pass should make the reward-grant + mark-claimed pair transactional.
