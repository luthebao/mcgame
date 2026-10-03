// Open-sourced by BaoLT

// Fake-dress (illusion) handlers for the Dress Panel.
package dress

import (
	"context"
	"strconv"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) SetFakeDress(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, ok := toInt64(args[0])
	if !ok {
		return nil, nil
	}
	resCode, _ := fakeResCodeArg(args, 1)
	info, err := h.service.SetFakeDress(context.Background(), charID, dressID)
	if err != nil {
		return h.handleServiceError("setFakeDress", charID, err)
	}
	h.sendDressAppearanceCurrent(ctx, charID, resCode)
	return info, nil
}

func (h *Handler) UnsetFakeDress(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	resCode, _ := fakeResCodeArg(args, 1)
	info, err := h.service.UnsetFakeDress(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("unsetFakeDress", charID, err)
	}
	h.sendDressAppearanceCurrent(ctx, charID, resCode)
	return info, nil
}

func (h *Handler) SetFakeFlyerDress(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, ok := toInt64(args[0])
	if !ok {
		return nil, nil
	}
	resCode, wavCode := fakeFlyerArgs(args)
	info, err := h.service.SetFakeFlyerDress(context.Background(), charID, dressID)
	if err != nil {
		return h.handleServiceError("setFakeFlyerDress", charID, err)
	}
	h.sendFlyerAppearanceCurrent(ctx, charID, resCode, wavCode, false)
	return info, nil
}

func (h *Handler) UnsetFakeFlyerDress(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, err := h.service.UnsetFakeFlyerDress(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("unsetFakeFlyerDress", charID, err)
	}
	h.sendFlyerAppearanceCurrent(ctx, charID, 0, 0, true)
	return info, nil
}

func fakeResCodeArg(args []interface{}, index int) (int64, bool) {
	if len(args) <= index {
		return 0, false
	}
	return toInt64(args[index])
}

func fakeFlyerArgs(args []interface{}) (int64, int64) {
	resCode, _ := fakeResCodeArg(args, 1)
	wavCode, _ := fakeResCodeArg(args, 2)
	return resCode, wavCode
}

func (h *Handler) loadAppearanceContext(ctx context.Context, charID int64) (*domainchar.Character, appitem.CharacterAppearance, bool) {
	if h == nil || h.characters == nil || h.itemService == nil {
		return nil, appitem.CharacterAppearance{}, false
	}
	char, err := h.characters.GetCharacter(ctx, charID)
	if err != nil || char == nil {
		return nil, appitem.CharacterAppearance{}, false
	}
	appearance := h.itemService.BuildCharacterAppearance(ctx, charID, char.Gender)
	appearance = h.itemService.ApplyDressStateToAppearance(appearance, char.Gender, char.DressInfo, appitem.DressHiddenFromCharacter(char))
	return char, appearance, true
}

func (h *Handler) sendDressAppearanceCurrent(ctx *rtmp.RPCContext, charID, fallbackResCode int64) {
	char, _, ok := h.loadAppearanceContext(context.Background(), charID)
	if !ok {
		if fallbackResCode <= 0 {
			return
		}
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onSetRes", map[string]interface{}{
			"id":  charID,
			"res": fallbackResCode,
		})
		return
	}
	baseResCode, _ := h.resolveBaseCharacterResCode(charID)
	resCode := int64(0)
	if h.itemService != nil {
		resCode = h.itemService.ResolveCharacterResCode(ctx.Context, char)
	}
	if resCode <= 0 {
		resCode = baseResCode
	}
	if resCode <= 0 {
		return
	}
	h.sendAppearanceCallbackToSelfAndScene(ctx, "onSetRes", map[string]interface{}{
		"id":  charID,
		"res": resCode,
	})
}

func (h *Handler) sendFlyerAppearanceCurrent(ctx *rtmp.RPCContext, charID, fallbackResCode, fallbackWavCode int64, includeZeroWav bool) {
	if h != nil && h.characters != nil && h.itemService != nil {
		char, err := h.characters.GetCharacter(context.Background(), charID)
		if err == nil && char != nil {
			resCode, wavCode, ok := h.itemService.ResolveCharacterFlyerAppearance(ctx.Context, char)
			if ok {
				payload := map[string]interface{}{
					"cid":     charID,
					"resCode": resCode,
				}
				if wavCode > 0 || includeZeroWav {
					payload["wavCode"] = wavCode
				}
				h.sendAppearanceCallbackToSelfAndScene(ctx, "onFlyerOn", payload)
				return
			}
		}
	}
	if fallbackResCode <= 0 {
		return
	}
	payload := map[string]interface{}{
		"cid":     charID,
		"resCode": fallbackResCode,
	}
	if fallbackWavCode > 0 || includeZeroWav {
		payload["wavCode"] = fallbackWavCode
	}
	h.sendAppearanceCallbackToSelfAndScene(ctx, "onFlyerOn", payload)
}

func (h *Handler) resolveBaseCharacterResCode(charID int64) (int64, bool) {
	if h == nil || h.characters == nil {
		return 0, false
	}
	char, err := h.characters.GetCharacter(context.Background(), charID)
	if err != nil || char == nil {
		return 0, false
	}
	resCode, _, _, _ := h.characters.GetAppearanceCodesByClassAndGender(char.ClassID, char.Gender)
	if resCode == "" {
		return 0, false
	}
	value, err := strconv.ParseInt(resCode, 10, 64)
	if err != nil {
		return 0, false
	}
	return value, true
}

func resolveCurrentDressAppearancePayload(charID int64, char *domainchar.Character, appearance appitem.CharacterAppearance, baseResCode, fallbackResCode int64) (string, map[string]interface{}, bool) {
	if char == nil {
		return "", nil, false
	}

	dressHidden := appitem.DressHiddenFromCharacter(char)
	fakeDressActive := false
	info, err := domaindress.Decode(char.DressInfo)
	if err == nil && info != nil && info.FakeDressID > 0 {
		fakeDressActive = true
	}

	if appearance.DressEquipped && !dressHidden && !fakeDressActive && appearance.DressResCode > 0 {
		return "onSetRes", map[string]interface{}{
			"id":  charID,
			"res": appearance.DressResCode,
		}, true
	}

	resCode := baseResCode
	if resCode <= 0 {
		resCode = fallbackResCode
	}
	if resCode <= 0 {
		return "", nil, false
	}

	return "onSetRes", map[string]interface{}{
		"id":  charID,
		"res": resCode,
	}, true
}
