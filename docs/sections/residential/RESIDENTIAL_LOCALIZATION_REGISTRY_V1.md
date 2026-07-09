# Residential Localization Registry V1

Operation ID: OP-RESIDENTIAL-LOCALIZATION-REGISTRY-BLOCK-V1  
Date: 2026-06-23  
Scope: Residential Application Section  
Authority: Residential localization source of truth

## Status Key

- `ACTIVE_HARDCODED_AR`: visible Arabic value exists directly in Dart.
- `ACTIVE_MIXED`: Arabic UI with an original English proper name.
- `REGISTRY_EN_READY`: English value is defined here but is not wired into runtime.
- `SHARED_DUPLICATE`: the same visible value is repeated in several widgets/files.
- `FUTURE_RESERVED`: approved registry value with no active runtime rendering.

## Localization As Audio Source Doctrine

Every visible client-facing word in the Application Section must exist in the Localization Registry before it can become an audio, narration, tooltip, or future TTS source.

Arabic and English are mandatory for:

- UI text
- accessibility labels
- audio labels
- future TTS generation
- voice narration
- tooltips
- button names
- card names
- safety guide labels

No audio generation may use text outside the localization registry.

Visible runtime text should match localization entries before audio/TTS activation.

## Application Safety And Complaint Guidance Entries

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Audio/TTS Readiness | Status | Notes |
|---|---|---|---|---|---|---|---|---|
| app.safety.card.title | إرشادات الأمان والشكاوى | Safety & Complaint Guidance | Application safety guide card | Future Links Card guidance placement | Card Titles | READY | ACTIVE | Guidance only, not complaint runtime |
| app.safety.verify_provider | تحقق من هوية مقدم الخدمة ومستنداته المهنية | Verify provider identity and professional documents | Application safety guide | Safety guide content | Safety Labels | READY | ACTIVE |  |
| app.safety.verify_center | تحقق من هوية المركز وعنوانه | Verify center identity and address | Application safety guide | Safety guide content | Safety Labels | READY | ACTIVE |  |
| app.safety.agree_details | اتفق على تفاصيل الخدمة قبل الدفع أو الحضور | Agree on service details before paying or attending | Application safety guide | Safety guide content | Safety Labels | READY | ACTIVE |  |
| app.safety.written_messages | احتفظ بالاتفاقات المهمة في رسائل مكتوبة | Keep important agreements in written messages | Application safety guide | Safety guide content | Safety Labels | READY | ACTIVE |  |
| app.safety.private_meetings | تجنب المقابلات الخاصة خارج الأماكن المهنية قدر الإمكان | Avoid private meetings outside professional locations when possible | Application safety guide | Safety guide content | Safety Labels | READY | ACTIVE |  |
| app.safety.personal_data | لا تشارك بيانات شخصية غير ضرورية | Do not share unnecessary personal data | Application safety guide | Safety guide content | Safety Labels | READY | ACTIVE |  |
| app.complaint.platform_only | المنصة تتعامل مع مشكلات المنصة فقط | The platform handles platform-related issues only | Application safety guide | Complaint boundary labels | Safety Labels | READY | ACTIVE |  |
| app.complaint.official_links | استخدم الروابط الرسمية للمسائل القانونية أو المهنية | Use official links for legal or professional matters | Application safety guide | Complaint boundary labels | Safety Labels | READY | ACTIVE |  |
| app.complaint.no_investigation | Mental Smile لا تحقق ولا تصدر أحكامًا قانونية | Mental Smile does not investigate or make legal judgments | Application safety guide | Complaint boundary labels | Safety Labels | READY | ACTIVE |  |
| app.links.emergency_police | رابط إرشاد الطوارئ أو الشرطة | Emergency or police guidance link | Official links review | Future official links | Future Reserved Labels | OWNER_REQUIRED | OWNER_REQUIRED | Do not invent link |
| app.links.prosecution_legal | رابط النيابة أو الجهة القانونية | Prosecution or legal authority link | Official links review | Future official links | Future Reserved Labels | OWNER_REQUIRED | OWNER_REQUIRED | Do not invent link |
| app.links.professional_syndicates | روابط النقابات أو الجهات المهنية | Professional syndicates links | Official links review | Future official links | Future Reserved Labels | OWNER_REQUIRED | OWNER_REQUIRED | Do not invent link |

