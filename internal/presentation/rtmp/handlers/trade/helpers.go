// Open-sourced by BaoLT

// Trade handler helpers for argument parsing and callback dispatch.
package trade

import (
	"fmt"
	"reflect"
	"sort"
	"strconv"

	amf0 "github.com/yutopp/go-amf0"
	apptrade "mcgame-server/internal/application/trade"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func parseCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil || charID <= 0 {
		return 0, pkgerrors.ErrUnauthorized
	}
	return charID, nil
}

func parseInt64Value(value interface{}) (int64, bool) {
	switch v := value.(type) {
	case int:
		return int64(v), true
	case int8:
		return int64(v), true
	case int16:
		return int64(v), true
	case int32:
		return int64(v), true
	case int64:
		return v, true
	case uint:
		return int64(v), true
	case uint8:
		return int64(v), true
	case uint16:
		return int64(v), true
	case uint32:
		return int64(v), true
	case uint64:
		if v > uint64(^uint64(0)>>1) {
			return 0, false
		}
		return int64(v), true
	case float32:
		return int64(v), true
	case float64:
		return int64(v), true
	case string:
		parsed, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func parseIntValue(value interface{}) (int, bool) {
	parsed, ok := parseInt64Value(value)
	if !ok {
		return 0, false
	}
	return int(parsed), true
}

func toStringMap(value interface{}) map[string]interface{} {
	switch data := value.(type) {
	case map[string]interface{}:
		return data
	case map[interface{}]interface{}:
		out := make(map[string]interface{}, len(data))
		for key, item := range data {
			out[fmt.Sprint(key)] = item
		}
		return out
	default:
		return nil
	}
}

func toInterfaceSlice(value interface{}) ([]interface{}, bool) {
	switch list := value.(type) {
	case []interface{}:
		return list, true
	case amf0.ECMAArray:
		normalized := make(map[string]interface{}, len(list))
		for key, item := range list {
			normalized[key] = item
		}
		return mapToOrderedSlice(normalized)
	case map[string]interface{}:
		return mapToOrderedSlice(list)
	case map[interface{}]interface{}:
		normalized := make(map[string]interface{}, len(list))
		for key, item := range list {
			normalized[fmt.Sprint(key)] = item
		}
		return mapToOrderedSlice(normalized)
	default:
		raw := reflect.ValueOf(value)
		if !raw.IsValid() {
			return nil, false
		}
		if raw.Kind() != reflect.Slice && raw.Kind() != reflect.Array {
			return nil, false
		}
		out := make([]interface{}, raw.Len())
		for idx := 0; idx < raw.Len(); idx++ {
			out[idx] = raw.Index(idx).Interface()
		}
		return out, true
	}
}

func mapToOrderedSlice(input map[string]interface{}) ([]interface{}, bool) {
	if len(input) == 0 {
		return []interface{}{}, true
	}

	indexes := make([]int, 0, len(input))
	for key := range input {
		if key == "length" {
			continue
		}
		index, err := strconv.Atoi(key)
		if err != nil {
			return nil, false
		}
		indexes = append(indexes, index)
	}
	sort.Ints(indexes)

	out := make([]interface{}, 0, len(indexes))
	for _, index := range indexes {
		out = append(out, input[strconv.Itoa(index)])
	}
	return out, true
}

func (h *Handler) parseLockInput(args []interface{}) (*apptrade.LockInput, error) {
	if len(args) < 1 {
		return nil, fmt.Errorf("missing trade lock payload")
	}

	payload := toStringMap(args[0])
	if payload == nil {
		return nil, fmt.Errorf("invalid trade lock payload")
	}

	input := &apptrade.LockInput{
		ItemIDs: make(map[int]int64),
	}

	if money, ok := parseInt64Value(payload["money"]); ok {
		input.Money = money
	}

	if gold, ok := parseInt64Value(payload["gold"]); ok {
		input.Gold = gold
	}

	if petIDsRaw, exists := payload["petIds"]; exists && petIDsRaw != nil {
		petList, ok := toInterfaceSlice(petIDsRaw)
		if !ok {
			return nil, fmt.Errorf("invalid petIds payload")
		}
		input.PetIDs = make([]int64, 0, len(petList))
		for _, raw := range petList {
			petID, ok := parseInt64Value(raw)
			if !ok {
				return nil, fmt.Errorf("invalid pet id")
			}
			input.PetIDs = append(input.PetIDs, petID)
		}
	}
	if len(input.PetIDs) == 0 {
		if petIDRaw, exists := payload["petId"]; exists && petIDRaw != nil {
			petID, ok := parseInt64Value(petIDRaw)
			if !ok {
				return nil, fmt.Errorf("invalid pet id")
			}
			input.PetIDs = append(input.PetIDs, petID)
		}
	}

	if itemsRaw, exists := payload["items"]; exists && itemsRaw != nil {
		itemsMap := toStringMap(itemsRaw)
		if itemsMap == nil {
			return nil, fmt.Errorf("invalid items payload")
		}
		for slotKey, itemRaw := range itemsMap {
			slotID, err := strconv.Atoi(slotKey)
			if err != nil {
				return nil, fmt.Errorf("invalid item slot")
			}
			itemID, ok := parseInt64Value(itemRaw)
			if !ok {
				return nil, fmt.Errorf("invalid trade item id")
			}
			input.ItemIDs[slotID] = itemID
		}
	}

	return input, nil
}

func uniqueCharacterIDs(ids ...int64) []int64 {
	result := make([]int64, 0, len(ids))
	seen := make(map[int64]struct{}, len(ids))
	for _, id := range ids {
		if id <= 0 {
			continue
		}
		if _, exists := seen[id]; exists {
			continue
		}
		seen[id] = struct{}{}
		result = append(result, id)
	}
	return result
}

func (h *Handler) sendCallbackToCharacter(characterID int64, method string, args ...interface{}) {
	if h == nil || h.rtmpServer == nil || characterID <= 0 {
		return
	}
	conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(characterID, 10))
	if conn == nil {
		return
	}
	if err := conn.SendCallback(method, args...); err != nil {
		h.logger.Warn("Failed to send trade callback",
			zap.String("method", method),
			zap.Int64("character_id", characterID),
			zap.Error(err))
	}
}

func (h *Handler) broadcastTradeCallback(characterIDs []int64, method string, args ...interface{}) {
	for _, charID := range uniqueCharacterIDs(characterIDs...) {
		h.sendCallbackToCharacter(charID, method, args...)
	}
}

func (h *Handler) sendSetSlotSID(characterID int64, itemID int64, sid int) {
	h.sendCallbackToCharacter(characterID, "onSetSlotSid", float64(itemID), sid)
}

func (h *Handler) sendHiddenTradeItems(characterID int64, items []apptrade.TradeItemSlot) {
	for _, item := range items {
		h.sendSetSlotSID(characterID, item.ItemID, -1)
	}
}

func (h *Handler) restoreTradeItems(restoredByCharacter map[int64][]apptrade.TradeItemSlot) {
	for charID, items := range restoredByCharacter {
		for _, item := range items {
			h.sendSetSlotSID(charID, item.ItemID, item.SID)
		}
	}
}

func (h *Handler) sendReceivedTradeItems(addedByCharacter map[int64][]map[string]interface{}) {
	for charID, items := range addedByCharacter {
		for _, item := range items {
			h.sendCallbackToCharacter(charID, "onAddCharactorSlot", item)
		}
	}
}

func (h *Handler) sendTradeCurrencyUpdates(currencyByCharacter map[int64]apptrade.TradeCurrency) {
	for charID, currency := range currencyByCharacter {
		h.sendCallbackToCharacter(charID, "onUPP", map[string]interface{}{
			"money": currency.Money,
			"gold":  currency.Gold,
		})
	}
}

func (h *Handler) broadcastActionState(characterIDs []int64, state int) {
	if h == nil || h.rtmpServer == nil {
		return
	}
	unique := uniqueCharacterIDs(characterIDs...)
	for _, receiverID := range unique {
		conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(receiverID, 10))
		if conn == nil {
			continue
		}
		for _, targetID := range unique {
			payload := map[string]interface{}{
				"cid":   targetID,
				"state": state,
			}
			if err := conn.SendCallback("onSetActionState", payload); err != nil {
				h.logger.Warn("Failed to send onSetActionState",
					zap.Int64("receiver_id", receiverID),
					zap.Int64("target_id", targetID),
					zap.Int("state", state),
					zap.Error(err))
			}
		}
	}
}
