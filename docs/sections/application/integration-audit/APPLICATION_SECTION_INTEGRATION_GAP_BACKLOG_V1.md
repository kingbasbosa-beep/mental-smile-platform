# APPLICATION_SECTION_INTEGRATION_GAP_BACKLOG_V1

Status: COMPLETED

## Critical Before Runtime

| Task | Reason | Dependencies | Estimated Effort | Suggested Order |
|---|---|---|---|---|
| Repair Arabic source encoding / mojibake in Application runtime files | Current source inspection shows corrupted Arabic strings; TTS/localization cannot be trusted | Localization source of truth | Medium | 1 |
| Wire visible strings to localization keys | Runtime hardcoded strings prevent localization/TTS governance | Encoding repair | Large | 2 |
| Implement Application signal emission | All Application signal families are NOT_IMPLEMENTED | Signal policy, privacy contract | Medium | 3 |
| Implement Application Aggregation runtime | Aggregation point is documentation-only | Signal emission | Medium | 4 |
| Create archive summary writer | Archive destinations are mapped but not connected | Aggregation output | Medium | 5 |
| Create Admin/Owner visibility for Application summaries | No live Application visibility exists | Aggregation + archive | Medium | 6 |

## High Before Release

| Task | Reason | Dependencies | Estimated Effort | Suggested Order |
|---|---|---|---|---|
| Create complaint/suggestion governance intake | Current suggestion flow is WhatsApp-only | Governance Operations | Medium | 7 |
| Create localization/TTS readiness dashboard | Current state is partial | Localization matrix | Medium | 8 |
| Create screenshot/release asset package | Store/release assets not generated | Release Ecosystem | Medium | 9 |

## Medium Before Scale

| Task | Reason | Dependencies | Estimated Effort | Suggested Order |
|---|---|---|---|---|
| Normalize Client and Accessibility card label sources | Reduce duplication and drift | Localization wiring | Medium | 10 |
| Add privacy-safe link/tool category summaries | Strategic value without personal data | Aggregation runtime | Small | 11 |
| Add monitoring counters | Monitoring has no live Application view | Aggregation runtime | Medium | 12 |

## Low Cleanup

| Task | Reason | Dependencies | Estimated Effort | Suggested Order |
|---|---|---|---|---|
| Review old exit page variants | Avoid confusion around active exit surface | Route audit | Small | 13 |
| Normalize legacy documentation references | Keep final section clean | Documentation pass | Small | 14 |

## Future Enhancement

| Task | Reason | Dependencies | Estimated Effort | Suggested Order |
|---|---|---|---|---|
| Real TTS service | Audio markers are placeholder only | Localization/TTS readiness | Large | Future |
| Live behavioral analytics | Requires privacy-safe aggregation | Signals + aggregation | Large | Future |
| Release screenshot automation | Useful after UI freeze | Release ecosystem | Medium | Future |

Final Status: APPLICATION_SECTION_INTEGRATION_GAP_BACKLOG_COMPLETED
