// Open-sourced by BaoLT

// Stone Seal 'add' block computation for the login cData stoneSealInfo payload.
// Reads inlaid gem template ids from equipped item Properties (t1..t10) and the
// corresponding stone template ids from the persisted stone-seal state data (s1..s10),
// then combines them with the bonus tables in stoneseal_addconf.go to produce
// add[equipSid][holeIndex] = {t, n}.
// Formula matches StoneSealPanel.as refreshAddPropTxt (lines 3394-3437);
// the /10000 division visible there is display-only — the server emits the raw n value.
package statfeature

import (
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/magicweapon"
	"mcgame-server/internal/gamedata/models"
)

type StoneSealItemAccessor interface {
	GetItem(id int) *models.ItemTemplateTemplate
}

func computeStoneSealAddBlock(
	stoneSealState map[string]interface{},
	equippedByEquipSid map[int]*domainitem.Item,
	accessor StoneSealItemAccessor,
) map[string]interface{} {
	if accessor == nil || len(equippedByEquipSid) == 0 {
		return nil
	}

	stoneRaw, ok := stoneSealState["stone"].(map[string]interface{})
	if !ok || len(stoneRaw) == 0 {
		return nil
	}

	addBlock := map[string]interface{}{}

	for equipSid, item := range equippedByEquipSid {
		sidKey := strconv.Itoa(equipSid)
		sealEntry, ok := stoneRaw[sidKey].(map[string]interface{})
		if !ok {
			continue
		}
		dataRaw, ok := sealEntry["data"].(map[string]interface{})
		if !ok || len(dataRaw) == 0 {
			continue
		}
		lvl := 0
		if lvlRaw, ok2 := sealEntry["lvl"]; ok2 {
			if v, ok3 := intValue(lvlRaw); ok3 {
				lvl = v
			}
		}
		if lvl < 0 || lvl > 5 {
			lvl = 0
		}
		succinctMult := stoneSealSuccinctConf[lvl]

		holesBlock := map[string]interface{}{}

		for i := 1; i <= 10; i++ {
			gemTplID := 0
			tKey := magicweapon.TSlotKey(i)
			if tKey != "" {
				if raw, exists := item.Properties[tKey]; exists {
					if v, ok2 := intValue(raw); ok2 {
						gemTplID = v
					}
				}
			}
			if gemTplID <= 0 {
				continue
			}

			stoneTplID := 0
			sKey := "s" + strconv.Itoa(i)
			if raw, exists := dataRaw[sKey]; exists {
				if v, ok2 := intValue(raw); ok2 {
					stoneTplID = v
				}
			}
			if stoneTplID <= 0 {
				continue
			}

			gemTpl := accessor.GetItem(gemTplID)
			stoneTpl := accessor.GetItem(stoneTplID)
			if gemTpl == nil || stoneTpl == nil {
				continue
			}

			gemPT := int(gemTpl.PropType)
			stonePT := int(stoneTpl.PropType)
			if gemPT <= 0 || stonePT <= 0 {
				continue
			}

			minPT := gemPT
			maxPT := stonePT
			if stonePT < gemPT {
				minPT = stonePT
				maxPT = gemPT
			}

			innerMap, ok2 := stoneSealConfExtraProperty[minPT]
			if !ok2 {
				continue
			}
			entry, ok3 := innerMap[maxPT]
			if !ok3 || entry.N == 0 {
				continue
			}

			colorBonus := float64(int(gemTpl.Color) + int(stoneTpl.Color) + 2)
			n := entry.V * colorBonus * succinctMult
			if n == 0 {
				continue
			}

			holesBlock[strconv.Itoa(i)] = map[string]interface{}{
				"t": entry.N,
				"n": n,
			}
		}

		if len(holesBlock) > 0 {
			addBlock[sidKey] = holesBlock
		}
	}

	if len(addBlock) == 0 {
		return nil
	}
	return addBlock
}

func buildEquippedItemsByEquipSid(items []*domainitem.Item) map[int]*domainitem.Item {
	result := map[int]*domainitem.Item{}
	for _, it := range items {
		if it == nil || it.SlotType != domainitem.SlotTypeEquipped {
			continue
		}
		equipSid := it.SlotIndex + 1
		result[equipSid] = it
	}
	return result
}
