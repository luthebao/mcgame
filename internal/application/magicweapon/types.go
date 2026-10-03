// Open-sourced by BaoLT

package magicweapon

import "mcgame-server/internal/domain/magicweapon"

type PendingPropReset struct {
	ItemID          int64
	NewMainPropNum1 float64
	OldMainPropNum1 float64
	NewMainPropNum2 float64
	OldMainPropNum2 float64
}

type PendingSuccinct struct {
	ItemID  int64
	NewProp *magicweapon.SubFlag
	LockArr [3]bool
}

type UpgradeResult struct {
	Success     bool
	NewLevel    int
	NextRequire int64
	ColorCode   int
	FailType    int
	Message     string
}

type RepairResult struct {
	Success         bool
	StoneRemaining  int
	WasEquipped     bool
}

type SkillResetResult struct {
	Success         bool
	StoneRemaining  int
	NewSkillID      int
	WasEquipped     bool
}

type StageResult struct {
	Success         bool
	Message         string
	ItemID          int64
	FlagStr         string
	NewPropNum1     float64
	NewPropNum2     float64
	StoneRemaining  int
	WasEquipped     bool
}

type ResetPropPreviewResult struct {
	Success         bool
	StoneRemaining  int
	Preview         *PendingPropReset
}

type ResetPropApplyResult struct {
	Applied         bool
	ItemID          int64
	WasEquipped     bool
}

type QueryResetMaxResult struct {
	Success           bool
	MaxMainPropNum1   float64
	MaxMainPropNum2   float64
}

type ResolveResult struct {
	Success      bool
	MaterialType int
	MaterialTID  int
	StackNum     int
	TempQuality  int
	WasEquipped  bool
}

type TransResult struct {
	Success         bool
	Message         string
	StoneRemaining  int
	WasEquipped     bool
}

type SuccinctRollResult struct {
	NewProp *magicweapon.SubFlag
	LockArr [3]bool
}

type SuccinctSureResult struct {
	Flag        *magicweapon.SubFlag
	SaveOK      bool
	WasEquipped bool
	Discarded   bool
	HadPending  bool
}

type ActivateResult struct {
	Failed      bool
	Index       int
	Slot        *magicweapon.SuccinctSlot
	WasEquipped bool
	Gold        int64
	GoldBind    int64
	UsedBound   bool
}
