# Entry/Auth Accessibility Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Entry/Auth

Date: 2026-06-23

## Principle

Accessibility support belongs to the interface, not to the person.

No client-facing button may visually mark the user as different.

## Required Assistance Metadata

Every Entry/Auth button should support:

- visible title
- simple description
- speaker icon
- voice label
- optional tooltip
- clear route purpose
- language-safe text

## Speaker Meaning

The speaker icon means:

`This button can be explained by voice.`

The speaker icon does not mean:

- disability label
- separate class of user
- lower capability
- special treatment marker

## Language Rule

Entry/Auth text must be safe in Arabic and English.

Arabic routes and button labels must support RTL layout.

English routes and button labels must support LTR layout.

## Current Reality

Current Splash buttons use visual icons but do not show speaker icons.

Current Login fields use icons and localized labels but do not include voice assistance indicators.

This guide documents the doctrine only. No runtime change is made by this foundation.

## Finalization Requirement

Every visible Entry/Auth button must support:

- clear label
- visual indicator
- speaker assistance icon or equivalent speaker-ready metadata
- future voice explanation
- language-safe wording

This applies to:

- Quick Access
- Accessibility Access
- Provider / Center / Owner Access
- Official Website
- Login
- Create Account
- Language controls
- Cancel / Back controls

Current runtime does not fully satisfy this requirement because Splash and Login do not yet show speaker assistance controls for every visible item.
