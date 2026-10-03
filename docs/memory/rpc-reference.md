# RPC Reference

## Rate Limits

getLineInfo=10s, chooseCharactor=2.1s, createChars=1.1s, sceneChange=1.1s, sceneLogin=1.1s, say=1.1s, addMail=2.1s, takeQuest=1.1s, finishQuest=1.1s, equipOn/Off=1.1s, useItem=0.8s, hitNpc=2.1s, clickNpc/clickBoss=1.1s, auctionSearch=1s, udcr/udcp=0.6s, cbom=1s, npcFuncOther=1.1s, product=10s, bagSort=3s, changePrefix/sureChangePrefix=1.1s, changeSoul/sureChangeSoul=1.1s, changeElement/sureChangeElement=1.1s, repair/repairAll=1.1s.

RTMP rate-limit hits are treated as server-side warnings. `connection_rpc.go` suppresses the generic client connection-notice path for `pkgerrors.ErrRateLimited`, so players should not see `[Connection] rate limited` banners or `_error` responses for dispatcher rate-limit rejections.

## Settings RPC

`uif(key, value, isPetSetting)`. Keys: am (music), he (effects), hm (models), sid1-sid8 (skill slots), bs1-bs10 (auto-battle), p2-p9 (auto-battle thresholds), dressHide, flyEffect. Also `saveGuideLog(guideId)`.

## Pet Element Payloads

Pet DTO: top-level `element` normalized before serialization. Nested `creatureData.element` normalized. Creature encounter templates carry element from `TBL_CREATURE.element`. Battle participants expose `element` on DTOs.
