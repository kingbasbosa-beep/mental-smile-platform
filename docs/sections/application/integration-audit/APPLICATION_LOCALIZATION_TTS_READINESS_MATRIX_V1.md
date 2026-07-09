# APPLICATION_LOCALIZATION_TTS_READINESS_MATRIX_V1

Status: COMPLETED

Primary Reference: `docs/sections/application/APPLICATION_LOCALIZATION_TTS_READINESS_AUDIT_V1.md`

Existing Verdict: APPLICATION_LOCALIZATION_TTS_READINESS_PARTIAL

## Matrix

| Key | Arabic Text | English Text | Section | Screen | Card / Widget | Audio Required | Visual Icon Required | TTS Ready | Missing Item | Priority |
|---|---|---|---|---|---|---|---|---|---|---|
| `application.splash.quick_access` | الوصول السريع | Quick Access | Application | Splash | Primary button | YES | YES | PARTIAL | Runtime key wiring / encoding check | Critical before runtime |
| `application.splash.accessibility_access` | وصول إمكانية الاستخدام | Accessibility Access | Application | Splash | Primary button | YES | YES | PARTIAL | Runtime key wiring / encoding check | Critical before runtime |
| `application.splash.commercial_access` | دخول مقدم الخدمة / المركز / المالك | Provider / Center / Owner Access | Application | Splash | Secondary button | YES | YES | PARTIAL | Runtime key wiring / encoding check | High before release |
| `application.splash.official_website` | الموقع الرسمي | Official Website | Application | Splash | Secondary button | YES | YES | PARTIAL | Runtime key wiring / encoding check | High before release |
| `application.client.checkin` | طمنا عليك | Check in | Application / Client | Client Room | Wall card | YES | YES | PARTIAL | Hardcoded, no real TTS | Critical before runtime |
| `application.client.community_tools` | تطبيقات وأدوات | Apps and tools | Application / Client | Client Room | Wall card | YES | YES | PARTIAL | Hardcoded, no real TTS | High before release |
| `application.client.suggestion` | شاركنا باقتراح | Share a suggestion | Application / Client | Client Room | Wall card | YES | YES | PARTIAL | Hardcoded, no signal | Critical before runtime |
| `application.client.tools` | أدواتك | Your tools | Application / Client | Client Room | Wall card | YES | YES | PARTIAL | Hardcoded | Medium before scale |
| `application.client.links` | لينكاتك | Your links | Application / Client | Client Room | Wall card | YES | YES | PARTIAL | Hardcoded | Medium before scale |
| `application.client.feather` | اختر جملة للنوتة | Choose notebook sentence | Application / Client | Client Room | Feather tool | YES | YES | PARTIAL | Hardcoded, local only | Medium before scale |
| `application.client.exit` | الخروج من الغرفة | Exit room | Application / Client | Client Room | Exit cup | YES | YES | PARTIAL | Hardcoded, no exit signal | Critical before runtime |
| `application.accessibility.links` | بوابة الروابط المهمة | Important links gateway | Application / Accessibility | Accessibility Links | Page title | YES | YES | PARTIAL | Hardcoded/mojibake risk | Critical before runtime |
| `application.accessibility.tools` | بوابة الأدوات المساعدة | Assistive tools gateway | Application / Accessibility | Accessibility Tools | Page title | YES | YES | PARTIAL | Hardcoded/mojibake risk | Critical before runtime |
| `application.accessibility.suggestions` | شارك باقتراح | Share a suggestion | Application / Accessibility | Suggestions Page | Page title/form | YES | YES | PARTIAL | WhatsApp-only, hardcoded | Critical before runtime |
| `application.exit.message_title` | رحلتك تهمنا | Your journey matters | Application / Residential Exit | Exit Portal | Message title | YES | YES | PARTIAL | Hardcoded/mojibake risk | High before release |
| `application.exit.button` | خروج | Exit | Application / Residential Exit | Exit Portal | Exit button | YES | YES | PARTIAL | Hardcoded/no signal | Critical before runtime |

## Critical Finding

Runtime source inspection shows many Arabic strings appear as mojibake in the inspected Dart files.

This blocks reliable localization and future TTS until source encoding/key wiring is repaired.

Final Status: APPLICATION_LOCALIZATION_TTS_READINESS_MATRIX_COMPLETED
