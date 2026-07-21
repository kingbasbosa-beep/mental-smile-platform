import 'package:flutter/material.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

class DaleelAssistant extends StatelessWidget {
  const DaleelAssistant({
    super.key,
    required this.guideAssetPath,
    required this.surveyTitle,
    required this.sections,
    this.surveyIntro,
    this.extraTextFields = const [],
    this.suggestionsTitle = 'اقتراحاتك تهمنا',
    this.suggestionsLabel,
    this.suggestionsPlaceholder =
        'اكتب أي ملاحظة أو اقتراح يساعدنا نطوّر الغرفة...',
    this.iconOnly = false,
  });

  final String guideAssetPath;
  final String surveyTitle;
  final List<DaleelSurveySectionData> sections;
  final String? surveyIntro;
  final List<DaleelSurveyTextFieldData> extraTextFields;
  final String suggestionsTitle;
  final String? suggestionsLabel;
  final String suggestionsPlaceholder;
  final bool iconOnly;

  void _openDaleel(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.58),
      isScrollControlled: true,
      builder: (sheetContext) => _DaleelHomeSheet(
        parentContext: context,
        guideAssetPath: guideAssetPath,
        surveyTitle: surveyTitle,
        sections: sections,
        surveyIntro: surveyIntro,
        extraTextFields: extraTextFields,
        suggestionsTitle: suggestionsTitle,
        suggestionsLabel: suggestionsLabel,
        suggestionsPlaceholder: suggestionsPlaceholder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'دليلك',
      child: Tooltip(
        message: 'دليلك',
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => _openDaleel(context),
          child: iconOnly
              ? const Padding(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.explore_outlined,
                        color: Color(0xFFFFE8A3),
                        size: 22,
                      ),
                      SizedBox(width: 5),
                      AccessibilityGuideIcon(size: 14, tooltipIconSize: 96),
                    ],
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.58),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: const Color(0xFFFFE8A3).withValues(alpha: 0.62),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFD4AF37).withValues(alpha: 0.24),
                        blurRadius: 18,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.explore_outlined,
                        color: Color(0xFFFFE8A3),
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'دليلك',
                        style: TextStyle(
                          color: Color(0xFFFFE8A3),
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(width: 7),
                      AccessibilityGuideIcon(size: 18, tooltipIconSize: 96),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class DaleelSurveySectionData {
  const DaleelSurveySectionData({
    required this.title,
    required this.questions,
  });

  final String title;
  final List<DaleelSurveyQuestionData> questions;
}

class DaleelSurveyQuestionData {
  const DaleelSurveyQuestionData({
    required this.text,
    this.options = const ['ممتاز', 'جيد', 'يحتاج تطوير'],
  });

  final String text;
  final List<String> options;
}

class DaleelSurveyTextFieldData {
  const DaleelSurveyTextFieldData({
    required this.sectionTitle,
    required this.label,
    required this.placeholder,
  });

  final String sectionTitle;
  final String label;
  final String placeholder;
}

class DaleelAssistantSurvey {
  const DaleelAssistantSurvey._();

  static const List<DaleelSurveyQuestionData> roomElementQuestions = [
    DaleelSurveyQuestionData(text: 'التصميم والمظهر'),
    DaleelSurveyQuestionData(text: 'المحتوى'),
    DaleelSurveyQuestionData(text: 'سرعة الاستجابة'),
  ];

  static const List<DaleelSurveyQuestionData> roomOverallQuestions = [
    DaleelSurveyQuestionData(text: 'الألوان والهوية'),
    DaleelSurveyQuestionData(text: 'وضوح العناصر'),
    DaleelSurveyQuestionData(text: 'سهولة الاستخدام'),
    DaleelSurveyQuestionData(text: 'سرعة الغرفة'),
  ];

  static const List<DaleelSurveySectionData> clientRoomSections = [
    DaleelSurveySectionData(
      title: 'النوتة (مفكرة العميل 1)',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة التلفزيون',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة الكمبيوتر',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'الفنجان (الخروج)',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'الكروت (الأدوات الرئيسية)',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'أيقونة الرسائل الصوتية',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'التقييم العام للغرفة',
      questions: roomOverallQuestions,
    ),
  ];

  static const List<DaleelSurveySectionData> accessibilityRoomSections = [
    DaleelSurveySectionData(
      title: 'النوتة (مفكرة العميل 1)',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة التلفزيون',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة الكمبيوتر',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'الفنجان (الخروج)',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'الكروت (الأدوات الرئيسية)',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'أيقونة الرسائل الصوتية',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'أدوات إمكانية الوصول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في أدوات إمكانية الوصول داخل الغرفة؟',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت أيقونات الرسائل الصوتية مفيدة؟',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في حجم أزرار الوصول؟',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل ساعدتك الأدوات المساعدة على استخدام التطبيق؟',
          options: ['نعم', 'جزئيًا', 'لا'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل شعرت أن الغرفة مناسبة لمختلف الاحتياجات؟',
          options: ['نعم', 'إلى حد ما', 'لا'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> specialistRoomSections = [
    DaleelSurveySectionData(
      title: 'الكروت الرئيسية',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة الكمبيوتر',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة التلفزيون',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'دفتر الملاحظات',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'زر الخروج',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'الرسائل الصوتية',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'قسم خاص بالأخصائي',
      questions: [
        DaleelSurveyQuestionData(text: 'ما رأيك في تنظيم أدوات العمل؟'),
        DaleelSurveyQuestionData(text: 'هل الوصول للمكتبة المهنية واضح؟'),
        DaleelSurveyQuestionData(
          text: 'هل الملف المهني يعرض بياناتك بشكل مناسب؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل صفحة المراكز واضحة وسهلة الوصول؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل توزيع الأدوات يساعدك أثناء العمل؟',
          options: ['نعم جدًا', 'إلى حد ما', 'يحتاج تطوير'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> centerRoomSections = [
    DaleelSurveySectionData(
      title: 'الكروت الرئيسية',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة الكمبيوتر',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'شاشة التلفزيون',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'دفتر الملاحظات',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'زر الخروج',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'الرسائل الصوتية',
      questions: roomElementQuestions,
    ),
    DaleelSurveySectionData(
      title: 'قسم خاص بالمراكز',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في تنظيم أدوات إدارة المركز؟',
        ),
        DaleelSurveyQuestionData(text: 'هل الوصول لصفحة المراكز واضح؟'),
        DaleelSurveyQuestionData(
          text: 'هل الملف المهني يعرض بيانات المركز بشكل مناسب؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل المكتبة المهنية تحتوي على مصادر مفيدة لإدارة المركز؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل الأدوات الحالية تساعد في متابعة العمل داخل المركز؟',
          options: ['نعم جدًا', 'إلى حد ما', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل توزيع الأدوات مناسب لإدارة مركز علاجي؟',
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> specialistLoginSections = [
    DaleelSurveySectionData(
      title: 'تصميم الشاشة',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في تصميم شاشة تسجيل الدخول؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل ترى أن الشاشة البسيطة (بدون خلفية كبيرة) مناسبة؟',
          options: [
            'مناسبة جدًا',
            'مناسبة',
            'أفضل وجود خلفية',
            'لا أفضل هذا التصميم',
          ],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سرعة استجابة الشاشة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'وضوح أسماء العناصر',
      questions: [
        DaleelSurveyQuestionData(text: 'عنوان الصفحة: دخول الأخصائي'),
        DaleelSurveyQuestionData(
          text: 'حقل رقم الهاتف',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'حقل كلمة المرور',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر تسجيل الدخول',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'رابط إنشاء حساب',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'خطوات تسجيل الدخول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هل خطوات تسجيل الدخول واضحة وسهلة؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'كيف تقيّم وسائل الوصول داخل شاشة تسجيل الدخول؟',
      questions: [
        DaleelSurveyQuestionData(
          text: 'أيقونات السماعات (الشرح الصوتي)',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الخط',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة استخدام الشاشة لذوي الاحتياجات الخاصة',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> centerLoginSections = [
    DaleelSurveySectionData(
      title: 'تصميم الشاشة',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في تصميم شاشة دخول المركز؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل ترى أن تصميم الشاشة بسيط وواضح؟',
          options: [
            'مناسب جدًا',
            'مناسب',
            'يحتاج بعض التحسين',
            'أفضل تصميم مختلف',
          ],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سرعة استجابة الشاشة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'وضوح عناصر الشاشة',
      questions: [
        DaleelSurveyQuestionData(text: 'عنوان الصفحة: دخول المركز'),
        DaleelSurveyQuestionData(
          text: 'حقل البريد الإلكتروني',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'حقل كلمة المرور',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر تسجيل الدخول',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'رابط إنشاء حساب',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'خطوات تسجيل الدخول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هل خطوات تسجيل الدخول واضحة وسهلة؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'كيف تقيّم وسائل الوصول داخل شاشة تسجيل الدخول؟',
      questions: [
        DaleelSurveyQuestionData(
          text: 'أيقونة الشرح الصوتي',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الخط',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة استخدام الشاشة',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> commercialAccessSections = [
    DaleelSurveySectionData(
      title: 'تصميم الشاشة',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في تصميم شاشة الاختيار؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل كان من السهل معرفة الخيار المناسب لك؟',
          options: ['سهل جدًا', 'سهل', 'مقبول', 'يحتاج توضيح أكثر'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سرعة استجابة الشاشة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'قيّم وضوح العناصر التالية',
      questions: [
        DaleelSurveyQuestionData(
          text: 'زر الأخصائي',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر المركز',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الإدارة',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الرجوع',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'تقسيم أنواع الدخول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هل تقسيم أنواع الدخول واضح؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج تحسين'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'كيف تقيّم سهولة استخدام شاشة الاختيار؟',
      questions: [
        DaleelSurveyQuestionData(
          text: 'وضوح الأزرار',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'حجم النصوص',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة الوصول إلى الخيار المطلوب',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> mobileWelcomeSections = [
    DaleelSurveySectionData(
      title: 'تصميم الشاشة',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في تصميم الشاشة الترحيبية؟',
        ),
        DaleelSurveyQuestionData(
          text: 'هل كان من السهل فهم الخيارات الموجودة في الشاشة؟',
          options: ['سهل جدًا', 'سهل', 'مقبول', 'يحتاج توضيح أكثر'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سرعة استجابة الشاشة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'قيّم وضوح عناصر الشاشة التالية',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هوية المنصة',
          options: ['واضحة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الأصدقاء (العملاء)',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الداعمين (الأخصائيين والمراكز)',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر تغيير اللغة',
          options: ['واضح', 'جيد', 'يحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'تقسيم الدخول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هل تقسيم الدخول بين العملاء والداعمين واضح؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text:
              'هل شعرت أن الشاشة الترحيبية تساعدك على اختيار المكان المناسب بسهولة؟',
          options: ['بالتأكيد', 'إلى حد كبير', 'بشكل مقبول', 'تحتاج تحسين'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'كيف تقيّم سهولة استخدام الشاشة الترحيبية؟',
      questions: [
        DaleelSurveyQuestionData(
          text: 'وضوح الأيقونات',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح النصوص',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة الوصول للعناصر',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'الشرح الصوتي (إن وجد)',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> mobileLoginSelectionSections = [
    DaleelSurveySectionData(
      title: 'القسم الأول\nالتصميم العام ووضوح اختيارات الدخول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في التصميم العام للشاشة؟',
          options: ['ممتاز', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت الصفحة سهلة الفهم من أول مرة؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ألوان الصفحة؟',
          options: ['جميلة جدًا', 'جميلة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الأصدقاء',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الداعمين',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر تغيير اللغة',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الدليل',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الشرح الصوتي',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الرجوع',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كان الفرق بين "الأصدقاء" و"الداعمين" واضحًا؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج توضيح'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل تمكنت من الوصول إلى الخيار المناسب بسرعة؟',
          options: ['دائمًا', 'غالبًا', 'أحيانًا', 'احتجت وقتًا'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سرعة استجابة الصفحة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title:
          'القسم الثاني\nتجربة الاستخدام\nنهدف إلى جعل المنصة سهلة الاستخدام للجميع.',
      questions: [
        DaleelSurveyQuestionData(
          text: 'وضوح النصوص',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الألوان والتباين',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الأيقونات والعلامات',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة الضغط على الأزرار',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'الشرح الصوتي',
          options: ['كافٍ', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'تغيير اللغة',
          options: ['واضح جدًا', 'واضح', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل وسائل المساعدة الحالية كافية؟',
          options: [
            'كافية جدًا',
            'كافية',
            'تحتاج بعض الإضافات',
            'تحتاج تطوير شامل',
          ],
        ),
        DaleelSurveyQuestionData(
          text:
              'إذا كنت تستخدم وسائل مساعدة أثناء استخدام الهاتف، هل وجدت أن الصفحة مناسبة لك؟',
          options: ['مناسبة جدًا', 'مناسبة', 'مقبولة', 'تحتاج تحسين'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData>
      clientAccountSelectionMobileSections = [
    DaleelSurveySectionData(
      title: 'التصميم',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في التصميم العام؟',
          options: ['ممتاز', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في الألوان؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في وضوح الصفحة؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'العناصر\nقيّم العناصر التالية',
      questions: [
        DaleelSurveyQuestionData(
          text: 'زر صديقي العميل',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر صديقي المميز',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الرجوع',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الدليل',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'الاستخدام',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هل تمكنت من اختيار نوع الحساب بسهولة؟',
          options: [
            'بسهولة جدًا',
            'بسهولة',
            'بعد بعض التفكير',
            'احتجت توضيحًا أكثر',
          ],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كان الفرق بين الخيارين واضحًا؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج شرحًا أكبر'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت الصفحة سريعة الاستجابة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData>
      premiumClientAccountSelectionMobileSections = [
    ...clientAccountSelectionMobileSections,
    DaleelSurveySectionData(
      title:
          'تجربة الاستخدام\nهدفنا أن تكون المنصة مناسبة لمختلف طرق الاستخدام.',
      questions: [
        DaleelSurveyQuestionData(
          text: 'وضوح النصوص',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح التباين بين الألوان',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الأيقونات والعلامات',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة الضغط على الأزرار',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'حجم الأزرار',
          options: ['مناسب جدًا', 'مناسب', 'يحتاج تكبير', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة التمييز بين الخيارين',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت وسائل المساعدة الحالية كافية؟',
          options: [
            'كافية جدًا',
            'كافية',
            'تحتاج بعض الإضافات',
            'تحتاج تطوير',
          ],
        ),
        DaleelSurveyQuestionData(
          text:
              'إذا كنت تستخدم وسائل مساعدة أثناء استخدام الهاتف، هل كانت الصفحة مناسبة لك؟',
          options: ['مناسبة جدًا', 'مناسبة', 'مقبولة', 'تحتاج تحسين'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData>
      supportersAccountSelectionMobileSections = [
    DaleelSurveySectionData(
      title: 'القسم الأول',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في التصميم العام للشاشة؟',
          options: ['ممتاز', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت الصفحة سهلة الفهم من أول مرة؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ألوان الصفحة؟',
          options: ['جميلة جدًا', 'جميلة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر أخصائيين داعمين',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر مراكز داعمة',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الرجوع',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'زر الدليل',
          options: ['واضح جدًا', 'واضح', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كان الفرق بين الأخصائيين الداعمين والمراكز الداعمة واضحًا؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج توضيح'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل تمكنت من الوصول إلى نوع الحساب المناسب بسهولة؟',
          options: [
            'بسهولة جدًا',
            'بسهولة',
            'بعد بعض التفكير',
            'احتجت توضيحًا أكثر',
          ],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سرعة استجابة الصفحة؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'بطيئة'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title:
          'القسم الثاني\nتجربة الاستخدام\nنسعى لأن تكون تجربة استخدام المنصة مريحة لجميع المستخدمين.',
      questions: [
        DaleelSurveyQuestionData(
          text: 'وضوح النصوص',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الألوان والتباين',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الأيقونات',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة الضغط على الأزرار',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'حجم الأزرار',
          options: ['مناسب جدًا', 'مناسب', 'يحتاج تكبير', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت وسائل المساعدة الحالية كافية؟',
          options: [
            'كافية جدًا',
            'كافية',
            'تحتاج بعض الإضافات',
            'تحتاج تطوير',
          ],
        ),
        DaleelSurveyQuestionData(
          text:
              'إذا كنت تستخدم وسائل مساعدة أثناء استخدام الهاتف، هل كانت الصفحة مناسبة لك؟',
          options: ['مناسبة جدًا', 'مناسبة', 'مقبولة', 'تحتاج تحسين'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> clientFriendMobileSections = [
    DaleelSurveySectionData(
      title: 'التقييم العام',
      questions: [
        DaleelSurveyQuestionData(text: 'ما رأيك في تصميم الصفحة؟'),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ألوان الصفحة؟',
          options: ['جميلة جدًا', 'جميلة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سهولة استخدام الصفحة؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'قيّم العناصر التالية',
      questions: [
        DaleelSurveyQuestionData(
          text: 'صورة الحساب',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'النوتة',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'الجمل الدافعية',
          options: ['مفيدة جدًا', 'مفيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'الكروت الدوارة',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'أدواتك',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'لينكات تهمك',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'التطبيقات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'المقترحات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'طرق التواصل',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'التنقل والمحتوى',
      questions: [
        DaleelSurveyQuestionData(
          text: 'هل كانت طريقة التنقل بين الكروت واضحة؟',
          options: ['واضحة جدًا', 'واضحة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل المحتوى المعروض مناسب لك؟',
          options: ['مناسب جدًا', 'مناسب', 'مقبول', 'يحتاج تطوير'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> premiumFriendMobileSections = [
    ...clientFriendMobileSections,
    DaleelSurveySectionData(
      title:
          'تجربة الاستخدام\nهذا القسم يساعدنا في تحسين وسائل الاستخدام داخل التطبيق.',
      questions: [
        DaleelSurveyQuestionData(
          text: 'وضوح الخطوط',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح الألوان والتباين',
          options: ['ممتاز', 'جيد', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'وضوح العلامات والأيقونات',
          options: ['واضحة جدًا', 'واضحة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة استخدام الأزرار',
          options: ['ممتازة', 'جيدة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'الشرح الصوتي',
          options: ['كافٍ', 'جيد', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'سهولة الوصول للأدوات',
          options: ['سهلة جدًا', 'سهلة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل ترى أن وسائل المساعدة الحالية كافية؟',
          options: [
            'كافية جدًا',
            'كافية',
            'تحتاج بعض الإضافات',
            'تحتاج تطوير شامل',
          ],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> specialistFriendMobileSections = [
    DaleelSurveySectionData(
      title: 'التقييم العام',
      questions: [
        DaleelSurveyQuestionData(text: 'ما رأيك في تصميم الصفحة؟'),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ألوان الصفحة؟',
          options: ['جميلة جدًا', 'جميلة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت الصفحة سهلة الاستخدام؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'قيّم وضوح عناصر الصفحة',
      questions: [
        DaleelSurveyQuestionData(
          text: 'صورة الملف المهني',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'النوتة المهنية',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'الجمل المهنية',
          options: ['مفيدة جدًا', 'مفيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'الأدوات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'لينكات تهمك',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'التطبيقات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'المقترحات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'طرق التواصل',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'الأدوات والمحتوى',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ترتيب البطاقات الدوارة؟',
          options: ['ممتاز', 'جيد', 'مقبول', 'يحتاج إعادة ترتيب'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت أدوات الصفحة مناسبة لعملك كأخصائي؟',
          options: ['مناسبة جدًا', 'مناسبة', 'مقبولة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل المحتوى يساعدك في الوصول السريع لما تحتاجه؟',
          options: ['دائمًا', 'غالبًا', 'أحيانًا', 'يحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في زر تغيير الجملة المهنية؟',
          options: ['واضح جدًا', 'واضح', 'مقبول', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في إمكانية رفع صورة الملف المهني؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'تحتاج تحسين'],
        ),
      ],
    ),
  ];

  static const List<DaleelSurveySectionData> centerFriendMobileSections = [
    DaleelSurveySectionData(
      title: 'التقييم العام',
      questions: [
        DaleelSurveyQuestionData(text: 'ما رأيك في التصميم العام للصفحة؟'),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ألوان الصفحة؟',
          options: ['جميلة جدًا', 'جميلة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل كانت الصفحة سهلة الاستخدام؟',
          options: ['سهلة جدًا', 'سهلة', 'مقبولة', 'تحتاج تبسيط'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'قيّم العناصر التالية',
      questions: [
        DaleelSurveyQuestionData(
          text: 'صورة المركز',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'النوتة التعريفية',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'الجمل التعريفية',
          options: ['مفيدة جدًا', 'مفيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'أدوات المركز',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'لينكات تهم المركز',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'التطبيقات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'المقترحات',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'طرق التواصل',
          options: ['ممتازة', 'جيدة', 'تحتاج تطوير'],
        ),
      ],
    ),
    DaleelSurveySectionData(
      title: 'التنظيم والأدوات',
      questions: [
        DaleelSurveyQuestionData(
          text: 'ما رأيك في ترتيب البطاقات الدوارة؟',
          options: ['ممتاز', 'جيد', 'مقبول', 'يحتاج إعادة ترتيب'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل تساعدك الأدوات في الوصول السريع لما يحتاجه مركزك؟',
          options: ['دائمًا', 'غالبًا', 'أحيانًا', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في إمكانية تخصيص ملف المركز؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'تحتاج تحسين'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في الجمل التعريفية الخاصة بالمركز؟',
          options: ['مناسبة جدًا', 'مناسبة', 'مقبولة', 'تحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'هل المحتوى المعروض مناسب لإدارة حضور مركزك؟',
          options: ['مناسب جدًا', 'مناسب', 'مقبول', 'يحتاج تطوير'],
        ),
        DaleelSurveyQuestionData(
          text: 'ما رأيك في سهولة الوصول إلى الأدوات والروابط؟',
          options: ['ممتازة', 'جيدة', 'مقبولة', 'تحتاج تحسين'],
        ),
      ],
    ),
  ];
}

class _DaleelHomeSheet extends StatelessWidget {
  const _DaleelHomeSheet({
    required this.parentContext,
    required this.guideAssetPath,
    required this.surveyTitle,
    required this.sections,
    required this.surveyIntro,
    required this.extraTextFields,
    required this.suggestionsTitle,
    required this.suggestionsLabel,
    required this.suggestionsPlaceholder,
  });

  final BuildContext parentContext;
  final String guideAssetPath;
  final String surveyTitle;
  final List<DaleelSurveySectionData> sections;
  final String? surveyIntro;
  final List<DaleelSurveyTextFieldData> extraTextFields;
  final String suggestionsTitle;
  final String? suggestionsLabel;
  final String suggestionsPlaceholder;

  void _openGuide(BuildContext context) {
    Navigator.of(context).pop();
    showDialog<void>(
      context: parentContext,
      builder: (dialogContext) => _DaleelGuideDialog(
        guideAssetPath: guideAssetPath,
      ),
    );
  }

  void _openSurvey(BuildContext context) {
    Navigator.of(context).pop();
    showModalBottomSheet<void>(
      context: parentContext,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.62),
      isScrollControlled: true,
      builder: (surveyContext) => _DaleelSurveySheet(
        title: surveyTitle,
        sections: sections,
        intro: surveyIntro,
        extraTextFields: extraTextFields,
        suggestionsTitle: suggestionsTitle,
        suggestionsLabel: suggestionsLabel,
        suggestionsPlaceholder: suggestionsPlaceholder,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 520),
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            decoration: BoxDecoration(
              color: const Color(0xF20A0702),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE0C174).withValues(alpha: 0.72),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.42),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _DaleelLine(
                  text: 'دليلك',
                  icon: Icons.explore_outlined,
                  fontSize: 22,
                ),
                const SizedBox(height: 16),
                _DaleelChoiceButton(
                  icon: Icons.menu_book_outlined,
                  title: 'دليل الصفحة',
                  buttonLabel: 'فتح دليل الصفحة',
                  onPressed: () => _openGuide(context),
                ),
                const SizedBox(height: 12),
                _DaleelChoiceButton(
                  icon: Icons.rate_review_outlined,
                  title: 'رأيك يهمنا',
                  buttonLabel: 'فتح الاستبيان',
                  onPressed: () => _openSurvey(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DaleelChoiceButton extends StatelessWidget {
  const _DaleelChoiceButton({
    required this.icon,
    required this.title,
    required this.buttonLabel,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.42),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFFE8A3), size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: _DaleelLine(text: title),
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFE0C174),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buttonLabel,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(width: 6),
                const AccessibilityGuideIcon(size: 18, tooltipIconSize: 96),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DaleelGuideDialog extends StatelessWidget {
  const _DaleelGuideDialog({
    required this.guideAssetPath,
  });

  final String guideAssetPath;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: const Color(0xF2070501),
        insetPadding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: const Color(0xFFE0C174).withValues(alpha: 0.76),
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120, maxHeight: 760),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: _DaleelLine(
                        text: 'دليل الغرفة',
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Color(0xFFFFE8A3),
                      ),
                    ),
                    const AccessibilityGuideIcon(size: 18, tooltipIconSize: 96),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  child: InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 4,
                    child: Center(
                      child: Image.asset(
                        guideAssetPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Padding(
                            padding: const EdgeInsets.all(28),
                            child: _DaleelLine(
                              text: 'لم يتم العثور على صورة الدليل في:\n'
                                  '$guideAssetPath',
                              fontSize: 16,
                              center: true,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaleelSurveySheet extends StatefulWidget {
  const _DaleelSurveySheet({
    required this.title,
    required this.sections,
    required this.intro,
    required this.extraTextFields,
    required this.suggestionsTitle,
    required this.suggestionsLabel,
    required this.suggestionsPlaceholder,
  });

  final String title;
  final List<DaleelSurveySectionData> sections;
  final String? intro;
  final List<DaleelSurveyTextFieldData> extraTextFields;
  final String suggestionsTitle;
  final String? suggestionsLabel;
  final String suggestionsPlaceholder;

  @override
  State<_DaleelSurveySheet> createState() => _DaleelSurveySheetState();
}

class _DaleelSurveySheetState extends State<_DaleelSurveySheet> {
  final Map<String, String> _answers = {};
  final TextEditingController _suggestionsController = TextEditingController();
  late final Map<String, TextEditingController> _extraTextControllers;

  @override
  void initState() {
    super.initState();
    _extraTextControllers = {
      for (final field in widget.extraTextFields)
        field.label: TextEditingController(),
    };
  }

  @override
  void dispose() {
    for (final controller in _extraTextControllers.values) {
      controller.dispose();
    }
    _suggestionsController.dispose();
    super.dispose();
  }

  String _keyFor(String section, String question) => '$section / $question';

  void _submitSurvey() {
    final extraText = {
      for (final field in widget.extraTextFields)
        field.label: _extraTextControllers[field.label]?.text ?? '',
    };
    debugPrint(
      'Daleel room survey: title=${widget.title}, answers=$_answers, '
      'extraText=$extraText, '
      'suggestions=${_suggestionsController.text}',
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم استقبال رأيك داخل هذه الجلسة فقط.'),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.88,
          decoration: BoxDecoration(
            color: const Color(0xFA080500),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(22),
            ),
            border: Border(
              top: BorderSide(
                color: const Color(0xFFE0C174).withValues(alpha: 0.68),
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: _DaleelLine(
                        text: widget.title,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Color(0xFFFFE8A3),
                      ),
                    ),
                    const AccessibilityGuideIcon(size: 18, tooltipIconSize: 96),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                  children: [
                    if (widget.intro != null) ...[
                      _DaleelIntroText(text: widget.intro!),
                      const SizedBox(height: 12),
                    ],
                    for (final section in widget.sections)
                      _DaleelSurveySection(
                        data: section,
                        answers: _answers,
                        keyFor: _keyFor,
                        onChanged: (key, value) {
                          setState(() {
                            _answers[key] = value;
                          });
                        },
                      ),
                    for (final field in widget.extraTextFields) ...[
                      _DaleelExtraTextField(
                        data: field,
                        controller: _extraTextControllers[field.label]!,
                      ),
                      const SizedBox(height: 12),
                    ],
                    const SizedBox(height: 8),
                    _DaleelLine(text: widget.suggestionsTitle),
                    if (widget.suggestionsLabel != null) ...[
                      const SizedBox(height: 6),
                      _DaleelLine(
                        text: widget.suggestionsLabel!,
                        color: const Color(0xFFE0C174),
                        fontSize: 14,
                      ),
                    ],
                    const SizedBox(height: 8),
                    TextField(
                      controller: _suggestionsController,
                      minLines: 3,
                      maxLines: 5,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: Color(0xFFFFE8A3)),
                      decoration: InputDecoration(
                        hintText: widget.suggestionsPlaceholder,
                        hintStyle: TextStyle(
                          color:
                              const Color(0xFFFFE8A3).withValues(alpha: 0.62),
                        ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            widthFactor: 1,
                            heightFactor: 1,
                            child: AccessibilityGuideIcon(
                              size: 18,
                              tooltipIconSize: 96,
                            ),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 42,
                          minHeight: 42,
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.045),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Color(0xFF9B6A19)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFFFE8A3),
                            width: 1.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _submitSurvey,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE0C174),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.send_rounded),
                          SizedBox(width: 8),
                          Text('إرسال الرأي'),
                          SizedBox(width: 8),
                          AccessibilityGuideIcon(
                            size: 18,
                            tooltipIconSize: 96,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaleelIntroText extends StatelessWidget {
  const _DaleelIntroText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.36),
        ),
      ),
      child: _DaleelLine(
        text: text,
        color: const Color(0xFFE0C174),
        fontSize: 14,
      ),
    );
  }
}

class _DaleelSurveySection extends StatelessWidget {
  const _DaleelSurveySection({
    required this.data,
    required this.answers,
    required this.keyFor,
    required this.onChanged,
  });

  final DaleelSurveySectionData data;
  final Map<String, String> answers;
  final String Function(String section, String question) keyFor;
  final void Function(String key, String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DaleelLine(
            text: data.title,
            fontSize: 17,
          ),
          const SizedBox(height: 10),
          for (final question in data.questions)
            _DaleelSurveyQuestion(
              question: question,
              value: answers[keyFor(data.title, question.text)],
              onChanged: (value) => onChanged(
                keyFor(data.title, question.text),
                value,
              ),
            ),
        ],
      ),
    );
  }
}

class _DaleelExtraTextField extends StatelessWidget {
  const _DaleelExtraTextField({
    required this.data,
    required this.controller,
  });

  final DaleelSurveyTextFieldData data;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0C174).withValues(alpha: 0.36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DaleelLine(
            text: data.sectionTitle,
            fontSize: 17,
          ),
          const SizedBox(height: 8),
          _DaleelLine(
            text: data.label,
            color: const Color(0xFFE0C174),
            fontSize: 14,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            minLines: 3,
            maxLines: 5,
            textDirection: TextDirection.rtl,
            style: const TextStyle(color: Color(0xFFFFE8A3)),
            decoration: InputDecoration(
              hintText: data.placeholder,
              hintStyle: TextStyle(
                color: const Color(0xFFFFE8A3).withValues(alpha: 0.62),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  widthFactor: 1,
                  heightFactor: 1,
                  child: AccessibilityGuideIcon(
                    size: 18,
                    tooltipIconSize: 96,
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 42,
                minHeight: 42,
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.045),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF9B6A19)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFFFE8A3),
                  width: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DaleelSurveyQuestion extends StatelessWidget {
  const _DaleelSurveyQuestion({
    required this.question,
    required this.value,
    required this.onChanged,
  });

  final DaleelSurveyQuestionData question;
  final String? value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DaleelLine(
            text: question.text,
            color: const Color(0xFFE0C174),
            fontSize: 14,
          ),
          const SizedBox(height: 7),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in question.options)
                ChoiceChip(
                  avatar: const AccessibilityGuideIcon(
                    size: 15,
                    tooltipIconSize: 72,
                  ),
                  label: Text(option),
                  selected: value == option,
                  onSelected: (_) => onChanged(option),
                  selectedColor: const Color(0xFFE0C174),
                  backgroundColor: Colors.black.withValues(alpha: 0.34),
                  labelStyle: TextStyle(
                    color: value == option
                        ? Colors.black
                        : const Color(0xFFFFE8A3),
                    fontWeight: FontWeight.w800,
                  ),
                  side: BorderSide(
                    color: const Color(0xFFE0C174).withValues(alpha: 0.52),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DaleelLine extends StatelessWidget {
  const _DaleelLine({
    required this.text,
    this.icon,
    this.color = const Color(0xFFFFE8A3),
    this.fontSize = 16,
    this.center = false,
  });

  final String text;
  final IconData? icon;
  final Color color;
  final double fontSize;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: center ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (icon != null) ...[
          Icon(icon, color: color, size: fontSize + 2),
          const SizedBox(width: 7),
        ],
        Flexible(
          child: Text(
            text,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
              height: 1.35,
            ),
          ),
        ),
        const SizedBox(width: 7),
        const AccessibilityGuideIcon(size: 18, tooltipIconSize: 96),
      ],
    );
  }
}
