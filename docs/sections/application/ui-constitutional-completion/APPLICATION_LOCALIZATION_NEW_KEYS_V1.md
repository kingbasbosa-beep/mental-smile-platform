# APPLICATION LOCALIZATION NEW KEYS V1

Status: LOCALIZATION REGISTRY UPDATE

Operation ID: OP-G2-UI-WAVE-1-APPLICATION-UI-ACCESSIBILITY-LOCALIZATION-COMPLETION-AUDIT-V1

## Registry Rule

Every key listed here was added to both:

- `lib/l10n/app_ar.arb`
- `lib/l10n/app_en.arb`

## New Keys

| Key | Arabic | English | Section | Screen | Widget | Category | Purpose | Priority |
|---|---|---|---|---|---|---|---|---|
| applicationSplashQuickAccess | الوصول السريع | Quick access | Application | Splash | Primary action | Entry | Client entry action | HIGH |
| applicationSplashAccessibilityAccess | غرفة الإتاحة | Accessibility room | Application | Splash | Primary action | Entry | Accessibility entry action | HIGH |
| applicationSplashCommercialAccess | دخول الأخصائيين والمراكز والإدارة | Specialist, center, and administration access | Application | Splash | Primary action | Entry | Commercial/admin entry action | HIGH |
| applicationSplashOfficialWebsite | الموقع الرسمي | Official website | Application | Splash | Button | External link | Official website action | MEDIUM |
| applicationSplashOfficialWebsiteOpenFailed | تعذر فتح الموقع الرسمي الآن. | The official website could not be opened right now. | Application | Splash | SnackBar | Error | Website failure message | HIGH |
| applicationSplashLanguageEnglish | English | English | Application | Splash | Language toggle | Locale | English language label | LOW |
| applicationSplashLanguageArabic | العربية | Arabic | Application | Splash | Language toggle | Locale | Arabic language label | LOW |
| applicationClientCheckInTitle | طمنّا عليك | Check in with us | Application | Client Room | Card title | Wellbeing | Check-in card | HIGH |
| applicationClientCheckInSubtitle | اطمئنان ودعم | Reassurance and support | Application | Client Room | Card subtitle | Wellbeing | Check-in subtitle | MEDIUM |
| applicationClientCommunityToolsTitle | تطبيقات وأدوات | Apps and tools | Application | Client Room | Card title | Tools | Community tools card | HIGH |
| applicationClientCommunityToolsSubtitle | أدوات بسيطة تساعدك | Simple tools that can help | Application | Client Room | Card subtitle | Tools | Community tools subtitle | MEDIUM |
| applicationClientSuggestionTitle | شاركنا باقتراح | Share a suggestion | Application | Client Room | Card title | Feedback | Suggestion card | HIGH |
| applicationClientSuggestionSubtitle | رأيك يطور التجربة | Your feedback improves the experience | Application | Client Room | Card subtitle | Feedback | Suggestion subtitle | MEDIUM |
| applicationClientToolsTitle | أدواتك | Your tools | Application | Client Room | Card title | Personal tools | Tools card | HIGH |
| applicationClientToolsSubtitle | مساحتك للأدوات الشخصية | Your personal tools space | Application | Client Room | Card subtitle | Personal tools | Tools subtitle | MEDIUM |
| applicationClientLinksTitle | لينكاتك | Your links | Application | Client Room | Card title | Links | Links card | HIGH |
| applicationClientLinksSubtitle | روابط مفيدة في مكان واحد | Useful links in one place | Application | Client Room | Card subtitle | Links | Links subtitle | MEDIUM |
| applicationClientExitRoom | الخروج من الغرفة | Exit the room | Application | Client Room | Exit action | Navigation | Exit semantics | HIGH |
| applicationClientTemporaryPhoto | اختار صورة تحبها | Choose an image you like | Application | Client Room | Computer upload | Personalization | Local photo prompt | MEDIUM |
| applicationClientYoutube | يوتيوب | YouTube | Application | Client Room | Link | External link | YouTube action | LOW |
| applicationClientFeatherNotebook | نوتة الملاحظات | Notes notebook | Application | Client Room | Feather tool | Utility | Notebook label | HIGH |
| applicationAudioSoon | قريبًا: دعم صوتي لهذا العنصر. | Coming soon: audio support for this item. | Application | Shared | SnackBar | Accessibility | Temporary audio support phrase | HIGH |
| applicationAccessibilityListenSupport | استماع أو دعم صوتي | Listening or audio support | Application | Shared | Semantics | Accessibility | Accessibility guide semantic label | HIGH |
| applicationAccessibilityLinksTitle | لينكات مهمة | Important links | Application | Accessibility | Page/card title | Links | Links page title | HIGH |
| applicationAccessibilityToolsTitle | أدوات مساعدة | Assistive tools | Application | Accessibility | Page/card title | Tools | Tools page title | HIGH |
| applicationAccessibilitySuggestionsTitle | شاركنا رأيك | Share your feedback | Application | Accessibility | Page/card title | Feedback | Suggestions page title | HIGH |
| applicationAccessibilitySuggestionsSubmit | إرسال | Send | Application | Accessibility Suggestions | Button | Form | Submit action | HIGH |
| applicationAccessibilitySuggestionsValidation | من فضلك اكتب الرسالة أولًا. | Please write the message first. | Application | Accessibility Suggestions | Validation | Form | Empty message validation | HIGH |
| applicationAccessibilitySuggestionsSuccessTitle | وصلتنا رسالتك | We received your message | Application | Accessibility Suggestions | Dialog/SnackBar | Success | Submission acknowledgement | HIGH |
| applicationExitJourneyTitle | رحلتك تهمنا | Your journey matters | Application | Residential Exit | Title | Exit | Goodbye title | HIGH |
| applicationExitJourneyMessage | خد ما تحتاجه الآن... / والعودة دائمًا مفتوحة لك. | Take what you need now... / The door is always open for you to return. | Application | Residential Exit | Message | Exit | Goodbye message | HIGH |
| applicationExitButton | خروج | Exit | Application | Residential Exit | Button | Exit | Exit action | HIGH |
| applicationReturnButton | عودة | Return | Application | Residential Exit | Button | Navigation | Return action | MEDIUM |

## Remaining Registry Work

- Add ARB metadata comments for every new key in a future localization hardening pass.
- Regenerate `app_localizations*.dart` using Flutter localization generation.
- Replace hardcoded widget text with generated localization getters.

