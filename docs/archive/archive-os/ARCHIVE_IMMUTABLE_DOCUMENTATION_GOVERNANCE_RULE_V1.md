# Archive Immutable Documentation Governance Rule V1

Operation ID: OP-ARCHIVE-IMMUTABLE-DOCUMENTATION-GOVERNANCE-RULE-V1

Date: 2026-06-26

Status: ACTIVE

Owner Authority: Owner / Administrator

## Purpose

This rule protects Mental Smile documentation history from silent mutation, loss, deletion, or hidden correction.

Approved documentation is a truth record. If it later becomes wrong, outdated, superseded, retired, or invalidated, the previous version must remain readable as historical evidence.

## Core Rule

Documentation is immutable after approval.

No approved document, guide, constitution, card, report, registry, snapshot, doctrine, map, index, or audit may be silently modified in place when the meaning, purpose, status, ownership, scope, route relationship, runtime relationship, or historical content changes.

Meaningful changes require a new version.

## Strict Prohibitions

From this rule forward:

- No document deletion.
- No silent document edits.
- No in-place replacement of approved documents.
- No in-place replacement of approved cards.
- No in-place replacement of constitutions.
- No in-place replacement of guides or doctrines.
- No in-place replacement of reports or snapshots.
- No deletion of wrong documents.
- No removal of historical truth.
- No cleanup operation may erase prior approved documentation history.

## Wrong Document Handling

If an approved document is wrong, obsolete, unsafe, superseded, or no longer active:

- Do not delete it.
- Do not silently correct it in place.
- Preserve the original content.
- Mark its status through an index, registry, card, or supersession record.
- Create a new corrected version when correction is required.

Allowed inactive statuses:

- `SUPERSEDED`
- `RETIRED`
- `NOT_ACTIVE`
- `INVALIDATED`

## Update Model

### Previous Version

The previous version:

- stays unchanged;
- remains readable;
- is archived if it is not already in an archive/history location;
- is marked in an index, registry, card, or canonical pointer layer as no longer active;
- keeps its original evidence value.

### New Version

The new version:

- is created as a full new version;
- receives a new version suffix;
- states what it supersedes;
- explains the reason for supersession;
- becomes the active/current document only after approval;
- is registered in the Latest / Canonical pointer layer when that layer exists.

## Card Immutability Model

Cards are immutable too.

If a card purpose, mission, ownership, route, or runtime relationship changes:

- do not overwrite the old card;
- archive or retain the old card as historical evidence;
- mark the old card as `NOT_ACTIVE` or `SUPERSEDED`;
- create a new card with a new version.

Every new or superseding card should include:

- Current Mission
- Previous Mission Summary, if inherited from an older card
- Status
- Version
- Supersedes
- Superseded By
- Reason for Supersession
- Current Route, if active
- Archive Route / Archive Location, if inactive

Minimum required fields when runtime scope is narrow:

- Current Mission
- Status
- Version
- Supersedes
- Reason for Supersession

## Latest / Canonical Layer Rule

The Latest / Canonical layer must not duplicate full document content.

It should point to the active/current version only.

It should include current pointers for:

- current constitution;
- current guide;
- current doctrine;
- current card;
- current registry;
- current operation index;
- current route map;
- current archive index;
- current runtime map when applicable.

Historical versions remain in archive/history.

## Permission Rule

Only Owner / Administrator-level authority may add, retire, invalidate, or supersede approved documents.

No ordinary runtime action may alter approved documentation.

No automated tool may mutate approved documents unless explicitly instructed by Owner authority.

## Archive Room Impact

Archive Room must expose:

1. Current / Canonical Documents
2. Historical Documents
3. Superseded Documents
4. Invalidated / Retired Documents
5. Timeline by date/time
6. Reason for supersession where available

Archive Room must never hide old versions.

Archive Room must never treat deletion as cleanup.

## Compliance Result

This rule is active for all future documentation operations after 2026-06-26.

Final Result: ARCHIVE_IMMUTABLE_DOCUMENTATION_GOVERNANCE_RULE_CREATED
