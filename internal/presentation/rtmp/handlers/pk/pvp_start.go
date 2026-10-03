// Open-sourced by BaoLT

package pk

import (
	"context"
	"strconv"

	appbattle "mcgame-server/internal/application/battle"
	combatdomain "mcgame-server/internal/domain/combat"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	clientCharStateBattle = 5
	pvpStartMaxDistance   = 20
)

func (h *Handler) PVPStartClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetCID, err := toInt64(args[0])
	if err != nil {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if characterID == targetCID {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if !h.targetAllowsPVP(ctx.Context, targetCID) {
		if ctx.Connection != nil {
			_ = ctx.Connection.SendCallback("onMidNote", "Mục tiêu chưa bật PK, không thể tấn công.")
		}
		h.logger.Info("PVPStartClient blocked: target apvp off",
			zap.Int64("attacker", characterID),
			zap.Int64("target", targetCID))
		return map[string]interface{}{"success": false, "blocked": "target_apvp_off"}, nil
	}

	return h.startPVPBattle(ctx, characterID, targetCID)
}

func (h *Handler) startPVPBattle(ctx *rtmp.RPCContext, attackerID, targetID int64) (interface{}, error) {
	if h.combatService == nil || h.charService == nil {
		h.logger.Warn("PVPStartClient: combat/char service not wired; falling back to invite flow",
			zap.Int64("attacker", attackerID),
			zap.Int64("target", targetID))
		return h.PKInvite(ctx, []interface{}{targetID})
	}

	attacker, err := h.charService.GetByID(ctx.Context, attackerID)
	if err != nil || attacker == nil {
		return rtmp.ErrorToResponse(pkgerrors.ErrNotFound), nil
	}
	target, err := h.charService.GetByID(ctx.Context, targetID)
	if err != nil || target == nil {
		return rtmp.ErrorToResponse(pkgerrors.ErrNotFound), nil
	}
	if attacker.MapID != target.MapID {
		return rtmp.ErrorToResponse(pkgerrors.ErrInvalidInput), nil
	}

	dx := target.PosX - attacker.PosX
	dy := target.PosY - attacker.PosY
	if dx*dx+dy*dy > pvpStartMaxDistance*pvpStartMaxDistance {
		if ctx.Connection != nil {
			_ = ctx.Connection.SendCallback("onMidNote", "Mục tiêu quá xa, không thể tấn công.")
		}
		h.logger.Info("PVPStartClient blocked: target out of range",
			zap.Int64("attacker", attackerID),
			zap.Int64("target", targetID),
			zap.Int("attacker_x", attacker.PosX),
			zap.Int("attacker_y", attacker.PosY),
			zap.Int("target_x", target.PosX),
			zap.Int("target_y", target.PosY))
		return map[string]interface{}{"success": false, "blocked": "out_of_range"}, nil
	}

	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetID, 10))
	if targetConn == nil {
		return rtmp.ErrorToResponse(pkgerrors.ErrNotFound), nil
	}

	channelID := 0
	if ctx.Connection != nil {
		channelID = ctx.Connection.GetChannelID()
	}
	battle, err := h.combatService.StartPVPBattle(ctx.Context, attackerID, targetID, attacker.MapID, channelID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	cList := battle.ToDTO()["cList"]
	h.dispatchPVPBattleStart(ctx.Connection, battle, cList, attackerID, false)
	h.dispatchPVPBattleStart(targetConn, battle, cList, targetID, true)

	h.logger.Info("PVP battle dispatched",
		zap.String("battle_id", battle.ID),
		zap.Int64("attacker", attackerID),
		zap.Int64("target", targetID))

	return map[string]interface{}{
		"success":  true,
		"battleId": battle.ID,
	}, nil
}

func (h *Handler) dispatchPVPBattleStart(conn *rtmp.Connection, battle *combatdomain.Battle, cList interface{}, charID int64, guest bool) {
	if conn == nil {
		return
	}
	conn.SetBattleID(battle.ID)
	battle.AddWatcher(conn)
	h.sendOwnerPetBattleStart(conn, battle, charID)
	cidStr := strconv.FormatInt(charID, 10)
	stateMsg := map[string]interface{}{"cid": cidStr, "state": clientCharStateBattle}
	_ = conn.SendCallback("onSetCharState", stateMsg)
	h.broadcastSceneCharBattleState(conn, stateMsg)
	_ = conn.SendCallback("onBattleStart", buildPVPBattleStartData(battle, cList, guest))
	if h.battleService != nil {
		h.battleService.SetTurnDeadlineWithDuration(battle.ID, cidStr, appbattle.DefaultPVPTurnTimeout, conn)
	}
}

func buildPVPBattleStartData(battle *combatdomain.Battle, cList interface{}, guest bool) map[string]interface{} {
	return map[string]interface{}{
		"battleFieldId": battle.BattleFieldID,
		"cList":         cList,
		"guest":         guest,
		"sneakFlag":     0,
		"bossFlag":      false,
		"airBattle":     false,
		"battleType":    int(combatdomain.BattleTypePVP),
		"mapId":         battle.MapID,
	}
}

func (h *Handler) sendOwnerPetBattleStart(conn *rtmp.Connection, battle *combatdomain.Battle, ownerID int64) {
	pet := findOwnerPetParticipant(battle.Participants, ownerID)
	if pet == nil {
		return
	}
	if err := conn.SendCallback("onUpdatePet", float64(pet.EntityID), "currentHp", strconv.Itoa(pet.CurrentHP)); err != nil {
		h.logger.Warn("PVPStartClient: failed to send pet HP", zap.Int64("owner", ownerID), zap.Error(err))
		return
	}
	if err := conn.SendCallback("onUpdatePet", float64(pet.EntityID), "currentMp", strconv.Itoa(pet.CurrentMP)); err != nil {
		h.logger.Warn("PVPStartClient: failed to send pet MP", zap.Int64("owner", ownerID), zap.Error(err))
	}
}

func (h *Handler) broadcastSceneCharBattleState(conn *rtmp.Connection, payload map[string]interface{}) {
	if h.rtmpServer == nil || conn == nil {
		return
	}
	sceneManager := h.rtmpServer.GetSceneManager()
	if sceneManager == nil {
		return
	}
	mapID, _ := conn.GetSceneInfo()
	if mapID == 0 {
		return
	}
	sceneManager.BroadcastToScene(conn.GetChannelID(), mapID, conn.ID, "onSetCharState", payload)
}

func findOwnerPetParticipant(participants []*combatdomain.Participant, ownerID int64) *combatdomain.Participant {
	for _, participant := range participants {
		if participant == nil || participant.EntityType != combatdomain.ParticipantTypePet {
			continue
		}
		if participant.OwnerID == ownerID {
			return participant
		}
	}
	return nil
}

func (h *Handler) targetAllowsPVP(ctx context.Context, characterID int64) bool {
	if h.settingsRepo == nil {
		return false
	}
	settings, err := h.settingsRepo.GetByCharacterID(ctx, characterID)
	if err != nil {
		h.logger.Warn("PVPStartClient: failed to read target apvp; treating as off",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return false
	}
	return toBool(settings["apvp"])
}
