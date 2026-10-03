// Open-sourced by BaoLT

// Social relationship and friend-list handlers.
package social

import (
	"fmt"
	"strconv"
	"unicode"

	domainsocial "mcgame-server/internal/domain/social"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const maxCharacterNameLen = 30

func validateName(name string) error {
	if len(name) > maxCharacterNameLen {
		return pkgerrors.ErrInvalidInput
	}
	for _, r := range name {
		if unicode.IsControl(r) {
			return pkgerrors.ErrInvalidInput
		}
	}
	return nil
}

func (h *Handler) InitViewImC(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := parseSessionCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("InitViewImC: fetching relationship list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	relationships, err := h.socialService.GetRelationshipList(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("InitViewImC: failed to get relationship list",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make(map[string]interface{})
	for _, rel := range relationships {
		relID, ok := rel["id"].(int64)
		if !ok {
			continue
		}
		result[strconv.FormatInt(relID, 10)] = toClientRelationshipDTO(rel)
	}

	h.logger.Info("InitViewImC: returning relationship list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("count", len(result)))

	if err := ctx.Connection.SendCallback("onInitViewImC", result); err != nil {
		h.logger.Error("InitViewImC: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) GetFriendList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := parseSessionCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetFriendList: fetching friend list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	friends, err := h.socialService.GetFriendList(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("GetFriendList: failed to get friend list",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.logger.Info("GetFriendList: returning friend list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("count", len(friends)))

	return friends, nil
}

func (h *Handler) GetBlackList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := parseSessionCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetBlackList: fetching blacklist",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	blacklist, err := h.socialService.GetBlacklist(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("GetBlackList: failed to get blacklist",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.logger.Info("GetBlackList: returning blacklist",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("count", len(blacklist)))

	return blacklist, nil
}

func (h *Handler) AddRelationByName(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	name, ok := args[0].(string)
	if !ok {
		h.logger.Warn("AddRelationByName: invalid name type", zap.Any("name", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	if err := validateName(name); err != nil {
		h.logger.Warn("AddRelationByName: name failed validation",
			zap.Int("len", len(name)))
		return nil, pkgerrors.ErrInvalidInput
	}

	var relType int
	switch value := args[1].(type) {
	case float64:
		relType = int(value)
	case int:
		relType = value
	default:
		h.logger.Warn("AddRelationByName: invalid type", zap.Any("type", args[1]))
		return nil, pkgerrors.ErrInvalidInput
	}

	domainType, err := clientRelationshipTypeToDomain(relType)
	if err != nil {
		h.logger.Warn("AddRelationByName: unsupported relationship type",
			zap.Int("client_type", relType),
			zap.Error(err))
		return nil, err
	}

	h.logger.Info("AddRelationByName called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.String("target_name", name),
		zap.Int("relationship_type", relType))

	relDTO, err := h.socialService.AddRelationshipByName(ctx.Context, characterID, name, domainType)
	if err != nil {
		h.logger.Warn("AddRelationByName: failed to add relationship",
			zap.String("target_name", name),
			zap.Int("relationship_type", relType),
			zap.Error(err))

		if callbackErr := ctx.Connection.SendCallback("onAddRelationByName", -1, relType); callbackErr != nil {
			h.logger.Error("Failed to send onAddRelationByName error callback",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(callbackErr))
		}

		return map[string]interface{}{
			"success": false,
			"error":   "cannot add relationship",
		}, nil
	}

	targetID, ok := relDTO["otherId"].(int64)
	if !ok {
		targetID = -1
	}

	if err := ctx.Connection.SendCallback("onAddRelationByName", targetID, relType); err != nil {
		h.logger.Error("Failed to send onAddRelationByName callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	if domainType == domainsocial.RelationshipTypeFriend && targetID > 0 {
		targetName, _ := relDTO["name"].(string)
		h.notifyFriendAdded(ctx, characterID, targetID, targetName)
	}

	h.logger.Info("Relationship added",
		zap.Int64("character_id", characterID),
		zap.Int64("target_id", targetID),
		zap.String("target_name", name),
		zap.Int("relationship_type", relType))

	return map[string]interface{}{
		"success":      true,
		"relationship": toClientRelationshipDTO(relDTO),
	}, nil
}

func (h *Handler) notifyFriendAdded(ctx *rtmp.RPCContext, initiatorID, targetID int64, targetName string) {
	initiatorName, err := h.socialService.GetCharacterName(ctx.Context, initiatorID)
	if err != nil {
		h.logger.Warn("notifyFriendAdded: failed to fetch initiator name",
			zap.Int64("character_id", initiatorID),
			zap.Error(err))
		initiatorName = ""
	}

	initiatorMsg := fmt.Sprintf(`Bạn đã kết bạn với <font color="#FF0000">%s</font>!`, targetName)
	if err := ctx.Connection.SendCallback("onSystemSay", initiatorMsg); err != nil {
		h.logger.Error("notifyFriendAdded: failed to send initiator notice",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	if h.rtmpServer == nil {
		return
	}
	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetID, 10))
	if targetConn == nil {
		return
	}

	targetMsg := fmt.Sprintf(`<font color="#FF0000">%s</font> đã thêm bạn vào danh sách bạn bè!`, initiatorName)
	if err := targetConn.SendCallback("onSystemSay", targetMsg); err != nil {
		h.logger.Error("notifyFriendAdded: failed to send target notice",
			zap.Int64("target_id", targetID),
			zap.Error(err))
	}
}

func (h *Handler) DelRelationship(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var relID int64
	switch value := args[0].(type) {
	case float64:
		relID = int64(value)
	case int:
		relID = int64(value)
	case int64:
		relID = value
	default:
		h.logger.Warn("DelRelationship: invalid relationship ID type", zap.Any("rel_id", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	h.logger.Info("DelRelationship called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("relationship_id", relID))

	if err := h.socialService.DeleteRelationshipByID(ctx.Context, characterID, relID); err != nil {
		h.logger.Warn("DelRelationship: failed to delete relationship",
			zap.Int64("relationship_id", relID),
			zap.Error(err))
		return nil, err
	}

	if err := ctx.Connection.SendCallback("onDelRelationship", relID); err != nil {
		h.logger.Error("DelRelationship: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	h.logger.Info("Relationship deleted",
		zap.Int64("character_id", characterID),
		zap.Int64("relationship_id", relID))

	return nil, nil
}

func parseSessionCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	characterIDStr := ctx.CharacterID
	if characterIDStr == "" {
		return 0, pkgerrors.ErrUnauthorized
	}

	characterID, err := strconv.ParseInt(characterIDStr, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrInvalidInput
	}

	return characterID, nil
}
