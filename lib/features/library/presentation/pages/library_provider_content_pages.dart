import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/library/signals/library_signal_codes.dart';
import 'package:mental_smile_os/features/library/signals/library_signal_emitter.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';

enum LibraryProviderBranchType {
  specialist,
  center,
}

class LibrarySpecialistsPage extends StatelessWidget {
  const LibrarySpecialistsPage({
    super.key,
    this.returnRoute = Routes.splash,
  });

  final String returnRoute;

  @override
  Widget build(BuildContext context) {
    LibrarySignalEmitter.emit(
      signalCode: LibrarySignalCode.specialistsBranchView,
      sourceScreen: 'Library Specialists',
      sourceWidget: 'LibrarySpecialistsPage',
      action: 'view',
    );
    return _LibraryProviderCategoryListPage(
      title: 'الأخصائيون',
      intro:
          'مسارات نشر محتوى الأخصائيين داخل مكتبة Mental Smile، حيث تظهر البطاقات المهنية كأصول محتوى قابلة للاكتشاف.',
      categories: _specialistBranches,
      returnRoute: returnRoute,
    );
  }
}

class LibraryCentersPage extends StatelessWidget {
  const LibraryCentersPage({
    super.key,
    this.returnRoute = Routes.splash,
  });

  final String returnRoute;

  @override
  Widget build(BuildContext context) {
    LibrarySignalEmitter.emit(
      signalCode: LibrarySignalCode.centersBranchView,
      sourceScreen: 'Library Centers',
      sourceWidget: 'LibraryCentersPage',
      action: 'view',
    );
    return _LibraryProviderCategoryListPage(
      title: 'المراكز والجهات',
      intro:
          'مسارات نشر محتوى المراكز والجهات داخل المكتبة، مع فصل واضح بين أنواع الجهات ومساحات عرضها المستقبلية.',
      categories: _centerBranches,
      returnRoute: returnRoute,
    );
  }
}

class LibraryProviderBranch {
  const LibraryProviderBranch({
    required this.title,
    required this.intro,
    required this.type,
    required this.icon,
  });

  final String title;
  final String intro;
  final LibraryProviderBranchType type;
  final IconData icon;
}

const List<LibraryProviderBranch> _specialistBranches = [
  LibraryProviderBranch(
    title: 'الأخصائيون النفسيون',
    intro:
        'مساحة عرض مخصصة للمحتوى المهني المرتبط بالدعم النفسي العام والتثقيف النفسي غير العلاجي.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.psychology_alt_outlined,
  ),
  LibraryProviderBranch(
    title: 'الأخصائيون الاجتماعيون',
    intro:
        'فرع محتوى يعرض بطاقات الأخصائيين الاجتماعيين وخبراتهم في الدعم المجتمعي والأسري.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.diversity_3_outlined,
  ),
  LibraryProviderBranch(
    title: 'الأخصائيون الإكلينيكيون',
    intro:
        'مسار محتوى للأخصائيين الإكلينيكيين مع إبقاء المكتبة سطح اكتشاف لا سطح تشخيص أو علاج.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.health_and_safety_outlined,
  ),
  LibraryProviderBranch(
    title: 'أخصائيو الإرشاد والمشورة الأسرية',
    intro:
        'فرع لنشر محتوى الإرشاد الأسري والمشورة العامة ضمن حدود الاكتشاف والتوعية.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.family_restroom_outlined,
  ),
  LibraryProviderBranch(
    title: 'أخصائيو علاج السلوكيات الإدمانية والتعافي',
    intro:
        'مساحة محتوى للتعريف بخبرات الدعم والتعافي والسلوكيات الإدمانية دون إدارة علاج أو جلسات.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.volunteer_activism_outlined,
  ),
  LibraryProviderBranch(
    title: 'أخصائيو تعديل السلوك والتوحد',
    intro:
        'فرع يعرض المحتوى المهني المرتبط بتعديل السلوك والتوحد وإرشاد الأسر.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.extension_outlined,
  ),
  LibraryProviderBranch(
    title: 'أخصائيو الاحتياجات الخاصة وإعادة التأهيل',
    intro:
        'مسار لاكتشاف محتوى المختصين في التأهيل والدعم الوظيفي واحتياجات الوصول.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.accessible_forward_outlined,
  ),
  LibraryProviderBranch(
    title: 'الكوتشينج والتطوير الشخصي',
    intro: 'فرع محتوى للتطوير الشخصي والكوتشينج في نطاق التوعية والنمو العام.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.trending_up_outlined,
  ),
  LibraryProviderBranch(
    title: 'مشرفو برامج الدعم والتعافي',
    intro: 'مساحة نشر لمحتوى مشرفي برامج الدعم والتعافي والأنشطة المساندة.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.groups_2_outlined,
  ),
  LibraryProviderBranch(
    title: 'المحاضرون والمدربون',
    intro:
        'فرع لعرض محتوى المحاضرين والمدربين في التوعية والتعليم والتدريب المجتمعي.',
    type: LibraryProviderBranchType.specialist,
    icon: Icons.school_outlined,
  ),
];

