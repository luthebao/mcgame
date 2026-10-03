// Open-sourced by BaoLT

// Fairy skill / state / lifecycle operations.
//
//	onSkill            teach a skill from a Bí Kíp Tinh Linh item -> {flag,id,sindex,skill}
//	                   stores the level-1 TBL_SKILL id (via SkillItemToTblSkill map)
//	upFairySkill       upgrade a learned skill 1->2->3 via TBL_SKILL chain;
//	                   consumes ITEM_FAIRY_SKILL_UP_ITEM=3583 (1 book lv1->2, 3 books lv2->3)
//	fairySkillConfigChange store the active skill config (fire-and-forget, no push)
//	changeFairyState   toggle guard(1)/rest(0) -> push onFairyOn/onFairyOff (+onUpdateFairy)
//	delFairy           release a fairy -> push onDelFairy
//
// skillIndex (int, 1-based = tab*4 + N where N=button 1..4) maps to the persisted
// skillFlag key as sindex = "s"+skillIndex (range s1..s20). The integer->sN mapping
// comes from FairySkillCanvas.as: upSkill(N) with skillIndex = selectedTabIndex*4 + N.
// nextSkillSlot iterates s1..s20 to find the first empty slot.
package fairy

import (
	"context"
	"errors"
	"strconv"
)

const (
	ItemFairySkillUpItem = 3583

	fairyStateRest  = 0
	fairyStateGuard = 1

	skillMaxLevel = 3
)

var ErrSkillMaxLevel = errors.New("tinh linh: kỹ năng đã đạt cấp tối đa")

type SkillResult struct {
	Flag   bool
	ID     int64
	Sindex string
	Skill  int
	Code   int
}

type StateChange struct {
	CharID  int64
	FairyID int64
	State   int
	ResCode int
}

func skillIndexToSindex(skillIndex int) string {
	if skillIndex < 1 {
		skillIndex = 1
	}
	return "s" + strconv.Itoa(skillIndex)
}

func (s *Service) OnSkill(ctx context.Context, charID, fairyID, skillBookSlotID int64) (*SkillResult, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return &SkillResult{Flag: false, Code: 2}, ErrFairyMissing
	}
	item, err := s.items.GetItemByID(ctx, charID, skillBookSlotID)
	if err != nil {
		return nil, err
	}
	if item == nil {
		return &SkillResult{Flag: false, Code: 2}, ErrItemNotFound
	}
	skillID, mapped := SkillItemToTblSkill[item.TemplateID]
	if !mapped {
		return &SkillResult{Flag: false, Code: 2}, ErrItemNotFound
	}
	for _, learned := range f.SkillFlag {
		if learned == skillID {
			return &SkillResult{Flag: false, Code: 1}, ErrSkillDuplicate
		}
	}
	sindex := s.nextSkillSlot(f)
	if sindex == "" {
		return &SkillResult{Flag: false, Code: 2}, ErrSkillFailed
	}
	if _, _, err := s.items.ConsumeItemStackByID(ctx, charID, skillBookSlotID, 1); err != nil {
		return &SkillResult{Flag: false, Code: 2}, err
	}
	f.SkillFlag[sindex] = skillID
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return &SkillResult{Flag: true, ID: fairyID, Sindex: sindex, Skill: skillID}, nil
}

func (s *Service) UpSkill(ctx context.Context, charID, fairyID int64, skillIndex int) (*SkillResult, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return &SkillResult{Flag: false, Code: 2}, ErrFairyMissing
	}
	if skillIndex < 1 || skillIndex > 20 {
		return &SkillResult{Flag: false, Code: 2}, ErrSkillFailed
	}
	sindex := skillIndexToSindex(skillIndex)
	currentID, exists := f.SkillFlag[sindex]
	if !exists {
		return &SkillResult{Flag: false, Code: 2}, ErrSkillFailed
	}
	if s.skillData == nil {
		return &SkillResult{Flag: true, ID: fairyID, Sindex: sindex, Skill: currentID}, nil
	}
	cur := s.skillData.GetSkill(currentID)
	if cur == nil {
		return &SkillResult{Flag: false, Code: 2}, ErrSkillFailed
	}
	if int(cur.Level) >= skillMaxLevel {
		return &SkillResult{Flag: false, Code: 3}, ErrSkillMaxLevel
	}
	newID := 0
	for _, sk := range s.skillData.GetAllSkills() {
		if sk.CodeName == cur.CodeName && int(sk.Level) == int(cur.Level)+1 {
			newID = int(sk.ID)
			break
		}
	}
	if newID == 0 {
		return &SkillResult{Flag: false, Code: 2}, ErrSkillFailed
	}
	bookCount := 1
	if int(cur.Level) == 2 {
		bookCount = 3
	}
	ok2, err := s.items.ConsumeItemsByTemplateID(ctx, charID, ItemFairySkillUpItem, bookCount)
	if err != nil {
		return &SkillResult{Flag: false, Code: 2}, err
	}
	if !ok2 {
		return &SkillResult{Flag: false, Code: 2}, ErrSkillFailed
	}
	f.SkillFlag[sindex] = newID
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return &SkillResult{Flag: true, ID: fairyID, Sindex: sindex, Skill: newID}, nil
}

func (s *Service) SetSkillConfig(ctx context.Context, charID, fairyID int64, config map[string]interface{}) error {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return ErrFairyMissing
	}
	if config == nil {
		config = map[string]interface{}{}
	}
	f.Config = config
	return s.saveState(ctx, charID, state)
}

func (s *Service) ChangeState(ctx context.Context, charID, fairyID int64, newState int) (*StateChange, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return nil, ErrFairyMissing
	}
	if newState != fairyStateGuard {
		newState = fairyStateRest
	}
	f.State = newState
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	resCode := 0
	if newState == fairyStateGuard {
		resCode = s.skinResCode(ctx, charID, f.Tid)
	}
	return &StateChange{CharID: charID, FairyID: fairyID, State: newState, ResCode: resCode}, nil
}

func (s *Service) Delete(ctx context.Context, charID, fairyID int64) error {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	if _, ok := state.fairy(fairyID); !ok {
		return ErrFairyMissing
	}
	delete(state.Fairies, fairyID)
	return s.saveState(ctx, charID, state)
}

func (s *Service) nextSkillSlot(f *Fairy) string {
	for i := 0; i < 20; i++ {
		key := "s" + strconv.Itoa(i+1)
		if _, ok := f.SkillFlag[key]; !ok {
			return key
		}
	}
	return ""
}

func (s *Service) skinResCode(ctx context.Context, charID int64, tid int) int {
	skin, err := s.loadSkinState(ctx, charID)
	if err != nil {
		return tid
	}
	if skin.ActFairy > 0 {
		return skin.ActFairy
	}
	return tid
}
