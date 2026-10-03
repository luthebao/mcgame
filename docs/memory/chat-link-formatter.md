# Chat Link Formatter

Chat link expansion now rebuilds `EQ` and `IT` anchors from saved item rows so quality color and equipment `preNameType` survive formatting, then falls back through game-data template colors, fixed client link colors, and token color-index values inside the centralized RTMP text-normalization path.

- Clickable chat links should use direct HTML anchors in the client form `event:L_<TYPE>|<ID>|<NAME>`, usually wrapped as `<font color="..."><a href="...">[Display]</a></font>`. The shared formatter lives in `internal/presentation/rtmp/chatfmt/links.go`.
- Tokenized links like `[@N|2549|Name|0|0|0]` should be expanded through the shared chat formatter at RTMP callback send time, so `onSay`, `onSystemSay`, `onRedMsg`, `onBlueMsg`, `onSystemMidMsg`, and `onSystemMidMsgOrNote` all reach the client as direct clickable anchors.
