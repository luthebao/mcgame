// Open-sourced by BaoLT

package shop

// BuyResult contains the result of a shop item purchase
type BuyResult struct {
	NewMoney      int64                    `json:"newMoney"`
	Cost          int64                    `json:"cost"`
	CurrencyType  int                      `json:"currencyType"`
	ItemData      map[string]interface{}   `json:"itemData"`
	AddedItemDTO  map[string]interface{}   `json:"addedItemDto"`
	AddedItemDTOs []map[string]interface{} `json:"addedItemDtos"`
}

// SellResult contains the result of selling an item
type SellResult struct {
	NewMoney int64 `json:"newMoney"`
}

// ExchangeResult contains the result of an item exchange
type ExchangeResult struct {
	NewPoints int                    `json:"newPoints"`
	ItemData  map[string]interface{} `json:"itemData"`
}

// RepairResult contains the result of repairing items
type RepairResult struct {
	NewMoney int64 `json:"newMoney"`
}

// UpdateLimitResult contains purchase limit information
type UpdateLimitResult struct {
	DayDict   map[string]int `json:"dayDict"`
	WeekDict  map[string]int `json:"weekDict"`
	MonthDict map[string]int `json:"monthDict"`
	TotalDict map[string]int `json:"totalDict"`
}

// ChangeMoneyTypeResult contains the result of changing money type
type ChangeMoneyTypeResult struct {
	Flag bool `json:"flag"`
	Num  int  `json:"num"`
}

// PurchaseRequest represents a single purchase item in batch purchases
type PurchaseRequest struct {
	ShopSlotID int `json:"shopSlotId"`
	Amount     int `json:"amount"`
}

// BuySystemItemMultiResult contains the result of buying multiple system shop items
type BuySystemItemMultiResult struct {
	Success       bool                     `json:"success"`
	Items         []map[string]interface{} `json:"items"`
	NewMoney      int64                    `json:"newMoney"`
	CurrencyType  int                      `json:"currencyType"`
	AddedItemDTOs []map[string]interface{} `json:"addedItemDtos"`
}

type VIPShopConfigResult struct {
	Flag        bool                     `json:"flag"`
	VIPShop     []map[string]interface{} `json:"vipShop"`
	ReflashTime int64                    `json:"reflashTime"`
	ShopDynamic []map[string]interface{} `json:"shopDynamic"`
	SyncGold    bool                     `json:"syncGold"`
	Gold        int64                    `json:"gold"`
}

type VIPShopPurchaseResult struct {
	Flag        bool                     `json:"flag"`
	ShopDynamic []map[string]interface{} `json:"shopDynamic"`
	Purchase    *BuyResult               `json:"purchase"`
}
