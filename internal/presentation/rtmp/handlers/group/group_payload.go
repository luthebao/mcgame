// Open-sourced by BaoLT

package group

import (
	"context"
	"time"
)

func (h *Handler) groupCharacterPayload(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	char, err := h.charService.GetByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	var payload map[string]interface{}
	if h.sceneService != nil {
		payload = h.sceneService.GetCharacterForClient(char)
	} else {
		payload = map[string]interface{}{
			"id":       char.ID,
			"name":     char.Name,
			"classId":  char.ClassID,
			"gender":   char.Gender,
			"level":    char.Level,
			"pmLevel":  char.CurrentPMLevel(time.Now()),
			"ee":       char.Ee,
			"ef":       char.Ef,
			"en":       char.En,
			"posMapId": char.MapID,
			"posX":     char.PosX,
			"posY":     char.PosY,
		}
	}

	payload["id"] = char.ID
	payload["cid"] = char.ID
	payload["name"] = char.Name
	payload["classId"] = char.ClassID
	payload["gender"] = char.Gender
	payload["level"] = char.Level
	payload["exp"] = char.CumulativeExpCapped()
	payload["expRe"] = char.RebirthExp
	payload["posMapId"] = char.MapID
	payload["posX"] = char.PosX
	payload["posY"] = char.PosY
	payload["posDir"] = char.Direction
	payload["pmLevel"] = char.CurrentPMLevel(time.Now())
	payload["ee"] = char.Ee
	payload["ef"] = char.Ef
	payload["en"] = char.En
	payload["cl"] = char.ClassRank
	payload["qn"] = char.QuestN

	h.attachGroupShowPetObject(ctx, characterID, payload)

	return payload, nil
}

func (h *Handler) attachGroupShowPetObject(ctx context.Context, characterID int64, payload map[string]interface{}) {
	if h.petService == nil || payload == nil {
		return
	}

	followingPet, err := h.petService.GetFollowingPet(ctx, characterID)
	if err != nil || followingPet == nil {
		return
	}

	payload["showPetId"] = followingPet.ID
	payload["showPetObj"] = followingPet.ToSceneDTO()
}
