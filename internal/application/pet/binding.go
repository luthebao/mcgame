// Open-sourced by BaoLT

package pet

import (
	"context"

	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) BindPet(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	if s.petRepo == nil {
		return nil, pkgerrors.ErrSystemError
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	if p.IsBound() {
		return p, nil
	}

	p.SetBinded(true)
	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	if s.logger != nil {
		s.logger.Info("Pet bound to player",
			zap.Int64("character_id", charID),
			zap.Int64("pet_id", petID))
	}

	return p, nil
}
