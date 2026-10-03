// Open-sourced by BaoLT

// Trade service handles in-memory trade sessions and item/currency exchange.
package trade

import (
	"context"
	"fmt"
	"sort"
	"strconv"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func NewService(charRepo CharacterRepository, itemRepo ItemRepository, petRepo PetRepository, logger *zap.Logger) *Service {
	return &Service{
		charRepo:    charRepo,
		itemRepo:    itemRepo,
		petRepo:     petRepo,
		logger:      logger,
		sessions:    make(map[int64]*tradeSession),
		byCharacter: make(map[int64]int64),
		nextTradeID: time.Now().UnixMilli(),
	}
}

func (s *Service) StartTrade(ctx context.Context, initiatorID int64, targetID int64) (*StartResult, error) {
	if initiatorID <= 0 || targetID <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}
	if initiatorID == targetID {
		return nil, fmt.Errorf("cannot trade with yourself")
	}
	if _, err := s.charRepo.FindByID(ctx, initiatorID); err != nil {
		return nil, err
	}
	if _, err := s.charRepo.FindByID(ctx, targetID); err != nil {
		return nil, err
	}

	s.mu.Lock()
	defer s.mu.Unlock()

	if _, exists := s.byCharacter[initiatorID]; exists {
		return nil, fmt.Errorf("you are already in a trade")
	}
	if _, exists := s.byCharacter[targetID]; exists {
		return nil, fmt.Errorf("target is already in a trade")
	}

	s.nextTradeID++
	tradeID := s.nextTradeID

	session := &tradeSession{
		ID:          tradeID,
		InitiatorID: initiatorID,
		TargetID:    targetID,
		CreatedAt:   time.Now(),
		Offers: map[int64]*tradeOffer{
			initiatorID: {
				PetIDs: normalizePetIDs(nil),
				Items:  make(map[int]*offeredItem),
			},
			targetID: {
				PetIDs: normalizePetIDs(nil),
				Items:  make(map[int]*offeredItem),
			},
		},
	}

	s.sessions[tradeID] = session
	s.byCharacter[initiatorID] = tradeID
	s.byCharacter[targetID] = tradeID

	s.logger.Info("Trade session started",
		zap.Int64("trade_id", tradeID),
		zap.Int64("initiator_id", initiatorID),
		zap.Int64("target_id", targetID))

	return &StartResult{
		TradeID:     tradeID,
		InitiatorID: initiatorID,
		TargetID:    targetID,
	}, nil
}

func (s *Service) StopTrade(ctx context.Context, charID int64) (*StopResult, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	session, err := s.getSessionByCharacterLocked(charID)
	if err != nil {
		return nil, nil
	}

	result := &StopResult{
		TradeID:             session.ID,
		InitiatorID:         session.InitiatorID,
		TargetID:            session.TargetID,
		StoppedBy:           charID,
		RestoredByCharacter: buildOfferRestores(session),
	}

	s.detachSessionLocked(session.ID)

	s.logger.Info("Trade session stopped",
		zap.Int64("trade_id", result.TradeID),
		zap.Int64("stopped_by", charID),
		zap.Int64("initiator_id", result.InitiatorID),
		zap.Int64("target_id", result.TargetID))

	return result, nil
}

func (s *Service) LockTrade(ctx context.Context, charID int64, input *LockInput) (*LockResult, error) {
	if input == nil {
		return nil, pkgerrors.ErrInvalidInput
	}

	s.mu.Lock()
	session, err := s.getSessionByCharacterLocked(charID)
	if err != nil {
		s.mu.Unlock()
		return nil, fmt.Errorf("trade session not found")
	}
	targetID := session.otherParty(charID)
	if session.Executing {
		s.mu.Unlock()
		return nil, fmt.Errorf("trade is being finalized")
	}
	s.mu.Unlock()

	offer, err := s.buildOffer(ctx, charID, input)
	if err != nil {
		return nil, err
	}

	s.mu.Lock()
	defer s.mu.Unlock()

	session, err = s.getSessionByCharacterLocked(charID)
	if err != nil {
		return nil, fmt.Errorf("trade session not found")
	}
	targetID = session.otherParty(charID)
	targetOffer := session.Offers[targetID]
	if targetOffer == nil {
		return nil, fmt.Errorf("trade session is invalid")
	}
	if targetOffer.Confirmed {
		targetOffer.Confirmed = false
	}

	offer.Locked = true
	offer.Confirmed = false
	session.Offers[charID] = offer

	s.logger.Info("Trade side locked",
		zap.Int64("trade_id", session.ID),
		zap.Int64("locker_id", charID),
		zap.Int64("target_id", targetID),
		zap.Int64("money", offer.Money),
		zap.Int64("gold", offer.Gold),
		zap.Int("item_count", len(offer.Items)))

	return &LockResult{
		TradeID:       session.ID,
		LockerID:      charID,
		TargetID:      targetID,
		OfferCallback: buildOfferCallback(offer),
		HiddenItems:   offerItemSlots(offer.Items),
	}, nil
}