## Room, Card, And Control Labels

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.room.client.title | غرفة الوصول السريع | Quick Access Room | `client_room_page.dart` | Client Room semantics/documentation | Room Titles | FUTURE_RESERVED | No visible room heading today |
| res.room.accessibility.title | غرفة إمكانية الوصول | Accessibility Room | `accessibility_room_page.dart` | Accessibility Room semantics/documentation | Room Titles | FUTURE_RESERVED | No visible room heading today |
| res.card.checkin.title | طمّنا عليك | Check In With Us | both room pages | Check-in wall cards | Card Titles | ACTIVE_HARDCODED_AR | Shared label |
| res.card.checkin.subtitle | مساحة للاطمئنان والدعم | A space for reassurance and support | `client_room_page.dart` | Quick Access check-in card | Card Titles | ACTIVE_HARDCODED_AR | Accessibility card has title only |
| res.card.community_tools.title | تطبيقات وأدوات | Apps and Tools | both room pages | Community tools cards | Card Titles | SHARED_DUPLICATE | Repeated on placeholder page |
| res.card.community_tools.subtitle | مقترحاتكم ستظهر قريبًا هنا | Your suggestions will appear here soon | both room/community page | Community tools card/page | Card Titles | SHARED_DUPLICATE | Same meaning repeated |
| res.card.suggestion.title | شاركنا باقتراح | Share a Suggestion | both room/suggestion page | Suggestion card/page | Card Titles | SHARED_DUPLICATE | Runtime sometimes uses شارك باقتراح |
| res.card.suggestion.subtitle | ساعدنا في تطوير الأدوات والخدمات | Help us improve tools and services | both room/suggestion page | Suggestion card/page | Card Titles | SHARED_DUPLICATE | Exact duplicate |
| res.card.personal_tools.title | أدواتك | Your Tools | `client_room_page.dart` | Quick Access personal tools card/dialog | Card Titles | SHARED_DUPLICATE | Dialog remains informational |
| res.card.personal_tools.subtitle | مساحتك للأدوات الشخصية | Your personal tools space | `client_room_page.dart` | Quick Access personal tools card | Card Titles | ACTIVE_HARDCODED_AR |  |
| res.card.personal_links.title | لينكاتك | Your Links | `client_room_page.dart` | Quick Access links card/dialog | Card Titles | SHARED_DUPLICATE | Informal Egyptian Arabic |
| res.card.personal_links.subtitle | روابطك المفيدة في مكان واحد | Your useful links in one place | `client_room_page.dart` | Quick Access links card | Card Titles | ACTIVE_HARDCODED_AR | Naming issue: لينكاتك vs روابطك |
| res.card.important_links.title | بوابة الروابط المهمة | Important Links Gateway | `accessibility_room_page.dart` | Accessibility links card/page | Card Titles | ACTIVE_HARDCODED_AR |  |
| res.card.important_links.subtitle | مواقع وجهات مساعدة مصرية وعربية وعالمية | Egyptian, Arab, and global support resources | `accessibility_room_page.dart` | Accessibility links card/page | Card Titles | ACTIVE_HARDCODED_AR |  |
| res.card.assistive_tools.title | بوابة الأدوات المساعدة | Assistive Tools Gateway | `accessibility_room_page.dart` | Accessibility tools card/page | Card Titles | ACTIVE_HARDCODED_AR |  |
| res.card.assistive_tools.subtitle | أدوات تساعد في التواصل والقراءة والفهم | Tools for communication, reading, and understanding | `accessibility_room_page.dart` | Accessibility tools card/page | Card Titles | ACTIVE_HARDCODED_AR |  |
| res.control.youtube | قناة Mental Smile | Mental Smile Channel | both room pages | TV control | Button Titles | ACTIVE_HARDCODED_AR | External YouTube |
| res.control.photo.pick | اختر صورة مؤقتة | Choose a Temporary Photo | both room pages | Monitor upload control | Button Titles | ACTIVE_HARDCODED_AR | Session-only |
| res.control.exit | الخروج من الغرفة | Exit the Room | both room pages | Exit cup | Button Titles | ACTIVE_HARDCODED_AR | Returns to Splash |
| res.control.feather | اختر جملة للنوتة | Choose a Notebook Message | `client_room_page.dart` | Feather tool | Tool Titles | ACTIVE_HARDCODED_AR | نوته/نوتة inconsistency exists |
| res.control.message_today | رسالة اليوم | Message of the Day | Accessibility room/message page | Feather tool | Tool Titles | SHARED_DUPLICATE |  |
| res.button.open_link | فتح الرابط | Open Link | links pages/dialogs | External link buttons | Button Titles | SHARED_DUPLICATE |  |
| res.button.open_tool | فتح الأداة | Open Tool | `accessibility_tools_page.dart` | Tool rows | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.button.ok | حسنًا | OK | dialogs | Dialog buttons | SHARED_DUPLICATE | Some source strings use حسنًا variants |
| res.button.back_categories | العودة للتصنيفات | Back to Categories | `client_room_page.dart` | Links category dialog | Button Titles | ACTIVE_HARDCODED_AR |  |

