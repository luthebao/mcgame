// Open-sourced by BaoLT

package pet

import (
	"encoding/json"

	"mcgame-server/internal/domain/character"
)

func GuardInfoLoginJSON(char *character.Character) string {
	state := normalizePetGuardState(char.PetGuardData)
	obj := map[string]interface{}{
		"petData": state.petDataObject(),
		"lvData":  state.levelDataObject(),
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return "{}"
	}
	return string(b)
}
