// Open-sourced by BaoLT

// Outbound currency callback helpers for the Flash client.
// SendMinusMoneyNew emits the onMinusMoneyNew batch-deduction callback.
// Single-currency credits/deductions still go through the inline onAddMoney(-delta) path at each call site.
//
// onMinusMoneyNew wire shape: [cid, [{currentNum, moneyType, num, type}]]
// where "type" is a numeric source classifier (28 = stoneSealPoint, 35 = mysteryCrystal).
// The full type vocabulary is not yet derivable from two captured samples (OQ7).
// Default to 0 when the source id is unknown.
//
// NOTE: these helpers are ADDITIVE alongside the existing onAddMoney(-delta) path.
// Do not remove onAddMoney deductions until client binding of onMinusMoneyNew is confirmed.
package utils

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

const (
	MinusMoneyTypeUnknown        = 0
	MinusMoneyTypeStoneSeal      = 28
	MinusMoneyTypeMysteryCrystal = 35
)

type MinusMoneyEntry struct {
	CurrentNum int64
	MoneyType  string
	Num        int64
	Type       int
}

func SendMinusMoneyNew(conn *rtmp.Connection, charID int64, entries []MinusMoneyEntry) error {
	if conn == nil || len(entries) == 0 {
		return nil
	}
	wireEntries := make([]interface{}, 0, len(entries))
	for _, e := range entries {
		wireEntries = append(wireEntries, map[string]interface{}{
			"currentNum": float64(e.CurrentNum),
			"moneyType":  e.MoneyType,
			"num":        float64(e.Num),
			"type":       e.Type,
		})
	}
	return conn.SendCallback("onMinusMoneyNew", float64(charID), wireEntries)
}
