import 'package:flutter/material.dart';

enum ProviderProfileType { specialist, center }

class ProviderCategory {
  const ProviderCategory({
    required this.id,
    required this.label,
    required this.librarySectionId,
    required this.libraryLabel,
    required this.backgroundAssetPath,
    required this.icon,
  });

  final String id;
  final String label;
  final String librarySectionId;
  final String libraryLabel;
  final String backgroundAssetPath;
  final IconData icon;
}

class ProviderProfileCategoryRegistry {
  const ProviderProfileCategoryRegistry._();

  static const specialistCategories = <ProviderCategory>[
    ProviderCategory(
      id: 'psychologist',
      label: 'أخصائي نفسي',
      librarySectionId: 'specialist_psychologists',
      libraryLabel: 'الأخصائيون النفسيون',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/psychologist_specialist_background.png',
      icon: Icons.psychology_alt_outlined,
    ),
    ProviderCategory(
      id: 'social_worker',
      label: 'أخصائي اجتماعي',
      librarySectionId: 'specialist_social_workers',
      libraryLabel: 'الأخصائيون الاجتماعيون',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/social_worker_specialist_background.png',
      icon: Icons.diversity_3_outlined,
    ),
    ProviderCategory(
      id: 'clinical',
      label: 'أخصائي إكلينيكي',
      librarySectionId: 'specialist_clinical',
      libraryLabel: 'الأخصائيون الإكلينيكيون',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/clinical_specialist_background.png',
      icon: Icons.health_and_safety_outlined,
    ),
    ProviderCategory(
      id: 'family_counseling',
      label: 'أخصائي مشورة أسرية',
      librarySectionId: 'specialist_family_counseling',
      libraryLabel: 'أخصائيو الإرشاد والمشورة الأسرية',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/family_counseling_specialist_background.png',
      icon: Icons.family_restroom_outlined,
    ),
    ProviderCategory(
      id: 'addiction_behavior',
      label: 'مرشد علاج سلوكيات إدمانية',
      librarySectionId: 'specialist_addiction_behavior',
      libraryLabel: 'أخصائيو علاج السلوكيات الإدمانية والتعافي',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/addiction_behavior_specialist_background.png',
      icon: Icons.volunteer_activism_outlined,
    ),
    ProviderCategory(
      id: 'coaching',
      label: 'أخصائي كوتشينج',
      librarySectionId: 'specialist_coaching',
      libraryLabel: 'الكوتشينج والتطوير الشخصي',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/coaching_specialist_background.png',
      icon: Icons.trending_up_outlined,
    ),
    ProviderCategory(
      id: 'support_supervisor',
      label: 'مشرف برامج دعم',
      librarySectionId: 'specialist_support_supervisors',
      libraryLabel: 'مشرفو برامج الدعم والتعافي',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/support_supervisor_specialist_background.png',
      icon: Icons.groups_2_outlined,
    ),
    ProviderCategory(
      id: 'behavior_autism',
      label: 'أخصائي تعديل سلوك وتوحد',
      librarySectionId: 'specialist_behavior_autism',
      libraryLabel: 'أخصائيو تعديل السلوك والتوحد',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/behavior_autism_specialist_background.png',
      icon: Icons.extension_outlined,
    ),
    ProviderCategory(
      id: 'speech',
      label: 'أخصائي تخاطب',
      librarySectionId: 'specialist_special_needs_rehabilitation',
      libraryLabel: 'أخصائيو الاحتياجات الخاصة وإعادة التأهيل',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/speech_specialist_background.png',
      icon: Icons.accessible_forward_outlined,
    ),
    ProviderCategory(
      id: 'addiction_recovery',
      label: 'علاج السلوكيات الإدمانية',
      librarySectionId: 'specialist_addiction_recovery',
      libraryLabel: 'أخصائيو علاج السلوكيات الإدمانية والتعافي',
      backgroundAssetPath:
          'assets/commercial/specialist_category_cards/addiction_recovery_specialist_background.png',
      icon: Icons.volunteer_activism_outlined,
    ),
  ];

  static const centerCategories = <ProviderCategory>[
    ProviderCategory(
      id: 'addiction_treatment',
      label: 'مركز علاج إدمان',
      librarySectionId: 'center_addiction_detox',
      libraryLabel: 'مراكز علاج الإدمان وسحب السموم',
      backgroundAssetPath:
          'assets/commercial/center_category_cards/addiction_treatment_center_background.png',
      icon: Icons.local_hospital_outlined,
    ),
    ProviderCategory(
      id: 'mental_health',
      label: 'مركز صحة نفسية',
      librarySectionId: 'center_mental_health',
      libraryLabel: 'مراكز الصحة النفسية',
      backgroundAssetPath:
          'assets/commercial/center_category_cards/mental_health_center_background.png',
      icon: Icons.psychology_outlined,
    ),
    ProviderCategory(
      id: 'rehabilitation',
      label: 'مركز تأهيل',
      librarySectionId: 'center_rehabilitation_recovery',
      libraryLabel: 'مراكز إعادة التأهيل والتعافي',
      backgroundAssetPath:
          'assets/commercial/center_category_cards/rehabilitation_center_background.png',
      icon: Icons.spa_outlined,
    ),
    ProviderCategory(
      id: 'consulting',
      label: 'مركز استشارات',
      librarySectionId: 'center_family_counseling',
      libraryLabel: 'مراكز ومكاتب الإرشاد والمشورة الأسرية',
      backgroundAssetPath:
          'assets/commercial/center_category_cards/consulting_center_background.png',
      icon: Icons.home_work_outlined,
    ),
    ProviderCategory(
      id: 'clinic',
      label: 'عيادة',
      librarySectionId: 'center_clinics',
      libraryLabel: 'مراكز الصحة النفسية',
      backgroundAssetPath:
          'assets/commercial/center_category_cards/clinic_center_background.png',
      icon: Icons.psychology_outlined,
    ),
    ProviderCategory(
      id: 'community_center',
      label: 'مركز مجتمعي',
      librarySectionId: 'center_ngos_foundations',
      libraryLabel: 'الجمعيات والمؤسسات الأهلية',
      backgroundAssetPath:
          'assets/commercial/center_category_cards/community_center_background.png',
      icon: Icons.handshake_outlined,
    ),
  ];

  static ProviderCategory? specialistById(String id) {
    return _find(specialistCategories, id);
  }

  static ProviderCategory? centerById(String id) {
    return _find(centerCategories, id);
  }

  static bool isSpecialistCategory(String id) => specialistById(id) != null;

  static bool isCenterCategory(String id) => centerById(id) != null;

  static bool isKnownCategory(ProviderProfileType type, String id) {
    return switch (type) {
      ProviderProfileType.specialist => isSpecialistCategory(id),
      ProviderProfileType.center => isCenterCategory(id),
    };
  }

  static ProviderCategory? _find(List<ProviderCategory> values, String id) {
    for (final category in values) {
      if (category.id == id) return category;
    }
    return null;
  }
}
