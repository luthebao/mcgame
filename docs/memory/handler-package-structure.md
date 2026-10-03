# Handler Package Structure

All RTMP handlers are organized by feature domain under `internal/presentation/rtmp/handlers/<feature>/`. Shared helpers live in `internal/presentation/rtmp/utils/`. Standard layout per package:

| Package | Files |
| --- | --- |
| activity | handler.go, rewards.go, panel.go, progress.go, awards.go, onboarding.go, boss_daily.go, pm_operation.go, send_combine_data.go, send_combine_buy.go |
| auth | handler.go, login.go, characters.go, misc.go, helpers.go |
| character | handler.go, leveling.go, stats.go |
| chat | handler.go, say.go, whisper.go, panel.go, helpers.go |
| combat | handler.go, battle.go, recovery.go, life_skill.go |
| farm | handler.go, helpers.go, visual.go |
| gamedata | handler.go, config.go, package_client.go, helpers.go |
| group | handler.go, requests.go, membership.go, leadership.go, broadcast.go, helpers.go |
| guild | handler.go, panel.go, membership.go, updates.go, helpers.go |
| item | handler.go, equip.go, bag.go, bag_manage.go, tempbag.go, use.go, craft.go, maker.go, mix.go, jewel.go, gem.go, hole.go, appearance.go, change_soul.go, change_element.go, change_prefix.go, change_bind.go, change_level.go, resolve.go, star.go, recover.go, notice.go, misc.go |
| magiccrystal | handler.go, init.go, actions.go, helpers.go |
| marriage | handler.go, panel.go, requests.go, helpers.go |
| npc | handler.go, npc_click.go, npc_interaction.go, npc_script.go, npc_func_other.go |
| pet | handler.go, management.go, enhancement.go, fusion.go, refresh.go, skill_slots.go, skill_delete.go, equipment.go, pet_guard.go, helpers.go |
| petarena | handler.go, data.go, fights.go, helpers.go |
| pk | handler.go, invite.go, match.go, helpers.go |
| quest | handler.go, manager.go, callboard.go, lifecycle.go, notify.go, helpers.go |
| scene | handler.go, login.go, movement.go, world.go, state.go |
| shop | handler.go, config.go, purchase.go, misc.go, vip.go |
| social | handler.go, relationships.go, teacher_student.go |
| stub | handler.go |
| title | handler.go, list.go, activation.go |
| trade | handler.go, lifecycle.go, exchange.go |

Shared RTMP utils (`internal/presentation/rtmp/utils/`): `exp_helper.go` (EXP gain + level-up callbacks), `number_helper.go` (safe float64-to-int), `secondary_password.go` (secondary password verification and caching), `life_skill_state.go` (life skill state update callbacks).

All wiring in `cmd/gameserver/main.go`. Marriage and trade are line-server only. Shop is monolith + main + line-server. Farm is monolith + line-server.

## Character Handler RPCs

`lvUp`, `getFinalPraDef`, `finalPraMagDef`.
