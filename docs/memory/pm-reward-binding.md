# PM Reward Binding and Right 13 Transform

PM and system reward flows were aligned to a strict bound policy for requested paths:

- PM right 10 VIP monthly bag now grants bound items.
- PM right 7 auto-dungeon reward now grants bound items.
- Online gift claim and special gift claim handlers now grant bound items.
- Quest reward items are now force-bound regardless of template `award.B`.
- Quest reward pets are explicitly bound after contract via pet binding flow.

PM right 13 is now implemented as a daily transform using visible creature-source visuals:

- reward handler selects a transform `resCode` from `TBL_CREATURE` rows where:
  - `show_able = 1`
- candidate `resCode` values are deduplicated and sorted before the per-day pick
- transform state persists in `character.PMProcessData["pm13Transform"]` as:
  - `resCode`
  - `expiresAt` (next local midnight unix)
- login and scene character payloads apply active transform override through `Character.ActivePMTransformResCode(now)`.

Notes:

- The current implementation sends `onSetRes` on claim and broadcasts the same callback to scene peers for immediate visual refresh.
