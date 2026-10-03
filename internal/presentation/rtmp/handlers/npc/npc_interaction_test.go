// Open-sourced by BaoLT

package npc

import (
	"context"
	"encoding/json"
	"testing"

	"mcgame-server/internal/domain/creature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func TestNPCInteractionIDFromScript(t *testing.T) {
	npcID, ok := npcInteractionIDFromScript("open_npc_interaction_434")
	if !ok {
		t.Fatalf("expected script func id to parse")
	}
	if npcID != 434 {
		t.Fatalf("expected npc id 434, got %d", npcID)
	}

	if _, ok := npcInteractionIDFromScript("heal_all"); ok {
		t.Fatalf("expected legacy heal_all to not parse as npc interaction id")
	}
}

func TestBuildNPCInteractionData_UsesHealType(t *testing.T) {
	h := NewHandler(nil, nil, nil, nil, nil, zap.NewNop())
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:       413,
		Name:     "Bac Si Ly",
		PosMapID: 2,
		Type:     float64(creature.NPCTypeHeal),
	}

	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}

	h.SetGameDataManager(gameDataManager)

	interaction := h.buildNPCInteractionData(context.Background(), 1, 413)

	if interaction.hasQuest {
		t.Fatalf("expected no quest data for healer fixture")
	}
	if interaction.directShopID != 0 {
		t.Fatalf("expected no shop id, got %d", interaction.directShopID)
	}

	if got := interaction.payload["npcId"]; got != 413 {
		t.Fatalf("expected npcId 413, got %#v", got)
	}
	if got := interaction.payload["npcType"]; got != int(creature.NPCTypeHeal) {
		t.Fatalf("expected npcType %d, got %#v", creature.NPCTypeHeal, got)
	}

	npcQuest, ok := interaction.payload["npcQuest"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected npcQuest payload, got %T", interaction.payload["npcQuest"])
	}
	if got := npcQuest["state"]; got != -1 {
		t.Fatalf("expected npc quest state -1, got %#v", got)
	}
}

func TestIsProductNPC_RequiresGatherType(t *testing.T) {
	questNPC := &models.NpcTemplate{
		ID:      455,
		Name:    "Ve Si Xuat Van",
		Type:    float64(creature.NPCTypeQuest),
		SubType: "13|1720|1721|1722|1723|1724",
	}

	if isProductNPC(questNPC) {
		t.Fatalf("expected quest npc with numeric subtype to not be treated as product npc")
	}

	gatherNPC := &models.NpcTemplate{
		ID:      21,
		Name:    "Nam Tuoi",
		Type:    float64(creature.NPCTypeGather),
		SubType: "1",
	}

	if !isProductNPC(gatherNPC) {
		t.Fatalf("expected gather npc to be treated as product npc")
	}
}

func mustNPCJSON(t *testing.T, value interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("failed to marshal fixture: %v", err)
	}
	return data
}
