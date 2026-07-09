# Knowledge Card Architecture V1

Status: ACTIVE_ARCHITECTURE
Date: 2026-07-07
Owner: Library / Knowledge District

## Architecture Goal

The Knowledge Card system is a reusable metadata-first engine for educational cards inside the Mental Smile Library.

It separates:

- card metadata
- article content
- visual carousel UI
- article viewing UI
- navigation
- rendering

## Model

Runtime model:

- `KnowledgeCard`

Fields:

- `id`
- `title`
- `imagePath`
- `folderName`
- `enabled`
- `future`
- `tags`
- `estimatedReadMinutes`
- `difficulty`

## Metadata Contract

Each card folder owns a `metadata.json` file:

```json
{
  "id": "why_me_addicted",
  "title": "ليه أنا أدمنت وإشمعنى أنا وغيري لا",
  "image": "why_me_addicted_card.webp",
  "folderName": "why_me_addicted",
  "enabled": true,
  "future": false,
  "tags": ["إدمان", "تعافي", "علم النفس", "الصدمات"],
  "readingMinutes": 12,
  "difficulty": "Beginner"
}
```

## Content Contract

Each enabled card folder should contain:

- `metadata.json`
- `01_answer.md`
- `02_arabic_sources.md`
- `03_english_sources.md`
- `04_global_references.md`

## Repository

Runtime repository:

- `AssetKnowledgeCardRepository`

Responsibilities:

- discover `metadata.json` assets from the Flutter asset manifest
- parse card metadata
- build image paths from metadata
- load Markdown content per tab
- provide card lookup by id for direct routes

## UI Layers

Carousel:

- `KnowledgeCardsPage`
- `KnowledgeCardsRollingCarousel`
- `KnowledgeCarouselControls`

Article viewer:

- `KnowledgeArticleViewerPage`

Markdown:

- `flutter_markdown`
- GitHub-flavored extension set
- selectable text
- link callback through `url_launcher`
- asset and remote image support
- table, code, quote, header, list, bold, italic, divider support

## Navigation

Routes:

- `/web/library/know-your-right/cards`
- `/web/library/know-your-right/article`

Primary flow:

Library -> حقك تعرف -> Knowledge Cards -> Knowledge Article Viewer

## Accessibility

Supported:

- RTL shell
- semantic button labels for cards
- selectable article text
- external link activation
- large readable typography
- keyboard carousel navigation
- visible focus-compatible Material controls
- non-dialog full-page article viewer

## Scaling Policy

For hundreds or thousands of cards:

- UI remains unchanged.
- Metadata expansion drives discovery.
- Card folder naming remains stable.
- Search/filter/recommendation can be added above repository output.
- Popularity/reading analytics can be layered later without changing the article viewer.

## Boundaries

This implementation does not add:

- Firebase
- Firestore
- backend
- user storage
- analytics
- personalized recommendations
- medical diagnosis or treatment behavior

## Final Verdict

KNOWLEDGE_CARD_ARCHITECTURE_READY_FOR_MANUAL_VERIFICATION

