// Open-sourced by BaoLT

package quest

import (
	"fmt"
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}
	return characterID, nil
}

func parseIntArg(arg interface{}) (int, error) {
	switch v := arg.(type) {
	case float64:
		return int(v), nil
	case int:
		return v, nil
	case string:
		parsed, err := strconv.Atoi(v)
		if err != nil {
			return 0, pkgerrors.ErrInvalidArgs
		}
		return parsed, nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func (h *Handler) sendAddQuestCallback(ctx *rtmp.RPCContext, charID int64, qp *domainquest.QuestProgress) {
	activeQuests, _ := h.questService.GetActiveQuests(ctx.Context, charID)
	enrichedDTO := h.questService.EnrichQuestDTO(ctx.Context, qp)

	payload := make(map[string]interface{})
	for k, v := range enrichedDTO {
		payload[k] = v
	}

	payload["qid"] = strconv.Itoa(qp.QuestID)
	payload["st"] = enrichedDTO["state"]
	payload["d"] = enrichedDTO
	payload["qn"] = len(activeQuests)

	if err := ctx.Connection.SendCallback("onAddChaQuest", payload); err != nil {
		h.logger.Error("Failed to send onAddChaQuest callback", zap.Error(err))
	}
}

func (h *Handler) getDefaultObjectives(questID int) []domainquest.Objective {
	switch {
	case questID < 100:
		return []domainquest.Objective{{Type: domainquest.ObjectiveTalkToNPC, Target: questID, Current: 0, Required: 1}}
	case questID < 1000:
		return []domainquest.Objective{{Type: domainquest.ObjectiveKillMonster, Target: questID % 100, Current: 0, Required: 10}}
	case questID < 2000:
		return []domainquest.Objective{{Type: domainquest.ObjectiveCollectItem, Target: questID % 100, Current: 0, Required: 5}}
	default:
		return []domainquest.Objective{
			{Type: domainquest.ObjectiveKillMonster, Target: 1, Current: 0, Required: 5},
			{Type: domainquest.ObjectiveCollectItem, Target: 1, Current: 0, Required: 3},
		}
	}
}

func (h *Handler) parseObjectives(objList []interface{}) []domainquest.Objective {
	objectives := make([]domainquest.Objective, 0, len(objList))
	for _, obj := range objList {
		objMap, ok := obj.(map[string]interface{})
		if !ok {
			continue
		}

		objective := domainquest.Objective{}
		if t, ok := objMap["type"].(float64); ok {
			objective.Type = domainquest.ObjectiveType(int(t))
		}
		if target, ok := objMap["target"].(float64); ok {
			objective.Target = int(target)
		}
		if current, ok := objMap["current"].(float64); ok {
			objective.Current = int(current)
		}
		if required, ok := objMap["required"].(float64); ok {
			objective.Required = int(required)
		}

		objectives = append(objectives, objective)
	}

	return objectives
}

func getCurrencyAmount(c *domainchar.Character, key string) float64 {
	switch key {
	case "money":
		return float64(c.Money)
	case "moneyBind":
		return float64(c.MoneyBind)
	case "gold":
		return float64(c.Gold)
	case "goldBind":
		return float64(c.GoldBind)
	default:
		return 0
	}
}

func invalidTypeError(name string, value interface{}) error {
	return fmt.Errorf("invalid %s type %T", name, value)
}
