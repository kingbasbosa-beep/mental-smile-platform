# Generation 2 Guide Asset Registry V1

Date: 2026-07-06

`pubspec.yaml` includes the whole `assets/branding/guides/` folder, so assets in that folder are bundled without per-file entries.

| Asset Name | Asset Path | Used By Screen | Daleel Assistant Connected | Survey Connected | Exists in pubspec.yaml | File Exists | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `welcome_screen_mobile_guide.png` | `assets/branding/guides/welcome_screen_mobile_guide.png` | Prior mobile welcome work | YES/PREVIOUS | YES/PREVIOUS | YES | YES | PRESENT | Current G2 splash file does not reference it directly. |
| `mobile_login_selection_guide.png` | `assets/branding/guides/mobile_login_selection_guide.png` | Mobile Login Selection | YES | YES | YES | YES | CONNECTED | Uses shared Daleel Assistant. |
| `client_account_selection_mobile_guide.png` | `assets/branding/guides/client_account_selection_mobile_guide.png` | Client Account Selection | YES | YES | YES | YES | CONNECTED | Uses shared Daleel Assistant. |
| `supporters_account_selection_mobile_guide.png` | `assets/branding/guides/supporters_account_selection_mobile_guide.png` | Supporters Account Selection | YES | YES | YES | NO | MISSING_ASSET | Referenced by screen and registry; file not found at scan time. |
| `client_friend_mobile_guide.png` | `assets/branding/guides/client_friend_mobile_guide.png` | Client Friend Mobile Room | YES | YES | YES | YES | CONNECTED | Uses shared Daleel Assistant. |
| `specialist_friend_mobile_guide.png` | `assets/branding/guides/specialist_friend_mobile_guide.png` | Specialist Friend Mobile Room; Premium Friend currently | YES | YES | YES | YES | CONNECTED | Premium room reference needs owner confirmation. |
| `center_friend_mobile_guide.png` | `assets/branding/guides/center_friend_mobile_guide.png` | Center Friend Mobile Room | YES | YES | YES | YES | CONNECTED | Uses shared Daleel Assistant. |
| `specialist_desktop_login_guide.png` | `assets/branding/guides/specialist_desktop_login_guide.png` | Specialist Desktop Login | YES | YES | YES | YES | CONNECTED | Uses shared Daleel Assistant. |
| `center_desktop_login_guide.png` | `assets/branding/guides/center_desktop_login_guide.png` | Center Desktop Login | YES | YES | YES | YES | CONNECTED | Uses shared Daleel Assistant. |
| `commercial_desktop_login.png` | `assets/branding/guides/commercial_desktop_login.png` | Commercial Access | YES | YES | YES | YES | CONNECTED | Daleel appears on wide landscape layout. |
| `center_room_mobile_guide.png` | `assets/branding/guides/center_room_mobile_guide.png` | None observed in G2 room code | NO | NO | YES | YES | UNCONNECTED_ASSET | Candidate cleanup review after testing. |
| `specialist_room_mobile_guide.png` | `assets/branding/guides/specialist_room_mobile_guide.png` | None observed in G2 room code | NO | NO | YES | YES | UNCONNECTED_ASSET | Candidate cleanup review after testing. |
| `client_room_desktop_guide.png` | `assets/branding/guides/client_room_desktop_guide.png` | Desktop client room / legacy scope | UNKNOWN | UNKNOWN | YES | YES | OUT_OF_G2_MOBILE_SCOPE | Keep until owner confirms. |
| `welcome_screen_guide.png` | `assets/branding/guides/welcome_screen_guide.png` | Legacy welcome/splash | YES in legacy splash | YES in legacy splash | YES | YES | LEGACY_CONNECTED | Separate Daleel implementation in `splash_page.dart`. |

