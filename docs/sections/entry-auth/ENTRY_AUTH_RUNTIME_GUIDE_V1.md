# Entry/Auth Runtime Guide V1

Status: ACTIVE_SECTION_GUIDE

Section: Entry/Auth

Date: 2026-06-23

## Runtime Surfaces

| Surface | Route | File | Purpose | Ownership |
| --- | --- | --- | --- | --- |
| Splash | `/splash` | `lib/features/splash/presentation/pages/splash_page.dart` | public entry surface | Entry/Auth owns |
| Unified Start | `/commercial-v2/start` | `lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart` | provider/center/owner authentication entry | Entry/Auth owns as auth entry |
| Login Archive | `/login` | `lib/features/auth/presentation/pages/login_page.dart` | previous Firebase Auth role gateway | ARCHIVE_ONLY |
| Portal Home | `/` | portal page via router | official website/public route | Entry/Auth documents entry only |
| Client Room | `/client/room` | Client Room page | quick access destination | Entry/Auth documents entry only |
| Accessibility Room | `/accessibility/room` | Accessibility Room page | accessibility access destination | Entry/Auth documents entry only |

## Startup Flow

`MaterialApp.initialRoute` is `Routes.splash`.

Startup flow:

```text
App start
-> /splash
```

## Splash Flow

```text
/splash
-> Quick Access
-> /client/room
```

```text
/splash
-> Accessibility Access
-> /accessibility/room
```

```text
/splash
-> Provider / Center Access
-> /commercial-v2/start
```

Unified Start note:

`/commercial-v2/start` is the official Entry/Auth authentication entry for Provider, Center, and Owner access.

```text
/splash
-> Official Website
-> https://mental-smile-platform.web.app
```

Website note:

Splash opens the verified Firebase-hosted public website externally. It does not route through `/`, Owner, Commercial, or Monitoring runtime.

## Splash Language And Visual Rule

- Arabic is the default display when no saved language preference exists.
- Saved Arabic/English preference remains respected.
- Quick Access and Accessibility Access share the primary gold visual family.
- Provider / Center / Owner Access uses the professional/auth family.
- Official Website uses the public-web family.

## Unified Start Flow

```text
/commercial-v2/start
-> Phone + Password doctrine
-> Login or registration action
-> authentication result
-> handoff to destination section
```

## Login Archive Flow

`/login` is now documented as `ARCHIVE_ONLY` for Entry/Auth. Any remaining runtime references belong to archive review and are not active Entry/Auth ownership.

## Firebase Usage

Unified Start uses Firebase Auth and current Commercial V2 start dependencies. Entry/Auth owns only the authentication entry responsibility.

Profile creation, profile editing, commercial profile management, dashboard logic, provider tools, center tools, and owner tools are outside Entry/Auth.

## Signals

No Entry/Auth signals are currently implemented in Splash or Unified Start.
