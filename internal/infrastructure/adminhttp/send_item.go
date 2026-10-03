// Open-sourced by BaoLT

// Admin item send endpoint bridges dashboard requests to live game inventory state.
package adminhttp

import (
	"encoding/json"
	"errors"
	"math"
	"net/http"
	"sort"
	"strconv"
	"strings"
	"time"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

const (
	adminSendItemMaxCount = 9_999
	adminMinBagSlots      = 30
	adminMaxBagSlots      = 210
)

type adminSendItemRequest struct {
	PlayerID        int64                 `json:"playerId"`
	ItemID          int                   `json:"itemId"`
	TemplateTableID int                   `json:"templateTableId"`
	Count           int                   `json:"count"`
	CreatedBy       string                `json:"createdBy"`
	Options         *adminSendItemOptions `json:"options,omitempty"`
}

type adminSendItemOptions struct {
	Binded           *bool                   `json:"binded,omitempty"`
	Color            *int                    `json:"color,omitempty"`
	StrengthenLevel  *int                    `json:"strengthenLevel,omitempty"`
	EndureLeft       *int                    `json:"endureLeft,omitempty"`
	EndureMax        *int                    `json:"endureMax,omitempty"`
	Maker            *string                 `json:"maker,omitempty"`
	Element          *int                    `json:"element,omitempty"`
	PreNameType      *int                    `json:"preNameType,omitempty"`
	HoleNum          *int                    `json:"holeNum,omitempty"`
	BindMainPropNum1 *int                    `json:"bindMainPropNum1,omitempty"`
	BindMainPropNum2 *int                    `json:"bindMainPropNum2,omitempty"`
	PropLines        []adminSendItemPropLine `json:"propLines,omitempty"`
	Gems             []int                   `json:"gems,omitempty"`
	Flag             *string                 `json:"flag,omitempty"`
	Flag2            *string                 `json:"flag2,omitempty"`
	Flag3            *string                 `json:"flag3,omitempty"`
	RawProperties    map[string]interface{}  `json:"rawProperties,omitempty"`
}

type adminSendItemPropLine struct {
	Slot  string `json:"slot"`
	Type  int    `json:"type"`
	Value int    `json:"value"`
}

type adminSendItemTemplate struct {
	ItemID            int
	Name              string
	TemplateTableID   int
	TemplateTableName string
	ItemType          item.ItemType
	MaxStack          int
	BindType          int
	ColorCode         int
	EndureMax         int
	HoleNum           int
	BindPropNum       int
	TemplateT         int64
	MainProp1         int
	MainProp2         int
	MainPropNum1      int
	MainPropNum2      int
	Prop1             int
	Prop2             int
	PropNum1          int
	PropNum2          int
	ActiveProp        int
	ActivePropNum     int
}

type adminInsertedItemInfo struct {
	InstanceID int64 `json:"instanceId"`
	SlotIndex  int   `json:"slotIndex"`
	SID        int   `json:"sid"`
	StackCount int   `json:"stackCount"`
}

type adminSendItemAppliedOptions struct {
	Binded           bool `json:"binded"`
	Color            int  `json:"color"`
	StrengthenLevel  int  `json:"strengthenLevel"`
	HoleNum          int  `json:"holeNum"`
	PropLineCount    int  `json:"propLineCount"`
	GemsCount        int  `json:"gemsCount"`
	RawPropertyCount int  `json:"rawPropertyCount"`
}

type adminSendItemResponse struct {
	OK                 bool                         `json:"ok"`
	Player             adminSendItemPlayerInfo      `json:"player"`
	Item               adminSendItemTemplateInfo    `json:"item"`
	RequestedCount     int                          `json:"requestedCount"`
	GrantedCount       int                          `json:"grantedCount"`
	StackedCount       int                          `json:"stackedCount"`
	InsertedCount      int                          `json:"insertedCount"`
	CreatedStacks      int                          `json:"createdStacks"`
	UpdatedStacks      int                          `json:"updatedStacks"`
	InsertedItems      []adminInsertedItemInfo      `json:"insertedItems"`
	DeliveryMode       string                       `json:"deliveryMode"`
	RefreshRecommended bool                         `json:"refreshRecommended"`
	AppliedOptions     *adminSendItemAppliedOptions `json:"appliedOptions,omitempty"`
	StatusMessage      string                       `json:"statusMessage"`
}

type adminSendItemPlayerInfo struct {
	ID       int64  `json:"id"`
	Name     string `json:"name"`
	Level    int    `json:"level"`
	BagSlots int    `json:"bagSlots"`
}

type adminSendItemTemplateInfo struct {
	ItemID            int    `json:"itemId"`
	Name              string `json:"name"`
	ItemType          int    `json:"itemType"`
	TemplateTableID   int    `json:"templateTableId"`
	TemplateTableName string `json:"templateTableName"`
}

type adminErrorResponse struct {
	OK      bool   `json:"ok"`
	Message string `json:"message"`
}

func (s *Server) handlePlayerSendItem(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
		return
	}

	if s.characterProvider == nil || s.itemProvider == nil || s.templateProvider == nil {
		s.writeJSON(w, http.StatusNotImplemented, adminErrorResponse{
			OK:      false,
			Message: "send-item is not configured on this server",
		})
		return
	}

	var req adminSendItemRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: "invalid JSON body",
		})
		return
	}

	if err := validateAdminSendItemRequest(&req); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: err.Error(),
		})
		return
	}

	ctx := r.Context()
	characterData, err := s.characterProvider.FindByID(ctx, req.PlayerID)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrCharacterNotFound) {
			s.writeJSON(w, http.StatusNotFound, adminErrorResponse{
				OK:      false,
				Message: "character not found",
			})
			return
		}

		s.logger.Error("admin send-item: failed to load character",
			zap.Int64("character_id", req.PlayerID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
			OK:      false,
			Message: "failed to load character",
		})
		return
	}

	templateData, err := s.resolveSendItemTemplate(req.ItemID, req.TemplateTableID)
	if err != nil {
		statusCode := http.StatusBadRequest
		if errors.Is(err, pkgerrors.ErrItemNotFound) {
			statusCode = http.StatusNotFound
		}

		s.writeJSON(w, statusCode, adminErrorResponse{
			OK:      false,
			Message: err.Error(),
		})
		return
	}

	bagSlots := clampBagSlots(characterData.MaxBagSlots())
	bagItems, err := s.itemProvider.FindByCharacterAndSlotType(ctx, req.PlayerID, item.SlotTypeBag)
	if err != nil {
		s.logger.Error("admin send-item: failed to load bag items",
			zap.Int64("character_id", req.PlayerID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
			OK:      false,
			Message: "failed to load inventory",
		})
		return
	}

	isBound := defaultBoundFromTemplate(templateData.BindType)
	if req.Options != nil && req.Options.Binded != nil {
		isBound = *req.Options.Binded
	}

	colorCode := templateData.ColorCode
	if req.Options != nil && req.Options.Color != nil {
		colorCode = max(0, *req.Options.Color)
	}

	stackTargets, usedSlots, err := planAdminSendItemStacks(bagItems, bagSlots, templateData, isBound, colorCode, req.Count)
	if err != nil {
		s.writeJSON(w, http.StatusConflict, adminErrorResponse{
			OK:      false,
			Message: err.Error(),
		})
		return
	}

	updatedItems := make([]*item.Item, 0, len(stackTargets))
	createdItems := make([]*item.Item, 0)
	insertedItems := make([]adminInsertedItemInfo, 0)
	stackedCount := 0
	insertedCount := 0

	for _, stackTarget := range stackTargets {
		stackTarget.Item.StackCount += stackTarget.StackAdd
		if err := s.itemProvider.UpdateStack(ctx, stackTarget.ID, stackTarget.Item.StackCount); err != nil {
			s.logger.Error("admin send-item: failed to update stack",
				zap.Int64("character_id", req.PlayerID),
				zap.Int64("item_id", stackTarget.ID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
				OK:      false,
				Message: "failed to update existing stack",
			})
			return
		}
		stackedCount += stackTarget.StackAdd
		updatedItems = append(updatedItems, stackTarget.Item)
	}

	remainingCount := req.Count - stackedCount
	createdBy := strings.TrimSpace(req.CreatedBy)

	for remainingCount > 0 {
		slotIndex := findNextEmptyBagSlot(usedSlots, bagSlots)
		if slotIndex < 0 {
			s.writeJSON(w, http.StatusConflict, adminErrorResponse{
				OK:      false,
				Message: "inventory full",
			})
			return
		}

		usedSlots[slotIndex] = struct{}{}
		stackCount := min(remainingCount, templateData.MaxStack)
		newItem := buildAdminSendItemInstance(req.PlayerID, slotIndex, stackCount, templateData, req.Options, isBound, colorCode, createdBy)

		if err := s.itemProvider.Create(ctx, newItem); err != nil {
			s.logger.Error("admin send-item: failed to create item",
				zap.Int64("character_id", req.PlayerID),
				zap.Int("template_id", templateData.ItemID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
				OK:      false,
				Message: "failed to create item",
			})
			return
		}

		remainingCount -= stackCount
		insertedCount += stackCount
		createdItems = append(createdItems, newItem)
		insertedItems = append(insertedItems, adminInsertedItemInfo{
			InstanceID: newItem.ID,
			SlotIndex:  newItem.SlotIndex,
			SID:        newItem.CalculateSID(),
			StackCount: newItem.StackCount,
		})
	}

	if s.playerDataSaver != nil {
		if err := s.playerDataSaver.SavePlayer(ctx, req.PlayerID); err != nil {
			s.logger.Warn("admin send-item: failed to flush player cache",
				zap.Int64("character_id", req.PlayerID),
				zap.Error(err))
		}
	}

	changedItems := append(updatedItems, createdItems...)
	sort.Slice(changedItems, func(i, j int) bool {
		return changedItems[i].CalculateSID() < changedItems[j].CalculateSID()
	})

	deliveryMode := "database_only"
	refreshRecommended := true
	statusMessage := "Nhan vat offline hoac chua vao map. Item da duoc luu vao DB."
	conn := s.sessionProvider.GetConnectionByCharacterID(strconv.FormatInt(req.PlayerID, 10))
	if conn != nil {
		liveDelivered := true
		for _, changedItem := range changedItems {
			if err := conn.SendCallback("onAddCharactorSlot", changedItem.ToDTO()); err != nil {
				liveDelivered = false
				s.logger.Warn("admin send-item: failed to push inventory callback",
					zap.Int64("character_id", req.PlayerID),
					zap.Int64("item_id", changedItem.ID),
					zap.Error(err))
			}
		}

		if liveDelivered {
			deliveryMode = "live_session"
			refreshRecommended = false
			statusMessage = "Nhan vat dang online. Item da duoc day vao client qua onAddCharactorSlot."
		}
	}

	resp := adminSendItemResponse{
		OK: true,
		Player: adminSendItemPlayerInfo{
			ID:       characterData.ID,
			Name:     characterData.Name,
			Level:    characterData.Level,
			BagSlots: bagSlots,
		},
		Item: adminSendItemTemplateInfo{
			ItemID:            templateData.ItemID,
			Name:              templateData.Name,
			ItemType:          int(templateData.ItemType),
			TemplateTableID:   templateData.TemplateTableID,
			TemplateTableName: templateData.TemplateTableName,
		},
		RequestedCount:     req.Count,
		GrantedCount:       req.Count,
		StackedCount:       stackedCount,
		InsertedCount:      insertedCount,
		CreatedStacks:      len(createdItems),
		UpdatedStacks:      len(updatedItems),
		InsertedItems:      insertedItems,
		DeliveryMode:       deliveryMode,
		RefreshRecommended: refreshRecommended,
		StatusMessage:      statusMessage,
	}

	if req.Options != nil {
		resp.AppliedOptions = &adminSendItemAppliedOptions{
			Binded:           isBound,
			Color:            colorCode,
			StrengthenLevel:  maxOptionInt(req.Options.StrengthenLevel),
			HoleNum:          maxOptionInt(req.Options.HoleNum),
			PropLineCount:    len(req.Options.PropLines),
			GemsCount:        len(req.Options.Gems),
			RawPropertyCount: len(req.Options.RawProperties),
		}
	}

	s.writeJSON(w, http.StatusOK, resp)
}

