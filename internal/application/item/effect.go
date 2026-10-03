// Open-sourced by BaoLT

// Item effect handler interface and result types for the UseItem system.
// Each handler evaluates whether it can process a given item template,
// then applies its effect to the character and returns a result.
package item

import (
	"context"

	domainbuff "mcgame-server/internal/domain/buff"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
)

type UseContext struct {
	TargetType     int
	TargetID       int64
	PetID          int64
	Quantity       int
	EffectiveMaxHP int
	EffectiveMaxMP int
}

type ItemEffectHandler interface {
	CanHandle(tpl *models.ItemTemplateTemplate) bool
	Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error)
}

type ItemEffectResult struct {
	HPHealed             int
	MPRestored           int
	GrantedItems         []*GrantedItemResult
	Pets                 []*domainpet.Pet
	UpdatedPets          []*domainpet.Pet
	GiftBox              *GiftBoxData
	TempBagItems         []*TempBagItemData
	GrantedTitles        []GrantedTitleResult
	GrantedSkillIDs      []int
	GrantedBuffs         []*domainbuff.Buff
	GrantedCurrencies    []GrantedCurrencyResult
	GrantedMedals        []GrantedMedalResult
	Message              string
	ConsumeItem          bool
	RefreshCharacterView bool
}

type GrantedMedalResult struct {
	Slot       int
	TemplateID int
	Count      int
}

type GrantedCurrencyResult struct {
	ClientKey string
	Delta     int64
	Total     float64
	Label     string
}

type GrantedItemResult struct {
	TemplateID int
	Count      int
	IsBound    bool
	Item       *domainitem.Item
}

type GrantedTitleResult struct {
	TitleID       int
	Titles        string
	SpecialTitles string
	IsSpecial     bool
	Added         bool
}

type GiftBoxData struct {
	Choices []*GiftBoxChoice
	GetNum  int
}

type GiftBoxChoice struct {
	TableType int
	ID        int
	StackNum  int
	Quality   int
}

type TempBagItemData struct {
	ItemType int
	ItemID   int
	StackNum int
	Quality  int
	Binded   int
}

func NewEffectResult() *ItemEffectResult {
	return &ItemEffectResult{
		ConsumeItem: true,
	}
}
