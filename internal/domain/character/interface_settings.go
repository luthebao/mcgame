// Open-sourced by BaoLT

// Character interface settings persistence contracts.
package character

import "context"

type InterfaceSettingsRepository interface {
	GetByCharacterID(ctx context.Context, characterID int64) (map[string]interface{}, error)
	Upsert(ctx context.Context, characterID int64, settings map[string]interface{}) error
}
