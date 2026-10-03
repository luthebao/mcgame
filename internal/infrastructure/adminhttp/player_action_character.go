// Open-sourced by BaoLT

// Admin character stat actions: attributes, progression, combat stats, life skills.
// Each action maps 1:1 to a post-split player-schema sub-table.
package adminhttp

import (
	"context"
	"encoding/json"
	"errors"
	"net/http"

	"mcgame-server/internal/domain/character"
)

type setAttributesPayload struct {
	Strength                 *int `json:"strength,omitempty"`
	Agility                  *int `json:"agility,omitempty"`
	Stamina                  *int `json:"stamina,omitempty"`
	Intelligence             *int `json:"intelligence,omitempty"`
	Spirit                   *int `json:"spirit,omitempty"`
	AttrPoints               *int `json:"attrPoints,omitempty"`
	MaxAttrPoints            *int `json:"maxAttrPoints,omitempty"`
	DistributedAttrPoints    *int `json:"distributedAttrPoints,omitempty"`
	HP                       *int `json:"hp,omitempty"`
	MP                       *int `json:"mp,omitempty"`
	SP                       *int `json:"sp,omitempty"`
	AptStrength              *int `json:"aptStrength,omitempty"`
	AptStrengthEvolution     *int `json:"aptStrengthEvolution,omitempty"`
	AptAgility               *int `json:"aptAgility,omitempty"`
	AptAgilityEvolution      *int `json:"aptAgilityEvolution,omitempty"`
	AptStamina               *int `json:"aptStamina,omitempty"`
	AptStaminaEvolution      *int `json:"aptStaminaEvolution,omitempty"`
	AptIntelligence          *int `json:"aptIntelligence,omitempty"`
	AptIntelligenceEvolution *int `json:"aptIntelligenceEvolution,omitempty"`
	AptEnergy                *int `json:"aptEnergy,omitempty"`
	AptEnergyEvolution       *int `json:"aptEnergyEvolution,omitempty"`
	// Backward-compat: clients that still send level/experience here are
	// redirected into the character_progression path.
	Level      *int   `json:"level,omitempty"`
	Experience *int64 `json:"experience,omitempty"`
}

type setProgressionPayload struct {
	Level            *int   `json:"level,omitempty"`
	Experience       *int64 `json:"experience,omitempty"`
	RebirthLevel     *int   `json:"rebirthLevel,omitempty"`
	RebirthExp       *int64 `json:"rebirthExp,omitempty"`
	AwakenLevel      *int   `json:"awakenLevel,omitempty"`
	AwakenPoints     *int   `json:"awakenPoints,omitempty"`
	AwakenPointsUsed *int   `json:"awakenPointsUsed,omitempty"`
	SoulLevel        *int   `json:"soulLevel,omitempty"`
	SoulExp          *int64 `json:"soulExp,omitempty"`
	SoulPoints       *int64 `json:"soulPoints,omitempty"`
}

type advanceProgressionPayload struct {
	LevelDelta      *int   `json:"levelDelta,omitempty"`
	ExperienceDelta *int64 `json:"experienceDelta,omitempty"`
}

type setCombatStatsPayload struct {
	Refresh *bool `json:"refresh,omitempty"`
}

type setLifeSkillsPayload struct {
	CookDex     *int `json:"cookDex,omitempty"`
	FishDex     *int `json:"fishDex,omitempty"`
	HerbDex     *int `json:"herbDex,omitempty"`
	MedicineDex *int `json:"medicineDex,omitempty"`
	PlantDex    *int `json:"plantDex,omitempty"`
}