const List<LibraryProviderBranch> _centerBranches = [
  LibraryProviderBranch(
    title: 'مراكز علاج الإدمان وسحب السموم',
    intro:
        'مساحة محتوى للمراكز المتخصصة في التعريف بخدمات التعافي وسحب السموم كأصول معلوماتية.',
    type: LibraryProviderBranchType.center,
    icon: Icons.local_hospital_outlined,
  ),
  LibraryProviderBranch(
    title: 'مراكز إعادة التأهيل والتعافي',
    intro:
        'فرع محتوى للمراكز التي تقدم برامج إعادة التأهيل والتعافي ضمن سطح اكتشاف عام.',
    type: LibraryProviderBranchType.center,
    icon: Icons.spa_outlined,
  ),
  LibraryProviderBranch(
    title: 'مراكز الصحة النفسية',
    intro:
        'مسار عرض للمحتوى التعريفي بمراكز الصحة النفسية دون حجز أو إدارة علاج.',
    type: LibraryProviderBranchType.center,
    icon: Icons.psychology_outlined,
  ),
  LibraryProviderBranch(
    title: 'مراكز تعديل السلوك والتوحد',
    intro: 'فرع مخصص لبطاقات ومحتوى مراكز تعديل السلوك والتوحد والدعم الأسري.',
    type: LibraryProviderBranchType.center,
    icon: Icons.account_tree_outlined,
  ),
  LibraryProviderBranch(
    title: 'مراكز خدمات وتأهيل ذوي الاحتياجات الخاصة',
    intro:
        'مساحة نشر لمحتوى مراكز خدمات وتأهيل ذوي الاحتياجات الخاصة وإتاحة الوصول.',
    type: LibraryProviderBranchType.center,
    icon: Icons.accessibility_new_outlined,
  ),
  LibraryProviderBranch(
    title: 'مراكز ومكاتب الإرشاد والمشورة الأسرية',
    intro: 'فرع يعرض محتوى مراكز ومكاتب الإرشاد الأسري والمشورة العامة.',
    type: LibraryProviderBranchType.center,
    icon: Icons.home_work_outlined,
  ),
  LibraryProviderBranch(
    title: 'المراكز التعليمية والتدريبية',
    intro:
        'مسار محتوى للمراكز التعليمية والتدريبية المرتبطة بالتوعية وبناء القدرات.',
    type: LibraryProviderBranchType.center,
    icon: Icons.menu_book_outlined,
  ),
  LibraryProviderBranch(
    title: 'الجهات الحكومية',
    intro:
        'فرع محتوى للجهات الحكومية ذات الصلة بالدعم، التوعية، والخدمات العامة.',
    type: LibraryProviderBranchType.center,
    icon: Icons.account_balance_outlined,
  ),
  LibraryProviderBranch(
    title: 'الجمعيات والمؤسسات الأهلية',
    intro: 'مساحة عرض للجمعيات والمؤسسات الأهلية ومحتواها المجتمعي والتوعوي.',
    type: LibraryProviderBranchType.center,
    icon: Icons.handshake_outlined,
  ),
  LibraryProviderBranch(
    title: 'المنظمات والهيئات المحلية والدولية',
    intro:
        'فرع محتوى للمنظمات والهيئات المحلية والدولية ذات العلاقة بالوعي والدعم المجتمعي.',
    type: LibraryProviderBranchType.center,
    icon: Icons.public_outlined,
  ),
];

