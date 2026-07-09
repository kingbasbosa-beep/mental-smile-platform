# Residential Summary Package V1

## Status

SUMMARY PACKAGE STRUCTURE

NO RUNTIME PACKAGE CREATED

## Purpose

Define the Residential Summary Package emitted by the Residential Aggregation Point.

## Inputs

- Residential Signals.
- Residential Reports.
- Residential Activity Summaries.

## Output

Residential Summary Package.

## Weekly Summary Structure

| Field | Required | Rule |
|---|---|---|
| Package ID | YES | Must identify week and Residential source. |
| Date Range | YES | Must cover one week. |
| Source Inputs | YES | Must identify signal/report/activity sources. |
| Activity Summary | YES | Must summarize activity without client identity. |
| Accessibility Summary | YES | Must summarize accessibility demand if present. |
| Room Usage Summary | YES | Must summarize Residential room patterns if present. |
| External Resource Summary | OPTIONAL | Must not store personal click history. |
| Risks | OPTIONAL | Must be Residential-safe and non-clinical. |
| Opportunities | OPTIONAL | Must be Residential-safe and non-clinical. |
| Validation Status | YES | Must be REVIEWED or BLOCKED. |
| Classification | YES | Must be RESIDENTIAL_WEEKLY_SUMMARY. |

## Monthly Summary Structure

| Field | Required | Rule |
|---|---|---|
| Package ID | YES | Must identify month and Residential source. |
| Date Range | YES | Must cover one month. |
| Weekly References | YES | Must reference included weekly summaries. |
| Trend Summary | YES | Must summarize trends without client identity. |
| Demand Summary | YES | Must summarize observed demand categories. |
| Risk Summary | OPTIONAL | Must not create clinical or case-management records. |
| Opportunity Summary | OPTIONAL | Must remain strategic and Residential-safe. |
| Validation Status | YES | Must be REVIEWED or BLOCKED. |
| Classification | YES | Must be RESIDENTIAL_MONTHLY_SUMMARY. |

## Quarterly Summary Structure

| Field | Required | Rule |
|---|---|---|
| Package ID | YES | Must identify quarter and Residential source. |
| Date Range | YES | Must cover one quarter. |
| Monthly References | YES | Must reference included monthly summaries. |
| Strategic Pattern Summary | YES | Must summarize Residential patterns for Strategic Planning and Intelligence. |
| Demand Evolution Summary | YES | Must identify demand movement without personal identity. |
| Risk Pattern Summary | OPTIONAL | Must remain non-clinical and non-case-based. |
| Opportunity Pattern Summary | OPTIONAL | Must remain strategic. |
| Validation Status | YES | Must be REVIEWED or BLOCKED. |
| Classification | YES | Must be RESIDENTIAL_QUARTERLY_SUMMARY. |

## Summary Metadata

- Package ID.
- Source section: Residential.
- Source inputs.
- Date range.
- Created date.
- Review status.
- Classification.
- Owner bucket: RESIDENTIAL.
- Strategic feed eligibility.
- Archive eligibility.
- No client identity confirmation.

## Validation Rules

- Must not include permanent client identity.
- Must not include diagnosis.
- Must not include booking or payment data.
- Must not include provider assignment data.
- Must identify source inputs.
- Must identify date range.
- Must identify review status.
- Must identify classification.

## Review Rules

- Summary must be reviewed before Strategic Planning and Intelligence consumption.
- Unreviewed material must remain blocked.
- Review must confirm Residential boundary compliance.
- Review must confirm no prohibited Residential core is reintroduced.