func (s *Server) executeSetAttributes(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setAttributesPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_attributes payload"})
		return
	}

	changes := map[string]interface{}{}
	addIntChange(changes, "strength", payload.Strength)
	addIntChange(changes, "agility", payload.Agility)
	addIntChange(changes, "stamina", payload.Stamina)
	addIntChange(changes, "intelligence", payload.Intelligence)
	addIntChange(changes, "spirit", payload.Spirit)
	addIntChange(changes, "attrPoints", payload.AttrPoints)
	addIntChange(changes, "maxAttrPoints", payload.MaxAttrPoints)
	addIntChange(changes, "distributedAttrPoints", payload.DistributedAttrPoints)
	addIntChange(changes, "hp", payload.HP)
	addIntChange(changes, "mp", payload.MP)
	addIntChange(changes, "sp", payload.SP)
	addIntChange(changes, "aptStrength", payload.AptStrength)
	addIntChange(changes, "aptStrengthEvolution", payload.AptStrengthEvolution)
	addIntChange(changes, "aptAgility", payload.AptAgility)
	addIntChange(changes, "aptAgilityEvolution", payload.AptAgilityEvolution)
	addIntChange(changes, "aptStamina", payload.AptStamina)
	addIntChange(changes, "aptStaminaEvolution", payload.AptStaminaEvolution)
	addIntChange(changes, "aptIntelligence", payload.AptIntelligence)
	addIntChange(changes, "aptIntelligenceEvolution", payload.AptIntelligenceEvolution)
	addIntChange(changes, "aptEnergy", payload.AptEnergy)
	addIntChange(changes, "aptEnergyEvolution", payload.AptEnergyEvolution)
	addIntChange(changes, "level", payload.Level)
	addInt64Change(changes, "experience", payload.Experience)

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no attributes provided"})
		return
	}

	applyFn := func(c *character.Character) {
		assignInt(&c.Strength, payload.Strength)
		assignInt(&c.Agility, payload.Agility)
		assignInt(&c.Stamina, payload.Stamina)
		assignInt(&c.Intelligence, payload.Intelligence)
		assignInt(&c.Spirit, payload.Spirit)
		assignInt(&c.AttrPoints, payload.AttrPoints)
		assignInt(&c.MaxAttrPoints, payload.MaxAttrPoints)
		assignInt(&c.DistributedAttrPoints, payload.DistributedAttrPoints)
		assignInt(&c.CurrentHP, payload.HP)
		assignInt(&c.CurrentMP, payload.MP)
		assignInt(&c.CurrentSP, payload.SP)
		assignInt(&c.AptStrength, payload.AptStrength)
		assignInt(&c.AptStrengthEvolution, payload.AptStrengthEvolution)
		assignInt(&c.AptAgility, payload.AptAgility)
		assignInt(&c.AptAgilityEvolution, payload.AptAgilityEvolution)
		assignInt(&c.AptStamina, payload.AptStamina)
		assignInt(&c.AptStaminaEvolution, payload.AptStaminaEvolution)
		assignInt(&c.AptIntelligence, payload.AptIntelligence)
		assignInt(&c.AptIntelligenceEvolution, payload.AptIntelligenceEvolution)
		assignInt(&c.AptEnergy, payload.AptEnergy)
		assignInt(&c.AptEnergyEvolution, payload.AptEnergyEvolution)
		assignInt(&c.Level, payload.Level)
		assignInt64(&c.Experience, payload.Experience)
		c.RecalculateStats()
	}

	s.applyCharacterChange(w, "set_attributes", char, applyFn, true, changes)
}

func (s *Server) executeSetProgression(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setProgressionPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_progression payload"})
		return
	}

	changes := map[string]interface{}{}
	addIntChange(changes, "level", payload.Level)
	addInt64Change(changes, "experience", payload.Experience)
	addIntChange(changes, "rebirthLevel", payload.RebirthLevel)
	addInt64Change(changes, "rebirthExp", payload.RebirthExp)
	addIntChange(changes, "awakenLevel", payload.AwakenLevel)
	addIntChange(changes, "awakenPoints", payload.AwakenPoints)
	addIntChange(changes, "awakenPointsUsed", payload.AwakenPointsUsed)
	addIntChange(changes, "soulLevel", payload.SoulLevel)
	addInt64Change(changes, "soulExp", payload.SoulExp)
	addInt64Change(changes, "soulPoints", payload.SoulPoints)

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no progression fields provided"})
		return
	}

	applyFn := func(c *character.Character) {
		if payload.Level != nil {
			applyLevelProgression(c, *payload.Level, changes)
		}
		assignInt64(&c.Experience, payload.Experience)
		assignInt(&c.RebirthLvl, payload.RebirthLevel)
		assignInt64(&c.RebirthExp, payload.RebirthExp)
		assignInt(&c.AwakenLevel, payload.AwakenLevel)
		assignInt(&c.AwakenPoints, payload.AwakenPoints)
		assignInt(&c.AwakenPointsUsed, payload.AwakenPointsUsed)
		assignInt(&c.SoulLevel, payload.SoulLevel)
		assignInt64(&c.SoulExp, payload.SoulExp)
		assignInt64(&c.SoulPoints, payload.SoulPoints)
		if payload.Level != nil {
			c.RecalculateStats()
		}
	}

	s.applyCharacterChange(w, "set_progression", char, applyFn, true, changes)
}

func (s *Server) executeAdvanceProgression(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload advanceProgressionPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid advance_progression payload"})
		return
	}

	if payload.LevelDelta != nil && *payload.LevelDelta <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "levelDelta must be greater than 0"})
		return
	}
	if payload.ExperienceDelta != nil && *payload.ExperienceDelta <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "experienceDelta must be greater than 0"})
		return
	}

	hasChange := false
	if payload.LevelDelta != nil && char.Level < character.MaxLevel {
		hasChange = true
	}
	if payload.ExperienceDelta != nil {
		hasChange = true
	}
	if !hasChange {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no progression changes to apply"})
		return
	}

	changes := map[string]interface{}{}
	applyFn := func(c *character.Character) {
		if payload.LevelDelta != nil {
			applyLevelIncrease(c, *payload.LevelDelta, changes)
		}
		if payload.ExperienceDelta != nil {
			applyExperienceIncrease(c, *payload.ExperienceDelta, changes)
		}
	}

	s.applyCharacterChange(w, "advance_progression", char, applyFn, true, changes)
}