class _LibraryProviderCategoryListPage extends StatelessWidget {
  const _LibraryProviderCategoryListPage({
    required this.title,
    required this.intro,
    required this.categories,
    required this.returnRoute,
  });

  final String title;
  final String intro;
  final List<LibraryProviderBranch> categories;
  final String returnRoute;

  @override
  Widget build(BuildContext context) {
    return _LibraryProviderScaffold(
      child: SafeArea(
        child: Column(
          children: [
            _ProviderBackBar(
              onBack: () {
                LibrarySignalEmitter.emit(
                  signalCode: LibrarySignalCode.backTap,
                  sourceScreen: 'Library Provider Category List',
                  sourceWidget: 'ProviderBackBar',
                  action: 'back_to_library',
                );
                Navigator.of(context).pushReplacementNamed(
                  _libraryRouteName(context),
                  arguments: {'returnRoute': returnRoute},
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 4),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _BackToLibraryButton(
                      sourceScreen: 'Library Provider Category List',
                      sourceWidget: 'ProviderCategoryListBackToLibrary',
                      returnRoute: returnRoute,
                    ),
                    if (_showsProviderReturnPageButton(returnRoute))
                      _BackToReturnPageButton(returnRoute: returnRoute),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: Column(
                    children: [
                      _LibraryProviderHeader(title: title, subtitle: intro),
                      const SizedBox(height: 26),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final crossAxisCount = width < 680
                              ? 1
                              : width < 980
                                  ? 2
                                  : 3;
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: width < 680 ? 3.2 : 2.35,
                            ),
                            itemBuilder: (context, index) {
                              return _ProviderCategoryCard(
                                branch: categories[index],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LibraryProviderScaffold extends StatelessWidget {
  const _LibraryProviderScaffold({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              _libraryProviderBackgroundAsset(MediaQuery.sizeOf(context).width),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const ColoredBox(color: Color(0xFF03080D)),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.46),
                    Colors.black.withValues(alpha: 0.32),
                    Colors.black.withValues(alpha: 0.68),
                  ],
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class _LibraryProviderHeader extends StatelessWidget {
  const _LibraryProviderHeader({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 700;
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFFFFD47A),
            fontSize: compact ? 32 : 48,
            fontWeight: FontWeight.w900,
            height: 1.1,
            shadows: const [
              Shadow(color: Colors.black, blurRadius: 18),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFFE7B2),
              fontSize: compact ? 15 : 18,
              fontWeight: FontWeight.w700,
              height: 1.55,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProviderCategoryCard extends StatefulWidget {
  const _ProviderCategoryCard({required this.branch});

  final LibraryProviderBranch branch;

  @override
  State<_ProviderCategoryCard> createState() => _ProviderCategoryCardState();
}

class _ProviderCategoryCardState extends State<_ProviderCategoryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.02 : 1,
        duration: const Duration(milliseconds: 160),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF0B0804).withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: const Color(0xFFFFD98A).withValues(
                  alpha: _hovered ? 0.78 : 0.44,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE7A94C).withValues(
                    alpha: _hovered ? 0.22 : 0.10,
                  ),
                  blurRadius: _hovered ? 24 : 14,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 32),
                    child: Row(
                      children: [
                        Icon(
                          widget.branch.icon,
                          color: const Color(0xFFFFD47A),
                          size: 32,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            widget.branch.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFFFFE7B2),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PositionedDirectional(
                    top: -8,
                    end: -8,
                    child: _ProviderAudioPreviewIcon(branch: widget.branch),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProviderAudioPreviewIcon extends StatelessWidget {
  const _ProviderAudioPreviewIcon({required this.branch});

  final LibraryProviderBranch branch;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF120B05).withValues(alpha: 0.68),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.44),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AccessibilityGuideIcon(
        size: 18,
        tooltipIconSize: 74,
        onPressed: () => _showProviderCardPreview(context, branch),
      ),
    );
  }
}

void _showProviderCardPreview(
  BuildContext context,
  LibraryProviderBranch branch,
) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(22),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF080704).withValues(alpha: 0.94),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: const Color(0xFFFFD98A).withValues(alpha: 0.52),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.44),
                  blurRadius: 34,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                    color: const Color(0xFFFFE7B2),
                    tooltip: 'Close',
                  ),
                ),
                Icon(
                  branch.icon,
                  color: const Color(0xFFFFD47A),
                  size: 96,
                ),
                const SizedBox(height: 18),
                Text(
                  branch.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  branch.intro,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class FutureContentSurface extends StatelessWidget {
  const FutureContentSurface({
    super.key,
    required this.branch,
  });

  final LibraryProviderBranch branch;

  @override
  Widget build(BuildContext context) {
    final label = branch.type == LibraryProviderBranchType.specialist
        ? 'مساحة بطاقات الأخصائيين'
        : 'مساحة بطاقات المراكز والجهات';

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 320),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF070604).withValues(alpha: 0.76),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.48),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE7A94C).withValues(alpha: 0.13),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: -6,
            end: -6,
            child: _ProviderAudioPreviewIcon(branch: branch),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  branch.icon,
                  color: const Color(0xFFFFD47A),
                  size: 58,
                ),
                const SizedBox(height: 18),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFFFD47A),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'هذا الفرع جاهز لاستقبال أصول المحتوى المنشورة من المسار التجاري عند تفعيل النشر لاحقًا.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFE7B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProviderBackBar extends StatelessWidget {
  const _ProviderBackBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 16),
        child: IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color(0xFFFFE7B2),
          tooltip: 'العودة للمكتبة',
        ),
      ),
    );
  }
}

