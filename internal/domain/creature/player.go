// Open-sourced by BaoLT

// Player extends Charactor matching Flash client Player.as.
package creature

type Player struct {
	Charactor

	AttStrength     int
	AttAgility      int
	AttStamina      int
	AttIntelligence int
	AttEnergy       int

	Money     int64
	MoneyBind int64
	Gold      int64
	GoldBind  int64

	PropCritical    int
	PropHit         int
	PropDodge       int
	PropSpeed       int
	PropDefy        int
	PropCounter     int
	PropCombo       int
	PropReduceHurt1 int
	PropReduceHurt2 int

	ExpBattle int64
	ExpSkill  int64

	PortraitCode int64
	ImgCode      int64

	Reputation int64
	Pop        int
	Bp         int
	Cl         int
	Qn         int

	CreateTime  int64
	TotalOnline int64
	Vigor       int
	MaxVigor    int
	Actpoint    int
	MaxActpoint int
	MovePnt     int
	MaxMovePnt  int

	BagSlotNum  int
	BankSlotNum int
	PetMaxNum   int

	SoulExp      int
	TrainSoulLvl int
	TrainSoulExp int64
	NewGrade     int
	CrystalSid   int

	SoulChip    int
	AchPnt      int
	AwakenLevel int
	AwakenPoint int
	AwakenAdd   int

	DressInfo string
	CpID      int64
	Cp        string

	Guid int64
	Ll   string
	Ti   int64
	Tl   int
	Tn   string
	Tp   int64

	Walkable   bool
	IsHanged   bool
	IsLockedUB bool
	MapSafe    bool

	QuestLog   string
	GuideLog   string
	AchieveLog map[string]interface{}

	Guild       map[string]interface{}
	SkillList   map[string]interface{}
	PetList     map[string]interface{}
	FairyList   map[string]interface{}
	QuestList   map[string]interface{}
	LoopList    map[string]interface{}
	StarsData   map[string]interface{}
	SoulBagData map[string]interface{}
	FarmBag     map[string]interface{}
	TBag        map[string]interface{}

	EquipActiveList map[string]interface{}
}

func NewPlayer(characterID int64, name string) Player {
	p := Player{
		Charactor: NewCharactor(characterID, name),
		Walkable:  true,
		CpID:      -1,
	}
	p.Creature.Type = TypeCharactor
	return p
}
