# COMMERCIAL_V2_IMAGE_AND_STYLE_SOURCE_OF_TRUTH_FIX_REPORT_V1

Operation ID: OP-COMMERCIAL-V2-IMAGE-AND-STYLE-SOURCE-OF-TRUTH-FIX-V1

Date: 2026-06-26

Status: FIXED_PENDING_MANUAL_VERIFICATION

## Mission

Fix Commercial V2 image and style source-of-truth failures without changing Storage rules, Firebase rules, Firestore rules, routes, UI design, Archive, or Marketing.

## Runtime File

`lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart`

## saveDraft Image Preservation

Patched `_CommercialV2Store.saveDraft`.

Before, empty payload image fields could overwrite valid root image fields. After, existing draft/root/live image fallback is resolved through `_profileMapWithIdentityFallback`; empty incoming `profileImageUrl` or `logoImageUrl` preserves the existing value, and root image fields are updated only when incoming payload has a non-empty URL.

## Single Image Fallback

Existing fallback function retained:

`_profileMapWithIdentityFallback`

Confirmed/applied for owner load, preview, public profile, official PDF generation payload, and CV/PDF image loader input through resolved payload.

## _generatePdfProfile Patch

Official generated PDF now builds payload through:

`_profileMapWithIdentityFallback(_mapValue(data['liveProfile']), data)`

instead of raw `liveProfile`.

## Style Template Logic

`_commercialV2GeneratedCvTemplate` no longer returns `medical_white` for all inputs.

- empty style: `medical_white_default`
- medical/white hints: `medical_white`
- pharaonic / فرعوني / gold / black hints: `pharaonic_gold_documented_pending_template`
- other styles: `style_instruction_documented_pending_template`

Only Medical White renderer currently exists. Unsupported style intent is now documented instead of silently forced.

## Duplicate Image Flow Review

Registration image flow is optional, writes via `_CommercialV2Store.updateIdentityImageUrl`, and is active for first identity selection.

Owner page image flow is optional, writes through `_CommercialV2Store.saveDraft`, and remains active for later identity media updates.

No duplicate flow was removed in this operation.

## Bug Status

CV2-BUG-001: `FIXED_PENDING_MANUAL_VERIFICATION`

CV2-BUG-005: `DOCUMENTED_PENDING_TEMPLATE_EXPANSION`

## Manual Test Checklist

Owner will run:

```powershell
dart format lib/features/commercial_v2/presentation/pages/commercial_v2_profile_engine_page.dart
flutter analyze
```

Then verify repeated draft saves do not erase image URLs, Preview/PDF use fallback image mapping, and style instruction `فرعوني` is not silently reported as `medical_white`.

## Strict Limits Confirmation

Storage rules changed: NO

Firestore rules changed: NO

Firebase config changed: NO

New storage paths created: NO

Old image flows deleted: NO

Routes changed: NO

UI redesigned: NO

Marketing integration created: NO

Archive integration created: NO

## Final Verdict

COMMERCIAL_V2_IMAGE_AND_STYLE_SOURCE_OF_TRUTH_FIX_COMPLETED

