// Open-sourced by BaoLT

package group

import (
	"context"
	"errors"
	"testing"

	appchar "mcgame-server/internal/application/character"
	domainchar "mcgame-server/internal/domain/character"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type roomPayloadCharacterRepo struct {
	chars map[int64]*domainchar.Character
}

func (r *roomPayloadCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	char, ok := r.chars[id]
	if !ok {
		return nil, errors.New("character not found")
	}
	return char, nil
}

func (r *roomPayloadCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *roomPayloadCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *roomPayloadCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *roomPayloadCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *roomPayloadCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *roomPayloadCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *roomPayloadCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *roomPayloadCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *roomPayloadCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func newRoomPayloadCharacterService(t *testing.T) *appchar.Service {
	t.Helper()
	repo := &roomPayloadCharacterRepo{
		chars: map[int64]*domainchar.Character{
			1001: {ID: 1001, Name: "Leader", ClassID: 1, Gender: 1, Level: 80, MapID: 1, PosX: 100, PosY: 200, Direction: 3},
			1002: {ID: 1002, Name: "Member", ClassID: 2, Gender: 0, Level: 70, MapID: 1, PosX: 110, PosY: 210, Direction: 5},
		},
	}
	return appchar.NewService(repo, zaptest.NewLogger(t))
}
