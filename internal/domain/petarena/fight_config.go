// Open-sourced by BaoLT

// Pet fight config entities persist AI command presets used by the Flash pet fight panels.
package petarena

import "context"

type FightConfig struct {
	CharacterID int64
	ConfigKey   string
	ConfData    map[string]interface{}
}

type FightConfigRepository interface {
	GetFightConfig(ctx context.Context, characterID int64, configKey string) (*FightConfig, error)
	SaveFightConfig(ctx context.Context, config *FightConfig) error
}
