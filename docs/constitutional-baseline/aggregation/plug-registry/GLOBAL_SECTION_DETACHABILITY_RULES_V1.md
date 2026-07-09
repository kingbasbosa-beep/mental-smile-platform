# GLOBAL_SECTION_DETACHABILITY_RULES_V1

Status: ACTIVE GLOBAL RULE

## Detachability Rule

Any Mental Smile section must be detachable, replaceable, cloneable, or upgradeable by disconnecting only two governed plugs:

- `INBOX`
- `OUTBOX`

No external pipe may know or depend on the section internal topology.

## Implications

| Rule | Status |
|---|---|
| External systems know section code | ALLOWED |
| External systems know inbox/outbox plugs | ALLOWED |
| External systems know package contract | ALLOWED |
| External systems know internal runtime classes | PROHIBITED |
| External systems target section screens | PROHIBITED |
| External systems target section routes | PROHIBITED |
| External systems target section collections directly | PROHIBITED |

## Ownership

Internal networks are owned by the section.

External pipes are owned by integration governance.

FINAL STATUS: GLOBAL_SECTION_DETACHABILITY_RULES_ACTIVE