## Quick Access Links Directory

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.links.intro | اختر القسم المناسب بدلًا من البحث وسط قائمة طويلة | Choose a category instead of searching a long list | `client_room_page.dart` | Links dialog | Dialog Titles | ACTIVE_HARDCODED_AR |  |
| res.links.category.health | الدعم والعلاج | Support and Treatment | `client_room_page.dart` | Links category | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.links.category.family | الأسرة والعلاقات | Family and Relationships | `client_room_page.dart` | Links category | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.links.category.recovery | التعافي والإدمان | Recovery and Addiction | `client_room_page.dart` | Links category | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.links.category.learning | التعلم والتطوير | Learning and Development | `client_room_page.dart` | Links category | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.links.category.access | إمكانية الوصول | Accessibility | `client_room_page.dart` | Links category | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.links.health.mohp | وزارة الصحة والسكان | Ministry of Health and Population | `client_room_page.dart` | Health links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.health.mental_health | الأمانة العامة للصحة النفسية | General Secretariat of Mental Health | `client_room_page.dart` | Health links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.health.therapy | دليل العلاج الحر | Therapy Directory | `client_room_page.dart` | Health links | Tool Titles | ACTIVE_HARDCODED_AR | Naming is not an official entity title |
| res.links.health.complaints | الشكاوى الحكومية | Government Complaints | `client_room_page.dart` | Health links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.health.insurance | التأمين الصحي | Health Insurance | `client_room_page.dart` | Health links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.family.guidance | الإرشاد الأسري | Family Guidance | `client_room_page.dart` | Family links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.family.parents | دعم الوالدين | Parenting Support | `client_room_page.dart` | Family links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.family.child | حماية الطفل | Child Protection | `client_room_page.dart` | Family links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.recovery.na | زمالة المدمنين المجهولين | Narcotics Anonymous | `client_room_page.dart` | Recovery links | Tool Titles | ACTIVE_MIXED | Runtime title currently `NA` |
| res.links.recovery.aa | زمالة مدمني الكحول المجهولين | Alcoholics Anonymous | `client_room_page.dart` | Recovery links | Tool Titles | ACTIVE_MIXED | Runtime title currently `AA` |
| res.links.recovery.alanon | دعم أسر مدمني الكحول | Al-Anon | `client_room_page.dart` | Recovery links | Tool Titles | ACTIVE_MIXED |  |
| res.links.recovery.naranon | دعم أسر المتعافين | Nar-Anon | `client_room_page.dart` | Recovery links | Tool Titles | ACTIVE_MIXED |  |
| res.links.recovery.materials | مواد التعافي | Recovery Resources | `client_room_page.dart` | Recovery links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.learning.life_skills | مهارات الحياة | Life Skills | `client_room_page.dart` | Learning links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.learning.time | إدارة الوقت | Time Management | `client_room_page.dart` | Learning links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.learning.habits | العادات | Habits | `client_room_page.dart` | Learning links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.learning.learning | التعلم | Learning | `client_room_page.dart` | Learning links | Tool Titles | ACTIVE_HARDCODED_AR | Generic label |
| res.links.access.support | دعم الأشخاص ذوي الإعاقة | Disability Support | `client_room_page.dart` | Accessibility links | Tool Titles | ACTIVE_HARDCODED_AR | Person-based wording retained in external entity context |
| res.links.access.associations | جمعيات الصم والمكفوفين | Deaf and Blind Associations | `client_room_page.dart` | Accessibility links | Tool Titles | ACTIVE_HARDCODED_AR | Conflicts with function-first naming doctrine |
| res.links.access.nvda | قارئ الشاشة NVDA | NVDA Screen Reader | `client_room_page.dart` | Accessibility links | Tool Titles | ACTIVE_MIXED |  |
| res.links.access.tts | تحويل النص إلى صوت | Text to Speech | `client_room_page.dart` | Accessibility links | Tool Titles | ACTIVE_HARDCODED_AR |  |
| res.links.external.description | رابط خارجي يفتح خارج التطبيق | External link opens outside the app | Links surfaces | Reserved explanatory copy | Accessibility Labels | FUTURE_RESERVED |  |

