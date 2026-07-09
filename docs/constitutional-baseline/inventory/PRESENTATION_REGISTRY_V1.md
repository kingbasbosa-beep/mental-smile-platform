# PRESENTATION_REGISTRY_V1

Status: ACTIVE_REGISTRY
Purpose: Registry of platform presentation posters, posters gallery, and viewer components.
Runtime effect: none

## Presentation Posters

| Poster ID | Title | Asset Path | Owner | Status |
| --- | --- | --- | --- | --- |
| `PRESENTATION-ABOUT-MENTAL-SMILE` | About Mental Smile | `assets/presentations/presentation_about_mental_smile.webp` | Presentation Gallery | ACTIVE |
| `PRESENTATION-ACCESSIBILITY-SERVICES` | Accessibility Services | `assets/presentations/presentation_accessibility_services.webp` | Presentation Gallery | ACTIVE |
| `PRESENTATION-CLIENT-SERVICES` | Client Services | `assets/presentations/presentation_client_services.webp` | Presentation Gallery | ACTIVE |
| `PRESENTATION-SPECIALIST-SERVICES` | Specialist Services | `assets/presentations/presentation_specialist_services.webp` | Presentation Gallery | ACTIVE |
| `PRESENTATION-CENTER-SERVICES` | Center Services | `assets/presentations/presentation_center_services.webp` | Presentation Gallery | ACTIVE |

## Platform Guide Posters

| Guide ID | Asset Path | Owner | Tap Behavior | Status |
| --- | --- | --- | --- | --- |
| `PLATFORM-GUIDE-DESKTOP` | `assets/library/platform_guides/platform_guide_desktop.webp` | Landing / Platform Guides Carousel | Fullscreen image viewer | ACTIVE |
| `PLATFORM-GUIDE-MOBILE` | `assets/library/platform_guides/platform_guide_mobile.webp` | Landing / Platform Guides Carousel | Fullscreen image viewer | ACTIVE |
| `PLATFORM-GUIDE-CONTENT-ACCESS` | `assets/library/platform_guides/platform_guide_content_access.webp` | Landing / Platform Guides Carousel | Fullscreen image viewer | ACTIVE |
| `PLATFORM-OFFICIAL-LINKS` | `assets/library/platform_guides/platform_official_links.webp` | Library / Official Links | Route to `/web/library/official-links` | ACTIVE |

## UI Components

| Component | Route | Purpose |
| --- | --- | --- |
| `PresentationGalleryPage` | `/presentation-gallery` | Rolling carousel of all platform posters. |
| `PresentationViewerPage` | Internal | Full-screen interactive poster viewer. |
| `PlatformGuidesCarousel` | `/landing-preview` | Floating guides carousel for landing hero. |
| `RollingPresentationCarousel` | Shared | Reusable auto-scroll presentation widget. |
| `PlatformGuideImageViewer` | Internal | Fullscreen image viewer behavior for the three non-link platform guide cards. |

## Presentation Assets

- Location: `assets/presentations/`
- Extension: `.webp` with runtime fallback support where imported files use `.webp.png`.
- Governance: Approved for public landing preview showcase and owner review.

## Dependencies

- Routes: `/landing-preview`, `/presentation-gallery`, `/web/library/official-links`.
- Runtime models: presentation list/model repository, image-only platform guide model list.
- UI law: image is the complete card; no captions, badges, logos, overlays, or text outside the image.
