// Open-sourced by BaoLT

// Item appearance helpers map equipped items to client-facing visual payloads.
package item

import (
	"context"
	"strconv"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	"mcgame-server/internal/gamedata/models"
)

const (
	equipmentPositionWeapon = 3
	equipmentPositionFlyer  = 14
	equipmentPositionDress  = 21
	equipmentPositionWing   = 22

	interfaceSettingsPMKey    = "interfaceData"
	interfaceSettingDressHide = "dressHide"
)

type CharacterAppearance struct {
	WeaponResCode     int64
	DressResCode      int64
	DressEquipped     bool
	FlyerResCode      int64
	FlyerFrontResCode int64
	FlyerEquipped     bool
	WingResCode       int64
	Star              int
	EquiptList        map[string]interface{}
}

func (a CharacterAppearance) Apply(target map[string]interface{}) map[string]interface{} {
	if target == nil {
		target = map[string]interface{}{}
	}

	target["star"] = a.Star
	if a.EquiptList != nil {
		target["equiptList"] = a.EquiptList
	}

	if a.WeaponResCode > 0 {
		target["wp"] = a.WeaponResCode
	} else {
		target["wp"] = "0"
	}

	if a.DressResCode > 0 {
		target["dressResCode"] = a.DressResCode
	}

	if a.FlyerResCode > 0 {
		target["flyerResCode"] = a.FlyerResCode
	} else {
		target["flyerResCode"] = "0"
	}

	if a.FlyerFrontResCode > 0 {
		target["flyerFrontResCode"] = a.FlyerFrontResCode
	} else {
		target["flyerFrontResCode"] = "0"
	}

	if a.WingResCode > 0 {
		target["wingResCode"] = a.WingResCode
	} else {
		target["wingResCode"] = 0
	}

	target["mountResCode"] = 0

	return target
}

func (s *Service) BuildCharacterAppearance(ctx context.Context, charID int64, gender int) CharacterAppearance {
	appearance := CharacterAppearance{
		EquiptList: map[string]interface{}{},
	}

	equipment, err := s.GetEquipment(ctx, charID)
	if err != nil {
		return appearance
	}

	for _, equippedItem := range equipment {
		if equippedItem == nil {
			continue
		}

		appearance.EquiptList[strconv.Itoa(equippedItem.CalculateSID())] = s.BuildClientItemDTO(equippedItem)

		tpl := s.GetEquipmentTemplate(equippedItem.TemplateID)
		if tpl == nil {
			continue
		}

		switch int(tpl.Position) {
		case equipmentPositionWeapon:
			appearance.WeaponResCode = resolveEquipmentResCode(tpl, gender)
			appearance.Star = equippedItem.StarLevel
		case equipmentPositionFlyer:
			appearance.FlyerEquipped = true
			appearance.FlyerResCode = int64(tpl.ResCode)
			appearance.FlyerFrontResCode = int64(tpl.WavCode)
		case equipmentPositionDress:
			appearance.DressEquipped = true
			appearance.DressResCode = resolveEquipmentResCode(tpl, gender)
			if appearance.Star == 0 {
				appearance.Star = equippedItem.StarLevel
			}
		case equipmentPositionWing:
			appearance.WingResCode = resolveEquipmentResCode(tpl, gender)
		}
	}

	return appearance
}

func (s *Service) ApplyDressStateToAppearance(appearance CharacterAppearance, gender int, dressInfo string, dressHidden bool) CharacterAppearance {
	if !appearance.DressEquipped {
		appearance.DressResCode = 0
	} else if dressHidden {
		appearance.DressResCode = 0
	}

	info, err := domaindress.Decode(dressInfo)
	if err != nil || info == nil {
		return appearance
	}

	if appearance.DressEquipped && !dressHidden {
		if fakeDressResCode := s.resolveFakeDressResCode(info.FakeDressID, gender); fakeDressResCode > 0 {
			appearance.DressResCode = fakeDressResCode
		}
	}

	if appearance.FlyerEquipped {
		if fakeFlyerResCode, fakeFlyerFrontResCode, ok := s.resolveFakeFlyerAppearance(info.FakeFlyDressID, gender); ok {
			appearance.FlyerResCode = fakeFlyerResCode
			appearance.FlyerFrontResCode = fakeFlyerFrontResCode
		}
	}

	return appearance
}

func (s *Service) ResolveCharacterResCode(ctx context.Context, char *domainchar.Character) int64 {
	if char == nil {
		return 0
	}

	if transformedResCode, ok := char.ActivePMTransformResCode(time.Now()); ok {
		return transformedResCode
	}

	baseResCode := s.ResolveClassResCode(char.ClassID, char.Gender)
	appearance := s.BuildCharacterAppearance(ctx, char.ID, char.Gender)
	if DressHiddenFromCharacter(char) || !appearance.DressEquipped {
		return baseResCode
	}

	if info, err := domaindress.Decode(char.DressInfo); err == nil && info != nil {
		if fakeResCode := s.resolveFakeDressResCode(info.FakeDressID, char.Gender); fakeResCode > 0 {
			return fakeResCode
		}
	}

	if appearance.DressResCode > 0 {
		return appearance.DressResCode
	}

	return baseResCode
}

