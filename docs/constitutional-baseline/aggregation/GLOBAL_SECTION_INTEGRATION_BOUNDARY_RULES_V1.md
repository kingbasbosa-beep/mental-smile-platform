# GLOBAL_SECTION_INTEGRATION_BOUNDARY_RULES_V1

Status: ACTIVE GLOBAL BOUNDARY RULES

## Integration Boundary

Each section owns its internal runtime.

External sections may only send governed packages to the section inbox.

External sections may only receive governed packages from the section outbox.

## Boundary Table

| Integration Type | Allowed? | Required Gate |
|---|---|---|
| Section to section package | YES | Source Outbox -> Destination Inbox |
| Section direct write into another section runtime | NO | Not allowed |
| Section direct route into another section internal runtime | NO | Not allowed |
| Registration to Library display direct write | NO | Commercial V2 Outbox + Library Inbox required |
| Library pulling from Commercial registration runtime | NO | Publishing package required |
| Monitoring receiving summaries | YES | Section Outbox package required |
| Archive receiving packages | YES | Section Outbox package required |

## Hidden Integration Rule

Any hidden dependency, implicit write, direct route, route alias, or shared runtime mutation across section boundaries is a constitutional violation.

FINAL STATUS: GLOBAL_SECTION_INTEGRATION_BOUNDARY_RULES_ACTIVE
