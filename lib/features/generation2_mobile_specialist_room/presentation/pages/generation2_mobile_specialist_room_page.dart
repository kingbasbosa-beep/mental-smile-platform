import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/l10n/commercial/commercial_localizations.dart';
import 'package:mental_smile_os/shared/generation2_mobile/generation2_mobile_room_scaffold.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class Generation2MobileSpecialistRoomPage extends StatelessWidget {
  const Generation2MobileSpecialistRoomPage({super.key});

  static const List<String> specialistCardTitles = [
    'الملف المهني',
    'المكتبة المهنية',
    'أدوات مساعدة',
    'طمّنا عليك',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = CommercialLocalizations.of(context);
    return Generation2MobileRoomScaffold(
      cardTitles: Generation2MobileSpecialistRoomPage.specialistCardTitles,
      speech: Generation2MobileSpeechContract(
        exit: Generation2MobileSpeechNode(
          sectionId: 'commercial',
          localizationKey: 'commercialRoomExitRoomTooltip',
          localizedText: l10n.commercialRoomExitRoomTooltip,
          tooltip: l10n.commercialRoomExitRoomTooltip,
          semanticLabel: l10n.commercialRoomExitRoomTooltip,
        ),
        logo: Generation2MobileSpeechNode(
          sectionId: 'commercial',
          localizationKey: 'commercialGeneration2MobileRoomLogo',
          localizedText: l10n.commercialGeneration2MobileRoomLogo,
          tooltip: l10n.commercialGeneration2MobileRoomLogo,
          semanticLabel: l10n.commercialGeneration2MobileRoomLogo,
        ),
        image: Generation2MobileSpeechNode(
          sectionId: 'commercial',
          localizationKey: 'commercialGeneration2MobileRoomImage',
          localizedText: l10n.commercialGeneration2MobileRoomImage,
          tooltip: l10n.commercialGeneration2MobileRoomImage,
          semanticLabel: l10n.commercialGeneration2MobileRoomImage,
        ),
        message: Generation2MobileSpeechNode(
          sectionId: 'commercial',
          localizationKey: 'commercialGeneration2MobileRoomMessage',
          localizedText: l10n.commercialGeneration2MobileRoomMessage,
          tooltip: l10n.commercialGeneration2MobileRoomMessage,
          semanticLabel: l10n.commercialGeneration2MobileRoomMessage,
        ),
        carousel: Generation2MobileSpeechNode(
          sectionId: 'commercial',
          localizationKey: 'commercialGeneration2MobileRoomCards',
          localizedText: l10n.commercialGeneration2MobileRoomCards,
          tooltip: l10n.commercialGeneration2MobileRoomCards,
          semanticLabel: l10n.commercialGeneration2MobileRoomCards,
        ),
      ),
      returnRoute: Routes.generation2MobileSpecialistRoom,
      daleelAssistant: const DaleelAssistant(
        guideAssetPath:
            'assets/commercial/generation2_mobile_specialist_room/specialist_friend_mobile_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro: 'ساعدنا في تحسين شاشة صديقي للأخصائيين.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        sections: DaleelAssistantSurvey.specialistFriendMobileSections,
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تطوير شاشة صديقي للأخصائيين...',
      ),
    );
  }
}
