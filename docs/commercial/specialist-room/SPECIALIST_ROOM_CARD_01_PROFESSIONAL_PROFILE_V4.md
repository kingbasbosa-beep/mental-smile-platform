# Specialist Room Card 01 Professional Profile V4

Operation ID: OP-SPECIALIST-PROFESSIONAL-PROFILE-UI-UPLOAD-REFINEMENT-V1

Status: ACTIVE

Version: V4

Supersedes: `SPECIALIST_ROOM_CARD_01_PROFESSIONAL_PROFILE_V2.md`

Reason for Supersession: Arabic-first UI refinement, section accessibility icons, and real local optional image selection.

Card Name: الملف المهني

Current Route: `/commercial/specialist/professional-profile`

## Current Mission

Collect raw professional information only.

The Specialist Room prepares raw data for the Marketing Department.

It does not generate, design, publish, export, or write to Firebase.

## UI Rule

Primary visible labels are Arabic first.

Secondary English labels may appear smaller under the Arabic label.

## Section Accessibility Rule

Major sections include:

- visual section icon;
- audio/headphone icon.

Applied sections:

- بيانات بطاقة العمل
- الصورة الاختيارية
- الملف المهني
- أماكن النشر
- ملاحظات إضافية

## Image Upload Rule

The page supports optional local image selection using the existing `image_picker` dependency.

Image handling rules:

- selected image preview appears locally;
- selected file state appears locally;
- image can be removed/cleared;
- image is stored only in local page state;
- image is not persisted as permanent provider profile image;
- image is not shown in public library;
- local image state is cleared after successful raw profile action;
- local image state is cleared when leaving the page.

## Architecture Boundaries

- No AI generation.
- No PDF generation.
- No CV generation.
- No publishing logic.
- No Firebase write.
- No Firestore write.
- No Storage write.
- No new package added.

Final Status: SPECIALIST_PROFESSIONAL_PROFILE_UI_UPLOAD_REFINED_ACTIVE