type adminStackTarget struct {
	Item     *item.Item
	ID       int64
	StackAdd int
}

func validateAdminSendItemRequest(req *adminSendItemRequest) error {
	if req.PlayerID <= 0 {
		return errors.New("playerId must be greater than 0")
	}
	if req.ItemID <= 0 {
		return errors.New("itemId must be greater than 0")
	}
	if req.TemplateTableID != 19 && req.TemplateTableID != 29 {
		return errors.New("templateTableId must be 19 or 29")
	}
	if req.Count <= 0 {
		return errors.New("count must be greater than 0")
	}
	if req.Count > adminSendItemMaxCount {
		return errors.New("count is too large")
	}
	if req.Options == nil {
		return nil
	}

	for _, value := range []*int{
		req.Options.Color,
		req.Options.StrengthenLevel,
		req.Options.EndureLeft,
		req.Options.EndureMax,
		req.Options.Element,
		req.Options.PreNameType,
		req.Options.HoleNum,
		req.Options.BindMainPropNum1,
		req.Options.BindMainPropNum2,
	} {
		if value != nil && *value < 0 {
			return errors.New("option values must be greater than or equal to 0")
		}
	}

	if req.Options.HoleNum != nil && *req.Options.HoleNum > 10 {
		return errors.New("holeNum must be between 0 and 10")
	}
	if req.Options.Element != nil && (*req.Options.Element < 0 || *req.Options.Element > 6) {
		return errors.New("element must be between 0 and 6")
	}

	validSlots := map[string]struct{}{
		"main1":  {},
		"main2":  {},
		"prop1":  {},
		"prop2":  {},
		"active": {},
	}
	for _, line := range req.Options.PropLines {
		if _, ok := validSlots[line.Slot]; !ok {
			return errors.New("propLines contain an invalid slot")
		}
		if line.Type <= 0 {
			return errors.New("propLines contain an invalid type")
		}
		if line.Value < 0 {
			return errors.New("propLines contain an invalid value")
		}
	}

	if len(req.Options.Gems) > 10 {
		return errors.New("gems cannot exceed 10 sockets")
	}
	for _, gemID := range req.Options.Gems {
		if gemID <= 0 {
			return errors.New("gems contain an invalid item ID")
		}
	}

	return nil
}

