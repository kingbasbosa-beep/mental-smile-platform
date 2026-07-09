# Entry/Auth Button Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Entry/Auth

Date: 2026-06-23

## Family 1 - Client Entry Buttons

Includes:

- Quick Access Client
- Accessibility Client

Purpose:
Open client-facing entry paths without requiring account identity.

Visual Philosophy:
Same shape, same weight, same psychological status.

Psychological Rule:
No visual discrimination. Accessibility entry must not mark a person as lesser, separate, or clinically different.

Accessibility Rule:
Each button should have visible title, visual icon, speaker-ready metadata, tooltip, and language-safe wording.

Allowed Destinations:

- Client Room
- Accessibility Room
- future client-support route approved by Entry/Auth and Residential boundaries

Forbidden Destinations:

- provider dashboard
- center dashboard
- owner route
- commercial account creation
- booking/payment/case management

## Family 2 - Identity/Login Buttons

Includes:

- Login
- Create Account
- Continue with account if present

Purpose:
Clearly indicate authentication or account continuation.

Visual Philosophy:
Account actions must look different from client room entry buttons.

Psychological Rule:
Auth must not imply higher human status than anonymous client entry.

Accessibility Rule:
Auth controls require clear labels, field explanations, error language, and voice-ready support.

Allowed Destinations:

- `/commercial-v2/start`
- approved account recovery or registration pages

Forbidden Destinations:

- direct unprotected owner route
- direct provider/center dashboard without auth resolution
- client room routes when presented as identity login

Final unified login rule:

```text
Phone
+
Password
```

Entry/Auth may collect identity credentials only. Profile creation and profile editing belong to destination sections after authentication.

## Family 3 - Professional / Owner Buttons

Includes:

- Provider
- Center
- Owner

Purpose:
Open professional or authority pathways.

Visual Philosophy:
Different from client buttons; authority paths must be visually separate from client access.

Psychological Rule:
Professional authority must not visually dominate or devalue client access.

Accessibility Rule:
Labels must explain the route purpose and authentication expectation.

Allowed Destinations:

- `/commercial-v2/start`
- protected role resolution after successful authentication

Forbidden Destinations:

- Client Room
- Accessibility Room
- anonymous client pathways
- Commercial profile editing or profile shell creation before authentication closure

## Family 4 - External Web Button

Includes:

- Website
- Web Portal
- Firebase Hosted Web
- Official Website

Purpose:
Open public web surface.

Visual Philosophy:
Clearly distinct from in-app room and login buttons.

Psychological Rule:
Web entry is informational/public, not an authority or client class marker.

Accessibility Rule:
Must say that it opens the public website or web surface.

Allowed Destinations:

- official public website route
- public landing route
- external URL when explicitly configured

Forbidden Destinations:

- owner page
- commercial dashboard
- protected account area
- client room route
