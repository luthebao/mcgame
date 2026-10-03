// Open-sourced by BaoLT

package quest

import (
	"strconv"
	"testing"

	domainpet "mcgame-server/internal/domain/pet"
)

type petRewardCallbackCall struct {
	method string
	args   []interface{}
}

type petRewardCallbackRecorder struct {
	calls []petRewardCallbackCall
}

func (r *petRewardCallbackRecorder) SendCallback(method string, args ...interface{}) error {
	copiedArgs := make([]interface{}, len(args))
	copy(copiedArgs, args)
	r.calls = append(r.calls, petRewardCallbackCall{
		method: method,
		args:   copiedArgs,
	})
	return nil
}

func TestSendQuestPetRewardCallbacks_SendsExpLevelAndPropertyRefresh(t *testing.T) {
	recorder := &petRewardCallbackRecorder{}
	pet := &domainpet.Pet{
		ID:          9,
		CharacterID: 1,
		TemplateID:  700,
		Name:        "Quest Pet",
		Level:       2,
		Life:        10000,
		IsFollowing: true,
		Property:    map[string]interface{}{},
	}
	pet.RecalculateStats()

	sendQuestPetRewardCallbacks(recorder, pet, true)

	if len(recorder.calls) != 3 {
		t.Fatalf("SendCallback call count = %d, want 3", len(recorder.calls))
	}

	expCall := recorder.calls[0]
	if expCall.method != "onUpdatePet" {
		t.Fatalf("first callback method = %q, want onUpdatePet", expCall.method)
	}
	if got := expCall.args[0]; got != float64(pet.ID) {
		t.Fatalf("exp callback pet id = %#v, want %v", got, float64(pet.ID))
	}
	if got := expCall.args[1]; got != "exp" {
		t.Fatalf("exp callback field = %#v, want %q", got, "exp")
	}
	if got := expCall.args[2]; got != strconv.FormatInt(pet.ClientExperience(), 10) {
		t.Fatalf("exp callback value = %#v, want %q", got, strconv.FormatInt(pet.ClientExperience(), 10))
	}

	levelCall := recorder.calls[1]
	if levelCall.method != "onUpdatePet" {
		t.Fatalf("second callback method = %q, want onUpdatePet", levelCall.method)
	}
	if got := levelCall.args[1]; got != "level" {
		t.Fatalf("level callback field = %#v, want %q", got, "level")
	}
	if got := levelCall.args[2]; got != strconv.Itoa(pet.Level) {
		t.Fatalf("level callback value = %#v, want %q", got, strconv.Itoa(pet.Level))
	}

	propCall := recorder.calls[2]
	if propCall.method != "onRefreshPetProp" {
		t.Fatalf("third callback method = %q, want onRefreshPetProp", propCall.method)
	}
	payload, ok := propCall.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("property callback payload type = %T, want map[string]interface{}", propCall.args[0])
	}
	if got := payload["id"]; got != pet.ID {
		t.Fatalf("property callback id = %#v, want %d", got, pet.ID)
	}
	if _, ok := payload["s"]; !ok {
		t.Fatalf("property callback missing stats payload: %#v", payload)
	}
}
