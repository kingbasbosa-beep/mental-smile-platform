# Uncoded Object Quarantine Rule V1

Date: 2026-07-02

## Rule

Any object without an approved code must be classified before it can be trusted, used, preserved, removed, or promoted.

## Classification Classes

| Classification | Meaning | Action |
|---|---|---|
| USED_WITHOUT_CODE | Object is currently referenced or used, but has no approved code. | Quarantine + Needs Coding |
| UNUSED_WITHOUT_CODE | Object is not currently referenced and has no approved code. | Remove Candidate |
| HISTORICAL_WITHOUT_CODE | Object is historical/contextual and has no approved current code. | History Graveyard Candidate |
| BLOCKED_PHILOSOPHY_NOISE | Object carries old conceptual language that can contaminate decisions or generation. | Quarantine + Owner Review |
| ACTIVE_CODED | Object has approved code and current registry/runtime authority. | Allowed |

## Quarantine Requirements

A quarantined uncoded object must record:

- object path or identifier
- detected object type
- classification
- missing code type
- current reference evidence
- risk reason
- suggested coding or removal path
- owner review status

