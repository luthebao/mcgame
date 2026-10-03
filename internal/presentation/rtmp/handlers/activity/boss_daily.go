// Open-sourced by BaoLT

// Boss daily panel handlers return panel data and notify client callbacks.
package activity

import (
	"context"
	"fmt"
	"time"

	appcombat "mcgame-server/internal/application/combat"
	combatdomain "mcgame-server/internal/domain/combat"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const bossDailyDefaultTotal = 16

func (h *Handler) BossDailyGetData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "BossDailyGetData")
	if err != nil {
		return nil, err
	}

	var payload map[string]interface{}
	if h.bossDailyService != nil {
		payload, err = h.bossDailyService.GetBossDailyData(context.Background(), characterID)
		if err != nil {
			return nil, err
		}
	} else {
		payload = defaultBossDailyPayload()
	}

	if ctx.Connection != nil {
		if callbackErr := ctx.Connection.SendCallback("onOpenBossDailyPanel", payload); callbackErr != nil {
			h.logger.Warn("BossDailyGetData: failed to send onOpenBossDailyPanel callback",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.Error(callbackErr))
		}
	}

	h.logger.Info("BossDailyGetData: returning boss daily payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("total", bossDailyDefaultTotal))

	return payload, nil
}

func (h *Handler) BossDailyBattle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "BossDailyBattle")
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidInput
	}
	bossID, ok := parseIntArg(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	validation, err := h.bossDailyService.ValidateBossDailyBattle(context.Background(), characterID, bossID)
	if err != nil {
		h.logger.Warn("BossDailyBattle: validation failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int("boss_id", bossID),
			zap.Error(err))
		return nil, err
	}

	if h.combatService == nil {
		return nil, fmt.Errorf("combat service not available")
	}

	enemyTemplates := h.buildBossDailyEnemyTemplates(bossID)

	playerInFront := ctx.Connection != nil && ctx.Connection.IsPlayerInFront()
	channelID := 0
	if ctx.Connection != nil {
		channelID = ctx.Connection.GetChannelID()
	}
	battle, err := h.combatService.StartPVEBattleWithMultipleEnemies(context.Background(), characterID, 0, channelID, enemyTemplates, playerInFront)
	if err != nil {
		h.logger.Warn("BossDailyBattle: failed to start PVE battle",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int("boss_id", bossID),
			zap.Error(err))
		return nil, err
	}

	if scheduleNID, tier, ok := h.bossDailyService.ResolveBossNIDByDailyID(context.Background(), bossID); ok {
		battle.BossCtx = &combatdomain.BossContext{
			BossNID: scheduleNID,
			Source:  "daily",
			Tier:    tier,
		}
	}

	if err := h.bossDailyService.CommitBossDailyState(context.Background(), characterID, validation.State); err != nil {
		h.logger.Error("BossDailyBattle: failed to commit boss daily state",
			zap.Int64("character_id", characterID),
			zap.Int("boss_id", bossID),
			zap.Error(err))
	}

	if ctx.Connection != nil {
		battle.AddWatcher(ctx.Connection)
		ctx.Connection.SetBattleID(battle.ID)
	}
	if h.battleService != nil {
		h.battleService.SetTurnDeadline(battle.ID, fmt.Sprintf("%d", characterID), ctx.Connection)
	}

	battleDTO := battle.ToDTO()
	cList := battleDTO["cList"]
	onBattleStartData := map[string]interface{}{
		"battleFieldId": battle.BattleFieldID,
		"cList":         cList,
		"guest":         false,
		"sneakFlag":     0,
		"bossFlag":      false,
		"airBattle":     false,
	}

	sendBossDailyBattleStartCallbacks(ctx, characterID, battle.Participants, h.logger)

	if ctx.Connection != nil {
		if callbackErr := ctx.Connection.SendCallback("onBattleStart", onBattleStartData); callbackErr != nil {
			h.logger.Error("BossDailyBattle: failed to send onBattleStart callback",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(callbackErr))
		}
	}

	h.logger.Info("BossDailyBattle: PVE battle started",
		zap.Int64("character_id", characterID),
		zap.Int("boss_id", bossID),
		zap.String("battle_id", battle.ID))

	return nil, nil
}

