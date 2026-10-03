// Open-sourced by BaoLT

// Game data configuration handlers.
package gamedata

import (
	"context"
	"encoding/json"
	"fmt"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	gamedatastore "mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetDataConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		h.logger.Warn("GetDataConfig: missing parameters",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int("arg_count", len(args)))
		return nil, pkgerrors.Wrap(pkgerrors.ErrInvalidArgs, "expected 2 arguments: tableType, recordID")
	}

	tableType, err := h.parseNumericArg(ctx, args[0], "table_type")
	if err != nil {
		return nil, err
	}

	recordID, err := h.parseNumericArg(ctx, args[1], "record_id")
	if err != nil {
		return nil, err
	}

	tableName, ok := models.TableIDToName[tableType]
	if !ok {
		if tableType == 39 {
			h.logger.Info("GetDataConfig: providing empty response for TBL_PET (39)", zap.Uint32("conn_id", ctx.ConnID))
			return map[string]interface{}{
				"type": tableType,
				"data": []interface{}{},
			}, nil
		}

		h.logger.Warn("GetDataConfig: unknown table type",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int("table_type", tableType),
			zap.Any("available_types", getAvailableTableTypes()))
		return nil, pkgerrors.Wrap(pkgerrors.ErrInvalidInput, fmt.Sprintf("unknown table type: %d", tableType))
	}

	repo := h.gameData.GetRepository()
	if repo == nil {
		h.logger.Error("GetDataConfig: game data repository not available")
		return nil, pkgerrors.ErrSystemError
	}

	rpcCtx := context.Background()
	if recordID <= 0 {
		return h.getAllDataConfig(ctx, rpcCtx, repo, tableType, tableName)
	}

	return h.getSingleDataConfig(ctx, rpcCtx, repo, tableType, tableName, recordID)
}

func (h *Handler) getAllDataConfig(ctx *rtmp.RPCContext, rpcCtx context.Context, repo gamedatastore.Repository, tableType int, tableName string) (interface{}, error) {
	records, err := repo.GetAllByTable(rpcCtx, tableName)
	if err != nil {
		h.logger.Error("GetDataConfig: failed to get all records",
			zap.String("table_name", tableName),
			zap.Error(err))
		return nil, pkgerrors.Wrap(err, "failed to get all records")
	}

	dataMap := make(map[string]interface{}, len(records))
	for _, recordJSON := range records {
		recordData, err := normalizeJSONRecord(recordJSON)
		if err != nil {
			h.logger.Warn("GetDataConfig: failed to parse record", zap.Error(err))
			continue
		}

		if id, ok := recordData["id"]; ok {
			dataMap[fmt.Sprintf("%v", id)] = recordData
		}
	}

	h.logger.Info("GetDataConfig: returning all records",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("table_name", tableName),
		zap.Int("count", len(records)))
	if len(dataMap) > 0 {
		for id, rec := range dataMap {
			h.logger.Debug("GetDataConfig: example record", zap.String("id", id), zap.Any("record", rec))
			break
		}
	}

	return map[string]interface{}{
		"type": tableType,
		"data": dataMap,
	}, nil
}

func (h *Handler) getSingleDataConfig(ctx *rtmp.RPCContext, rpcCtx context.Context, repo gamedatastore.Repository, tableType int, tableName string, recordID int) (interface{}, error) {
	recordJSON, err := h.getCurrentCharacterItemInstanceJSON(ctx, tableType, recordID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to resolve live item instance")
	}
	if recordJSON == nil {
		recordJSON, err = repo.GetByTableAndID(rpcCtx, tableName, recordID)
	}
	if err != nil {
		h.logger.Error("GetDataConfig: failed to get record",
			zap.String("table_name", tableName),
			zap.Int("record_id", recordID),
			zap.Error(err))
		return nil, pkgerrors.Wrap(err, "failed to get record")
	}
	if recordJSON == nil {
		fallbackJSON, resolvedID, fallbackOK := h.resolveInstanceCompatibilityRecord(ctx, tableType, recordID)
		if !fallbackOK {
			h.logger.Warn("GetDataConfig: record not found",
				zap.String("table_name", tableName),
				zap.Int("record_id", recordID))
			return map[string]interface{}{
				"type": tableType,
				"data": nil,
			}, nil
		}

		recordJSON = fallbackJSON
		h.logger.Info("GetDataConfig: resolved compatibility fallback",
			zap.String("table_name", tableName),
			zap.Int("requested_id", recordID),
			zap.Int("resolved_id", resolvedID))
	}

	recordData, err := normalizeJSONRecord(recordJSON)
	if err != nil {
		h.logger.Error("GetDataConfig: failed to parse record", zap.Error(err))
		return nil, pkgerrors.Wrap(err, "failed to parse record")
	}

	enrichInstanceRecordData(rpcCtx, repo, tableType, recordData, true)
	if isInstanceTable(tableType) {
		recordData["id"] = recordID
		recordData["itemId"] = recordID

	}

	return map[string]interface{}{
		"type":  tableType,
		"data":  recordData,
		"index": recordID,
	}, nil
}

