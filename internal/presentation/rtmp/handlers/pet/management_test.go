// Open-sourced by BaoLT

package pet

import (
	"context"
	"net"
	"testing"
	"time"

	apppet "mcgame-server/internal/application/pet"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	amf0 "github.com/yutopp/go-amf0"
	"go.uber.org/zap"
)

func TestInitViewPetMngPReturnsDistinctPetEntries(t *testing.T) {
	repo := &managementTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			101: {
				ID:          101,
				CharacterID: 77,
				TemplateID:  2001,
				Name:        "Alpha",
				Experience:  100,
				Property:    map[string]interface{}{"state": int(domainpet.PetStateBattle)},
			},
			102: {
				ID:          102,
				CharacterID: 77,
				TemplateID:  2002,
				Name:        "Beta",
				Experience:  200,
				Property:    map[string]interface{}{"state": int(domainpet.PetStateRest)},
			},
		},
	}
	service := apppet.NewService(repo, zap.NewNop())
	handler := NewHandler(service, nil, zap.NewNop())

	result, err := handler.InitViewPetMngP(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "77",
	}, nil)
	if err != nil {
		t.Fatalf("InitViewPetMngP() error = %v", err)
	}

	petDTOs, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("InitViewPetMngP() type = %T, want map[string]interface{}", result)
	}
	if len(petDTOs) != 2 {
		t.Fatalf("InitViewPetMngP() len = %d, want 2", len(petDTOs))
	}

	first := managementTestPetData(t, petDTOs, "101")
	second := managementTestPetData(t, petDTOs, "102")

	if got := first["id"]; got != int64(101) {
		t.Fatalf("first id = %#v, want 101", got)
	}
	if got := second["id"]; got != int64(102) {
		t.Fatalf("second id = %#v, want 102", got)
	}
	if got := first["petName"]; got != "Alpha" {
		t.Fatalf("first petName = %#v, want Alpha", got)
	}
	if got := second["petName"]; got != "Beta" {
		t.Fatalf("second petName = %#v, want Beta", got)
	}
	if first["id"] == second["id"] {
		t.Fatalf("pet entries share the same id: %#v", first["id"])
	}

	property, ok := first["property"].(map[string]interface{})
	if !ok {
		t.Fatalf("first property type = %T, want map[string]interface{}", first["property"])
	}
	if got := property["ee"]; got != "0" {
		t.Fatalf("property[ee] = %#v, want 0", got)
	}
	if got := property["ef"]; got != false {
		t.Fatalf("property[ef] = %#v, want false", got)
	}
	if got := property["en"]; got != 0 {
		t.Fatalf("property[en] = %#v, want 0", got)
	}
}

func TestBuildPetStateUpdatesForChangeOnlySendsStateForUnboundPets(t *testing.T) {
	updates := buildPetStateUpdatesForChange([]*domainpet.Pet{
		{
			ID:       101,
			Property: map[string]interface{}{"state": int(domainpet.PetStateBattle)},
		},
		{
			ID:       102,
			Property: map[string]interface{}{"state": int(domainpet.PetStateRest)},
		},
		nil,
	}, 102)

	if len(updates) != 2 {
		t.Fatalf("buildPetStateUpdatesForChange() len = %d, want 2", len(updates))
	}
	for i, update := range updates {
		if update.key != "state" {
			t.Fatalf("update[%d].key = %q, want state", i, update.key)
		}
		if _, ok := update.value.(float64); !ok {
			t.Fatalf("update[%d].value type = %T, want float64", i, update.value)
		}
	}
}

func TestBuildPetStateUpdatesForChangeIncludesBindedForChangedPet(t *testing.T) {
	updates := buildPetStateUpdatesForChange([]*domainpet.Pet{
		{
			ID:       101,
			Property: map[string]interface{}{"state": int(domainpet.PetStateBattle), "binded": 1},
		},
		{
			ID:       102,
			Property: map[string]interface{}{"state": int(domainpet.PetStateRest), "binded": 1},
		},
	}, 101)

	if len(updates) != 3 {
		t.Fatalf("buildPetStateUpdatesForChange() len = %d, want 3", len(updates))
	}

	bindUpdates := 0
	for _, update := range updates {
		if update.key != "binded" {
			continue
		}

		bindUpdates++
		if update.petID != 101 {
			t.Fatalf("binded update petID = %d, want 101", update.petID)
		}
		if got, ok := update.value.(float64); !ok || got != 1 {
			t.Fatalf("binded update value = %#v, want float64(1)", update.value)
		}
	}

	if bindUpdates != 1 {
		t.Fatalf("binded update count = %d, want 1", bindUpdates)
	}
}

