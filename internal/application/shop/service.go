// Open-sourced by BaoLT

package shop

import (
	"context"
	"errors"
	"fmt"
	"math"
	"sync"

	"mcgame-server/internal/application/item"
	"mcgame-server/internal/domain/character"
	pkgitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

// ShopService handles business logic for NPC and system shops.
type ShopService interface {
	BuyItem(ctx context.Context, characterID int64, shopSlotID int, amount int) (*BuyResult, error)
	BuySystemItem(ctx context.Context, characterID int64, shopSlotID int, amount int) (*BuyResult, error)
	BuySystemItemMulti(ctx context.Context, characterID int64, purchases []PurchaseRequest) (*BuySystemItemMultiResult, error)
	GetVIPShopConfig(ctx context.Context, characterID int64) (*VIPShopConfigResult, error)
	RefreshVIPShopConfig(ctx context.Context, characterID int64) (*VIPShopConfigResult, error)
	BuyVIPShopItem(ctx context.Context, characterID int64, shopSlotID int, amount int) (*VIPShopPurchaseResult, error)
	SellItem(ctx context.Context, characterID int64, inventoryItemID int64) (*SellResult, error)
	ExchangeItem(ctx context.Context, characterID int64, creditID string, amount int) (*ExchangeResult, error)
	RepairItems(ctx context.Context, characterID int64, repairType int) (*RepairResult, error)
	GetUpdateLimit(ctx context.Context, characterID int64) (*UpdateLimitResult, error)
	GetShopAwardStr(ctx context.Context, characterID int64) (string, error)
	ChangeMoneyType(ctx context.Context, characterID int64, moneyType int) (*ChangeMoneyTypeResult, error)
	SetCharacterRepository(repo character.Repository)
	SetGameDataManager(mgr *gamedata.Manager)
	SetItemService(svc *item.Service)
	SetVIPShopRepository(repo VIPShopRepository)
	SetLogger(logger *zap.Logger)
}

type shopService struct {
	charRepo    character.Repository
	gameDataRec *gamedata.Manager
	itemService *item.Service
	vipShopRepo VIPShopRepository
	logger      *zap.Logger
	vipMu       sync.Mutex
	vipDynamic  []vipShopDynamicEntry
}

func NewService() ShopService {
	return &shopService{
		vipDynamic: make([]vipShopDynamicEntry, 0, vipShopDynamicLimit),
	}
}

func (s *shopService) SetVIPShopRepository(repo VIPShopRepository) {
	s.vipShopRepo = repo
}

func (s *shopService) SetLogger(logger *zap.Logger) {
	s.logger = logger
}

func (s *shopService) SetGameDataManager(mgr *gamedata.Manager) {
	s.gameDataRec = mgr
}

func (s *shopService) SetItemService(svc *item.Service) {
	s.itemService = svc
}

// BuyItem is the main entry point for buying items from NPC shops.
// It supports basic currencies (Money, Gold) AND special currencies via PType1/PType2.
func (s *shopService) BuyItem(ctx context.Context, characterID int64, shopSlotID int, amount int) (*BuyResult, error) {
	if s.charRepo == nil {
		return nil, errors.New("character repository not initialized")
	}
	if s.gameDataRec == nil {
		return nil, errors.New("game data manager not initialized")
	}
	if s.itemService == nil {
		return nil, errors.New("item service not initialized")
	}

	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	shopSlot, err := s.resolveSystemShopSlot(shopSlotID)
	if err != nil {
		return nil, err
	}

	// 2. Identify Item Type & Template
	var itemName string
	var itemKind int
	var itemTableType int // 29 or 19
	var itType pkgitem.ItemType
	var itemTpl *models.ItemTemplateTemplate    // For fallback pricing
	var equipTpl *models.EquiptTemplateTemplate // For equipment

	// Logic: TBL_SHOP_SLOT.type: 19 = TBL_EQUIPT_TEMPLATE, other = TBL_ITEM_TEMPLATE
	if int(shopSlot.Type) == 19 {
		// --- EQUIPMENT ---
		equipTpl = s.gameDataRec.GetEquipment(int(shopSlot.ItemID))
		if equipTpl == nil {
			return nil, errors.New("equipment template not found")
		}
		itemName = equipTpl.Name
		itemKind = int(equipTpl.Kind)
		itemTableType = 19
		itType = pkgitem.ItemTypeEquipment

	} else {
		// --- STANDARD ITEM ---
		itemTpl = s.gameDataRec.GetItem(int(shopSlot.ItemID))
		if itemTpl == nil {
			return nil, errors.New("item template not found")
		}
		itemName = itemTpl.Name
		itemKind = int(itemTpl.Kind)
		itemTableType = 29

		// Determine internal ItemType based on ItemTemplate Kind
		itType = pkgitem.ItemTypeConsumable
		if itemKind == 1 {
			itType = pkgitem.ItemTypeEquipment
		}
	}

	// 3. Calculate Cost and Currency Type
	var cost int64
	var currencyType int // 1=Silver Bind, 2=Silver, 3=GoldBind, 4=Gold, or special currency type
	var newMoney int64

	// Determine price source: shop_slot or item_template (fallback)
	shopGold := shopSlot.Gold
	shopMoney := shopSlot.Money

	// Fallback to item_template if shop_slot has no price
	if shopGold == 0 && shopMoney == 0 && itemTpl != nil {
		shopGold = itemTpl.Gold
		shopMoney = itemTpl.Price
	}

	// Logic:
	// Priority 1: If PType1 > 0, use special currency (PType1)
	// Priority 2: If Gold > 0, use Gold currency (prefer SelectedMoneyType if it's 3 or 4, else default to 3)
	// Priority 3: If Money > 0, use Silver currency (prefer SelectedMoneyType if it's 1 or 2, else default to 1)

	if shopSlot.PType1 > 0 {
		// --- SPECIAL CURRENCY LOGIC (PType1) ---
		currencyType = int(shopSlot.PType1)
		cost = int64(shopSlot.PNum1) * int64(amount)

		if err := char.DeductCurrency(currencyType, int(cost)); err != nil {
			return nil, err
		}
		// For special currencies, newMoney depends on the currency type
		// This is handled by DeductCurrency, but we need to get the updated value
		// For now, set to 0 as special currencies may not have a direct "newMoney" field
		newMoney = 0
	} else if shopGold > 0 {
		if int(shopSlot.Gt) == 1 {
			currencyType = 4
		} else if char.SelectedGoldType == 3 || char.SelectedGoldType == 4 {
			currencyType = char.SelectedGoldType
		} else {
			currencyType = 3
		}

		cost = int64(shopGold) * int64(amount)

		switch currencyType {
		case 3: // GoldBind
			if char.GoldBind < cost {
				return nil, errors.New("not enough gold bound")
			}
			char.GoldBind -= cost
			newMoney = char.GoldBind
		case 4: // Gold
			if char.Gold < cost {
				return nil, errors.New("not enough gold")
			}
			char.Gold -= cost
			newMoney = char.Gold
		}
	} else if shopMoney > 0 {
		if int(shopSlot.Gt) == 1 {
			currencyType = 2
		} else if char.SelectedMoneyType == 1 || char.SelectedMoneyType == 2 {
			currencyType = char.SelectedMoneyType
		} else {
			currencyType = 1
		}

		cost = int64(shopMoney) * int64(amount)

		switch currencyType {
		case 1: // MoneyBind (Silver Bound)
			if char.MoneyBind < cost {
				return nil, errors.New("not enough silver bound")
			}
			char.MoneyBind -= cost
			newMoney = char.MoneyBind
		case 2: // Money (Silver)
			if char.Money < cost {
				return nil, errors.New("not enough silver")
			}
			char.Money -= cost
			newMoney = char.Money
		}
	} else {
		// No cost defined in both shop_slot and item_template
		return nil, errors.New("item has no price defined")
	}

	// 3a. Calculate Cost for PType2 (Secondary Cost)
	if shopSlot.PType2 > 0 {
		currencyType2 := int(shopSlot.PType2)
		cost2 := int64(shopSlot.PNum2) * int64(amount)

		if err := char.DeductCurrency(currencyType2, int(cost2)); err != nil {
			return nil, err
		}
	}

	// Calculate ColorCode from Quality: color = quality / 5 (round up)
	colorCode := int(math.Ceil(shopSlot.Quality / 5))

	// Bind item if purchased with GoldBind (currencyType = 3 || currencyType == 1)
	binded := (currencyType == 3 || currencyType == 1)
	beforeStacks, err := s.snapshotPurchaseBagStacks(ctx, characterID, int(shopSlot.ItemID), itType, binded)
	if err != nil {
		return nil, err
	}
	addedItem, err := s.itemService.AddItemWithBindAndColor(ctx, characterID, int(shopSlot.ItemID), itType, amount, binded, colorCode)
	if err != nil {
		return nil, err
	}
	addedItemDTOs, err := s.changedPurchaseBagDTOs(ctx, characterID, int(shopSlot.ItemID), itType, binded, beforeStacks)
	if err != nil {
		return nil, err
	}
	if itType == pkgitem.ItemTypeEquipment {
		itemName = pkgitem.FormatEquipmentDisplayName(itemName, addedItem.ColorCode)
	}

	// 5. Save Character State (Money/Points)
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	return &BuyResult{
		NewMoney:     newMoney, // In Special Currency case, client might ignore this or need specific field update
		Cost:         cost,
		CurrencyType: currencyType,
		ItemData: map[string]interface{}{
			"i":  addedItem.TemplateID, // Template ID
			"q":  amount,               // Purchase quantity
			"s":  "",                   // Slot Index
			"c":  pkgitem.PopupNoticeColor(itType, addedItem.ColorCode),
			"t":  itemTableType, // TBL_ITEM_TEMPLATE or TBL_EQUIPT_TEMPLATE
			"n":  itemName,      // Name
			"tt": itemKind,      //Kind
		},
		AddedItemDTO:  addedItem.ToDTO(),
		AddedItemDTOs: addedItemDTOs,
	}, nil
}

func (s *shopService) BuySystemItem(ctx context.Context, characterID int64, shopSlotID int, amount int) (*BuyResult, error) {
	// BuySystemItem handles purchases from system shops (e.g., SystemShopPanel, ConsumPanel)
	// Only supports: Gold (Vàng/Kim phiếu) and Points (Điểm thưởng)

	if s.charRepo == nil {
		return nil, errors.New("character repository not initialized")
	}
	if s.gameDataRec == nil {
		return nil, errors.New("game data manager not initialized")
	}
	if s.itemService == nil {
		return nil, errors.New("item service not initialized")
	}

	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	shopSlot, err := s.resolveSystemShopSlot(shopSlotID)
	if err != nil {
		return nil, err
	}

	// 2. Identify Item Type & Template
	var itemName string
	var itemKind int
	var itType pkgitem.ItemType
	var itemTpl *models.ItemTemplateTemplate
	var equipTpl *models.EquiptTemplateTemplate

	// Logic: TBL_SHOP_SLOT.type: 29 = TBL_ITEM_TEMPLATE, other = TBL_EQUIPT_TEMPLATE
	if int(shopSlot.Type) == 29 {
		// --- STANDARD ITEM ---
		itemTpl = s.gameDataRec.GetItem(int(shopSlot.ItemID))
		if itemTpl == nil {
			return nil, errors.New("item template not found")
		}
		itemName = itemTpl.Name
		itemKind = int(itemTpl.Kind)
		itType = pkgitem.ItemTypeConsumable
		if itemKind == 1 {
			itType = pkgitem.ItemTypeEquipment
		}
	} else {
		// --- EQUIPMENT ---
		equipTpl = s.gameDataRec.GetEquipment(int(shopSlot.ItemID))
		if equipTpl == nil {
			return nil, errors.New("equipment template not found")
		}
		itemName = equipTpl.Name
		itemKind = int(equipTpl.Kind)
		itType = pkgitem.ItemTypeEquipment
	}

	// 3. Calculate Cost and Currency Type
	// System Shop ONLY supports: Gold (3,4) and Points special currencies
	var cost int64
	var currencyType int
	var newMoney int64

	// Check if using Points (special currency)
	if shopSlot.Point > 0 {
		// Using Points system
		currencyType = 0 // Special: Points (not a standard currency type)
		cost = int64(shopSlot.Point) * int64(amount)

		if char.Honor < int(cost) {
			return nil, errors.New("not enough points")
		}
		char.Honor -= int(cost)
		newMoney = int64(char.Honor)
	} else {
		// Using Gold (Kim phiếu/Vàng)
		// System shop ONLY accepts Gold, not Silver
		if int(shopSlot.Gt) == 1 {
			currencyType = 4
		} else {
			currencyType = char.SelectedGoldType
		}

		// Force to Gold if not already set to Gold type
		if currencyType != 3 && currencyType != 4 {
			currencyType = 3
		}

		costPerItem := int64(shopSlot.Gold)
		cost = costPerItem * int64(amount)

		// Deduct Gold
		switch currencyType {
		case 3: // GoldBind (Kim phiếu khóa)
			if char.GoldBind < cost {
				return nil, errors.New("not enough gold bind")
			}
			char.GoldBind -= cost
			newMoney = char.GoldBind
		case 4: // Gold (Kim phiếu)
			if char.Gold < cost {
				return nil, errors.New("not enough gold")
			}
			char.Gold -= cost
			newMoney = char.Gold
		default:
			return nil, errors.New("system shop only accepts gold")
		}
	}

	// 4. Add Item to Inventory
	// itType is already determined above based on shopSlot.Type

	// Calculate ColorCode from Quality: color = quality / 5 (round up)
	colorCode := int(math.Ceil(shopSlot.Quality / 5))

	// Bind item if purchased with GoldBind (currencyType = 3)
	binded := (currencyType == 3)
	beforeStacks, err := s.snapshotPurchaseBagStacks(ctx, characterID, int(shopSlot.ItemID), itType, binded)
	if err != nil {
		return nil, err
	}
	addedItem, err := s.itemService.AddItemWithBindAndColor(ctx, characterID, int(shopSlot.ItemID), itType, amount, binded, colorCode)
	if err != nil {
		return nil, err
	}
	addedItemDTOs, err := s.changedPurchaseBagDTOs(ctx, characterID, int(shopSlot.ItemID), itType, binded, beforeStacks)
	if err != nil {
		return nil, err
	}
	if itType == pkgitem.ItemTypeEquipment {
		itemName = pkgitem.FormatEquipmentDisplayName(itemName, addedItem.ColorCode)
	}

	// 5. Save Character State
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	// Determine table type for response
	itemTableType := 29
	if int(shopSlot.Type) != 29 {
		itemTableType = 19
	}

	return &BuyResult{
		NewMoney:     newMoney,
		Cost:         cost,
		CurrencyType: currencyType,
		ItemData: map[string]interface{}{
			"i":  addedItem.TemplateID, // Template ID
			"q":  amount,               // Purchase quantity
			"s":  "",                   // Slot Index
			"c":  pkgitem.PopupNoticeColor(itType, addedItem.ColorCode),
			"t":  itemTableType, // TBL_ITEM_TEMPLATE or TBL_EQUIPT_TEMPLATE
			"n":  itemName,      // Name
			"tt": itemKind,      //Kind
		},
		AddedItemDTO:  addedItem.ToDTO(),
		AddedItemDTOs: addedItemDTOs,
	}, nil
}

func (s *shopService) SellItem(ctx context.Context, characterID int64, inventoryItemID int64) (*SellResult, error) {
	// Mock: assume sell is successful
	return &SellResult{
		NewMoney: 1234567,
	}, nil
}

func (s *shopService) ExchangeItem(ctx context.Context, characterID int64, creditID string, amount int) (*ExchangeResult, error) {
	// Mock: assume exchange is successful
	return &ExchangeResult{
		NewPoints: 500,
		ItemData: map[string]interface{}{
			"t": 19,   // TBL_EQUIPT_TEMPLATE
			"i": 2001, // Mock equipment ID
		},
	}, nil
}

func (s *shopService) RepairItems(ctx context.Context, characterID int64, repairType int) (*RepairResult, error) {
	if s.itemService == nil {
		return nil, errors.New("item service not initialized")
	}

	result, err := s.itemService.RepairAll(ctx, characterID)
	if err != nil {
		return nil, err
	}

	return &RepairResult{
		NewMoney: result.NewMoney,
	}, nil
}

func (s *shopService) GetUpdateLimit(ctx context.Context, characterID int64) (*UpdateLimitResult, error) {
	// FLOW XỬ LÝ BUSINESS LOGIC:
	// 1. Xác định các mốc thời gian:
	//    - Hôm nay (00:00:00 đến hiện tại)
	//    - Tuần này (Thứ 2 đến hiện tại)
	//    - Tháng này (Ngày 1 đến hiện tại)
	// 2. Truy vấn Database (bảng log giao dịch/mua sắm):
	//    - SELECT credit_id, SUM(amount) FROM shop_logs
	//      WHERE character_id = ? AND time >= [Mốc thời gian]
	//      GROUP BY credit_id
	// 3. Phân loại kết quả vào các Map (DayDict, WeekDict, MonthDict, TotalDict).
	// 4. Client sẽ dùng dữ liệu này trừ đi giới hạn trong cấu hình TBL_CREDIT để hiển thị số lượng còn lại.

	// Mock: Giả lập một vài dữ liệu để Client hiển thị
	return &UpdateLimitResult{
		// Ví dụ: Vật phẩm 'item_1' hôm nay đã mua 2 cái
		DayDict: map[string]int{
			"1": 2, // '1' là creditID (giả định)
		},
		// Ví dụ: Vật phẩm 'item_2' tuần này đã mua 5 cái
		WeekDict: map[string]int{
			"2": 5,
		},
		MonthDict: make(map[string]int),
		TotalDict: make(map[string]int),
	}, nil
}
func (s *shopService) GetShopAwardStr(ctx context.Context, characterID int64) (string, error) {
	// GetShopAwardStr returns a string description of shop awards/rewards
	// Used in SystemShopTrolleyPanel to display award information
	// Mock: return empty string or formatted award description
	return "", nil
}

func (s *shopService) ChangeMoneyType(ctx context.Context, characterID int64, moneyType int) (*ChangeMoneyTypeResult, error) {
	if s.charRepo == nil {
		return nil, errors.New("character repository not initialized")
	}

	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	switch moneyType {
	case 1, 2:
		char.SelectedMoneyType = moneyType
	case 3, 4:
		char.SelectedGoldType = moneyType
	default:
		return nil, errors.New("invalid money type")
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	return &ChangeMoneyTypeResult{
		Flag: true,
		Num:  moneyType,
	}, nil
}

func (s *shopService) SetCharacterRepository(repo character.Repository) {
	s.charRepo = repo
}

func (s *shopService) BuySystemItemMulti(ctx context.Context, characterID int64, purchases []PurchaseRequest) (*BuySystemItemMultiResult, error) {
	// 1. Load Character
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	// 2. Prepare Transaction Data
	var itemsToAdd []struct {
		Slot     *models.ShopSlotTemplate
		ItemTpl  *models.ItemTemplateTemplate
		EquipTpl *models.EquiptTemplateTemplate
		ItemName string
		ItemKind int
		Amount   int
		Cost     int64
		PType    int // 0=Point, 3/4=Gold/GoldBind
	}

	totalGold := int64(0)
	totalGoldBind := int64(0)
	totalPoint := int64(0)

	// Default Gold Currency Type preference
	goldType := char.SelectedGoldType
	if goldType != 3 && goldType != 4 {
		goldType = 3
	}

	// 3. Validation & Cost Calculation Loop
	for _, req := range purchases {
		if req.Amount <= 0 {
			continue
		}
		shopSlot, err := s.resolveSystemShopSlot(req.ShopSlotID)
		if err != nil {
			return nil, err
		}

		// Get template based on shopSlot.Type
		var itemTpl *models.ItemTemplateTemplate
		var equipTpl *models.EquiptTemplateTemplate
		var itemName string
		var itemKind int

		if int(shopSlot.Type) == 29 {
			// --- STANDARD ITEM ---
			itemTpl = s.gameDataRec.GetItem(int(shopSlot.ItemID))
			if itemTpl == nil {
				return nil, fmt.Errorf("item template %d not found", int(shopSlot.ItemID))
			}
			itemName = itemTpl.Name
			itemKind = int(itemTpl.Kind)
		} else {
			// --- EQUIPMENT ---
			equipTpl = s.gameDataRec.GetEquipment(int(shopSlot.ItemID))
			if equipTpl == nil {
				return nil, fmt.Errorf("equipment template %d not found", int(shopSlot.ItemID))
			}
			itemName = equipTpl.Name
			itemKind = int(equipTpl.Kind)
		}

		// Determine Currency & Cost for this item
		var cost int64
		var pType int

		if shopSlot.Point > 0 {
			// Point Item
			cost = int64(shopSlot.Point) * int64(req.Amount)
			totalPoint += cost
			pType = 0
		} else {
			// Gold Item
			cost = int64(shopSlot.Gold) * int64(req.Amount)
			if goldType == 3 {
				totalGoldBind += cost
			} else {
				totalGold += cost
			}
			pType = goldType
		}

		itemsToAdd = append(itemsToAdd, struct {
			Slot     *models.ShopSlotTemplate
			ItemTpl  *models.ItemTemplateTemplate
			EquipTpl *models.EquiptTemplateTemplate
			ItemName string
			ItemKind int
			Amount   int
			Cost     int64
			PType    int
		}{shopSlot, itemTpl, equipTpl, itemName, itemKind, req.Amount, cost, pType})
	}

	// 4. Check Balances
	if int64(char.Honor) < totalPoint {
		return nil, errors.New("not enough points")
	}
	if char.GoldBind < totalGoldBind {
		return nil, errors.New("not enough gold bind")
	}
	if char.Gold < totalGold {
		return nil, errors.New("not enough gold")
	}

	// 5. Execution: Deduct & Add Items
	// Deduct
	char.Honor -= int(totalPoint)
	char.GoldBind -= totalGoldBind
	char.Gold -= totalGold

	var resultItems []map[string]interface{}
	var resultDTOs []map[string]interface{}

	for _, item := range itemsToAdd {
		// Add to inventory
		itType := pkgitem.ItemTypeConsumable
		if item.ItemKind == 1 {
			itType = pkgitem.ItemTypeEquipment
		}

		// Calculate ColorCode from Quality: color = quality / 5 (round up)
		colorCode := int(math.Ceil(item.Slot.Quality / 5))

		// Bind item if purchased with GoldBind (currencyType = 3)
		binded := (item.PType == 3)
		beforeStacks, err := s.snapshotPurchaseBagStacks(ctx, char.ID, int(item.Slot.ItemID), itType, binded)
		if err != nil {
			return nil, err
		}
		addedItem, err := s.itemService.AddItemWithBindAndColor(ctx, char.ID, int(item.Slot.ItemID), itType, item.Amount, binded, colorCode)
		if err != nil {
			return nil, fmt.Errorf("failed to add item %d: %v", int(item.Slot.ItemID), err)
		}
		addedItemDTOs, err := s.changedPurchaseBagDTOs(ctx, char.ID, int(item.Slot.ItemID), itType, binded, beforeStacks)
		if err != nil {
			return nil, err
		}

		displayName := item.ItemName
		if itType == pkgitem.ItemTypeEquipment {
			displayName = pkgitem.FormatEquipmentDisplayName(displayName, addedItem.ColorCode)
		}

		// Determine table type for response
		itemTableType := 29
		if int(item.Slot.Type) != 29 {
			itemTableType = 19
		}

		resultItems = append(resultItems, map[string]interface{}{
			"i":  addedItem.TemplateID,
			"q":  item.Amount,
			"s":  "",
			"c":  pkgitem.PopupNoticeColor(itType, addedItem.ColorCode),
			"t":  itemTableType,
			"n":  displayName,
			"tt": item.ItemKind,
		})
		resultDTOs = append(resultDTOs, addedItemDTOs...)
	}

	// 6. Save Character
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	var newMoney int64
	var currencyType int
	if totalGold > 0 {
		newMoney = char.Gold
		currencyType = 4
	} else if totalGoldBind > 0 {
		newMoney = char.GoldBind
		currencyType = 3
	} else {
		newMoney = int64(char.Honor)
		currencyType = 0
	}

	return &BuySystemItemMultiResult{
		Success:       true,
		Items:         resultItems,
		AddedItemDTOs: resultDTOs,
		NewMoney:      newMoney,
		CurrencyType:  currencyType,
	}, nil
}