## Shared Tools Directory

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.tools.page.title | بوابة الأدوات المساعدة | Assistive Tools Gateway | `accessibility_tools_page.dart` | Tools page | Room Titles | ACTIVE_HARDCODED_AR |  |
| res.tools.page.subtitle | أدوات خارجية تساعد في التواصل والقراءة والفهم | External tools for communication, reading, and understanding | `accessibility_tools_page.dart` | Tools page | Room Titles | ACTIVE_HARDCODED_AR |  |
| res.tools.category.visual | أدوات دعم بصري | Visual Support Tools | `accessibility_tools_page.dart` | Tools section | Section Titles | ACTIVE_HARDCODED_AR | Function-based |
| res.tools.category.audio | أدوات دعم صوتي | Audio Support Tools | `accessibility_tools_page.dart` | Tools section | Section Titles | ACTIVE_HARDCODED_AR | Function-based |
| res.tools.category.communication | أدوات تواصل | Communication Tools | `accessibility_tools_page.dart` | Tools section | Section Titles | ACTIVE_HARDCODED_AR | Function-based |
| res.tools.category.reading | أدوات قراءة | Reading Tools | `accessibility_tools_page.dart` | Tools section | Section Titles | ACTIVE_HARDCODED_AR | Function-based |
| res.tools.category.writing | أدوات كتابة | Writing Tools | `accessibility_tools_page.dart` | Tools section | Section Titles | ACTIVE_HARDCODED_AR | Function-based |
| res.tools.category.daily | أدوات مساعدة يومية | Daily Assistance Tools | `accessibility_tools_page.dart` | Tools section | Section Titles | ACTIVE_HARDCODED_AR | Function-based |
| res.tool.chatgpt | شات جي بي تي | ChatGPT | `accessibility_tools_page.dart` | Writing tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.gemini | جيميني | Gemini | `accessibility_tools_page.dart` | Writing tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.copilot | كوبايلوت | Copilot | `accessibility_tools_page.dart` | Writing tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.voice_typing | الكتابة بالصوت | Voice Typing | `accessibility_tools_page.dart` | Writing tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.google_translate | ترجمة جوجل | Google Translate | `accessibility_tools_page.dart` | Communication tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.microsoft_translator | مترجم مايكروسوفت | Microsoft Translator | `accessibility_tools_page.dart` | Communication tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.deepl | ديب إل | DeepL | `accessibility_tools_page.dart` | Communication tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.translator_conversation | محادثة مترجم مايكروسوفت | Microsoft Translator Conversation Mode | `accessibility_tools_page.dart` | Communication tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.seeing_ai | سيينج إيه آي | Seeing AI | `accessibility_tools_page.dart` | Visual support | Tool Titles | ACTIVE_MIXED |  |
| res.tool.lookout | لوك آوت من جوجل | Lookout by Google | `accessibility_tools_page.dart` | Visual support | Tool Titles | ACTIVE_MIXED |  |
| res.tool.live_transcribe | النسخ النصي المباشر | Live Transcribe | `accessibility_tools_page.dart` | Audio support | Tool Titles | ACTIVE_MIXED |  |
| res.tool.youtube_captions | ترجمة يوتيوب النصية | YouTube Captions | `accessibility_tools_page.dart` | Audio support | Tool Titles | ACTIVE_MIXED |  |
| res.tool.read_aloud | القراءة بصوت عال | Read Aloud | `accessibility_tools_page.dart` | Reading tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.immersive_reader | القارئ الشامل | Immersive Reader | `accessibility_tools_page.dart` | Reading tools | Tool Titles | ACTIVE_MIXED |  |
| res.tool.be_my_eyes | كن عيني | Be My Eyes | `accessibility_tools_page.dart` | Daily assistance | Tool Titles | ACTIVE_MIXED |  |

