# RESIDENTIAL_FIREBASE_FIRESTORE_RULES_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index Residential Firebase / Firestore / rules references for future capsule generation.

## Active Firebase / Rules References

| File | Residential Reference | Status |
|---|---|---|
| `firestore.rules` | `SEC-RES`, `PLG-RES-OUT`, `ARC-SIG-RES-TOOLS-001`, `RES-MAG-TOOLS` branch under `archive_signal_events` | ACTIVE |
| `firestore.indexes.json` | Active index state after Firebase purification | ACTIVE |
| `storage.rules` | Storage governance; no Residential capsule-specific new Storage write added by RUN-6 | ACTIVE |
| `firebase.json` | Firebase project configuration | ACTIVE |

## Active Firestore Target

`archive_signal_events`

Required Residential runtime values:

- `source_section_code = SEC-RES`
- `source_outbox_plug = PLG-RES-OUT`
- `destination_section_code = SEC-ARC`
- `destination_inbox_plug = PLG-ARC-IN`
- `archive_destination_code = ARC-SIG-RES-TOOLS-001`
- `package_family = signal_event`
- `magnet_code = RES-MAG-TOOLS`
- `guard_status = accepted`

## Active Cards / Docs

- `docs/runtime-connection/residential/RESIDENTIAL_PACKAGE_CONTRACT_V1.md`
- `docs/runtime-connection/residential/RESIDENTIAL_RUNTIME_CERTIFICATE_V1.md`
- `docs/sections/residential/pure-dna-gates/r12-firebase-firestore-governance/`
- `docs/sections/residential/pure-dna-gates/r13-final-connection-cards/RESIDENTIAL_FIRESTORE_RULE_CARD_REGISTRY_V1.md`

## Future Capsule Must Copy

Residential-relevant Firestore rule excerpts, current Firebase/Firestore governance docs, RUN-6 rule evidence, and current index state references.

## Future Capsule Must Exclude

Legacy collections, chat/contact request branches, broad writes, identity fields, storage-upload flows not active in Residential capsule scope.

Owner notes: Do not deploy Firebase during capsule index or capsule generation unless explicitly ordered.

Current status: ACTIVE FIREBASE/FIRESTORE SNAPSHOT.