func (s *Server) resolveSendItemTemplate(itemID int, templateTableID int) (*adminSendItemTemplate, error) {
	if templateTableID == 19 {
		equipmentTemplate := s.templateProvider.GetEquipmentTemplate(itemID)
		if equipmentTemplate == nil {
			return nil, pkgerrors.ErrItemNotFound
		}

		maxStack := max(1, int(math.Trunc(equipmentTemplate.StackMax)))
		if int(math.Trunc(equipmentTemplate.SingleFlag)) > 0 {
			maxStack = 1
		}

		colorCode := max(0, int(math.Trunc(equipmentTemplate.ColorCode)))
		if colorCode == 0 {
			colorCode = max(0, int(math.Trunc(equipmentTemplate.Color)))
		}

		return &adminSendItemTemplate{
			ItemID:            itemID,
			Name:              equipmentTemplate.Name,
			TemplateTableID:   19,
			TemplateTableName: "equipt_template",
			ItemType:          item.ItemTypeEquipment,
			MaxStack:          maxStack,
			BindType:          max(0, int(math.Trunc(equipmentTemplate.BindType))),
			ColorCode:         colorCode,
			EndureMax:         max(0, int(math.Trunc(equipmentTemplate.EndureMax))),
			HoleNum:           max(0, int(math.Trunc(equipmentTemplate.HoleNum))),
			BindPropNum:       max(0, int(math.Trunc(equipmentTemplate.BindPropNum))),
			TemplateT:         templateTimeToInt64(equipmentTemplate.T),
			MainProp1:         int(math.Trunc(equipmentTemplate.MainProp1)),
			MainProp2:         int(math.Trunc(equipmentTemplate.MainProp2)),
			MainPropNum1:      max(0, int(math.Trunc(equipmentTemplate.MainPropNum1))),
			MainPropNum2:      max(0, int(math.Trunc(equipmentTemplate.MainPropNum2))),
			Prop1:             int(math.Trunc(equipmentTemplate.Prop1)),
			Prop2:             int(math.Trunc(equipmentTemplate.Prop2)),
			PropNum1:          max(0, int(math.Trunc(equipmentTemplate.PropNum1))),
			PropNum2:          max(0, int(math.Trunc(equipmentTemplate.PropNum2))),
			ActiveProp:        int(math.Trunc(equipmentTemplate.ActivePropType)),
			ActivePropNum:     max(0, int(math.Trunc(equipmentTemplate.ActivePropNum))),
		}, nil
	}

	itemTemplate := s.templateProvider.GetItemTemplate(itemID)
	if itemTemplate == nil {
		return nil, pkgerrors.ErrItemNotFound
	}

	maxStack := max(1, int(math.Trunc(itemTemplate.StackMax)))
	if int(math.Trunc(itemTemplate.SingleFlag)) > 0 {
		maxStack = 1
	}

	colorCode := max(0, int(math.Trunc(itemTemplate.ColorCode)))
	if colorCode == 0 {
		colorCode = max(0, int(math.Trunc(itemTemplate.Color)))
	}

	itemType := item.ItemTypeConsumable
	switch max(0, int(math.Trunc(itemTemplate.Kind))) {
	case 6:
		itemType = item.ItemTypeMaterial
	case 3:
		itemType = item.ItemTypeQuest
	}

	return &adminSendItemTemplate{
		ItemID:            itemID,
		Name:              itemTemplate.Name,
		TemplateTableID:   29,
		TemplateTableName: "item_template",
		ItemType:          itemType,
		MaxStack:          maxStack,
		BindType:          max(0, int(math.Trunc(itemTemplate.BindType))),
		ColorCode:         colorCode,
		TemplateT:         templateTimeToInt64(itemTemplate.T),
		MainProp1:         int(math.Trunc(itemTemplate.PropType)),
		MainPropNum1:      max(0, int(math.Trunc(itemTemplate.ProplNum))),
	}, nil
}

