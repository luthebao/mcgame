// Open-sourced by BaoLT

// Item handler core: struct, constructor, registration, and shared helpers.
package item

import (
	"context"
	"fmt"
	"math"
	"strconv"
	"sync"

	appbuff "mcgame-server/internal/application/buff"
	appchar "mcgame-server/internal/application/character"
	appgroup "mcgame-server/internal/application/group"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appquest "mcgame-server/internal/application/quest"
	appscene "mcgame-server/internal/application/scene"
	appskill "mcgame-server/internal/application/skill"
	domainauth "mcgame-server/internal/domain/auth"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/creature"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type pendingGiftBox struct {
	ItemID  int64
	SlotSID int
	Choices []*appitem.GiftBoxChoice
	GetNum  int
}

type MWSkillGranter interface {
	GrantOnEquip(ctx context.Context, charID int64, equip *domainitem.Item) error
	RevokeOnUnequip(ctx context.Context, charID int64, equip *domainitem.Item) error
}

type Handler struct {
	itemService             *appitem.Service
	sceneService            *appscene.Service
	charService             *appchar.Service
	groupService            *appgroup.Service
	petService              *apppet.Service
	questService            *appquest.Service
	skillService            *appskill.Service
	buffService             *appbuff.Service
	accountRepo             domainauth.AccountRepository
	settingsRepo            character.InterfaceSettingsRepository
	sceneManager            *rtmp.SceneManager
	rtmpServer              *rtmp.Server
	presenceStore           *redisstore.SocialPresenceStore
	gameData                *gamedata.Manager
	logger                  *zap.Logger
	broadcastToAllFn        func(method string, data interface{})
	sendCallbackFn          func(conn *rtmp.Connection, method string, args ...interface{}) error
	lookupConnFn            func(characterID string) *rtmp.Connection
	pendingPrefixChanges    map[int64]*pendingChangePrefix
	pendingPrefixChangesMu  sync.Mutex
	pendingChangeSouls      map[int64]*pendingChangeSoul
	pendingChangeSoulsMu    sync.Mutex
	pendingChangeElements   map[int64]*pendingChangeElement
	pendingChangeElementsMu sync.Mutex
	pendingChangeBinds      map[int64]*pendingChangeBind
	pendingChangeBindsMu    sync.Mutex
	pendingGiftBoxes        map[int64]*pendingGiftBox
	pendingGiftBoxesMu      sync.Mutex
	groupStateRefresher     func(ctx context.Context, groupID int64)
	groupPersonalLeave      func(ctx context.Context, charID int64)
	mwSkillGranter          MWSkillGranter
	mwSkillUpdatePusher     func(ctx context.Context, conn *rtmp.Connection, charID int64)
}

const flyerEquipmentPosition = 14

func NewHandler(itemService *appitem.Service, sceneService *appscene.Service, charService *appchar.Service, sceneManager *rtmp.SceneManager, gameData *gamedata.Manager, logger *zap.Logger) *Handler {
	return &Handler{
		itemService:  itemService,
		sceneService: sceneService,
		charService:  charService,
		sceneManager: sceneManager,
		gameData:     gameData,
		logger:       logger,
		sendCallbackFn: func(conn *rtmp.Connection, method string, args ...interface{}) error {
			return conn.SendCallback(method, args...)
		},
		pendingPrefixChanges:  make(map[int64]*pendingChangePrefix),
		pendingChangeSouls:    make(map[int64]*pendingChangeSoul),
		pendingChangeElements: make(map[int64]*pendingChangeElement),
		pendingChangeBinds:    make(map[int64]*pendingChangeBind),
		pendingGiftBoxes:      make(map[int64]*pendingGiftBox),
	}
}

func (h *Handler) SetAccountRepository(accountRepo domainauth.AccountRepository) {
	h.accountRepo = accountRepo
}

func (h *Handler) SetInterfaceSettingsRepository(repo character.InterfaceSettingsRepository) {
	h.settingsRepo = repo
}

func (h *Handler) SetSkillService(skillService *appskill.Service) {
	h.skillService = skillService
}

