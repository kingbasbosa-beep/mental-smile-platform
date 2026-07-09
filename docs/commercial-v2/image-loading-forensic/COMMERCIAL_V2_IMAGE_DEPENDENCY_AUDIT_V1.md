# COMMERCIAL_V2_IMAGE_DEPENDENCY_AUDIT_V1

Status: FORENSIC DEBUG ONLY

## Dependency Versions

| Package | Declared | Locked | Role |
|---|---|---|---|
| `pdf` | `^3.11.1` | `3.12.0` | PDF document/widget generation and `MemoryImage`. |
| `printing` | `^5.13.4` | `5.14.3` | `Printing.layoutPdf` and `networkImage`. |
| `http` | Transitive | `1.6.0` | Used by `printing` cache downloader. |
| `firebase_storage` | `^12.4.10` | `12.4.10` | Upload, download URL, and SDK byte loading. |
| `firebase_core` | `^3.15.2` | `3.15.2` | Firebase initialization. |
| `cloud_firestore` | `^5.6.12` | `5.6.12` | Stores profile image URLs. |
| `image_picker` | `^1.1.2` | `1.2.2` | Local image selection. |

## Compatibility Observation

The dependency set includes all packages required for the current implementation:

- upload through `firebase_storage`
- profile storage through `cloud_firestore`
- PDF generation through `pdf`
- PDF export through `printing`
- fallback network image loading through `http`

## Dependency Risk

The dependency risk is not absence. The risk is runtime behavior of network image retrieval on the target platform and current Firebase URL access path.

