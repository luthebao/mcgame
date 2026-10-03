// Open-sourced by BaoLT

package magicweapon

import (
	"context"
	"math"
	"strconv"

	appchar "mcgame-server/internal/application/character"
	appitem "mcgame-server/internal/application/item"
	appmw "mcgame-server/internal/application/magicweapon"
	appskill "mcgame-server/internal/application/skill"
	domainauth "mcgame-server/internal/domain/auth"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

type Handler struct {
	mwService    *appmw.Service
	itemService  *appitem.Service
	charService  *appchar.Service
	skillService *appskill.Service
	accountRepo  domainauth.AccountRepository
	gameData     *gamedata.Manager
	logger       *zap.Logger
}

func NewHandler(mwService *appmw.Service, itemService *appitem.Service, charService *appchar.Service, gameData *gamedata.Manager, logger *zap.Logger) *Handler {
	return &Handler{
		mwService:   mwService,
		itemService: itemService,
		charService: charService,
		gameData:    gameData,
		logger:      logger,
	}
}

func (h *Handler) SetSkillService(s *appskill.Service) {
	h.skillService = s
}

func (h *Handler) SetAccountRepository(repo domainauth.AccountRepository) {
	h.accountRepo = repo
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("mWeaponUpgrade", h.MWeaponUpgrade)
	dispatcher.Register("getSpiritRequire", h.GetSpiritRequire)
	dispatcher.Register("magicWeaponRepair", h.MagicWeaponRepair)
	dispatcher.Register("magicWeaponAllRepair", h.MagicWeaponAllRepair)
	dispatcher.Register("getMWSkills", h.GetMWSkills)
	dispatcher.Register("magicWeaponResetSkill", h.MagicWeaponResetSkill)
	dispatcher.Register("magicWeaponStage", h.MagicWeaponStage)
	dispatcher.Register("magicWeaponResetProp", h.MagicWeaponResetProp)
	dispatcher.Register("applyMWResetProp", h.ApplyMWResetProp)
	dispatcher.Register("queryMWResetPropMax", h.QueryMWResetPropMax)
	dispatcher.Register("magicWeaponResolve", h.MagicWeaponResolve)
	dispatcher.Register("MWTrans", h.MWTrans)
	dispatcher.Register("showMWInfo", h.ShowMWInfo)
	dispatcher.Register("succinctMW", h.SucinctMW)
	dispatcher.Register("onSureSuccinctMW", h.OnSureSuccinctMW)
	dispatcher.Register("succinctMWByVip", h.SucinctMWByVip)
	dispatcher.Register("activateMWPro", h.ActivateMWPro)
}

func parseFlexibleInt64(arg interface{}) (int64, bool) {
	if arg == nil {
		return 0, false
	}
	switch v := arg.(type) {
	case float64:
		if math.IsNaN(v) || math.IsInf(v, 0) {
			return 0, false
		}
		return int64(v), true
	case float32:
		return int64(v), true
	case int:
		return int64(v), true
	case int32:
		return int64(v), true
	case int64:
		return v, true
	case string:
		n, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}

func (h *Handler) characterID(ctx *rtmp.RPCContext) (int64, bool) {
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}

func (h *Handler) itemDTO(it *domainitem.Item) map[string]interface{} {
	if it == nil {
		return map[string]interface{}{}
	}
	if h.itemService != nil {
		return h.itemService.BuildClientItemDTO(it)
	}
	return it.ToDTO()
}

func (h *Handler) refreshStats(ctx *rtmp.RPCContext, char *character.Character) {
	if char == nil || h.itemService == nil {
		return
	}
	utils.SendStatRefreshUPP(ctx, h.itemService, char)
}

func (h *Handler) reloadChar(ctx context.Context, charID int64) *character.Character {
	if h.charService == nil {
		return nil
	}
	c, _ := h.charService.GetByID(ctx, charID)
	return c
}

func (h *Handler) pushItemUpdate(ctx *rtmp.RPCContext, it *domainitem.Item) {
	if it == nil || ctx == nil || ctx.Connection == nil {
		return
	}
	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(it))
}

func (h *Handler) pushItemDelete(ctx *rtmp.RPCContext, sid int) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	ctx.Connection.SendCallback("onDelCharactorSlot", float64(sid))
}

func (h *Handler) finalizeItemMutation(ctx *rtmp.RPCContext, charID int64, item *domainitem.Item, wasEquipped bool) {
	if item != nil {
		h.pushItemUpdate(ctx, item)
	}
	if wasEquipped {
		if char := h.reloadChar(ctx.Context, charID); char != nil {
			h.refreshStats(ctx, char)
		}
	}
}

func (h *Handler) pushMWSkillUpdate(ctx *rtmp.RPCContext, charID int64) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	skills := []map[string]interface{}{}
	if h.skillService != nil {
		built, err := h.skillService.GetSkillsForCallback(ctx.Context, charID)
		if err == nil {
			skills = built
		}
	}
	ctx.Connection.SendCallback("onMWeaponSkillUpdate", skills, true)
}
