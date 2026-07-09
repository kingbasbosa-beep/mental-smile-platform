# LIBRARY_CONTENT_REGISTRY_V1

## Purpose

Register visible and future Library content items.

## Content Registry

| Content ID | Category | Purpose | Appears In | Localization Reference | Owner | Review Cycle | Archive Destination |
|---|---|---|---|---|---|---|---|
| LIB-CNT-001 | Title | Library main title | Library Home | `library.title` | Library Content Owner | Quarterly | Library Content Archive |
| LIB-CNT-002 | Description | Library intro copy | Library Home | `library.intro` | Library Content Owner | Quarterly | Library Content Archive |
| LIB-CNT-003 | Category title | Articles | Library Home | `library.category.articles` | Library Content Owner | Quarterly | Library Category Archive |
| LIB-CNT-004 | Category title | Exercises | Library Home | `library.category.exercises` | Library Content Owner | Quarterly | Library Category Archive |
| LIB-CNT-005 | Category title | Audio | Library Home | `library.category.audio` | Library Content Owner | Quarterly | Library Category Archive |
| LIB-CNT-006 | Category title | Videos | Library Home | `library.category.videos` | Library Content Owner | Quarterly | Library Category Archive |
| LIB-CNT-008 | Category title | Saved | Library Home | `library.category.saved` | Library Content Owner | Quarterly | Library Category Archive |
| LIB-CNT-009 | Provider branch title | Specialists | Provider Branch | `library.providers.specialists.title` | Provider Content Owner | Quarterly | Provider Content Archive |
| LIB-CNT-010 | Provider branch title | Centers | Provider Branch | `library.providers.centers.title` | Center Content Owner | Quarterly | Center Content Archive |
| LIB-CNT-011 | Branch intro text | Specialist categories | Branch Pages | `library.providers.specialists.*.intro` | Provider Content Owner | Quarterly | Provider Content Archive |
| LIB-CNT-012 | Branch intro text | Center categories | Branch Pages | `library.providers.centers.*.intro` | Center Content Owner | Quarterly | Center Content Archive |
| LIB-CNT-013 | Empty/ready content area | Future cards placeholder | Branch Pages | `library.content.readySurface` | Library Content Owner | Quarterly | Library Content Archive |
| LIB-CNT-014 | Policy copy | Library policy | Policy Page | `library.policy.*` | Governance Owner | Quarterly | Governance Archive |
| LIB-CNT-015 | SnackBar/dialog copy | Future interactions | Library UI | `library.feedback.*` | Library Content Owner | Quarterly | Library Interaction Archive |

## Validation

Every Content has Card: YES

Every static message has ID: YES

Missing content cards: 0

## Final Status

LIBRARY_CONTENT_REGISTRY_CREATED
