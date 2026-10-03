// Open-sourced by BaoLT

// Shared title-granted callback helpers for RTMP handlers. Emits the client
// `onAddActTitle` / `onAddTitle` pair expected after a successful GrantTitle.
package utils

import "mcgame-server/internal/infrastructure/rtmp"

func SendTitleGrantedCallback(conn *rtmp.Connection, titleID int, titles string, specialTitles string, isSpecial bool) {
	if conn == nil {
		return
	}
	if isSpecial {
		_ = conn.SendCallback("onAddActTitle", specialTitles)
		return
	}
	_ = conn.SendCallback("onAddTitle", map[string]interface{}{
		"f":  1,
		"t":  titleID,
		"ct": titles,
	})
}
