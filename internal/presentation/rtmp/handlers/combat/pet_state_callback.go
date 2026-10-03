// Open-sourced by BaoLT

// Battle pet state callback helpers keep the client pet manager aligned with battle pet switches.
package combat

import (
	"strconv"

	appcombat "mcgame-server/internal/application/combat"

	"go.uber.org/zap"
)

func sendBattlePetStateCallbacks(conn battleStartCallbackSender, ownerID string, changes []appcombat.BattlePetStateChange, logger *zap.Logger) {
	if conn == nil || ownerID == "" || len(changes) == 0 {
		return
	}

	for _, change := range changes {
		if strconv.FormatInt(change.OwnerID, 10) != ownerID {
			continue
		}
		if err := conn.SendCallback("onUpdatePet", float64(change.PetID), "state", change.State); err != nil {
			if logger != nil {
				logger.Warn("Failed to send battle pet state callback",
					zap.String("owner_id", ownerID),
					zap.Int64("pet_id", change.PetID),
					zap.Int("state", change.State),
					zap.Error(err))
			}
			return
		}
	}
}
