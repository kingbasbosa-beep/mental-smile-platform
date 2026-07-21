import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/l10n/residential/residential_localizations.dart';
import 'package:mental_smile_os/shared/generation2_mobile/generation2_mobile_room_scaffold.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class Generation2MobileClientRoomPage extends StatelessWidget {
  const Generation2MobileClientRoomPage({super.key});

  static const List<String> distinguishedAccessibilityDesktopCardTitles = [
    'Ø¨ÙˆØ§Ø¨Ø© Ø§Ù„Ø±ÙˆØ§Ø¨Ø· Ø§Ù„Ù…Ù‡Ù…Ø©',
    'Ø¨ÙˆØ§Ø¨Ø© Ø§Ù„Ø£Ø¯ÙˆØ§Øª Ø§Ù„Ù…Ø³Ø§Ø¹Ø¯Ø©',
    'Ø´Ø§Ø±Ùƒ Ø¨Ø§Ù‚ØªØ±Ø§Ø­',
    'ØªØ·Ø¨ÙŠÙ‚Ø§Øª ÙˆØ£Ø¯ÙˆØ§Øª',
    'Ø·Ù…Ù‘Ù†Ø§ Ø¹Ù„ÙŠÙƒ',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = ResidentialLocalizations.of(context);
    return Generation2MobileRoomScaffold(
      cardTitles: Generation2MobileClientRoomPage
          .distinguishedAccessibilityDesktopCardTitles,
      speech: Generation2MobileSpeechContract(
        exit: Generation2MobileSpeechNode(
          sectionId: 'residential',
          localizationKey: 'applicationClientExitRoom',
          localizedText: l10n.applicationClientExitRoom,
          tooltip: l10n.applicationClientExitRoom,
          semanticLabel: l10n.applicationClientExitRoom,
        ),
        logo: Generation2MobileSpeechNode(
          sectionId: 'residential',
          localizationKey: 'generation2MobileRoomLogo',
          localizedText: l10n.generation2MobileRoomLogo,
          tooltip: l10n.generation2MobileRoomLogo,
          semanticLabel: l10n.generation2MobileRoomLogo,
        ),
        image: Generation2MobileSpeechNode(
          sectionId: 'residential',
          localizationKey: 'applicationClientTemporaryPhoto',
          localizedText: l10n.applicationClientTemporaryPhoto,
          tooltip: l10n.applicationClientTemporaryPhoto,
          semanticLabel: l10n.applicationClientTemporaryPhoto,
        ),
        message: Generation2MobileSpeechNode(
          sectionId: 'residential',
          localizationKey: 'applicationClientFeatherNotebook',
          localizedText: l10n.applicationClientFeatherNotebook,
          tooltip: l10n.applicationClientFeatherNotebook,
          semanticLabel: l10n.applicationClientFeatherNotebook,
        ),
        carousel: Generation2MobileSpeechNode(
          sectionId: 'residential',
          localizationKey: 'generation2MobileRoomCards',
          localizedText: l10n.generation2MobileRoomCards,
          tooltip: l10n.generation2MobileRoomCards,
          semanticLabel: l10n.generation2MobileRoomCards,
        ),
      ),
      returnRoute: Routes.generation2MobileClientRoom,
      supportSpaceEnabled: true,
      daleelAssistant: const DaleelAssistant(
        guideAssetPath:
            'assets/client/generation2_mobile_client_room/specialist_friend_mobile_guide.png',
        surveyTitle: 'Ø±Ø£ÙŠÙƒ ÙŠÙ‡Ù…Ù†Ø§',
        surveyIntro:
            'Ø³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ·ÙˆÙŠØ± Ø´Ø§Ø´Ø© ØµØ¯ÙŠÙ‚ÙŠ Ø§Ù„Ù…Ù…ÙŠØ² Ù„ØªÙˆÙÙŠØ± Ø£ÙØ¶Ù„ ØªØ¬Ø±Ø¨Ø© Ù…Ù…ÙƒÙ†Ø©.\n\n'
            'Ù„Ù† ÙŠØ³ØªØºØ±Ù‚ Ù‡Ø°Ø§ Ø§Ù„Ø§Ø³ØªØ¨ÙŠØ§Ù† Ø³ÙˆÙ‰ Ø¯Ù‚ÙŠÙ‚Ø© ÙˆØ§Ø­Ø¯Ø©.',
        sections: DaleelAssistantSurvey.premiumFriendMobileSections,
        extraTextFields: [
          DaleelSurveyTextFieldData(
            sectionTitle:
                'Ù…Ù‚ØªØ±Ø­Ø§Øª Ù„ØªØ­Ø³ÙŠÙ† ÙˆØ³Ø§Ø¦Ù„ Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù…',
            label: 'Ø´Ø§Ø±ÙƒÙ†Ø§ Ø£ÙÙƒØ§Ø±Ùƒ',
            placeholder:
                'Ø¥Ø°Ø§ ÙƒØ§Ù†Øª Ù„Ø¯ÙŠÙƒ Ø£ÙŠ Ø§Ù‚ØªØ±Ø§Ø­Ø§Øª Ù„ØªØ­Ø³ÙŠÙ† ÙˆØ³Ø§Ø¦Ù„ Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù… Ø£Ùˆ Ø¥Ø¶Ø§ÙØ© Ø£Ø¯ÙˆØ§Øª Ø¬Ø¯ÙŠØ¯Ø©ØŒ ÙŠØ³Ø¹Ø¯Ù†Ø§ Ø³Ù…Ø§Ø¹ Ø±Ø£ÙŠÙƒ.',
          ),
        ],
        suggestionsTitle: 'Ø§Ù‚ØªØ±Ø§Ø­Ø§Øª Ø¹Ø§Ù…Ø©',
        suggestionsLabel: 'Ø§Ù‚ØªØ±Ø§Ø­Ø§ØªÙƒ ØªÙ‡Ù…Ù†Ø§',
        suggestionsPlaceholder:
            'Ø§ÙƒØªØ¨ Ø£ÙŠ Ø§Ù‚ØªØ±Ø§Ø­ ÙŠØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ·ÙˆÙŠØ± Ø´Ø§Ø´Ø© ØµØ¯ÙŠÙ‚ÙŠ Ø§Ù„Ù…Ù…ÙŠØ²...',
      ),
    );
  }
}
