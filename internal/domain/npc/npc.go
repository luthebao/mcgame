// Open-sourced by BaoLT

// NPC entity represents non-player characters in the game world.
// Uses creature.NPCType from the base model for client-aligned type IDs.
// Tracks position, dialog references, and active spawn state.
package npc

import "mcgame-server/internal/domain/creature"

type NPC struct {
	ID          int
	TemplateID  int
	Name        string
	MapID       int
	PosX        int
	PosY        int
	Direction   int
	NPCType     creature.NPCType
	DialogID    int
	RespawnTime int
	IsActive    bool
}

func NewNPC(templateID int, name string, mapID, posX, posY int, npcType creature.NPCType) *NPC {
	return &NPC{
		TemplateID:  templateID,
		Name:        name,
		MapID:       mapID,
		PosX:        posX,
		PosY:        posY,
		Direction:   0,
		NPCType:     npcType,
		RespawnTime: 0,
		IsActive:    true,
	}
}

func (n *NPC) IsShop() bool {
	return n.NPCType == creature.NPCTypeShop
}

func (n *NPC) IsQuestGiver() bool {
	return n.NPCType == creature.NPCTypeQuest
}

func (n *NPC) IsBoss() bool {
	return n.NPCType == creature.NPCTypeBoss
}

func (n *NPC) IsHeal() bool {
	return n.NPCType == creature.NPCTypeHeal
}

func (n *NPC) IsTransport() bool {
	return n.NPCType == creature.NPCTypeTransport
}

func (n *NPC) IsTutor() bool {
	return n.NPCType == creature.NPCTypeTutor
}

func (n *NPC) ToDTO() map[string]interface{} {
	return map[string]interface{}{
		"eid":      n.ID,
		"tplId":    n.TemplateID,
		"name":     n.Name,
		"mapId":    n.MapID,
		"posX":     n.PosX,
		"posY":     n.PosY,
		"dir":      n.Direction,
		"npcType":  n.NPCType,
		"dialogId": n.DialogID,
		"isActive": n.IsActive,
	}
}
