# Quick Access Links Card V1

Operation ID: OP-QUICK-ACCESS-LINKS-CARD-COMPLETION-V1
Date: 2026-06-23
Section: Residential
Surface: Quick Access Room
Route: `/client/room`

## Card Identity

- Card name: لينكاتك
- Card type: Fixed Quick Access wall card
- Navigation type: Local categorized dialog
- New route required: no
- Persistence: none
- Firebase dependency: none

## Purpose

The card organizes useful external resources into five categories so the visitor does not need to scan one long link list.

Flow:

```text
لينكاتك
-> choose one of five categories
-> view links for that category
-> open selected link externally
```

## Categories

1. 🏥 الدعم والعلاج
2. 👨‍👩‍👧‍👦 الأسرة والعلاقات
3. 🌱 التعافي والإدمان
4. 📚 التعلم والتطوير
5. ♿ إمكانية الوصول

## Content

### الدعم والعلاج

- وزارة الصحة والسكان
- الأمانة العامة للصحة النفسية
- دليل العلاج الحر
- الشكاوى الحكومية
- التأمين الصحي

### الأسرة والعلاقات

- الإرشاد الأسري
- دعم الوالدين
- حماية الطفل

### التعافي والإدمان

- NA
- AA
- Al-Anon
- Nar-Anon
- مواد التعافي

### التعلم والتطوير

- مهارات الحياة
- إدارة الوقت
- العادات
- التعلم

### إمكانية الوصول

- دعم الأشخاص ذوي الإعاقة
- جمعيات الصم والمكفوفين
- قارئ الشاشة NVDA
- تحويل النص إلى صوت

## Interaction Rules

- Links open externally.
- No embedded browser or WebView.
- No click history.
- No saved links.
- No visitor profile.
- No Firebase, Firestore, Storage, or analytics.
- No route was added.

## Accessibility Markers

Every category and link includes:

- visual marker;
- clear Arabic label;
- speaker placeholder;
- semantic external-open action.

Speaker behavior remains placeholder-only.

## Status

Card Status: ACTIVE

Final Verdict: QUICK_ACCESS_LINKS_CARD_COMPLETED
