// Open-sourced by BaoLT

package item

// Item appearance callbacks keep client visuals aligned with equipped gear.

import (
	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
)

const (
	handlerEquipmentPositionWeapon = 3
	handlerEquipmentPositionFlyer  = 14
	handlerEquipmentPositionDress  = 21
	handlerEquipmentPositionWing   = 22
)

func (h *Handler) sendEquipAppearanceCallbacks(ctx *rtmp.RPCContext, char *character.Character, equippedItem *domainitem.Item) {
	if h == nil || h.itemService == nil || ctx == nil || ctx.Connection == nil || char == nil || equippedItem == nil {
		return
	}

	tpl := h.itemService.GetEquipmentTemplate(equippedItem.TemplateID)
	if tpl == nil {
		return
	}

	appearance := h.itemService.BuildCharacterAppearance(ctx.Context, char.ID, char.Gender)
	appearance = h.itemService.ApplyDressStateToAppearance(appearance, char.Gender, char.DressInfo, appitem.DressHiddenFromCharacter(char))

	switch int(tpl.Position) {
	case handlerEquipmentPositionWeapon:
		if appearance.WeaponResCode <= 0 {
			return
		}
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onEquipOn", map[string]interface{}{
			"cid":       char.ID,
			"resCode":   appearance.WeaponResCode,
			"ee":        char.Ee,
			"ef":        char.Ef,
			"star":      equippedItem.StarLevel,
			"dressFlag": false,
		})
	case handlerEquipmentPositionFlyer:
		if appearance.FlyerResCode <= 0 {
			return
		}
		payload := map[string]interface{}{
			"cid":     char.ID,
			"resCode": appearance.FlyerResCode,
		}
		if appearance.FlyerFrontResCode > 0 {
			payload["wavCode"] = appearance.FlyerFrontResCode
		}
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onFlyerOn", payload)
	case handlerEquipmentPositionDress:
		if itemDressNeedsResolvedRefresh(char) {
			h.sendResolvedDressAppearance(ctx, char, appearance)
			return
		}
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onEquipOn", map[string]interface{}{
			"cid":       char.ID,
			"resCode":   appearance.DressResCode,
			"ee":        char.Ee,
			"ef":        char.Ef,
			"star":      equippedItem.StarLevel,
			"dressFlag": true,
		})
	case handlerEquipmentPositionWing:
		if appearance.WingResCode <= 0 {
			return
		}
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onWingOn", map[string]interface{}{
			"cid":     char.ID,
			"resCode": appearance.WingResCode,
		})
	}
}

func (h *Handler) sendUnequipAppearanceCallbacks(ctx *rtmp.RPCContext, char *character.Character, unequippedItem *domainitem.Item) {
	if h == nil || h.itemService == nil || ctx == nil || ctx.Connection == nil || char == nil || unequippedItem == nil {
		return
	}

	tpl := h.itemService.GetEquipmentTemplate(unequippedItem.TemplateID)
	if tpl == nil {
		return
	}

	resCode := h.itemService.ResolveEquipmentResCode(unequippedItem.TemplateID, char.Gender)
	appearance := h.itemService.BuildCharacterAppearance(ctx.Context, char.ID, char.Gender)
	appearance = h.itemService.ApplyDressStateToAppearance(appearance, char.Gender, char.DressInfo, appitem.DressHiddenFromCharacter(char))

	switch int(tpl.Position) {
	case handlerEquipmentPositionWeapon:
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onEquipOff", map[string]interface{}{
			"dressFlag": false,
			"colorCode": unequippedItem.ColorCode,
			"cid":       char.ID,
			"resCode":   resCode,
		})
	case handlerEquipmentPositionDress:
		if itemDressNeedsResolvedRefresh(char) {
			h.sendResolvedDressAppearance(ctx, char, appearance)
			return
		}
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onEquipOff", map[string]interface{}{
			"dressFlag": true,
			"colorCode": unequippedItem.ColorCode,
			"cid":       char.ID,
			"resCode":   resCode,
		})
	case handlerEquipmentPositionWing:
		h.sendAppearanceCallbackToSelfAndScene(ctx, "onWingOff", map[string]interface{}{
			"cid": char.ID,
		})
	}
}

func itemDressNeedsResolvedRefresh(char *character.Character) bool {
	if appitem.DressHiddenFromCharacter(char) {
		return true
	}

	if char == nil {
		return false
	}

	info, err := domaindress.Decode(char.DressInfo)
	if err != nil || info == nil {
		return false
	}

	return info.FakeDressID > 0
}

func (h *Handler) sendResolvedDressAppearance(ctx *rtmp.RPCContext, char *character.Character, appearance appitem.CharacterAppearance) {
	if h == nil || h.itemService == nil || ctx == nil || ctx.Connection == nil || char == nil {
		return
	}

	resCode := h.itemService.ResolveCharacterResCode(ctx.Context, char)
	if resCode <= 0 {
		return
	}
	h.sendAppearanceCallbackToSelfAndScene(ctx, "onSetRes", map[string]interface{}{
		"id":  char.ID,
		"res": resCode,
	})
}

func (h *Handler) sendAppearanceCallbackToSelfAndScene(ctx *rtmp.RPCContext, method string, payload map[string]interface{}) {
	if h == nil || ctx == nil || ctx.Connection == nil {
		return
	}

	ctx.Connection.SendCallback(method, payload)

	if h.sceneManager == nil {
		return
	}

	roomID, _ := ctx.Connection.GetSceneInfo()
	if roomID == 0 {
		return
	}

	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), roomID, ctx.ConnID, method, payload)
}
