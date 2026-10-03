# Chat Commands

GM/admin commands typed in the chat box. `/add` and `/stat` now require `gmLevel >= 5`.

## /add — Add Items

**Syntax:** `/add <templateID> <count> [type]`

| Parameter    | Type   | Required | Description                                    |
|------------- |--------|----------|------------------------------------------------|
| `templateID` | int    | Yes      | Item template ID from game data                |
| `count`      | int    | Yes      | Quantity to add (> 0)                          |
| `type`       | string | No       | `1` = Equipment, `2` = Material, default = Consumable |

**Examples:**

```sh
/add 719 5        — Add 5x consumable item #719
/add 2001 1 1     — Add 1x equipment item #2001
/add 3010 10 2    — Add 10x material item #3010
```

**Item type mapping:**

- (default) → Consumable (type 1)
- `1` → Equipment (type 2)
- `2` → Material (type 3)

---

## /stat — Modify Character Stats

**Syntax:** `/stat <field> <amount>`

| Parameter | Type   | Required | Description                     |
|-----------|--------|----------|---------------------------------|
| `field`   | string | Yes      | Stat field (case-insensitive)   |
| `amount`  | int    | Yes      | Amount to add (> 0)             |

**Available fields:**

| Field       | Description            |
|-------------|------------------------|
| `money`     | Non-bound currency     |
| `moneybind` | Bound currency         |
| `gold`      | Premium currency       |
| `goldbind`  | Bound premium currency |
| `exp`       | Experience points      |
| `level`     | Raise character level  |

**Examples:**

```sh
/stat money 1000      — Add 1000 money
/stat gold 10         — Add 10 gold
/stat exp 5000        — Add 5000 experience (may trigger level up)
/stat moneybind 500   — Add 500 bound currency
/stat level 30        — Raise the character to level 30
```

---

## Chat Channels

Commands are sent via the `say` RPC method. Regular chat supports these channels:

| Channel | Name    | Notes                                      |
|---------|---------|--------------------------------------------|
| 0       | Local   | Room/area chat                             |
| 1       | Global  | World-wide (requires Speaker item ID 719)  |
| 2       | Guild   | Guild members only                         |
| 3       | Team    | Team/group members only                    |
| 4       | Whisper | Private message                            |
| 5       | Area    | Area-wide chat                             |
| 6       | Top     | Scrolling headline chat                    |

---

## Other Chat RPC Methods

| Method            | Description                              |
|-------------------|------------------------------------------|
| `createChatPanel` | Open whisper panel with another player   |
| `getChatPanel`    | Alias for createChatPanel                |
| `chatGM`          | Send message to GM support (log only)    |
| `p2pWisper`       | Peer-to-peer whisper with warning notify |
| `wisper`          | Simple whisper message                   |
