// Open-sourced by BaoLT

// Battle position system for the 5x4 grid layout.
// Positions 0-9 are enemy side (LEFT), positions 10-19 are player side (RIGHT).
// Grid layout:
//
//	       Col0  Col1  Col2  Col3  Col4
//	      +-----+-----+-----+-----+-----+
//	Row 0 |  4  |  2  |  0  |  1  |  3  |  Enemy Characters
//	      +-----+-----+-----+-----+-----+
//	Row 1 |  9  |  7  |  5  |  6  |  8  |  Enemy Pets
//	      +-----+-----+-----+-----+-----+
//	Row 2 | 18  | 16  | 15  | 17  | 19  |  Player Pets
//	      +-----+-----+-----+-----+-----+
//	Row 3 | 13  | 11  | 10  | 12  | 14  |  Player Characters
//	      +-----+-----+-----+-----+-----+
package combat

type BattlePosition int

const (
	PosEnemyCharCenter  BattlePosition = 0
	PosEnemyCharRight1  BattlePosition = 1
	PosEnemyCharLeft1   BattlePosition = 2
	PosEnemyCharRight2  BattlePosition = 3
	PosEnemyCharLeft2   BattlePosition = 4
	PosEnemyPetCenter   BattlePosition = 5
	PosEnemyPetRight1   BattlePosition = 6
	PosEnemyPetLeft1    BattlePosition = 7
	PosEnemyPetRight2   BattlePosition = 8
	PosEnemyPetLeft2    BattlePosition = 9
	PosPlayerCharCenter BattlePosition = 10
	PosPlayerCharLeft1  BattlePosition = 11
	PosPlayerCharRight1 BattlePosition = 12
	PosPlayerCharLeft2  BattlePosition = 13
	PosPlayerCharRight2 BattlePosition = 14
	PosPlayerPetCenter  BattlePosition = 15
	PosPlayerPetLeft1   BattlePosition = 16
	PosPlayerPetRight1  BattlePosition = 17
	PosPlayerPetLeft2   BattlePosition = 18
	PosPlayerPetRight2  BattlePosition = 19
)

var (
	PlayerCharPositions = []BattlePosition{10, 11, 12, 13, 14}
	PlayerPetPositions  = []BattlePosition{15, 16, 17, 18, 19}
	EnemyCharPositions  = []BattlePosition{0, 2, 1, 4, 3}
	EnemyPetPositions   = []BattlePosition{5, 7, 6, 9, 8}
)

type GridCoord struct {
	X int
	Y int
}

var BattleGridCoords = map[BattlePosition]GridCoord{
	0:  {X: 2, Y: 0},
	1:  {X: 3, Y: 0},
	2:  {X: 1, Y: 0},
	3:  {X: 4, Y: 0},
	4:  {X: 0, Y: 0},
	5:  {X: 2, Y: 1},
	6:  {X: 3, Y: 1},
	7:  {X: 1, Y: 1},
	8:  {X: 4, Y: 1},
	9:  {X: 0, Y: 1},
	10: {X: 2, Y: 3},
	11: {X: 1, Y: 3},
	12: {X: 3, Y: 3},
	13: {X: 0, Y: 3},
	14: {X: 4, Y: 3},
	15: {X: 2, Y: 2},
	16: {X: 1, Y: 2},
	17: {X: 3, Y: 2},
	18: {X: 0, Y: 2},
	19: {X: 4, Y: 2},
}

type PositionAllocator struct {
	used map[BattlePosition]bool
}

func NewPositionAllocator() *PositionAllocator {
	return &PositionAllocator{
		used: make(map[BattlePosition]bool),
	}
}

func (pa *PositionAllocator) AllocatePlayerChar() (BattlePosition, bool) {
	return pa.allocateFrom(PlayerCharPositions)
}

func (pa *PositionAllocator) AllocatePlayerPet() (BattlePosition, bool) {
	return pa.allocateFrom(PlayerPetPositions)
}

func (pa *PositionAllocator) AllocateEnemyChar() (BattlePosition, bool) {
	return pa.allocateFrom(EnemyCharPositions)
}

func (pa *PositionAllocator) AllocateEnemyPet() (BattlePosition, bool) {
	return pa.allocateFrom(EnemyPetPositions)
}

func (pa *PositionAllocator) AllocatePlayerAny() (BattlePosition, bool) {
	pos, ok := pa.allocateFrom(PlayerCharPositions)
	if ok {
		return pos, true
	}
	return pa.allocateFrom(PlayerPetPositions)
}

func (pa *PositionAllocator) AllocateEnemyAny() (BattlePosition, bool) {
	pos, ok := pa.allocateFrom(EnemyCharPositions)
	if ok {
		return pos, true
	}
	return pa.allocateFrom(EnemyPetPositions)
}

func (pa *PositionAllocator) allocateFrom(positions []BattlePosition) (BattlePosition, bool) {
	for _, pos := range positions {
		if !pa.used[pos] {
			pa.used[pos] = true
			return pos, true
		}
	}
	return 0, false
}

func (pa *PositionAllocator) Reserve(pos BattlePosition) bool {
	if pa.used[pos] {
		return false
	}
	pa.used[pos] = true
	return true
}

func (pa *PositionAllocator) Release(pos BattlePosition) {
	delete(pa.used, pos)
}

func (pa *PositionAllocator) IsUsed(pos BattlePosition) bool {
	return pa.used[pos]
}

func (pos BattlePosition) IsPlayerSide() bool {
	return pos >= 10 && pos <= 19
}

func (pos BattlePosition) IsEnemySide() bool {
	return pos >= 0 && pos <= 9
}

func (pos BattlePosition) IsCharacterRow() bool {
	coord, ok := BattleGridCoords[pos]
	if !ok {
		return false
	}
	return coord.Y == 0 || coord.Y == 3
}

func (pos BattlePosition) IsPetRow() bool {
	coord, ok := BattleGridCoords[pos]
	if !ok {
		return false
	}
	return coord.Y == 1 || coord.Y == 2
}

func (pos BattlePosition) GetGridCoord() (GridCoord, bool) {
	coord, ok := BattleGridCoords[pos]
	return coord, ok
}

func (pos BattlePosition) IsFrontRow() bool {
	coord, ok := BattleGridCoords[pos]
	if !ok {
		return false
	}
	if pos.IsPlayerSide() {
		return coord.Y == 2
	}
	return coord.Y == 0
}

func (pos BattlePosition) IsBackRow() bool {
	coord, ok := BattleGridCoords[pos]
	if !ok {
		return false
	}
	if pos.IsPlayerSide() {
		return coord.Y == 3
	}
	return coord.Y == 1
}

func (pos BattlePosition) ToInt() int {
	return int(pos)
}
