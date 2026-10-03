// Open-sourced by BaoLT

// Magic estate domain state mirrors the client Fazenda panel and bag payloads.
package farm

import (
	"context"
	"fmt"
	"sort"
	"strconv"
	"strings"
	"time"
)

const (
	MagicEstateMaxSlots        = 16
	MagicEstateBaseFarmNum     = 2
	MagicEstateMaxExp          = 1921
	MagicEstateDefaultIconCode = int64(3050070000007)
)

type MagicEstateProfile struct {
	ID          int64
	CharacterID int64
	Exp         int
	Actpoint    int
	MaxActpoint int
	MovePnt     int
	MaxMovePnt  int
	FarmNum     int
	Slots       map[int]*MagicEstateSlot
	Bag         map[int]*MagicEstateBagSlot
}

type MagicEstateSlot struct {
	SlotID         int
	MineralID      int
	Num            int
	MaxNum         int
	CooldownEndsAt int64
	HavestFlag     bool
}

type MagicEstateBagSlot struct {
	SlotIndex  int
	TemplateID int
	Num        int64
	ColorCode  int
}

type MagicEstateRepository interface {
	FindByCharacter(ctx context.Context, characterID int64) (*MagicEstateProfile, error)
	Upsert(ctx context.Context, profile *MagicEstateProfile) error
	FindLogsByCharacter(ctx context.Context, characterID int64, limit int) ([]*MagicEstateLog, error)
	FindSavedReplaysByCharacter(ctx context.Context, characterID int64, limit int) ([]*MagicEstateReplay, error)
	SaveReplay(ctx context.Context, replay *MagicEstateReplay) error
	DeleteReplay(ctx context.Context, characterID int64, battleID int64) error
	SaveLog(ctx context.Context, log *MagicEstateLog) error
}

func DefaultMagicEstateMaxActpoint(level int) int {
	maxActpoint := (level * 10) + 150
	if maxActpoint < 150 {
		return 150
	}
	return maxActpoint
}

func DefaultMagicEstateMaxMovePnt(level int) int {
	maxMovePnt := (level * 5) + 100
	if maxMovePnt < 100 {
		return 100
	}
	return maxMovePnt
}

func NewMagicEstateProfile(characterID int64, level int) *MagicEstateProfile {
	return &MagicEstateProfile{
		ID:          characterID,
		CharacterID: characterID,
		Exp:         0,
		Actpoint:    DefaultMagicEstateMaxActpoint(level),
		MaxActpoint: DefaultMagicEstateMaxActpoint(level),
		MovePnt:     DefaultMagicEstateMaxMovePnt(level),
		MaxMovePnt:  DefaultMagicEstateMaxMovePnt(level),
		FarmNum:     MagicEstateBaseFarmNum,
		Slots:       map[int]*MagicEstateSlot{},
		Bag:         map[int]*MagicEstateBagSlot{},
	}
}

func (p *MagicEstateProfile) Normalize(level int, now time.Time) {
	if p == nil {
		return
	}
	if p.ID <= 0 {
		p.ID = p.CharacterID
	}
	if p.MaxActpoint <= 0 {
		p.MaxActpoint = DefaultMagicEstateMaxActpoint(level)
	}
	if p.MaxMovePnt <= 0 {
		p.MaxMovePnt = DefaultMagicEstateMaxMovePnt(level)
	}
	if p.Actpoint < 0 {
		p.Actpoint = 0
	}
	if p.Actpoint > p.MaxActpoint {
		p.Actpoint = p.MaxActpoint
	}
	if p.MovePnt < 0 {
		p.MovePnt = 0
	}
	if p.MovePnt > p.MaxMovePnt {
		p.MovePnt = p.MaxMovePnt
	}
	if p.FarmNum < MagicEstateBaseFarmNum {
		p.FarmNum = MagicEstateBaseFarmNum
	}
	if p.FarmNum > MagicEstateMaxSlots {
		p.FarmNum = MagicEstateMaxSlots
	}
	if p.Exp < 0 {
		p.Exp = 0
	}
	if p.Exp > MagicEstateMaxExp {
		p.Exp = MagicEstateMaxExp
	}
	if p.Slots == nil {
		p.Slots = map[int]*MagicEstateSlot{}
	}
	if p.Bag == nil {
		p.Bag = map[int]*MagicEstateBagSlot{}
	}

	for slotID, slot := range p.Slots {
		if slot == nil || slot.MineralID <= 0 {
			delete(p.Slots, slotID)
			continue
		}
		if slot.MaxNum <= 0 {
			slot.MaxNum = slot.Num
		}
		if slot.Num <= 0 {
			slot.Num = slot.MaxNum
		}
		if slot.HavestFlag && slot.CooldownEndsAt > 0 && !now.Before(time.UnixMilli(slot.CooldownEndsAt)) {
			delete(p.Slots, slotID)
		}
	}

	for slotIndex, bagSlot := range p.Bag {
		if bagSlot == nil || bagSlot.TemplateID <= 0 || bagSlot.Num <= 0 {
			delete(p.Bag, slotIndex)
		}
	}
}

func (p *MagicEstateProfile) BuildFarmField() string {
	if p == nil || len(p.Slots) == 0 {
		return "{}"
	}

	slotIDs := make([]int, 0, len(p.Slots))
	for slotID := range p.Slots {
		slotIDs = append(slotIDs, slotID)
	}
	sort.Ints(slotIDs)

	parts := make([]string, 0, len(slotIDs))
	for _, slotID := range slotIDs {
		slot := p.Slots[slotID]
		if slot == nil {
			continue
		}
		part := fmt.Sprintf(
			`%d:{id:"%d",num:"%d",maxNum:"%d",time:%d,havestFlag:%t}`,
			slotID,
			slot.MineralID,
			slot.Num,
			slot.MaxNum,
			slot.CooldownEndsAt,
			slot.HavestFlag,
		)
		parts = append(parts, part)
	}

	return "{" + strings.Join(parts, ",") + "}"
}

func BuildMagicEstateBagDTO(profile *MagicEstateProfile) map[string]interface{} {
	if profile == nil || len(profile.Bag) == 0 {
		return map[string]interface{}{}
	}

	slotIndexes := make([]int, 0, len(profile.Bag))
	for slotIndex := range profile.Bag {
		slotIndexes = append(slotIndexes, slotIndex)
	}
	sort.Ints(slotIndexes)

	result := make(map[string]interface{}, len(slotIndexes))
	for _, slotIndex := range slotIndexes {
		slot := profile.Bag[slotIndex]
		if slot == nil {
			continue
		}
		result[strconv.Itoa(slotIndex)] = map[string]interface{}{
			"c":   slot.ColorCode,
			"tid": strconv.Itoa(slot.TemplateID),
			"num": strconv.FormatInt(slot.Num, 10),
		}
	}

	return result
}
