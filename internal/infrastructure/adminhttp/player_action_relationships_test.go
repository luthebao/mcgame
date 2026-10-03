// Open-sourced by BaoLT

package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/google/uuid"
	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/social"
)

type fakeRelationshipStore struct {
	listResult []*social.Relationship
	listErr    error

	createdTyped []*social.Relationship
	createTyped  error

	createdBlock []*social.Relationship
	createBlock  error

	changedType     []int64
	updatedIntimacy []int64
	updatedNickname []int64
	updatedGroup    []int64
	deletedIDs      []int64

	nameLookupID   int64
	nameLookupName string
	nameLookupErr  error
}

func (f *fakeRelationshipStore) ListByCharacterAll(_ context.Context, _ int64) ([]*social.Relationship, error) {
	return f.listResult, f.listErr
}

func (f *fakeRelationshipStore) CreateTyped(_ context.Context, rel *social.Relationship) error {
	if f.createTyped != nil {
		return f.createTyped
	}
	snapshot := *rel
	rel.ID = int64(100 + len(f.createdTyped))
	f.createdTyped = append(f.createdTyped, &snapshot)
	return nil
}

func (f *fakeRelationshipStore) Create(_ context.Context, rel *social.Relationship) error {
	if f.createBlock != nil {
		return f.createBlock
	}
	snapshot := *rel
	rel.ID = int64(200 + len(f.createdBlock))
	f.createdBlock = append(f.createdBlock, &snapshot)
	return nil
}

func (f *fakeRelationshipStore) UpdateIntimacy(_ context.Context, id int64, _ int) error {
	f.updatedIntimacy = append(f.updatedIntimacy, id)
	return nil
}

func (f *fakeRelationshipStore) UpdateNickname(_ context.Context, id int64, _ string) error {
	f.updatedNickname = append(f.updatedNickname, id)
	return nil
}

func (f *fakeRelationshipStore) UpdateGroup(_ context.Context, id int64, _ int) error {
	f.updatedGroup = append(f.updatedGroup, id)
	return nil
}

func (f *fakeRelationshipStore) ChangeType(_ context.Context, id int64, _ int) error {
	f.changedType = append(f.changedType, id)
	return nil
}

func (f *fakeRelationshipStore) DeleteByIDAny(_ context.Context, id int64) error {
	f.deletedIDs = append(f.deletedIDs, id)
	return nil
}

func (f *fakeRelationshipStore) GetCharacterIDByName(_ context.Context, _ string) (int64, string, error) {
	return f.nameLookupID, f.nameLookupName, f.nameLookupErr
}

func newRelationshipChar() *character.Character {
	return character.NewCharacter(uuid.New(), "tester", 1, 0)
}

func intPtr(v int) *int { return &v }

func TestExecuteSetRelationship_RejectsTypeOutOfRange(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetRelationship(recorder, context.Background(), newRelationshipChar(),
		json.RawMessage(`{"type":6,"otherId":42}`))

	if recorder.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusBadRequest)
	}
	if len(store.createdTyped) != 0 || len(store.createdBlock) != 0 {
		t.Fatal("create was invoked for an out-of-range type")
	}
}

func TestExecuteSetRelationship_RejectsOtherEqualsTarget(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	char := newRelationshipChar()
	recorder := httptest.NewRecorder()

	payload, _ := json.Marshal(setRelationshipPayload{Type: intPtr(social.RelationshipTypeFriend), OtherID: char.ID})
	server.executeSetRelationship(recorder, context.Background(), char, payload)

	if recorder.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusBadRequest)
	}
	if len(store.createdTyped) != 0 {
		t.Fatal("create was invoked when otherId equals charID")
	}
}

