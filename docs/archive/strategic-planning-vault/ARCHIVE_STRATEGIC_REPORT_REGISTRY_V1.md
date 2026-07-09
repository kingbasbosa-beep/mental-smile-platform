# Archive Strategic Report Registry V1

## Status

ARCHIVE REGISTRY

NO RUNTIME

## Purpose

Register strategic report categories eligible for permanent archive custody.

## Registry

| Report Type | Description | Required Source Metadata | Historical Classification | Archive Owner | Runtime Created |
|---|---|---|---|---|---|
| Strategic Report | Reviewed strategic analysis or recommendation package. | Source department, date, authoring context, review status | REVIEWED_STRATEGIC_INTELLIGENCE | ARCHIVE | NO |
| Weekly Planning Package | Weekly reviewed planning bundle. | Week, source, review status, related risks/opportunities | CURRENT_STRATEGIC_REFERENCE | ARCHIVE | NO |
| Quarterly Review | Quarterly strategic review package. | Quarter, source, review status, linked reports | HISTORICAL_STRATEGIC_RECORD | ARCHIVE | NO |
| Risk Report | Strategic risk analysis. | Risk category, severity, source, review status | REVIEWED_STRATEGIC_INTELLIGENCE | ARCHIVE | NO |
| Opportunity Report | Strategic opportunity analysis. | Opportunity category, source, review status | REVIEWED_STRATEGIC_INTELLIGENCE | ARCHIVE | NO |
| Owner-approved Strategic Reference | Strategic reference approved by Owner. | Owner reference, source package, approval context | OWNER_APPROVED_REFERENCE | ARCHIVE | NO |
| Strategic Direction Record | Historical owner or planning direction reference. | Direction source, affected departments, date | HISTORICAL_STRATEGIC_RECORD | ARCHIVE | NO |

## Registry Rules

- Registry entries define archive categories only.
- Registry entries do not create dashboards.
- Registry entries do not create Firebase collections.
- Registry entries do not create active workflows.

