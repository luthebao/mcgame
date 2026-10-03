// Open-sourced by BaoLT

package guild

import (
	"context"
	"errors"
	"strconv"

	appguild "mcgame-server/internal/application/guild"
	domainguild "mcgame-server/internal/domain/guild"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	msgGuildCreateInsufficientLevel = "Cấp không đủ để tạo bang hội"
	msgGuildCreateInsufficientFunds = "Không đủ tiền để tạo bang hội"
	msgGuildNameTaken               = "Tên bang hội đã tồn tại"
	msgAlreadyInGuild               = "Bạn đã có bang hội"
	msgGuildCreateGuide             = "Để hiểu rõ hơn về hệ thống bang hội, bạn vui lòng mở giao diện bang hội và đọc sổ tay bang hội."
	msgGuildLeaveStateApplied       = "Điểm cống hiến và quyên góp bang hội đã trở về 0. Khi gia nhập bang hội mới, bạn sẽ nhận lại 90% và nhiệm vụ bang hội đang làm đã bị hủy."
	msgGuildRestoreApplied          = "Bạn đã nhận lại 90% điểm cống hiến và quyên góp từ bang hội trước."
	msgGuildMemberNotFound          = "Không tìm thấy thành viên bang hội để cập nhật chức vụ."
)

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	if ctx.CharacterID == "" {
		return 0, pkgerrors.ErrUnauthorized
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrInvalidInput
	}

	return characterID, nil
}

func parseIntArg(arg interface{}) (int, error) {
	switch v := arg.(type) {
	case float64:
		return int(v), nil
	case int:
		return v, nil
	case int64:
		return int(v), nil
	case string:
		parsed, err := strconv.Atoi(v)
		if err != nil {
			return 0, pkgerrors.ErrInvalidInput
		}
		return parsed, nil
	default:
		return 0, pkgerrors.ErrInvalidInput
	}
}

func parseInt64Arg(arg interface{}) (int64, error) {
	switch v := arg.(type) {
	case float64:
		return int64(v), nil
	case int:
		return int64(v), nil
	case int64:
		return v, nil
	case string:
		parsed, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, pkgerrors.ErrInvalidInput
		}
		return parsed, nil
	default:
		return 0, pkgerrors.ErrInvalidInput
	}
}

func trimResponderArg(args []interface{}) []interface{} {
	if len(args) > 0 && args[0] == nil {
		return args[1:]
	}
	return args
}

func emptyGuildPanelResponse() map[string]interface{} {
	return map[string]interface{}{
		"myGuild":      nil,
		"memberList":   []interface{}{},
		"guildRank":    []interface{}{},
		"applyList":    []interface{}{},
		"skillDevData": map[string]interface{}{},
	}
}

func (h *Handler) buildGuildPanelResponse(ctx context.Context, characterID int64) (map[string]interface{}, *domainguild.Guild, *domainguild.GuildMember, error) {
	response := emptyGuildPanelResponse()
	if h.guildService == nil {
		return response, nil, nil, nil
	}

	guildItem, selfMember, err := h.guildService.GetGuildByMemberForClient(ctx, characterID)
	if err != nil {
		return nil, nil, nil, err
	}

	if guildItem == nil {
		application, pendingGuild, pendingErr := h.guildService.GetPendingApplicationByCharacterID(ctx, characterID)
		if pendingErr != nil {
			return nil, nil, nil, pendingErr
		}
		if application == nil || pendingGuild == nil {
			return response, nil, nil, nil
		}

		application.Online = h.isCharacterOnline(application.CharacterID)
		response["myGuild"] = h.guildDTO(pendingGuild)
		response["memberList"] = []interface{}{application.ToDTO()}
		response["guildRank"] = pendingGuild.RankSettings
		response["applyList"] = []interface{}{}
		response["skillDevData"] = h.filteredSkillDevData(pendingGuild.SkillDevData)
		return response, pendingGuild, nil, nil
	}

	response["myGuild"] = h.guildDTO(guildItem)
	response["memberList"] = h.memberListDTO(guildItem.Members)
	response["guildRank"] = guildItem.RankSettings
	response["applyList"] = h.applicationListDTO(guildItem.Applications)
	response["skillDevData"] = h.filteredSkillDevData(guildItem.SkillDevData)

	return response, guildItem, selfMember, nil
}

func (h *Handler) guildDTO(guildItem *domainguild.Guild) map[string]interface{} {
	if guildItem == nil {
		return nil
	}

	dto := guildItem.ToDTO()
	dto["ln"] = h.findLeaderName(guildItem)
	return dto
}

func (h *Handler) guildInfoUpdateDTO(guildItem *domainguild.Guild, updateType int) map[string]interface{} {
	if guildItem == nil {
		return nil
	}

	leaderName := h.findLeaderName(guildItem)
	guildInfo := guildItem.Description
	if guildItem.Announcement != "" {
		guildInfo = guildItem.Announcement
	}

	return map[string]interface{}{
		"id":           guildItem.ID,
		"name":         guildItem.Name,
		"cid":          guildItem.LeaderID,
		"ln":           leaderName,
		"level":        guildItem.Level,
		"exp":          guildItem.Experience,
		"memberNumber": guildItem.Population,
		"memLimit":     guildItem.MaxPopulation,
		"bagSlotNum":   guildItem.BankPageCount,
		"money":        guildItem.Funds,
		"guildInfo":    guildInfo,
		"updateType":   updateType,
		"daliyCost":    0,
		"dailyProduce": 0,
		"moneyLimit":   0,
		"timeStamp":    nil,
	}
}

