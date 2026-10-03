// Open-sourced by BaoLT

package magiccrystal

import (
	"context"
	"encoding/json"
)

func (s *Service) LoadLoginJSON(ctx context.Context, charID int64) string {
	crystals, err := s.Load(ctx, charID)
	if err != nil || len(crystals) == 0 {
		return CrystalsToLoginJSON(defaultCrystals(), "")
	}
	return CrystalsToLoginJSON(crystals, "")
}

func CrystalsToLoginJSON(crystals []Crystal, resetTime string) string {
	b, err := json.Marshal(CrystalsToInitWire(crystals, resetTime))
	if err != nil {
		return "{}"
	}
	return string(b)
}
