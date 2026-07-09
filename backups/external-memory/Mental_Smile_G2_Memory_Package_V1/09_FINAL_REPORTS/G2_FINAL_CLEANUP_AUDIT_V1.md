# Generation 2 Final Cleanup Audit V1

Date: 2026-07-06

Cleanup audit only. No files were deleted by this task.

| Item | Finding | Evidence | Recommendation | Classification |
| --- | --- | --- | --- | --- |
| Missing supporters guide asset | `supporters_account_selection_mobile_guide.png` is referenced but not found | `assets/branding/guides/` scan | Add the PNG before final guide visual testing | SAFE_TO_FIX_NOW |
| Unconnected center room mobile guide | `center_room_mobile_guide.png` exists but G2 center room uses `center_friend_mobile_guide.png` | Asset registry/code scan | Confirm if old asset, alternate asset, or future asset | NEEDS_OWNER_DECISION |
| Unconnected specialist room mobile guide | `specialist_room_mobile_guide.png` exists but G2 specialist room uses `specialist_friend_mobile_guide.png` | Asset registry/code scan | Confirm if old asset, alternate asset, or future asset | NEEDS_OWNER_DECISION |
| Premium Friend guide image | Premium Friend room currently uses `specialist_friend_mobile_guide.png` | `generation2_mobile_client_room_page.dart` | Confirm intended guide asset name | NEEDS_OWNER_DECISION |
| Client/supporter selection no named route | Screens are opened by `MaterialPageRoute` | `generation2_mobile_selection_pages.dart` | Keep if intended; add named routes only if deep linking required | DEFER_AFTER_TESTING |
| `generation2MobileLiteClient` active route | `/g2/mobile/client` route remains | `routes.dart`, `app_router.dart` | Keep until final testing confirms not needed | DEFER_AFTER_TESTING |
| Legacy splash Daleel duplicate system | `features/splash/presentation/pages/splash_page.dart` has separate Daleel classes | Code scan | Do not merge before testing; document divergence | DEFER_AFTER_TESTING |
| Mixed hardcoded AR/EN strings | Several G2/commercial screens have hardcoded labels | Code scan | Localization pass after runtime stabilization | DEFER_AFTER_TESTING |
| G2 signals governance only | No dedicated G2 emitter found | Signal registry scan | Implement only after owner approves signal runtime design | DO_NOT_TOUCH |
| Firebase/auth changes | No change required for this docs task | Request scope | Do not touch before auth test window | DO_NOT_TOUCH |
| Analyzer warnings/build issues | Verification pending at creation time | `G2_FINAL_VERIFICATION_REPORT_V1.md` | Update after commands complete | NEEDS_OWNER_DECISION |
| Dirty worktree | `git status` expected to show many unrelated changes | Prior status observed | Do not revert unrelated changes | DO_NOT_TOUCH |

