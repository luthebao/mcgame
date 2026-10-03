// Open-sourced by BaoLT

// Game data package client handlers.
package gamedata

import (
	"context"
	"encoding/json"
	"fmt"

	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetDataPackageClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.Wrap(pkgerrors.ErrInvalidArgs, "expected 2 arguments: tableType, recordID")
	}

	tableType := safeInterfaceToInt(args[0])
	recordID := safeInterfaceToInt(args[1])

	h.logger.Info("GetDataPackageClient: request",
		zap.Int("table_type", tableType),
		zap.Int("record_id", recordID))

	tableName, ok := models.TableIDToName[tableType]
	if !ok {
		return nil, fmt.Errorf("unknown table type: %d", tableType)
	}

	repo := h.gameData.GetRepository()
	rpcCtx := context.Background()

	recordJSON, err := h.getCurrentCharacterItemInstanceJSON(ctx, tableType, recordID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to resolve live item instance")
	}
	if recordJSON == nil {
		recordJSON, err = repo.GetByTableAndID(rpcCtx, tableName, recordID)
	}
	if err != nil || recordJSON == nil {
		h.logger.Warn("GetDataPackageClient: record not found", zap.String("table", tableName), zap.Int("id", recordID))
		return nil, pkgerrors.ErrNotFound
	}

	recordData, err := normalizeJSONRecord(recordJSON)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to parse record")
	}

	response := map[string]interface{}{
		"type": tableType,
		"inst": recordData,
		"temp": recordData,
	}

	if !isInstanceTable(tableType) {
		return response, nil
	}

	enrichInstanceRecordData(rpcCtx, repo, tableType, recordData, false)
	if templateData := loadTemplateRecordData(rpcCtx, repo, tableType, recordData); templateData != nil {
		response["temp"] = templateData
		if tVal, ok := templateData["t"]; ok {
			recordData["t"] = tVal
		}
	}
	if _, ok := recordData["t"]; !ok {
		recordData["t"] = -1
	}
	response["inst"] = recordData

	return response, nil
}

func (h *Handler) GetItemInstF(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		h.logger.Warn("GetItemInstF: missing itemID parameter")
		return nil, pkgerrors.Wrap(pkgerrors.ErrInvalidArgs, "expected 1 argument: itemInstanceID")
	}

	itemID := safeInterfaceToInt(args[0])
	h.logger.Debug("GetItemInstF: request", zap.Int("item_id", itemID))

	repo := h.gameData.GetRepository()
	rpcCtx := context.Background()

	tableType := 28
	tableName := models.TableIDToName[tableType]
	recordJSON, err := h.getCurrentCharacterItemInstanceJSON(ctx, tableType, itemID)
	if err != nil {
		return "{}", nil
	}
	if recordJSON == nil {
		recordJSON, err = repo.GetByTableAndID(rpcCtx, tableName, itemID)
	}
	if err != nil || recordJSON == nil {
		tableType = 18
		tableName = models.TableIDToName[tableType]
		recordJSON, err = h.getCurrentCharacterItemInstanceJSON(ctx, tableType, itemID)
		if err != nil {
			return "{}", nil
		}
		if recordJSON == nil {
			recordJSON, err = repo.GetByTableAndID(rpcCtx, tableName, itemID)
		}
		if err != nil || recordJSON == nil {
			h.logger.Warn("GetItemInstF: item instance not found", zap.Int("item_id", itemID))
			return "{}", nil
		}
	}

	var rawData map[string]interface{}
	if err := json.Unmarshal(recordJSON, &rawData); err != nil {
		return "{}", nil
	}

	if f, ok := rawData["f"]; ok {
		h.logger.Debug("GetItemInstF: returning f field", zap.Any("f", f))
		return f, nil
	}

	return "{}", nil
}
