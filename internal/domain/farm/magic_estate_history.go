// Open-sourced by BaoLT

// Magic estate history entities back the Fazenda log and replay tabs.
package farm

import "time"

type MagicEstateLog struct {
	ID             int64
	CharacterID    int64
	LogTime        int64
	Result         int
	Guest          bool
	CID            int64
	TID            int64
	Name           string
	ItemTemplateID int
	Num            int
	NoReplay       bool
	BattleID       int64
	CreatedAt      time.Time
}

type MagicEstateReplay struct {
	CharacterID int64
	BattleID    int64
	Name        string
	Timestamp   string
	CreatedAt   time.Time
}
