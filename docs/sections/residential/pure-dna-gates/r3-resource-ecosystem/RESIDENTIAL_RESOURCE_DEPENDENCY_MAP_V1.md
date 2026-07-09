# RESIDENTIAL_RESOURCE_DEPENDENCY_MAP_V1

Status: ACTIVE

Gate: R3

Runtime Status: NOT CONNECTED

Purpose: Map dependencies between Residential operational resources, UI cards, signal cards, archive magnets, localization and accessibility.

---

## Dependency Map

| Resource Family | Depends On UI Card | Depends On Signal Card | Depends On Localization | Depends On Accessibility | Depends On Archive Magnet | Runtime Dependency |
|---|---|---|---|---|---|---|
| Applications | R2-UI-APP-001 to R2-UI-APP-005 | R2-SIG-064 to R2-SIG-068 | Existing app/link keys | AccessibilityGuideIcon + semantics | RB60 | NONE |
| Tools | R2-UI-TOL-001 to R2-UI-TOL-007 | R2-SIG-057 to R2-SIG-063 | Existing tool keys | AccessibilityGuideIcon + semantics | RB50 | NONE |
| Links | R2-UI-LNK-001 to R2-UI-LNK-008 | R2-SIG-069 to R2-SIG-076 | Existing link keys | AccessibilityGuideIcon + semantics | RB70 / RB130 | NONE |
| Groups | R2-UI-MIX-002 / R2-UI-TOL-004 | R2-SIG-090 / R2-SIG-060 | Existing support/community keys | AccessibilityGuideIcon + semantics | RB120 / RB50 | NONE |
| Government Resources | R2-UI-LNK-004 / R2-UI-TOL-003 | R2-SIG-072 / R2-SIG-059 | Existing resource keys | AccessibilityGuideIcon + semantics | RB70 / RB50 | NONE |
| NGO Resources | R2-UI-LNK-004 / R2-UI-TOL-003 | R2-SIG-072 / R2-SIG-059 | Existing resource keys | AccessibilityGuideIcon + semantics | RB70 / RB50 | NONE |
| Accessibility Resources | R2-UI-AUD-* / R2-UI-TOL-* / R2-UI-LNK-* | R2-SIG-039 to R2-SIG-076 | Accessibility keys | AccessibilityGuideIcon + semantics | RB40 / RB50 / RB70 | NONE |
| Support Resources | R2-UI-MIX-001 / R2-UI-MIX-002 | R2-SIG-089 / R2-SIG-090 | Support/suggestion keys | AccessibilityGuideIcon + semantics | RB110 / RB120 | NONE |
| Educational Resources | R2-UI-APP-002/003 / R2-UI-LNK-007 | R2-SIG-065/066/075 | Resource/library keys | AccessibilityGuideIcon + semantics | RB60 / RB70 | NONE |
| AI Resources | R2-UI-AUD-* | R2-SIG-039 to R2-SIG-056 / future R.PR | applicationAudioSoon | AccessibilityGuideIcon + semantics | RB40 / RB140 | NONE |

---

## Dependency Rules

1. A resource must not exist without a Master Card.
2. A resource visible in UI must reference a UI Technical Card.
3. A resource that can be counted must reference a Signal Card.
4. A resource with visible copy must reference localization.
5. A resource that is user-facing must preserve accessibility and semantics.
6. A resource must route to an Archive Magnet before runtime connection.

---

## Validation

Missing dependency links: 0

Final Status: RESIDENTIAL_RESOURCE_DEPENDENCY_MAP_CREATED

