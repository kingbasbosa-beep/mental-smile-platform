# Entry/Auth YAML Asset Cards V1

Operation: OP-ENTRY-AUTH-CONTENT-CARDS-CONFIG-ALIGNMENT-V1
Date: 2026-06-23

| Card ID | Asset path | Used by Splash/Login? | Used by Entry/Auth destination? | Required? | Extra? | ARCHIVE_ONLY? | Missing? | Status | Evidence |
|---|---|---|---|---|---|---|---|---|---|
| EA-YAML-001 | `assets/branding/splash/` | Yes | No | Yes | No | No | No | ACTIVE | Splash selects mobile/tablet/web images from this folder |
| EA-YAML-002 | `assets/branding/login/` | No active Entry/Auth path | No | No for active Entry/Auth | No | No | No | ARCHIVE_ONLY | `/login` is archived by Unified Start migration |
| EA-YAML-003 | `assets/branding/language/` | Yes | No | Yes | No | No | No | ACTIVE | Splash language toggle uses `assets/branding/language/en_gold.png` |
| EA-YAML-004 | `assets/branding/commercial_v2/` | No | Yes | Yes for Commercial V2 start destination | No | No | No | ACTIVE | Commercial V2 start uses logo assets from this folder; pubspec includes the folder |

## YAML Alignment Summary

- Missing Entry/Auth asset entries found: 0
- Extra Entry/Auth YAML entries found: 0
- YAML changed during this operation: NO
