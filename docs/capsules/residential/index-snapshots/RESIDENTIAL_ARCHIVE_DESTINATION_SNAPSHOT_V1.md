# RESIDENTIAL_ARCHIVE_DESTINATION_SNAPSHOT_V1

Status: COMPLETE

## Purpose

Index active Residential Archive destinations and Archive-owned routing evidence.

## Active Archive Destinations

| Code | Title | Source Section | Outbox | Magnet | Status |
|---|---|---|---|---|---|
| `ARC-SIG-RES-TOOLS-001` | Residential Tool Signals | `SEC-RES` | `PLG-RES-OUT` | `RES-MAG-TOOLS` | ACTIVE |

## Archive Registries

| Registry | Residential Reference |
|---|---|
| `MASTER_ARCHIVE_DESTINATION_REGISTRY_V1.md` | `ARC-SIG-RES-TOOLS-001` |
| `MASTER_ARCHIVE_MAGNET_REGISTRY_V1.md` | `RES-MAG-TOOLS` |
| `MASTER_ARCHIVE_SECTION_REGISTRY_V1.md` | `ARC-SEC-RES` |
| `MASTER_ARCHIVE_SIGNAL_VAULT_REGISTRY_V1.md` | `ARC-SIG-VAULT-RES` |
| `MASTER_ARCHIVE_PACKAGE_VAULT_REGISTRY_V1.md` | `ARC-PKG-VAULT-RES` |
| `MASTER_ARCHIVE_DIGITAL_TWIN_V1.md` | Residential runtime connection row |

## Active Runtime Target

Firestore collection: `archive_signal_events`

Archive intake path: `SEC-RES -> PLG-RES-OUT -> SEC-ARC -> PLG-ARC-IN -> ARC-SIG-RES-TOOLS-001`

## Future Capsule Must Copy

Residential Archive destination card, Archive registry rows, runtime guard/intake/destination resolution references, and RUN-6 manual test/certificate docs.

## Future Capsule Must Exclude

Accessibility/audio destination as a Residential tool substitute unless separately certified, Library/CV2 destinations, retired Library child/accessibility support destinations.

Owner notes: Archive owns durable cross-section storage.

Current status: ACTIVE ARCHIVE DESTINATION SNAPSHOT.
