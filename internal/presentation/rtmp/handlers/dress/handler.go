// Open-sourced by BaoLT

// Dress Panel handler package.
// Bridges client RPCs (DressPanel.as / DressDisplay.as / RecipeItem.as) to the
// dress application service. Handles AMF0 argument coercion and shapes
// responses to match the Flash client's expected fields.
package dress

import (
	"context"
	"errors"
	"math"
	"strconv"

	"go.uber.org/zap"

	appdress "mcgame-server/internal/application/dress"
	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"

	amf0 "github.com/yutopp/go-amf0"
)

type characterReader interface {
	GetCharacter(ctx context.Context, characterID int64) (*domainchar.Character, error)
	GetAppearanceCodesByClassAndGender(classID, gender int) (string, string, string, string)
}

type itemService interface {
	BuildCharacterAppearance(ctx context.Context, charID int64, gender int) appitem.CharacterAppearance
	ApplyDressStateToAppearance(appearance appitem.CharacterAppearance, gender int, dressInfo string, dressHidden bool) appitem.CharacterAppearance
	AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error)
	AddItemWithBindAndColor(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool, colorCode int) (*domainitem.Item, error)
	AggregateEquipmentStats(ctx context.Context, charID int64) domainchar.EquipmentStatBonuses
	BuildClientItemDTO(it *domainitem.Item) map[string]interface{}
	GetEquipmentTemplate(templateID int) *models.EquiptTemplateTemplate
	ResolveCharacterResCode(ctx context.Context, char *domainchar.Character) int64
	ResolveCharacterFlyerAppearance(ctx context.Context, char *domainchar.Character) (int64, int64, bool)
}

type Handler struct {
	service         *appdress.Service
	decoHoleService *appdress.DecoHoleService
	characters      characterReader
	itemService     itemService
	sceneManager    *rtmp.SceneManager
	logger          *zap.Logger
}

func NewHandler(service *appdress.Service, characters characterReader, itemService itemService, sceneManager *rtmp.SceneManager, logger *zap.Logger) *Handler {
	return &Handler{
		service:      service,
		characters:   characters,
		itemService:  itemService,
		sceneManager: sceneManager,
		logger:       logger,
	}
}

func (h *Handler) SetDecoHoleService(svc *appdress.DecoHoleService) {
	h.decoHoleService = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("checkSameDay", h.CheckSameDay)
	dispatcher.Register("activeDress", h.ActiveDress)
	dispatcher.Register("ensureBuyActive", h.EnsureBuyActive)
	dispatcher.Register("recieveGoods", h.RecieveGoods)
	dispatcher.Register("freeExtractRecipe", h.FreeExtractRecipe)
	dispatcher.Register("goldExtractRecipe", h.GoldExtractRecipe)
	dispatcher.Register("tenExtractRecipe", h.TenExtractRecipe)
	dispatcher.Register("ssdExtractRecipe", h.SsdExtractRecipe)
	dispatcher.Register("largessdExtractRecipe", h.LargeSsdExtractRecipe)
	dispatcher.Register("makeAllChips", h.MakeAllChips)
	dispatcher.Register("transformRecipe", h.TransformRecipe)
	dispatcher.Register("transformAllRecipe", h.TransformAllRecipe)
	dispatcher.Register("exchangeRecipe", h.ExchangeRecipe)
	dispatcher.Register("setFakeDress", h.SetFakeDress)
	dispatcher.Register("unsetFakeDress", h.UnsetFakeDress)
	dispatcher.Register("setFakeFlyerDress", h.SetFakeFlyerDress)
	dispatcher.Register("unsetFakeFlyerDress", h.UnsetFakeFlyerDress)
	dispatcher.Register("getDecoSuitProp", h.GetDecoSuitProp)
	dispatcher.Register("addDecoHoleLevel", h.AddDecoHoleLevel)
}

func (h *Handler) characterID(ctx *rtmp.RPCContext) (int64, bool) {
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Warn("dress: invalid character id", zap.String("character_id", ctx.CharacterID), zap.Error(err))
		return 0, false
	}
	return id, true
}

func toInt64(v interface{}) (int64, bool) {
	switch x := v.(type) {
	case nil:
		return 0, false
	case float64:
		if math.IsNaN(x) || math.IsInf(x, 0) {
			return 0, false
		}
		return int64(x), true
	case float32:
		return int64(x), true
	case int:
		return int64(x), true
	case int32:
		return int64(x), true
	case int64:
		return x, true
	case uint:
		return int64(x), true
	case string:
		n, err := strconv.ParseInt(x, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	default:
		return 0, false
	}
}

func toBool(v interface{}) bool {
	switch x := v.(type) {
	case bool:
		return x
	case float64:
		return x != 0
	case int:
		return x != 0
	case string:
		return x == "true" || x == "1"
	default:
		return false
	}
}

func toIDArray(v interface{}) []int64 {
	if v == nil {
		return nil
	}
	switch arr := v.(type) {
	case []interface{}:
		out := make([]int64, 0, len(arr))
		for _, it := range arr {
			if id, ok := toInt64(it); ok {
				out = append(out, id)
			}
		}
		return out
	case amf0.ECMAArray:
		return indexedIDArray(map[string]interface{}(arr))
	case map[string]interface{}:
		return indexedIDArray(arr)
	}
	return nil
}

func indexedIDArray(values map[string]interface{}) []int64 {
	maxIdx := 0
	for key := range values {
		if idx, err := strconv.Atoi(key); err == nil && idx >= maxIdx {
			maxIdx = idx + 1
		}
	}

	out := make([]int64, 0, maxIdx)
	for idx := 0; idx < maxIdx; idx++ {
		val, ok := values[strconv.Itoa(idx)]
		if !ok {
			continue
		}
		if id, ok := toInt64(val); ok {
			out = append(out, id)
		}
	}
	return out
}

func emptyDressInfoString(ctx context.Context) string {
	_ = ctx
	return "{}"
}

func (h *Handler) handleServiceError(method string, charID int64, err error) (interface{}, error) {
	if err == nil {
		return nil, nil
	}
	if isClientFault(err) {
		h.logger.Debug("dress: client error", zap.String("method", method), zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}
	h.logger.Error("dress: service error", zap.String("method", method), zap.Int64("character_id", charID), zap.Error(err))
	return nil, nil
}

func isClientFault(err error) bool {
	switch {
	case errors.Is(err, appdress.ErrFreeExtractExhausted),
		errors.Is(err, appdress.ErrInsufficientGold),
		errors.Is(err, appdress.ErrInsufficientFashion),
		errors.Is(err, appdress.ErrInsufficientMaterial),
		errors.Is(err, appdress.ErrInsufficientScore),
		errors.Is(err, appdress.ErrInsufficientRecipes),
		errors.Is(err, appdress.ErrInvalidDress),
		errors.Is(err, appdress.ErrInvalidRecipe),
		errors.Is(err, appdress.ErrAlreadyClaimed),
		errors.Is(err, appdress.ErrNotActivated),
		errors.Is(err, appdress.ErrAlreadyActivated),
		errors.Is(err, appdress.ErrNoRecipePool):
		return true
	}
	return false
}

func (h *Handler) sendAppearanceCallbackToSelfAndScene(ctx *rtmp.RPCContext, method string, payload map[string]interface{}) {
	if h == nil || ctx == nil || ctx.Connection == nil {
		return
	}

	_ = ctx.Connection.SendCallback(method, payload)

	if h.sceneManager == nil {
		return
	}

	roomID, _ := ctx.Connection.GetSceneInfo()
	if roomID == 0 {
		return
	}

	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), roomID, ctx.ConnID, method, payload)
}
