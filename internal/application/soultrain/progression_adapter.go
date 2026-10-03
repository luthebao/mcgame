// Open-sourced by BaoLT

// ProgressionAdapter bridges the statfeature.Repository to the ProgressionAccessor
// interface required by the soultrain service.
package soultrain

import (
	"context"
	"fmt"

	domainfeature "mcgame-server/internal/domain/statfeature"
)

type ProgressionAdapter struct {
	repo domainfeature.Repository
}

func NewProgressionAdapter(repo domainfeature.Repository) *ProgressionAdapter {
	return &ProgressionAdapter{repo: repo}
}

func (a *ProgressionAdapter) GetSoulProgression(ctx context.Context, charID int64) (int, int64, error) {
	prog, err := a.repo.GetCharacterProgression(ctx, charID)
	if err != nil {
		return 0, 0, fmt.Errorf("soultrain: get character progression: %w", err)
	}
	if prog == nil {
		return 0, 0, nil
	}
	return prog.SoulLevel, prog.SoulExp, nil
}

func (a *ProgressionAdapter) SaveSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	return a.repo.UpsertCharacterSoulProgression(ctx, charID, soulLevel, soulExp)
}
