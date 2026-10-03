// Open-sourced by BaoLT

// Base creature model matching Flash client Creature.as hierarchy.
// Maps to client object types from GamePredef TBL_* constants.
package creature

type ObjectType int

const (
	TypeAccount        ObjectType = 0
	TypeAuction        ObjectType = 1
	TypeCharactor      ObjectType = 2
	TypeCreature       ObjectType = 12
	TypeEquiptTemplate ObjectType = 19
	TypeEquiptJewel    ObjectType = 20
	TypeItemInstance   ObjectType = 28
	TypeItemTemplate   ObjectType = 29
	TypeMap            ObjectType = 33
	TypeNPC            ObjectType = 35
	TypePet            ObjectType = 39
	TypeSceneItemInst  ObjectType = 49
	TypeSceneItemTpl   ObjectType = 50
	TypeBuilding       ObjectType = 70
)

type FlyingState int

const (
	FlyingOnGround  FlyingState = 0
	FlyingTakingOff FlyingState = 1
	FlyingInTheAir  FlyingState = 2
	FlyingPreLand   FlyingState = 3
	FlyingLanding   FlyingState = 4
	FlyingDoubleFly FlyingState = 5
)

type MountState int

const (
	MountOff MountState = 0
	MountOn  MountState = 1
)

type Creature struct {
	ID   int64
	Name string
	Type ObjectType

	Element   int
	Level     int
	Gender    int
	ClassID   int
	ColorCode int

	IconCode   int64
	ResCode    int64
	BrightCode int

	HP        int
	HPMax     int
	MP        int
	MPMax     int
	SP        int
	SPMax     int
	CurrentHP int
	CurrentMP int
	CurrentSP int

	PosX   float64
	PosY   float64
	PosDir int
	Dir    int

	AptStrength     int
	AptAgility      int
	AptStamina      int
	AptIntelligence int
	AptEnergy       int
	GrowBase        int
	QLevel          int
	Catchable       int
	Life            int

	BossFlag   int
	NpcFlag    bool
	BattleID   int
	LeagueIcon int

	WingResCode           int64
	FlyerResCode          int64
	FlyerFrontResCode     int64
	MountResCode          int64
	DressResCode          int64
	DecoHeadCode          int64
	DecoBottomCode        int64
	DecoFootCode          int64
	DecoLightCode         int64
	DecoLightMaskCode     int64
	DecoBottomCodeOnMount int64

	FlyingState FlyingState
	MountState  MountState
	WithCloud   int
	DoubleFly   bool

	Fairy    map[string]interface{}
	Property map[string]interface{}
}

func NewCreature(id int64, name string, objType ObjectType) Creature {
	return Creature{
		ID:         id,
		Name:       name,
		Type:       objType,
		LeagueIcon: -1,
	}
}
