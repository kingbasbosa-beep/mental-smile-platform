# MASTER_ARCHIVE_DESTINATION_REGISTRY_V1

Status: ACTIVE DESTINATION REGISTRY

## Destination Resolution Authority

Destination rows are interpreted through `../destination-resolution/MASTER_ARCHIVE_DESTINATION_RESOLUTION_GUIDE_V1.md`.

Resolution order:

Destination Code -> Signal Family -> Magnet -> Package Family -> Privacy -> Retention -> Archive Destination

## Archive Destinations

| Archive Destination Code | Destination Title | Archive Section | Package Families Accepted | Source Sections Accepted | Source Outbox Plugs Accepted | Dispatch Targets | Summary Targets | Owner |
|---|---|---|---|---|---|---|---|---|
| `ARC-PKG-CV2-001` | Commercial V2 Registration Packages | `ARC-SEC-CV2` | Registration packages | `SEC-CV2` | `PLG-CV2-OUT` | `SEC-PUB`, `SEC-LIB` after approval | Owner, Strategic | Archive Owner |
| `ARC-PUB-CV2-001` | Commercial V2 Publishing Packages | `ARC-SEC-PUB` | Publishing packages | `SEC-CV2`, `SEC-PUB` | `PLG-CV2-OUT`, `PLG-PUB-OUT` | `SEC-LIB` after approval | Owner, Monitoring | Publishing Owner |
| `ARC-SIG-CV2-SHOWCASE-001` | Commercial V2 Showcase Signals | `ARC-SEC-CV2` | Showcase navigation signals; Commercial V2 demand signals | `SEC-CV2` | `PLG-CV2-OUT` | `SEC-MON`, `SEC-OWN` summaries | Commercial V2 Demand, Monitoring, Owner | Commercial V2 Owner / Archive Owner |
| `ARC-SIG-LIB-001` | Library Demand Signals | `ARC-SEC-LIB` | Demand signals | `SEC-LIB` | `PLG-LIB-OUT` | `SEC-MON`, `SEC-OWN` summaries | Strategic, Owner | Library Owner |
| `ARC-SIG-LIB-HOME-001` | Library Home / Category Signals | `ARC-SEC-LIB` | Library home view and category/card signals | `SEC-LIB` | `PLG-LIB-OUT` | `SEC-MON`, `SEC-OWN` summaries | Library Demand, Monitoring, Owner | Library Owner / Archive Owner |
| `ARC-SIG-LIB-SP-001` | Library Specialists Display Signals | `ARC-SEC-LIB` | Specialists display view/open signals | `SEC-LIB-SP` | `PLG-LIB-SP-OUT` | `SEC-MON`, `SEC-OWN` summaries | Specialist Display Demand, Monitoring, Owner | Library Specialists Display Owner / Archive Owner |
| `ARC-SIG-LIB-CTR-001` | Library Centers Display Signals | `ARC-SEC-LIB` | Centers display view/open signals | `SEC-LIB-CTR` | `PLG-LIB-CTR-OUT` | `SEC-MON`, `SEC-OWN` summaries | Center Display Demand, Monitoring, Owner | Library Centers Display Owner / Archive Owner |
| `ARC-SIG-RES-TOOLS-001` | Residential Tool Signals | `ARC-SEC-RES` | Tool signals | `SEC-RES` | `PLG-RES-OUT` | `SEC-MON`, `SEC-OWN` summaries | Strategic, Owner | Residential Owner |
| `ARC-SIG-ACC-AUD-001` | Accessibility Audio Signals | `ARC-SEC-SIG` | Accessibility/audio signals | ALL | Any governed outbox | `SEC-MON`, `SEC-OWN` summaries | Accessibility Summary | Accessibility Owner |
| `ARC-PUB-PROV-001` | Provider Publishing Queue | `ARC-SEC-PUB` | Provider publishing queue packages | `SEC-CV2`, `SEC-PUB` | `PLG-CV2-OUT`, `PLG-PUB-OUT` | `SEC-LIB` after approval | Owner, Publishing | Publishing Owner |
| `ARC-SUM-STR-001` | Strategic Summary Feed | `ARC-SEC-STR` | Strategic summaries | Archive internal | Archive internal | `SEC-SMV`, `SEC-OWN` | Strategic Memory | Strategic Owner |
| `ARC-SUM-OWN-001` | Owner Decision Feed | `ARC-SEC-OWN` | Owner decision summaries | Archive internal | Archive internal | `SEC-OWN` | Owner | Owner |
| `ARC-RUN-SNP-001` | Runtime Snapshots | `ARC-SEC-RUN` | Runtime snapshots | ALL | Any governed outbox | `SEC-TRV`, `SEC-OWN` | Runtime Summary | Runtime Owner |
| `ARC-DNA-SNP-001` | DNA Snapshots | `ARC-SEC-DNA` | DNA snapshots | ALL | Any governed outbox | `SEC-OWN`, `SEC-TRV` | DNA Summary | DNA Owner |
| `ARC-AIM-PKG-001` | AI Memory Packages | `ARC-SEC-AIM` | AI memory packages | ALL | Any governed outbox | `SEC-SMV`, `SEC-OWN` | AI Memory Summary | AI Memory Owner |
| `ARC-ERR-LANG-001` | Archive Language Quarantine | `ARC-SEC-ERR` | Invalid or suspicious traffic objects | Archive Language Guard | Guard rejection event | Owner review, correction, escalation, or permanent rejection | Quarantine Review | Archive Language Owner |

FINAL STATUS: MASTER_ARCHIVE_DESTINATION_REGISTRY_COMPLETE

## RUN-6 Residential Tool Runtime Connection

`ARC-SIG-RES-TOOLS-001` is the governed first Residential tool runtime destination.

Accepted runtime signal codes:

- `R.T.001.OPEN`
- `R.T.005.OPEN`
- `R.T.006.OPEN`
- `R.T.007.OPEN`

Runtime magnet: `RES-MAG-TOOLS`

Runtime Firestore target: `archive_signal_events`

Package family: `signal_event`

## RUN-7 Library Provider Display Runtime Connection

The governed Library/provider display runtime lanes are:

| Destination | Source Section | Outbox | Magnet | Signal Codes |
|---|---|---|---|---|
| `ARC-SIG-LIB-HOME-001` | `SEC-LIB` | `PLG-LIB-OUT` | `LIB-MAG-HOME` | `L.S.001.VIEW`, `L.C.001.OPEN`, `L.C.002.OPEN` |
| `ARC-SIG-LIB-SP-001` | `SEC-LIB-SP` | `PLG-LIB-SP-OUT` | `LIB-MAG-SPECIALISTS` | `L.S.003.VIEW`, `L.C.003.OPEN` |
| `ARC-SIG-LIB-CTR-001` | `SEC-LIB-CTR` | `PLG-LIB-CTR-OUT` | `LIB-MAG-CENTERS` | `L.S.004.VIEW`, `L.C.004.OPEN` |

Runtime Firestore target: `archive_signal_events`

Package family: `signal_event`
