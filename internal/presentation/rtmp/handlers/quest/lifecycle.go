// Open-sourced by BaoLT

package quest

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type questStartItemGrant struct {
	templateID int
	amount     int
}

var questStartItemGrants = map[int][]questStartItemGrant{
	160:  {{templateID: 335, amount: 1}},
	162:  {{templateID: 515, amount: 1}},
	164:  {{templateID: 517, amount: 1}},
	4671: {{templateID: 2263, amount: 1}},
	7667: {{templateID: 4843, amount: 1}},
}

func (h *Handler) TakeQuest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) != 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	questID, err := parseIntArg(args[0])
	if err != nil {
		h.logger.Error("TakeQuest: invalid questID type", zap.Any("val", args[0]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	npcID := 0
	if value, err := parseIntArg(args[1]); err == nil {
		npcID = value
	}

	qp, err := h.questService.AcceptQuest(ctx.Context, characterID, questID, h.questService.GetInitialObjectives(questID))
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Quest accepted", zap.Int64("character_id", characterID), zap.Int("quest_id", questID))
	h.sendAddQuestCallback(ctx, characterID, qp)

	h.grantQuestStartItems(ctx, characterID, questID)

	if h.questNotify != nil {
		questTemplate := h.questService.GetQuestTemplate(questID)
		uniqueNPCs := make(map[int]bool)
		if npcID > 0 {
			uniqueNPCs[npcID] = true
		}
		if questTemplate != nil {
			if int(questTemplate.StartNPC) > 0 {
				uniqueNPCs[int(questTemplate.StartNPC)] = true
			}
			if int(questTemplate.FinishNPC) > 0 {
				uniqueNPCs[int(questTemplate.FinishNPC)] = true
			}
		}
		if len(uniqueNPCs) > 0 {
			npcIDs := make([]int, 0, len(uniqueNPCs))
			for id := range uniqueNPCs {
				npcIDs = append(npcIDs, id)
			}
			h.questNotify.PushNpcQuestStates(ctx, characterID, npcIDs)
		}
	}

	return nil, nil
}

func (h *Handler) TakeBuildQuest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	questID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}
	npcID, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	objectives := h.questService.GetInitialObjectives(questID)
	if len(args) >= 3 {
		if list, ok := args[2].([]interface{}); ok {
			objectives = h.parseObjectives(list)
		}
	}

	qp, err := h.questService.AcceptQuestFromNPC(ctx.Context, characterID, questID, npcID, objectives)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Quest accepted from NPC", zap.Int64("character_id", characterID), zap.Int("quest_id", questID), zap.Int("npc_id", npcID))
	h.sendAddQuestCallback(ctx, characterID, qp)
	h.grantQuestStartItems(ctx, characterID, questID)

	activeQuests, _ := h.questService.GetActiveQuests(ctx.Context, characterID)

	if h.questNotify != nil {
		questTemplate := h.questService.GetQuestTemplate(questID)
		npcIDs := []int{}
		if npcID > 0 {
			npcIDs = append(npcIDs, npcID)
		}
		if questTemplate != nil {
			if int(questTemplate.StartNPC) > 0 && int(questTemplate.StartNPC) != npcID {
				npcIDs = append(npcIDs, int(questTemplate.StartNPC))
			}
			if int(questTemplate.FinishNPC) > 0 && int(questTemplate.FinishNPC) != npcID {
				npcIDs = append(npcIDs, int(questTemplate.FinishNPC))
			}
		}
		if len(npcIDs) > 0 {
			h.questNotify.PushNpcQuestStates(ctx, characterID, npcIDs)
		}
	}

	return map[string]interface{}{"flag": true, "qn": len(activeQuests)}, nil
}

func (h *Handler) resolveQuestStartGrants(questID int) []questStartItemGrant {
	if h.gameDataManager != nil {
		if tpl := h.gameDataManager.GetQuest(questID); tpl != nil && tpl.StartGrantItem != nil && *tpl.StartGrantItem > 0 {
			qty := 1
			if tpl.StartGrantQty != nil && *tpl.StartGrantQty > 0 {
				qty = *tpl.StartGrantQty
			}
			return []questStartItemGrant{{templateID: *tpl.StartGrantItem, amount: qty}}
		}
	}
	if grants, ok := questStartItemGrants[questID]; ok {
		return grants
	}
	return nil
}