func (h *Handler) buildBossDailyEnemyTemplates(bossID int) []appcombat.NPCTemplateData {
	if h.gameData != nil {
		if rows := h.gameData.GetNpcCreaturesByNid(bossID); len(rows) > 0 {
			templates := make([]appcombat.NPCTemplateData, 0, len(rows))
			for _, row := range rows {
				cid := int(row.Cid)
				creature := h.gameData.GetCreature(cid)
				if creature == nil {
					continue
				}
				level := int(row.Level)
				if level <= 0 {
					level = int(creature.UseLv)
				}
				if level <= 0 {
					level = 10
				}
				tpl := appcombat.CalculateCreatureStats(creature, level)
				tpl.ID = cid
				tpl.Exp = int(row.Exp)
				tpl.ExpMulti = row.ExpMulti
				tpl.BossFlag = int(row.BossFlag)
				if tpl.Name == "" {
					tpl.Name = fmt.Sprintf("Boss #%d", cid)
				}
				templates = append(templates, tpl)
			}
			if len(templates) > 0 {
				return templates
			}
		}
	}

	var npcTemplate appcombat.NPCTemplateData
	npcTemplate.ID = bossID
	npcLevel := 10

	if h.gameData != nil {
		npcData := h.gameData.GetNPC(bossID)
		if npcData != nil {
			npcTemplate.Name = npcData.Name
			npcTemplate.ResCode = int(npcData.ResCode)
			npcTemplate.IconCode = int(npcData.IconCode)
			npcTemplate.ColorCode = int(npcData.ColorCode)
			if npcData.Lv > 0 {
				npcLevel = int(npcData.Lv)
			}
		}

		creatureData := h.gameData.GetCreature(bossID)
		if creatureData != nil {
			npcTemplate = appcombat.CalculateCreatureStats(creatureData, npcLevel)
			npcTemplate.ID = bossID
			if npcData != nil {
				npcTemplate.Name = npcData.Name
			}
		}
	}

	if npcTemplate.Name == "" {
		npcTemplate.Name = fmt.Sprintf("Boss #%d", bossID)
	}

	return []appcombat.NPCTemplateData{npcTemplate}
}

func sendBossDailyBattleStartCallbacks(ctx *rtmp.RPCContext, characterID int64, participants []*combatdomain.Participant, logger *zap.Logger) {
	if ctx.Connection == nil {
		return
	}

	for _, p := range participants {
		if p == nil || p.EntityType != combatdomain.ParticipantTypePet || p.Side != combatdomain.SidePlayer {
			continue
		}
		currentHP := fmt.Sprintf("%d", p.CurrentHP)
		if err := ctx.Connection.SendCallback("onUpdatePet", float64(p.EntityID), "currentHp", currentHP); err != nil {
			if logger != nil {
				logger.Warn("BossDailyBattle: failed to send pet HP callback", zap.Error(err))
			}
		}
		break
	}

	charStatePayload := map[string]interface{}{
		"cid":   fmt.Sprintf("%d", characterID),
		"state": 5,
	}
	if err := ctx.Connection.SendCallback("onSetCharState", charStatePayload); err != nil {
		if logger != nil {
			logger.Warn("BossDailyBattle: failed to send char state callback", zap.Error(err))
		}
	}
}

func (h *Handler) BossDailyFinishByCard(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "BossDailyFinishByCard")
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidInput
	}
	bossID, ok := parseIntArg(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	err = h.bossDailyService.BossDailyFinishByCard(context.Background(), characterID, bossID)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{"result": 0}, nil
}

func defaultBossDailyPayload() map[string]interface{} {
	now := time.Now()
	currentTime := now.UnixMilli()
	return map[string]interface{}{
		"total": bossDailyDefaultTotal,
		"t":     currentTime,
		"data": map[string]interface{}{
			"d":    fmt.Sprintf("%d|%d|%d", int(now.Month())-1, now.Day(), int(now.Weekday())),
			"n":    0,
			"now":  currentTime,
			"dfd":  map[string]interface{}{},
			"data": map[string]interface{}{},
		},
	}
}