func (h *Handler) SetBuffService(buffService *appbuff.Service) {
	h.buffService = buffService
}

func (h *Handler) SetGroupService(groupService *appgroup.Service) {
	h.groupService = groupService
}

func (h *Handler) SetQuestService(questService *appquest.Service) {
	h.questService = questService
}

func (h *Handler) SetGroupStateRefresher(fn func(ctx context.Context, groupID int64)) {
	h.groupStateRefresher = fn
}

func (h *Handler) SetGroupPersonalLeaveHandler(fn func(ctx context.Context, charID int64)) {
	h.groupPersonalLeave = fn
}

func (h *Handler) SetMWSkillGranter(g MWSkillGranter) {
	h.mwSkillGranter = g
}

func (h *Handler) SetMWSkillUpdatePusher(fn func(ctx context.Context, conn *rtmp.Connection, charID int64)) {
	h.mwSkillUpdatePusher = fn
}

func (h *Handler) SetPetService(petService *apppet.Service) {
	h.petService = petService
}

func (h *Handler) SetRTMPServer(server *rtmp.Server) {
	h.rtmpServer = server
	if server == nil {
		h.broadcastToAllFn = nil
		h.lookupConnFn = nil
		return
	}
	h.broadcastToAllFn = server.BroadcastToAll
	h.lookupConnFn = func(characterID string) *rtmp.Connection {
		return server.GetConnectionByCharacterID(characterID)
	}
}

func (h *Handler) SetPresenceStore(store *redisstore.SocialPresenceStore) {
	h.presenceStore = store
}

func (h *Handler) sendSceneResetCallbacks(conn *rtmp.Connection) error {
	if err := h.sendCallback(conn, "onCreateNpcs", map[string]interface{}{}); err != nil {
		return err
	}
	return h.sendCallback(conn, "onCreateBoss", map[string]interface{}{})
}

