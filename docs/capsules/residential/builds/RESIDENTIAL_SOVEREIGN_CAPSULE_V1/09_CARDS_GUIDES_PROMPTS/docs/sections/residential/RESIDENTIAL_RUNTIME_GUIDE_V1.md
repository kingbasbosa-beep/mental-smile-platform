# Residential Runtime Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Residential

Date: 2026-06-23

## Runtime Surfaces

| Surface | Route | Primary Runtime File | Current Purpose |
| --- | --- | --- | --- |
| Client Room | `/client/room` | `lib/features/client/presentation/pages/client_room_page.dart` | Static residential client room with background and lightweight local controls |
| Accessibility Room | `/accessibility/room` | `lib/features/accessibility/presentation/pages/accessibility_room_page.dart` | Accessibility residential room with fixed wall cards and local room controls |
| Accessibility Links | `/accessibility/links` | `lib/features/accessibility/presentation/pages/accessibility_links_page.dart` | External accessibility/support links page |
| Accessibility Tools | `/accessibility/tools` | `lib/features/accessibility/presentation/pages/accessibility_tools_page.dart` | External assistive tools directory page |

The shared tools page uses function-based classifications only:

- أدوات دعم بصري
- أدوات دعم صوتي
- أدوات تواصل
- أدوات قراءة
- أدوات كتابة
- أدوات مساعدة يومية

It does not classify visitors by disability or identity. Existing tools, external links, and open behavior remain unchanged.
| Accessibility Suggestions | `/accessibility/suggestions` | `lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart` | WhatsApp-only suggestion form |
| Accessibility Community Tools | `/accessibility/community-tools` | `lib/features/accessibility/presentation/pages/accessibility_community_tools_page.dart` | Placeholder for future community-suggested tools |
| Accessibility Check In | `/accessibility/checkin` | `lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart` | WhatsApp-only check-in and support access page |
| Accessibility Message Of The Day | `/accessibility/message-of-the-day` | `lib/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart` | Predefined local motivational message selection |
| Residential Exit Social Portal | `/residential/exit-social-links` | `lib/features/residential/presentation/pages/residential_exit_social_portal_page.dart` | Residential-owned exit portal and return-to-splash destination |

## Fixed Runtime Elements

- room backgrounds
- exit cup controls
- YouTube external gateway controls
- temporary local photo display controls
- Quick Access Feather Tool
- Five fixed Quick Access wall cards:
  - طمّنا عليك -> shared `/accessibility/checkin`
  - تطبيقات وأدوات -> shared `/accessibility/community-tools`
  - شاركنا باقتراح -> shared `/accessibility/suggestions`
  - أدواتك -> local informational dialog
  - لينكاتك -> local categorized external-links directory with five categories and no persistence
- Visual marker, speaker placeholder, tooltip, and semantic-label coverage for visible Quick Access cards and controls
- Feather positioned below the wall frame beside the notebook zone
- Client notebook Daily Reflection Surface
- Accessibility Room wall cards
- speaker placeholder behavior
- visual icon plus speaker placeholder convention
- Client and Accessibility exit cups clear local room state and open the Residential-owned exit portal.
- Residential exit portal can return to Splash.
- Application Safety & Complaint Guidance is active inside the Quick Access Links Card as a local dialog. No complaint runtime, collection, or new route is active.

## Variable Runtime Elements

The following may evolve only through Residential section governance:

- room asset placement
- card placement
- card labels
- external link lists
- WhatsApp message copy
- predefined notebook messages
- accessibility page layout
- future Residential signals

## Do Not Build Inside Residential

Residential must not become:

- account management
- provider dashboard
- center dashboard
- booking system
- payment system
- diagnosis system
- case management system
- permanent client data store
- media hosting system
- chat platform
- complaint investigation system
- legal intake system
- professional misconduct adjudication system

## Data Boundary

Current Residential runtime is intentionally light.

Where interaction exists, it is local, external-link based, or WhatsApp based unless a future Residential signal is explicitly approved.

## Client Safety Boundary

Residential surfaces may guide clients to verify providers, centers, service details, and official complaint paths.

Residential must not:

- investigate complaints;
- store complaint details;
- judge legal or professional matters;
- store unnecessary personal data;
- route complaint details into Application Aggregation.

Platform WhatsApp is for platform-related issues, suggestions, and support routing only.

Related guide:

- docs/sections/application/APPLICATION_PLATFORM_USAGE_AND_SAFETY_GUIDE_V1.md

## Links Card Guidance Placement

The Quick Access Links Card supports categorized external links and one local guidance entry.

Safety & Complaint Guidance is now inserted as a local dialog:

Runtime status:

ACTIVE_LOCAL_DIALOG

Entry:

- `إرشادات الأمان والشكاوى`
- `Safety & Complaint Guidance`

Location:

- Client Room -> Links Card / `لينكاتك`

Behavior:

- opens local guidance dialog;
- does not open an external URL;
- does not exit the room;
- does not write Firebase;
- does not create a complaint form or complaint collection.
