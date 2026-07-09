# CAPSULE_EVOLUTION_POLICY_V1

Status: ACTIVE

## Purpose

Define how Residential Sovereign Capsules evolve while preserving immutable history.

## V2 Creation

V2 is created only when Residential active runtime or active governance changes materially.

Required steps:

- create a new capsule folder and version
- use the latest Active Documents Registry
- preserve V1 unchanged
- set V2 status to `CERTIFIED` only after validation
- update active documents if V2 becomes the trusted source

## V3 Creation

V3 follows the same process as V2 and must supersede the currently active capsule only after Owner approval.

## Retirement

A capsule is retired when a newer certified capsule replaces it or Owner removes its active authority.

Retired capsules remain available as historical artifacts but cannot be treated as active truth.

## Supersession

When a capsule supersedes another:

- old capsule gets `superseded_by`
- old capsule gets `retirement_date`
- old capsule loses `ACTIVE_CURRENT`
- new capsule becomes `ACTIVE_CURRENT`

## ACTIVE_CURRENT Changes

`ACTIVE_CURRENT` changes only through an approved registry update. Folder name, textual label, or age does not determine active authority.

## Immutability

Certified capsule contents stay immutable. Patches may add clearly marked patch documents, but must not silently rewrite certified source snapshots.

## Historical Availability

Historical capsules remain available for audit, comparison, and recovery research, but future rebuilds must use the current Active Documents Registry.

FINAL STATUS: CAPSULE_EVOLUTION_POLICY_CREATED
