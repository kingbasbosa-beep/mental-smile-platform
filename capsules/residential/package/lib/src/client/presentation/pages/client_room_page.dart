import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental_smile_residential_capsule/src/capsule/residential_capsule_routes.dart';
import 'package:mental_smile_residential_capsule/src/contracts/client_local_session_store.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_codes.dart';
import 'package:mental_smile_residential_capsule/src/residential/signals/residential_signal_emitter.dart';
import 'package:mental_smile_residential_capsule/src/residential/speech/residential_speech_contract.dart';
import 'package:mental_smile_residential_capsule/src/localization/accessibility/accessibility_localizations.dart';
import 'package:mental_smile_residential_capsule/src/localization/residential/residential_localizations.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_actions.dart';

class ClientRoomPage extends StatefulWidget {
  const ClientRoomPage({super.key});

  @override
  State<ClientRoomPage> createState() => _ClientRoomPageState();
}

class _ClientRoomPageState extends State<ClientRoomPage> {
  static const ClientLocalSessionStore _sessionStore =
      ClientLocalSessionStore();

  static const String _desktop =
      'packages/mental_smile_residential_capsule/assets/branding/rooms/client_room/client_room_background_desktop.png';
  static const String _tablet =
      'packages/mental_smile_residential_capsule/assets/branding/rooms/client_room/client_room_background_tablet.png';
  static const String _mobile =
      'packages/mental_smile_residential_capsule/assets/branding/rooms/client_room/client_room_background_mobile.png';
  static const String _exitCup =
      'packages/mental_smile_residential_capsule/assets/branding/rooms/client_room/accessibility_room_exit_button.png';
  static const String _youtubeButton =
      'packages/mental_smile_residential_capsule/assets/branding/rooms/client_room/accessibility_room_youtube_button.png';
  static const String _photoButton =
      'packages/mental_smile_residential_capsule/assets/branding/rooms/client_room/accessibility_room_photo_upload_button.png';
  static const String _noteFeatherButton =
      'packages/mental_smile_residential_capsule/assets/client/client_room/cards/accessibility_note_feather_button.png';
  static const String _checkinCardIcon =
      'packages/mental_smile_residential_capsule/assets/client/client_room/cards/accessibility_checkin_card_icon.png';
  static const String _communityToolsCardIcon =
      'packages/mental_smile_residential_capsule/assets/client/client_room/cards/accessibility_community_tools_card_icon.png';
  static const String _suggestionsCardIcon =
      'packages/mental_smile_residential_capsule/assets/client/client_room/cards/accessibility_suggestions_card_icon.png';
  static const String _personalToolsCardIcon =
      'packages/mental_smile_residential_capsule/assets/client/client_room/cards/accessibility_tools_card_icon.png';
  static const String _personalLinksCardIcon =
      'packages/mental_smile_residential_capsule/assets/client/client_room/cards/accessibility_links_card_icon.png';
  static const String _youtubeUrl = 'https://www.youtube.com/@MentalSmileOs';

  List<_ResidentialNotebookMessage> _notebookMessages(
    ResidentialLocalizations l10n,
  ) => [
    _ResidentialNotebookMessage(
      key: 'applicationClientNotebookMessage1',
      text: l10n.applicationClientNotebookMessage1,
    ),
    _ResidentialNotebookMessage(
      key: 'applicationClientNotebookMessage2',
      text: l10n.applicationClientNotebookMessage2,
    ),
    _ResidentialNotebookMessage(
      key: 'applicationClientNotebookMessage3',
      text: l10n.applicationClientNotebookMessage3,
    ),
    _ResidentialNotebookMessage(
      key: 'applicationClientNotebookMessage4',
      text: l10n.applicationClientNotebookMessage4,
    ),
    _ResidentialNotebookMessage(
      key: 'applicationClientNotebookMessage5',
      text: l10n.applicationClientNotebookMessage5,
    ),
  ];

