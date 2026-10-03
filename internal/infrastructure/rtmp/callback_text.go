// Open-sourced by BaoLT

package rtmp

import "mcgame-server/internal/presentation/rtmp/chatfmt"

func normalizeTextCallbackArgs(method string, args []interface{}, resolver chatfmt.LinkResolver) []interface{} {
	switch method {
	case "onSystemSay", "onRedMsg", "onBlueMsg", "onSystemMidMsg", "onSystemMidMsgOrNote":
		return normalizeStringArgs(args, resolver)
	case "onSay":
		return normalizeOnSayArgs(args, resolver)
	default:
		return args
	}
}

func normalizeStringArgs(args []interface{}, resolver chatfmt.LinkResolver) []interface{} {
	if len(args) == 0 {
		return args
	}

	var normalized []interface{}
	for index, arg := range args {
		text, ok := arg.(string)
		if !ok {
			if normalized != nil {
				normalized[index] = arg
			}
			continue
		}

		expanded := chatfmt.ExpandTokensWithResolver(text, resolver)
		if expanded == text && normalized == nil {
			continue
		}
		if normalized == nil {
			normalized = append([]interface{}(nil), args...)
		}
		normalized[index] = expanded
	}

	if normalized == nil {
		return args
	}

	return normalized
}

func normalizeOnSayArgs(args []interface{}, resolver chatfmt.LinkResolver) []interface{} {
	if len(args) == 0 {
		return args
	}

	payload, ok := args[0].(map[string]interface{})
	if !ok {
		return normalizeStringArgs(args, resolver)
	}

	msg, ok := payload["msg"].(string)
	if !ok {
		return args
	}

	expanded := chatfmt.ExpandTokensWithResolver(msg, resolver)
	if expanded == msg {
		return args
	}

	normalizedPayload := make(map[string]interface{}, len(payload))
	for key, value := range payload {
		normalizedPayload[key] = value
	}
	normalizedPayload["msg"] = expanded

	normalizedArgs := append([]interface{}(nil), args...)
	normalizedArgs[0] = normalizedPayload
	return normalizedArgs
}
