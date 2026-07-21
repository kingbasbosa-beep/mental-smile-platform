import 'package:flutter/material.dart';
import 'package:mental_smile_residential_capsule/src/capsule/residential_capsule_routes.dart';
import 'package:mental_smile_residential_capsule/src/localization/residential/residential_localizations.dart';
import 'package:mental_smile_residential_capsule/src/generation2/shared/generation2_mobile_room_scaffold.dart';
import 'package:mental_smile_residential_capsule/src/contracts/host_widgets.dart';

class Generation2MobileClientRoomPage extends StatelessWidget {
  const Generation2MobileClientRoomPage({super.key});

  static const List<String> distinguishedAccessibilityDesktopCardTitles = [
    'Ã˜Â¨Ã™Ë†Ã˜Â§Ã˜Â¨Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â±Ã™Ë†Ã˜Â§Ã˜Â¨Ã˜Â· Ã˜Â§Ã™â€žÃ™â€¦Ã™â€¡Ã™â€¦Ã˜Â©',
    'Ã˜Â¨Ã™Ë†Ã˜Â§Ã˜Â¨Ã˜Â© Ã˜Â§Ã™â€žÃ˜Â£Ã˜Â¯Ã™Ë†Ã˜Â§Ã˜Âª Ã˜Â§Ã™â€žÃ™â€¦Ã˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã˜Â©',
    'Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’ Ã˜Â¨Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­',
    'Ã˜ÂªÃ˜Â·Ã˜Â¨Ã™Å Ã™â€šÃ˜Â§Ã˜Âª Ã™Ë†Ã˜Â£Ã˜Â¯Ã™Ë†Ã˜Â§Ã˜Âª',
    'Ã˜Â·Ã™â€¦Ã™â€˜Ã™â€ Ã˜Â§ Ã˜Â¹Ã™â€žÃ™Å Ã™Æ’',
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
            'packages/mental_smile_residential_capsule/assets/client/generation2_mobile_client_room/specialist_friend_mobile_guide.png',
        surveyTitle: 'Ã˜Â±Ã˜Â£Ã™Å Ã™Æ’ Ã™Å Ã™â€¡Ã™â€¦Ã™â€ Ã˜Â§',
        surveyIntro:
            'Ã˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã™â€ Ã˜Â§ Ã™ÂÃ™Å  Ã˜ÂªÃ˜Â·Ã™Ë†Ã™Å Ã˜Â± Ã˜Â´Ã˜Â§Ã˜Â´Ã˜Â© Ã˜ÂµÃ˜Â¯Ã™Å Ã™â€šÃ™Å  Ã˜Â§Ã™â€žÃ™â€¦Ã™â€¦Ã™Å Ã˜Â² Ã™â€žÃ˜ÂªÃ™Ë†Ã™ÂÃ™Å Ã˜Â± Ã˜Â£Ã™ÂÃ˜Â¶Ã™â€ž Ã˜ÂªÃ˜Â¬Ã˜Â±Ã˜Â¨Ã˜Â© Ã™â€¦Ã™â€¦Ã™Æ’Ã™â€ Ã˜Â©.\n\n'
            'Ã™â€žÃ™â€  Ã™Å Ã˜Â³Ã˜ÂªÃ˜ÂºÃ˜Â±Ã™â€š Ã™â€¡Ã˜Â°Ã˜Â§ Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â¨Ã™Å Ã˜Â§Ã™â€  Ã˜Â³Ã™Ë†Ã™â€° Ã˜Â¯Ã™â€šÃ™Å Ã™â€šÃ˜Â© Ã™Ë†Ã˜Â§Ã˜Â­Ã˜Â¯Ã˜Â©.',
        sections: DaleelAssistantSurvey.premiumFriendMobileSections,
        extraTextFields: [
          DaleelSurveyTextFieldData(
            sectionTitle:
                'Ã™â€¦Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â­Ã˜Â§Ã˜Âª Ã™â€žÃ˜ÂªÃ˜Â­Ã˜Â³Ã™Å Ã™â€  Ã™Ë†Ã˜Â³Ã˜Â§Ã˜Â¦Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â®Ã˜Â¯Ã˜Â§Ã™â€¦',
            label: 'Ã˜Â´Ã˜Â§Ã˜Â±Ã™Æ’Ã™â€ Ã˜Â§ Ã˜Â£Ã™ÂÃ™Æ’Ã˜Â§Ã˜Â±Ã™Æ’',
            placeholder:
                'Ã˜Â¥Ã˜Â°Ã˜Â§ Ã™Æ’Ã˜Â§Ã™â€ Ã˜Âª Ã™â€žÃ˜Â¯Ã™Å Ã™Æ’ Ã˜Â£Ã™Å  Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­Ã˜Â§Ã˜Âª Ã™â€žÃ˜ÂªÃ˜Â­Ã˜Â³Ã™Å Ã™â€  Ã™Ë†Ã˜Â³Ã˜Â§Ã˜Â¦Ã™â€ž Ã˜Â§Ã™â€žÃ˜Â§Ã˜Â³Ã˜ÂªÃ˜Â®Ã˜Â¯Ã˜Â§Ã™â€¦ Ã˜Â£Ã™Ë† Ã˜Â¥Ã˜Â¶Ã˜Â§Ã™ÂÃ˜Â© Ã˜Â£Ã˜Â¯Ã™Ë†Ã˜Â§Ã˜Âª Ã˜Â¬Ã˜Â¯Ã™Å Ã˜Â¯Ã˜Â©Ã˜Å’ Ã™Å Ã˜Â³Ã˜Â¹Ã˜Â¯Ã™â€ Ã˜Â§ Ã˜Â³Ã™â€¦Ã˜Â§Ã˜Â¹ Ã˜Â±Ã˜Â£Ã™Å Ã™Æ’.',
          ),
        ],
        suggestionsTitle: 'Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­Ã˜Â§Ã˜Âª Ã˜Â¹Ã˜Â§Ã™â€¦Ã˜Â©',
        suggestionsLabel:
            'Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­Ã˜Â§Ã˜ÂªÃ™Æ’ Ã˜ÂªÃ™â€¡Ã™â€¦Ã™â€ Ã˜Â§',
        suggestionsPlaceholder:
            'Ã˜Â§Ã™Æ’Ã˜ÂªÃ˜Â¨ Ã˜Â£Ã™Å  Ã˜Â§Ã™â€šÃ˜ÂªÃ˜Â±Ã˜Â§Ã˜Â­ Ã™Å Ã˜Â³Ã˜Â§Ã˜Â¹Ã˜Â¯Ã™â€ Ã˜Â§ Ã™ÂÃ™Å  Ã˜ÂªÃ˜Â·Ã™Ë†Ã™Å Ã˜Â± Ã˜Â´Ã˜Â§Ã˜Â´Ã˜Â© Ã˜ÂµÃ˜Â¯Ã™Å Ã™â€šÃ™Å  Ã˜Â§Ã™â€žÃ™â€¦Ã™â€¦Ã™Å Ã˜Â²...',
      ),
    );
  }
}