func (h *Handler) memberListDTO(members []*domainguild.GuildMember) []interface{} {
	list := make([]interface{}, 0, len(members))
	for _, member := range members {
		if member == nil {
			continue
		}
		member.Online = h.isCharacterOnline(member.CharacterID)
		list = append(list, member.ToDTO())
	}
	return list
}

func (h *Handler) applicationListDTO(applications []*domainguild.GuildApplication) []interface{} {
	list := make([]interface{}, 0, len(applications))
	for _, application := range applications {
		if application == nil {
			continue
		}
		application.Online = h.isCharacterOnline(application.CharacterID)
		list = append(list, application.ToDTO())
	}
	return list
}

func (h *Handler) memberDTO(member *domainguild.GuildMember) map[string]interface{} {
	if member == nil {
		return nil
	}
	member.Online = h.isCharacterOnline(member.CharacterID)
	return member.ToDTO()
}

func (h *Handler) applicationDTO(application *domainguild.GuildApplication) map[string]interface{} {
	if application == nil {
		return nil
	}
	application.Online = h.isCharacterOnline(application.CharacterID)
	return application.ToDTO()
}

func (h *Handler) isCharacterOnline(characterID int64) bool {
	if h.rtmpServer == nil {
		return false
	}
	return h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(characterID, 10)) != nil
}

func (h *Handler) findLeaderName(guildItem *domainguild.Guild) string {
	if guildItem == nil {
		return ""
	}
	for _, member := range guildItem.Members {
		if member != nil && member.Rank == domainguild.RankLeader {
			return member.CharacterName
		}
	}
	return ""
}

func (h *Handler) filteredSkillDevData(skillDevData map[string]interface{}) map[string]interface{} {
	if skillDevData == nil {
		return map[string]interface{}{}
	}
	if h.gameData == nil {
		return skillDevData
	}

	type entry struct {
		skillID int
		level   int
	}

	byCodeName := map[string]entry{}
	for key := range skillDevData {
		skillID, err := strconv.Atoi(key)
		if err != nil {
			continue
		}
		skill := h.gameData.GetSkill(skillID)
		if skill == nil {
			continue
		}
		current, exists := byCodeName[skill.CodeName]
		level := int(skill.Level)
		if !exists || level > current.level {
			byCodeName[skill.CodeName] = entry{skillID: skillID, level: level}
		}
	}

	filtered := map[string]interface{}{}
	for _, item := range byCodeName {
		filtered[strconv.Itoa(item.skillID)] = 1
	}
	return filtered
}

func (h *Handler) sendToCharacter(characterID int64, method string, args ...interface{}) {
	if h.rtmpServer == nil {
		return
	}
	conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(characterID, 10))
	if conn == nil {
		return
	}
	_ = conn.SendCallback(method, args...)
}

func int64Ptr(v int64) *int64 {
	return &v
}

func sameGuildID(left *int64, right *int64) bool {
	if left == nil || right == nil {
		return left == nil && right == nil
	}
	return *left == *right
}

func (h *Handler) syncCharacterGuildMembership(ctx context.Context, characterID int64, guildID *int64) {
	if h.charService == nil {
		return
	}
	char, err := h.charService.GetByID(ctx, characterID)
	if err != nil {
		h.logger.Warn("syncCharacterGuildMembership: failed to load character",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return
	}
	if char == nil {
		return
	}
	if sameGuildID(char.GuildID, guildID) {
		return
	}
	char.GuildID = guildID
	if err := h.charService.Update(ctx, char); err != nil {
		h.logger.Warn("syncCharacterGuildMembership: failed to persist character guild state",
			zap.Int64("character_id", characterID),
			zap.Error(err))
	}
}

func (h *Handler) sendContributionState(characterID int64, message string) {
	if h.charService == nil {
		return
	}
	char, err := h.charService.GetByID(context.Background(), characterID)
	if err != nil || char == nil {
		return
	}
	h.sendToCharacter(characterID, "onUPP", map[string]interface{}{
		"guildContrib":  char.GuildContrib,
		"donateContrib": char.DonateContrib,
	})
	if message != "" {
		h.sendToCharacter(characterID, "a", message)
	}
}

func (h *Handler) broadcastGuild(guildItem *domainguild.Guild, method string, args ...interface{}) {
	if h.rtmpServer == nil || guildItem == nil {
		return
	}
	for _, member := range guildItem.Members {
		if member == nil {
			continue
		}
		conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(member.CharacterID, 10))
		if conn == nil {
			continue
		}
		_ = conn.SendCallback(method, args...)
	}
}

func guildError(err error) error {
	if err == nil {
		return nil
	}
	for _, target := range []error{
		appguild.ErrGuildNotFound,
		appguild.ErrGuildNameTaken,
		appguild.ErrAlreadyInGuild,
		appguild.ErrNotInGuild,
		appguild.ErrNotGuildLeader,
		appguild.ErrCannotKickLeader,
		appguild.ErrGuildFull,
		appguild.ErrInsufficientFunds,
	} {
		if errors.Is(err, target) {
			return target
		}
	}
	if errors.Is(err, pkgerrors.ErrUnauthorized) || errors.Is(err, pkgerrors.ErrInvalidInput) || errors.Is(err, pkgerrors.ErrInvalidArgs) {
		return err
	}
	return pkgerrors.ErrSystemError
}
