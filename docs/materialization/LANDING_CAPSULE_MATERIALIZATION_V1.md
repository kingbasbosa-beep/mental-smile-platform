# Landing Capsule Materialization V1

Operation: LANDING_CAPSULE_MATERIALIZATION_V1

Date: 2026-07-09

## Purpose

Materialize only the existing Flutter landing page from the historical repository into the clean Mental Smile Platform repository.

This is the first runtime materialization of the clean repository.

## Source

Historical repository:

`C:\mental_smile_workspace\app\mental-smile-platform`

Landing source file:

`lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`

Current landing routes:

- `/`
- `/landing-preview`

## Target

Clean repository:

`C:\mental_smile_workspace\repositories\mental-smile-platform-clean`

## Imported

### Flutter Runtime Shell

- `pubspec.yaml`
- `web/index.html`
- `web/favicon.png`
- `web/manifest.json`
- `web/icons/`
- `lib/main.dart`
- `lib/app/app.dart`
- `lib/app/locale_provider.dart`
- `lib/app/router/routes.dart`

### Landing Page Runtime

- `lib/features/commercial_v2_web/presentation/pages/commercial_v2_web_showcase_page.dart`
- `lib/features/commercial_v2_web/presentation/widgets/commercial_v2_web_background.dart`

### Presentation Viewer Dependency

The landing currently uses the presentation carousel/viewer, so the minimum presentation viewer runtime was imported:

- `lib/features/presentation_gallery/data/presentation_gallery_repository.dart`
- `lib/features/presentation_gallery/domain/models/presentation_card.dart`
- `lib/features/presentation_gallery/presentation/pages/presentation_viewer_page.dart`
- `lib/features/presentation_gallery/presentation/widgets/presentation_asset_image.dart`

### Assets

- `assets/branding/web/website_hero_top_v2.png`
- `assets/library/platform_guides/platform_guide_desktop.webp.png`
- `assets/library/platform_guides/platform_guide_mobile.webp.png`
- `assets/library/platform_guides/platform_guide_content_access.webp.png`
- `assets/library/backgrounds/official_links_background.webp.png`
- `assets/presentations/presentation_about_mental_smile.webp.png`
- `assets/presentations/presentation_accessibility_services.webp.png`
- `assets/presentations/presentation_client_services.webp.png`
- `assets/presentations/presentation_specialist_services.webp.png`
- `assets/presentations/presentation_center_services.webp.png`

## Dependencies

### Pubspec Runtime Dependencies

- `flutter`
- `flutter_localizations`
- `cupertino_icons`
- `flutter_riverpod`

### Dev Dependencies

- `flutter_test`
- `flutter_lints`

### Localization

No generated app localization files were imported.

The clean runtime uses Flutter localization delegates and a tiny `localeProvider` because the landing switches Arabic/English internally through local copy classes inside the landing page file.

## Router

Configured routes:

- `/` opens the landing.
- `/landing-preview` opens the same landing.

No additional runtime pages were materialized.

The route constants required by the landing source were kept minimal in `lib/app/router/routes.dart`.

## Excluded

Intentionally not imported:

- Residential
- Library runtime pages
- Official Links page runtime
- Owner
- Monitoring
- Administrative
- Commercial Dashboard
- Firebase runtime
- Firestore
- Authentication runtime
- Legacy Portal
- Old Landing / `public-landing`
- Archive
- Backups
- Capsules
- Emergency Recovery
- Documentation history
- Full `lib/`
- Full `assets/`
- Full `docs/`
- Firebase configuration and rules
- GitHub Pages workflow

## Build Readiness

Status: PENDING OWNER-RUN BUILD

`flutter pub get` was completed before owner requested stopping commands.

`flutter build web --release --base-href /mental-smile-platform/` was not completed because the owner requested stopping commands and will run build manually.

Expected owner commands:

```powershell
cd C:\mental_smile_workspace\repositories\mental-smile-platform-clean
flutter pub get
flutter build web --release --base-href /mental-smile-platform/
```

## Verification Status

- Landing source imported: YES
- Landing route `/` configured: YES
- Landing route `/landing-preview` configured: YES
- Minimum presentation viewer imported: YES
- Firebase imported: NO
- Other modules imported: NO
- Workflow created: NO
- GitHub Pages published: NO
- Build executed to completion: NO, owner will run manually

## Pending

Before GitHub Pages deployment:

1. Owner runs `flutter pub get` if needed.
2. Owner runs `flutter build web --release --base-href /mental-smile-platform/`.
3. If build passes, create a separate GitHub Pages workflow operation.
4. Then publish only through a dedicated deployment operation.

## Final Verdict

LANDING_CAPSULE_MATERIALIZATION_V1_COMPLETED
