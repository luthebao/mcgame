// Open-sourced by BaoLT

package character

import "strconv"

var noisyUPPFields = []string{
	"bagSlotNum",
	"bankSlotNum",
	"petMaxNum",
	"honor",
	"chival",
	"pop",
	"expRe",
	"expBattle",
}

func BuildViewPropertiesFromBase(char *Character) map[string]interface{} {
	if char == nil {
		return map[string]interface{}{}
	}

	base := *char
	base.RecalculateStats()
	base.syncFinalFields()

	return buildViewProps(char, &base)
}

func BuildViewPropertiesWithEquipment(char *Character, bonuses EquipmentStatBonuses) map[string]interface{} {
	if char == nil {
		return map[string]interface{}{}
	}

	base := *char
	base.RecalculateStats()
	base.ApplyEquipmentBonuses(bonuses)

	return buildViewProps(char, &base)
}

func buildViewProps(char *Character, base *Character) map[string]interface{} {
	props := base.ToDTO()
	props["hpMax"] = base.MaxHP
	props["mpMax"] = base.MaxMP
	props["spMax"] = base.MaxSP
	props["propHit"] = base.Hit
	props["propDodge"] = base.Dodge
	props["propCritical"] = base.Critical
	props["propSpeed"] = base.Speed
	props["finalHp"] = base.MaxHP
	props["finalMp"] = base.MaxMP
	props["finalSp"] = base.MaxSP
	props["finalAttack"] = base.Attack
	props["finalMAttack"] = base.MagicAttack
	props["finalDefence"] = base.Defense
	props["finalMDefence"] = base.MagicDefense
	props["finalHit"] = base.Hit
	props["finalCritical"] = base.Critical
	props["finalDodge"] = base.Dodge
	props["finalSpeed"] = base.Speed
	props["finalStrength"] = base.FinalStrength
	props["finalAgility"] = base.FinalAgility
	props["finalStamina"] = base.FinalStamina
	props["finalIntelligence"] = base.FinalIntelligence
	props["finalEnergy"] = base.FinalEnergy
	props["attLastPoint"] = char.AttrPoints

	lastPoint := char.LastPoint
	if lastPoint == "" || lastPoint == "0" {
		lastPoint = strconv.Itoa(char.AttrPoints)
	}
	props["lastPoint"] = lastPoint

	spirituality := char.Spirituality
	if spirituality == "" {
		spirituality = "0"
	}
	props["spirituality"] = spirituality

	if props["ee"] == "" {
		props["ee"] = "0"
	}
	if _, ok := props["en"]; !ok {
		props["en"] = 0
	}
	if _, ok := props["ef"]; !ok {
		props["ef"] = false
	}

	return props
}

func BuildUPPPayload(char *Character) map[string]interface{} {
	return buildUPPPayloadFromProps(char, BuildViewPropertiesFromBase(char))
}

func BuildUPPPayloadWithEquipment(char *Character, bonuses EquipmentStatBonuses) map[string]interface{} {
	return buildUPPPayloadFromProps(char, BuildViewPropertiesWithEquipment(char, bonuses))
}

func BuildStatRefreshUPPPayload(char *Character) map[string]interface{} {
	payload := BuildUPPPayload(char)
	removeNoisyUPPFields(payload)
	return payload
}

func BuildStatRefreshUPPPayloadWithEquipment(char *Character, bonuses EquipmentStatBonuses) map[string]interface{} {
	payload := BuildUPPPayloadWithEquipment(char, bonuses)
	removeNoisyUPPFields(payload)
	return payload
}

func removeNoisyUPPFields(payload map[string]interface{}) {
	for _, key := range noisyUPPFields {
		delete(payload, key)
	}
}

func buildUPPPayloadFromProps(char *Character, props map[string]interface{}) map[string]interface{} {
	if char == nil {
		return map[string]interface{}{}
	}

	payload := char.ToDTO()
	for key, value := range props {
		payload[key] = value
	}
	payload["property"] = props
	payload["attLastPoint"] = char.AttrPoints
	payload["lastPoint"] = props["lastPoint"]
	payload["spirituality"] = props["spirituality"]

	return payload
}
