// Open-sourced by BaoLT

// Vietnamese error messages for the star instance handler.
package starinstance

import (
	"errors"

	appstarinstance "mcgame-server/internal/application/starinstance"
)

var warMapErrorMessages = []struct {
	err error
	msg string
}{
	{appstarinstance.ErrInvalidSid, "Mã cung hoàng đạo không hợp lệ (1-12)"},
	{appstarinstance.ErrInvalidLevel, "Cấp độ không hợp lệ (1-12)"},
	{appstarinstance.ErrOutOfAttempts, "Số lần khiêu chiến đã hết"},
	{appstarinstance.ErrAttemptCapReached, "Đã đạt giới hạn số lần mua tối đa"},
	{appstarinstance.ErrInsufficientGold, "Không đủ vàng"},
	{appstarinstance.ErrInvalidCurrentMax, "Giá trị số lần không hợp lệ"},
	{appstarinstance.ErrCultivationRequired, "Cần nâng cấp tinh cung trước"},
	{appstarinstance.ErrCharacterNotFound, "Không tìm thấy nhân vật"},
}

func wrapWarMapError(err error) string {
	for _, entry := range warMapErrorMessages {
		if errors.Is(err, entry.err) {
			return entry.msg
		}
	}
	return "Hệ thống lỗi"
}