## Accessibility Links Page

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.access_links.title | بوابة الروابط المهمة | Important Links Gateway | `accessibility_links_page.dart` | Links page | Room Titles | ACTIVE_HARDCODED_AR |  |
| res.access_links.subtitle | مواقع وجهات مساعدة مصرية وعربية وعالمية | Egyptian, Arab, and Global Support Resources | `accessibility_links_page.dart` | Links page | Room Titles | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend | دليل العلامات | Icon Guide | `accessibility_links_page.dart` | Legend | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.government | جهة حكومية | Government Entity | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.association | جمعية | Association | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.international | منظمة دولية | International Organization | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.library | مكتبة | Library | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.education | تعليم | Education | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.sign | لغة إشارة | Sign Language | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.visual | دعم بصري | Visual Support | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.access_links.legend.accessibility | إمكانية وصول | Accessibility | `accessibility_links_page.dart` | Legend | Accessibility Labels | ACTIVE_HARDCODED_AR | Missing definite article differs from other labels |
| res.access_links.section.egypt | مصر | Egypt | `accessibility_links_page.dart` | Links section | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.access_links.section.arab | الوطن العربي | Arab Region | `accessibility_links_page.dart` | Links section | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.access_links.section.global | عالمي | Global | `accessibility_links_page.dart` | Links section | Section Titles | ACTIVE_HARDCODED_AR | Adjective used as heading |
| res.access_links.section.knowledge | مكتبات ومصادر معرفة | Libraries and Knowledge Resources | `accessibility_links_page.dart` | Links section | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.access_links.ncpd | المجلس القومي للأشخاص ذوي الإعاقة | National Council for Persons with Disabilities | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED | Official entity name |
| res.access_links.solidarity | وزارة التضامن الاجتماعي | Ministry of Social Solidarity | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.education | وزارة التربية والتعليم | Ministry of Education | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.ekb | بنك المعرفة المصري | Egyptian Knowledge Bank | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.egypt_portal | بوابة الحكومة المصرية | Egypt Government Portal | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.escwa | الإسكوا - الإعاقة والإدماج | UN ESCWA Disability Inclusion | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED | Official topic name |
| res.access_links.alecso | الألكسو | ALECSO | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.kscdr | مركز الملك سلمان لأبحاث الإعاقة | King Salman Center for Disability Research | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.arado | المنظمة العربية للتنمية الإدارية | ARADO | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.who | منظمة الصحة العالمية - الإعاقة | World Health Organization - Disability | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.unicef | اليونيسف - الأطفال ذوو الإعاقة | UNICEF - Children with Disabilities | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.un | الأمم المتحدة - الإعاقة | UN DESA Disability | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.wai | مبادرة الوصول للويب | W3C Web Accessibility Initiative | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.nls | مكتبة الكونغرس لخدمة المكفوفين | National Library Service | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED | Official service name |
| res.access_links.bookshare | بووكشير | Bookshare | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED | Transliteration |
| res.access_links.daisy | اتحاد ديزي | DAISY Consortium | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED |  |
| res.access_links.wbu | الاتحاد العالمي للمكفوفين | World Blind Union | `accessibility_links_page.dart` | Link row | Tool Titles | ACTIVE_MIXED | Official organization name |

