# CAPSULE_DISCOVERED_IMPROVEMENTS_V1

Status: ACTIVE

## Purpose

Record improvements discovered during Residential capsule construction without implementing them automatically.

## Improvements

| Suggestion ID | Area | Reason | Benefit | Risk | Affected Files | Estimated Effort | Owner Decision |
|---|---|---|---|---|---|---|---|
| `CAP-RES-SUG-001` | Screenshot Annotation | Future rebuilds would benefit from annotated screenshots that map UI elements to route, card code, signal code, archive destination, and accessibility behavior. | Higher rebuild fidelity. | Adds documentation workload and requires screenshot source material. | `14_OWNER_NOTES/RESIDENTIAL_SCREENSHOT_ANNOTATION_PLAN_V1.md` and future screenshot pack. | Medium | PENDING |
| `CAP-RES-SUG-002` | Generated Localization | The capsule includes ARB and l10n authority, but not generated localization Dart files as a dedicated generated-output pack. | Can help rebuilds in environments where generated files are expected to be committed. | Generated files can become stale if manually edited. | Future `08_YAML_ASSETS_L10N/generated_l10n/`. | Low | PENDING |
| `CAP-RES-SUG-003` | Visual Verification | The capsule was built without running Flutter or screenshots. A future visual QA pack can confirm layout parity. | Stronger quality proof. | Requires runtime execution and review. | Future validation docs and screenshots. | Medium | PENDING |

FINAL STATUS: CAPSULE_DISCOVERED_IMPROVEMENTS_REGISTERED
