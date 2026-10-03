// Open-sourced by BaoLT

package guild

import "time"

type GuildApplication struct {
	ID             int64
	GuildID        int64
	CharacterID    int64
	CharacterName  string
	CharacterClass int
	CharacterLevel int
	CharacterExp   int64
	Message        string
	Status         int
	CreatedAt      time.Time
	ProcessedAt    *time.Time
	ProcessedBy    *int64
	Online         bool
}

type GuildWarehouseSlot struct {
	ID         int64
	GuildID    int64
	SlotIndex  int
	TemplateID int
	StackCount int
}

func (a *GuildApplication) ToDTO() map[string]interface{} {
	status := 0
	if a.Online {
		status = 1
	}

	return map[string]interface{}{
		"id":            a.ID,
		"tableId":       a.ID,
		"gid":           a.GuildID,
		"cid":           a.CharacterID,
		"rank":          RankApplicant,
		"status":        status,
		"name":          a.CharacterName,
		"level":         a.CharacterLevel,
		"class":         a.CharacterClass,
		"memberClass":   a.CharacterClass,
		"note":          a.Note(),
		"normalContrib": 0,
		"donateContrib": 0,
	}
}

func (a *GuildApplication) Note() string {
	return a.CharacterName + "|" + itoa(a.CharacterClass) + "|" + itoa64(a.CharacterExp)
}

func (s *GuildWarehouseSlot) ToDTO() map[string]interface{} {
	sid := 500 + s.SlotIndex + 1
	return map[string]interface{}{
		"id":       s.ID,
		"sid":      sid,
		"type":     28,
		"itemId":   sid,
		"stackNum": s.StackCount,
		"tid":      s.TemplateID,
	}
}
