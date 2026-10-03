// Open-sourced by BaoLT

// Callback method names sent over the RTMP connection. These mirror the
// strings the Flash client's CallBack.as / inline Responder bindings expect;
// keeping them as constants lets the compiler catch typos.
package dailysignin

const (
	cbOnUPP                          = "onUPP"
	cbOnYellowMsg                    = "onYellowMsg"
	cbOnRedMsg                       = "onRedMsg"
	cbOnSystemSay                    = "onSystemSay"
	cbOnSystemMidMsgOrNote           = "onSystemMidMsgOrNote"
	cbOnAddCharactorSlot             = "onAddCharactorSlot"
	cbSetBtnsDailySignInAct          = "setBtnsDailySignInAct"
	cbOnDailySignInActDoSignin       = "onDailySignInActDoSignin"
	cbUpdateDailySignInActCrit       = "updateDailySignInActCrit"
	cbOnInitDailySignInActConsumeLim = "oninitDailySignInActConsumeLimit"
)
