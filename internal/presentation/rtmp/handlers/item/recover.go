// Open-sourced by BaoLT

// Handlers for fullHpRecoverByItem and fullMpRecoverByItem RPCs.
// The Flash client can target the character or active pet and may omit the
// item list for MP recovery, so the server must resolve the target and scan
// the bag when needed.
package item

import (
	"sort"
	"strconv"

	amf0 "github.com/yutopp/go-amf0"
	appitem "mcgame-server/internal/application/item"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	recoverTargetCharacter int64 = 1
	recoverTargetPet       int64 = 2
)

type recoverPetCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
}

func parseRecoverItemEntries(raw interface{}) []appitem.RecoverItemEntry {
	var entries []appitem.RecoverItemEntry

	switch v := raw.(type) {
	case []interface{}:
		for _, elem := range v {
			if entry, ok := parseOneRecoverEntry(elem); ok {
				entries = append(entries, entry)
			}
		}
	case amf0.ECMAArray:
		for _, elem := range v {
			if entry, ok := parseOneRecoverEntry(elem); ok {
				entries = append(entries, entry)
			}
		}
	case map[string]interface{}:
		for _, elem := range v {
			if entry, ok := parseOneRecoverEntry(elem); ok {
				entries = append(entries, entry)
			}
		}
	}

	sortRecoverEntries(entries)
	return entries
}

func sortRecoverEntries(entries []appitem.RecoverItemEntry) {
	sort.SliceStable(entries, func(i, j int) bool {
		if entries[i].Priority != entries[j].Priority {
			return entries[i].Priority < entries[j].Priority
		}
		return entries[i].ItemDatabaseID < entries[j].ItemDatabaseID
	})
}

func normalizeToMap(raw interface{}) (map[string]interface{}, bool) {
	switch v := raw.(type) {
	case map[string]interface{}:
		return v, true
	case amf0.ECMAArray:
		return map[string]interface{}(v), true
	default:
		return nil, false
	}
}

func parseOneRecoverEntry(raw interface{}) (appitem.RecoverItemEntry, bool) {
	obj, ok := normalizeToMap(raw)
	if !ok {
		return appitem.RecoverItemEntry{}, false
	}

	var itemID int64
	if sid, ok := parseFlexibleInt64(obj["sid"]); ok && sid > 0 {
		itemID = sid
	} else if id, ok := parseFlexibleInt64(obj["id"]); ok && id > 0 {
		itemID = id
	} else if itemIdVal, ok := parseFlexibleInt64(obj["itemId"]); ok && itemIdVal > 0 {
		itemID = itemIdVal
	}

	if itemID <= 0 {
		return appitem.RecoverItemEntry{}, false
	}

	var priority int
	if p, ok := obj["priority"]; ok {
		if pf, ok := p.(float64); ok {
			priority = int(pf)
		}
	}

	return appitem.RecoverItemEntry{
		ItemDatabaseID: itemID,
		Priority:       priority,
	}, true
}

func (h *Handler) FullHpRecoverByItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.fullRecoverByItem(ctx, args, appitem.PotionHealHP)
}

func (h *Handler) FullMpRecoverByItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.fullRecoverByItem(ctx, args, appitem.PotionHealMP)
}

func (h *Handler) buildAutoRecoverEntries(ctx *rtmp.RPCContext, characterID int64, kind appitem.PotionHealKind) ([]appitem.RecoverItemEntry, error) {
	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	entries := make([]appitem.RecoverItemEntry, 0)
	for _, it := range items {
		if it == nil || it.SlotType != domainitem.SlotTypeBag || it.StackCount <= 0 || !it.IsConsumable() {
			continue
		}

		healAmount, healKind, ok := appitem.GetPotionHealAmount(it.TemplateID)
		if !ok || healKind != kind {
			continue
		}

		priority := healAmount
		if it.IsBound {
			priority--
		}

		entries = append(entries, appitem.RecoverItemEntry{
			ItemDatabaseID: it.ID,
			Priority:       priority,
		})
	}

	sortRecoverEntries(entries)
	return entries, nil
}

func (h *Handler) resolveRecoverPet(ctx *rtmp.RPCContext, characterID int64) (*domainpet.Pet, error) {
	if h.petService == nil {
		return nil, nil
	}
	return h.petService.GetActivePetForRecovery(ctx.Context, characterID)
}

