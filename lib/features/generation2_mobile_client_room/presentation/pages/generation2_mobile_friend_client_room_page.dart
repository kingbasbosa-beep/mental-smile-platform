import 'package:flutter/material.dart';
import 'package:mental_smile_os/l10n/residential/residential_localizations.dart';
import 'package:mental_smile_os/shared/generation2_mobile/generation2_mobile_room_scaffold.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class Generation2MobileFriendClientRoomPage extends StatelessWidget {
  const Generation2MobileFriendClientRoomPage({super.key});

  static const List<String> normalClientDesktopCardTitles = [
    'طمّنا عليك',
    'تطبيقات وأدوات',
    'شاركنا باقتراح',
    'أدواتك',
    'لينكاتك',
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
        guideAssetPath: 'assets/branding/guides/client_friend_mobile_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro:
            'ساعدنا في تطوير شاشة صديقي العميل لتصبح أكثر راحة وسهولة في الاستخدام.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        sections: DaleelAssistantSurvey.clientFriendMobileSections,
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تحسين تجربة صديقي العميل...',
      ),
    );
  }
}
