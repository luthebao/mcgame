// Open-sourced by BaoLT

package utils

import (
	"testing"

	domainchar "mcgame-server/internal/domain/character"
)

func TestBuildLifeSkillUPPPayloadOmitsUnchangedExpSkill(t *testing.T) {
	char := &domainchar.Character{
		Experience:    1000,
		PlantDex:      60,
		Money:         49700,
		GuildContrib:  0,
		DonateContrib: 0,
	}

	payload := buildLifeSkillUPPPayload(1000, char)

	if _, ok := payload["expSkill"]; ok {
		t.Fatalf("expected expSkill to be omitted when unchanged, got %#v", payload["expSkill"])
	}
	if got := payload["plantDex"]; got != 60 {
		t.Fatalf("expected plantDex 60, got %#v", got)
	}
}

func TestBuildLifeSkillUPPPayloadIncludesChangedExpSkill(t *testing.T) {
	char := &domainchar.Character{
		Experience:    1200,
		PlantDex:      60,
		Money:         49700,
		GuildContrib:  0,
		DonateContrib: 0,
	}

	payload := buildLifeSkillUPPPayload(1000, char)

	if got := payload["expSkill"]; got != int64(1200) {
		t.Fatalf("expected expSkill 1200, got %#v", got)
	}
}
