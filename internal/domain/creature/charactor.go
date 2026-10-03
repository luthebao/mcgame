// Open-sourced by BaoLT

// Charactor extends Creature matching Flash client Charactor.as.
// Spelling preserved to match client RPC field names.
package creature

type CharactorState int

const (
	StateNormal      CharactorState = 1
	StateRunning     CharactorState = 2
	StateShopping    CharactorState = 3
	StateTrade       CharactorState = 4
	StateBattle      CharactorState = 5
	StateLevelUp     CharactorState = 6
	StateChangingMap CharactorState = 7
	StateMake        CharactorState = 8
	StateBank        CharactorState = 9
	StateMail        CharactorState = 10
	StateAuction     CharactorState = 11
	StateChaPanel    CharactorState = 12
	StateProduct     CharactorState = 13
	StateWatch       CharactorState = 14
	StateBusy        CharactorState = 15
	StateHangUp      CharactorState = 16
	StateFishing     CharactorState = 26
	StateHarvest     CharactorState = 27
	StateHerb        CharactorState = 28
)

type Charactor struct {
	Creature

	Exp      int64
	ExpRe    int64
	LevelRe  int
	PosMapID int

	State       CharactorState
	ActionState CharactorState

	InGroup   bool
	IsLeader  bool
	GroupAfk  bool
	TaskSweep bool

	Honor  int64
	Chival int64

	GmLevel int
	PmLevel int

	Star int
	VipT int

	StQuest    int
	StTrade    int
	StItem     int
	StBehavior int
	StBattle   int

	ActT  int
	ActTN string

	Ct   string
	Cts  string
	BroT string

	Ee string
	Ef bool
	En int

	Wp int64

	DecoInfo map[string]interface{}
	PrsUseID int64
}

func NewCharactor(id int64, name string) Charactor {
	return Charactor{
		Creature:    NewCreature(id, name, TypeCharactor),
		State:       StateNormal,
		ActionState: StateNormal,
	}
}
