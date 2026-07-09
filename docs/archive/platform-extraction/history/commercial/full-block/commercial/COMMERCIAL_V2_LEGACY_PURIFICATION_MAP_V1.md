# Commercial V2 Legacy Purification Map V1

Operation ID: OP-COMMERCIAL-V2-PURIFICATION-AND-DISCOVERY-FOUNDATION-V1  
Date: 2026-06-24  
Mode: Governance map only

## Source

This map uses:

- `COMMERCIAL_V2_OPERATIONAL_FORENSIC_REPORT_V1.md`
- `COMMERCIAL_V2_ROUTE_FORENSIC_MAP_V1.md`
- `COMMERCIAL_V2_LEGACY_AND_ARCHIVE_AUDIT_V1.md`

No runtime removal, archive action, route change, or cleanup was performed.

## Classification Values

- ACTIVE_RUNTIME
- ARCHIVE_ONLY
- REMOVE_CANDIDATE
- OUT_OF_SCOPE

## Legacy Route / Surface Map

| Item | Route | Purpose | Current Status | Future Status | Reason |
|---|---|---|---|---|---|
| Commercial V2 Start | `/commercial-v2/start` | official account entry | ACTIVE_RUNTIME | ACTIVE_RUNTIME | Official Commercial V2 registration/login surface. |
| Commercial V2 Owner | `/commercial-v2/owner` | profile owner dashboard | ACTIVE_RUNTIME | ACTIVE_RUNTIME | Official Commercial V2 profile management surface. |
| Commercial V2 Preview | `/commercial-v2/preview` | draft preview | ACTIVE_RUNTIME | ACTIVE_RUNTIME | Official Commercial V2 draft preview. |
| Commercial V2 Public Profile | `/commercial-v2/p/{profileId}` | direct public profile | ACTIVE_RUNTIME | ACTIVE_RUNTIME | Official public profile route. |
| Provider registration alias | `/register/provider` | legacy clinician registration alias | ARCHIVE_ONLY / active alias | REMOVE_CANDIDATE | Commercial V2 replaces this as official runtime; alias can confuse provider/clinician naming. |
| Clinician registration alias | `/register/clinician` | legacy clinician registration alias | ARCHIVE_ONLY / active alias | REMOVE_CANDIDATE | Not official Commercial V2 registration. |
| Center registration alias | `/register/center` | legacy center registration alias | ARCHIVE_ONLY / active alias | REMOVE_CANDIDATE | Not official Commercial V2 registration. |
| Web clinician registration | `/web/clinician/register` | old web registration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Commercial V1 archive marker covers web clinician registration. |
| Web clinician profile | `/web/clinician/profile` | old clinician profile declaration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Old declaration flow; not Commercial V2 profile engine. |
| Web clinician documents | `/web/clinician/documents` | old clinician document declaration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Old declaration flow. |
| Web center registration | `/web/center/register` | old center registration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Commercial V1 archive marker covers web center registration. |
| Web center profile | `/web/center/profile` | old center profile declaration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Old declaration flow; not Commercial V2 profile engine. |
| Web center media | `/web/center/media` | old media declaration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Not identity-media-only Commercial V2 runtime. |
| Web center pricing | `/web/center/pricing` | old center pricing declaration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Not Commercial V2 universal profile engine. |
| Web center documents | `/web/center/documents` | old center document declaration | ARCHIVE_ONLY / active runtime | ARCHIVE_ONLY | Old declaration flow. |
| Clinician room | `/clinician/room` | protected clinician workspace | ACTIVE_RUNTIME | OUT_OF_SCOPE | Excluded from Commercial V1 archive marker; app runtime decision needed separately. |
| Clinician profile edit request | `/clinician/profile-edit-request` | protected edit request | ACTIVE_RUNTIME | OUT_OF_SCOPE | App runtime surface, not Commercial V2 purification target. |
| Clinician chat inbox | `/clinician/chat-inbox` | protected clinician chat inbox | ACTIVE_RUNTIME | OUT_OF_SCOPE | App/support runtime boundary. |
| Center dashboard | `/center/dashboard` | protected center dashboard | ACTIVE_RUNTIME | OUT_OF_SCOPE | Explicitly excluded from Commercial V1 archive marker. |
| Center room | `/center/room` | protected center room | ACTIVE_RUNTIME | OUT_OF_SCOPE | Explicitly excluded from Commercial V1 archive marker. |
| Center profile edit request | `/center/profile-edit-request` | protected edit request | ACTIVE_RUNTIME | OUT_OF_SCOPE | App runtime surface. |
| S City provider directory placeholder | `/s/city/providers` | provider directory placeholder | ARCHIVE_ONLY / placeholder | REMOVE_CANDIDATE | Not Commercial V2 discovery; may mislead as active discovery. |
| S City center directory placeholder | `/s/city/centers` | center directory placeholder | ARCHIVE_ONLY / placeholder | REMOVE_CANDIDATE | Not Commercial V2 discovery; may mislead as active discovery. |
| S City organizations placeholder | `/s/city/organizations` | future organizations placeholder | PLACEHOLDER | OUT_OF_SCOPE | Future S City surface; not Commercial V2 runtime. |
| S City programs placeholder | `/s/city/programs` | future programs placeholder | PLACEHOLDER | OUT_OF_SCOPE | Future S City surface. |
| S City marketplace placeholder | `/s/city/marketplace` | future marketplace placeholder | PLACEHOLDER | OUT_OF_SCOPE | Future S City surface. |
| Specialists module | `/module/specialists` | legacy/public clinician discovery | ACTIVE_RUNTIME | ARCHIVE_ONLY / OWNER_DECISION | Reads legacy `clinicians`; not Commercial V2 profile discovery. |
| Specialists list | `/module/specialists/list` | legacy clinician listing | ACTIVE_RUNTIME | ARCHIVE_ONLY / OWNER_DECISION | Needs separate migration/removal decision. |
| Specialist details | `/module/specialists/details` | legacy clinician details | ACTIVE_RUNTIME | ARCHIVE_ONLY / OWNER_DECISION | Not Commercial V2 public profile. |
| Centers module | `/module/centers` | legacy/public center discovery | ACTIVE_RUNTIME | ARCHIVE_ONLY / OWNER_DECISION | Reads legacy `centers`; not Commercial V2 profile discovery. |
| Centers list | `/module/centers/list` | legacy center listing | ACTIVE_RUNTIME | ARCHIVE_ONLY / OWNER_DECISION | Needs separate migration/removal decision. |
| Center details | `/module/centers/details` | legacy center details | ACTIVE_RUNTIME | ARCHIVE_ONLY / OWNER_DECISION | Not Commercial V2 public profile. |

## Purification Rule

No item was removed or archived in this operation. This map prepares future owner decisions by separating official Commercial V2 runtime from legacy/placeholder commercial surfaces.

