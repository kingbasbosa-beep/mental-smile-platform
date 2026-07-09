# Commercial V2 Signal And Aggregation Forensic Audit V1

Operation ID: OP-COMMERCIAL-V2-OPERATIONAL-FORENSIC-AUDIT-V1  
Date: 2026-06-24

## Commercial V2 Signal Status

No active Commercial V2 signal emission was found inside:

- `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

The Commercial V2 profile engine uses:

- Firebase Auth
- Firestore `commercial_v2_profiles`
- Firebase Storage `commercial_v2_identity`
- PDF/printing packages

It does not currently emit `signal_events`.

## Signal / Aggregation References

| Area | Status | Evidence | Notes |
|---|---:|---|---|
| Commercial V2 profile runtime signals | PLACEHOLDER / MISSING | No signal emitter in Commercial V2 file | Profile actions are not signalized. |
| `signal_events` collection | ACTIVE_GLOBAL | Firestore rules include `signal_events` | Not Commercial V2-specific in inspected runtime. |
| Commercial monitoring registry | ACTIVE_CODE / DISCONNECTED_FROM_V2 | `lib/features/monitoring/commercial/registry/commercial_monitoring_registry.dart` | Defines commercial aggregate groups but not connected to Commercial V2 profile engine. |
| Commercial aggregate model | ACTIVE_CODE / DISCONNECTED_FROM_V2 | `lib/features/monitoring/commercial/aggregates/commercial_signal_aggregate.dart` | Can aggregate signal packages, but Commercial V2 does not produce them. |
| Commercial monitoring router | ACTIVE_CODE / DISCONNECTED_FROM_V2 | `lib/features/monitoring/commercial/routing/commercial_monitoring_router.dart` | Requires `SignalPackage`; no Commercial V2 emitter found. |
| Web registration declaration signals | ACTIVE_LEGACY | `lib/features/web_registration/domain/declaration_readiness.dart` | Applies to Commercial V1 web registration, not Commercial V2. |

## Legacy Pipes

Legacy commercial/web registration includes declaration/readiness signal terminology:

- clinician provider signals
- center signals
- readiness signals

These write into clinician/center profile records, not Commercial V2 profile documents.

## New Pipes

No new Commercial V2 aggregation pipe was found.

## Signal Conclusion

Commercial V2 currently has no live signal or aggregation integration. Commercial monitoring code exists elsewhere, but Commercial V2 profile actions are not connected to it.

