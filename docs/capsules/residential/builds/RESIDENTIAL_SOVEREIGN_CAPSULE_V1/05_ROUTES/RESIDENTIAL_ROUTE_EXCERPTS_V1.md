# RESIDENTIAL_ROUTE_EXCERPTS_V1

Status: SNAPSHOTTED

## Purpose

Record Residential route constants and router cases needed for rebuild.

## Route Constants

Source: `lib/app/router/routes.dart`

```dart
static const residentialExitSocialLinks = '/residential/exit-social-links';
static const clientRoom = '/client/room';
static const accessibilityRoom = '/accessibility/room';
static const accessibilityLinks = '/accessibility/links';
static const accessibilityTools = '/accessibility/tools';
static const accessibilitySuggestions = '/accessibility/suggestions';
static const accessibilityCommunityTools = '/accessibility/community-tools';
static const accessibilityCheckin = '/accessibility/checkin';
static const accessibilityMessageOfDay = '/accessibility/message-of-the-day';
```

## Router Imports

Source: `lib/app/router/app_router.dart`

```dart
import 'package:mental_smile_os/features/residential/presentation/pages/residential_exit_social_portal_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_checkin_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_community_tools_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_links_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_message_of_day_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_suggestions_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_tools_page.dart';
import 'package:mental_smile_os/features/accessibility/presentation/pages/accessibility_room_page.dart';
```

## Router Cases

```dart
case Routes.residentialExitSocialLinks:
  return MaterialPageRoute(
    builder: (_) => const ResidentialExitSocialPortalPage(),
    settings: settings,
  );

case Routes.clientRoom:
  return MaterialPageRoute(
    builder: (_) => const ClientRoomPage(),
    settings: settings,
  );

case Routes.accessibilityRoom:
  return MaterialPageRoute(
    builder: (_) => const AccessibilityRoomPage(),
    settings: settings,
  );

case Routes.accessibilityLinks:
  return MaterialPageRoute(
    builder: (_) => const AccessibilityLinksPage(),
    settings: settings,
  );

case Routes.accessibilityTools:
  return MaterialPageRoute(
    builder: (_) => const AccessibilityToolsPage(),
    settings: settings,
  );

case Routes.accessibilitySuggestions:
  return MaterialPageRoute(
    builder: (_) => const AccessibilitySuggestionsPage(),
    settings: settings,
  );

case Routes.accessibilityCommunityTools:
  return MaterialPageRoute(
    builder: (_) => const AccessibilityCommunityToolsPage(),
    settings: settings,
  );

case Routes.accessibilityCheckin:
  return MaterialPageRoute(
    builder: (_) => const AccessibilityCheckinPage(),
    settings: settings,
  );

case Routes.accessibilityMessageOfDay:
  return MaterialPageRoute(
    builder: (_) => const AccessibilityMessageOfDayPage(),
    settings: settings,
  );
```

## Route Map

| Path | Screen |
|---|---|
| `/client/room` | `ClientRoomPage` |
| `/accessibility/room` | `AccessibilityRoomPage` |
| `/accessibility/links` | `AccessibilityLinksPage` |
| `/accessibility/tools` | `AccessibilityToolsPage` |
| `/accessibility/suggestions` | `AccessibilitySuggestionsPage` |
| `/accessibility/community-tools` | `AccessibilityCommunityToolsPage` |
| `/accessibility/checkin` | `AccessibilityCheckinPage` |
| `/accessibility/message-of-the-day` | `AccessibilityMessageOfDayPage` |
| `/residential/exit-social-links` | `ResidentialExitSocialPortalPage` |

FINAL STATUS: RESIDENTIAL_ROUTES_SNAPSHOTTED