func (h *Handler) sendCallback(conn *rtmp.Connection, method string, args ...interface{}) error {
	if h.sendCallbackFn != nil {
		return h.sendCallbackFn(conn, method, args...)
	}
	return conn.SendCallback(method, args...)
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getInitSlot", h.GetInitSlot)
	dispatcher.Register("equipOn", h.EquipOn)
	dispatcher.Register("equipOff", h.EquipOff)
	dispatcher.Register("useItem", h.UseItem)
	dispatcher.Register("useItemGold", h.UseItemGold)
	dispatcher.Register("useTransport", h.UseTransport)
	dispatcher.Register("useTransportGroup", h.UseTransportGroup)
	dispatcher.Register("moveItem", h.MoveItem)
	dispatcher.Register("moveItemNum", h.MoveItemNum)
	dispatcher.Register("dropItem", h.DropItem)
	dispatcher.Register("bagSort", h.BagSort)
	dispatcher.Register("repair", h.Repair)
	dispatcher.Register("repairAll", h.RepairAll)
	dispatcher.Register("isEquSid", h.IsEquSid)
	dispatcher.Register("moveItemToPage", h.MoveItemToPage)
	dispatcher.Register("useMultiItem", h.UseMultiItem)
	dispatcher.Register("itemToTarget", h.ItemToTarget)
	dispatcher.Register("setDressHide", h.SetDressHide)
	dispatcher.Register("checkEquipEdit", h.CheckEquipEdit)
	dispatcher.Register("checkLimitWingEffect", h.CheckLimitWingEffect)
	dispatcher.Register("getTBag", h.GetTBag)
	dispatcher.Register("openTempSlot", h.OpenTempSlot)
	dispatcher.Register("openmxTempSlot", h.MxOpenSlot)
	dispatcher.Register("mxBagSort", h.MxBagSort)
	dispatcher.Register("tempBagSort", h.TempBagSort)
	dispatcher.Register("oneKeyOpenAllMXTemp", h.OneKeyOpenAllMXTemp)
	dispatcher.Register("addtItemFromBag", h.MoveItem)
	dispatcher.Register("addmxFromBag", h.MoveItem)
	dispatcher.Register("bindItem", h.BindItem)
	dispatcher.Register("changeName", h.ChangeName)
	dispatcher.Register("changePrefix", h.ChangePrefix)
	dispatcher.Register("sureChangePrefix", h.SureChangePrefix)
	dispatcher.Register("newMake", h.NewMake)
	dispatcher.Register("getMakeColor", h.GetMakeColor)
	dispatcher.Register("materialMixOne", h.MaterialMixOne)
	dispatcher.Register("materialMixAll", h.MaterialMixAll)
	dispatcher.Register("jewelUpdateOne", h.JewelUpdateOne)
	dispatcher.Register("jewelUpdateAll", h.JewelUpdateAll)
	dispatcher.Register("changeSoul", h.ChangeSoul)
	dispatcher.Register("sureChangeSoul", h.SureChangeSoul)
	dispatcher.Register("changeElement", h.ChangeElement)
	dispatcher.Register("sureChangeElement", h.SureChangeElement)
	dispatcher.Register("changeBind", h.ChangeBind)
	dispatcher.Register("sureChangeBind", h.SureChangeBind)
	dispatcher.Register("changeLevel", h.ChangeLevel)
	dispatcher.Register("fullHpRecoverByItem", h.FullHpRecoverByItem)
	dispatcher.Register("fullMpRecoverByItem", h.FullMpRecoverByItem)
	dispatcher.Register("getHoleNum", h.GetHoleNum)
	dispatcher.Register("holeDig", h.HoleDig)
	dispatcher.Register("getJewelData", h.GetJewelData)
	dispatcher.Register("jewelSet", h.JewelSet)
	dispatcher.Register("jewelDel", h.JewelDel)
	dispatcher.Register("equResolve", h.EquResolve)
	dispatcher.Register("starOne", h.StarOne)
	dispatcher.Register("starAll", h.StarAll)
	dispatcher.Register("getStarNum", h.GetStarNum)
	dispatcher.Register("selMultiItemByIdx", h.SelMultiItemByIdx)
	dispatcher.Register("changeNameByCard", h.ChangeNameByCard)
	dispatcher.Register("changeCharSex", h.ChangeCharSex)
	dispatcher.Register("useGoodCard", h.UseGoodCard)
	dispatcher.Register("useWeddingBag", h.UseWeddingBag)
	dispatcher.Register("useRedBag", h.UseRedBag)
	dispatcher.Register("useIntimacyItem", h.UseIntimacyItem)
	dispatcher.Register("useSeek", h.UseSeek)
	dispatcher.Register("useTrack", h.UseTrack)
	dispatcher.Register("useRadar", h.UseRadar)
	dispatcher.Register("addPopNum", h.AddPopNum)
	dispatcher.Register("delPopNum", h.DelPopNum)
	dispatcher.Register("useFootle", h.UseFootle)
	dispatcher.Register("useAntiFootle", h.UseAntiFootle)
	dispatcher.Register("useSnowBall", h.UseSnowBall)
	dispatcher.Register("useHalloweenCard", h.UseHalloweenCard)
	dispatcher.Register("useFestFootle", h.UseFestFootle)
	dispatcher.Register("initLearnedSkill", h.InitLearnedSkill)
	dispatcher.Register("newCook", h.NewCook)
	dispatcher.Register("newMedicine", h.NewMedicine)
	dispatcher.Register("closeBank", h.CloseBank)
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
		if math.IsNaN(float64(v)) || math.IsInf(float64(v), 0) {
			return 0, false
		}
		return int64(v), true
	case int:
		return int64(v), true
	case int8:
		return int64(v), true
	case int16:
		return int64(v), true
	case int32:
		return int64(v), true
	case int64:
		return v, true
	case uint:
		return int64(v), true
	case uint8:
		return int64(v), true
	case uint16:
		return int64(v), true
	case uint32:
		return int64(v), true
	case uint64:
		if v > math.MaxInt64 {
			return 0, false
		}
		return int64(v), true
	case string:
		n, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	default:
		return 0, false
	}
}

