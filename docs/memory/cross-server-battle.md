# Cross-Server Battle Flow

Original server receives `reqEnterCrossBattle`, sends `onReqEnterCrossBattle` callback with battle server info (serverId, cid, verifyKey, serverIndex, battleServerUrl). Client connects to battle server with EBS/CPK auth type, battles, then returns via `reqLeaveCrossBattle`.