func planAdminSendItemStacks(
	bagItems []*item.Item,
	bagSlots int,
	templateData *adminSendItemTemplate,
	isBound bool,
	colorCode int,
	count int,
) ([]*adminStackTarget, map[int]struct{}, error) {
	visibleBagItems := make([]*item.Item, 0, len(bagItems))
	usedSlots := make(map[int]struct{})

	for _, bagItem := range bagItems {
		if bagItem == nil || bagItem.SlotType != item.SlotTypeBag {
			continue
		}
		if bagItem.SlotIndex < 0 || bagItem.SlotIndex >= bagSlots {
			continue
		}
		visibleBagItems = append(visibleBagItems, bagItem)
		usedSlots[bagItem.SlotIndex] = struct{}{}
	}

	sort.Slice(visibleBagItems, func(i, j int) bool {
		return visibleBagItems[i].SlotIndex < visibleBagItems[j].SlotIndex
	})

	stackTargets := make([]*adminStackTarget, 0)
	remaining := count

	if templateData.MaxStack > 1 {
		for _, bagItem := range visibleBagItems {
			if remaining <= 0 {
				break
			}
			if bagItem.TemplateID != templateData.ItemID {
				continue
			}
			if bagItem.ItemType != templateData.ItemType {
				continue
			}
			if bagItem.IsBound != isBound {
				continue
			}
			if bagItem.ColorCode != colorCode {
				continue
			}
			if bagItem.StackCount >= templateData.MaxStack {
				continue
			}

			space := templateData.MaxStack - bagItem.StackCount
			amount := min(remaining, space)
			if amount <= 0 {
				continue
			}

			stackTargets = append(stackTargets, &adminStackTarget{
				Item:     bagItem,
				ID:       bagItem.ID,
				StackAdd: amount,
			})
			remaining -= amount
		}
	}

	requiredSlots := 0
	if remaining > 0 {
		requiredSlots = int(math.Ceil(float64(remaining) / float64(templateData.MaxStack)))
	}

	freeSlots := bagSlots - len(usedSlots)
	if requiredSlots > freeSlots {
		return nil, nil, errors.New("inventory full")
	}

	return stackTargets, usedSlots, nil
}

