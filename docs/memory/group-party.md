# Group / Party System

Callbacks: onGroupInviteSent, onGroupInvited, onGroupJoined, onGroupDismiss, onGroupDeny, onGroupAfk, onGroupCantJoin. Join failure codes: 0=too far, 1=already in team, 2=other team, 3=full, 4=not same league, 5=league conflict, 10=GC state, 20=GC full.

**Group dismiss/leave contract**: Disband the group once only one member would remain. `onGroupDismiss` should carry the top-level linked-list payload (`{head: {...}}`), not `{mList: {...}}`. Continuing groups should refresh remaining members with updated joined-state, while full collapse still needs the extra solo reset and badge-clear callbacks.

**GROUPPANEL data contract**: `groupCharactorList` should reuse the same scene-display data shape as map-player payloads so the client has the expected `iconCode`, `resCode`, title, class, gender, and level inputs for member rows. Group callbacks then layer `cid`, `isLeader`, `afk`, `mapId`, and movement `mList` on top.

**Group invite timing**: `groupInvite` is only the invite step. Do not append the target to server-side group membership until `groupJoin` / `groupAdd`, or the group panel will operate on unconfirmed membership and drift from the Flash client flow.

**GROUPPANEL callback sync**: The client AFK wrappers are `setCharactorAfk` / `unSetCharactorAfk`, and they also update the panel AFK button label. Continuing leave/kick/group-leader changes are safest when the remaining members receive a fresh full joined-state payload so `_core.player.groupAC` and leader markers are rebuilt from current server state.

**Group disband reset**: When leave/kick collapses the group entirely, `onGroupDismiss` alone is not enough for the Flash client. Send the solo reset callback (`onGroupLeave`) to affected members and clear the overhead team badge with `onSetTeamLeague(cid, 0)`.

**Leader/AFK ordering**: Manual leader transfer sends `onGroupJoined` first (to refresh member data), then `onGroupGiveLeader` (to show the transfer message and rebuild via `setGroupState`), then `onCR` (to sync follow-chain to new leader position). AFK wrapper callbacks should still include `mList`, because the wrapper forwards that object into `_core.group.onGroupAfk`.

**Disconnect-driven group cleanup**: Character disconnects should reuse the same server leave flow as manual `groupLeave`: remove the member from the authoritative group, disband at one remaining member, broadcast `onGroupLeave` to remaining members, and when the disconnecting member was leader follow with `onGroupGiveLeader` and `onCR` so the live client updates panel order, leader flags, and follow-chain immediately.

**mList linked list leader-first rule**: The client determines the group leader from `mList.head.obj`. `formatGroupForClient` must always place the leader character at the head of the linked list, regardless of the order in `g.Members`. The `groupList` setter traverses head→next→... and populates `groupAC` in traversal order, so the leader appears first in the panel.

**onGroupLeave field names**: The client `onGroupLeave` handler reads `obj.sid` and `obj.name` (not `oName`). Use `"name"` in the leave payload. The `onGroupGiveLeader` handler reads `obj.oName` and `obj.nName` for the transfer message.

**groupGiveLeader return value**: The client `giveLeaderResult` responder expects a Boolean (`true`/`false`), not a map. Return `true` on success, `false` on failure.

**Group movement refresh**: AFK return and leader promotion also need an immediate synthetic `onCR` using the current leader position plus `mList`, or the Flash client can keep the old follow chain until someone moves again.

**Leader movement persistence**: When the group leader moves, same-map non-AFK followers should have their saved server position updated to the leader's current coordinates even though the actual follow playback is still driven by `mList` on the client.

Leader-started PVE battles and random encounters now gather same-map, online, non-AFK living group members into one shared battle. AFK members stay out of the roster. Full-group join failures now actively send `onGroupCantJoin(..., 3)`.

**Leader transport follow-through**: Every leader-triggered map change pulls the non-AFK, non-battling group members with the leader. `sceneChange` (gate portal), `toMovable` (room-change teleport), `useItemGold` (map-transport item), and NPC `teleportToMap` / `teleportToPosition` all call `rtmputils.GroupTransportDeps.FollowLeaderToMap`, which runs the same leave-scene → move-scene → update-position → scene-enter sequence per member that the leader itself performs. The earlier `disbandPlainGroupForPersonalTeleport` behavior that dissolved plain groups on leader teleport has been removed — plain-group members are expected to ride along with the leader, and room groups are still never touched by teleport flows.
