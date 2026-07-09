# Global First Runtime Connection Risk Register V1

Status: ACTIVE_RUN_1_RISK_REGISTER
Runtime effect: none

| Risk | Severity | Control | RUN-1 State |
| --- | --- | --- | --- |
| Live rules opened too broadly | BLOCKING | Proposal-only rules, exact schema allowlist | CONTROLLED |
| Direct section-to-section writes | BLOCKING | Archive-only durable collection plan | CONTROLLED |
| Identity leakage | SECURITY | Excluded field list and anonymous signal first | CONTROLLED |
| Client emotional/free text leakage | SECURITY | Commercial V2 first, Residential deferred | CONTROLLED |
| Route used as package target | ERROR | Destination code only, no route target | CONTROLLED |
| Firestore collection used as package target | ERROR | Collection is storage, not destination | CONTROLLED |
| Legacy chat/module residues | WARNING | Documented as review items | REVIEW_REQUIRED |
| Quarantine missing before broad traffic | BLOCKING | Quarantine collection in first collection plan | CONTROLLED |
| Guard runtime not implemented | BLOCKING | First write not authorized until guard plan is implemented or simulated | BLOCKED |
| Owner commands not run | WARNING | Owner will run manually | REVIEW_REQUIRED |
| Dirty worktree/live rules uncertainty | WARNING | No live runtime edits in RUN-1 | CONTROLLED |

## Blockers Before First Live Write

1. Apply and review Firestore rules for Archive-owned first collections.
2. Confirm first payload contains only approved fields.
3. Confirm guard handling for accepted/quarantined status.
4. Owner manually runs chosen validation commands.

