// Open-sourced by BaoLT

package magiccrystal

import (
	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	pkgerrors "mcgame-server/pkg/errors"
)

func parseCrystalIndex(arg interface{}) (int, error) {
	idx, ok := toInt(arg)
	if !ok {
		return 0, pkgerrors.ErrInvalidInput
	}
	if idx < 0 || idx >= appmagiccrystal.MaxSlots {
		return 0, pkgerrors.ErrInvalidInput
	}
	return idx, nil
}

func parsePowerAmount(arg interface{}) (int, error) {
	amount, ok := toInt(arg)
	if !ok || amount <= 0 {
		return 0, pkgerrors.ErrInvalidInput
	}
	return amount, nil
}

func toInt(arg interface{}) (int, bool) {
	switch v := arg.(type) {
	case float64:
		return int(v), true
	case int:
		return v, true
	case int64:
		return int(v), true
	}
	return 0, false
}
