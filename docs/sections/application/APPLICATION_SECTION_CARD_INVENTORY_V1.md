# Application Section Card Inventory V1

Operation ID: OP-APPLICATION-SECTION-FINAL-AUDIT-CLEANUP-V1  
Date: 2026-06-23

## Counting Method

- Card files inspected: 10
- Card records counted: 51
- Entry/Auth card records: 46
- Residential card records: 4
- Application guidance card records: 1
- Exit card records: 1, included in Residential
- Quick Access wall-card subjects covered by the Residential package card: 5

The five Quick Access wall cards are covered by one package card. The separate Links card is a detailed card for one of those five subjects and is not counted again as a new runtime card.

## Entry/Auth Cards

| Card File | Card ID | Section Owner | Runtime Surface | Purpose | Route | Status | Runtime Impact | Signal Candidate | Archive Status |
|---|---|---|---|---|---|---|---|---|---|
| `ENTRY_AUTH_BUTTON_CARDS_V1.md` | EA-BUTTON-001 | Entry/Auth | Splash | Language toggle | `/splash` | ACTIVE | Locale selection | entry language selected | ACTIVE |
| same | EA-BUTTON-002 | Entry/Auth | Splash | Quick Access | `/client/room` | ACTIVE | Opens Client Room | quick access opened | ACTIVE |
| same | EA-BUTTON-003 | Entry/Auth | Splash | Accessibility Access | `/accessibility/room` | ACTIVE | Opens Accessibility Room | accessibility access opened | ACTIVE |
| same | EA-BUTTON-004 | Entry/Auth | Splash | Provider / Center Access | `/commercial-v2/start` | ACTIVE | Opens Unified Start | unified start opened | ACTIVE |
| same | EA-BUTTON-005 | Entry/Auth | Splash | Official Website | `/` | ACTIVE | Opens public portal | website opened | ACTIVE |
| same | EA-BUTTON-006 | Entry/Auth | Login | Email field | `/login` | ARCHIVE_ONLY | Archived login input | none | ARCHIVE_ONLY |
| same | EA-BUTTON-007 | Entry/Auth | Login | Password field | `/login` | ARCHIVE_ONLY | Archived login input | none | ARCHIVE_ONLY |
| same | EA-BUTTON-008 | Entry/Auth | Login | Password visibility | `/login` | ARCHIVE_ONLY | Archived local UI | none | ARCHIVE_ONLY |
| same | EA-BUTTON-009 | Entry/Auth | Login | Login submit | `/login` | ARCHIVE_ONLY | Archived auth action | auth result | ARCHIVE_ONLY |
| same | EA-BUTTON-010 | Entry/Auth | Login | Registration link | `/language` | ARCHIVE_ONLY | Archived navigation | registration intent | ARCHIVE_ONLY |
| same | EA-BUTTON-011 | Entry/Auth | Unified Start | Phone field | `/commercial-v2/start` | ACTIVE | Auth input | none | ACTIVE |
| same | EA-BUTTON-012 | Entry/Auth | Unified Start | Password field | `/commercial-v2/start` | ACTIVE | Auth input | none | ACTIVE |
| same | EA-BUTTON-013 | Entry/Auth | Unified Start | Login button | `/commercial-v2/start` | ACTIVE | Authenticates account | auth result | ACTIVE |
| same | EA-BUTTON-014 | Entry/Auth | Unified Start | Create Account | `/commercial-v2/start` | ACTIVE | Creates account | account creation result | ACTIVE |
| same | EA-BUTTON-015 | Entry/Auth | Unified Start | Language toggle | `/commercial-v2/start` | ACTIVE | Localized labels | language selected | ACTIVE |
| same | EA-BUTTON-016 | Entry/Auth | Unified Start | Cancel | previous route or `/splash` | ACTIVE | Safe exit | cancel clicked | ACTIVE |
| `ENTRY_AUTH_FIREBASE_RULE_CARDS_V1.md` | EA-FB-001 | Entry/Auth | Role resolution | Custom-claim helpers | protected routes | ACTIVE | Authorization evidence | none | ACTIVE |
| same | EA-FB-002 | Entry/Auth | Login dependency | Clinician reads | `/login` | ARCHIVE_ONLY | Archived login dependency | none | ARCHIVE_ONLY |
| same | EA-FB-003 | Entry/Auth | Login dependency | Center reads | `/login` | ARCHIVE_ONLY | Archived login dependency | none | ARCHIVE_ONLY |
| same | EA-FB-004 | Entry/Auth | Unified Start | Commercial profile shell rules | `/commercial-v2/start` | ACTIVE | Auth/profile shell dependency | none | ACTIVE |
| same | EA-FB-005 | Entry/Auth | Block gate | Blocked account fields | `/account-blocked` | ARCHIVE_ONLY | Archived login gate evidence | none | ARCHIVE_ONLY |
| same | EA-FB-006 | Entry/Auth | Auth | Firebase Auth dependency | Unified Start | ACTIVE | Authentication | auth result | ACTIVE |
| `ENTRY_AUTH_ROUTE_CARDS_V1.md` | EA-ROUTE-001 | Entry/Auth | Splash | Startup route | `/splash` | ACTIVE | Initial route | entry opened | ACTIVE |
| same | EA-ROUTE-002 | Entry/Auth | Unified Start | Official auth entry | `/commercial-v2/start` | ACTIVE | Authentication gateway | unified start opened | ACTIVE |
| same | EA-ROUTE-003 | Residential destination | Client Room | Quick Access destination | `/client/room` | ACTIVE | Room entry | room opened | ACTIVE |
| same | EA-ROUTE-004 | Residential destination | Accessibility Room | Accessibility destination | `/accessibility/room` | ACTIVE | Room entry | room opened | ACTIVE |
| same | EA-ROUTE-005 | Entry/Auth archive | Login | Archived auth route | `/login` | ARCHIVE_ONLY | Existing archived page | none | ARCHIVE_ONLY |
| same | EA-ROUTE-006 | Public Web destination | Portal Home | Official Website | `/` | ACTIVE | Public portal | website opened | ACTIVE |
| same | EA-ROUTE-007 | Entry/Auth archive | Language | Archived register path | `/language` | ARCHIVE_ONLY | Existing archived path | none | ARCHIVE_ONLY |
| same | EA-ROUTE-008 | Entry/Auth archive | Block gate | Archived blocked route | `/account-blocked` | ARCHIVE_ONLY | Existing archived path | none | ARCHIVE_ONLY |
| same | EA-ROUTE-009 | Owner destination | Owner | Archived Login destination | `/s/owner` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-010 | Monitoring destination | Monitoring | Archived Login destination | `/s/capital/signal-monitoring-room` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-011 | Registry destination | Registry | Archived Login destination | `/s/registry-room` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-012 | Declaration destination | Review | Archived Login destination | `/s/declaration-review-room` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-013 | Support destination | Support | Archived Login destination | `/s/support-room` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-014 | Commercial destination | Clinician Room | Archived Login destination | `/clinician/room` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-015 | Commercial destination | Center Dashboard | Archived Login destination | `/center/dashboard` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| same | EA-ROUTE-016 | Application shell | Menu | Archived Login fallback | `/menu` | ARCHIVE_ONLY | Outside active Entry/Auth | none | ARCHIVE_ONLY |
| `ENTRY_AUTH_SCREEN_CARDS_V1.md` | EA-SCREEN-001 | Entry/Auth | Splash | Public gateway | `/splash` | ACTIVE | Entry surface | entry action family | ACTIVE |
| same | EA-SCREEN-002 | Entry/Auth archive | Login | Archived login evidence | `/login` | ARCHIVE_ONLY | Existing archived screen | auth result | ARCHIVE_ONLY |
| same | EA-SCREEN-003 | Entry/Auth | Unified Start | Authentication entry reference | `/commercial-v2/start` | ACTIVE | Shared destination | auth result | ACTIVE |
| same | EA-SCREEN-004 | Public Web | Portal Home | Official website reference | `/` | ACTIVE | Public destination | website opened | ACTIVE |
| `ENTRY_AUTH_YAML_ASSET_CARDS_V1.md` | EA-YAML-001 | Entry/Auth | Splash | Splash assets | `/splash` | ACTIVE | Visual assets | none | ACTIVE |
| same | EA-YAML-002 | Entry/Auth archive | Login | Login assets | `/login` | ARCHIVE_ONLY | Existing archived assets | none | ARCHIVE_ONLY |
| same | EA-YAML-003 | Entry/Auth | Splash | Language asset | `/splash` | ACTIVE | Locale control image | none | ACTIVE |
| same | EA-YAML-004 | Commercial destination | Unified Start | Commercial start assets | `/commercial-v2/start` | ACTIVE | Shared destination assets | none | ACTIVE |

