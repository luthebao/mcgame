// Open-sourced by BaoLT

package activity

import "strconv"

const sendCombineEndTime int64 = 1775664000000

type sendCombineAward struct {
	ItemType  int
	Quality   int
	Original  int
	Discount  int
	ItemID    string
	StackNum  int
	Checkable string
	Binded    int
}

type sendCombineActivity struct {
	ID       string
	BuyNum   int
	Currency string
	Award    []sendCombineAward
	Index    int
	End      int64
	Limit    int
}

var sendCombineActivityConfigs = []sendCombineActivity{
	{
		ID:       "0",
		BuyNum:   0,
		Currency: "gold",
		Award: []sendCombineAward{
			{ItemType: 29, Quality: 0, Original: 14880, Discount: 6997, ItemID: "6861", StackNum: 10, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1888, Discount: 1, ItemID: "408", StackNum: 1, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1, Discount: 1, ItemID: "5351", StackNum: 7, Checkable: "true", Binded: 1},
		},
		Index: 0,
		End:   sendCombineEndTime,
		Limit: 5,
	},
	{
		ID:       "1",
		BuyNum:   0,
		Currency: "gold",
		Award: []sendCombineAward{
			{ItemType: 29, Quality: 0, Original: 14880, Discount: 6997, ItemID: "6974", StackNum: 10, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1888, Discount: 1, ItemID: "408", StackNum: 1, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1, Discount: 1, ItemID: "5351", StackNum: 7, Checkable: "true", Binded: 1},
		},
		Index: 1,
		End:   sendCombineEndTime,
		Limit: 5,
	},
	{
		ID:       "2",
		BuyNum:   0,
		Currency: "gold",
		Award: []sendCombineAward{
			{ItemType: 29, Quality: 0, Original: 17880, Discount: 7997, ItemID: "7036", StackNum: 10, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1888, Discount: 1, ItemID: "408", StackNum: 1, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1, Discount: 1, ItemID: "5351", StackNum: 8, Checkable: "true", Binded: 1},
		},
		Index: 2,
		End:   sendCombineEndTime,
		Limit: 5,
	},
	{
		ID:       "3",
		BuyNum:   0,
		Currency: "gold",
		Award: []sendCombineAward{
			{ItemType: 29, Quality: 0, Original: 10000, Discount: 5952, ItemID: "3376", StackNum: 4, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 5000, Discount: 1, ItemID: "3376", StackNum: 2, Checkable: "true", Binded: 0},
			{ItemType: 29, Quality: 0, Original: 1, Discount: 1, ItemID: "3428", StackNum: 1, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1, Discount: 1, ItemID: "5351", StackNum: 6, Checkable: "true", Binded: 1},
		},
		Index: 3,
		End:   sendCombineEndTime,
		Limit: 5,
	},
	{
		ID:       "4",
		BuyNum:   0,
		Currency: "gold",
		Award: []sendCombineAward{
			{ItemType: 29, Quality: 0, Original: 2144, Discount: 1608, ItemID: "2335", StackNum: 8, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 2820, Discount: 2087, ItemID: "2333", StackNum: 15, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 752, Discount: 1, ItemID: "3491", StackNum: 4, Checkable: "true", Binded: 1},
			{ItemType: 29, Quality: 0, Original: 1, Discount: 1, ItemID: "5351", StackNum: 4, Checkable: "true", Binded: 1},
		},
		Index: 4,
		End:   sendCombineEndTime,
		Limit: 5,
	},
}

func getSendCombineActivityByID(activityID string) (sendCombineActivity, bool) {
	for _, activity := range sendCombineActivityConfigs {
		if activity.ID == activityID {
			return activity, true
		}
	}

	return sendCombineActivity{}, false
}

func buildSendCombineActivities() map[string]interface{} {
	return buildSendCombineActivitiesWithBuyCounts(nil)
}

func buildSendCombineActivitiesWithBuyCounts(buyCounts map[string]int) map[string]interface{} {
	result := make(map[string]interface{}, len(sendCombineActivityConfigs))
	for _, activity := range sendCombineActivityConfigs {
		award := make(map[string]interface{}, len(activity.Award))
		for awardIndex, awardItem := range activity.Award {
			award[strconv.Itoa(awardIndex)] = map[string]interface{}{
				"itemType":  awardItem.ItemType,
				"quality":   awardItem.Quality,
				"original":  awardItem.Original,
				"discount":  awardItem.Discount,
				"itemId":    awardItem.ItemID,
				"stackNum":  awardItem.StackNum,
				"checkable": awardItem.Checkable,
				"binded":    awardItem.Binded,
			}
		}

		buyNum := activity.BuyNum
		if buyCounts != nil {
			if value, ok := buyCounts[activity.ID]; ok && value > 0 {
				buyNum = value
			}
		}

		result[activity.ID] = map[string]interface{}{
			"id":       activity.ID,
			"buyNum":   buyNum,
			"currency": activity.Currency,
			"award":    award,
			"index":    activity.Index,
			"end":      activity.End,
			"limit":    activity.Limit,
		}
	}

	return result
}
