# Entry/Auth Content Card Guide V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Date: 2026-06-23
Section: Entry/Auth
Mode: Content cards and config alignment only

## Purpose

This guide defines the card format used to record Entry/Auth content items. It covers Splash, Login, direct Entry/Auth routes, navigation destinations, relevant asset entries, and Firebase/Auth dependencies.

This guide does not redesign Entry/Auth. It records what exists, what each item is expected to do, and whether it matches the current mission.

## Card Format

Each Entry/Auth content card uses the following fields:

- Card ID
- Item type
- Screen owner
- Current file
- Current route
- Current visible label
- Current purpose
- Expected mission
- Opens / calls / depends on
- Auth required?
- Firebase required?
- YAML asset required?
- Signal candidate?
- Accessibility requirement
- Status
- Evidence
- Owner decision needed?
- Notes

## Status Values

- ACTIVE: One of the four approved Entry/Auth paths or a required control/config dependency for those paths.
- ARCHIVE_ONLY: Any previous Entry/Auth route/control/config reference outside the four approved paths.

## Evidence Rule

Cards must cite observed files, routes, rules, or asset entries. Do not mark an item wrong based on future intent alone.

## Fix Rule

This guide records ownership and cards only. Runtime fixes are not performed by this migration.

## Finalization Addendum

The final Entry/Auth closure doctrine allows only four active entry paths:

1. Splash Quick Access -> Client Room
2. Splash Accessibility Access -> Accessibility Room
3. Splash Provider / Center / Owner Access -> Unified Start
4. Splash Official Website -> Firebase Hosted Website / verified public website

All other Entry/Auth-connected route references must be documented as `ARCHIVE_ONLY` for Entry/Auth, even when the target route still belongs to another active section.