func TestExecuteSetRelationship_CreateTypedFriend(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetRelationship(recorder, context.Background(), newRelationshipChar(),
		json.RawMessage(`{"type":3,"otherId":42,"otherName":"lover"}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if len(store.createdTyped) != 1 {
		t.Fatalf("createTyped calls = %d, want 1", len(store.createdTyped))
	}
	if len(store.createdBlock) != 0 {
		t.Fatal("block create should not be invoked for couple type")
	}
	if store.createdTyped[0].Type != social.RelationshipTypeCouple {
		t.Fatalf("created type = %d, want %d", store.createdTyped[0].Type, social.RelationshipTypeCouple)
	}

	var resp struct {
		OK   bool `json:"ok"`
		Data struct {
			Created bool `json:"created"`
		} `json:"data"`
	}
	if err := json.Unmarshal(recorder.Body.Bytes(), &resp); err != nil {
		t.Fatalf("decode response: %v", err)
	}
	if !resp.Data.Created {
		t.Fatal("data.created = false, want true")
	}
}

func TestExecuteSetRelationship_CreateBlockRoutesToBlockPath(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetRelationship(recorder, context.Background(), newRelationshipChar(),
		json.RawMessage(`{"type":1,"otherId":42}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if len(store.createdBlock) != 1 {
		t.Fatalf("block create calls = %d, want 1", len(store.createdBlock))
	}
	if len(store.createdTyped) != 0 {
		t.Fatal("createTyped should not be invoked for block type")
	}
}

func TestExecuteSetRelationship_CreateWithMirror(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	char := newRelationshipChar()
	recorder := httptest.NewRecorder()

	server.executeSetRelationship(recorder, context.Background(), char,
		json.RawMessage(`{"type":0,"otherId":42,"mirror":true}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if len(store.createdTyped) != 2 {
		t.Fatalf("createTyped calls = %d, want 2 (primary + mirror)", len(store.createdTyped))
	}
	mirror := store.createdTyped[1]
	if mirror.CharacterID != 42 || mirror.OtherID != char.ID {
		t.Fatalf("mirror row = (char %d, other %d), want (char 42, other %d)", mirror.CharacterID, mirror.OtherID, char.ID)
	}
}

func TestExecuteSetRelationship_ResolvesOtherName(t *testing.T) {
	store := &fakeRelationshipStore{nameLookupID: 77, nameLookupName: "Exact"}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetRelationship(recorder, context.Background(), newRelationshipChar(),
		json.RawMessage(`{"type":2,"otherName":"exact"}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if len(store.createdTyped) != 1 {
		t.Fatalf("createTyped calls = %d, want 1", len(store.createdTyped))
	}
	if store.createdTyped[0].OtherID != 77 || store.createdTyped[0].OtherName != "Exact" {
		t.Fatalf("resolved other = (%d, %q), want (77, Exact)", store.createdTyped[0].OtherID, store.createdTyped[0].OtherName)
	}
}

func TestExecuteSetRelationship_UpdateRoutesById(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetRelationship(recorder, context.Background(), newRelationshipChar(),
		json.RawMessage(`{"relationshipId":55,"intimacy":99,"nickname":"bff"}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if len(store.createdTyped) != 0 || len(store.createdBlock) != 0 {
		t.Fatal("create was invoked on the update branch")
	}
	if len(store.updatedIntimacy) != 1 || store.updatedIntimacy[0] != 55 {
		t.Fatalf("updatedIntimacy = %v, want [55]", store.updatedIntimacy)
	}
	if len(store.updatedNickname) != 1 || store.updatedNickname[0] != 55 {
		t.Fatalf("updatedNickname = %v, want [55]", store.updatedNickname)
	}

	var resp struct {
		Data struct {
			Created bool `json:"created"`
		} `json:"data"`
	}
	if err := json.Unmarshal(recorder.Body.Bytes(), &resp); err != nil {
		t.Fatalf("decode response: %v", err)
	}
	if resp.Data.Created {
		t.Fatal("data.created = true on update branch, want false")
	}
}

func TestExecuteDeleteRelationship_PassThrough(t *testing.T) {
	store := &fakeRelationshipStore{}
	server := &Server{logger: zap.NewNop(), relationshipStore: store}
	recorder := httptest.NewRecorder()

	server.executeDeleteRelationship(recorder, context.Background(), newRelationshipChar(),
		json.RawMessage(`{"relationshipId":321}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if len(store.deletedIDs) != 1 || store.deletedIDs[0] != 321 {
		t.Fatalf("deletedIDs = %v, want [321]", store.deletedIDs)
	}
}
