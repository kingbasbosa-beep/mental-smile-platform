# Commercial V2 Legacy And Archive Audit V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Commercial V1 Archive Status

Archive marker:

- `docs/archive/commercial/COMMERCIAL_V1_ARCHIVE_MARKER.md`

Status recorded there:

- `FROZEN_ARCHIVED_REFERENCE_ONLY`

The archive marker explicitly includes:

- provider/clinician registration routes
- center registration routes
- web clinician registration files
- web center registration files
- old provider/specialist public routes
- old center public routes
- placeholder commercial city routes
- provider/clinician/specialist/center naming mix

The marker explicitly excludes:

- Client Room
- Clinician Room
- Center Dashboard
- Center Room
- Application dashboards

## Legacy Runtime Inventory

| Legacy Area | Current Status | Evidence | Notes |
|---|---:|---|---|
| Commercial V1 web registration | ARCHIVE_ONLY / ACTIVE_RUNTIME | `/web/clinician/*`, `/web/center/*` route cases | Frozen conceptually, still route-resolvable. |
| Old provider public routes | PLACEHOLDER / ARCHIVE_ONLY | `/s/city/providers` | S Web placeholder, route constant marked legacy/frozen. |
| Old center public routes | PLACEHOLDER / ARCHIVE_ONLY | `/s/city/centers` | S Web placeholder, route constant marked legacy/frozen. |
| Old public modules | ACTIVE_LEGACY | `/module/specialists`, `/module/centers` | Still read `clinicians` and `centers`. |
| Old clinician dashboard/room | ACTIVE | `/clinician/room` | Protected app runtime; excluded from archive marker. |
| Old center dashboard/room | ACTIVE | `/center/dashboard`, `/center/room` | Protected app runtime; excluded from archive marker. |
| Old search/listing | ACTIVE_LEGACY | Specialist/center list pages | Based on old `clinicians`/`centers` collections. |
| Old signals | ACTIVE_LEGACY_TERMINOLOGY | web registration readiness/declaration signals | Not Commercial V2 signal runtime. |
| Old collections | ACTIVE | `clinicians`, `centers`, profile change request collections | Still referenced by runtime/rules. |

## Legacy Conclusion

Commercial V1 is archived as reference by documentation, but several old routes and runtime surfaces remain active for app/dashboard/public-module continuity. They are not part of the Commercial V2 profile engine.