func (h *Handler) getCharacterViewProps(ctx context.Context, char *character.Character) map[string]interface{} {
	if char == nil {
		return map[string]interface{}{}
	}
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx, char)
		h.itemService.ApplyCharacterMakerSetState(ctx, char)
	}
	if h.charService == nil {
		return char.ToDTO()
	}
	var bonuses character.EquipmentStatBonuses
	if h.itemService != nil {
		bonuses = h.itemService.AggregateEquipmentStats(ctx, char.ID)
	}
	return h.charService.BuildViewPropertiesWithEquipment(char, bonuses)
}

func (h *Handler) sendStatUpdate(ctx *rtmp.RPCContext, char *character.Character) {
	if ctx == nil || ctx.Connection == nil || char == nil || h.itemService == nil {
		return
	}
	props := h.getCharacterViewProps(ctx.Context, char)
	ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"property": props,
	})
}

func (h *Handler) sendCharacterElementUpdate(ctx *rtmp.RPCContext, char *character.Character) {
	if ctx == nil || ctx.Connection == nil || char == nil {
		return
	}

	ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"ee": char.Ee,
		"en": char.En,
		"ef": char.Ef,
	})
}

func (h *Handler) getFlyerOnPayload(templateID int, characterID int64) map[string]interface{} {
	if h.itemService == nil {
		return nil
	}

	tpl := h.itemService.GetEquipmentTemplate(templateID)
	if tpl == nil || int(tpl.Position) != flyerEquipmentPosition {
		return nil
	}

	resCode := fmt.Sprintf("%.0f", tpl.ResCode)
	if resCode == "" || resCode == "0" {
		return nil
	}

	return map[string]interface{}{
		"cid":     characterID,
		"resCode": resCode,
		"wavCode": fmt.Sprintf("%.0f", tpl.WavCode),
	}
}

func (h *Handler) sendFlyerOnIfNeeded(conn *rtmp.Connection, templateID int, characterID int64) {
	if conn == nil {
		return
	}

	payload := h.getFlyerOnPayload(templateID, characterID)
	if payload == nil {
		return
	}

	_ = conn.SendCallback("onFlyerOn", payload)
}

func (h *Handler) checkBagCapacityWarning(ctx *rtmp.RPCContext, charID int64) {
	remaining, err := h.itemService.GetBagRemainingSlots(ctx.Context, charID)
	if err != nil {
		return
	}
	if remaining <= appitem.BagLowSlotThreshold {
		_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Túi đồ còn %d ô trống!", remaining))
	}
}

func (h *Handler) sendInventoryUpdate(ctx *rtmp.RPCContext, characterID int64) {
	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to get items for update", zap.Error(err))
		return
	}

	result := make(map[string]interface{})
	for _, it := range items {
		idStr := fmt.Sprintf("%d", it.ID)
		result[idStr] = h.itemDTO(it)
	}
	ctx.Connection.SendCallback("onInitSlot", result)
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

func (h *Handler) itemDTOList(items []*domainitem.Item) []map[string]interface{} {
	if len(items) == 0 {
		return []map[string]interface{}{}
	}
	if h.itemService != nil {
		return h.itemService.BuildClientItemDTOList(items)
	}
	dtos := make([]map[string]interface{}, len(items))
	for index, it := range items {
		dtos[index] = h.itemDTO(it)
	}
	return dtos
}

func charHasMoney(char *character.Character, cost int64) bool {
	if char == nil {
		return false
	}
	if char.SelectedMoneyType == 2 {
		return char.Money >= cost
	}
	return char.MoneyBind >= cost
}

func charDeductMoney(char *character.Character, cost int64) {
	if char.SelectedMoneyType == 2 {
		char.Money -= cost
	} else {
		char.MoneyBind -= cost
	}
}

func charMoneyUpdatePayload(char *character.Character) map[string]interface{} {
	if char.SelectedMoneyType == 2 {
		return map[string]interface{}{"money": char.Money}
	}
	return map[string]interface{}{"moneyBind": char.MoneyBind}
}

func charHasGold(char *character.Character, cost int64) bool {
	if char == nil {
		return false
	}
	if char.SelectedGoldType == 4 {
		return char.Gold >= cost
	}
	return char.GoldBind >= cost
}

