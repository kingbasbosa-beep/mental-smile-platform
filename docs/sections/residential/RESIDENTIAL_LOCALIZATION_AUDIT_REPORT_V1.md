# Residential Localization Audit Report V1

Operation ID: OP-RESIDENTIAL-LOCALIZATION-REGISTRY-BLOCK-V1  
Date: 2026-06-23  
Mode: Documentation and registry creation only

## Scope

Reviewed visible and accessibility-facing text in:

- Client Room
- Accessibility Room
- Accessibility Tools
- Accessibility Links
- Accessibility Suggestions
- Accessibility Check-In
- Accessibility Community Tools
- Accessibility Message of the Day
- Quick Access links dialogs
- Notebook dialogs and motivational messages

## Executive Findings

Residential is currently Arabic-first and primarily hardcoded in Dart. Original English product and organization names appear beside Arabic labels in the tools and important-links pages, but there is no complete Arabic/English runtime localization binding for Residential.

The new registry defines an English counterpart for every registered Arabic entry without changing runtime.

## Counts

| Metric | Count |
|---|---:|
| Localization entries | 161 |
| Duplicate label groups | 12 |
| Missing Arabic values in registry | 0 |
| Missing English values in registry | 0 |
| Entries without an active English runtime value | 133 |
| Hardcoded runtime entries | 156 |
| Future reserved accessibility labels | 5 |
| Naming/spelling issue groups | 8 |

## Duplicate Labels

Repeated label groups include:

1. طمّنا عليك
2. تطبيقات وأدوات
3. مقترحاتكم ستظهر قريبًا هنا
4. شاركنا باقتراح / شارك باقتراح
5. ساعدنا في تطوير الأدوات والخدمات
6. أدواتك
7. لينكاتك
8. بوابة الروابط المهمة
9. بوابة الأدوات المساعدة
10. رسالة اليوم
11. حسنًا
12. قريبًا: نطق المسمى

Duplication currently exists as repeated string literals rather than shared localization IDs.

## Hardcoded Labels

Hardcoded text is present in all reviewed runtime files. Static lists hold:

- card titles and subtitles;
- tool categories and tool descriptions;
- organization and external-link descriptions;
- dialog headings and messages;
- field labels and hints;
- motivational sentences;
- tooltips, semantic labels, and speaker snackbars.

No ARB-backed or generated localization lookup was confirmed in the reviewed Residential files.

## Missing Runtime English

The registry now contains English values, but 133 entries have no active English presentation path in runtime.

English currently visible in runtime is mainly:

- original tool names;
- organization names;
- `Website / App / YouTube / Article`;
- abbreviations such as NA and AA.

These do not constitute a complete English localization.

## Naming And Spelling Issues

1. `لينكاتك` is informal while the subtitle and other pages use `روابط`.
2. `نوته`, `نوتة`, and mojibake-rendered variants appear across notebook text.
3. `شارك باقتراح` and `شاركنا باقتراح` are both used.
4. `إمكانية وصول` and `إمكانية الوصول` are both used.
5. `عالمي` is used as a section title where `عالميًا` or `موارد عالمية` may be clearer.
6. Singular and plural voice are mixed in the suggestion success message.
7. Quick Access uses a dynamic speaker message while most pages use the generic speaker message.
8. Colloquial Egyptian Arabic and Modern Standard Arabic are mixed without an explicit tone rule.

No runtime wording was changed in this operation.

## Classification Consistency

The shared Tools page now uses function-based categories:

- أدوات دعم بصري
- أدوات دعم صوتي
- أدوات تواصل
- أدوات قراءة
- أدوات كتابة
- أدوات مساعدة يومية

Some external entity names and Quick Access link labels still contain person-based terms. These were recorded because they are active visible labels or official organization/service descriptions. No automatic renaming was performed.

## Accessibility Label Findings

- Speaker tooltips are widely present.
- A common speaker placeholder is duplicated across files.
- Semantic labels are present on newer Quick Access controls but are not universal across all Residential images and buttons.
- Visual markers are embedded directly in text strings, which complicates translation and screen-reader control.
- Several image widgets rely on visual context without a registry-backed semantic description.

## Unused And Future Labels

No runtime label was marked unused without implementation evidence.

Five labels are registered as future-reserved because the interface needs a stable bilingual value but the active widgets do not consistently expose it:

- Quick Access Room title
- Accessibility Room title
- external-link semantic label
- speaker semantic label
- illustrative-image semantic label

## Files Created

- `docs/sections/residential/RESIDENTIAL_LOCALIZATION_REGISTRY_V1.md`
- `docs/sections/residential/RESIDENTIAL_LOCALIZATION_AUDIT_REPORT_V1.md`

## Files Updated

- `docs/sections/residential/RESIDENTIAL_ARCHIVE_INDEX_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_REGISTRY_V1.md`
- `docs/constitutional-baseline/operations/EXECUTED_OPERATIONS_INDEX_V1.md`

## Safety

- Runtime modified: NO
- Routes modified: NO
- Firebase modified: NO
- Firestore modified: NO
- Storage modified: NO
- Labels renamed in runtime: NO
- Localization implementation added: NO

## Final Report

Localization Entries Count: 161

Duplicate Entries: 12 groups

Missing Arabic Entries: 0

Missing English Entries: 0 in registry; 133 not active in runtime

Hardcoded Entries: 156

Naming Issues: 8 groups

Registry Created: YES

Registry Updated: YES

Operations Registry Updated: YES

Operations Index Updated: YES

Final Verdict: RESIDENTIAL_LOCALIZATION_REGISTRY_COMPLETED
