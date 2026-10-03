// Open-sourced by BaoLT

package utils

import (
	"context"
	"strconv"

	appchar "mcgame-server/internal/application/character"
	appgroup "mcgame-server/internal/application/group"
	appscene "mcgame-server/internal/application/scene"
	domainchar "mcgame-server/internal/domain/character"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type GroupTransportDeps struct {
	Logger            *zap.Logger
	GroupService      *appgroup.Service
	CharService       *appchar.Service
	SceneService      *appscene.Service
	SceneManager      *rtmp.SceneManager
	PresenceStore     *redisstore.SocialPresenceStore
	LookupConn        func(characterID string) *rtmp.Connection
	AttachSceneMeta   func(ctx context.Context, characterID int64, payload map[string]interface{})
	RefreshGroupState func(ctx context.Context, groupID int64)
}

func (d *GroupTransportDeps) FollowLeaderToMap(ctx context.Context, leaderID int64, oldRoomID, newRoomID, newX, newY int) {
	if d == nil || d.GroupService == nil || d.LookupConn == nil || d.SceneManager == nil || d.CharService == nil || d.SceneService == nil {
		return
	}
	if oldRoomID == newRoomID || newRoomID == 0 {
		return
	}

	isLeader, err := d.GroupService.IsGroupLeader(ctx, leaderID)
	if err != nil || !isLeader {
		return
	}

	groupInfo, err := d.GroupService.GetGroupByMember(ctx, leaderID)
	if err != nil || groupInfo == nil {
		return
	}

	movedAny := false

	for _, member := range groupInfo.Members {
		if member.CharID == leaderID || member.AFK {
			continue
		}
		conn := d.LookupConn(strconv.FormatInt(member.CharID, 10))
		if conn == nil {
			continue
		}
		if conn.IsInBattle() {
			continue
		}

		memberOldRoomID, _ := conn.GetSceneInfo()
		if memberOldRoomID == 0 {
			memberOldRoomID = oldRoomID
		}

		channelID := conn.GetChannelID()
		d.SceneManager.BroadcastToScene(channelID, memberOldRoomID, conn.ID, "onCharLeaveScene", member.CharID)
		conn.SetSceneInfo(newRoomID, member.CharID)
		d.SceneManager.MoveToScene(channelID, memberOldRoomID, newRoomID, conn)

		pos := domainchar.Position{MapID: newRoomID, X: newX, Y: newY, Direction: 0}
		if err := d.CharService.UpdatePosition(ctx, member.CharID, pos); err != nil {
			if d.Logger != nil {
				d.Logger.Warn("Failed to update group member position on leader transport",
					zap.Int64("member_id", member.CharID),
					zap.Error(err))
			}
			continue
		}
		_ = UpsertSocialPresence(ctx, d.PresenceStore, member.CharID, "", newRoomID, newX, newY, channelID)

		conn.ResetSceneEntryRateLimits()

		_ = conn.SendCallback("onCreateNpcs", map[string]interface{}{})
		_ = conn.SendCallback("onCreateBoss", map[string]interface{}{})
		_ = conn.SendCallback("onSceneEnter", newRoomID, newX, newY, -1)

		d.sendScenePopulationTo(ctx, conn, channelID, newRoomID, member.CharID)

		char, err := d.CharService.GetByID(ctx, member.CharID)
		if err != nil {
			movedAny = true
			continue
		}
		char.MapID = newRoomID
		char.PosX = newX
		char.PosY = newY
		playerData := d.SceneService.GetCharacterForClient(char)
		if d.AttachSceneMeta != nil {
			d.AttachSceneMeta(ctx, member.CharID, playerData)
		}
		d.SceneManager.BroadcastToScene(channelID, newRoomID, conn.ID, "onScenePlayerEntered", playerData)

		movedAny = true
	}

	if movedAny && d.RefreshGroupState != nil {
		d.RefreshGroupState(ctx, groupInfo.ID)
	}
}

func (d *GroupTransportDeps) sendScenePopulationTo(ctx context.Context, conn *rtmp.Connection, channelID, mapID int, selfCharID int64) {
	(&ScenePopulationDeps{
		CharService:     d.CharService,
		SceneService:    d.SceneService,
		SceneManager:    d.SceneManager,
		AttachSceneMeta: d.AttachSceneMeta,
	}).PushOnCreateChars(ctx, conn, channelID, mapID, selfCharID)
}