func buildAdminSendItemInstance(
	charID int64,
	slotIndex int,
	stackCount int,
	templateData *adminSendItemTemplate,
	options *adminSendItemOptions,
	isBound bool,
	colorCode int,
	createdBy string,
) *item.Item {
	instance := item.NewItem(charID, templateData.ItemID, templateData.ItemType, item.SlotTypeBag, slotIndex)
	instance.StackCount = stackCount
	instance.IsBound = isBound
	instance.ColorCode = colorCode

	if templateData.ItemType == item.ItemTypeEquipment {
		strengthenLevel := maxOptionInt(optionsValue(options, func(o *adminSendItemOptions) *int { return o.StrengthenLevel }))
		resolvedEndureMax := templateData.EndureMax
		if value := optionsValue(options, func(o *adminSendItemOptions) *int { return o.EndureMax }); value != nil {
			resolvedEndureMax = max(0, *value)
		}
		resolvedEndureLeft := resolvedEndureMax
		if value := optionsValue(options, func(o *adminSendItemOptions) *int { return o.EndureLeft }); value != nil {
			resolvedEndureLeft = max(0, *value)
		}
		if resolvedEndureLeft > resolvedEndureMax {
			resolvedEndureMax = resolvedEndureLeft
		}

		instance.EnchantLevel = strengthenLevel
		instance.MaxDurability = intPointer(resolvedEndureMax)
		instance.Durability = intPointer(min(resolvedEndureLeft, resolvedEndureMax))
		instance.Properties = buildAdminEquipmentProperties(templateData, options, isBound, colorCode, *instance.Durability, *instance.MaxDurability, createdBy, strengthenLevel)
		return instance
	}

	instance.Properties = buildAdminItemProperties(templateData, options, isBound, colorCode)
	return instance
}