## Suggestions, Check-In, And Community

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.suggestion.field.name | اسم الأداة أو الفكرة المقترحة | Suggested Tool or Idea Name | `accessibility_suggestions_page.dart` | Suggestion form | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.suggestion.field.name_hint | مثال: قارئ شاشة عربي | Example: Arabic Screen Reader | `accessibility_suggestions_page.dart` | Suggestion form | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.suggestion.field.reason | سبب الاقتراح | Reason for Suggestion | `accessibility_suggestions_page.dart` | Suggestion form | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.suggestion.field.reason_hint | كيف ستساعد هذه الأداة المستخدمين؟ | How would this tool help users? | `accessibility_suggestions_page.dart` | Suggestion form | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.suggestion.field.link | رابط أو صفحة قد تساعدنا في العثور عليها | A link or page that may help us find it | `accessibility_suggestions_page.dart` | Suggestion form | Accessibility Labels | ACTIVE_HARDCODED_AR | Optional state not visible in label |
| res.suggestion.field.link_hint | Website / App / YouTube / Article | Website / App / YouTube / Article | `accessibility_suggestions_page.dart` | Suggestion form | Accessibility Labels | ACTIVE_MIXED | English-only hint |
| res.suggestion.submit | إرسال الاقتراح | Send Suggestion | `accessibility_suggestions_page.dart` | Suggestion form | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.suggestion.validation | يرجى كتابة اسم الأداة وسبب الاقتراح | Please enter the tool name and reason | `accessibility_suggestions_page.dart` | Validation snackbar | Dialog Titles | ACTIVE_HARDCODED_AR |  |
| res.suggestion.success_title | تم إرسال اقتراحك بنجاح | Your suggestion was sent successfully | `accessibility_suggestions_page.dart` | Success dialog | Dialog Titles | ACTIVE_HARDCODED_AR |  |
| res.suggestion.success_body | شكرًا لمساهمتك. اقتراحاتكم تساعدنا على تطوير المنصة وإضافة أدوات جديدة يستفيد منها الجميع. قد ترى اقتراحك ضمن الأدوات المتاحة مستقبلًا. | Thank you for contributing. Your suggestions help us improve the platform and add useful tools. Your suggestion may appear among future tools. | `accessibility_suggestions_page.dart` | Success dialog | Dialog Titles | ACTIVE_HARDCODED_AR | Singular/plural voice mixed |
| res.checkin.section.title | طمّنا عليك | Check In With Us | `accessibility_checkin_page.dart` | Check-in page | Section Titles | SHARED_DUPLICATE |  |
| res.checkin.question.1 | عامل إيه النهارده؟ | How are you today? | `accessibility_checkin_page.dart` | Check-in field | Accessibility Labels | ACTIVE_HARDCODED_AR | Egyptian colloquial |
| res.checkin.question.2 | في حاجة صعبة قابلتك؟ | Did anything difficult happen? | `accessibility_checkin_page.dart` | Check-in field | Accessibility Labels | ACTIVE_HARDCODED_AR | Egyptian colloquial |
| res.checkin.question.3 | إيه أكتر حاجة محتاجها مننا؟ | What do you need most from us? | `accessibility_checkin_page.dart` | Check-in field | Accessibility Labels | ACTIVE_HARDCODED_AR | Egyptian colloquial |
| res.checkin.question.4 | هل في أداة أو خدمة تساعدك؟ | Is there a tool or service that could help? | `accessibility_checkin_page.dart` | Check-in field | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.checkin.question.5 | تحب تقول لنا حاجة؟ | Would you like to tell us something? | `accessibility_checkin_page.dart` | Check-in field | Accessibility Labels | ACTIVE_HARDCODED_AR |  |
| res.checkin.send | إرسال | Send | `accessibility_checkin_page.dart` | Check-in button | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.checkin.general_title | شكاوى ومقترحات عامة | General Complaints and Suggestions | `accessibility_checkin_page.dart` | Check-in section | Section Titles | ACTIVE_HARDCODED_AR |  |
| res.checkin.whatsapp | تواصل معنا عبر واتساب | Contact Us on WhatsApp | `accessibility_checkin_page.dart` | Check-in button | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.checkin.more_help | لو حابب تعرف أكتر أو تتكلم مع متخصص | Learn More or Talk to a Specialist | `accessibility_checkin_page.dart` | Check-in section | Section Titles | ACTIVE_HARDCODED_AR | Colloquial |
| res.checkin.specialists | الأخصائيون | Specialists | `accessibility_checkin_page.dart` | Navigation button | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.checkin.centers | المراكز | Centers | `accessibility_checkin_page.dart` | Navigation button | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.checkin.library | المكتبة | Library | `accessibility_checkin_page.dart` | Navigation button | Button Titles | SHARED_DUPLICATE | Also legend label |
| res.checkin.success_title | تم فتح واتساب | WhatsApp Opened | `accessibility_checkin_page.dart` | Confirmation dialog | Dialog Titles | ACTIVE_HARDCODED_AR | Does not prove message delivery |
| res.checkin.success_body | شكرًا إنك طمّنتنا عليك. إجاباتك لم يتم إرسالها أو حفظها. | Thank you for checking in. Your answers were not sent or saved. | `accessibility_checkin_page.dart` | Confirmation dialog | Dialog Titles | ACTIVE_HARDCODED_AR |  |
| res.community.message | سنضيف الأدوات الأكثر طلبًا بناءً على اقتراحاتكم. | We will add the most requested tools based on your suggestions. | `accessibility_community_tools_page.dart` | Community placeholder | Dialog Titles | ACTIVE_HARDCODED_AR |  |
| res.community.back_room | العودة للغرفة | Return to the Room | `accessibility_community_tools_page.dart` | Navigation button | Button Titles | ACTIVE_HARDCODED_AR | Returns specifically to Accessibility Room |

