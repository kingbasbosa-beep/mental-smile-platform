# Administrative Localization Inventory V1

Operation ID: OP-ADMINISTRATIVE-OPERATIONAL-FORENSIC-INVENTORY-V1  
Date: 2026-06-25

## Localization Files

| File | Usage References |
|---|---|
| `lib/l10n/app_localizations.dart` | Imported by `lib/app/router/app_router.dart` for route-not-found text. |
| `lib/l10n/app_ar.arb` | Project localization source file. Administrative-specific keys were not directly identified by this inventory operation. |
| `lib/l10n/app_en.arb` | Project localization source file. Administrative-specific keys were not directly identified by this inventory operation. |

## Visible Text Locations

| Runtime Area | File Path | Localization Usage |
|---|---|---|
| Support Room | `lib/features/s_support_room/presentation/pages/s_support_room_page.dart` | Visible labels are hardcoded English strings in the page file. |
| Registry Room | `lib/features/s_registry_room/presentation/pages/s_registry_room_page.dart` | Visible labels are hardcoded English strings in the page file. |
| Declaration Review Room | `lib/features/s_declaration_review_room/presentation/pages/s_declaration_review_room_page.dart` | Visible labels are hardcoded English strings in the page file. |
| Owner District | `lib/features/s_owner/presentation/pages/s_owner_district_page.dart` | Visible labels are hardcoded English strings in the page file. |
| Sovereign Construction Workbench | `lib/features/sovereign_construction/presentation/pages/sovereign_construction_workbench_page.dart` | Uses runtime locale check and hardcoded English/Arabic strings in the page/registry files. |
| Chat Escalations | `lib/features/safety/presentation/pages/chat_escalations_page.dart` | Visible labels are hardcoded English strings in the page file. |
| Chat Escalation Report | `lib/features/chat/presentation/pages/chat_escalation_report_page.dart` | Visible labels are hardcoded Arabic strings in the page file. |
| Router access unavailable state | `lib/app/router/app_router.dart` | Uses hardcoded English/Arabic fallback strings plus `AppLocalizations.routeNotFound` in some not-found cases. |

## Localization Keys Observed By Direct Administrative Route Usage

| Key / Accessor | File Path | Usage |
|---|---|---|
| `AppLocalizations.of(context)!.routeNotFound` | `lib/app/router/app_router.dart` | Used for route-not-found fallback screens. |
