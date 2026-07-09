# Residential Aggregation Reader V1

## Status

READER CONTRACT

NO RUNTIME READER CREATED

## Purpose

Define read rules for reviewed Residential Summary Packages.

## Eligible Readers

- Residential.
- Strategic Planning and Intelligence.
- Owner, when package is elevated for owner review.
- Archive, when package is archived as historical intelligence.
- Legal, only for reviewed risk or compliance context.
- Technical Operations, only for feasibility or reliability context.

## Read Rules

- Readers may read reviewed Residential Summary Packages.
- Readers must preserve Residential ownership.
- Readers must preserve no-client-identity boundary.
- Readers must not treat summaries as clinical records.
- Readers must not treat summaries as booking, payment, or case management records.
- Readers must not read raw Residential signals through this contract.

## Strategic Planning Consumption Rule

Strategic Planning and Intelligence may consume only reviewed Residential Summary Packages.

Strategic Planning and Intelligence may not consume unreviewed Residential raw signals as strategic intelligence.

## Boundary

This reader contract does not create read APIs, dashboards, routes, Firebase rules, or UI.

