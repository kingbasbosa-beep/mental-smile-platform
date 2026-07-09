# APPLICATION SECTION FINAL ROUTE INVENTORY V1

Operation ID: OP-APPLICATION-SECTION-OPERATIONAL-FREEZE-BLOCK-V1

Classification allowed: ACTIVE / ARCHIVE_ONLY

## Route Inventory

| Route | Classification | Current Meaning |
| --- | --- | --- |
| `/splash` | ACTIVE | Main Application splash gateway. |
| `/client/room` | ACTIVE | Quick Access room. |
| `/accessibility/room` | ACTIVE | Accessibility room. |
| `/residential/exit-social-links` | ACTIVE | Residential official links exit destination. |
| `/commercial-v2/start` | ACTIVE | Unified Start reference for Provider / Center / Owner Access. |
| `/accessibility/links` | ACTIVE | Accessibility important links page. |
| `/accessibility/tools` | ACTIVE | Accessibility assistive tools page. |
| `/accessibility/suggestions` | ACTIVE | WhatsApp-only suggestions page. |
| `/accessibility/community-tools` | ACTIVE | Community tools placeholder page. |
| `/accessibility/checkin` | ACTIVE | Check-in and support contact page. |
| `/accessibility/message-of-the-day` | ACTIVE | Accessibility notebook message selection. |
| `/login` | ARCHIVE_ONLY | Legacy login destination; not a Splash entry. |
| Old owner/admin/monitoring login destinations | ARCHIVE_ONLY | Not Application user-facing entry points. |

## Official Website

Official Website destination:

`https://mental-smile-platform.web.app`

Classification:

ACTIVE

Behavior:

External URL launch from Splash. It must not open an internal owner/commercial/monitoring route.

Freeze Status:

PASS
