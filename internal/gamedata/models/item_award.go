// Open-sourced by BaoLT

package models

import (
	"fmt"
)

type ItemAwardTemplate struct {
	ID          int64                  `json:"id" db:"id"`
	ItemID      float64                `json:"item_id" db:"item_id"`
	AwardID     float64                `json:"award_id" db:"award_id"`
	Type        float64                `json:"type" db:"type"`
	Count       float64                `json:"count" db:"count"`
	Rate        float64                `json:"rate" db:"rate"`
	Quality     float64                `json:"quality" db:"quality"`
	PreNameType float64                `json:"pre_name_type" db:"pre_name_type"`
	Payload     map[string]interface{} `json:"payload" db:"payload"`
}

func (t *ItemAwardTemplate) TableName() string {
	return "TBL_ITEM_AWARD"
}

func (t *ItemAwardTemplate) TableID() int {
	return 144
}

func (t *ItemAwardTemplate) GetID() int {
	return int(t.ID)
}

func (t *ItemAwardTemplate) Validate() error {
	if t.ID <= 0 {
		return fmt.Errorf("invalid TBL_ITEM_AWARD ID: %d", t.ID)
	}
	return nil
}

func (t *ItemAwardTemplate) ToDTO() map[string]interface{} {
	return map[string]interface{}{
		"id":            t.ID,
		"item_id":       t.ItemID,
		"award_id":      t.AwardID,
		"type":          t.Type,
		"count":         t.Count,
		"rate":          t.Rate,
		"quality":       t.Quality,
		"pre_name_type": t.PreNameType,
		"payload":       t.Payload,
	}
}

const AwardPayloadGuaranteedKey = "guaranteed"

func (t *ItemAwardTemplate) IsGuaranteed() bool {
	if t == nil || t.Payload == nil {
		return false
	}
	switch x := t.Payload[AwardPayloadGuaranteedKey].(type) {
	case bool:
		return x
	case float64:
		return x != 0
	}
	return false
}