class _BackToLibraryButton extends StatelessWidget {
  const _BackToLibraryButton({
    required this.sourceScreen,
    required this.sourceWidget,
    required this.returnRoute,
  });

  final String sourceScreen;
  final String sourceWidget;
  final String returnRoute;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        LibrarySignalEmitter.emit(
          signalCode: LibrarySignalCode.backTap,
          sourceScreen: sourceScreen,
          sourceWidget: sourceWidget,
          action: 'back_to_library',
        );
        Navigator.of(context).pushReplacementNamed(
          Routes.webLibrary,
          arguments: {'returnRoute': returnRoute},
        );
      },
      icon: const Icon(Icons.local_library_outlined),
      label: const Text('Back to Library'),
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFFFE7B2),
        backgroundColor: const Color(0xFF120B05).withValues(alpha: 0.62),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(
            color: const Color(0xFFFFD98A).withValues(alpha: 0.46),
          ),
        ),
      ),
    );
  }
}

class _BackToReturnPageButton extends StatelessWidget {
  const _BackToReturnPageButton({required this.returnRoute});

  final String returnRoute;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        LibrarySignalEmitter.emit(
          signalCode: LibrarySignalCode.backTap,
          sourceScreen: 'Library Provider Category List',
          sourceWidget: 'ProviderReturnPageButton',
          action: 'back_to_return_route',
        );
        Navigator.of(context).pushNamed(returnRoute);
      },
      icon: const Icon(Icons.person_pin_circle_outlined),
      label: Text(_providerReturnPageLabel(returnRoute)),
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFFFE7B2),
        backgroundColor: const Color(0xFF120B05).withValues(alpha: 0.62),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(
            color: const Color(0xFFFFD98A).withValues(alpha: 0.46),
          ),
        ),
      ),
    );
  }
}

bool _showsProviderReturnPageButton(String returnRoute) {
  return returnRoute.trim().isNotEmpty && returnRoute != Routes.splash;
}

String _providerReturnPageLabel(String returnRoute) {
  if (returnRoute == Routes.commercialCenterRoom ||
      returnRoute == Routes.generation2MobileCenterRoom) {
    return '\u0635\u0641\u062d\u0629 \u0627\u0644\u0645\u0631\u0643\u0632';
  }
  if (returnRoute == Routes.commercialRoom ||
      returnRoute == Routes.generation2MobileSpecialistRoom) {
    return '\u0635\u0641\u062d\u0629 \u0627\u0644\u0623\u062e\u0635\u0627\u0626\u064a';
  }
  return '\u0635\u0641\u062d\u062a\u064a';
}

String _libraryProviderBackgroundAsset(double width) {
  if (width < 700) {
    return 'assets/branding/web/library/backgrounds/mobile/library_mobile_bg.png';
  }
  if (width < 1100) {
    return 'assets/branding/web/library/backgrounds/tablet/library_tablet_bg.png';
  }
  return 'assets/branding/web/library/backgrounds/desktop/library_desktop_bg.png';
}

String _libraryRouteName(BuildContext _) {
  return Routes.webLibrary;
}
