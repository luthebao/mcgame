// Open-sourced by BaoLT

// Objective entity represents a single quest objective.
// Mirrors the TBL_QUEST_REQUIRE (kind, type, q, num) tuple used by the Flash
// client (com/qeedoo/game/data/Player.as canTakeQuest, QuestPanel.as
// checkBag/checkEquipt/checkPet, QuestCanvas.as objective tracker).
package quest

type ObjectiveType int

const (
	ObjectiveKillMonster ObjectiveType = 1
	ObjectiveCollectItem ObjectiveType = 2
	ObjectiveTalkToNPC   ObjectiveType = 3
	ObjectiveReachLevel  ObjectiveType = 4
	ObjectiveExploreArea ObjectiveType = 5
	ObjectiveUseItem     ObjectiveType = 6
	ObjectiveWinBattle   ObjectiveType = 7
	ObjectiveSubmitPet   ObjectiveType = 8
)

// Flash kind constants from GamePredef.QUEST_REQUIRE_*.
const (
	RequireKindItem     = 1
	RequireKindCreature = 2
	RequireKindPet      = 3
)

// Flash table-id constants relevant to quest requirements.
const (
	TableIDCreature       = 12
	TableIDEquiptTemplate = 19
	TableIDItemTemplate   = 29
)

type Objective struct {
	Type ObjectiveType `json:"type"`
	// Target is the TBL_QUEST_REQUIRE itemId — either a creature ID
	// (kill/pet) or an item/equipment template ID (collect).
	Target int `json:"target"`
	// Current is the cached progress count maintained server-side.
	Current  int `json:"current"`
	Required int `json:"required"`
	// ItemTableType mirrors the row's `type` field for collect objectives:
	// 29 = TBL_ITEM_TEMPLATE (consumable), 19 = TBL_EQUIPT_TEMPLATE.
	// Zero means "not applicable" (kill/pet objectives or legacy rows).
	ItemTableType int `json:"itemTableType,omitempty"`
	// Quality mirrors the row's `q` field. For equipment-collect objectives
	// it selects an exact color tier via getColorByQuality. For pet
	// objectives it is the raw `q`; divide by 10 to get the growRate
	// threshold (see domain/pet.ColorByGrowRate).
	Quality int `json:"quality,omitempty"`
}

func (o *Objective) IsComplete() bool {
	return o.Current >= o.Required
}

func (o *Objective) AddProgress(amount int) {
	o.Current += amount
	if o.Current > o.Required {
		o.Current = o.Required
	}
}

// ClientKind returns the Flash `kind` value the client expects in the
// enriched `require[]` array (Player/Quest UI). It mirrors GamePredef
// constants so the DTO matches what TBL_QUEST_REQUIRE rows contain.
func (o *Objective) ClientKind() int {
	switch o.Type {
	case ObjectiveCollectItem:
		return RequireKindItem
	case ObjectiveKillMonster:
		return RequireKindCreature
	case ObjectiveSubmitPet:
		return RequireKindPet
	}
	return int(o.Type)
}

// ClientTableType returns the Flash `type` value (TBL_* table id) the client
// expects for this objective row.
func (o *Objective) ClientTableType() int {
	switch o.Type {
	case ObjectiveCollectItem:
		if o.ItemTableType != 0 {
			return o.ItemTableType
		}
		return TableIDItemTemplate
	case ObjectiveKillMonster, ObjectiveSubmitPet:
		return TableIDCreature
	}
	return o.ItemTableType
}

func (o *Objective) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"type":     int(o.Type),
		"target":   o.Target,
		"current":  o.Current,
		"required": o.Required,
	}
	if o.ItemTableType != 0 {
		dto["itemTableType"] = o.ItemTableType
	}
	if o.Quality != 0 {
		dto["quality"] = o.Quality
	}
	return dto
}
