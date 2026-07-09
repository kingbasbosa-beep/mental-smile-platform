import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart';
import 'package:mental_smile_os/shared/guides/daleel_assistant.dart';

class Generation2MobileCenterRoomPage extends StatelessWidget {
  const Generation2MobileCenterRoomPage({super.key});

  static const List<String> centerCardTitles = [
    'ملف المركز',
    'المكتبة المهنية للمراكز',
    'أدوات مساعدة',
    'طمّنا عليك',
  ];

  @override
  Widget build(BuildContext context) {
    return const Generation2MobileRoomScaffold(
      cardTitles: Generation2MobileCenterRoomPage.centerCardTitles,
      returnRoute: Routes.generation2MobileCenterRoom,
      daleelAssistant: DaleelAssistant(
        guideAssetPath: 'assets/branding/guides/center_friend_mobile_guide.png',
        surveyTitle: 'رأيك يهمنا',
        surveyIntro:
            'ساعدنا في تطوير شاشة صديقي للمراكز لتوفير تجربة أكثر سهولة وتنظيماً.\n\n'
            'لن يستغرق هذا الاستبيان سوى دقيقة واحدة.',
        sections: DaleelAssistantSurvey.centerFriendMobileSections,
        suggestionsPlaceholder:
            'اكتب أي اقتراح يساعدنا في تطوير شاشة صديقي للمراكز...',
      ),
    );
  }
}