## Notebook And Motivational Content

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.notebook.dialog.title | رسالة للنوتة | A Message for the Notebook | `client_room_page.dart` | Quick Access notebook dialog | Dialog Titles | ACTIVE_HARDCODED_AR |  |
| res.notebook.dialog.subtitle | اختر جملة تحب تظهر على النوتة اليوم | Choose a message to see on the notebook today | `client_room_page.dart` | Quick Access notebook dialog | Dialog Titles | ACTIVE_HARDCODED_AR | Colloquial |
| res.notebook.today.title | رسالة اليوم | Message of the Day | message page/Accessibility dialog | Notebook page | Dialog Titles | SHARED_DUPLICATE |  |
| res.notebook.today.subtitle | اختر رسالة تحب رؤيتها على النوتة | Choose a message to see on the notebook | message page/Accessibility dialog | Notebook page | Dialog Titles | SHARED_DUPLICATE | نوتة/نوته inconsistency |
| res.notebook.random | اختر لي رسالة | Choose a Message for Me | `accessibility_message_of_day_page.dart` | Random message button | Button Titles | ACTIVE_HARDCODED_AR |  |
| res.motivation.01 | خطوة صغيرة اليوم أفضل من انتظار يوم مثالي. | A small step today is better than waiting for a perfect day. | `client_room_page.dart` | Quick Access selector | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.02 | ما زلت تكمل الطريق، وهذا يكفي اليوم. | You are still moving forward, and that is enough today. | `client_room_page.dart` | Quick Access selector | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.03 | لا يلزم أن تكون قويًا طوال الوقت. | You do not have to be strong all the time. | `client_room_page.dart` | Quick Access selector | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.04 | كل محاولة جديدة هي تقدم. | Every new attempt is progress. | `client_room_page.dart` | Quick Access selector | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.05 | أنت لست متأخرًا، أنت تتحرك بالسرعة المناسبة لك. | You are not late; you are moving at the pace that suits you. | `client_room_page.dart` | Quick Access selector | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.06 | أنا أقوى مما أعتقد | I am stronger than I think. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.07 | غدًا فرصة جديدة | Tomorrow is a new opportunity. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.08 | لست وحدي | I am not alone. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.09 | أستحق الراحة | I deserve rest. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.10 | خطوة صغيرة تكفي اليوم | A small step is enough today. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.11 | الحمد لله على ما أنا فيه | I am grateful for where I am. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR | Faith-specific translation is interpretive |
| res.motivation.12 | سأعطي نفسي وقتًا للراحة | I will give myself time to rest. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.13 | وجودي مهم | My presence matters. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.14 | ما زالت هناك أشياء جميلة تنتظرني | Beautiful things are still waiting for me. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.15 | اليوم يكفي كما هو | Today is enough as it is. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.16 | أستطيع البدء من جديد | I can begin again. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.17 | لكل مشكلة أكثر من حل | Every problem has more than one solution. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.18 | خطوة صغيرة أفضل من الوقوف | A small step is better than standing still. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.19 | أستحق اللطف مع نفسي | I deserve kindness from myself. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.20 | الأمور تتحسن بالتدريج | Things improve gradually. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.21 | كل يوم صفحة جديدة | Every day is a new page. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.22 | لدي أشياء جميلة لم أكتشفها بعد | I have beautiful things I have not discovered yet. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.23 | الهدوء قوة أيضًا | Calm is also strength. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.24 | أنا أحاول وهذا يكفي | I am trying, and that is enough. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |
| res.motivation.25 | لا بأس أن أرتاح قليلًا | It is okay to rest for a while. | message page | Motivational Sentences | Motivational Sentences | ACTIVE_HARDCODED_AR |  |

