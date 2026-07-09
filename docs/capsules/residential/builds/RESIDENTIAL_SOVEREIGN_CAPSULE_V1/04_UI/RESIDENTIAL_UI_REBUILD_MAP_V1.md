# RESIDENTIAL_UI_REBUILD_MAP_V1

Status: SNAPSHOTTED

## Purpose

Explain the active Residential UI surfaces copied into this capsule.

## UI Surfaces

| Surface | Route | Source | Notes |
|---|---|---|---|
| Client Room | `/client/room` | `client_room_page.dart` | Residential customer room with local image anchor, notebook/feather behavior, audio-support icons, links/tools/cards, and coffee exit. |
| Accessibility Room | `/accessibility/room` | `accessibility_room_page.dart` | Accessibility support room with card navigation, local image anchor, note behavior, and exit. |
| Accessibility Links | `/accessibility/links` | `accessibility_links_page.dart` | Curated discovery links; no diagnosis or endorsement. |
| Accessibility Tools | `/accessibility/tools` | `accessibility_tools_page.dart` | Tool discovery rows; external links only. |
| Accessibility Suggestions | `/accessibility/suggestions` | `accessibility_suggestions_page.dart` | Local UI form leading to external WhatsApp composition. |
| Accessibility Community Tools | `/accessibility/community-tools` | `accessibility_community_tools_page.dart` | Community tools surface. |
| Accessibility Check-in | `/accessibility/checkin` | `accessibility_checkin_page.dart` | Check-in support surface and provider navigation options. |
| Message of the Day | `/accessibility/message-of-the-day` | `accessibility_message_of_day_page.dart` | Random/local message surface. |
| Residential Exit Portal | `/residential/exit-social-links` | `residential_exit_social_portal_page.dart` | Warm exit page back to splash. |

## Audio / Headphone Behavior

The shared `AccessibilityGuideIcon` is copied. It opens an image/guide-style visual support surface and does not add TTS or audio playback.

## Image Anchor Behavior

The active room pages use local image picker state only. The capsule contains no uploaded user image and no user data.

FINAL STATUS: RESIDENTIAL_UI_REBUILD_MAP_CREATED
