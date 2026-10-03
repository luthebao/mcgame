// Open-sourced by BaoLT

// Battle item handler bridges the combat domain ItemHandler interface
// with the application item service for in-battle item usage.
package combat

import (
	"context"
	"strconv"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

type battleItemHandler struct {
	ctx         context.Context
	charID      int64
	itemService *appitem.Service
	gameData    *gamedata.Manager
	logger      *zap.Logger
}

func newBattleItemHandler(
	ctx context.Context,
	charID int64,
	itemService *appitem.Service,
	gameData *gamedata.Manager,
	logger *zap.Logger,
) *battleItemHandler {
	return &battleItemHandler{
		ctx:         ctx,
		charID:      charID,
		itemService: itemService,
		gameData:    gameData,
		logger:      logger,
	}
}

func (h *battleItemHandler) ExecuteItemUse(actorID string, itemID int) (int, int, bool) {
	ownerID := h.resolveOwnerID(actorID)
	if ownerID <= 0 {
		h.logger.Warn("Battle item use: could not resolve owner",
			zap.String("actor_id", actorID),
			zap.Int("item_id", itemID))
		return 0, 0, false
	}

	it, err := h.itemService.GetItemByID(h.ctx, ownerID, int64(itemID))
	if err != nil || it == nil {
		h.logger.Warn("Battle item use: item not found",
			zap.Int64("owner_id", ownerID),
			zap.Int("item_id", itemID),
			zap.Error(err))
		return 0, 0, false
	}

	if !it.IsConsumable() {
		h.logger.Debug("Battle item use: item not consumable",
			zap.Int("item_id", itemID),
			zap.Int("template_id", it.TemplateID))
		return 0, 0, false
	}

	hpAmount, mpAmount := h.resolveHealAmounts(it.TemplateID)
	if hpAmount == 0 && mpAmount == 0 {
		h.logger.Debug("Battle item use: no heal effect",
			zap.Int("item_id", itemID),
			zap.Int("template_id", it.TemplateID))
		return 0, 0, false
	}

	if err := h.itemService.ConsumeItemByID(h.ctx, ownerID, int64(itemID)); err != nil {
		h.logger.Warn("Battle item use: failed to consume",
			zap.Int("item_id", itemID),
			zap.Error(err))
		return 0, 0, false
	}

	h.logger.Info("Battle item used",
		zap.String("actor_id", actorID),
		zap.Int("item_id", itemID),
		zap.Int("hp_amount", hpAmount),
		zap.Int("mp_amount", mpAmount))

	return hpAmount, mpAmount, true
}

func (h *battleItemHandler) resolveOwnerID(actorID string) int64 {
	clean := actorID
	for i := 0; i < len(actorID); i++ {
		if actorID[i] == '_' {
			clean = actorID[:i]
			break
		}
	}
	id, err := strconv.ParseInt(clean, 10, 64)
	if err != nil {
		return 0
	}
	return id
}

func (h *battleItemHandler) resolveHealAmounts(templateID int) (int, int) {
	if h.gameData != nil {
		tpl := h.gameData.GetItem(templateID)
		if tpl != nil {
			hpAmount := int(tpl.I1)
			mpAmount := int(tpl.I2)
			if hpAmount > 0 || mpAmount > 0 {
				return hpAmount, mpAmount
			}
		}
	}

	amount, kind, ok := appitem.GetPotionHealAmount(templateID)
	if !ok {
		return 0, 0
	}
	switch kind {
	case appitem.PotionHealHP:
		return amount, 0
	case appitem.PotionHealMP:
		return 0, amount
	}
	return 0, 0
}
