// Open-sourced by BaoLT

// Canonical prop ID enum aligned with BUFF_PROP_NAME_ARR (Language.as:2924-2991).
// IDs 1-68 match the client table exactly.
// IDs 200+ are Go-only synthetic props not present in BUFF_PROP_NAME_ARR.
//
// Scale convention:
//   - Absolute props (HP, MP, Attack, …): raw integer values.
//   - Rate props (crit, dodge chance, resistances, …): per-mille (0-1000, where 1000 = 100%).
package stats

type PropID int32

const (
	PropHP    PropID = 1
	PropMP    PropID = 2
	PropSP    PropID = 3
	PropPhysAtk  PropID = 4
	PropMagAtk   PropID = 5
	PropPhysDef  PropID = 6
	PropMagDef   PropID = 7
	PropAccuracy PropID = 8
	PropDodge    PropID = 9
	PropCounter  PropID = 10
	PropSpeed    PropID = 11
	PropCombo    PropID = 12
	PropCritRate PropID = 13
	PropDefy     PropID = 14
	PropPhysDmgCut PropID = 15
	PropMagDmgCut  PropID = 16
	PropResistStun    PropID = 17
	PropResistConfuse PropID = 18
	PropResistSleep   PropID = 19
	PropResistPoison  PropID = 20
	PropResistLight   PropID = 23
	PropResistRage    PropID = 30
	PropResistCrit    PropID = 31
	PropDebuffHit     PropID = 32
	PropDeathImmune   PropID = 34
	PropConfuseAcc PropID = 52
	PropStunAcc    PropID = 53
	PropPoisonAcc  PropID = 54
	PropRageAcc    PropID = 55
	PropSleepAcc   PropID = 56
	PropLightAcc   PropID = 57
	PropResistDebuff    PropID = 58
	PropFinalPhysDmgDown PropID = 59
	PropFinalMagDmgDown  PropID = 60
	PropResistDefy       PropID = 61
	PropFinalPhysDmgUp   PropID = 62
	PropFinalMagDmgUp    PropID = 63
	PropStrength     PropID = 64
	PropStamina      PropID = 65
	PropAgility      PropID = 66
	PropIntelligence PropID = 67
	PropEnergy       PropID = 68

	PropBreakDeathImmune PropID = 200
	PropCritDmgBonus     PropID = 201
	PropMagDefy          PropID = 202
)
