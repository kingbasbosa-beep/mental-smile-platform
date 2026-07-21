import 'package:flutter/material.dart';
import 'package:mental_smile_residential_capsule/src/localization/residential/residential_localizations.dart';
import 'package:mental_smile_residential_capsule/src/generation2/shared/generation2_mobile_room_scaffold.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';

class Generation2MobileFriendClientRoomPage extends StatelessWidget {
  const Generation2MobileFriendClientRoomPage({super.key});

  static const List<String> normalClientDesktopCardTitles = [
    'Ø·Ù…Ù‘Ù†Ø§ Ø¹Ù„ÙŠÙƒ',
    'ØªØ·Ø¨ÙŠÙ‚Ø§Øª ÙˆØ£Ø¯ÙˆØ§Øª',
    'Ø´Ø§Ø±ÙƒÙ†Ø§ Ø¨Ø§Ù‚ØªØ±Ø§Ø­',
    'Ø£Ø¯ÙˆØ§ØªÙƒ',
    'Ù„ÙŠÙ†ÙƒØ§ØªÙƒ',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = ResidentialLocalizations.of(context);
    return Generation2MobileRoomScaffold(
      cardTitles:
          Generation2MobileFriendClientRoomPage.normalClientDesktopCardTitles,
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
      supportSpaceEnabled: true,
      daleelAssistant: const DaleelAssistant(
        guideAssetPath:
            'packages/mental_smile_residential_capsule/assets/branding/guides/client_friend_mobile_guide.png',
        surveyTitle: 'Ø±Ø£ÙŠÙƒ ÙŠÙ‡Ù…Ù†Ø§',
        surveyIntro:
            'Ø³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ·ÙˆÙŠØ± Ø´Ø§Ø´Ø© ØµØ¯ÙŠÙ‚ÙŠ Ø§Ù„Ø¹Ù…ÙŠÙ„ Ù„ØªØµØ¨Ø­ Ø£ÙƒØ«Ø± Ø±Ø§Ø­Ø© ÙˆØ³Ù‡ÙˆÙ„Ø© ÙÙŠ Ø§Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù….\n\n'
            'Ù„Ù† ÙŠØ³ØªØºØ±Ù‚ Ù‡Ø°Ø§ Ø§Ù„Ø§Ø³ØªØ¨ÙŠØ§Ù† Ø³ÙˆÙ‰ Ø¯Ù‚ÙŠÙ‚Ø© ÙˆØ§Ø­Ø¯Ø©.',
        sections: DaleelAssistantSurvey.clientFriendMobileSections,
        suggestionsPlaceholder:
            'Ø§ÙƒØªØ¨ Ø£ÙŠ Ø§Ù‚ØªØ±Ø§Ø­ ÙŠØ³Ø§Ø¹Ø¯Ù†Ø§ ÙÙŠ ØªØ­Ø³ÙŠÙ† ØªØ¬Ø±Ø¨Ø© ØµØ¯ÙŠÙ‚ÙŠ Ø§Ù„Ø¹Ù…ÙŠÙ„...',
      ),
    );
  }
}
