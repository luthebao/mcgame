// Open-sourced by BaoLT

package auth

import (
	"strconv"

	appchar "mcgame-server/internal/application/character"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

func (h *Handler) GetLineInfo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.charService != nil {
		h.sendCharacterListCallback(ctx)
	}

	if h.lineListProvider == nil {
		h.logger.Error("Line list provider not configured", zap.Uint32("conn_id", ctx.ConnID))
		return []map[string]interface{}{}, nil
	}

	lines, err := h.lineListProvider.GetLineList(ctx.Context)
	if err != nil {
		h.logger.Error("Failed to get line list", zap.Error(err))
		return []map[string]interface{}{}, nil
	}
	return lines, nil
}

func (h *Handler) ShowCharacterInfo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, ok := lastInt64Arg(args)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if h.rtmpServer != nil && !h.rtmpServer.IsCharacterOnline(strconv.FormatInt(characterID, 10)) {
		_ = ctx.Connection.SendCallback("onViewChar", nil)
		return nil, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	if char == nil {
		_ = ctx.Connection.SendCallback("onViewChar", nil)
		return nil, nil
	}
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx.Context, char)
	}

	return h.buildShowCharacterInfoPayload(ctx, char), nil
}

func (h *Handler) SendCharList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.sendCharacterListCallback(ctx)
	return nil, nil
}

