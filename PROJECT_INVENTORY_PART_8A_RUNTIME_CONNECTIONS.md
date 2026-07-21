# PART 8A - LINKS, PERSISTENCE, AND MOBILE/DESKTOP PARITY AUDIT

## 1. Scope

| Area | Included | Evidence |
|---|---:|---|
| Runtime code | YES | lib/ |
| Runtime tests | YES | test/ |
| Cloud Functions | YES | functions/ |
| Firebase rules | YES | firestore.rules, storage.rules |
| Firebase indexes/config | YES | firestore.indexes.json, firebase.json |
| Asset/config registration | YES | pubspec.yaml |
| Platform Core | NO | lib/core/platform_core/, test/core/platform_core/ |
| Generated/build folders | NO | build/, .dart_tool/, node_modules/ |

## 2. Link Inventory

| Link | Screen | URL | Validation | Error Handling | Format State | Evidence |
|---|---|---|---|---|---|---|
| Mental Smile platform | App exit social links | https://mental-smile-platform.web.app | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| Mental Smile OS | App exit social links | https://kingbasbosa-beep.github.io/mental-smile-os/ | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| Facebook | App exit social links | https://www.facebook.com/MentalSmileOrg | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| LinkedIn | App exit social links | https://www.linkedin.com/company/mentalsmileorg | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| Telegram | App exit social links | https://t.me/MentalSmileOrg | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| WhatsApp | App exit social links | https://wa.me/201014116531 | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| Instagram | App exit social links | https://instagram.com/mentalsmile.platform | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| X | App exit social links | https://x.com/MentaSmileorg | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| TikTok | App exit social links | https://www.tiktok.com/@mentalsmileorg | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| YouTube | App exit social links | https://www.youtube.com/@MentalSmileOs | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| GitHub | App exit social links | https://github.com/kingbasbosa-beep/mental-smile-os | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| Email | App exit social links | mailto:mentalsmile.platform@gmail.com | Uri.parse | opened result checked | VALID_STATIC | lib/features/app_exit/presentation/pages/app_exit_social_links_page.dart |
| WhatsApp check-in | Accessibility check-in | Uri.https('wa.me', '/number', text) | Uri.https | not found | VALID_DYNAMIC | lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart |
| WhatsApp suggestion | Accessibility suggestions | Uri.https('wa.me', '/number', text) | Uri.https | not found | VALID_DYNAMIC | lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart |
| YouTube | Accessibility room | https://www.youtube.com/@MentalSmileOs | Uri.parse | not found | VALID_STATIC | lib/features/accessibility/presentation/pages/accessibility_room_page.dart |
| Accessibility resource links | Accessibility links | static https URLs | Uri.parse | not found | VALID_STATIC_GROUP | lib/features/accessibility/presentation/pages/accessibility_links_page.dart |
| Accessibility tool links | Accessibility tools | static https URLs | Uri.parse | not found | VALID_STATIC_GROUP | lib/features/accessibility/presentation/pages/accessibility_tools_page.dart |
| Client resource links | Client room | static https URLs | Uri.parse | not found | VALID_STATIC_GROUP | lib/features/client/presentation/pages/client_room_page.dart |
| Client YouTube | Client room | https://www.youtube.com/@MentalSmileOs | Uri.parse | not found | VALID_STATIC | lib/features/client/presentation/pages/client_room_page.dart |
| Commercial public account URL | Commercial public accounts | account.url | Uri.parse | not found | DYNAMIC_NOT_VALIDATED | lib/features/commercial/presentation/pages/commercial_public_accounts_page.dart |
| Commercial assistive tool links | Commercial shared assistive tools | static https URLs | Uri.parse | not found | VALID_STATIC_GROUP | lib/features/commercial/presentation/pages/commercial_shared_assistive_tools_page.dart |
| Specialist professional library links | Specialist professional library | static https URLs | Uri.parse | not found | VALID_STATIC_GROUP | lib/features/commercial/presentation/pages/specialist_professional_library_page.dart |
| Center professional library links | Center professional library | static https URLs | Uri.parse | not found | VALID_STATIC_GROUP | lib/features/commercial/presentation/pages/center_professional_library_page.dart |
| Knowledge source links | Knowledge article viewer | markdown source URLs | Uri.parse | not found | DYNAMIC_NOT_VALIDATED | lib/features/library/knowledge_cards/presentation/pages/knowledge_article_viewer_page.dart |

