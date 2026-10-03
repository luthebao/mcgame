// Open-sourced by BaoLT

// Farm RPC handlers expose farm data and crop tooltip responses.
package farm

import (
	"strconv"

	appchar "mcgame-server/internal/application/character"
	appfarm "mcgame-server/internal/application/farm"
	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type Handler struct {
	farmService        *appfarm.Service
	magicEstateService *appfarm.MagicEstateService
	itemService        *appitem.Service
	charService        *appchar.Service
	logger             *zap.Logger
}

func NewHandler(farmService *appfarm.Service, magicEstateService *appfarm.MagicEstateService, itemService *appitem.Service, charService *appchar.Service, logger *zap.Logger) *Handler {
	return &Handler{
		farmService:        farmService,
		magicEstateService: magicEstateService,
		itemService:        itemService,
		charService:        charService,
		logger:             logger,
	}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getFarmByCid", h.GetFarmByCid)
	dispatcher.Register("getFriendFarm", h.GetFriendFarm)
	dispatcher.Register("addMineral", h.AddMineral)
	dispatcher.Register("addFarmNum", h.AddFarmNum)
	dispatcher.Register("farmLvUp", h.FarmLvUp)
	dispatcher.Register("harvestMine", h.HarvestMine)
	dispatcher.Register("steelMine", h.SteelMine)
	dispatcher.Register("getFarmBag", h.GetFarmBag)
	dispatcher.Register("getFarmBagAll", h.GetFarmBagAll)
	dispatcher.Register("getFromFarmBag", h.GetFromFarmBag)
	dispatcher.Register("getFarmLog", h.GetFarmLog)
	dispatcher.Register("getReplayList", h.GetReplayList)
	dispatcher.Register("saveReplay", h.SaveReplay)
	dispatcher.Register("delReplay", h.DelReplay)
	dispatcher.Register("queryPlant", h.QueryPlant)
}

func (h *Handler) GetFarmByCid(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	targetCharacterID := characterID
	if len(args) >= 1 {
		switch v := args[0].(type) {
		case float64:
			if int64(v) > 0 {
				targetCharacterID = int64(v)
			}
		case int:
			if v > 0 {
				targetCharacterID = int64(v)
			}
		case int64:
			if v > 0 {
				targetCharacterID = v
			}
		}
	}

	view, err := h.magicEstateService.GetEstateView(ctx.Context, targetCharacterID)
	if err != nil {
		h.logger.Error("Failed to get farm data",
			zap.Int64("caller_character_id", characterID),
			zap.Int64("target_character_id", targetCharacterID),
			zap.Error(err))
		return nil, err
	}
	data := h.buildMagicEstatePayload(view)

	if err := ctx.Connection.SendCallback("onGetFarmData", data); err != nil {
		h.logger.Warn("Failed to send onGetFarmData callback", zap.Error(err))
	}

	return data, nil
}

func (h *Handler) QueryPlant(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.farmService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	plotNPCID, ok := FindFirstIntArg(args)
	if !ok || plotNPCID == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	plotNPCID = NormalizePlotNPCID(h.farmService, plotNPCID)

	targetCharacterID := ctx.Connection.GetViewedFarmCharacterID()
	if targetCharacterID <= 0 {
		targetCharacterID = characterID
	}
	if len(args) >= 2 {
		switch v := args[1].(type) {
		case float64:
			if int64(v) > 0 {
				targetCharacterID = int64(v)
			}
		case int:
			if v > 0 {
				targetCharacterID = int64(v)
			}
		case int64:
			if v > 0 {
				targetCharacterID = v
			}
		}
	}

	data, err := h.farmService.GetPlantQueryDataForViewer(ctx.Context, targetCharacterID, characterID, plotNPCID)
	if err != nil {
		h.logger.Warn("Failed to query planted crop",
			zap.Int64("character_id", characterID),
			zap.Int64("target_character_id", targetCharacterID),
			zap.Int("plot_npc_id", plotNPCID),
			zap.Error(err))
		return nil, err
	}

	if data == nil {
		return nil, nil
	}

	return map[string]interface{}{
		"name":      data.Name,
		"plantName": data.Name,
		"ownerName": data.OwnerName,
		"level":     data.Level,
		"remain":    data.Remain,
		"total":     data.Total,
		"state":     data.State,
		"timeLeft":  data.TimeLeft,
	}, nil
}
