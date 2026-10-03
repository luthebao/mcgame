// Open-sourced by BaoLT

package errors

import "errors"

// Domain errors
var (
	ErrNotFound          = errors.New("not found")
	ErrAlreadyExists     = errors.New("already exists")
	ErrInvalidInput      = errors.New("invalid input")
	ErrInsufficientLevel = errors.New("insufficient level")
	ErrInsufficientStats = errors.New("insufficient stats")
	ErrInsufficientFunds = errors.New("insufficient funds")
	ErrInsufficientItems = errors.New("insufficient items")
	ErrInventoryFull     = errors.New("inventory full")
	ErrItemNotEquippable = errors.New("item not equippable")
	ErrSlotOccupied      = errors.New("slot already occupied")
	ErrQuestNotAvailable = errors.New("quest not available")
	ErrQuestAlreadyTaken = errors.New("quest already taken")
	ErrQuestNotCompleted = errors.New("quest not completed")
	ErrInBattle          = errors.New("already in battle")
	ErrNotInBattle       = errors.New("not in battle")
	ErrInvalidTarget     = errors.New("invalid target")
	ErrSkillOnCooldown   = errors.New("skill on cooldown")
	ErrInsufficientMP    = errors.New("insufficient MP")
	ErrInsufficientSP    = errors.New("insufficient SP")
	ErrPetDead           = errors.New("pet has no life")

	ErrInsufficientClassRank = errors.New("insufficient class rank")
	ErrSkillRequiresRebirth  = errors.New("skill requires rebirth")
)

// Authentication errors
var (
	ErrUnauthorized       = errors.New("unauthorized")
	ErrInvalidCredentials = errors.New("invalid credentials")
	ErrSessionExpired     = errors.New("session expired")
	ErrAccountBanned      = errors.New("account banned")
	ErrAccountNotFound    = errors.New("account not found")
	ErrCharacterNotFound  = errors.New("character not found")
	ErrCharacterNotOwned  = errors.New("character not owned by account")
	ErrServerMaintenance  = errors.New("server under maintenance")
)

// Scene errors
var (
	ErrNPCNotFound       = errors.New("NPC not found")
	ErrSceneItemNotFound = errors.New("scene item not found")
	ErrSceneItemExpired  = errors.New("scene item expired")
	ErrCannotPickup      = errors.New("cannot pick up item")
	ErrInvalidTeleport   = errors.New("invalid teleport destination")
)

// Item errors
var (
	ErrItemNotFound       = errors.New("item not found")
	ErrItemNotOwned       = errors.New("item not owned by character")
	ErrInvalidSlot        = errors.New("invalid slot")
	ErrCannotEquip        = errors.New("cannot equip item")
	ErrCannotUnequip      = errors.New("cannot unequip item")
	ErrItemBroken         = errors.New("item is broken")
	ErrCannotStack        = errors.New("cannot stack items")
	ErrCannotUseItem      = errors.New("cannot use item")
	ErrInvalidTempBagItem = errors.New("invalid item for this temporary bag")
)

// Infrastructure errors
var (
	ErrSystemError        = errors.New("system error")
	ErrDatabaseConnection = errors.New("database connection failed")
	ErrDatabaseQuery      = errors.New("database query failed")
	ErrRTMPConnection     = errors.New("RTMP connection failed")
	ErrAMF0Encode         = errors.New("AMF0 encode failed")
	ErrAMF0Decode         = errors.New("AMF0 decode failed")
)

// RPC errors
var (
	ErrMethodNotFound = errors.New("method not found")
	ErrRateLimited    = errors.New("rate limited")
	ErrInvalidArgs    = errors.New("invalid arguments")
)

// Is checks if the error is of a specific type.
func Is(err, target error) bool {
	return errors.Is(err, target)
}

var expectedErrors = []error{
	ErrNotFound, ErrAlreadyExists, ErrInvalidInput,
	ErrInsufficientLevel, ErrInsufficientStats, ErrInsufficientFunds, ErrInsufficientItems,
	ErrInventoryFull, ErrItemNotEquippable, ErrSlotOccupied,
	ErrQuestNotAvailable, ErrQuestAlreadyTaken, ErrQuestNotCompleted,
	ErrInBattle, ErrNotInBattle, ErrInvalidTarget, ErrSkillOnCooldown,
	ErrInsufficientMP, ErrInsufficientSP, ErrPetDead,
	ErrInsufficientClassRank, ErrSkillRequiresRebirth,
	ErrUnauthorized, ErrInvalidCredentials, ErrSessionExpired,
	ErrAccountBanned, ErrAccountNotFound,
	ErrCharacterNotFound, ErrCharacterNotOwned, ErrServerMaintenance,
	ErrNPCNotFound, ErrSceneItemNotFound, ErrSceneItemExpired,
	ErrCannotPickup, ErrInvalidTeleport,
	ErrItemNotFound, ErrItemNotOwned, ErrInvalidSlot,
	ErrCannotEquip, ErrCannotUnequip, ErrItemBroken,
	ErrCannotStack, ErrCannotUseItem, ErrInvalidTempBagItem,
	ErrMethodNotFound, ErrRateLimited, ErrInvalidArgs,
}

// IsExpected reports whether err is a known business/user-facing error rather than an infrastructure failure.
// Used by RPC plumbing to choose log severity: expected errors log at WARN, real failures at ERROR.
func IsExpected(err error) bool {
	if err == nil {
		return false
	}
	for _, target := range expectedErrors {
		if errors.Is(err, target) {
			return true
		}
	}
	return false
}

// As finds the first error in err's chain that matches target.
func As(err error, target interface{}) bool {
	return errors.As(err, target)
}

// Wrap wraps an error with additional context.
func Wrap(err error, message string) error {
	if err == nil {
		return nil
	}
	return &wrappedError{err: err, msg: message}
}

type wrappedError struct {
	err error
	msg string
}

func (e *wrappedError) Error() string {
	return e.msg + ": " + e.err.Error()
}

func (e *wrappedError) Unwrap() error {
	return e.err
}