func (h *Handler) getCurrentCharacterItemInstanceJSON(ctx *rtmp.RPCContext, tableType int, recordID int) (json.RawMessage, error) {
	if !isInstanceTable(tableType) {
		return nil, nil
	}
	if payload, err := h.getCurrentGuildWarehouseInstanceJSON(ctx, tableType, recordID); payload != nil || err != nil {
		return payload, err
	}
	if h.itemService == nil {
		return nil, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, nil
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, int64(recordID))
	if err != nil || it == nil {
		return nil, nil
	}

	if tableType == 18 && it.ItemType != domainitem.ItemTypeEquipment {
		return nil, nil
	}
	if tableType == 28 && it.ItemType == domainitem.ItemTypeEquipment {
		return nil, nil
	}

	payload, err := json.Marshal(it.ToDTO())
	if err != nil {
		return nil, err
	}

	return payload, nil
}

func (h *Handler) getCurrentGuildWarehouseInstanceJSON(ctx *rtmp.RPCContext, tableType int, recordID int) (json.RawMessage, error) {
	if h.guildService == nil || tableType != 28 || recordID <= 0 {
		return nil, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, nil
	}

	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil || guildItem == nil {
		return nil, nil
	}

	for _, raw := range guildItem.Warehouse {
		slot, ok := raw.(map[string]interface{})
		if !ok {
			continue
		}
		if safeInterfaceToInt(slot["itemId"]) != recordID {
			continue
		}
		payload := map[string]interface{}{
			"id":       recordID,
			"sid":      safeInterfaceToInt(slot["sid"]),
			"type":     28,
			"itemId":   recordID,
			"tid":      safeInterfaceToInt(slot["tid"]),
			"stackNum": safeInterfaceToInt(slot["stackNum"]),
			"t":        -1,
		}
		return json.Marshal(payload)
	}

	return nil, nil
}

func (h *Handler) resolveInstanceCompatibilityRecord(ctx *rtmp.RPCContext, tableType int, recordID int) (json.RawMessage, int, bool) {
	if h.itemService == nil {
		return nil, 0, false
	}
	if tableType != 28 && tableType != 18 {
		return nil, 0, false
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, 0, false
	}

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		return nil, 0, false
	}

	var best *domainitem.Item
	for _, it := range items {
		if it == nil || it.TemplateID != recordID {
			continue
		}
		if tableType == 18 && it.ItemType != domainitem.ItemTypeEquipment {
			continue
		}
		if tableType == 28 && it.ItemType == domainitem.ItemTypeEquipment {
			continue
		}
		if best == nil || preferCompatibilityInstance(it, best) {
			best = it
		}
	}

	if best == nil {
		return nil, 0, false
	}

	payload, err := json.Marshal(best.ToDTO())
	if err != nil {
		return nil, 0, false
	}

	return payload, int(best.ID), true
}

func preferCompatibilityInstance(left *domainitem.Item, right *domainitem.Item) bool {
	leftPriority := compatibilitySlotPriority(left.SlotType)
	rightPriority := compatibilitySlotPriority(right.SlotType)
	if leftPriority != rightPriority {
		return leftPriority < rightPriority
	}
	if left.SlotIndex != right.SlotIndex {
		return left.SlotIndex < right.SlotIndex
	}
	return left.ID < right.ID
}

func compatibilitySlotPriority(slotType domainitem.SlotType) int {
	switch slotType {
	case domainitem.SlotTypeBag:
		return 0
	case domainitem.SlotTypeTempBag:
		return 1
	case domainitem.SlotTypeQuestBag:
		return 2
	case domainitem.SlotTypePetItemBag:
		return 3
	case domainitem.SlotTypeEquipped:
		return 4
	case domainitem.SlotTypeBank:
		return 5
	default:
		return 6
	}
}

func (h *Handler) parseNumericArg(ctx *rtmp.RPCContext, arg interface{}, fieldName string) (int, error) {
	switch v := arg.(type) {
	case float64:
		return rtmputils.SafeFloat64ToInt(v), nil
	case int:
		return v, nil
	case int64:
		return int(v), nil
	default:
		h.logger.Warn("GetDataConfig: invalid numeric argument",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("field", fieldName),
			zap.Any("value", arg),
			zap.String("type", fmt.Sprintf("%T", arg)))
		return 0, pkgerrors.Wrap(pkgerrors.ErrInvalidInput, fmt.Sprintf("invalid %s: %v (type: %T)", fieldName, arg, arg))
	}
}