func (s *Service) ConfirmTrade(ctx context.Context, charID int64) (*ConfirmResult, error) {
	s.mu.Lock()
	session, err := s.getSessionByCharacterLocked(charID)
	if err != nil {
		s.mu.Unlock()
		return nil, fmt.Errorf("trade session not found")
	}

	targetID := session.otherParty(charID)
	selfOffer := session.Offers[charID]
	targetOffer := session.Offers[targetID]
	if selfOffer == nil || targetOffer == nil {
		s.mu.Unlock()
		return nil, fmt.Errorf("trade session is invalid")
	}
	if !selfOffer.Locked || !targetOffer.Locked {
		s.mu.Unlock()
		return nil, fmt.Errorf("both sides must lock before confirming")
	}
	selfOffer.Confirmed = true
	if session.Executing {
		tradeID := session.ID
		s.mu.Unlock()
		return &ConfirmResult{
			TradeID:   tradeID,
			SelfID:    charID,
			TargetID:  targetID,
			Completed: false,
			Received:  []interface{}{},
		}, nil
	}
	if !targetOffer.Confirmed {
		tradeID := session.ID
		s.mu.Unlock()
		return &ConfirmResult{
			TradeID:   tradeID,
			SelfID:    charID,
			TargetID:  targetID,
			Completed: false,
			Received:  []interface{}{},
		}, nil
	}

	session.Executing = true
	snapshot := cloneSession(session)
	s.mu.Unlock()

	execution, execErr := s.executeTrade(ctx, snapshot)
	if execErr != nil {
		s.mu.Lock()
		s.detachSessionLocked(snapshot.ID)
		s.mu.Unlock()
		return &ConfirmResult{
			TradeID:             snapshot.ID,
			SelfID:              charID,
			TargetID:            targetID,
			Completed:           false,
			Failed:              true,
			Info:                execErr.Error(),
			Received:            []interface{}{},
			RestoredByCharacter: buildOfferRestores(snapshot),
		}, nil
	}

	s.mu.Lock()
	s.detachSessionLocked(snapshot.ID)
	s.mu.Unlock()

	s.logger.Info("Trade session completed",
		zap.Int64("trade_id", snapshot.ID),
		zap.Int64("initiator_id", snapshot.InitiatorID),
		zap.Int64("target_id", snapshot.TargetID))

	return &ConfirmResult{
		TradeID:   snapshot.ID,
		SelfID:    charID,
		TargetID:  targetID,
		Completed: true,
		Received:  toItemDTOList(execution.ReceivedByCharacter[charID]),
		AddedByCharacter: map[int64][]map[string]interface{}{
			snapshot.InitiatorID: toItemDTOMapList(execution.ReceivedByCharacter[snapshot.InitiatorID]),
			snapshot.TargetID:    toItemDTOMapList(execution.ReceivedByCharacter[snapshot.TargetID]),
		},
		CurrencyByCharacter: execution.CurrencyByCharacter,
	}, nil
}

