# GLOBAL_SECTION_PLUG_REGISTRY_V1

Status: ACTIVE GLOBAL REGISTRY

Plug Format:

- Inbox: `PLG-{SECTION}-IN`
- Outbox: `PLG-{SECTION}-OUT`

## Plug Registry

| Section Code | Inbox Plug | Outbox Plug | External Inbox Count | External Outbox Count | Status |
|---|---|---|---:|---:|---|
| `SEC-RES` | `PLG-RES-IN` | `PLG-RES-OUT` | 1 | 1 | GOVERNED |
| `SEC-LIB` | `PLG-LIB-IN` | `PLG-LIB-OUT` | 1 | 1 | GOVERNED |
| `SEC-CV1` | `PLG-CV1-IN` | `PLG-CV1-OUT` | 1 | 1 | HISTORICAL_REFERENCE_ONLY |
| `SEC-CV2` | `PLG-CV2-IN` | `PLG-CV2-OUT` | 1 | 1 | GOVERNED |
| `SEC-ADM` | `PLG-ADM-IN` | `PLG-ADM-OUT` | 1 | 1 | GOVERNED |
| `SEC-MON` | `PLG-MON-IN` | `PLG-MON-OUT` | 1 | 1 | GOVERNED |
| `SEC-OWN` | `PLG-OWN-IN` | `PLG-OWN-OUT` | 1 | 1 | GOVERNED |
| `SEC-ARC` | `PLG-ARC-IN` | `PLG-ARC-OUT` | 1 | 1 | GOVERNED |
| `SEC-PUB` | `PLG-PUB-IN` | `PLG-PUB-OUT` | 1 | 1 | GOVERNED |
| `SEC-LEG` | `PLG-LEG-IN` | `PLG-LEG-OUT` | 1 | 1 | GOVERNED |
| `SEC-TRV` | `PLG-TRV-IN` | `PLG-TRV-OUT` | 1 | 1 | GOVERNED |
| `SEC-SMV` | `PLG-SMV-IN` | `PLG-SMV-OUT` | 1 | 1 | GOVERNED |

## Validation

| Item | Result |
|---|---:|
| Inbox plugs created | 12 |
| Outbox plugs created | 12 |
| Missing inbox plugs | 0 |
| Missing outbox plugs | 0 |
| Duplicate plug codes | 0 |

FINAL STATUS: GLOBAL_SECTION_PLUG_REGISTRY_ACTIVE