## Residential Cards

| Card File | Card ID | Section Owner | Runtime Surface | Purpose | Route | Status | Runtime Impact | Signal Candidate | Archive Status |
|---|---|---|---|---|---|---|---|---|---|
| `QUICK_ACCESS_FEATHER_TOOL_CARD_V1.md` | QUICK_ACCESS_FEATHER_TOOL_V1 | Residential | Client Room | Select notebook message | `/client/room` | ACTIVE | Local notebook state | feather opened, message selected | ACTIVE |
| `QUICK_ACCESS_ROOM_FIVE_CARDS_CARD_V1.md` | QUICK_ACCESS_ROOM_FIVE_CARDS_V1 | Residential | Client Room wall | Covers Check-In, Apps, Suggestion, Your Tools, Your Links | shared routes/local dialogs | ACTIVE | Five wall cards | card clicked family | ACTIVE |
| `QUICK_ACCESS_LINKS_CARD_V1.md` | QUICK_ACCESS_LINKS_CARD_V1 | Residential | Client Room | Detailed categorized links behavior | local dialog | ACTIVE | External-link directory | link category/opened | ACTIVE |
| `RESIDENTIAL_EXIT_SOCIAL_LINKS_PAGE_CARD_V1.md` | RESIDENTIAL_EXIT_SOCIAL_LINKS_PAGE_V1 | Residential | Exit page | Official links after room exit | `/residential/exit-social-links` | ACTIVE | Residential exit destination | exit/social click family | ACTIVE |

## Application Guidance Cards

| Card File | Card ID | Section Owner | Runtime Surface | Purpose | Route | Status | Runtime Impact | Signal Candidate | Archive Status |
|---|---|---|---|---|---|---|---|---|---|
| `APPLICATION_CLIENT_SAFETY_GUIDE_CARD_V1.md` | APPLICATION_CLIENT_SAFETY_GUIDE_CARD_V1 | Application | Links Card guidance placement | Safety and complaint-boundary guidance | READY_TO_ADD | ACTIVE | none | application_safety_guidance_opened | ACTIVE |

## Totals

Entry/Auth cards count: **46**

Residential cards count: **4 documented records**

Exit cards count: **1**

Application guidance cards count: **1**

Total cards count: **51 documented records**

Quick Access wall-card subjects covered: **5**
