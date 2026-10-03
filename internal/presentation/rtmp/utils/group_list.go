// Open-sourced by BaoLT

package utils

import domaingroup "mcgame-server/internal/domain/group"

func BuildGroupMemberList(groupInfo *domaingroup.Group) map[string]interface{} {
	if groupInfo == nil || len(groupInfo.Members) == 0 {
		return map[string]interface{}{}
	}

	var headNode map[string]interface{}
	var currentNode map[string]interface{}
	memberCount := 0

	for _, member := range groupInfo.Members {
		node := map[string]interface{}{
			"obj": member.CharID,
		}

		if headNode == nil {
			headNode = node
			currentNode = node
		} else {
			currentNode["next"] = node
			currentNode = node
		}
		memberCount++
	}

	return map[string]interface{}{
		"head": headNode,
		"len":  memberCount,
	}
}
