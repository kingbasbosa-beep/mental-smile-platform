# Archive Runtime Guard Output States V1

Status: ACTIVE
Date: 2026-07-02

| State | Meaning | Next Action |
|---|---|---|
| `ACCEPTED` | Event passes all guard checks. | Eligible for Archive Inbox / future routing. |
| `REJECTED` | Event fails a deterministic validation rule. | Do not enter trusted Archive memory. |
| `QUARANTINED` | Event is invalid, suspicious, or needs retention for review. | Store future quarantine record. |
| `NEEDS_CODE` | Object is used but lacks approved code. | Quarantine and request coding. |
| `OWNER_REVIEW` | Guard cannot safely decide without Owner review. | Hold for Owner decision. |
| `SECURITY_BLOCKED` | Event includes unsafe target, identity leakage, bypass, or prohibited traffic. | Block and alert. |

## Missing Guard States

0