func charDeductGold(char *character.Character, cost int64) {
	if char.SelectedGoldType == 4 {
		char.Gold -= cost
	} else {
		char.GoldBind -= cost
	}
}

func charGoldUpdatePayload(char *character.Character) map[string]interface{} {
	if char.SelectedGoldType == 4 {
		return map[string]interface{}{"gold": char.Gold}
	}
	return map[string]interface{}{"goldBind": char.GoldBind}
}

func (h *Handler) getMockEquipmentItems(characterID int64) []map[string]interface{} {
	makeEquip := func(id int64, templateID int, slotIndex int, durability int, colorCode int) map[string]interface{} {
		sid := 1 + slotIndex
		return map[string]interface{}{
			"id":            id,
			"sid":           sid,
			"type":          19,
			"itemId":        templateID,
			"stackNum":      1,
			"tplId":         templateID,
			"itemType":      2,
			"slotType":      1,
			"slotIndex":     slotIndex,
			"stackCount":    1,
			"isBound":       false,
			"durability":    durability,
			"maxDurability": durability,
			"enchantLv":     0,
			"starLv":        0,
			"colorCode":     colorCode,
		}
	}

	return []map[string]interface{}{
		makeEquip(1001, 2001, 0, 100, 1),
		makeEquip(1002, 2002, 2, 80, 2),
		makeEquip(1003, 2003, 3, 90, 2),
		makeEquip(1004, 2004, 4, 75, 1),
		makeEquip(1005, 2005, 5, 75, 1),
		makeEquip(1006, 2006, 6, 100, 3),
		makeEquip(1007, 2007, 7, 100, 3),
		makeEquip(1008, 2008, 8, 100, 3),
	}
}

func (h *Handler) getMockBagItems(characterID int64) []map[string]interface{} {
	makeBagItem := func(id int64, templateID int, itemType int, slotIndex int, stackCount int, colorCode int) map[string]interface{} {
		sid := 2100 + slotIndex + 1
		return map[string]interface{}{
			"id":         id,
			"sid":        sid,
			"giid":       templateID,
			"type":       int(creature.TypeItemTemplate),
			"itemId":     templateID,
			"stackNum":   stackCount,
			"tplId":      templateID,
			"itemType":   itemType,
			"slotType":   0,
			"slotIndex":  slotIndex,
			"stackCount": stackCount,
			"isBound":    false,
			"enchantLv":  0,
			"starLv":     0,
			"colorCode":  colorCode,
		}
	}

	makeBagEquip := func(id int64, templateID int, slotIndex int, durability int, maxDurability int, enchantLv int, starLv int, colorCode int) map[string]interface{} {
		sid := 2100 + slotIndex + 1
		return map[string]interface{}{
			"id":            id,
			"sid":           sid,
			"type":          int(creature.TypeEquiptTemplate),
			"itemId":        templateID,
			"stackNum":      1,
			"tplId":         templateID,
			"itemType":      2,
			"slotType":      0,
			"slotIndex":     slotIndex,
			"stackCount":    1,
			"isBound":       false,
			"durability":    durability,
			"maxDurability": maxDurability,
			"enchantLv":     enchantLv,
			"starLv":        starLv,
			"colorCode":     colorCode,
		}
	}

	return []map[string]interface{}{
		makeBagItem(2001, 719, 1, 0, 50, 1),
		makeBagItem(2002, 720, 1, 1, 30, 1),
		makeBagItem(2003, 1036, 1, 2, 10, 2),
		makeBagItem(2008, 961, 1, 7, 5, 2),
		makeBagItem(2009, 2126, 1, 8, 1, 3),
		makeBagEquip(2004, 2102, 3, 70, 70, 1, 0, 2),
		makeBagEquip(2005, 1102, 4, 90, 100, 2, 1, 3),
		makeBagItem(2006, 8001, 3, 5, 99, 1),
		makeBagItem(2010, 8002, 3, 9, 25, 2),
		makeBagItem(2007, 9001, 4, 6, 1, 0),
	}
}