## Audio And Accessibility Labels

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Status | Notes |
|---|---|---|---|---|---|---|---|
| res.audio.coming_soon | قريبًا: نطق المسمى | Coming soon: spoken label | all Residential pages | Speaker placeholders | Audio Labels | SHARED_DUPLICATE | Repeated in many widgets |
| res.audio.dynamic | قريبًا: نطق {label} | Coming soon: speak {label} | `client_room_page.dart` | Dynamic speaker snackbar | Audio Labels | ACTIVE_HARDCODED_AR | Different from common wording |
| res.access.semantic.external | فتح رابط خارجي | Open External Link | external link controls | Semantic reserve | Accessibility Labels | FUTURE_RESERVED | Not consistently supplied to Semantics |
| res.access.semantic.speaker | نطق المسمى | Speak Label | speaker controls | Semantic reserve | Accessibility Labels | FUTURE_RESERVED | Tooltips exist; semantic labels not universal |
| res.access.semantic.image | صورة توضيحية | Illustrative Image | room/card images | Semantic reserve | Accessibility Labels | FUTURE_RESERVED | Many images have no explicit semantic label |

## Registry Summary

- Registry entries: 161
- Arabic values defined in registry: 161
- English values defined in registry: 161
- Runtime localization mechanism used by these entries: none confirmed
- Current runtime source: hardcoded Dart strings and static data lists
- Runtime language coverage: Arabic-first, with English proper names on tools and organizations

This registry documents values only. It does not modify runtime localization behavior.

## Residential Exit Polish And Platform Safety Entries

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Audio/TTS Readiness | Status | Notes |
|---|---|---|---|---|---|---|---|---|
| app.platform.what_is | Mental Smile دعم ومعرفة وموارد واكتشاف وإمكانية وصول وتواصل مجتمعي | Mental Smile is support, knowledge, resources, discovery, accessibility, and community access | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
| app.platform.not_authority | Mental Smile ليست مقدم علاج أو طوارئ أو جهة قانونية | Mental Smile is not a medical provider, emergency service, or legal authority | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
| app.platform.before_contact | تحقق من الهوية والتراخيص والمعلومات والتكاليف قبل الالتزام | Verify identity, licenses, information, and costs before commitment | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
| app.platform.safety_rules | احم بياناتك ولا تشارك كلمات المرور أو المعلومات المالية علنًا | Protect your data and do not share passwords or financial information publicly | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
| app.platform.complaints | شكاوى المنصة تخص الإساءة أو الحسابات المزيفة أو سوء استخدام المنصة | Platform complaints include abuse, fake profiles, or platform misuse | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
| app.platform.legal_cases | في التهديد أو الابتزاز أو العنف أو الإساءة تواصل مع الجهات الرسمية | For threats, blackmail, violence, or abuse, contact official authorities | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
| app.platform.content_rules | لا نصائح طبية ولا وعود علاجية ولا محتوى مضلل أو غير آمن | No medical advice, treatment promises, misleading, or unsafe content | Platform usage guide | Safety guide content | Safety Labels | READY | ACTIVE | Guide text |
## Application Final Placement Correction Entries

| Localization ID | Arabic Value | English Value | Current Location | Used By | Category | Audio/TTS Readiness | Status | Notes |
|---|---|---|---|---|---|---|---|---|
| splash.button.audio_marker | سماع تسمية الزر | Button audio label | `splash_page.dart` | Splash buttons | Audio Labels | READY | ACTIVE | Headphone marker added to all four Splash buttons |
| res.links.safety_guidance.title | إرشادات الأمان والشكاوى | Safety & Complaint Guidance | `client_room_page.dart` | Quick Access Links Card | Dialog Titles | READY | ACTIVE | Local dialog, no route |
| res.links.safety.before_provider | قبل التواصل مع مقدم الخدمة | Before contacting a provider | `client_room_page.dart` | Safety dialog section | Section Titles | READY | ACTIVE |  |
| res.links.safety.rules | قواعد الأمان | Safety rules | `client_room_page.dart` | Safety dialog section | Section Titles | READY | ACTIVE |  |
| res.links.safety.platform_contact | متى تتواصل مع المنصة | When to contact the platform | `client_room_page.dart` | Safety dialog section | Section Titles | READY | ACTIVE |  |
| res.links.safety.authorities | متى تتوجه للجهات الرسمية | When to contact official authorities | `client_room_page.dart` | Safety dialog section | Section Titles | READY | ACTIVE |  |
| res.links.safety.notice | تنبيه مهم | Important notice | `client_room_page.dart` | Safety dialog section | Section Titles | READY | ACTIVE |  |
