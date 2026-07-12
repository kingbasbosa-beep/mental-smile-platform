import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/generation2_mobile_client_room/presentation/pages/generation2_mobile_client_room_page.dart';
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
    return const Generation2MobileRoomScaffold(
      cardTitles:
          Generation2MobileFriendClientRoomPage.normalClientDesktopCardTitles,
      supportSpaceEnabled: true,
      daleelAssistant: DaleelAssistant(
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
