// Open-sourced by BaoLT

package rtmp

import (
	"testing"

	"mcgame-server/internal/presentation/rtmp/chatfmt"
)

func TestNormalizeTextCallbackArgs_FormatsSystemMessages(t *testing.T) {
	args := []interface{}{`Nhận thưởng [@PID|3955713|PlayerName|8|0|0]`}

	normalized := normalizeTextCallbackArgs("onSystemMidMsg", args, nil)

	got, _ := normalized[0].(string)
	want := `Nhận thưởng <font color="#FF9900"><a href="event:L_PID|3955713|PlayerName">[PlayerName]</a></font>`
	if got != want {
		t.Fatalf("normalized system message = %q, want %q", got, want)
	}
}

func TestNormalizeTextCallbackArgs_FormatsOnSayPayload(t *testing.T) {
	args := []interface{}{
		map[string]interface{}{
			"id":  1,
			"msg": `[@N|2549|Sứ Giả Thủ Hộ Jery|0|0|0] `,
		},
	}

	normalized := normalizeTextCallbackArgs("onSay", args, nil)

	payload, _ := normalized[0].(map[string]interface{})
	got, _ := payload["msg"].(string)
	want := `<font color="#FFCC00"><a href="event:L_N|2549|Sứ Giả Thủ Hộ Jery">[Sứ Giả Thủ Hộ Jery]</a></font> `
	if got != want {
		t.Fatalf("normalized onSay msg = %q, want %q", got, want)
	}
}

func TestNormalizeTextCallbackArgs_UsesResolverColor(t *testing.T) {
	args := []interface{}{`Nhận [@ITT|6001|Ngoc|8|0|0]`}

	normalized := normalizeTextCallbackArgs("onBlueMsg", args, chatfmt.LinkResolverFunc(func(token chatfmt.Token) chatfmt.ResolvedLink {
		if token.Type == chatfmt.LinkTypeItemTemplate && token.ID == 6001 {
			return chatfmt.ResolvedLink{Color: "#0066FF"}
		}
		return chatfmt.ResolvedLink{}
	}))

	got, _ := normalized[0].(string)
	want := `Nhận <font color="#0066FF"><a href="event:L_ITT|6001|Ngoc">[Ngoc]</a></font>`
	if got != want {
		t.Fatalf("normalized resolver message = %q, want %q", got, want)
	}
}

func TestNormalizeTextCallbackArgs_LeavesOtherCallbacksUntouched(t *testing.T) {
	args := []interface{}{`[@N|2549|Sứ Giả Thủ Hộ Jery|0|0|0] `}

	normalized := normalizeTextCallbackArgs("onStatus", args, nil)

	got, _ := normalized[0].(string)
	if got != args[0] {
		t.Fatalf("normalized onStatus msg = %q, want unchanged %q", got, args[0])
	}
}