  List<_QuickAccessLinkCategory> _linkCategories(
    ResidentialLocalizations l10n,
  ) => [
    _QuickAccessLinkCategory(
      titleKey: 'applicationClientLinkCategorySafety',
      title: l10n.applicationClientLinkCategorySafety,
      titleEn: 'Safety & Complaint Guidance',
      visualMarker: 'ÃƒÂ°Ã…Â¸Ã¢â‚¬ÂºÃ‚Â¡ÃƒÂ¯Ã‚Â¸Ã‚Â',
      links: <_QuickAccessExternalLink>[],
      isSafetyGuidance: true,
    ),
    _QuickAccessLinkCategory(
      titleKey: 'applicationClientLinkCategorySupport',
      title: l10n.applicationClientLinkCategorySupport,
      visualMarker: 'ÃƒÂ°Ã…Â¸Ã‚ÂÃ‚Â¥',
      links: <_QuickAccessExternalLink>[
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkHealthMinistry',
          speechText: l10n.applicationClientQuickLinkHealthMinistry,
          title:
              'Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â²ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒËœÃ‚Â­ÃƒËœÃ‚Â© Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â³Ãƒâ„¢Ã†â€™ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â ',
          description:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â®ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒËœÃ‚Â­Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â±ÃƒËœÃ‚Â³Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â©',
          url: 'https://www.mohp.gov.eg/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkMentalHealthSecretariat',
          speechText: l10n.applicationClientQuickLinkMentalHealthSecretariat,
          title:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒËœÃ‚Â­ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã‚ÂÃƒËœÃ‚Â³Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â©',
          description:
              'ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒËœÃ‚Â­ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã‚ÂÃƒËœÃ‚Â³Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¬ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¥ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â ',
          url: 'https://mentalhealth.mohp.gov.eg/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkTherapyRoute',
          speechText: l10n.applicationClientQuickLinkTherapyRoute,
          title:
              'ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Å¾ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¬ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â­ÃƒËœÃ‚Â±',
          description:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¨ÃƒËœÃ‚Â­ÃƒËœÃ‚Â« ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â  ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¬',
          url: 'https://www.therapyroute.com/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkGovernmentComplaints',
          speechText: l10n.applicationClientQuickLinkGovernmentComplaints,
          title:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â´Ãƒâ„¢Ã†â€™ÃƒËœÃ‚Â§Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â° ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â­Ãƒâ„¢Ã†â€™Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â©',
          description:
              'ÃƒËœÃ‚Â¨Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¨ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â´Ãƒâ„¢Ã†â€™ÃƒËœÃ‚Â§Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â° ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â­Ãƒâ„¢Ã†â€™Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â­ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â©',
          url: 'https://www.shakwa.eg/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkHealthInsurance',
          speechText: l10n.applicationClientQuickLinkHealthInsurance,
          title:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂªÃƒËœÃ‚Â£Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒËœÃ‚Â­Ãƒâ„¢Ã…Â ',
          description:
              'ÃƒËœÃ‚Â®ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¡Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â¦ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂªÃƒËœÃ‚Â£Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒËœÃ‚Â­Ãƒâ„¢Ã…Â ',
          url: 'https://www.hio.gov.eg/',
        ),
      ],
    ),
    _QuickAccessLinkCategory(
      titleKey: 'applicationClientLinkCategoryFamily',
      title: l10n.applicationClientLinkCategoryFamily,
      visualMarker:
          'ÃƒÂ°Ã…Â¸Ã¢â‚¬ËœÃ‚Â¨ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ°Ã…Â¸Ã¢â‚¬ËœÃ‚Â©ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ°Ã…Â¸Ã¢â‚¬ËœÃ‚Â§ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ°Ã…Â¸Ã¢â‚¬ËœÃ‚Â¦',
      links: <_QuickAccessExternalLink>[
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkFamilyGuidance',
          speechText: l10n.applicationClientQuickLinkFamilyGuidance,
          title:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¥ÃƒËœÃ‚Â±ÃƒËœÃ‚Â´ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¯ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£ÃƒËœÃ‚Â³ÃƒËœÃ‚Â±Ãƒâ„¢Ã…Â ',
          description:
              'Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â¯ Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£ÃƒËœÃ‚Â³ÃƒËœÃ‚Â±ÃƒËœÃ‚Â©',
          url: 'https://www.unicef.org/parenting/ar',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkParentSupport',
          speechText: l10n.applicationClientQuickLinkParentSupport,
          title:
              'ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¯Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â ',
          description:
              'Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚ÂµÃƒËœÃ‚Â§ÃƒËœÃ‚Â¦ÃƒËœÃ‚Â­ ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¯Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â ',
          url: 'https://www.unicef.org/parenting/ar',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkChildProtection',
          speechText: l10n.applicationClientQuickLinkChildProtection,
          title:
              'ÃƒËœÃ‚Â­Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â·Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã¢â‚¬Å¾',
          description:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â³ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¡Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â  Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â·Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â© Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â©',
          url: 'https://www.nccm.gov.eg/',
        ),
      ],
    ),
    _QuickAccessLinkCategory(
      titleKey: 'applicationClientLinkCategoryRecovery',
      title: l10n.applicationClientLinkCategoryRecovery,
      visualMarker: 'ÃƒÂ°Ã…Â¸Ã…â€™Ã‚Â±',
      links: <_QuickAccessExternalLink>[
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkNa',
          speechText: l10n.applicationClientQuickLinkNa,
          title: 'NA',
          description:
              'ÃƒËœÃ‚Â²Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Â¡Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â ',
          url: 'https://www.na.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkAa',
          speechText: l10n.applicationClientQuickLinkAa,
          title: 'AA',
          description:
              'ÃƒËœÃ‚Â²Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã†â€™ÃƒËœÃ‚Â­Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Â¡Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â ',
          url: 'https://www.aa.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkAlAnon',
          speechText: l10n.applicationClientQuickLinkAlAnon,
          title: 'Al-Anon',
          description:
              'ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ ÃƒËœÃ‚Â£ÃƒËœÃ‚Â³ÃƒËœÃ‚Â± Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â£ÃƒËœÃ‚ÂµÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¡ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã†â€™ÃƒËœÃ‚Â­Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾',
          url: 'https://al-anon.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkNarAnon',
          speechText: l10n.applicationClientQuickLinkNarAnon,
          title: 'Nar-Anon',
          description:
              'ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ ÃƒËœÃ‚Â£ÃƒËœÃ‚Â³ÃƒËœÃ‚Â± Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â£ÃƒËœÃ‚ÂµÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¡ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚ÂªÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â ',
          url: 'https://www.nar-anon.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkRecoveryMaterials',
          speechText: l10n.applicationClientQuickLinkRecoveryMaterials,
          title:
              'Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¯ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂªÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã…Â ',
          description:
              'Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚ÂµÃƒËœÃ‚Â§ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â± Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦',
          url: 'https://www.samhsa.gov/find-support',
        ),
      ],
    ),
    _QuickAccessLinkCategory(
      titleKey: 'applicationClientLinkCategoryLearning',
      title: l10n.applicationClientLinkCategoryLearning,
      visualMarker: 'ÃƒÂ°Ã…Â¸Ã¢â‚¬Å“Ã…Â¡',
      links: <_QuickAccessExternalLink>[
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkLifeSkills',
          speechText: l10n.applicationClientQuickLinkLifeSkills,
          title:
              'Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â­Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â§ÃƒËœÃ‚Â©',
          description:
              'ÃƒËœÃ‚ÂªÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â±ÃƒËœÃ‚Â¨Ãƒâ„¢Ã…Â  Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã‚ÂÃƒËœÃ‚ÂªÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Â­',
          url: 'https://www.edraak.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkTimeManagement',
          speechText: l10n.applicationClientQuickLinkTimeManagement,
          title:
              'ÃƒËœÃ‚Â¥ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Âª',
          description:
              'ÃƒËœÃ‚Â¯Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â±ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â©',
          url: 'https://www.edraak.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkHabits',
          speechText: l10n.applicationClientQuickLinkHabits,
          title: 'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª',
          description:
              'ÃƒËœÃ‚ÂªÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚ÂªÃƒËœÃ‚Â·Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â± ÃƒËœÃ‚Â°ÃƒËœÃ‚Â§ÃƒËœÃ‚ÂªÃƒâ„¢Ã…Â ',
          url: 'https://www.khanacademy.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkLearning',
          speechText: l10n.applicationClientQuickLinkLearning,
          title: 'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂªÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦',
          description:
              'Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚ÂµÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â© ÃƒËœÃ‚ÂªÃƒâ„¢Ã†â€™',
          url: 'https://maharatech.gov.eg/',
        ),
      ],
    ),
    _QuickAccessLinkCategory(
      titleKey: 'applicationClientLinkCategoryAccessibility',
      title: l10n.applicationClientLinkCategoryAccessibility,
      visualMarker: 'ÃƒÂ¢Ã¢â€žÂ¢Ã‚Â¿',
      links: <_QuickAccessExternalLink>[
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkDisabilitySupport',
          speechText: l10n.applicationClientQuickLinkDisabilitySupport,
          title:
              'ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£ÃƒËœÃ‚Â´ÃƒËœÃ‚Â®ÃƒËœÃ‚Â§ÃƒËœÃ‚Âµ ÃƒËœÃ‚Â°Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¥ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â©',
          description:
              'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â³ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¡Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â  Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£ÃƒËœÃ‚Â´ÃƒËœÃ‚Â®ÃƒËœÃ‚Â§ÃƒËœÃ‚Âµ ÃƒËœÃ‚Â°Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¥ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â©',
          url: 'https://www.ncpd.gov.eg/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkDeafBlindAssociations',
          speechText: l10n.applicationClientQuickLinkDeafBlindAssociations,
          title:
              'ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂµÃƒâ„¢Ã¢â‚¬Â¦ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã†â€™Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã‹â€ Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Â ',
          description:
              'ÃƒËœÃ‚Â¯Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Å¾ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚ÂµÃƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â¯',
          url: 'https://www.w3.org/WAI/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkNvda',
          speechText: l10n.applicationClientQuickLinkNvda,
          title:
              'Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â¦ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â´ÃƒËœÃ‚Â§ÃƒËœÃ‚Â´ÃƒËœÃ‚Â© NVDA',
          description:
              'Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â¦ ÃƒËœÃ‚Â´ÃƒËœÃ‚Â§ÃƒËœÃ‚Â´ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¬ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã…Â ',
          url: 'https://www.nvaccess.org/',
        ),
        _QuickAccessExternalLink(
          speechKey: 'applicationClientQuickLinkTextToSpeech',
          speechText: l10n.applicationClientQuickLinkTextToSpeech,
          title:
              'ÃƒËœÃ‚ÂªÃƒËœÃ‚Â­Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Å¾ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Âµ ÃƒËœÃ‚Â¥Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â° ÃƒËœÃ‚ÂµÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Âª',
          description:
              'ÃƒËœÃ‚Â£ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â§ÃƒËœÃ‚Â© ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â±ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¡ÃƒËœÃ‚Â© ÃƒËœÃ‚Â¨ÃƒËœÃ‚ÂµÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Âª ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‚Â',
          url: 'https://www.microsoft.com/edge/features/read-aloud',
        ),
      ],
    ),
  ];

  Uint8List? _selectedPhotoBytes;
  String? _selectedNotebookMessage;

  @override
  void initState() {
    super.initState();
    unawaited(_sessionStore.startSession());
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.clientRoomView,
      sourceScreen: 'Client Room',
      sourceWidget: 'ClientRoomPage',
      action: 'view',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ResidentialLocalizations.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final monitor = _monitorPlacement(constraints);
          final showDaleel =
              constraints.maxWidth >= 900 &&
              constraints.maxWidth > constraints.maxHeight;
          return SizedBox.expand(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _assetFor(constraints),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                if (_selectedPhotoBytes != null)
                  _MonitorPhoto(
                    placement: monitor,
                    bytes: _selectedPhotoBytes!,
                  ),
                if (_selectedNotebookMessage != null)
                  _NotebookMessage(
                    placement: _notebookMessagePlacement(constraints),
                    message: _selectedNotebookMessage!,
                  ),
                _QuickAccessWallCard(
                  assetPath: _checkinCardIcon,
                  placement: _checkinCardPlacement(constraints),
                  semanticLabel:
                      '${l10n.applicationClientCheckInTitle}ÃƒËœÃ…â€™ ${l10n.applicationClientCheckInSubtitle}',
                  onPressed: _openCheckin,
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientCheckInTitle',
                    localizedText: l10n.applicationClientCheckInTitle,
                  ),
                ),
                _QuickAccessWallCard(
                  assetPath: _communityToolsCardIcon,
                  placement: _communityToolsCardPlacement(constraints),
                  semanticLabel:
                      '${l10n.applicationClientCommunityToolsTitle}ÃƒËœÃ…â€™ ${AccessibilityLocalizations.of(context).applicationAccessibilityCommunityToolsComingSoon}',
                  onPressed: _openCommunityTools,
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientCommunityToolsTitle',
                    localizedText: l10n.applicationClientCommunityToolsTitle,
                  ),
                ),
                _QuickAccessWallCard(
                  assetPath: _suggestionsCardIcon,
                  placement: _suggestionsCardPlacement(constraints),
                  semanticLabel:
                      '${l10n.applicationClientSuggestionTitle}ÃƒËœÃ…â€™ ${l10n.applicationClientSuggestionSubtitle}',
                  onPressed: _openSuggestions,
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientSuggestionTitle',
                    localizedText: l10n.applicationClientSuggestionTitle,
                  ),
                ),
                _QuickAccessWallCard(
                  assetPath: _personalToolsCardIcon,
                  placement: _personalToolsCardPlacement(constraints),
                  semanticLabel:
                      '${l10n.applicationClientToolsTitle}ÃƒËœÃ…â€™ ${l10n.applicationClientToolsSubtitle}',
                  onPressed: () => _showPersonalToolsDialog(l10n),
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientToolsTitle',
                    localizedText: l10n.applicationClientToolsTitle,
                  ),
                ),
                _QuickAccessWallCard(
                  assetPath: _personalLinksCardIcon,
                  placement: _personalLinksCardPlacement(constraints),
                  semanticLabel:
                      '${l10n.applicationClientLinksTitle}ÃƒËœÃ…â€™ ${l10n.applicationClientLinksSubtitle}',
                  onPressed: () => _openLinksDirectory(l10n),
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientLinksTitle',
                    localizedText: l10n.applicationClientLinksTitle,
                  ),
                ),
                _RoomHoverImageButton(
                  assetPath: _noteFeatherButton,
                  placement: _featherToolPlacement(constraints),
                  semanticLabel: l10n.applicationClientFeatherNotebook,
                  tooltip: l10n.applicationClientFeatherNotebook,
                  imageSize: _featherToolImageSize(constraints),
                  onPressed: () => _openMotivationalSentenceSelector(l10n),
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientFeatherNotebook',
                    localizedText: l10n.applicationClientFeatherNotebook,
                  ),
                ),
                _RoomImageButton(
                  assetPath: _youtubeButton,
                  placement: _youtubePlacement(constraints),
                  tooltip: l10n.applicationClientYoutube,
                  semanticLabel: l10n.applicationClientYoutube,
                  onPressed: _openYoutube,
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientYoutube',
                    localizedText: l10n.applicationClientYoutube,
                  ),
                ),
                _RoomImageButton(
                  assetPath: _photoButton,
                  placement: _photoButtonPlacement(monitor),
                  tooltip: l10n.applicationClientTemporaryPhoto,
                  semanticLabel: l10n.applicationClientTemporaryPhoto,
                  onPressed: _pickTemporaryPhoto,
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientTemporaryPhoto',
                    localizedText: l10n.applicationClientTemporaryPhoto,
                  ),
                ),
                _RoomImageButton(
                  assetPath: _exitCup,
                  placement: _cupPlacement(constraints),
                  tooltip: l10n.applicationClientExitRoom,
                  semanticLabel: l10n.applicationClientExitRoom,
                  onPressed: _exitRoom,
                  useAccessibilityGuideIcon: true,
                  onSpeak: () => _speakLocalizedLabel(
                    sectionId: 'residential',
                    localizationKey: 'applicationClientExitRoom',
                    localizedText: l10n.applicationClientExitRoom,
                  ),
                ),
                if (showDaleel)
                  const Positioned(
                    top: 18,
                    left: 24,
                    child: DaleelAssistant(
                      guideAssetPath:
                          'packages/mental_smile_residential_capsule/assets/client/client_room/client_room_desktop_guide.png',
                      surveyTitle:
                          'ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ÃƒËœÃ‚Â³ÃƒËœÃ‚ÂªÃƒËœÃ‚Â¨Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â  - ÃƒËœÃ‚ÂºÃƒËœÃ‚Â±Ãƒâ„¢Ã‚ÂÃƒËœÃ‚Â© ÃƒËœÃ‚ÂµÃƒËœÃ‚Â¯Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Å¡Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â Ãƒâ„¢Ã¢â‚¬Å¾',
                      sections: DaleelAssistantSurvey.clientRoomSections,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _assetFor(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    if (width < 700 || (isPortrait && width < 900)) return _mobile;
    if (width < 1100) return _tablet;
    return _desktop;
  }

  _RoomPlacement _cupPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final size = (width * (isMobile ? 0.105 : 0.072)).clamp(58.0, 116.0);
    return _RoomPlacement(
      width: size,
      height: size,
      left: width * (isMobile ? 0.68 : 0.58),
      top: height * (isMobile ? 0.68 : 0.77),
    );
  }

  _RoomPlacement _youtubePlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final size = (width * (isMobile ? 0.24 : 0.16)).clamp(150.0, 270.0);
    final centerX = width * 0.47;
    final centerY = height * (isMobile ? 0.52 : 0.61);
    return _RoomPlacement(
      width: size,
      height: size,
      left: centerX - size / 2,
      top: centerY - size / 2,
    );
  }

  _RoomPlacement _monitorPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return _RoomPlacement(
      width: width * (isMobile ? 0.31 : 0.20),
      height: height * (isMobile ? 0.13 : 0.19),
      left: width * (isMobile ? 0.66 : 0.72),
      top: height * (isMobile ? 0.495 : 0.45),
    );
  }

  _RoomPlacement _photoButtonPlacement(_RoomPlacement monitor) {
    final size = (monitor.width * 0.58).clamp(82.0, 160.0);
    return _RoomPlacement(
      width: size,
      height: size,
      left: monitor.left! + (monitor.width - size) / 2,
      top: monitor.top! + (monitor.height - size) / 2,
    );
  }

  _RoomPlacement _personalLinksCardPlacement(BoxConstraints constraints) {
    return _wallCardPlacement(
      constraints,
      desktopCenter: 0.2895,
      mobileLeft: 0.20,
    );
  }

  _RoomPlacement _personalToolsCardPlacement(BoxConstraints constraints) {
    return _wallCardPlacement(
      constraints,
      desktopCenter: 0.3915,
      mobileLeft: 0.37,
    );
  }

  _RoomPlacement _suggestionsCardPlacement(BoxConstraints constraints) {
    return _wallCardPlacement(
      constraints,
      desktopCenter: 0.5005,
      mobileLeft: 0.54,
    );
  }

  _RoomPlacement _communityToolsCardPlacement(BoxConstraints constraints) {
    return _wallCardPlacement(
      constraints,
      desktopCenter: 0.6085,
      mobileLeft: 0.71,
    );
  }

  _RoomPlacement _checkinCardPlacement(BoxConstraints constraints) {
    return _wallCardPlacement(
      constraints,
      desktopCenter: 0.7175,
      mobileLeft: 0.82,
    );
  }

  _RoomPlacement _wallCardPlacement(
    BoxConstraints constraints, {
    required double desktopCenter,
    required double mobileLeft,
  }) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final cardWidth = width * (isMobile ? 0.19 : 0.106);
    final cardHeight = height * (isMobile ? 0.087 : 0.205);
    return _RoomPlacement(
      width: cardWidth,
      height: cardHeight,
      left: isMobile
          ? width * mobileLeft
          : width * desktopCenter - cardWidth / 2,
      top: height * (isMobile ? 0.205 : 0.115),
    );
  }

  _RoomPlacement _featherToolPlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    final target = (width * (isMobile ? 0.16 : 0.07))
        .clamp(86.0, 112.0)
        .toDouble();
    return _RoomPlacement(
      width: target,
      height: target,
      left: width * (isMobile ? 0.235 : 0.30),
      top: height * (isMobile ? 0.675 : 0.755),
    );
  }

  double _featherToolImageSize(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return (width * (isMobile ? 0.12 : 0.047)).clamp(68.0, 82.0).toDouble();
  }

  _RoomPlacement _notebookMessagePlacement(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    final isMobile = width < 700 || isPortrait;
    return _RoomPlacement(
      width: width * (isMobile ? 0.38 : 0.29),
      height: height * (isMobile ? 0.11 : 0.12),
      left: width * (isMobile ? 0.27 : 0.325),
      top: height * (isMobile ? 0.745 : 0.795),
    );
  }

  Future<void> _openMotivationalSentenceSelector(
    ResidentialLocalizations l10n,
  ) async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.notebookOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'FeatherNotebookButton',
      action: 'open_notebook_selector',
    );
    final message = await showDialog<String>(
      context: context,
      builder: (context) => _buildMotivationalSentenceSelector(context, l10n),
    );
    if (!mounted || message == null) return;
    setState(() {
      _selectedNotebookMessage = message;
    });
    unawaited(_sessionStore.saveSelectedNote(message));
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.motivationSelect,
      sourceScreen: 'Client Room',
      sourceWidget: 'MotivationalSentenceSelector',
      action: 'select_message',
    );
  }

  void _openCheckin() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.checkinTap,
      sourceScreen: 'Client Room',
      sourceWidget: 'CheckinCard',
      action: 'navigate_checkin',
    );
    Navigator.of(context).pushNamed(
      Routes.accessibilityCheckin,
      arguments: {
        'returnRoute': Routes.clientRoom,
        'supportSpaceEnabled': true,
      },
    );
  }

  void _openCommunityTools() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.communityToolsTap,
      sourceScreen: 'Client Room',
      sourceWidget: 'CommunityToolsCard',
      action: 'navigate_community_tools',
    );
    Navigator.of(context).pushNamed(Routes.accessibilityCommunityTools);
  }

  void _openSuggestions() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.suggestionsTap,
      sourceScreen: 'Client Room',
      sourceWidget: 'SuggestionsCard',
      action: 'navigate_suggestions',
    );
    Navigator.of(context).pushNamed(Routes.accessibilitySuggestions);
  }

  Future<void> _speakLocalizedLabel({
    String sectionId = 'residential',
    required String localizationKey,
    required String localizedText,
  }) {
    if (localizedText.trim().isEmpty) {
      return Future<void>.value();
    }
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.listenSupportPlay,
      sourceScreen: 'Client Room',
      sourceWidget: 'AccessibilityGuideIcon',
      action: 'request_audio_support',
    );
    return ResidentialSpeechGenerator.instance.speak(
      context,
      ResidentialSpeechNode(
        sectionId: sectionId,
        localizationKey: localizationKey,
        localizedText: localizedText,
      ),
    );
  }

  void _showPersonalToolsDialog(ResidentialLocalizations l10n) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.localToolsOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'PersonalToolsCard',
      action: 'open_tools_dialog',
    );
    _showLocalInformationDialog(
      l10n: l10n,
      visualMarker: 'ÃƒÂ°Ã…Â¸Ã‚Â§Ã‚Â°',
      title: l10n.applicationClientToolsTitle,
      message:
          'Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â°Ãƒâ„¢Ã¢â‚¬Â¡ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â³ÃƒËœÃ‚Â§ÃƒËœÃ‚Â­ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â®ÃƒËœÃ‚ÂµÃƒËœÃ‚ÂµÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â£ÃƒËœÃ‚Â¯Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚ÂªÃƒâ„¢Ã†â€™ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â´ÃƒËœÃ‚Â®ÃƒËœÃ‚ÂµÃƒâ„¢Ã…Â ÃƒËœÃ‚Â©. Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ ÃƒËœÃ‚ÂªÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¬ÃƒËœÃ‚Â¯ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹ÃƒËœÃ‚ÂªÃƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â§ ÃƒËœÃ‚Â¨ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â¯.',
    );
  }

  Future<void> _openLinksDirectory(ResidentialLocalizations l10n) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.linksDirectoryOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'PersonalLinksCard',
      action: 'open_links_directory',
    );
    return showDialog<void>(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFFFFF1D0),
          title: _DialogSpeakableTitle(
            visualMarker: 'ÃƒÂ°Ã…Â¸Ã¢â‚¬ÂÃ¢â‚¬â€',
            title: l10n.applicationClientLinksTitle,
            onSpeak: () => _speakLocalizedLabel(
              localizationKey: 'applicationClientLinksTitle',
              localizedText: l10n.applicationClientLinksTitle,
            ),
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.applicationClientDialogLinksSectionHint,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF3A2A18),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (final category in _linkCategories(l10n))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => _openLinkCategory(category, l10n),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF1D5F63),
                            side: const BorderSide(color: Color(0xFFB98732)),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                category.visualMarker,
                                semanticsLabel: '',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  category.titleEn == null
                                      ? category.title
                                      : '${category.title}\n${category.titleEn}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              AccessibilityGuideIcon(
                                size: 22,
                                tooltipIconSize: 96,
                                onPressed: () => _speakLocalizedLabel(
                                  localizationKey: category.titleKey,
                                  localizedText: category.title,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openLinkCategory(
    _QuickAccessLinkCategory category,
    ResidentialLocalizations l10n,
  ) async {
    ResidentialSignalEmitter.emit(
      signalCode: category.isSafetyGuidance
          ? ResidentialSignalCode.safetyGuidanceOpen
          : ResidentialSignalCode.linksCardOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'QuickAccessLinkCategory',
      action: 'open_link_category',
    );
    if (category.isSafetyGuidance) {
      await _openSafetyGuidanceDialog(l10n);
      return;
    }

    await showDialog<void>(
      context: context,
      builder: (categoryContext) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFFFFF1D0),
          title: _DialogSpeakableTitle(
            visualMarker: category.visualMarker,
            title: category.title,
            onSpeak: () => _speakLocalizedLabel(
              localizationKey: category.titleKey,
              localizedText: category.title,
            ),
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final link in category.links)
                    _ExternalLinkRow(
                      l10n: l10n,
                      link: link,
                      onOpen: () => _openExternalLink(link),
                      onSpeak: () => _speakLocalizedLabel(
                        localizationKey: link.speechKey,
                        localizedText: link.speechText,
                      ),
                    ),
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.of(categoryContext).pop(),
              icon: const Icon(Icons.arrow_back_rounded),
              label: Text(l10n.applicationClientDialogLinksBack),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openExternalLink(_QuickAccessExternalLink link) async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.linkOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'ExternalLinkRow',
      action: 'open_external_link',
    );
    await SafeExternalLinkLauncher.open(context, link.url);
  }

  Future<void> _openSafetyGuidanceDialog(ResidentialLocalizations l10n) {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.supportOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'SafetyGuidanceDialog',
      action: 'open_safety_guidance',
    );
    final sections = <_SafetyGuidanceSectionData>[
      _SafetyGuidanceSectionData(
        icon: Icons.verified_user_outlined,
        titleKey: 'applicationClientLinkSubSectionSafety',
        titleAr: l10n.applicationClientLinkSubSectionSafety,
        titleEn: 'Before contacting a provider',
        bodyAr:
            'ÃƒËœÃ‚ÂªÃƒËœÃ‚Â­Ãƒâ„¢Ã¢â‚¬Å¡Ãƒâ„¢Ã¢â‚¬Å¡ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¡Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂªÃƒËœÃ‚Â±ÃƒËœÃ‚Â®Ãƒâ„¢Ã…Â ÃƒËœÃ‚Âµ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¨Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â±Ãƒâ„¢Ã†â€™ÃƒËœÃ‚Â²ÃƒËœÃ…â€™ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â­ÃƒËœÃ‚ÂªÃƒâ„¢Ã‚ÂÃƒËœÃ‚Â¸ ÃƒËœÃ‚Â¨ÃƒËœÃ‚Â£Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â§ÃƒËœÃ‚ÂªÃƒâ„¢Ã‚ÂÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¡ Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã†â€™ÃƒËœÃ‚ÂªÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¨.',
        bodyEn:
            'Check identity, license, center details, and keep agreements written.',
      ),
      _SafetyGuidanceSectionData(
        icon: Icons.shield_outlined,
        titleKey: 'applicationClientLinkSubSectionSafetyRules',
        titleAr: l10n.applicationClientLinkSubSectionSafetyRules,
        titleEn: 'Safety rules',
        bodyAr:
            'Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ ÃƒËœÃ‚ÂªÃƒËœÃ‚Â´ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±Ãƒâ„¢Ã†â€™ Ãƒâ„¢Ã†â€™Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â±Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â± ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¨Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â³ÃƒËœÃ‚ÂªÃƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â­ÃƒËœÃ‚Â³ÃƒËœÃ‚Â§ÃƒËœÃ‚Â³ÃƒËœÃ‚Â© Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã…Â  Ãƒâ„¢Ã¢â‚¬Å¡Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â©.',
        bodyEn:
            'Do not share passwords, financial data, or sensitive documents in public channels.',
      ),
      _SafetyGuidanceSectionData(
        icon: Icons.support_agent_rounded,
        titleKey: 'applicationClientLinkSubSectionPlatformContact',
        titleAr: l10n.applicationClientLinkSubSectionPlatformContact,
        titleEn: 'When to contact the platform',
        bodyAr:
            'ÃƒËœÃ‚ÂªÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚ÂµÃƒâ„¢Ã¢â‚¬Å¾ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Â§ ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚Â¯ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¬Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¯ ÃƒËœÃ‚Â¥ÃƒËœÃ‚Â³ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¡ÃƒËœÃ‚Â©ÃƒËœÃ…â€™ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚ÂªÃƒËœÃ‚Â­ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ…â€™ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¶Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â©ÃƒËœÃ…â€™ ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â³Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â¡ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â³ÃƒËœÃ‚ÂªÃƒËœÃ‚Â®ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â¦ Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã¢â‚¬Â ÃƒËœÃ‚ÂµÃƒËœÃ‚Â©.',
        bodyEn:
            'Contact us for abuse, impersonation, misleading information, or platform misuse.',
      ),
      _SafetyGuidanceSectionData(
        icon: Icons.account_balance_outlined,
        titleKey: 'applicationClientLinkSubSectionOfficialAuthorities',
        titleAr: l10n.applicationClientLinkSubSectionOfficialAuthorities,
        titleEn: 'When to contact official authorities',
        bodyAr:
            'Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã…Â  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚ÂªÃƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â¯Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â¯ ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ÃƒËœÃ‚Â­ÃƒËœÃ‚ÂªÃƒâ„¢Ã…Â ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã‚Â ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â®ÃƒËœÃ‚Â·ÃƒËœÃ‚Â± ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â·ÃƒËœÃ‚Â¨Ãƒâ„¢Ã…Â  ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã…Â  ÃƒËœÃ‚ÂªÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚ÂµÃƒâ„¢Ã¢â‚¬Å¾ Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â§ÃƒËœÃ‚Âª ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â±ÃƒËœÃ‚Â³Ãƒâ„¢Ã¢â‚¬Â¦Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â© Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã‹â€ ÃƒËœÃ‚Â±Ãƒâ„¢Ã¢â‚¬Â¹ÃƒËœÃ‚Â§.',
        bodyEn:
            'For threats, fraud, violence, or medical/legal danger, contact official authorities immediately.',
      ),
      _SafetyGuidanceSectionData(
        icon: Icons.info_outline_rounded,
        titleKey: 'applicationClientLinkSubSectionNotice',
        titleAr: l10n.applicationClientLinkSubSectionNotice,
        titleEn: 'Important notice',
        bodyAr:
            'Mental Smile Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â¯ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Â¦ Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã¢â‚¬Â¦ÃƒËœÃ‚Â¹ÃƒËœÃ‚Â±Ãƒâ„¢Ã‚ÂÃƒËœÃ‚Â© Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§Ãƒâ„¢Ã†â€™ÃƒËœÃ‚ÂªÃƒËœÃ‚Â´ÃƒËœÃ‚Â§Ãƒâ„¢Ã‚Â Ãƒâ„¢Ã‚ÂÃƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â·ÃƒËœÃ…â€™ Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Å¾Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â³ÃƒËœÃ‚Âª ÃƒËœÃ‚Â¬Ãƒâ„¢Ã¢â‚¬Â¡ÃƒËœÃ‚Â© ÃƒËœÃ‚Â¹Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â§ÃƒËœÃ‚Â¬ ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â·Ãƒâ„¢Ã‹â€ ÃƒËœÃ‚Â§ÃƒËœÃ‚Â±ÃƒËœÃ‚Â¦ ÃƒËœÃ‚Â£Ãƒâ„¢Ã‹â€  ÃƒËœÃ‚Â³Ãƒâ„¢Ã¢â‚¬Å¾ÃƒËœÃ‚Â·ÃƒËœÃ‚Â© Ãƒâ„¢Ã¢â‚¬Å¡ÃƒËœÃ‚Â§Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã‹â€ Ãƒâ„¢Ã¢â‚¬Â Ãƒâ„¢Ã…Â ÃƒËœÃ‚Â©.',
        bodyEn:
            'Mental Smile supports knowledge and discovery only. It is not therapy, emergency, or legal authority.',
      ),
    ];

    return showDialog<void>(
      context: context,
      builder: (dialogContext) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFFFFF1D0),
          title: _DialogSpeakableTitle(
            visualMarker: 'ÃƒÂ°Ã…Â¸Ã¢â‚¬ÂºÃ‚Â¡ÃƒÂ¯Ã‚Â¸Ã‚Â',
            title: l10n.applicationClientLinkCategorySafety,
            onSpeak: () => _speakLocalizedLabel(
              localizationKey: 'applicationClientLinkCategorySafety',
              localizedText: l10n.applicationClientLinkCategorySafety,
            ),
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 660),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Safety & Complaint Guidance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7A4A00),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 14),
                  for (final section in sections)
                    _SafetyGuidanceSection(
                      data: section,
                      onSpeak: () => _speakLocalizedLabel(
                        localizationKey: section.titleKey,
                        localizedText: section.titleAr,
                      ),
                    ),
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.of(dialogContext).pop(),
              icon: const Icon(Icons.check_circle_outline),
              label: Text(l10n.applicationClientDialogOk),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLocalInformationDialog({
    required ResidentialLocalizations l10n,
    required String visualMarker,
    required String title,
    required String message,
  }) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFFFFF1D0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                visualMarker,
                semanticsLabel: '',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF7A4A00),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              AccessibilityGuideIcon(
                size: 22,
                tooltipIconSize: 96,
                onPressed: () => _speakLocalizedLabel(
                  localizationKey: 'applicationClientToolsTitle',
                  localizedText: title,
                ),
              ),
            ],
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF3A2A18),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.of(dialogContext).pop(),
              icon: const Icon(Icons.check_circle_outline),
              label: Text(l10n.applicationClientDialogOk),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMotivationalSentenceSelector(
    BuildContext context,
    ResidentialLocalizations l10n,
  ) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: const Color(0xFFFFF1D0),
        title: Text(
          l10n.applicationClientDialogSelectMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF7A4A00),
            fontWeight: FontWeight.w800,
          ),
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.applicationClientDialogSelectMessageHint,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF3A2A18),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                for (final message in _notebookMessages(l10n))
                  _MessageDialogOption(
                    text: message.text,
                    onPressed: () => Navigator.of(context).pop(message.text),
                    onSpeak: () => _speakLocalizedLabel(
                      localizationKey: message.key,
                      localizedText: message.text,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openYoutube() async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.youtubeOpen,
      sourceScreen: 'Client Room',
      sourceWidget: 'YouTubeButton',
      action: 'open_external_youtube',
    );
    await SafeExternalLinkLauncher.open(context, _youtubeUrl);
  }

  Future<void> _pickTemporaryPhoto() async {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.temporaryPhotoTap,
      sourceScreen: 'Client Room',
      sourceWidget: 'TemporaryPhotoButton',
      action: 'open_image_picker',
    );
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    if (!mounted) return;
    setState(() {
      _selectedPhotoBytes = bytes;
    });
    unawaited(_sessionStore.saveClientImageReference(picked.path));
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.imageUpload,
      sourceScreen: 'Client Room',
      sourceWidget: 'TemporaryPhotoButton',
      action: 'local_image_selected',
    );
  }

  void _exitRoom() {
    ResidentialSignalEmitter.emit(
      signalCode: ResidentialSignalCode.exit,
      sourceScreen: 'Client Room',
      sourceWidget: 'ExitCupButton',
      action: 'exit_to_residential_portal',
    );
    setState(() {
      _selectedPhotoBytes = null;
      _selectedNotebookMessage = null;
    });
    unawaited(_sessionStore.clearSession());
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.residentialExitSocialLinks,
      (route) => false,
    );
  }
}

