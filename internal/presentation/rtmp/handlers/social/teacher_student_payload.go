// Open-sourced by BaoLT

// Teacher-student payload helpers for IM panel callbacks.
package social

import "fmt"

func toTeacherStudentInitPayload(entries []map[string]any) map[string]interface{} {
	result := make(map[string]interface{}, len(entries))
	for _, entry := range entries {
		id, ok := entry["id"].(int64)
		if !ok {
			continue
		}
		result[fmt.Sprintf("%d", id)] = entry
	}

	return result
}
