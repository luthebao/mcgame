// Open-sourced by BaoLT

// Repository interfaces for battle persistence.
// BattleRepository handles active in-memory battles.
// BattleLogRepository handles completed battle logs in database.
package combat

import (
	"context"
)

type BattleRepository interface {
	GetByID(battleID string) (*Battle, error)
	GetByParticipant(participantID string) (*Battle, error)
	Store(battle *Battle) error
	Remove(battleID string) error
	GetAllActive() []*Battle
}

type BattleLogRepository interface {
	CreateInitial(ctx context.Context, battle *Battle) (int64, error)
	Save(ctx context.Context, battle *Battle) error
	FindByID(ctx context.Context, id int64) (*BattleLog, error)
	FindByParticipant(ctx context.Context, characterID string, limit int) ([]*BattleLog, error)
	FindRecent(ctx context.Context, limit int) ([]*BattleLog, error)
}

type BattleLog struct {
	ID           int64
	BattleType   BattleType
	Participants []ParticipantLog
	Actions      []ActionLog
	Result       ResultLog
	CreatedAt    string
}

type ParticipantLog struct {
	ID      string `json:"id"`
	Name    string `json:"name"`
	Side    int    `json:"side"`
	IsNPC   bool   `json:"isNpc"`
	Level   int    `json:"level"`
	MaxHP   int    `json:"maxHp"`
	FinalHP int    `json:"finalHp"`
}

type ActionLog struct {
	Round      int    `json:"round"`
	ActorID    string `json:"actorId"`
	ActionType int    `json:"actionType"`
	SkillID    int    `json:"skillId"`
	TargetID   string `json:"targetId"`
	Damage     int    `json:"damage"`
	IsCritical bool   `json:"isCritical"`
	IsMiss     bool   `json:"isMiss"`
}

type ResultLog struct {
	WinnerSide  int         `json:"winner"`
	ExpReward   int64       `json:"exp"`
	MoneyReward int64       `json:"money"`
	ItemRewards []ItemDrop  `json:"items"`
	PetRewards  []PetReward `json:"pets"`
	BattleTime  int         `json:"battleTime"`
}
