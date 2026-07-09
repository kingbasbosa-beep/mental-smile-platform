# Code Gate Classification Matrix V1

Date: 2026-07-02

| Object Condition | Classification | Action | May Be Active? |
|---|---|---|---|
| Has approved code and current reference | ACTIVE_CODED | Allowed | YES |
| Used by runtime/governance but missing approved code | USED_WITHOUT_CODE | Quarantine + Needs Coding | NO, until coded |
| Exists but has no current reference and no approved code | UNUSED_WITHOUT_CODE | Remove Candidate | NO |
| Historical context only and no approved code | HISTORICAL_WITHOUT_CODE | History Graveyard Candidate | NO |
| Contains old conceptual noise and lacks approved current authority | BLOCKED_PHILOSOPHY_NOISE | Quarantine + Owner Review | NO |
| Has text marker only | UNCERTIFIED | Treat as uncoded until proven otherwise | NO |

## Gate Decision

An object passes the Code Gate only if it is `ACTIVE_CODED`.

All other classifications require quarantine, coding, removal review, or Owner decision.

