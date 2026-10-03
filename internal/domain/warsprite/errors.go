// Open-sourced by BaoLT

// War sprite domain sentinel errors raised by the application service and surfaced to handlers.
package warsprite

import "errors"

var (
	ErrInvalidIndex      = errors.New("warsprite: invalid sprite index")
	ErrInvalidKind       = errors.New("warsprite: invalid sprite kind")
	ErrTemplateNotFound  = errors.New("warsprite: template not found")
	ErrMaxLevel          = errors.New("warsprite: sprite already at max level")
	ErrInsufficientStone = errors.New("warsprite: insufficient stones")
	ErrInsufficientGold  = errors.New("warsprite: insufficient gold")
	ErrCharacterNotFound = errors.New("warsprite: character not found")
)