func (s *Service) ResolveCharacterFlyerAppearance(ctx context.Context, char *domainchar.Character) (int64, int64, bool) {
	if char == nil {
		return 0, 0, false
	}

	appearance := s.BuildCharacterAppearance(ctx, char.ID, char.Gender)
	if !appearance.FlyerEquipped {
		return 0, 0, false
	}

	if info, err := domaindress.Decode(char.DressInfo); err == nil && info != nil {
		if fakeFlyerResCode, fakeFlyerFrontResCode, ok := s.resolveFakeFlyerAppearance(info.FakeFlyDressID, char.Gender); ok {
			return fakeFlyerResCode, fakeFlyerFrontResCode, true
		}
	}

	if appearance.FlyerResCode <= 0 {
		return 0, 0, false
	}

	return appearance.FlyerResCode, appearance.FlyerFrontResCode, true
}

func DressHiddenFromCharacter(char *domainchar.Character) bool {
	if char == nil {
		return false
	}

	if char.PMProcessData == nil {
		return false
	}

	rawSettings, ok := char.PMProcessData[interfaceSettingsPMKey]
	if !ok {
		return false
	}

	settings, ok := rawSettings.(map[string]interface{})
	if !ok {
		return false
	}

	return DressHiddenFromSettings(settings)
}

func DressHiddenFromSettings(settings map[string]interface{}) bool {
	if len(settings) == 0 {
		return false
	}

	value, ok := settings[interfaceSettingDressHide]
	if !ok {
		return false
	}

	switch typed := value.(type) {
	case bool:
		return typed
	case int:
		return typed != 0
	case int8:
		return typed != 0
	case int16:
		return typed != 0
	case int32:
		return typed != 0
	case int64:
		return typed != 0
	case uint:
		return typed != 0
	case uint8:
		return typed != 0
	case uint16:
		return typed != 0
	case uint32:
		return typed != 0
	case uint64:
		return typed != 0
	case float32:
		return typed != 0
	case float64:
		return typed != 0
	case string:
		return typed == "1" || typed == "true"
	default:
		return false
	}
}

func (s *Service) ResolveEquipmentResCode(templateID int, gender int) int64 {
	tpl := s.GetEquipmentTemplate(templateID)
	return resolveEquipmentResCode(tpl, gender)
}

func (s *Service) resolveFakeDressResCode(dressID int64, gender int) int64 {
	if dressID <= 0 || s == nil || s.gameDataRec == nil {
		return 0
	}

	dressTpl := s.gameDataRec.GetDress(int(dressID))
	if dressTpl == nil || int(dressTpl.EquiptID) <= 0 {
		return 0
	}

	return s.ResolveEquipmentResCode(int(dressTpl.EquiptID), gender)
}

func (s *Service) resolveFakeFlyerAppearance(dressID int64, gender int) (int64, int64, bool) {
	if dressID <= 0 || s == nil || s.gameDataRec == nil {
		return 0, 0, false
	}

	dressTpl := s.gameDataRec.GetDress(int(dressID))
	if dressTpl == nil || int(dressTpl.EquiptID) <= 0 {
		return 0, 0, false
	}

	equipmentTpl := s.GetEquipmentTemplate(int(dressTpl.EquiptID))
	if equipmentTpl == nil {
		return 0, 0, false
	}

	resCode := resolveEquipmentResCode(equipmentTpl, gender)
	if resCode <= 0 {
		return 0, 0, false
	}

	return resCode, int64(equipmentTpl.WavCode), true
}

func resolveEquipmentResCode(tpl *models.EquiptTemplateTemplate, gender int) int64 {
	if tpl == nil {
		return 0
	}

	if gender == 1 {
		if tpl.ResCodeFemale > 0 {
			return int64(tpl.ResCodeFemale)
		}
	} else {
		if tpl.ResCodeMale > 0 {
			return int64(tpl.ResCodeMale)
		}
	}

	if tpl.ResCode > 0 {
		return int64(tpl.ResCode)
	}

	if gender == 1 && tpl.ResCodeFemale2 > 0 {
		return int64(tpl.ResCodeFemale2)
	}
	if gender != 1 && tpl.ResCodeMale2 > 0 {
		return int64(tpl.ResCodeMale2)
	}

	return 0
}

func (s *Service) ResolveClassResCode(classID int, gender int) int64 {
	if s == nil || s.gameDataRec == nil {
		return 0
	}

	classData := s.gameDataRec.GetClass(classID)
	if classData == nil {
		return 0
	}

	if gender == 1 {
		return int64(classData.ResCodeFemale)
	}
	return int64(classData.ResCodeMale)
}

func (s *Service) GetBattleEquipmentInfo(ctx context.Context, charID int64, gender int) (weaponResCode int64, star int) {
	appearance := s.BuildCharacterAppearance(ctx, charID, gender)
	return appearance.WeaponResCode, appearance.Star
}
