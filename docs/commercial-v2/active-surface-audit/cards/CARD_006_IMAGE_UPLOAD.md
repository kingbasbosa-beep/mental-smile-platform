# CARD 006 Image Upload

| Field | Value |
|---|---|
| Card ID | CARD 006 |
| Card Name | Image Upload |
| Purpose | Upload profile photo or logo for Commercial V2 identity media. |
| Current Behavior | Main image selection moved to optional registration step. Owner profile image editing remains available but is non-blocking and does not gate profile creation, preview, CV generation, or submit. |
| Expected Behavior | Uploaded image should appear consistently in profile, CV, business card, promo post, and archive/marketing packages. |
| Inputs | Gallery image. |
| Outputs | Storage object; download URL; `profileImageUrl` or `logoImageUrl`. |
| Dependencies | ImagePicker; local `Uint8List` preview bytes; Firebase Storage; Firestore; `_CommercialV2IdentityImage`. |
| Signals | None found. |
| Storage | New uploads: `commercial_v2_public_identity/{uid}/profile_photo`; `commercial_v2_public_identity/{uid}/logo`. Legacy fallback URLs may still reference `commercial_v2_identity`. |
| Collections | `commercial_v2_profiles/{uid}`. |
| Known Issues | Image loading may still fail, but saveDraft no longer destroys existing root/draft identity image URLs with empty payload values. |
| Required Changes | Verify repeated draft saves preserve `profileImageUrl` and `logoImageUrl`. |
| Status | FIXED_PENDING_MANUAL_VERIFICATION |
## 2026-06-26 Update

Operation:

OP-COMMERCIAL-V2-IMAGE-UPLOAD-REMOVAL-AND-AI-GENERATION-HANDOFF-V1

Image upload is no longer an active Commercial V2 runtime requirement.

Current behavior:

- Registration does not upload image/logo.
- Owner profile editing does not require image/logo.
- Preview does not depend on Firebase image URL.
- CV/PDF does not load Firebase Storage or HTTP images.
- Business card and promo post use initials/brand placeholder fallback.

Future rule:

Image/logo may be supplied later as an optional external visual input during AI generation, design, or publication.

Status:

RESOLVED_BY_REMOVING_IMAGE_DEPENDENCY_PENDING_MANUAL_VERIFICATION
