# ARCHIVE_LANGUAGE_ALARM_SEVERITY_GUIDE_V1

Status: ACTIVE ALARM SEVERITY GUIDE

## Purpose

Define severity levels for Archive Language Guard alarms.

## Severity Levels

| Severity | Meaning | Normal Flow Decision | Owner Review |
|---|---|---|---|
| `INFO` | Non-blocking language observation. | May continue only when all required grammar fields pass. | Optional review. |
| `WARNING` | Suspicious or incomplete language pattern. | Quarantine unless the missing detail is explicitly documented as optional by a destination card. | Required queue review. |
| `ERROR` | Invalid language object or failed grammar rule. | Reject from normal flow and quarantine. | Required owner review. |
| `BLOCKING` | Invalid traffic that could corrupt destination counts, summaries, dispatches, or traceability. | Reject from normal flow and quarantine. | Required owner approval before correction. |
| `SECURITY` | Unauthorized bypass, wrong destination, route/screen/collection target, or Archive bypass attempt. | Reject from normal flow and quarantine. | Required owner and security review. |

## Severity Rule

No invalid package, signal, summary, dispatch, traffic sentence, or package target may be downgraded to normal flow without owner review.

FINAL STATUS: ARCHIVE_LANGUAGE_ALARM_SEVERITY_GUIDE_COMPLETE
