// Open-sourced by BaoLT

package magicweapon

const (
	PropKeyMainProp1     = "mainProp1"
	PropKeyMainPropNum1  = "mainPropNum1"
	PropKeyMainProp2     = "mainProp2"
	PropKeyMainPropNum2  = "mainPropNum2"
	PropKeyProp1         = "prop1"
	PropKeyPropNum1      = "propNum1"
	PropKeyProp2         = "prop2"
	PropKeyPropNum2      = "propNum2"
	PropKeyBindMainPNum1 = "bindMainPropNum1"
	PropKeyBindMainPNum2 = "bindMainPropNum2"
	PropKeyT1            = "t1"
	PropKeyT2            = "t2"
	PropKeyT3            = "t3"
	PropKeyT4            = "t4"
	PropKeyT5            = "t5"
	PropKeyT6            = "t6"
	PropKeyT7            = "t7"
	PropKeyT8            = "t8"
	PropKeyT9            = "t9"
	PropKeyT10           = "t10"
	PropKeyFlag          = "flag"
	PropKeyElement       = "element"
	PropKeyMaker         = "maker"
)

var TSlotKeys = [10]string{
	PropKeyT1, PropKeyT2, PropKeyT3, PropKeyT4, PropKeyT5,
	PropKeyT6, PropKeyT7, PropKeyT8, PropKeyT9, PropKeyT10,
}

func TSlotKey(slot int) string {
	if slot < 1 || slot > 10 {
		return ""
	}
	return TSlotKeys[slot-1]
}
