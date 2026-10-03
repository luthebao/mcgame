// Open-sourced by BaoLT

package marriage

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) InitMarriage(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		h.logger.Warn("InitMarriage: invalid character ID",
			zap.String("char_id", ctx.CharacterID),
			zap.Error(err))
		return nil, err
	}

	firstFlag := false
	if len(args) > 0 {
		if flag, ok := args[0].(bool); ok {
			firstFlag = flag
		}
	}

	h.logger.Debug("InitMarriage: initializing marriage panel",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Bool("first_flag", firstFlag))

	seekingList, charMarriageList, err := h.service.InitPanel(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("InitMarriage: failed to build panel state",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	if err := h.sendPanelState(ctx, seekingList, charMarriageList); err != nil {
		return nil, err
	}

	h.logger.Info("InitMarriage: returning marriage data",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("seeking_count", len(seekingList)),
		zap.Int("marriage_count", len(charMarriageList)))

	return nil, nil
}

func (h *Handler) GetCoupleRank(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn("GetCoupleRank: no character ID in session",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	page := 0
	if len(args) > 0 {
		parsedPage, err := parseIntArg(args[0])
		if err == nil {
			page = parsedPage
		}
	}

	h.logger.Debug("GetCoupleRank: fetching couple ranking",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Int("page", page))

	couples, err := h.service.GetCoupleRank(ctx.Context, page)
	if err != nil {
		h.logger.Error("GetCoupleRank: failed to fetch ranking",
			zap.Int("page", page),
			zap.Error(err))
		return nil, err
	}

	h.logger.Info("GetCoupleRank: returning couple ranking",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("page", page),
		zap.Int("count", len(couples)))

	if err := ctx.Connection.SendCallback("onAddCoupleData", couples); err != nil {
		h.logger.Error("GetCoupleRank: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return couples, nil
}

func (h *Handler) refreshPanel(ctx *rtmp.RPCContext, characterID int64) error {
	seekingList, charMarriageList, err := h.service.InitPanel(ctx.Context, characterID)
	if err != nil {
		return err
	}

	return h.sendPanelState(ctx, seekingList, charMarriageList)
}

func (h *Handler) sendPanelState(ctx *rtmp.RPCContext, seekingList []map[string]interface{}, charMarriageList []map[string]interface{}) error {
	seekingPayload := make([]interface{}, 0, len(seekingList))
	for _, item := range seekingList {
		seekingPayload = append(seekingPayload, item)
	}

	charPayload := make([]interface{}, 0, len(charMarriageList))
	for _, item := range charMarriageList {
		charPayload = append(charPayload, item)
	}

	if err := sendSeekingMarriageList(ctx, seekingPayload); err != nil {
		h.logger.Error("sendPanelState: failed to send seeking callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return err
	}

	if err := sendCharMarriageList(ctx, charPayload); err != nil {
		h.logger.Error("sendPanelState: failed to send char callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return err
	}

	return nil
}
