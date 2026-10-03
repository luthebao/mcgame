// Open-sourced by BaoLT

// Random encounter detection and creature selection for map movement.
package combat

import (
	"math/rand"
	"strconv"

	appcombat "mcgame-server/internal/application/combat"
	combatdomain "mcgame-server/internal/domain/combat"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	defaultRandomEncounterRate = 0.3
	maxRandomEncounterRate     = 0.75
)

func (h *Handler) CheckBattleOnMove(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var posX, posY int
	switch v := args[0].(type) {
	case float64:
		posX = int(v)
	case int:
		posX = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	switch v := args[1].(type) {
	case float64:
		posY = int(v)
	case int:
		posY = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	existingBattle, _ := h.combatService.GetPlayerBattle(characterID)
	if existingBattle != nil && existingBattle.IsActive() {
		if shouldResolveDefeatedPlayerBattle(existingBattle, characterID) {
			h.combatService.EndBattle(ctx.Context, existingBattle, combatdomain.SideEnemy)
			if h.battleService != nil {
				h.battleService.ClearBattleDeadlines(existingBattle.ID)
			}
			ctx.Connection.ClearBattle()
		} else {
			return map[string]interface{}{
				"success":  true,
				"inBattle": true,
			}, nil
		}
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	if currentMapID == 0 {
		currentMapID = char.MapID
	}

	isSafeMap := false
	if h.gameData != nil {
		mapTemplate := h.gameData.GetMap(currentMapID)
		if mapTemplate != nil {
			isSafeMap = mapTemplate.SafeFlag > 0
		}
	}

	if isSafeMap {
		return map[string]interface{}{
			"success":     true,
			"inBattle":    false,
			"encountered": false,
		}, nil
	}

	if ctx.Connection.IsRandomEncounterOnCooldown(ctx.Timestamp) {
		return map[string]interface{}{
			"success":     true,
			"inBattle":    false,
			"encountered": false,
		}, nil
	}

	encounterRate := defaultRandomEncounterRate
	if h.gameData != nil {
		mapTemplate := h.gameData.GetMap(currentMapID)
		if mapTemplate != nil {
			encounterRate = normalizeEncounterRate(mapTemplate.BasicBattleRate)
		}
	}
	if encounterRate <= 0 {
		return map[string]interface{}{
			"success":     true,
			"inBattle":    false,
			"encountered": false,
		}, nil
	}

	roll := rand.Float64()

	h.logger.Debug("CheckBattleOnMove",
		zap.Int64("character_id", characterID),
		zap.Int("map_id", currentMapID),
		zap.Int("pos_x", posX),
		zap.Int("pos_y", posY),
		zap.Float64("encounter_rate", encounterRate),
		zap.Float64("roll", roll))

	if roll < encounterRate && h.gameData != nil {
		mapCreatures := h.gameData.GetMapCreaturesByMapID(currentMapID)
		normalCreatures := make([]*models.MapCreatureTemplate, 0, len(mapCreatures))
		for _, mc := range mapCreatures {
			if mc.BossFlag == 0 {
				normalCreatures = append(normalCreatures, mc)
			}
		}

		if len(normalCreatures) > 0 {
			battleRoster := h.eligibleBattleRoster(ctx.Context, characterID, currentMapID)
			playerCount := len(battleRoster)
			if playerCount <= 0 {
				playerCount = 1
			}
			enemyCount := h.getEnemyCountForPlayers(playerCount)
			if enemyCount > len(normalCreatures) {
				enemyCount = len(normalCreatures)
			}

			selectedMapCreatures := h.selectRandomMapCreatures(normalCreatures, enemyCount)
			mapLevel := 0
			if mt := h.gameData.GetMap(currentMapID); mt != nil {
				mapLevel = int(mt.Level)
				if mapLevel <= 0 {
					mapLevel = int(mt.Lv)
				}
			}
			creatureTemplates := make([]appcombat.NPCTemplateData, 0, len(selectedMapCreatures))
			for _, mc := range selectedMapCreatures {
				creature := h.gameData.GetCreature(int(mc.Cid))
				if creature == nil {
					continue
				}
				level := int(mc.Level)
				if level <= 0 {
					level = int(creature.UseLv)
				}
				if level <= 0 && mapLevel > 0 {
					level = mapLevel
				}
				if level <= 0 {
					level = 10
				}
				template := appcombat.CalculateCreatureStats(creature, level)
				template = appcombat.NormalizeEncounterTemplateForPlayer(template, char.Level)
				template.Exp = int(mc.Exp)
				template.ExpMulti = mc.ExpMulti
				template.BossFlag = int(mc.BossFlag)
				template.WithCloud = int(mc.WithCloud)
				creatureTemplates = append(creatureTemplates, template)
			}

			if len(creatureTemplates) == 0 {
				h.logger.Warn("No valid creatures found for map", zap.Int("map_id", currentMapID))
				return map[string]interface{}{
					"success":     true,
					"inBattle":    false,
					"encountered": false,
				}, nil
			}

			h.logger.Info("Random encounter triggered",
				zap.Int64("character_id", characterID),
				zap.Int("map_id", currentMapID),
				zap.Int("player_count", playerCount),
				zap.Int("enemy_count", len(creatureTemplates)))

			playerInFront := ctx.Connection == nil || ctx.Connection.IsPlayerInFront()

			channelID := 0
			if ctx.Connection != nil {
				channelID = ctx.Connection.GetChannelID()
			}
			battle, err := h.combatService.StartPVEBattleWithRoster(ctx.Context, battleRoster, currentMapID, channelID, creatureTemplates, playerInFront)
			if err != nil {
				h.logger.Warn("Failed to start random encounter battle",
					zap.Int64("character_id", characterID),
					zap.Bool("player_in_front", playerInFront),
					zap.Error(err))
				return map[string]interface{}{
					"success":     true,
					"inBattle":    false,
					"encountered": false,
				}, nil
			}

			h.setRandomEncounterCooldownForParticipants(battle, ctx.Timestamp.Add(randomEncounterCooldown))

			firstNPCID := 0
			if len(creatureTemplates) > 0 {
				firstNPCID = creatureTemplates[0].ID
			}

			battleData := h.notifyBattleStarted(battle)

			h.logger.Info("Sending onBattleStart",
				zap.String("battle_field_id", battle.BattleFieldID),
				zap.Bool("player_in_front", playerInFront),
				zap.Any("onBattleStartData", battleData))

			return map[string]interface{}{
				"success":     true,
				"inBattle":    true,
				"encountered": true,
				"battleId":    battle.ID,
				"npcId":       firstNPCID,
			}, nil
		}
	}

	return map[string]interface{}{
		"success":     true,
		"inBattle":    false,
		"encountered": false,
	}, nil
}

func normalizeEncounterRate(raw float64) float64 {
	if raw <= 0 {
		return 0
	}
	if raw > 1 {
		raw = raw / 1000.0
	}
	if raw < defaultRandomEncounterRate {
		return defaultRandomEncounterRate
	}
	if raw > maxRandomEncounterRate {
		return maxRandomEncounterRate
	}
	return raw
}

func (h *Handler) getEnemyCountForPlayers(playerCount int) int {
	var minEnemies int
	var maxEnemies int
	switch playerCount {
	case 1:
		minEnemies, maxEnemies = 1, 2
	case 2:
		minEnemies, maxEnemies = 2, 4
	case 3:
		minEnemies, maxEnemies = 3, 5
	case 4, 5:
		minEnemies, maxEnemies = 4, 5
	default:
		minEnemies, maxEnemies = 1, 2
	}
	return minEnemies + rand.Intn(maxEnemies-minEnemies+1)
}

func (h *Handler) selectRandomMapCreatures(entries []*models.MapCreatureTemplate, count int) []*models.MapCreatureTemplate {
	if len(entries) == 0 || count <= 0 {
		return nil
	}

	selected := make([]*models.MapCreatureTemplate, 0, count)
	for i := 0; i < count; i++ {
		roll := rand.Float64() * 100
		var match *models.MapCreatureTemplate
		for _, entry := range entries {
			if roll >= entry.StartRate && roll < entry.EndRate {
				match = entry
				break
			}
		}
		if match == nil {
			match = entries[rand.Intn(len(entries))]
		}
		selected = append(selected, match)
	}

	return selected
}
