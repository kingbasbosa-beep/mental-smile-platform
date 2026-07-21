# RESIDENTIAL CAPSULE GENESIS TRANSFER PLAN

هذه الخطة تهدف إلى إنشاء كبسولة Residential كاملة ومستقلة داخل مشروع DNA-V2، من خلال نقل كافة مكونات الـ Runtime والأصول المرتبطة بها وتطهيرها من الاعتمادات القديمة.

## User Review Required

> [!IMPORTANT]
> **نطاق الـ Runtime:**
> بناءً على تحليل المشروع المصدر، الـ "Residential Runtime" يشمل:
> 1. بوابة الدخول (Splash, G2 Splash, Login Selection).
> 2. غرفة العميل (Client Room).
> 3. غرفة الوصول (Accessibility Room).
> 4. بوابة الخروج (Exit Social Portal).
> 5. أنظمة الإشارات (Signals) والكلام (Speech) المرتبطة بهم.
> **سأقوم بنقل كافة هذه المكونات لضمان عمل "القسم السكني" بالكامل.**

> [!WARNING]
> **إدارة الاعتمادات (Purification):**
> سأقوم باستبدال كافة استيرادات `package:mental_smile_os/...` بروابط نسبية أو عقود (Contracts) داخل الكبسولة.
> أي مكون خارجي (مثل الـ Router العالمي) سيتم استبداله بـ `ResidentialNavigator`.

## Proposed Changes

### 1. هيكل الكبسولة في DNA-V2

المسار: `capsules/residential/package/`

#### [NEW] ملفات التعريف:
- `CAPSULE_ID.txt`: القيمة `MS-CAPSULE-RES-G-18.07.2026`
- `pubspec.yaml`: تعريف الحزمة مع الاعتمادات الدنيا (Flutter, Riverpod, ImagePicker, etc).
- `lib/mental_smile_residential_capsule.dart`: ملف التصدير الرئيسي.

### 2. العقود (Contracts)
سيتم إنشاء `lib/src/runtime/residential_capsule_contracts.dart` ليحتوي على:
- `ResidentialNavigator`: للتعامل مع التنقل بين الغرف والخروج للمنصة.
- `ResidentialLocaleManager`: لإدارة اللغة.
- `ResidentialAuthContract`: إذا وُجدت اعتمادات على حالة تسجيل الدخول.

### 3. نقل الـ Runtime (تطهير ونسخ)

سأقوم بتنظيم الكود المنقول في الهيكل التالي داخل `lib/src/runtime/`:
- `core/`: (Signals, Speech, Platform Core adapters).
- `features/`:
    - `entry/`: (Splash, Login Selection).
    - `client_room/`: (Client Room Page & Widgets).
    - `accessibility_room/`: (Accessibility Room & Sub-pages).
    - `exit_portal/`: (Residential Exit Portal).
- `l10n/`: (Residential & Accessibility localizations).

### 4. نقل الـ Assets
سيتم نقل الأصول المستخدمة فعلياً فقط إلى `capsules/residential/package/assets/`:
- `assets/branding/rooms/`
- `assets/accessibility/`
- `assets/client/`
- `assets/backgrounds/residential_exit_social_portal.webp.png`

---

## Verification Plan

### Manual Verification
1. التأكد من خلو كافة ملفات الـ Dart من أي Import لـ `mental_smile_os`.
2. التأكد من وجود كافة الصور المطلوبة داخل مجلد الـ assets الخاص بالكبسولة.
3. التحقق من أن `pubspec.yaml` يحتوي على كافة المسارات الصحيحة للأصول.

---

## الترتيب الزمني للتنفيذ

1. **[مرحلة الهيكل]**: إنشاء المجلدات وملفات التعريف (Identity).
2. **[مرحلة الأصول]**: حصر ونسخ الأصول المستخدمة فعلياً.
3. **[مرحلة العقود]**: بناء واجهات التفاعل مع المنصة.
4. **[مرحلة التطهير]**: نقل ملفات الـ Dart وتعديل الـ Imports والروابط.
5. **[مرحلة الاختبار]**: إنشاء مشروع `example` واختبار `integrity`.

> [!NOTE]
> سأقوم بالتنفيذ على مراحل كما طلبت، وسأتوقف بعد كل مرحلة لعرض النتائج.
