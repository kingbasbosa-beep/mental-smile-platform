# Commercial V2 Known Bugs Registry V1

## Operation

OP-COMMERCIAL-V2-ACTIVE-SURFACE-EXTRACTION-AND-CARD-REGISTRY-AUDIT-V1

## Status

FORENSIC REGISTRY ONLY

| ID | Title | Severity | Area | Impact | Dependencies | Status |
|---|---|---|---|---|---|---|
| CV2-BUG-001 | Identity image available in profile but missing in generated CV/PDF | HIGH | Image System / CV Generation | Active Commercial V2 no longer depends on image/logo loading; future image/logo is supplied later to AI/design workflow | Commercial Text Profile Package, Commercial AI Generation Handoff Package, initials/avatar fallback, `_pdfIdentityImage` disabled from Storage/HTTP loading | RESOLVED_BY_REMOVING_IMAGE_DEPENDENCY_PENDING_MANUAL_VERIFICATION |
| CV2-BUG-005 | Style instruction ignored because template selector returns medical_white by default | MEDIUM | Style / CV Template Selection | Non-medical style instructions were misleadingly mapped to Medical White | `_commercialV2GeneratedCvTemplate`, `_GeneratedCvPreview`, future template renderers | DOCUMENTED_PENDING_TEMPLATE_EXPANSION |
| CV2-BUG-002 | Registration target mismatch: Email still required and Confirm Password missing | HIGH | Registration | Target registration could not be certified as Phone + Password + Confirm Password | Firebase Auth email/password compatibility, start page fields | FIXED_WITH_COMPATIBILITY_VERIFY_REQUIRED |
| CV2-BUG-003 | Submit for distribution does not create asset/archive/marketing package | HIGH | Publish / Distribution | Published profile is not converted into distribution package | `_publish`, `_CommercialV2Store.publish`, Archive/Marketing handoff missing | SEMANTICS_UPDATED_PACKAGE_POSTPONED |
| CV2-BUG-004 | Commercial V2 active actions emit no signals | MEDIUM | Signals / Aggregation | Monitoring, aggregation, and Strategic reporting cannot consume active Commercial behavior | signal_events, monitoring code disconnected from V2 | DISCOVERED_NOT_FIXED |
