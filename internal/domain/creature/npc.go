// Open-sourced by BaoLT

// NPC extends Charactor matching Flash client Npc.as.
package creature

type NPCType int

const (
	NPCTypeQuest       NPCType = 1
	NPCTypeShop        NPCType = 2
	NPCTypeMail        NPCType = 3
	NPCTypePlan        NPCType = 4
	NPCTypeAuction     NPCType = 5
	NPCTypeSkill       NPCType = 6
	NPCTypeBank        NPCType = 7
	NPCTypeHeal        NPCType = 8
	NPCTypeTransport   NPCType = 9
	NPCTypeBattle      NPCType = 10
	NPCTypeClassQuest  NPCType = 11
	NPCTypeMat         NPCType = 12
	NPCTypeCallboard   NPCType = 13
	NPCTypeAnswer      NPCType = 14
	NPCTypeBoss        NPCType = 15
	NPCTypeTutor       NPCType = 16
	NPCTypeGuild       NPCType = 17
	NPCTypeBuild       NPCType = 18
	NPCTypeStoryBattle NPCType = 19
	NPCTypeQuestBattle NPCType = 20
	NPCTypeFishPool    NPCType = 21
	NPCTypePlant       NPCType = 22
	NPCTypeHerb        NPCType = 23
	NPCTypeGather      NPCType = 24
	NPCTypeWalk        NPCType = 25
	NPCTypeSynchro     NPCType = 26
	NPCTypeHula        NPCType = 27
	NPCTypeDota        NPCType = 28
	NPCTypeTripleTown  NPCType = 29
)

type NPC struct {
	Charactor

	Nid     int64
	NpcType NPCType
	ShopID  int
	Lv      int
	Layer   int
	MiniMap int
	Mirror  int
	V       int
	Fd      int
	Rf      int64

	SubType       string
	FuncInfo      string
	OnServiceText string
	Busy          bool

	DotaData  map[string]interface{}
	HulaData  map[string]interface{}
	TripleNpc map[string]interface{}
}

func NewNPC(id int64, name string, npcType NPCType) NPC {
	n := NPC{
		Charactor: NewCharactor(id, name),
		NpcType:   npcType,
		MiniMap:   1,
		V:         1,
		Fd:        -1,
	}
	n.Creature.Type = TypeNPC
	return n
}
