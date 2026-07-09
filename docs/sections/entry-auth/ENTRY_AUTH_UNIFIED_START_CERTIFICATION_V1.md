# Entry/Auth Unified Start Certification V1

Operation ID: OP-ENTRY-AUTH-UNIFIED-START-MIGRATION-V1
Date: 2026-06-23

## Official Name

Unified Start

## Official Route

`/commercial-v2/start`

## Owned By

Entry/Auth Section

## Purpose

Unified authentication entry for:

- Provider
- Center
- Owner

## Responsibilities

Unified Start owns:

- Login
- Registration
- Language
- Accessibility helpers
- Exit / Cancel

## Not Responsible For

Unified Start is not responsible for:

- Profile creation
- Profile editing
- Commercial profile management
- Dashboard logic
- Provider tools
- Center tools
- Owner tools
- Discovery
- PDF generation
- AI profile generation

## Authentication Rule

```text
Phone
+
Password
```

Registration rule:

- Phone required
- Password required
- Email not required

Email policy:

- Email belongs to Profile Creation.
- Email does not belong to Entry/Auth.

## Active Entry Map

```text
Splash
|-- Quick Access -> Client Room
|-- Accessibility Access -> Accessibility Room
|-- Provider / Center / Owner Access -> /commercial-v2/start
|-- Official Website -> Firebase Hosted Website / verified public website
```

## Certification

Unified Start Status: PASS

Official Auth Entry: `/commercial-v2/start`

Login Route Status: ARCHIVE_ONLY

Phone Authentication Rule Documented: YES

Email Moved To Profile Creation: YES

Runtime Changed: NO

Final Certification: ENTRY_AUTH_UNIFIED_START_CERTIFIED
