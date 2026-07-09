# Residential Reporting Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Residential

Date: 2026-06-23

## Purpose

Residential reports describe room usage, accessibility access, and fresh intent patterns without creating permanent client identity.

## Possible Residential Reports

| Report | Source Data | Aggregation | Destination | Notes |
| --- | --- | --- | --- | --- |
| Residential Room Access Summary | future room-open signals if approved | Residential aggregation point | Monitoring summary / Residential archive | no client identity |
| Accessibility Card Demand Summary | future card-open signals if approved | Residential aggregation point | Monitoring summary / Residential archive | counts demand by card |
| External Resource Opening Summary | future external-link signals if approved | Residential aggregation point | Monitoring summary / Residential archive | no click history per client |
| Accessibility Suggestions Summary | WhatsApp-only today; future governed source if approved | Residential archive if formalized | Residential archive / Owner coordination | no database write today |
| Check-In Visit Summary | WhatsApp-only today; future governed source if approved | Residential archive if formalized | Residential archive / Monitoring if approved | answers must not be stored without approval |

## Current Data Sources

Current Residential pages do not require Firestore reporting.

Current WhatsApp flows are external handoff flows. They do not create Residential database reports unless a future governed intake mechanism is approved.

## Reporting Destinations

Residential reports may go to:

- Residential archive
- Monitoring observability when approved
- Owner coordination summaries at convergence points

Residential reports must not become:

- clinical files
- client case files
- provider assignment queues
- booking reports
- payment reports

## Residential Aggregation Source

Operation:

`OP-RESIDENTIAL-AGGREGATION-IMPLEMENTATION-V1`

Residential Aggregation Point is the first Residential-owned operational intelligence source feeding Strategic Planning and Intelligence.

Aggregation home:

`docs/sections/residential/aggregation/`

Accepted inputs:

- Residential Signals.
- Residential Reports.
- Residential Activity Summaries.

Allowed output:

- Residential Summary Package.

Summary cadence:

- Weekly Summary.
- Monthly Summary.
- Quarterly Summary.

Strategic Planning and Intelligence may consume only reviewed Residential Summary Packages.

Raw Residential Signals remain ineligible as direct Strategic Planning source material.