func buildAdminEquipmentProperties(
	templateData *adminSendItemTemplate,
	options *adminSendItemOptions,
	isBound bool,
	colorCode int,
	endureLeft int,
	endureMax int,
	createdBy string,
	strengthenLevel int,
) map[string]interface{} {
	holeNum := templateData.HoleNum
	if value := optionsValue(options, func(o *adminSendItemOptions) *int { return o.HoleNum }); value != nil {
		holeNum = clamp(*value, 0, 10)
	}

	properties := map[string]interface{}{
		"mainProp1":        templateData.MainProp1,
		"mainProp2":        templateData.MainProp2,
		"mainPropNum1":     templateData.MainPropNum1,
		"mainPropNum2":     templateData.MainPropNum2,
		"prop1":            templateData.Prop1,
		"prop2":            templateData.Prop2,
		"propNum1":         templateData.PropNum1,
		"propNum2":         templateData.PropNum2,
		"activeProp":       templateData.ActiveProp,
		"activePropNum":    templateData.ActivePropNum,
		"bindMainPropNum1": templateData.BindPropNum,
		"bindMainPropNum2": templateData.BindPropNum,
		"element":          0,
		"preNameType":      item.EquipmentPrefixTypeFromColorCode(colorCode),
		"t":                buildTemplateTimeValue(templateData.TemplateT),
		"holeNum":          holeNum,
		"tid":              strconv.Itoa(templateData.ItemID),
		"maker":            createdBy,
		"endureLeft":       strconv.Itoa(endureLeft),
		"endureMax":        strconv.Itoa(endureMax),
		"flag":             "",
		"flag2":            nil,
		"flag3":            nil,
		"upgradeNum":       strengthenLevel,
		"binded":           boolToFlagString(isBound),
		"color":            strconv.Itoa(colorCode),
		"timeStamp":        nil,
	}

	for index := 1; index <= 10; index++ {
		properties["t"+strconv.Itoa(index)] = 0
	}

	if options != nil {
		for _, line := range options.PropLines {
			switch line.Slot {
			case "main1":
				properties["mainProp1"] = line.Type
				properties["mainPropNum1"] = line.Value
			case "main2":
				properties["mainProp2"] = line.Type
				properties["mainPropNum2"] = line.Value
			case "prop1":
				properties["prop1"] = line.Type
				properties["propNum1"] = line.Value
			case "prop2":
				properties["prop2"] = line.Type
				properties["propNum2"] = line.Value
			case "active":
				properties["activeProp"] = line.Type
				properties["activePropNum"] = line.Value
			}
		}

		for index, gemID := range options.Gems {
			if index >= 10 {
				break
			}
			properties["t"+strconv.Itoa(index+1)] = gemID
		}

		if options.Element != nil {
			properties["element"] = max(0, *options.Element)
		}
		if options.PreNameType != nil {
			properties["preNameType"] = max(0, *options.PreNameType)
		}
		if options.BindMainPropNum1 != nil {
			properties["bindMainPropNum1"] = max(0, *options.BindMainPropNum1)
		}
		if options.BindMainPropNum2 != nil {
			properties["bindMainPropNum2"] = max(0, *options.BindMainPropNum2)
		}
		if options.Maker != nil {
			properties["maker"] = strings.TrimSpace(*options.Maker)
		}
		if options.Flag != nil {
			properties["flag"] = strings.TrimSpace(*options.Flag)
		}
		if options.Flag2 != nil {
			flagValue := strings.TrimSpace(*options.Flag2)
			if flagValue == "" {
				properties["flag2"] = nil
			} else {
				properties["flag2"] = flagValue
			}
		}
		if options.Flag3 != nil {
			flagValue := strings.TrimSpace(*options.Flag3)
			if flagValue == "" {
				properties["flag3"] = nil
			} else {
				properties["flag3"] = flagValue
			}
		}
		if len(options.RawProperties) > 0 {
			for key, value := range options.RawProperties {
				properties[key] = value
			}
		}
	}

	properties["tid"] = strconv.Itoa(templateData.ItemID)
	properties["holeNum"] = holeNum
	properties["upgradeNum"] = strengthenLevel
	properties["binded"] = boolToFlagString(isBound)
	properties["color"] = strconv.Itoa(colorCode)
	properties["endureLeft"] = strconv.Itoa(endureLeft)
	properties["endureMax"] = strconv.Itoa(endureMax)

	return properties
}