func TestChangePetProperty_AllocatesPetAttributePoints(t *testing.T) {
	repo := &managementTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			101: {
				ID:            101,
				CharacterID:   77,
				Level:         10,
				AttrPoints:    3,
				MaxAttrPoints: 3,
				CreatureData: map[string]interface{}{
					"attStrength":     "5",
					"attAgility":      "4",
					"attStamina":      "8",
					"attIntelligence": "3",
					"attEnergy":       "2",
					"aptStrength":     "20",
					"aptAgility":      "10",
					"aptStamina":      "15",
					"aptIntelligence": "5",
					"aptEnergy":       "8",
				},
				Property: map[string]interface{}{"state": int(domainpet.PetStateBattle)},
			},
		},
	}
	service := apppet.NewService(repo, zap.NewNop())
	handler := NewHandler(service, nil, zap.NewNop())
	conn := rtmp.NewConnection(1, &managementTestNetConn{}, nil, zap.NewNop())

	_, err := handler.ChangePetProperty(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "77",
		Connection:  conn,
	}, []interface{}{
		float64(101),
		amf0.ECMAArray{
			"addStrength":     "2",
			"addAgility":      "1",
			"addStamina":      "",
			"addIntelligence": "",
			"addEnergy":       "",
		},
	})
	if err != nil {
		t.Fatalf("ChangePetProperty() error = %v", err)
	}

	pet := repo.pets[101]
	if pet.AptStrengthEx != 2 {
		t.Fatalf("AptStrengthEx = %d, want 2", pet.AptStrengthEx)
	}
	if pet.AptAgilityEx != 1 {
		t.Fatalf("AptAgilityEx = %d, want 1", pet.AptAgilityEx)
	}
	if pet.AttrPoints != 0 {
		t.Fatalf("AttrPoints = %d, want 0", pet.AttrPoints)
	}
	if pet.DistributedAttrPoints != 3 {
		t.Fatalf("DistributedAttrPoints = %d, want 3", pet.DistributedAttrPoints)
	}
	if got := pet.Property["lastPoint"]; got != 0 {
		t.Fatalf("property[lastPoint] = %#v, want 0", got)
	}
}

func managementTestPetData(t *testing.T, petDTOs map[string]interface{}, key string) map[string]interface{} {
	t.Helper()

	raw, ok := petDTOs[key]
	if !ok {
		t.Fatalf("petDTOs[%q] missing", key)
	}
	dto, ok := raw.(map[string]interface{})
	if !ok {
		t.Fatalf("petDTOs[%q] type = %T, want map[string]interface{}", key, raw)
	}
	data, ok := dto["data"].(map[string]interface{})
	if !ok {
		t.Fatalf("petDTOs[%q][data] type = %T, want map[string]interface{}", key, dto["data"])
	}
	return data
}

type managementTestNetConn struct{}

func (s *managementTestNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *managementTestNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *managementTestNetConn) Close() error                      { return nil }
func (s *managementTestNetConn) LocalAddr() net.Addr               { return nil }
func (s *managementTestNetConn) RemoteAddr() net.Addr {
	return nil
}
func (s *managementTestNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *managementTestNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *managementTestNetConn) SetWriteDeadline(t time.Time) error { return nil }

type managementTestPetRepo struct {
	pets map[int64]*domainpet.Pet
}

func (r *managementTestPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	if pet == nil {
		return pkgerrors.ErrInvalidInput
	}
	if r.pets == nil {
		r.pets = make(map[int64]*domainpet.Pet)
	}
	r.pets[pet.ID] = pet
	return nil
}

func (r *managementTestPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	if pet, ok := r.pets[id]; ok {
		return pet, nil
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *managementTestPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	result := make([]*domainpet.Pet, 0, len(r.pets))
	for _, pet := range r.pets {
		if pet != nil && pet.CharacterID == characterID {
			result = append(result, pet)
		}
	}
	return result, nil
}

func (r *managementTestPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	for _, pet := range r.pets {
		if pet != nil && pet.CharacterID == characterID && pet.IsFollowing {
			return pet, nil
		}
	}
	return nil, nil
}

func (r *managementTestPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *managementTestPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet != nil && pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *managementTestPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	pet, ok := r.pets[petID]
	if !ok {
		return pkgerrors.ErrNotFound
	}
	pet.IsFollowing = isFollowing
	return nil
}

func (r *managementTestPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	for _, pet := range r.pets {
		if pet != nil && pet.CharacterID == characterID {
			pet.IsFollowing = false
		}
	}
	return nil
}
