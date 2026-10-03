// Open-sourced by BaoLT

// getDecoSuitProp handler — returns decoration suit set-bonus properties.
// Args: [suitId:int, linkSuitId:int, linkId:int]
// Reply: {actName, suitIdObj, suitProp, actArr, actFlag, linkProp, actLinkSuitFlag, actLinkSuitName}
// actArr and actFlag are stubbed empty/false until character_decorations is
// wired into the character load path (player activation state not tracked yet).
package dress

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) GetDecoSuitProp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, nil
	}
	suitID, ok := toInt64(args[0])
	if !ok || suitID <= 0 {
		return nil, nil
	}
	linkSuitID, _ := toInt64(args[1])
	linkID, _ := toInt64(args[2])

	result := h.service.GetDecoSuitProp(int(suitID), int(linkSuitID), int(linkID))
	if result == nil {
		return nil, nil
	}

	reply := map[string]interface{}{
		"actName":         result.ActName,
		"suitIdObj":       result.SuitIdObj,
		"suitProp":        result.SuitProp,
		"actArr":          result.ActArr,
		"actFlag":         result.ActFlag,
		"linkProp":        result.LinkProp,
		"actLinkSuitFlag": result.ActLinkSuitFlag,
		"actLinkSuitName": result.ActLinkSuitName,
	}
	if result.LinkFlag {
		reply["linkFlag"] = result.LinkFlag
	}
	return reply, nil
}