func applyLevelProgression(c *character.Character, targetLevel int, changes map[string]interface{}) {
	if targetLevel > character.MaxLevel {
		targetLevel = character.MaxLevel
	}
	if targetLevel < 1 {
		targetLevel = 1
	}
	if targetLevel <= c.Level {
		c.Level = targetLevel
		c.Experience = 0
		changes["level"] = targetLevel
		return
	}

	delta := targetLevel - c.Level
	autoDistribute := character.AutoLevelCap - c.Level
	if autoDistribute > delta {
		autoDistribute = delta
	}
	if autoDistribute < 0 {
		autoDistribute = 0
	}

	c.Level = targetLevel
	c.Experience = 0
	c.AttrPoints += delta * character.AttributePointsPerLevel
	c.MaxAttrPoints += delta * character.AttributePointsPerLevel
	c.Strength += autoDistribute
	c.Agility += autoDistribute
	c.Stamina += autoDistribute
	c.Intelligence += autoDistribute
	c.Spirit += autoDistribute

	changes["level"] = targetLevel
	changes["attrPointsGained"] = delta * character.AttributePointsPerLevel
	changes["statsAutoDistributed"] = autoDistribute
}

func applyLevelIncrease(c *character.Character, levelDelta int, changes map[string]interface{}) {
	if levelDelta <= 0 || c.Level >= character.MaxLevel {
		return
	}

	startLevel := c.Level
	targetLevel := startLevel + levelDelta
	if targetLevel > character.MaxLevel {
		targetLevel = character.MaxLevel
	}
	if !c.RaiseLevelTo(targetLevel) {
		return
	}

	changes["levelDelta"] = c.Level - startLevel
	changes["level"] = c.Level
	changes["experience"] = c.Experience
	changes["attrPoints"] = c.AttrPoints
	changes["maxAttrPoints"] = c.MaxAttrPoints
}

func applyExperienceIncrease(c *character.Character, experienceDelta int64, changes map[string]interface{}) {
	if experienceDelta <= 0 {
		return
	}

	leveledUp := c.GainExperience(experienceDelta)
	changes["experienceDelta"] = experienceDelta
	changes["experience"] = c.Experience
	changes["leveledUp"] = leveledUp
	changes["level"] = c.Level
	changes["attrPoints"] = c.AttrPoints
	changes["maxAttrPoints"] = c.MaxAttrPoints
}

func (s *Server) executeSetCombatStats(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	payload, err := parseSetCombatStatsPayload(raw)
	if err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_combat_stats payload"})
		return
	}

	refresh := true
	if payload.Refresh != nil {
		refresh = *payload.Refresh
	}
	if !refresh {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "refresh must be true"})
		return
	}

	changes := map[string]interface{}{"refresh": true}
	applyFn := func(c *character.Character) {
		c.RefreshRuntimeStats()
	}

	s.applyCharacterChange(w, "set_combat_stats", char, applyFn, true, changes)
}

func parseSetCombatStatsPayload(raw json.RawMessage) (setCombatStatsPayload, error) {
	if len(raw) == 0 {
		return setCombatStatsPayload{}, nil
	}

	var payloadMap map[string]json.RawMessage
	if err := json.Unmarshal(raw, &payloadMap); err != nil {
		return setCombatStatsPayload{}, err
	}

	for key := range payloadMap {
		if key != "refresh" {
			return setCombatStatsPayload{}, errors.New("derived combat stats are read-only")
		}
	}

	var payload setCombatStatsPayload
	if refreshRaw, ok := payloadMap["refresh"]; ok {
		if err := json.Unmarshal(refreshRaw, &payload.Refresh); err != nil {
			return setCombatStatsPayload{}, err
		}
	}

	return payload, nil
}

func (s *Server) executeSetLifeSkills(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setLifeSkillsPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_life_skills payload"})
		return
	}

	changes := map[string]interface{}{}
	addIntChange(changes, "cookDex", payload.CookDex)
	addIntChange(changes, "fishDex", payload.FishDex)
	addIntChange(changes, "herbDex", payload.HerbDex)
	addIntChange(changes, "medicineDex", payload.MedicineDex)
	addIntChange(changes, "plantDex", payload.PlantDex)

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no life skills provided"})
		return
	}

	applyFn := func(c *character.Character) {
		assignInt(&c.CookDex, payload.CookDex)
		assignInt(&c.FishDex, payload.FishDex)
		assignInt(&c.HerbDex, payload.HerbDex)
		assignInt(&c.MedicineDex, payload.MedicineDex)
		assignInt(&c.PlantDex, payload.PlantDex)
	}

	s.applyCharacterChange(w, "set_life_skills", char, applyFn, true, changes)
}

func addIntChange(m map[string]interface{}, key string, v *int) {
	if v != nil {
		m[key] = *v
	}
}

func addInt64Change(m map[string]interface{}, key string, v *int64) {
	if v != nil {
		m[key] = *v
	}
}

func assignInt(dst *int, v *int) {
	if v != nil {
		*dst = *v
	}
}

func assignInt64(dst *int64, v *int64) {
	if v != nil {
		*dst = *v
	}
}