func (h *Handler) grantQuestStartItems(ctx *rtmp.RPCContext, characterID int64, questID int) {
	if h.itemService == nil {
		return
	}

	grants := h.resolveQuestStartGrants(questID)
	if len(grants) == 0 {
		return
	}

	for _, grant := range grants {
		addedItem, err := h.itemService.AddItemToSlot(ctx.Context, characterID, grant.templateID, domainitem.ItemTypeQuest, grant.amount, false, domainitem.SlotTypeQuestBag)
		if err != nil {
			h.logger.Warn("Failed to add quest start item", zap.Int64("character_id", characterID), zap.Int("quest_id", questID), zap.Int("item_id", grant.templateID), zap.Error(err))
			continue
		}
		if addedItem == nil || ctx.Connection == nil {
			continue
		}

		itemName := "Item " + strconv.Itoa(grant.templateID)
		itemKind := 0
		if h.gameDataManager != nil {
			if itemTpl := h.gameDataManager.GetItem(grant.templateID); itemTpl != nil {
				itemName = itemTpl.Name
				itemKind = int(itemTpl.Kind)
			}
		}

		itemDTO := map[string]interface{}{
			"i":  grant.templateID,
			"q":  grant.amount,
			"s":  "",
			"c":  addedItem.ColorCode,
			"t":  28,
			"n":  itemName,
			"tt": itemKind,
		}
		ctx.Connection.SendCallback("onAddItem", itemDTO)
		ctx.Connection.SendCallback("onAddCharactorSlot", addedItem.ToDTO())
	}
}

func (h *Handler) FinishQuest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	questID := 0
	switch v := args[0].(type) {
	case map[string]interface{}:
		if val, ok := v["i"]; ok {
			questID, _ = parseIntArg(val)
		}
		if questID == 0 {
			h.logger.Warn("FinishQuest: map argument missing 'i' field or invalid", zap.Any("arg", v))
			return nil, pkgerrors.ErrInvalidArgs
		}
	default:
		questID, err = parseIntArg(args[0])
		if err != nil {
			return nil, pkgerrors.ErrInvalidArgs
		}
	}

	_, rewards, err := h.questService.CompleteQuest(ctx.Context, characterID, questID)
	if err != nil {
		return map[string]interface{}{"flag": false, "msg": err.Error()}, nil
	}

	h.logger.Info("Quest completed", zap.Int64("character_id", characterID), zap.Int("quest_id", questID), zap.Any("rewards", rewards))

	if rewards != nil {
		if consumed, ok := rewards["consumedItems"].([]map[string]interface{}); ok {
			for _, change := range consumed {
				deleted, _ := change["deleted"].(bool)
				if deleted {
					if sid, ok := change["sid"].(int); ok {
						_ = ctx.Connection.SendCallback("onDelCharactorSlot", sid)
					}
					continue
				}

				if itemDTO, ok := change["item"].(map[string]interface{}); ok {
					_ = ctx.Connection.SendCallback("onAddCharactorSlot", itemDTO)
				}
			}
		}

		char, _ := rewards["char"].(*domainchar.Character)
		preLevel, _ := rewards["oldLevel"].(int)

		totalMoney := int64(0)
		if changes, ok := rewards["currencyChanges"].(map[string]int64); ok {
			if m, ok := changes["money"]; ok {
				totalMoney = m
			}
			if char != nil {
				for currType, amount := range changes {
					if amount > 0 {
						_ = ctx.Connection.SendCallback("onAddMoney", float64(characterID), currType, float64(amount), getCurrencyAmount(char, currType))
					}
				}
			}
		}

		totalExp := int64(0)
		if e, ok := rewards["exp"].(int64); ok {
			totalExp = e
		}
		isLevelUp := false
		if l, ok := rewards["levelUp"].(bool); ok && l {
			isLevelUp = true
		}

		if (totalExp > 0 || totalMoney > 0) && char != nil {
			if h.itemService != nil {
				h.itemService.ApplyCharacterElementState(ctx.Context, char)
				h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
				bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, characterID)
				rtmputils.SendExpAndLevelUpCallbacksWithEquipment(ctx.Connection, char, totalExp, isLevelUp, &bonuses)
			} else {
				rtmputils.SendExpAndLevelUpCallbacks(ctx.Connection, char, totalExp, isLevelUp)
			}
			if isLevelUp && h.eventBus != nil {
				h.eventBus.EmitLevelUp(ctx.Context, char.ID, preLevel, char.Level)
			}
		}
		if _, ok := rewards["activePet"].(map[string]interface{}); ok && h.petService != nil {
			pet, err := h.petService.GetActivePet(ctx.Context, characterID)
			if err != nil {
				h.logger.Warn("FinishQuest: failed to load active pet reward state",
					zap.Int64("character_id", characterID),
					zap.Int("quest_id", questID),
					zap.Error(err))
			} else if pet != nil {
				petLeveledUp, _ := rewards["activePetLevelUp"].(bool)
				sendQuestPetRewardCallbacks(ctx.Connection, pet, petLeveledUp)
			}
		}

		if newCL, ok := rewards["classRankUp"].(int); ok {
			_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"cl": newCL})
		}

		if notified, ok := rewards["notifiedItems"].([]map[string]interface{}); ok {
			for _, nItem := range notified {
				_ = ctx.Connection.SendCallback("onAddItem", nItem)
			}
		}
		if items, ok := rewards["items"].([]map[string]interface{}); ok {
			for _, itemDTO := range items {
				_ = ctx.Connection.SendCallback("onAddCharactorSlot", itemDTO)
			}
		}
		if pets, ok := rewards["pets"].([]map[string]interface{}); ok {
			for _, petDTO := range pets {
				_ = ctx.Connection.SendCallback("onAddPet", petDTO)
			}
		}
		if consumedPets, ok := rewards["consumedPets"].([]int64); ok {
			for _, petID := range consumedPets {
				_ = ctx.Connection.SendCallback("onDelPet", petID)
			}
		}

		if loopInfo, ok := rewards["loop"].(map[string]interface{}); ok {
			if err := ctx.Connection.SendCallback("onFinishLoopQuest", loopInfo); err != nil {
				h.logger.Error("Failed to send onFinishLoopQuest callback", zap.Error(err))
			}
			h.clearLoopBossForRound(ctx, characterID, questID)
			if nextQP, ok := rewards["loopNextQuest"].(*domainquest.QuestProgress); ok && nextQP != nil {
				h.sendAddQuestCallback(ctx, characterID, nextQP)
				h.grantQuestStartItems(ctx, characterID, nextQP.QuestID)
				h.pushLoopBossOnIfMapMode(ctx, characterID, nextQP.QuestID)
			}
			if npcIDs, ok := rewards["loopNpcIDs"].([]int); ok && len(npcIDs) > 0 && h.questNotify != nil {
				h.questNotify.PushNpcQuestStates(ctx, characterID, npcIDs)
			}
		}
	}

	_ = ctx.Connection.SendCallback("onUpdateAchieve")
	_ = ctx.Connection.SendCallback("onUpdateSafeBattleMid")

	rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)

	activeQuests, _ := h.questService.GetActiveQuests(ctx.Context, characterID)
	if h.questNotify != nil {
		mapID, _ := ctx.Connection.GetSceneInfo()
		h.questNotify.PushNpcQuestStatesByMap(ctx, characterID, mapID)
	}

	return map[string]interface{}{"flag": true, "qid": questID, "qn": len(activeQuests)}, nil
}