func (h *Handler) NewChar(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return rtmp.ErrorToResponse(pkgerrors.ErrInvalidArgs), nil
	}

	charData, ok := args[0].(map[string]interface{})
	if !ok {
		h.logger.Warn("NewChar: invalid character data format",
			zap.Any("args", args))
		return rtmp.ErrorToResponse(pkgerrors.ErrInvalidArgs), nil
	}

	name, ok := charData["name"].(string)
	if !ok || name == "" {
		h.logger.Warn("NewChar: missing or invalid name")
		return rtmp.ErrorToResponse(pkgerrors.ErrInvalidArgs), nil
	}

	gender := 0
	if genderValue, ok := charData["gender"].(float64); ok {
		gender = int(genderValue)
	}

	classID := parseClassID(charData)
	if classID < 1 || classID > 6 {
		h.logger.Warn("NewChar: invalid class ID",
			zap.Int("class_id", classID))
		return rtmp.ErrorToResponse(pkgerrors.ErrInvalidArgs), nil
	}

	accountID, err := uuid.Parse(ctx.AccountID)
	if err != nil {
		h.logger.Warn("NewChar: invalid account ID in session",
			zap.String("account_id", ctx.AccountID))
		return rtmp.ErrorToResponse(pkgerrors.ErrUnauthorized), nil
	}

	h.logger.Info("NewChar: creating character",
		zap.String("name", name),
		zap.Int("gender", gender),
		zap.Int("class_id", classID),
		zap.String("account_id", accountID.String()))

	char, err := h.charService.Create(ctx.Context, &appchar.CreateRequest{
		AccountID: accountID,
		Name:      name,
		ClassID:   classID,
		Gender:    gender,
	})
	if err != nil {
		h.logger.Error("NewChar: failed to create character",
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("NewChar: character created successfully",
		zap.Int64("character_id", char.ID),
		zap.String("name", char.Name))

	h.sendCharacterListCallback(ctx)

	return char.ToDTO(), nil
}

func (h *Handler) BackToCharSelect(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BackToCharSelect called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("account_id", ctx.AccountID))

	if h.sceneManager != nil && ctx.Connection != nil {
		mapID, charID := ctx.Connection.GetSceneInfo()
		if mapID > 0 && charID > 0 {
			channelID := ctx.Connection.GetChannelID()
			h.sceneManager.RemoveFromScene(channelID, mapID, ctx.ConnID)
			h.sceneManager.BroadcastToScene(channelID, mapID, ctx.ConnID, "onCharLeaveScene", charID)
			ctx.Connection.SetSceneInfo(0, 0)
			h.logger.Debug("BackToCharSelect: removed player from scene",
				zap.Int("map_id", mapID),
				zap.Int64("char_id", charID))
		}
	}

	ctx.CharacterID = ""

	accountIDStr := ctx.AccountID
	if accountIDStr == "" {
		h.logger.Warn("BackToCharSelect: no account ID in session")
		return nil, pkgerrors.ErrUnauthorized
	}

	accountID, err := uuid.Parse(accountIDStr)
	if err != nil {
		h.logger.Error("BackToCharSelect: failed to parse account ID", zap.Error(err))
		return nil, pkgerrors.ErrInvalidInput
	}

	charList := h.loadCharacterList(ctx, accountID, accountIDStr)
	h.sendCharacterListCallback(ctx)

	h.logger.Info("BackToCharSelect: returning character list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("char_count", len(charList)))

	return charList, nil
}

func (h *Handler) sendCharacterListCallback(ctx *rtmp.RPCContext) {
	if h.charService == nil {
		h.sendOnIclCallback(ctx, []map[string]interface{}{})
		return
	}

	accountIDStr := ctx.AccountID
	if accountIDStr == "" {
		h.logger.Debug("No account ID in session, using default test account")
		accountIDStr = "00000000-0000-0000-0000-000000000001"
	}

	accountID, err := uuid.Parse(accountIDStr)
	if err != nil {
		h.logger.Error("Failed to parse account ID", zap.Error(err))
		h.sendOnIclCallback(ctx, []map[string]interface{}{})
		return
	}

	charList := h.loadCharacterList(ctx, accountID, accountIDStr)

	h.sendOnIclCallback(ctx, charList)
}

func (h *Handler) sendOnIclCallback(ctx *rtmp.RPCContext, charList []map[string]interface{}) {
	if err := ctx.Connection.SendCallback("onIcl", charList); err != nil {
		h.logger.Error("sendOnIclCallback: failed to send",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return
	}

}

func (h *Handler) loadCharacterList(ctx *rtmp.RPCContext, accountID uuid.UUID, accountIDStr string) []map[string]interface{} {
	chars, err := h.charService.GetByAccountID(ctx.Context, accountID)
	if err != nil {
		h.logger.Warn("Failed to get characters for account",
			zap.String("account_id", accountIDStr),
			zap.Error(err))
		return []map[string]interface{}{}
	}

	charList := make([]map[string]interface{}, len(chars))
	for i, char := range chars {
		charList[i] = h.characterListEntry(char)
	}

	return charList
}

func (h *Handler) characterListEntry(char *character.Character) map[string]interface{} {
	iconCodeStr := h.charService.GetIconCodeByClassAndGender(char.ClassID, char.Gender)
	iconCode, _ := strconv.ParseInt(iconCodeStr, 10, 64)

	return map[string]interface{}{
		"id":       char.ID,
		"name":     char.Name,
		"level":    char.Level,
		"exp":      char.CumulativeExpCapped(),
		"classId":  char.ClassID,
		"gender":   char.Gender,
		"delTime":  0,
		"iconCode": iconCode,
		"cl":       char.ClassRank,
		"qn":       char.QuestN,
	}
}

func parseClassID(charData map[string]interface{}) int {
	if classData, ok := charData["classData"].(map[string]interface{}); ok {
		if classID, ok := parseIntArg(classData["classId"]); ok {
			return classID
		}
		if classID, ok := parseIntArg(classData["id"]); ok {
			return classID
		}
	}

	classID, _ := parseIntArg(charData["classId"])
	return classID
}

func (h *Handler) buildShowCharacterInfoPayload(ctx *rtmp.RPCContext, char *character.Character) map[string]interface{} {
	data := char.ToDTO()
	data["cl"] = char.ClassRank
	data["qn"] = char.QuestN
	data["t"] = 0
	data["chival"] = 0
	data["pop"] = char.Pop
	data["gmLevel"] = 0
	data["expRe"] = char.RebirthExp
	data["newGrade"] = 0
	data["questLog"] = buildQuestLogString(h.questService, ctx, char.ID)

	if h.charService != nil {
		if _, imgCodeStr, _, _ := h.charService.GetAppearanceCodesByClassAndGender(char.ClassID, char.Gender); imgCodeStr != "" {
			if imgCode, err := strconv.ParseInt(imgCodeStr, 10, 64); err == nil {
				data["imgCode"] = imgCode
			}
		}
	}

	guildName := "Không bang hội"
	if h.guildService != nil {
		if guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, char.ID); err == nil && guildItem != nil {
			guildName = guildItem.Name
		}
	}

	equipActiveList := map[string]interface{}{}
	equiptList := map[string]interface{}{}
	if h.itemService != nil {
		equipActiveList = h.itemService.BuildEquipActiveList(ctx.Context, char.ID)
		appearance := h.itemService.BuildCharacterAppearance(ctx.Context, char.ID, char.Gender)
		if appearance.EquiptList != nil {
			equiptList = appearance.EquiptList
		}
	}

	return map[string]interface{}{
		"data":            data,
		"guild":           guildName,
		"equipActiveList": equipActiveList,
		"equiptList":      equiptList,
		"ee":              char.Ee,
		"en":              char.En,
		"ef":              char.Ef,
		"pmLevel":         char.CurrentPMLevel(ctx.Timestamp),
		"newGrade":        0,
		"achLog":          map[string]interface{}{},
		"totalAchPoint":   0,
	}
}

