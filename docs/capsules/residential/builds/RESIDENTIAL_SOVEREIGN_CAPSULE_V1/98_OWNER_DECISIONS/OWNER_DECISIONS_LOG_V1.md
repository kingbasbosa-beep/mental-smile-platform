# OWNER_DECISIONS_LOG_V1

Status: ACTIVE

## Purpose

Track Owner decisions for capsule-discovered improvements.

## Decision Rule

Suggestions discovered during capsule construction are recorded here or in `CAPSULE_DISCOVERED_IMPROVEMENTS_V1.md`. They are not implemented automatically.

## Current Decisions

| Suggestion ID | Area | Reason | Benefit | Risk | Affected Files | Estimated Effort | Owner Decision |
|---|---|---|---|---|---|---|---|
| `CAP-RES-SUG-001` | Visual QA | Add screenshot annotation companion pack after Owner provides screenshots. | Improves future UI rebuild precision. | Requires Owner-provided screenshots and extra review time. | Future docs only. | Medium | PENDING |
| `CAP-RES-SUG-002` | Localization | Add generated localization output snapshot only if a future full source capsule needs committed generated files. | Helps clean-project rebuilds where generated files are not produced automatically. | Risk of stale generated outputs if source ARB changes. | Future capsule generated l10n files. | Low | PENDING |
| `CAP-RES-SUG-003` | Validation | Add visual verification report after screenshots or local run are available. | Stronger confidence in layout parity. | Requires manual or browser verification beyond this patch. | Future validation docs. | Medium | PENDING |

FINAL STATUS: OWNER_DECISIONS_LOG_CREATED