class _RoomPlacement {
  const _RoomPlacement({
    required this.width,
    required this.height,
    this.left,
    this.top,
  });

  final double width;
  final double height;
  final double? left;
  final double? top;
}

class _ResidentialNotebookMessage {
  const _ResidentialNotebookMessage({required this.key, required this.text});

  final String key;
  final String text;
}

class _MonitorPhoto extends StatelessWidget {
  const _MonitorPhoto({required this.placement, required this.bytes});

  final _RoomPlacement placement;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.memory(bytes, fit: BoxFit.contain),
      ),
    );
  }
}

class _NotebookMessage extends StatelessWidget {
  const _NotebookMessage({required this.placement, required this.message});

  final _RoomPlacement placement;
  final String message;

  @override
  Widget build(BuildContext context) {
    final fontSize = (placement.width * 0.052).clamp(17.0, 22.0).toDouble();
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            message,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF6B3F16),
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              height: 1.12,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageDialogOption extends StatelessWidget {
  const _MessageDialogOption({
    required this.text,
    required this.onPressed,
    required this.onSpeak,
  });

  final String text;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF1D5F63),
            side: const BorderSide(color: Color(0x881D5F63)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ÃƒÂ°Ã…Â¸Ã…â€™Ã‚Â¿', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              AccessibilityGuideIcon(
                size: 20,
                tooltipIconSize: 96,
                onPressed: onSpeak,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoomImageButton extends StatelessWidget {
  const _RoomImageButton({
    required this.assetPath,
    required this.placement,
    required this.tooltip,
    required this.semanticLabel,
    required this.onPressed,
    required this.onSpeak,
    this.useAccessibilityGuideIcon = true,
  });

  final String assetPath;
  final _RoomPlacement placement;
  final String tooltip;
  final String semanticLabel;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;
  final bool useAccessibilityGuideIcon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: semanticLabel,
        child: Tooltip(
          message: tooltip,
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onPressed,
                child: Image.asset(assetPath, fit: BoxFit.contain),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: useAccessibilityGuideIcon
                    ? AccessibilityGuideIcon(onPressed: onSpeak)
                    : AccessibilityGuideIcon(
                        size: 22,
                        tooltipIconSize: 96,
                        onPressed: onSpeak,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoomHoverImageButton extends StatefulWidget {
  const _RoomHoverImageButton({
    required this.assetPath,
    required this.placement,
    required this.tooltip,
    required this.semanticLabel,
    required this.imageSize,
    required this.onPressed,
    required this.onSpeak,
  });

  final String assetPath;
  final _RoomPlacement placement;
  final String tooltip;
  final String semanticLabel;
  final double imageSize;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  State<_RoomHoverImageButton> createState() => _RoomHoverImageButtonState();
}

class _RoomHoverImageButtonState extends State<_RoomHoverImageButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.placement.left,
      top: widget.placement.top,
      width: widget.placement.width,
      height: widget.placement.height,
      child: Semantics(
        button: true,
        label: widget.semanticLabel,
        child: Tooltip(
          message: widget.tooltip,
          child: Stack(
            fit: StackFit.expand,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _isHovering = true),
                onExit: (_) => setState(() => _isHovering = false),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: widget.onPressed,
                  child: Center(
                    child: AnimatedScale(
                      scale: _isHovering ? 1.08 : 1.0,
                      duration: const Duration(milliseconds: 140),
                      curve: Curves.easeOut,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFFFFE4A3,
                              ).withValues(alpha: _isHovering ? 0.44 : 0.22),
                              blurRadius: _isHovering ? 18 : 10,
                              spreadRadius: _isHovering ? 2 : 1,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          widget.assetPath,
                          width: widget.imageSize,
                          height: widget.imageSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: AccessibilityGuideIcon(onPressed: widget.onSpeak),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAccessWallCard extends StatelessWidget {
  const _QuickAccessWallCard({
    required this.assetPath,
    required this.placement,
    required this.semanticLabel,
    required this.onPressed,
    required this.onSpeak,
  });

  final String assetPath;
  final _RoomPlacement placement;
  final String semanticLabel;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    final imageSize =
        ((placement.width < placement.height
                    ? placement.width
                    : placement.height) *
                0.86)
            .clamp(92.0, 168.0)
            .toDouble();
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: semanticLabel,
        child: Tooltip(
          message: semanticLabel,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onPressed,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Image.asset(
                    assetPath,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: AccessibilityGuideIcon(size: 24, onPressed: onSpeak),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickAccessLinkCategory {
  const _QuickAccessLinkCategory({
    required this.titleKey,
    required this.title,
    required this.visualMarker,
    required this.links,
    this.titleEn,
    this.isSafetyGuidance = false,
  });

  final String titleKey;
  final String title;
  final String? titleEn;
  final String visualMarker;
  final List<_QuickAccessExternalLink> links;
  final bool isSafetyGuidance;
}

class _QuickAccessExternalLink {
  const _QuickAccessExternalLink({
    required this.speechKey,
    required this.speechText,
    required this.title,
    required this.description,
    required this.url,
  });

  final String speechKey;
  final String speechText;
  final String title;
  final String description;
  final String url;
}

class _SafetyGuidanceSectionData {
  const _SafetyGuidanceSectionData({
    required this.icon,
    required this.titleKey,
    required this.titleAr,
    required this.titleEn,
    required this.bodyAr,
    required this.bodyEn,
  });

  final IconData icon;
  final String titleKey;
  final String titleAr;
  final String titleEn;
  final String bodyAr;
  final String bodyEn;
}

class _SafetyGuidanceSection extends StatelessWidget {
  const _SafetyGuidanceSection({required this.data, required this.onSpeak});

  final _SafetyGuidanceSectionData data;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x167A4A00),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0x88B98732)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(data.icon, color: const Color(0xFF7A4A00), size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${data.titleAr}\n${data.titleEn}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF7A4A00),
                    fontWeight: FontWeight.w900,
                    height: 1.35,
                  ),
                ),
              ),
              AccessibilityGuideIcon(
                size: 22,
                tooltipIconSize: 96,
                onPressed: onSpeak,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${data.bodyAr}\n${data.bodyEn}',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF3A2A18),
              fontWeight: FontWeight.w600,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _DialogSpeakableTitle extends StatelessWidget {
  const _DialogSpeakableTitle({
    required this.visualMarker,
    required this.title,
    required this.onSpeak,
  });

  final String visualMarker;
  final String title;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          visualMarker,
          semanticsLabel: '',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF7A4A00),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        AccessibilityGuideIcon(
          size: 22,
          tooltipIconSize: 96,
          onPressed: onSpeak,
        ),
      ],
    );
  }
}

class _ExternalLinkRow extends StatelessWidget {
  const _ExternalLinkRow({
    required this.l10n,
    required this.link,
    required this.onOpen,
    required this.onSpeak,
  });

  final ResidentialLocalizations l10n;
  final _QuickAccessExternalLink link;
  final VoidCallback onOpen;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0x1A7A4A00),
          border: Border.all(color: const Color(0x88B98732)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            link.title,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color(0xFF7A4A00),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        AccessibilityGuideIcon(
                          size: 22,
                          tooltipIconSize: 96,
                          onPressed: onSpeak,
                        ),
                      ],
                    ),
                    Text(
                      link.description,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF3A2A18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: onOpen,
                icon: const Icon(Icons.open_in_new_rounded),
                label: Text(l10n.applicationClientDialogLinksOpen),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1D5F63),
                  side: const BorderSide(color: Color(0xFF1D5F63)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