func sendRecoverPetCallbacksToSender(sender recoverPetCallbackSender, pet *domainpet.Pet) {
	if sender == nil || pet == nil {
		return
	}

	dto := pet.ToDTO()
	_ = sender.SendCallback("updateActivatePetObj", dto)
	_ = sender.SendCallback("onUpdatePet", float64(pet.ID), "currentHp", strconv.Itoa(pet.CurrentHP))
	_ = sender.SendCallback("onUpdatePet", float64(pet.ID), "currentMp", strconv.Itoa(pet.CurrentMP))

	petDTO := dto
	if data, ok := dto["data"].(map[string]interface{}); ok {
		petDTO = data
	}
	if prop, ok := petDTO["property"]; ok {
		_ = sender.SendCallback("onRefreshPetProp", map[string]interface{}{
			"id": pet.ID,
			"s":  prop,
		})
	}
}

func sendRecoverPetCallbacks(ctx *rtmp.RPCContext, pet *domainpet.Pet) {
	if ctx == nil || ctx.Connection == nil || pet == nil {
		return
	}

	sendRecoverPetCallbacksToSender(ctx.Connection, pet)
}

func (h *Handler) fullRecoverByItem(ctx *rtmp.RPCContext, args []interface{}, kind appitem.PotionHealKind) (interface{}, error) {
	h.logger.Info("fullRecoverByItem called",
		zap.Int("arg_count", len(args)),
		zap.Any("args", args))

	if len(args) < 2 {
		h.logger.Warn("fullRecoverByItem: insufficient args", zap.Int("count", len(args)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	targetType, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	targetID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var entries []appitem.RecoverItemEntry
	if len(args) >= 3 {
		entries = parseRecoverItemEntries(args[2])
	}
	if len(entries) == 0 {
		entries, err = h.buildAutoRecoverEntries(ctx, characterID, kind)
		if err != nil {
			h.logger.Error("fullRecoverByItem: failed to auto-build entries", zap.Error(err))
			return nil, nil
		}
	}

	h.logger.Info("fullRecoverByItem: parsed entries",
		zap.Int64("target_type", targetType),
		zap.Int64("target_id", targetID),
		zap.Int("count", len(entries)))

	if len(entries) == 0 {
		return nil, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("fullRecoverByItem: failed to get character", zap.Error(err))
		return nil, nil
	}

	var pet *domainpet.Pet
	if targetType == recoverTargetPet {
		pet, err = h.resolveRecoverPet(ctx, characterID)
		if err != nil {
			h.logger.Error("fullRecoverByItem: failed to get active pet", zap.Error(err))
			return nil, nil
		}
		if pet == nil {
			h.logger.Warn("fullRecoverByItem: active pet not found",
				zap.Int64("character_id", characterID),
				zap.Int64("target_id", targetID))
			return nil, nil
		}
	}

	results, err := h.itemService.FullRecoverByItem(ctx.Context, char, pet, entries, kind)
	if err != nil {
		h.logger.Error("fullRecoverByItem: service error", zap.Error(err))
		return nil, nil
	}

	if pet != nil {
		if err := h.petService.Save(ctx.Context, pet); err != nil {
			h.logger.Error("fullRecoverByItem: failed to update pet", zap.Error(err))
		}
	} else {
		if err := h.charService.Update(ctx.Context, char); err != nil {
			h.logger.Error("fullRecoverByItem: failed to update character", zap.Error(err))
		}
	}

	if ctx.Connection != nil {
		for _, r := range results {
			if r.Deleted {
				ctx.Connection.SendCallback("onDelCharactorSlot", float64(r.ItemID), float64(r.SID))
			} else {
				ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(r.Item))
			}
		}

		if pet != nil {
			sendRecoverPetCallbacks(ctx, pet)
		} else {
			ctx.Connection.SendCallback("onUPP", map[string]interface{}{
				"money":     char.Money,
				"currentHp": char.CurrentHP,
				"currentMp": char.CurrentMP,
			})
		}
	}

	kindStr := "HP"
	if kind == appitem.PotionHealMP {
		kindStr = "MP"
	}
	h.logger.Info("fullRecoverByItem completed",
		zap.Int64("character_id", characterID),
		zap.Int64("target_type", targetType),
		zap.Int64("target_id", targetID),
		zap.String("kind", kindStr),
		zap.Int("items_consumed", len(results)))

	return nil, nil
}
