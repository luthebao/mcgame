// Open-sourced by BaoLT

package scene

import (
	"context"
	"testing"

	appchar "mcgame-server/internal/application/character"
	appgroup "mcgame-server/internal/application/group"
	domainchar "mcgame-server/internal/domain/character"
	domaingroup "mcgame-server/internal/domain/group"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type movementGroupCharacterRepo struct {
	chars map[int64]*domainchar.Character
}

func (r *movementGroupCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.chars[id], nil
}

func (r *movementGroupCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *movementGroupCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *movementGroupCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *movementGroupCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *movementGroupCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *movementGroupCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *movementGroupCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *movementGroupCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	if char := r.chars[id]; char != nil {
		char.MapID = pos.MapID
		char.PosX = pos.X
		char.PosY = pos.Y
		char.Direction = pos.Direction
	}
	return nil
}

func (r *movementGroupCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func TestUpdatePosition_LeaderSyncsGroupMemberPositions(t *testing.T) {
	logger := zaptest.NewLogger(t)
	charRepo := &movementGroupCharacterRepo{
		chars: map[int64]*domainchar.Character{
			1: {ID: 1, Name: "Leader", MapID: 3, PosX: 100, PosY: 100},
			2: {ID: 2, Name: "Member", MapID: 3, PosX: 50, PosY: 60},
		},
	}
	charService := appchar.NewService(charRepo, logger)
	handler := NewHandler(charService, nil, infrartmp.NewSceneManager(), logger)
	handler.SetGroupService(appgroup.NewService(&fakeGroupRepo{
		groups: map[int64]*domaingroup.Group{
			1: {
				ID:       1,
				LeaderID: 1,
				Members: []domaingroup.Member{
					{CharID: 1, IsLeader: true},
					{CharID: 2},
				},
			},
		},
	}))

	conn := infrartmp.NewConnection(1, &stubNetConn{}, nil, logger)
	conn.SetSceneInfo(3, 1)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  conn,
		ConnID:      1,
	}

	if _, err := handler.UpdatePosition(ctx, []interface{}{float64(1500), float64(1600)}); err != nil {
		t.Fatalf("UpdatePosition() error = %v", err)
	}

	if got := charRepo.chars[2].PosX; got != 1500 {
		t.Fatalf("member PosX = %d, want 1500", got)
	}
	if got := charRepo.chars[2].PosY; got != 1600 {
		t.Fatalf("member PosY = %d, want 1600", got)
	}
}
