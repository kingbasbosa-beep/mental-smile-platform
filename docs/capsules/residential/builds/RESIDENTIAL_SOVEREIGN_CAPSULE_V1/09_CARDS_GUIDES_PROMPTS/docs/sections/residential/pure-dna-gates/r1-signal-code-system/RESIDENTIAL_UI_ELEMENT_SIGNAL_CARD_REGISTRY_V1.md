# RESIDENTIAL UI ELEMENT SIGNAL CARD REGISTRY V1

Status: ACTIVE CARD REGISTRY

Operation ID: OP-RESIDENTIAL-R1-SIGNAL-CODE-SYSTEM-UI-ELEMENT-CARD-FOUNDATION-V1

## Screen Cards

| Element ID | Signal Code | Display Name | Screen | Widget / Component | Localization Key | Arabic Text | English Text | Accessibility Icon | Semantics | Signal | Magnet | Archive Destination | Aggregation Destination | Strategic Destination | Owner | Review | Runtime |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R-SCR-001 | R.S.001.VIEW | Splash Screen | Splash | `SplashPage` | splashTitle | شاشة البداية | Splash screen | NO | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Residential Experience Summary | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-002 | R.S.002.VIEW | Client Room | Client Room | `ClientRoomPage` | applicationSplashQuickAccess | الوصول السريع | Quick access | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Residential Experience Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-003 | R.S.003.VIEW | Accessibility Room | Accessibility Room | `AccessibilityRoomPage` | applicationSplashAccessibilityAccess | غرفة الإتاحة | Accessibility room | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Accessibility Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-004 | R.S.004.VIEW | Accessibility Links | Accessibility Links | `AccessibilityLinksPage` | applicationAccessibilityLinksTitle | لينكات مهمة | Important links | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Resource Demand Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-005 | R.S.005.VIEW | Accessibility Tools | Accessibility Tools | `AccessibilityToolsPage` | applicationAccessibilityToolsTitle | أدوات مساعدة | Assistive tools | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Tool Demand Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-006 | R.S.006.VIEW | Accessibility Suggestions | Accessibility Suggestions | `AccessibilitySuggestionsPage` | applicationAccessibilitySuggestionsTitle | شاركنا رأيك | Share your feedback | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Suggestion Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-007 | R.S.007.VIEW | Accessibility Check-in | Accessibility Check-in | `AccessibilityCheckinPage` | applicationClientCheckInTitle | طمنّا عليك | Check in with us | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Wellbeing Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-008 | R.S.008.VIEW | Message of the Day | Message of Day | `AccessibilityMessageOfDayPage` | applicationClientFeatherNotebook | نوتة الملاحظات | Notes notebook | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Motivation Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-009 | R.S.009.VIEW | Community Tools | Community Tools | `AccessibilityCommunityToolsPage` | applicationClientCommunityToolsTitle | تطبيقات وأدوات | Apps and tools | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Community Tool Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-SCR-010 | R.S.010.VIEW | Residential Exit Portal | Residential Exit | `ResidentialExitSocialPortalPage` | applicationExitJourneyTitle | رحلتك تهمنا | Your journey matters | YES | YES | YES | RB10 | Residential Screen Signals | Residential UI Screen Aggregation | Exit Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |

## Button and Card Cards

| Element ID | Signal Code | Display Name | Screen | Widget / Component | Category | Action | Localization Key | Accessibility Icon | Semantics | Signal | Magnet | Archive Destination | Aggregation Destination | Strategic Destination | Owner | Review | Runtime |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R-BTN-001 | R.B.001.TAP | Quick Access Button | Splash | `_SplashPrimaryAction` | B | TAP | applicationSplashQuickAccess | YES | YES | YES | RB20 | Button Signals | Button Intent Aggregation | Interaction Summary | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R-BTN-002 | R.B.002.TAP | Accessibility Access Button | Splash | `_SplashPrimaryAction` | B | TAP | applicationSplashAccessibilityAccess | YES | YES | YES | RB20 | Button Signals | Button Intent Aggregation | Accessibility Summary | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R-BTN-003 | R.B.003.TAP | Commercial Access Button | Splash | `_SplashSecondaryAction` | B | TAP | applicationSplashCommercialAccess | YES | YES | YES | RB20 | Button Signals | Button Intent Aggregation | Cross-section Entry Summary | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R-BTN-004 | R.B.004.OPEN | Official Website Button | Splash | `_SplashSecondaryAction` | B | OPEN | applicationSplashOfficialWebsite | YES | YES | YES | RB20 | Button Signals | External Intent Aggregation | Public Website Summary | Application UI | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-001 | R.C.001.TAP | Check-in Card | Client Room | `_QuickAccessWallCard` | C | TAP | applicationClientCheckInTitle | YES | YES | YES | RB30 | Card Signals | Card Engagement Aggregation | Wellbeing Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-002 | R.C.002.TAP | Community Tools Card | Client Room | `_QuickAccessWallCard` | C | TAP | applicationClientCommunityToolsTitle | YES | YES | YES | RB30 | Card Signals | Card Engagement Aggregation | Community Tools Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-003 | R.C.003.TAP | Suggestions Card | Client Room | `_QuickAccessWallCard` | C | TAP | applicationClientSuggestionTitle | YES | YES | YES | RB30 | Card Signals | Suggestion Aggregation | Suggestion Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-004 | R.C.004.TAP | Personal Tools Card | Client Room | `_QuickAccessWallCard` | C | TAP | applicationClientToolsTitle | YES | YES | YES | RB30 | Card Signals | Tool Usage Aggregation | Tool Demand Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-005 | R.C.005.TAP | Personal Links Card | Client Room | `_QuickAccessWallCard` | C | TAP | applicationClientLinksTitle | YES | YES | YES | RB30 | Card Signals | Link Usage Aggregation | Resource Demand Summary | Residential | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-006 | R.C.006.TAP | Accessibility Links Card | Accessibility Room | `_AccessibilityLinksCard` | C | TAP | applicationAccessibilityLinksTitle | YES | YES | YES | RB30 | Card Signals | Card Engagement Aggregation | Resource Demand Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-007 | R.C.007.TAP | Accessibility Tools Card | Accessibility Room | `_AccessibilityToolsCard` | C | TAP | applicationAccessibilityToolsTitle | YES | YES | YES | RB30 | Card Signals | Tool Usage Aggregation | Tool Demand Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-008 | R.C.008.TAP | Accessibility Suggestions Card | Accessibility Room | `_AccessibilitySuggestionsCard` | C | TAP | applicationAccessibilitySuggestionsTitle | YES | YES | YES | RB30 | Card Signals | Suggestion Aggregation | Suggestion Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-009 | R.C.009.TAP | Accessibility Community Tools Card | Accessibility Room | `_AccessibilityCommunityToolsCard` | C | TAP | applicationAccessibilityCommunityToolsComingSoon | YES | YES | YES | RB30 | Card Signals | Community Tool Aggregation | Community Tools Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |
| R-CARD-010 | R.C.010.TAP | Accessibility Check-in Card | Accessibility Room | `_AccessibilityCheckinCard` | C | TAP | applicationClientCheckInTitle | YES | YES | YES | RB30 | Card Signals | Wellbeing Aggregation | Wellbeing Summary | Accessibility | ACTIVE_REVIEWED | UI_ACTIVE |

Total UI element cards created: 28

Final Status: RESIDENTIAL_UI_ELEMENT_SIGNAL_CARD_REGISTRY_CREATED

