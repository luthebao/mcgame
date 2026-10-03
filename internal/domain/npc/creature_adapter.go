// Open-sourced by BaoLT

// NPC creature adapter.
package npc

import "mcgame-server/internal/domain/creature"

func (n *NPC) ToCreatureModel() creature.NPC {
	model := creature.NewNPC(int64(n.ID), n.Name, n.NPCType)
	model.PosMapID = n.MapID
	model.PosX = float64(n.PosX)
	model.PosY = float64(n.PosY)
	model.Dir = n.Direction
	model.ResCode = int64(n.TemplateID)
	return model
}
