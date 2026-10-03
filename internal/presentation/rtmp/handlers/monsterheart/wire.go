// Open-sourced by BaoLT

// Wire format helpers: encode State into the {bag, data} shape sent as updateMonsterHeartPanel.
package monsterheart

import (
	appmonsterheart "mcgame-server/internal/application/monsterheart"
)

func stateToWire(state *appmonsterheart.State) map[string]interface{} {
	if state == nil {
		state = appmonsterheart.NewState()
	}
	return state.Encode()
}

func emptyPanelWire() map[string]interface{} {
	return stateToWire(nil)
}