## 3. Forms And Survey Persistence

| Form | Screen | Submit Action | Persistence | Firebase Path | Rule | State | Evidence |
|---|---|---|---|---|---|---|---|
| Daleel welcome survey | Splash | debugPrint answers | none | none | none | NO_PERSISTENCE | lib/features/splash/presentation/pages/splash_page.dart |
| Accessibility check-in | Accessibility check-in | WhatsApp message | external app only | none | none | SIGNAL_ONLY | lib/features/accessibility/presentation/pages/accessibility_checkin_page.dart |
| Accessibility suggestions | Accessibility suggestions | WhatsApp message | external app only | none | none | SIGNAL_ONLY | lib/features/accessibility/presentation/pages/accessibility_suggestions_page.dart |
| Specialist registration | Commercial register pages | account/profile submission | Firestore | clinicians/{uid}, clinicians/{uid}/profile/current, public_specialist_profiles/{uid} | aligned | FIRESTORE_PERSISTED | lib/features/commercial/presentation/pages/commercial_register_pages.dart; firestore.rules |
| Center registration | Commercial register pages | account/profile submission | Firestore | centers/{uid}, centers/{uid}/profile/current, public_center_profiles/{uid} | aligned | FIRESTORE_PERSISTED | lib/features/commercial/presentation/pages/commercial_register_pages.dart; firestore.rules |
| Specialist profile | Specialist clean profile | saveSpecialistProfile | Firestore | clinicians/{uid}/profile/current, public_specialist_profiles/{uid} | aligned | FIRESTORE_PERSISTED | lib/features/commercial/data/provider_profile_repository.dart |
| Center profile | Center clean profile | saveCenterProfile | Firestore | centers/{uid}/profile/current, public_center_profiles/{uid} | aligned | FIRESTORE_PERSISTED | lib/features/commercial/data/provider_profile_repository.dart |
| Specialist official image | Specialist clean profile | uploadSpecialistOfficialImage | Storage | clinicians/{uid}/official/profile_image | aligned | STORAGE_PERSISTED | lib/features/commercial/data/provider_profile_repository.dart; storage.rules |
| Center identity image | Center clean profile | uploadCenterIdentityImage | Storage | centers/{uid}/official/identity_image | aligned | STORAGE_PERSISTED | lib/features/commercial/data/provider_profile_repository.dart; storage.rules |
| Legacy profile drafts | Older commercial profile pages | local state/signals | not verified as runtime route | none verified | none verified | LOCAL_ONLY | lib/features/commercial/presentation/pages/specialist_professional_profile_page.dart |

## 4. Specialist Desktop/Mobile Parity

| Specialist Feature | Desktop | Mobile | Service | Firebase/Storage | Parity State | Evidence |
|---|---|---|---|---|---|---|
| Professional room | CommercialRoomPage | Generation2MobileSpecialistRoomPage | navigation/card actions | none direct | PARTIAL | lib/features/commercial/presentation/pages/commercial_room_page.dart; lib/features/generation2_mobile_specialist_room/presentation/pages/generation2_mobile_specialist_room_page.dart |
| Professional profile edit | SpecialistProfessionalProfileCleanLayoutPage | not found | ProviderProfileRepository | clinicians/{uid}/profile/current | DESKTOP_ONLY | lib/features/commercial/presentation/pages/specialist_professional_profile_clean_layout_page.dart |
| Official image upload | SpecialistProfessionalProfileCleanLayoutPage | not found | Firebase Storage | clinicians/{uid}/official/profile_image | DESKTOP_ONLY | lib/features/commercial/data/provider_profile_repository.dart |
| Public specialist profile | desktop profile save | not found | Firestore | public_specialist_profiles/{uid} | DESKTOP_ONLY | lib/features/commercial/data/provider_profile_repository.dart |
| Professional library | SpecialistProfessionalLibraryPage | not found as specialist mobile route | url_launcher | external URLs | DESKTOP_ONLY | lib/features/commercial/presentation/pages/specialist_professional_library_page.dart |
| Registration entry | commercial register pages | not found as specialist mobile route | Firebase/Auth/Profile | clinicians paths | DESKTOP_ONLY | lib/features/commercial/presentation/pages/commercial_register_pages.dart |