func buildAdminItemProperties(
	templateData *adminSendItemTemplate,
	options *adminSendItemOptions,
	isBound bool,
	colorCode int,
) map[string]interface{} {
	properties := map[string]interface{}{
		"tid":    strconv.Itoa(templateData.ItemID),
		"t":      buildTemplateTimeValue(templateData.TemplateT),
		"binded": boolToFlagString(isBound),
		"color":  strconv.Itoa(colorCode),
	}

	if options != nil && len(options.RawProperties) > 0 {
		for key, value := range options.RawProperties {
			properties[key] = value
		}
	}

	if _, ok := properties["t"]; !ok {
		properties["t"] = buildTemplateTimeValue(templateData.TemplateT)
	}
	properties["tid"] = strconv.Itoa(templateData.ItemID)
	properties["binded"] = boolToFlagString(isBound)
	properties["color"] = strconv.Itoa(colorCode)

	return properties
}

func buildTemplateTimeValue(templateValue int64) string {
	if templateValue <= 0 {
		return "-1"
	}

	raw := strconv.FormatInt(templateValue, 10)
	if len(raw) == 12 || len(raw) == 14 {
		year, errYear := strconv.Atoi(raw[0:4])
		month, errMonth := strconv.Atoi(raw[4:6])
		day, errDay := strconv.Atoi(raw[6:8])
		hour, errHour := strconv.Atoi(raw[8:10])
		minute, errMinute := strconv.Atoi(raw[10:12])
		second := 0
		var errSecond error
		if len(raw) == 14 {
			second, errSecond = strconv.Atoi(raw[12:14])
		}

		if errYear == nil && errMonth == nil && errDay == nil && errHour == nil && errMinute == nil && errSecond == nil {
			encodedDate := time.Date(year, time.Month(month), day, hour, minute, second, 0, time.Local)
			if !encodedDate.IsZero() {
				return strconv.FormatInt(encodedDate.UnixMilli(), 10)
			}
		}
	}

	return strconv.FormatInt(time.Now().Add(time.Duration(templateValue)*time.Minute).UnixMilli(), 10)
}

func templateTimeToInt64(value float64) int64 {
	return int64(math.Trunc(value))
}

func defaultBoundFromTemplate(bindType int) bool {
	return bindType > 0
}

func clampBagSlots(value int) int {
	return clamp(value, adminMinBagSlots, adminMaxBagSlots)
}

func clamp(value int, minValue int, maxValue int) int {
	if value < minValue {
		return minValue
	}
	if value > maxValue {
		return maxValue
	}
	return value
}

func findNextEmptyBagSlot(usedSlots map[int]struct{}, bagSlots int) int {
	for slotIndex := 0; slotIndex < bagSlots; slotIndex++ {
		if _, ok := usedSlots[slotIndex]; !ok {
			return slotIndex
		}
	}
	return -1
}

func boolToFlagString(value bool) string {
	if value {
		return "1"
	}
	return "0"
}

func intPointer(value int) *int {
	v := value
	return &v
}

func max(a int, b int) int {
	if a > b {
		return a
	}
	return b
}

func min(a int, b int) int {
	if a < b {
		return a
	}
	return b
}

func maxOptionInt(value *int) int {
	if value == nil {
		return 0
	}
	return max(0, *value)
}

func optionsValue[T any](options *adminSendItemOptions, getter func(*adminSendItemOptions) *T) *T {
	if options == nil {
		return nil
	}
	return getter(options)
}
