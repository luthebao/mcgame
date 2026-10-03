// Open-sourced by BaoLT

package magicweapon

const (
	ItemKind = 8

	ItemTypeMain = 800
	ItemTypeSub  = 801
)

const (
	SlotPositionMain  = 15
	SlotPositionSub1  = 16
	SlotPositionSub2  = 17
	SlotPositionSub3  = 18
	SlotPositionSub4  = 19
	SlotPositionSub5  = 20
	SlotPositionFirst = SlotPositionMain
	SlotPositionLast  = SlotPositionSub5
)

const (
	StoneRepair    = 510
	StoneSkill     = 511
	StoneTrans     = 514
	StoneProp      = 519
	StoneStageEigh = 522
	StoneSuccinct  = 3740
)

const (
	UpgradeNumPlayerLevel100 = 16
	StageEightLevel          = 20
	MWResetLevelLimit        = 5
	ResetSpiritualityNeed    = 40000
	ResetStoneNeed           = 5
	ActivateGoldCost         = 20
	UnlockPlayerLevel        = 50
)

func IsMainPosition(pos int) bool {
	return pos == SlotPositionMain
}

func IsSubPosition(pos int) bool {
	return pos >= SlotPositionSub1 && pos <= SlotPositionSub5
}

func IsAnyMWPosition(pos int) bool {
	return pos >= SlotPositionFirst && pos <= SlotPositionLast
}

func IsMainItemType(t int) bool {
	return t == ItemTypeMain
}

func IsSubItemType(t int) bool {
	return t == ItemTypeSub
}
