# Knowledge Registry V1

Status: ACTIVE_BASELINE_REGISTRY
Classification: PRE_FREEZE_KNOWLEDGE_ARCHITECTURE
Runtime effect: none
Date: 2026-07-07

## Purpose

This registry records governed knowledge surfaces that provide educational or explanatory content in the current platform.

## Active Knowledge Surfaces

| Surface | Domain | Route / Placement | Source | Renderer | Status |
| --- | --- | --- | --- | --- | --- |
| Know Your Right Cards | Library / Knowledge Cards | `/web/library/know-your-right/cards` | `metadata.json` card folders | Rolling image carousel | ACTIVE |
| Knowledge Article Viewer | Library / Knowledge Cards | `/web/library/know-your-right/article` | Four markdown files per article | Markdown text tabs/buttons | ACTIVE |
| Platform Guides Carousel | Landing / Platform Guides | `/landing-preview` | Image assets | Image-only carousel and image viewer | ACTIVE |
| Official Platform Links | Library / Official Links | `/web/library/official-links` | Placeholder URL rows | Clickable link rows | ACTIVE |
| Presentation Gallery | Presentation Gallery | `/presentation-gallery` and landing carousel | Poster image list/model | Image-only carousel and viewer | ACTIVE |

## Separation Rules

- Knowledge Cards use Markdown and metadata.
- Presentation Gallery uses posters only and must not be converted to Markdown.
- Platform Guides are image-only guide cards; only the official links card routes to a link page.
- Official Links rows are placeholders until real URLs are provided by Owner.

## Expansion Rules

- New Knowledge Card: add image, content folder, metadata, and markdown files.
- New Presentation Poster: add asset and presentation list/model entry.
- New Official Link: update placeholder row with verified Owner-approved URL.
