# Application Layer Services

Full list of application-layer services in `internal/application/`:

| Service | File | Key Responsibilities |
| --- | --- | --- |
| auth | service.go | Authentication, account validation |
| battle | service.go | Battle lifecycle, timeout tickers, cleanup |
| center | service.go | Center/hub coordination |
| character | service.go | Character CRUD, leveling, stat refresh |
| combat | service.go | Combat encounter creation, turn processing |
| farm | service.go | Farm plot lifecycle, vigor cost, crop name resolution, skill level inference |
| group | service.go | Party creation, invite, join/leave |
| guild | service.go | Guild management |
| item | service.go, appearance.go, display_contract.go, element.go, maker.go | Full item/equipment lifecycle, appearance, display DTO normalization |
| lineserver | service.go | Line server registration, heartbeat |
| pet | service.go | Pet management, element normalization |
| petarena | service.go | Pet arena battles |
| pk | service.go | PK match management |
| quest | service.go | Quest lifecycle, objectives, rewards |
| scene | service.go | Scene/map management |
| shop | service.go, types.go | Shop purchase flow, type definitions |
| skill | service.go, life_skill.go | Skill management, life-skill learn/upgrade/mastery (Trồng Trọt type 15), PlantDex sync |
| social | service.go | Relationships, teacher-student |
| title | service.go | Title listing, activation |

Domain layer (`internal/domain/`) contains 18 entity packages: auth, character, combat (8 files), creature (6 types), element, farm, group, guild, item, lineserver, npc, pet, petarena, pk, quest, sceneitem, skill, social, title.
