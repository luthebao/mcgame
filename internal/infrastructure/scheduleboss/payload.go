// Open-sourced by BaoLT

// AMF payload builder for onBossOn, sourcing pos/resCode from gamedata.Manager.
package scheduleboss

import (
	domainsb "mcgame-server/internal/domain/scheduleboss"
	"mcgame-server/internal/gamedata/models"
)

type NPCTemplateGetter interface {
	GetNPC(id int) *models.NpcTemplate
}

type PayloadBuilder struct {
	npcs NPCTemplateGetter
}

func NewPayloadBuilder(npcs NPCTemplateGetter) *PayloadBuilder {
	return &PayloadBuilder{npcs: npcs}
}

func (b *PayloadBuilder) BuildBossOn(cfg domainsb.BossConfig) map[string]any {
	out := map[string]any{
		"id":   cfg.NID,
		"nid":  cfg.NID,
		"name": cfg.Name,
		"v":    -1,
	}
	if b == nil || b.npcs == nil {
		return out
	}
	tpl := b.npcs.GetNPC(cfg.NID)
	if tpl == nil {
		return out
	}
	out["posX"] = int(tpl.PosX)
	out["posY"] = int(tpl.PosY)
	out["resCode"] = int64(tpl.ResCode)
	out["v"] = int(tpl.V)
	return out
}
