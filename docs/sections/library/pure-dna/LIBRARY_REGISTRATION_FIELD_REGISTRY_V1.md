# LIBRARY_REGISTRATION_FIELD_REGISTRY_V1

## Purpose

Inventory future Library-facing registration fields without removing existing registration categories.

## Registration Field Registry

| Field ID | Field | Applies To | Purpose | Display Eligible | Owner | Future Runtime Status |
|---|---|---|---|---|---|---|
| LIB-REG-001 | Full Name / Organization Name | Provider / Center / Association | Identity label | YES | Registration Owner | FUTURE_SOURCE |
| LIB-REG-002 | Category | Provider / Center / Association / Education | Routing to branch | YES | Registration Owner | FUTURE_SOURCE |
| LIB-REG-003 | Sub-specialty / Activity Detail | Provider / Center | More precise display | YES | Registration Owner | FUTURE_SOURCE |
| LIB-REG-004 | About / Description | All | Public summary | YES_AFTER_REVIEW | Content Owner | FUTURE_SOURCE |
| LIB-REG-005 | Qualifications / Certifications | Provider | Professional context | YES_AFTER_REVIEW | Provider Owner | FUTURE_SOURCE |
| LIB-REG-006 | Services / Activities | Provider / Center / NGO | Public explanation | YES_AFTER_REVIEW | Content Owner | FUTURE_SOURCE |
| LIB-REG-007 | City / Region | All | Discovery context | YES | Registration Owner | FUTURE_SOURCE |
| LIB-REG-008 | Contact/Public Links | All | Public contact if approved | YES_AFTER_APPROVAL | Publication Owner | FUTURE_SOURCE |
| LIB-REG-009 | Logo/Image | Center / Association / Education | Visual identity | YES_AFTER_APPROVAL | Asset Owner | FUTURE_SOURCE |
| LIB-REG-010 | Accessibility Notes | All | Accessibility readiness | YES_AS_BADGE | Accessibility Owner | FUTURE_SOURCE |
| LIB-REG-011 | Publishing Targets | Provider / Center | Future publishing routing | NO_DIRECT_DISPLAY | Publishing Owner | FUTURE_SIGNAL |
| LIB-REG-012 | Internal Notes | All | Review context | NO | Governance Owner | INTERNAL_ONLY |

## Validation

Every field documented: YES

No existing registration categories removed: YES

## Final Status

LIBRARY_REGISTRATION_FIELD_REGISTRY_CREATED
