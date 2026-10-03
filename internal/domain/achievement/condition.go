// Open-sourced by BaoLT

// Achievement condition types mirror template-driven event categories.
package achievement

type ConditionType int

const (
	ConditionTypeUnknown ConditionType = iota
	ConditionTypeKillCreature
	ConditionTypeReachLevel
	ConditionTypeCompleteQuest
	ConditionTypeAccumulateCurrency
	ConditionTypeItemCount
	ConditionTypeGather
	ConditionTypeCraft
	ConditionTypeLoginStreak
	ConditionTypePVPWin
)