func (s *Service) buildOffer(ctx context.Context, charID int64, input *LockInput) (*tradeOffer, error) {
	if input.Money < 0 || input.Gold < 0 {
		return nil, fmt.Errorf("money and gold must be non-negative")
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char.Money < input.Money {
		return nil, fmt.Errorf("not enough silver")
	}
	if char.Gold < input.Gold {
		return nil, fmt.Errorf("not enough gold")
	}

	petIDs := normalizePetIDs(input.PetIDs)
	for _, petID := range petIDs {
		if petID > 0 {
			return nil, fmt.Errorf("pet trade is not supported yet")
		}
	}

	items, err := s.validateLockItems(ctx, charID, input.ItemIDs)
	if err != nil {
		return nil, err
	}

	offer := &tradeOffer{
		Money:     input.Money,
		Gold:      input.Gold,
		PetIDs:    petIDs,
		Items:     items,
		Locked:    false,
		Confirmed: false,
	}
	return offer, nil
}

func (s *Service) validateLockItems(ctx context.Context, charID int64, itemIDs map[int]int64) (map[int]*offeredItem, error) {
	if len(itemIDs) > maxTradeItems {
		return nil, fmt.Errorf("too many trade items")
	}

	seen := make(map[int64]struct{})
	items := make(map[int]*offeredItem, len(itemIDs))
	slotKeys := make([]int, 0, len(itemIDs))
	for slot := range itemIDs {
		slotKeys = append(slotKeys, slot)
	}
	sort.Ints(slotKeys)

	for _, slot := range slotKeys {
		itemID := itemIDs[slot]
		if slot < 1 || slot > maxTradeItems {
			return nil, fmt.Errorf("invalid trade slot index")
		}
		if itemID <= 0 {
			return nil, fmt.Errorf("invalid trade item id")
		}
		if _, exists := seen[itemID]; exists {
			return nil, fmt.Errorf("duplicate trade item")
		}
		seen[itemID] = struct{}{}

		it, err := s.itemRepo.FindByID(ctx, itemID)
		if err != nil {
			return nil, fmt.Errorf("trade item not found")
		}
		if it.CharacterID != charID {
			return nil, fmt.Errorf("trade item is not owned by character")
		}
		if it.SlotType != domainitem.SlotTypeBag {
			return nil, fmt.Errorf("only bag items can be traded")
		}
		if it.IsBound {
			return nil, fmt.Errorf("bound items cannot be traded")
		}

		dto := it.ToDTO()
		items[slot] = &offeredItem{
			Slot:   slot,
			ItemID: itemID,
			SID:    it.CalculateSID(),
			Snapshot: map[string]interface{}{
				"type":     dto["type"],
				"itemId":   dto["itemId"],
				"sid":      dto["sid"],
				"stackNum": dto["stackNum"],
			},
		}
	}

	return items, nil
}

func (s *Service) executeTrade(ctx context.Context, session *tradeSession) (*tradeExecution, error) {
	initOffer := session.Offers[session.InitiatorID]
	targetOffer := session.Offers[session.TargetID]
	if initOffer == nil || targetOffer == nil {
		return nil, fmt.Errorf("trade session is invalid")
	}

	initChar, err := s.charRepo.FindByID(ctx, session.InitiatorID)
	if err != nil {
		return nil, err
	}
	targetChar, err := s.charRepo.FindByID(ctx, session.TargetID)
	if err != nil {
		return nil, err
	}

	if initChar.Money < initOffer.Money || initChar.Gold < initOffer.Gold {
		return nil, fmt.Errorf("initiator does not have enough currency")
	}
	if targetChar.Money < targetOffer.Money || targetChar.Gold < targetOffer.Gold {
		return nil, fmt.Errorf("target does not have enough currency")
	}

	if err := s.ensureBagCapacity(ctx, initChar, len(targetOffer.Items)); err != nil {
		return nil, err
	}
	if err := s.ensureBagCapacity(ctx, targetChar, len(initOffer.Items)); err != nil {
		return nil, err
	}

	initItems, err := s.resolveTradeItems(ctx, session.InitiatorID, initOffer.Items)
	if err != nil {
		return nil, err
	}
	targetItems, err := s.resolveTradeItems(ctx, session.TargetID, targetOffer.Items)
	if err != nil {
		return nil, err
	}

	createdToTarget, err := s.copyItems(ctx, targetChar.ID, initItems)
	if err != nil {
		return nil, err
	}
	createdToInitiator, err := s.copyItems(ctx, initChar.ID, targetItems)
	if err != nil {
		s.rollbackCreatedItems(ctx, createdToTarget)
		return nil, err
	}

	if err := s.deleteOriginalItems(ctx, initOffer.Items); err != nil {
		s.rollbackCreatedItems(ctx, createdToInitiator)
		s.rollbackCreatedItems(ctx, createdToTarget)
		return nil, err
	}
	if err := s.deleteOriginalItems(ctx, targetOffer.Items); err != nil {
		s.rollbackCreatedItems(ctx, createdToInitiator)
		s.rollbackCreatedItems(ctx, createdToTarget)
		return nil, err
	}

	initChar.Money = initChar.Money - initOffer.Money + targetOffer.Money
	initChar.Gold = initChar.Gold - initOffer.Gold + targetOffer.Gold
	targetChar.Money = targetChar.Money - targetOffer.Money + initOffer.Money
	targetChar.Gold = targetChar.Gold - targetOffer.Gold + initOffer.Gold

	if err := s.charRepo.Update(ctx, initChar); err != nil {
		return nil, err
	}
	if err := s.charRepo.Update(ctx, targetChar); err != nil {
		return nil, err
	}

	return &tradeExecution{
		ReceivedByCharacter: map[int64][]*domainitem.Item{
			session.InitiatorID: createdToInitiator,
			session.TargetID:    createdToTarget,
		},
		CurrencyByCharacter: map[int64]TradeCurrency{
			session.InitiatorID: {
				Money: initChar.Money,
				Gold:  initChar.Gold,
			},
			session.TargetID: {
				Money: targetChar.Money,
				Gold:  targetChar.Gold,
			},
		},
	}, nil
}

func (s *Service) resolveTradeItems(ctx context.Context, ownerID int64, items map[int]*offeredItem) (map[int]*domainitem.Item, error) {
	slotKeys := sortedItemSlots(items)
	resolved := make(map[int]*domainitem.Item, len(items))
	for _, slot := range slotKeys {
		entry := items[slot]
		it, err := s.itemRepo.FindByID(ctx, entry.ItemID)
		if err != nil {
			return nil, fmt.Errorf("trade item was not found")
		}
		if it.CharacterID != ownerID {
			return nil, fmt.Errorf("trade item ownership changed")
		}
		if it.SlotType != domainitem.SlotTypeBag {
			return nil, fmt.Errorf("trade item is no longer in bag")
		}
		if it.IsBound {
			return nil, fmt.Errorf("bound items cannot be traded")
		}
		resolved[slot] = it
	}
	return resolved, nil
}

func (s *Service) ensureBagCapacity(ctx context.Context, char *domainchar.Character, incomingItemCount int) error {
	if incomingItemCount <= 0 {
		return nil
	}
	maxSlots := char.MaxBagSlots()
	if maxSlots <= 0 || maxSlots > domainitem.DefaultBagSlots {
		maxSlots = domainitem.DefaultBagSlots
	}
	currentCount, err := s.itemRepo.CountBySlotType(ctx, char.ID, domainitem.SlotTypeBag)
	if err != nil {
		return err
	}
	if currentCount+incomingItemCount > maxSlots {
		return fmt.Errorf("inventory is full")
	}
	return nil
}

func (s *Service) copyItems(ctx context.Context, targetCharID int64, items map[int]*domainitem.Item) ([]*domainitem.Item, error) {
	slotKeys := make([]int, 0, len(items))
	for slot := range items {
		slotKeys = append(slotKeys, slot)
	}
	sort.Ints(slotKeys)

	created := make([]*domainitem.Item, 0, len(slotKeys))
	for _, slot := range slotKeys {
		sourceItem := items[slot]
		targetSlot, err := s.itemRepo.FindFirstEmptySlot(ctx, targetCharID, domainitem.SlotTypeBag, domainitem.DefaultBagSlots)
		if err != nil {
			return nil, err
		}
		cloned := cloneItemForTrade(sourceItem, targetCharID, targetSlot)
		if err := s.itemRepo.Create(ctx, cloned); err != nil {
			return nil, err
		}
		created = append(created, cloned)
	}

	return created, nil
}

func (s *Service) deleteOriginalItems(ctx context.Context, items map[int]*offeredItem) error {
	for _, slot := range sortedItemSlots(items) {
		entry := items[slot]
		if err := s.itemRepo.Delete(ctx, entry.ItemID); err != nil {
			return err
		}
	}
	return nil
}

func (s *Service) rollbackCreatedItems(ctx context.Context, created []*domainitem.Item) {
	for _, it := range created {
		if it == nil || it.ID == 0 {
			continue
		}
		_ = s.itemRepo.Delete(ctx, it.ID)
	}
}

func (s *Service) getSessionByCharacterLocked(charID int64) (*tradeSession, error) {
	tradeID, exists := s.byCharacter[charID]
	if !exists {
		return nil, fmt.Errorf("trade session not found")
	}
	session, exists := s.sessions[tradeID]
	if !exists {
		return nil, fmt.Errorf("trade session not found")
	}
	return session, nil
}

func (s *Service) detachSessionLocked(tradeID int64) {
	session, exists := s.sessions[tradeID]
	if !exists {
		return
	}
	delete(s.byCharacter, session.InitiatorID)
	delete(s.byCharacter, session.TargetID)
	delete(s.sessions, tradeID)
}

func cloneSession(source *tradeSession) *tradeSession {
	if source == nil {
		return nil
	}
	offers := make(map[int64]*tradeOffer, len(source.Offers))
	for charID, offer := range source.Offers {
		offers[charID] = cloneOffer(offer)
	}
	return &tradeSession{
		ID:          source.ID,
		InitiatorID: source.InitiatorID,
		TargetID:    source.TargetID,
		CreatedAt:   source.CreatedAt,
		Offers:      offers,
		Executing:   source.Executing,
	}
}

func cloneOffer(source *tradeOffer) *tradeOffer {
	if source == nil {
		return nil
	}
	items := make(map[int]*offeredItem, len(source.Items))
	for slot, entry := range source.Items {
		items[slot] = &offeredItem{
			Slot:     entry.Slot,
			ItemID:   entry.ItemID,
			SID:      entry.SID,
			Snapshot: cloneMap(entry.Snapshot),
		}
	}
	petIDs := make([]int64, len(source.PetIDs))
	copy(petIDs, source.PetIDs)
	return &tradeOffer{
		Money:     source.Money,
		Gold:      source.Gold,
		PetIDs:    petIDs,
		Items:     items,
		Locked:    source.Locked,
		Confirmed: source.Confirmed,
	}
}

func (s *tradeSession) otherParty(charID int64) int64 {
	if charID == s.InitiatorID {
		return s.TargetID
	}
	return s.InitiatorID
}

func normalizePetIDs(input []int64) []int64 {
	normalized := make([]int64, maxTradePets)
	for i := 0; i < maxTradePets; i++ {
		normalized[i] = -1
	}
	for idx, value := range input {
		if idx >= maxTradePets {
			break
		}
		normalized[idx] = value
	}
	return normalized
}

func buildOfferCallback(offer *tradeOffer) map[string]interface{} {
	itemList := make(map[string]interface{}, len(offer.Items))
	for _, slot := range sortedItemSlots(offer.Items) {
		entry := offer.Items[slot]
		itemList[strconv.Itoa(slot)] = cloneMap(entry.Snapshot)
	}
	petIDs := make([]int64, len(offer.PetIDs))
	copy(petIDs, offer.PetIDs)
	return map[string]interface{}{
		"money":    offer.Money,
		"gold":     offer.Gold,
		"itemList": itemList,
		"petIds":   petIDs,
	}
}

type tradeExecution struct {
	ReceivedByCharacter map[int64][]*domainitem.Item
	CurrencyByCharacter map[int64]TradeCurrency
}

func buildOfferRestores(session *tradeSession) map[int64][]TradeItemSlot {
	if session == nil {
		return nil
	}
	restores := make(map[int64][]TradeItemSlot, len(session.Offers))
	for charID, offer := range session.Offers {
		if offer == nil {
			continue
		}
		restores[charID] = offerItemSlots(offer.Items)
	}
	return restores
}

func offerItemSlots(items map[int]*offeredItem) []TradeItemSlot {
	if len(items) == 0 {
		return nil
	}
	out := make([]TradeItemSlot, 0, len(items))
	for _, slot := range sortedItemSlots(items) {
		entry := items[slot]
		out = append(out, TradeItemSlot{
			ItemID: entry.ItemID,
			SID:    entry.SID,
		})
	}
	return out
}

func sortedItemSlots(items map[int]*offeredItem) []int {
	keys := make([]int, 0, len(items))
	for slot := range items {
		keys = append(keys, slot)
	}
	sort.Ints(keys)
	return keys
}

func cloneItemForTrade(source *domainitem.Item, targetCharID int64, targetSlot int) *domainitem.Item {
	cloned := domainitem.NewItem(targetCharID, source.TemplateID, source.ItemType, domainitem.SlotTypeBag, targetSlot)
	cloned.StackCount = source.StackCount
	cloned.IsBound = source.IsBound
	cloned.EnchantLevel = source.EnchantLevel
	cloned.StarLevel = source.StarLevel
	cloned.ColorCode = source.ColorCode
	cloned.Properties = cloneMap(source.Properties)
	if source.Durability != nil {
		durability := *source.Durability
		cloned.Durability = &durability
	}
	if source.MaxDurability != nil {
		maxDurability := *source.MaxDurability
		cloned.MaxDurability = &maxDurability
	}
	return cloned
}

func cloneMap(source map[string]interface{}) map[string]interface{} {
	if source == nil {
		return map[string]interface{}{}
	}
	cloned := make(map[string]interface{}, len(source))
	for key, value := range source {
		cloned[key] = value
	}
	return cloned
}

func toItemDTOList(items []*domainitem.Item) []interface{} {
	out := make([]interface{}, 0, len(items))
	for _, it := range items {
		if it == nil {
			continue
		}
		out = append(out, it.ToDTO())
	}
	return out
}

func toItemDTOMapList(items []*domainitem.Item) []map[string]interface{} {
	out := make([]map[string]interface{}, 0, len(items))
	for _, it := range items {
		if it == nil {
			continue
		}
		out = append(out, it.ToDTO())
	}
	return out
}
