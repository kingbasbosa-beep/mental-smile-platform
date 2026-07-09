import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart';
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
    return const Generation2MobileRoomScaffold(
      cardTitles: Generation2MobileSpecialistRoomPage.specialistCardTitles,
      returnRoute: Routes.generation2MobileSpecialistRoom,
      daleelAssistant: DaleelAssistant(
        guideAssetPath:
            'assets/branding/guides/specialist_friend_mobile_guide.png',
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
