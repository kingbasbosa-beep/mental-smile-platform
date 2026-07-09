# Know Your Right Pre-Freeze Governance Sync V1

Status: ACTIVE_GOVERNANCE_SYNC
Domain: Library / Know Your Right / Knowledge Cards
Runtime effect: none
Date: 2026-07-07

## Current Runtime State

Know Your Right is a reusable metadata-driven knowledge card system. It contains a rolling horizontal carousel, an enabled first article, three coming-soon metadata cards, and a full-page article viewer.

## Active Routes

| Route | Purpose |
| --- | --- |
| `/web/library/know-your-right/cards` | Knowledge Cards carousel |
| `/web/library/know-your-right/article` | Knowledge Article Viewer |

## Content Contract

Each future card is governed by:

- `metadata.json`
- `01_answer.md`
- `02_arabic_sources.md`
- `03_english_sources.md`
- `04_global_references.md`
- Card image asset

## Article UI Decision

The article page no longer duplicates the cover image, title, subtitle, or reading-time badge. The page starts with the back button and four navigation buttons, then text content only.

## Markdown Contract

Markdown supports RTL Arabic reading, headers, lists, bold, italic, horizontal dividers, selectable text, links, images, tables, code, quotes, and future expandable block support.

## Expansion Rule

Future cards require adding assets, a content folder, and metadata. UI must not be hardcoded per article.
