# Entry/Auth Constitution V1

Status: ACTIVE_SECTION_FOUNDATION

Section: Entry/Auth

Date: 2026-06-23

## Section Definition

Entry/Auth owns the application entry surfaces and the Unified Start authentication gateway.

It owns:

- Splash Page
- Unified Start Page
- entry buttons
- language controls
- accessibility assistance indicators
- voice assistance indicators
- external web entry
- owner/provider/center/client entry paths as route openings only

It does not own the destination internals after a button opens a route.

## Doctrine

1. Splash is the public entry surface.
2. Unified Start is the identity/auth gateway.
3. Client entry buttons must not visually discriminate between client categories.
4. Quick Access Client and Accessibility Client buttons must use the same visual language.
5. Provider / Center / Owner access uses the Unified Start button family.
6. External web entry uses a fourth-button family.
7. Every button and every sentence must support assistive tools.
8. Assistive tools may include visual icon, speaker icon, voice label, tooltip, simplified wording, and language switch.
9. No client-facing button may imply superiority, disability separation, or psychological difference.
10. Accessibility entry is a support path, not a separate human category.
11. Owner routes must remain protected.
12. Provider / Center / Commercial routes must not be mixed with client room routes.
13. Web entry must clearly indicate it leaves the app or opens the web surface.
14. No route may remain unexplained inside this section.

## Boundary Rule

Entry/Auth documents where buttons lead.

Entry/Auth does not redefine the runtime rules of:

- Client Room
- Accessibility Room
- Commercial V2 profile engine
- Provider dashboard
- Center dashboard
- Owner Room
- Web Portal internals

## Runtime Rule

This foundation creates no runtime change.

## Unified Start Doctrine Addendum

Entry/Auth owns only:

- Splash Page
- Unified Start Page
- Entry buttons
- Language controls
- Accessibility assistance controls
- Website entry

Final active Entry/Auth paths:

1. Quick Access -> Client Room
2. Accessibility Access -> Accessibility Room
3. Provider / Center / Owner Access -> Unified Start
4. Official Website -> verified public website / Firebase hosted website

Entry/Auth does not own profile creation, profile editing, provider tools, center tools, owner tools, dashboards, monitoring rooms, or destination internals.

## Unified Start Rule

Target login and registration rule:

```text
Phone
+
Password
```

Validation principle:

- Phone is required for Entry/Auth.
- Password is required for Entry/Auth.
- Email is not required by Entry/Auth.
- Email belongs to profile creation and profile management sections.

Implementation note:

`/commercial-v2/start` is the official Unified Start runtime. This migration documents ownership and section boundaries only; it does not redesign Firebase Auth or Commercial V2 internals.

## Zero Residue Rule

Any route reference outside the four active Entry/Auth paths is documented as `ARCHIVE_ONLY` for Entry/Auth. This does not delete or disable the target route in its owning section.