## 5. Center Desktop/Mobile Parity

| Center Feature | Desktop | Mobile | Service | Firebase/Storage | Parity State | Evidence |
|---|---|---|---|---|---|---|
| Center room | CenterRoomPage | Generation2MobileCenterRoomPage | navigation/card actions | none direct | PARTIAL | lib/features/commercial/presentation/pages/center_room_page.dart; lib/features/generation2_mobile_center_room/presentation/pages/generation2_mobile_center_room_page.dart |
| Center profile edit | CenterProfessionalProfileCleanLayoutPage | not found | ProviderProfileRepository | centers/{uid}/profile/current | DESKTOP_ONLY | lib/features/commercial/presentation/pages/center_professional_profile_clean_layout_page.dart |
| Identity image upload | CenterProfessionalProfileCleanLayoutPage | not found | Firebase Storage | centers/{uid}/official/identity_image | DESKTOP_ONLY | lib/features/commercial/data/provider_profile_repository.dart |
| Public center profile | desktop profile save | not found | Firestore | public_center_profiles/{uid} | DESKTOP_ONLY | lib/features/commercial/data/provider_profile_repository.dart |
| Center professional library | CenterProfessionalLibraryPage | not found as center mobile route | url_launcher | external URLs | DESKTOP_ONLY | lib/features/commercial/presentation/pages/center_professional_library_page.dart |
| Registration entry | commercial register pages | not found as center mobile route | Firebase/Auth/Profile | centers paths | DESKTOP_ONLY | lib/features/commercial/presentation/pages/commercial_register_pages.dart |

## 6. Registration Card Parity

| Registration Card | Desktop | Mobile | Action | Destination | State |
|---|---|---|---|---|---|
| Specialist registration | present in commercial registration flow | no equivalent mobile card verified | submit/profile creation | clinicians paths | DESKTOP_ONLY |
| Center registration | present in commercial registration flow | no equivalent mobile card verified | submit/profile creation | centers paths | DESKTOP_ONLY |
| Client mobile selection | no desktop registration equivalent in this audit | present | route navigation | client mobile room/login flow | MOBILE_ONLY |
| Supporters mobile selection | no desktop registration equivalent in this audit | present | route navigation | app/supporter mobile flow | MOBILE_ONLY |

## 7. Room Parity

| Room Card | Desktop | Mobile | Action | Destination | State |
|---|---|---|---|---|---|
| Specialist profile | present | not verified | navigation | specialist profile page | DESKTOP_ONLY |
| Specialist library | present | not verified | navigation/external links | specialist professional library | DESKTOP_ONLY |
| Specialist assistive tools | present | not verified | navigation/external links | shared assistive tools | DESKTOP_ONLY |
| Center profile | present | not verified | navigation | center profile page | DESKTOP_ONLY |
| Center library | present | not verified | navigation/external links | center professional library | DESKTOP_ONLY |
| Center room support actions | present | partial mobile shell | navigation/cards | center mobile room | PARTIAL |
| Client accessibility cards | present | not applicable | navigation | accessibility/client resources | ACTIVE |
| Generation2 mobile specialist room cards | no exact desktop card match | present | route navigation | specialist mobile room | MOBILE_ONLY |
| Generation2 mobile center room cards | no exact desktop card match | present | route navigation | center mobile room | MOBILE_ONLY |

