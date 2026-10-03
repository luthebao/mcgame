// Open-sourced by BaoLT

// LoopState tracks a character's progress through a TBL_QUEST_LOOP series.
// Mirrors the Flash client's player.loopList[id] entry (QuestManager.as
// onTakeLoop/onFinishLoopQuest/onCancelLoopQuest handlers), where id == qid
// == the TBL_QUEST_LOOP lid by convention.
package quest

import (
	"context"
	"time"
)

type LoopState struct {
	ID            int64
	CharacterID   int64
	LoopID        int
	Ft            int
	TakeDateMs    int64
	Active        bool
	ActiveQuestID int
	UpdatedAt     time.Time
}

func NewLoopState(characterID int64, loopID int, takeDateMs int64) *LoopState {
	return &LoopState{
		CharacterID: characterID,
		LoopID:      loopID,
		Active:      true,
		TakeDateMs:  takeDateMs,
	}
}

// ToClientDTO builds the {id, qid, takeDate, ft, finished} shape the client
// stores at player.loopList[id]/initQuestManager's "l" field.
func (s *LoopState) ToClientDTO() map[string]interface{} {
	return map[string]interface{}{
		"id":       s.LoopID,
		"qid":      s.LoopID,
		"takeDate": s.TakeDateMs,
		"ft":       s.Ft,
		"finished": 0,
	}
}

// CooldownEndsAtMs returns when the retake cooldown elapses, anchored at the
// original TakeDateMs — both cancel and full-cycle completion reuse it
// rather than resetting the anchor, mirroring the client countdown.
func (s *LoopState) CooldownEndsAtMs(refreshSeconds int) int64 {
	return s.TakeDateMs + int64(refreshSeconds)*1000
}

type LoopRepository interface {
	GetAll(ctx context.Context, characterID int64) ([]*LoopState, error)
	Upsert(ctx context.Context, state *LoopState) (*LoopState, error)
	Deactivate(ctx context.Context, characterID int64, loopID int) (bool, error)
}
