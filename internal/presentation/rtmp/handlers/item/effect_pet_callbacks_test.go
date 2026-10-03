// Open-sourced by BaoLT

package item

import (
	"testing"

	domainpet "mcgame-server/internal/domain/pet"
)

type callbackCall struct {
	method string
	args   []interface{}
}

type handlerCallbackRecorder struct {
	calls []callbackCall
}

func (r *handlerCallbackRecorder) SendCallback(method string, args ...interface{}) error {
	copied := make([]interface{}, len(args))
	copy(copied, args)
	r.calls = append(r.calls, callbackCall{method: method, args: copied})
	return nil
}

func TestSendUpdatedPetCallbacks_UsesOnUpdatePetNotOnAddPet(t *testing.T) {
	pets := []*domainpet.Pet{{ID: 42, Life: 7500}}
	recorder := &handlerCallbackRecorder{}

	sendUpdatedPetCallbacks(recorder, pets)

	if len(recorder.calls) != 1 {
		t.Fatalf("expected 1 callback, got %d", len(recorder.calls))
	}
	call := recorder.calls[0]
	if call.method != "onUpdatePet" {
		t.Fatalf("callback method = %q, want %q (not %q)", call.method, "onUpdatePet", "onAddPet")
	}
	if len(call.args) != 3 {
		t.Fatalf("expected 3 args, got %d", len(call.args))
	}
	if call.args[0] != float64(42) {
		t.Fatalf("arg[0] = %#v, want float64(42)", call.args[0])
	}
	if call.args[1] != "life" {
		t.Fatalf("arg[1] = %#v, want %q", call.args[1], "life")
	}
	if call.args[2] != "7500" {
		t.Fatalf("arg[2] = %#v, want %q", call.args[2], "7500")
	}
}

func TestSendUpdatedPetCallbacks_NilPetIsSkipped(t *testing.T) {
	pets := []*domainpet.Pet{nil, {ID: 10, Life: 3000}}
	recorder := &handlerCallbackRecorder{}

	sendUpdatedPetCallbacks(recorder, pets)

	if len(recorder.calls) != 1 {
		t.Fatalf("expected 1 callback (nil skipped), got %d", len(recorder.calls))
	}
	if recorder.calls[0].args[0] != float64(10) {
		t.Fatalf("arg[0] = %#v, want float64(10)", recorder.calls[0].args[0])
	}
	if recorder.calls[0].args[2] != "3000" {
		t.Fatalf("arg[2] = %#v, want %q", recorder.calls[0].args[2], "3000")
	}
}

func TestSendUpdatedPetCallbacks_EmptyListNoCallbacks(t *testing.T) {
	recorder := &handlerCallbackRecorder{}
	sendUpdatedPetCallbacks(recorder, nil)
	if len(recorder.calls) != 0 {
		t.Fatalf("expected 0 callbacks for nil list, got %d", len(recorder.calls))
	}
}

func TestSendUpdatedPetCallbacks_NilSenderNoopSafe(t *testing.T) {
	defer func() {
		if r := recover(); r != nil {
			t.Fatalf("sendUpdatedPetCallbacks panicked with nil sender: %v", r)
		}
	}()
	pets := []*domainpet.Pet{{ID: 1, Life: 1000}}
	sendUpdatedPetCallbacks(nil, pets)
}

func TestSendUpdatedPetCallbacks_MultipleUpdatedPets(t *testing.T) {
	pets := []*domainpet.Pet{
		{ID: 11, Life: 2000},
		{ID: 22, Life: 8000},
	}
	recorder := &handlerCallbackRecorder{}

	sendUpdatedPetCallbacks(recorder, pets)

	if len(recorder.calls) != 2 {
		t.Fatalf("expected 2 callbacks, got %d", len(recorder.calls))
	}
	for _, call := range recorder.calls {
		if call.method != "onUpdatePet" {
			t.Fatalf("callback method = %q, want %q", call.method, "onUpdatePet")
		}
		if call.args[1] != "life" {
			t.Fatalf("arg[1] = %#v, want %q", call.args[1], "life")
		}
	}
	if recorder.calls[0].args[0] != float64(11) {
		t.Fatalf("first pet arg[0] = %#v, want float64(11)", recorder.calls[0].args[0])
	}
	if recorder.calls[1].args[0] != float64(22) {
		t.Fatalf("second pet arg[0] = %#v, want float64(22)", recorder.calls[1].args[0])
	}
}