func (h *Handler) CancelQuest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Debug("CancelQuest called", zap.Any("args", args))
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	questID, err := parseIntArg(args[0])
	if err != nil {
		h.logger.Warn("CancelQuest: invalid questID type", zap.Any("val", args[0]))
		return map[string]interface{}{"flag": false}, nil
	}

	h.logger.Info("Abandoning quest", zap.Int64("char_id", characterID), zap.Int("quest_id", questID))

	if err := h.questService.AbandonQuest(ctx.Context, characterID, questID); err != nil {
		h.logger.Warn("CancelQuest: abandon rejected", zap.Int64("char_id", characterID), zap.Int("quest_id", questID), zap.Error(err))
		activeQuests, _ := h.questService.GetActiveQuests(ctx.Context, characterID)
		failPayload := map[string]interface{}{"flag": false, "qid": strconv.Itoa(questID), "qn": len(activeQuests)}
		if err := ctx.Connection.SendCallback("onCancelQuest", failPayload); err != nil {
			h.logger.Error("CancelQuest: failed to send failure callback", zap.Error(err))
		}
		return failPayload, nil
	}

	activeQuests, err := h.questService.GetActiveQuests(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("CancelQuest: failed to get active quests", zap.Error(err))
	}

	if err := ctx.Connection.SendCallback("onCancelQuest", map[string]interface{}{"flag": true, "qn": len(activeQuests), "qid": strconv.Itoa(questID)}); err != nil {
		h.logger.Error("CancelQuest: failed to send callback", zap.Error(err))
	}

	return map[string]interface{}{"flag": true, "qid": questID, "qn": len(activeQuests)}, nil
}