## 8. Upload Contracts

| Upload | Desktop Consumer | Mobile Consumer | Storage Path | Firestore Update | Rule | State |
|---|---|---|---|---|---|---|
| Specialist official image | SpecialistProfessionalProfileCleanLayoutPage | not found | clinicians/{uid}/official/profile_image | profileImageUrl saved to clinicians profile and public profile | isOfficialSpecialistImageUpload | DESKTOP_CONNECTED |
| Center identity image | CenterProfessionalProfileCleanLayoutPage | not found | centers/{uid}/official/identity_image | identityImageUrl saved to centers profile and public profile | isOfficialCenterImageUpload | DESKTOP_CONNECTED |

## 9. Firestore/Storage Rules Alignment

| Runtime Path | Runtime Consumer | Rule Path | Rule Helper | State | Evidence |
|---|---|---|---|---|---|
| clinicians/{uid}/profile/current | ProviderProfileRepository.saveSpecialistProfile | clinicians/{clinicianId}/profile/{profileId} | specialistProfileWriteValid | ALIGNED | lib/features/commercial/data/provider_profile_repository.dart; firestore.rules |
| public_specialist_profiles/{uid} | ProviderProfileRepository.saveSpecialistProfile | public_specialist_profiles/{profileId} | public specialist profile validation | ALIGNED | lib/features/commercial/data/provider_profile_repository.dart; firestore.rules |
| centers/{uid}/profile/current | ProviderProfileRepository.saveCenterProfile | centers/{centerId}/profile/{profileId} | centerProfileWriteValid | ALIGNED | lib/features/commercial/data/provider_profile_repository.dart; firestore.rules |
| public_center_profiles/{uid} | ProviderProfileRepository.saveCenterProfile | public_center_profiles/{profileId} | public center profile validation | ALIGNED | lib/features/commercial/data/provider_profile_repository.dart; firestore.rules |
| clinicians/{uid}/official/profile_image | uploadSpecialistOfficialImage | clinicians/{uid}/official/profile_image | isOfficialSpecialistImageUpload | ALIGNED | lib/features/commercial/domain/provider_profile_storage.dart; storage.rules |
| centers/{uid}/official/identity_image | uploadCenterIdentityImage | centers/{uid}/official/identity_image | isOfficialCenterImageUpload | ALIGNED | lib/features/commercial/domain/provider_profile_storage.dart; storage.rules |
| Signal collections | signal emitters | signal match blocks | signal validators | VERIFIED_BY_REFERENCE | lib/shared/signals/; firestore.rules |

## 10. Final Factual Tables

| Category | Count | State |
|---|---:|---|
| Link handler groups | 13 | ACTIVE |
| Static external links | 12 direct app-exit links plus grouped page lists | ACTIVE |
| Dynamic URL consumers | 3 | NOT_VERIFIED |
| Invalid-format links | 0 observed statically | NOT_VERIFIED |
| Placeholder/test links | 0 observed in runtime surfaces | NOT_VERIFIED |
| Link groups without visible error handling | 11 | ACTIVE |

| Category | Count | State |
|---|---:|---|
| Forms/surveys | 10 | ACTIVE |
| Firestore-persisted | 4 | ACTIVE |
| Storage-persisted | 2 | ACTIVE |
| Signal-only | 2 | ACTIVE |
| Local-only | 1 | NOT_VERIFIED |
| No persistence | 1 | ACTIVE |

| Category | Count | State |
|---|---:|---|
| Specialist parity gaps | 6 | ACTIVE |
| Center parity gaps | 6 | ACTIVE |
| Registration parity gaps | 4 | ACTIVE |
| Room parity gaps | 8 | ACTIVE |
| Runtime writes without rules | 0 observed | ACTIVE |
| Rules without runtime consumers | 0 observed | NOT_VERIFIED |
| Missing indexes | 0 observed | NOT_VERIFIED |

