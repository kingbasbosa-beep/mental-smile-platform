# Know Your Right Card System Report V1

Status: IMPLEMENTED_PENDING_MANUAL_VERIFICATION
Date: 2026-07-07
Section: Library / حقك تعرف / Knowledge Cards

## Purpose

Create the first reusable Knowledge Card System for the Mental Smile Library without hardcoding article-specific UI.

## Runtime Additions

- Added a metadata-driven Knowledge Card model.
- Added an asset-backed Knowledge Card repository.
- Added a horizontal rolling carousel page for Knowledge Cards.
- Added four initial cards through `metadata.json` assets.
- Added a full-page Knowledge Article Viewer.
- Added four fixed article tabs:
  - افهم الفكرة
  - مصادر عربية
  - مصادر عالمية
  - المراجع العلمية
- Added Markdown rendering using `flutter_markdown`.
- Added clickable external links through `url_launcher`.
- Added hero image transition from card to article page.
- Added fade transitions between tab panes.
- Added independent tab scroll preservation using stable `PageStorageKey` values.
- Added keyboard carousel navigation through left/right arrow shortcuts.

## Assets Added

- `assets/images/library/know_your_right/cards/why_me_addicted_card.webp`
- `assets/content/library/know_your_right/why_me_addicted/metadata.json`
- `assets/content/library/know_your_right/why_me_addicted/01_answer.md`
- `assets/content/library/know_your_right/why_me_addicted/02_arabic_sources.md`
- `assets/content/library/know_your_right/why_me_addicted/03_english_sources.md`
- `assets/content/library/know_your_right/why_me_addicted/04_global_references.md`
- `assets/content/library/know_your_right/coming_soon_01/metadata.json`
- `assets/content/library/know_your_right/coming_soon_02/metadata.json`
- `assets/content/library/know_your_right/coming_soon_03/metadata.json`

## Runtime Files Added

- `lib/features/library/knowledge_cards/domain/models/knowledge_card.dart`
- `lib/features/library/knowledge_cards/data/knowledge_card_repository.dart`
- `lib/features/library/knowledge_cards/presentation/widgets/knowledge_cards_rolling_carousel.dart`
- `lib/features/library/knowledge_cards/presentation/pages/knowledge_cards_page.dart`
- `lib/features/library/knowledge_cards/presentation/pages/knowledge_article_viewer_page.dart`

## Runtime Files Modified

- `lib/app/router/routes.dart`
- `lib/app/router/app_router.dart`
- `lib/features/library/presentation/pages/library_page.dart`
- `pubspec.yaml`

## Routes Added

- `/web/library/know-your-right/cards`
- `/web/library/know-your-right/article`

## Dependencies Added

- `flutter_markdown`
- `markdown`

## Reusability Result

Future cards require:

- image asset
- content folder
- `metadata.json`
- four Markdown files using the existing tab filenames

No Knowledge Card UI change is required for normal expansion.

## Verification Status

Manual verification is still required because commands were intentionally not run at owner request.

Recommended manual commands:

- `flutter pub get`
- `dart format lib/features/library/knowledge_cards lib/app/router/routes.dart lib/app/router/app_router.dart lib/features/library/presentation/pages/library_page.dart`
- `flutter analyze`

## Final Verdict

KNOW_YOUR_RIGHT_CARD_SYSTEM_IMPLEMENTED_PENDING_MANUAL_VERIFICATION

