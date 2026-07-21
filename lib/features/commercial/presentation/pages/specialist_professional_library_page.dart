import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_sub_page_background.dart';
import 'package:mental_smile_os/shared/links/safe_external_link_launcher.dart';

class SpecialistProfessionalLibraryPage extends StatefulWidget {
  const SpecialistProfessionalLibraryPage({super.key});

  @override
  State<SpecialistProfessionalLibraryPage> createState() =>
      _SpecialistProfessionalLibraryPageState();
}

class _SpecialistProfessionalLibraryPageState
    extends State<SpecialistProfessionalLibraryPage> {
  static const Color _gold = Color(0xFFFFE29A);

  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _filter = 'الكل';

  static const List<String> _filters = [
    'الكل',
    'عالمي',
    'مصر',
    'إدمان',
    'أطفال',
    'مقاييس',
    'أخلاقيات',
    'تدريب',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = _filteredCategories();

    return Scaffold(
      backgroundColor: Colors.black,
      body: CommercialSubPageBackground(
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                _TopBar(onBack: () => _returnToRoom(context)),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(22, 10, 22, 42),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 960),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            const _LibraryTitle(),
                            const SizedBox(height: 24),
                            _SearchField(
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() => _query = value.trim());
                              },
                            ),
                            const SizedBox(height: 16),
                            _FilterRow(
                              filters: _filters,
                              selected: _filter,
                              onSelected: (value) {
                                setState(() => _filter = value);
                              },
                            ),
                            const SizedBox(height: 24),
                            const _Disclaimer(),
                            const SizedBox(height: 22),
                            for (final category in filteredCategories) ...[
                              _CategoryAccordion(category: category),
                              const SizedBox(height: 12),
                            ],
                            if (filteredCategories.isEmpty)
                              const _EmptySearchState(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<_LibraryCategory> _filteredCategories() {
    final normalizedQuery = _query.toLowerCase();

    return _libraryCategories
        .map((category) {
          final matchesFilter =
              _filter == 'الكل' || category.tags.contains(_filter);
          if (!matchesFilter) return null;

          final links = category.links.where((link) {
            if (normalizedQuery.isEmpty) return true;
            return category.title.toLowerCase().contains(normalizedQuery) ||
                category.purpose.toLowerCase().contains(normalizedQuery) ||
                link.title.toLowerCase().contains(normalizedQuery) ||
                link.purpose.toLowerCase().contains(normalizedQuery);
          }).toList();

          if (links.isEmpty &&
              normalizedQuery.isNotEmpty &&
              !category.title.toLowerCase().contains(normalizedQuery)) {
            return null;
          }

          return category.copyWith(links: links);
        })
        .whereType<_LibraryCategory>()
        .toList();
  }

  void _returnToRoom(BuildContext context) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    navigator.pushReplacementNamed(Routes.commercialRoom);
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          IconButton(
            tooltip: 'رجوع',
            onPressed: onBack,
            icon: const Icon(
              Icons.arrow_back_rounded,
              textDirection: TextDirection.ltr,
              color: Color(0xFFFFE29A),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _LibraryTitle extends StatelessWidget {
  const _LibraryTitle();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book_outlined, color: Color(0xFFFFE29A), size: 30),
            SizedBox(width: 10),
            Text(
              'المكتبة المهنية',
              style: TextStyle(
                color: Color(0xFFFFE29A),
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.headphones, color: Color(0xFFFFE29A), size: 24),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'روابط مهنية منظمة تساعدك في المراجعة والتعلم.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFE4C678),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textDirection: TextDirection.rtl,
      style: const TextStyle(
        color: Color(0xFFFFE29A),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: const Color(0xFFFFE29A),
      decoration: InputDecoration(
        hintText: 'ابحث في المكتبة المهنية',
        hintStyle: TextStyle(
          color: const Color(0xFFE4C678).withValues(alpha: 0.72),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xFFFFE29A)),
        suffixIcon: const Icon(Icons.headphones, color: Color(0xFFFFE29A)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFFD3A13B).withValues(alpha: 0.72),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFE29A), width: 1.4),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.filters,
    required this.selected,
    required this.onSelected,
  });

  final List<String> filters;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final filter in filters)
          ChoiceChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_filterIcon(filter), size: 17),
                const SizedBox(width: 6),
                Text(filter),
                const SizedBox(width: 6),
                const Icon(Icons.headphones, size: 15),
              ],
            ),
            selected: selected == filter,
            onSelected: (_) => onSelected(filter),
            selectedColor: const Color(0xFFFFE29A),
            backgroundColor: Colors.black.withValues(alpha: 0.54),
            side: BorderSide(
              color: selected == filter
                  ? const Color(0xFFFFE29A)
                  : const Color(0xFFD3A13B).withValues(alpha: 0.58),
            ),
            labelStyle: TextStyle(
              color:
                  selected == filter ? Colors.black : const Color(0xFFFFE29A),
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }

  IconData _filterIcon(String filter) {
    switch (filter) {
      case 'عالمي':
        return Icons.public;
      case 'مصر':
        return Icons.location_city_outlined;
      case 'إدمان':
        return Icons.health_and_safety_outlined;
      case 'أطفال':
        return Icons.child_care_outlined;
      case 'مقاييس':
        return Icons.fact_check_outlined;
      case 'أخلاقيات':
        return Icons.verified_user_outlined;
      case 'تدريب':
        return Icons.school_outlined;
      default:
        return Icons.tune_outlined;
    }
  }
}

class _Disclaimer extends StatelessWidget {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.36),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: Color(0xFFFFE29A), size: 20),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'هذه روابط مهنية خارجية للمراجعة والتعلم، وليست بديلاً عن الإشراف المهني أو القوانين المحلية.',
                style: TextStyle(
                  color: Color(0xFFE4C678),
                  fontSize: 13.5,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.headphones, color: Color(0xFFFFE29A), size: 18),
          ],
        ),
      ),
    );
  }
}

class _CategoryAccordion extends StatelessWidget {
  const _CategoryAccordion({required this.category});

  final _LibraryCategory category;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        expansionTileTheme: const ExpansionTileThemeData(
          iconColor: _SpecialistProfessionalLibraryPageState._gold,
          collapsedIconColor: _SpecialistProfessionalLibraryPageState._gold,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.28),
          borderRadius: BorderRadius.circular(14),
        ),
        child: ExpansionTile(
          initiallyExpanded: category.initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
          title: Row(
            children: [
              Icon(category.icon, color: const Color(0xFFFFE29A), size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  category.title,
                  style: const TextStyle(
                    color: Color(0xFFFFE29A),
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Icon(Icons.headphones, color: Color(0xFFFFE29A), size: 19),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              category.purpose,
              style: const TextStyle(
                color: Color(0xFFE4C678),
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          children: [
            for (final link in category.links)
              _LibraryLinkRow(link: link, categoryIcon: category.icon),
          ],
        ),
      ),
    );
  }
}

class _LibraryLinkRow extends StatelessWidget {
  const _LibraryLinkRow({
    required this.link,
    required this.categoryIcon,
  });

  final _LibraryLink link;
  final IconData categoryIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF050403).withValues(alpha: 0.62),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(categoryIcon, color: const Color(0xFFFFE29A), size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      link.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFFFFE29A),
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      link.purpose,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFFE4C678),
                        fontSize: 12.5,
                        height: 1.45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.headphones, color: Color(0xFFFFE29A), size: 18),
              IconButton(
                tooltip: 'فتح الرابط',
                onPressed: () => _openExternal(context, link.url),
                icon: const Icon(
                  Icons.open_in_new,
                  color: Color(0xFFFFE29A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openExternal(BuildContext context, String url) async {
    await SafeExternalLinkLauncher.open(context, url);
  }
}

class _EmptySearchState extends StatelessWidget {
  const _EmptySearchState();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Icon(Icons.search_off_outlined, color: Color(0xFFFFE29A), size: 34),
          SizedBox(height: 12),
          Text(
            'لا توجد روابط مطابقة للبحث الحالي.',
            style: TextStyle(
              color: Color(0xFFE4C678),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LibraryCategory {
  const _LibraryCategory({
    required this.title,
    required this.purpose,
    required this.icon,
    required this.tags,
    required this.links,
    this.initiallyExpanded = false,
  });

  final String title;
  final String purpose;
  final IconData icon;
  final List<String> tags;
  final List<_LibraryLink> links;
  final bool initiallyExpanded;

  _LibraryCategory copyWith({required List<_LibraryLink> links}) {
    return _LibraryCategory(
      title: title,
      purpose: purpose,
      icon: icon,
      tags: tags,
      links: links,
      initiallyExpanded: initiallyExpanded,
    );
  }
}

class _LibraryLink {
  const _LibraryLink({
    required this.title,
    required this.purpose,
    required this.url,
  });

  final String title;
  final String purpose;
  final String url;
}

const List<_LibraryCategory> _libraryCategories = [
  _LibraryCategory(
    title: 'مراجع عالمية للصحة النفسية',
    purpose: 'بوابات مهنية تساعد في متابعة الأدلة والمعايير العامة.',
    icon: Icons.public,
    tags: ['عالمي'],
    initiallyExpanded: true,
    links: [
      _LibraryLink(
        title: 'منظمة الصحة العالمية',
        purpose: 'مدخل عالمي للصحة النفسية والسياسات والمواد المرجعية.',
        url: 'https://www.who.int/health-topics/mental-health',
      ),
      _LibraryLink(
        title: 'الجمعية الأمريكية لعلم النفس',
        purpose: 'مراجع مهنية وإرشادات نفسية وتعليم مستمر.',
        url: 'https://www.apa.org/',
      ),
      _LibraryLink(
        title: 'المعهد الوطني للصحة النفسية',
        purpose: 'معلومات بحثية ومهنية حول الاضطرابات والصحة النفسية.',
        url: 'https://www.nimh.nih.gov/',
      ),
      _LibraryLink(
        title: 'NICE Guidelines',
        purpose: 'إرشادات ممارسة مبنية على الدليل في مجالات صحية متعددة.',
        url: 'https://www.nice.org.uk/guidance',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'مراجع مصرية وتنظيمية',
    purpose: 'روابط محلية للمراجعة العامة والرجوع للجهات الرسمية.',
    icon: Icons.location_city_outlined,
    tags: ['مصر'],
    links: [
      _LibraryLink(
        title: 'وزارة الصحة والسكان المصرية',
        purpose: 'بوابة رسمية للأخبار والخدمات والمعلومات الصحية المحلية.',
        url: 'https://www.mohp.gov.eg/',
      ),
      _LibraryLink(
        title: 'الأمانة العامة للصحة النفسية وعلاج الإدمان',
        purpose: 'مدخل محلي لخدمات الصحة النفسية وعلاج الإدمان.',
        url: 'https://www.smcegy.com/',
      ),
      _LibraryLink(
        title: 'المجلس الصحي المصري',
        purpose: 'مرجع تنظيمي وتعليمي للقطاع الصحي المصري.',
        url: 'https://www.ehc.gov.eg/',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'الإدمان والتعافي',
    purpose: 'مراجع علمية ومهنية لعلاج الإدمان والتعافي والوقاية.',
    icon: Icons.health_and_safety_outlined,
    tags: ['عالمي', 'إدمان'],
    links: [
      _LibraryLink(
        title: 'NIDA',
        purpose: 'أبحاث ومراجع حول الإدمان والمواد المخدرة.',
        url: 'https://nida.nih.gov/',
      ),
      _LibraryLink(
        title: 'SAMHSA',
        purpose: 'موارد التعافي وخدمات الصحة النفسية وتعاطي المواد.',
        url: 'https://www.samhsa.gov/',
      ),
      _LibraryLink(
        title: 'UNODC',
        purpose: 'مراجع دولية عن المخدرات والجريمة والوقاية.',
        url: 'https://www.unodc.org/',
      ),
      _LibraryLink(
        title: 'NAADAC',
        purpose: 'جمعية مهنية للتدريب والأخلاقيات في إرشاد الإدمان.',
        url: 'https://www.naadac.org/',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'الأطفال والمراهقون',
    purpose: 'مراجع تساعد في متابعة دعم الأطفال والمراهقين والأسرة.',
    icon: Icons.child_care_outlined,
    tags: ['عالمي', 'أطفال'],
    links: [
      _LibraryLink(
        title: 'AACAP',
        purpose: 'مراجع مهنية للصحة النفسية للأطفال والمراهقين.',
        url: 'https://www.aacap.org/',
      ),
      _LibraryLink(
        title: 'CDC Children Mental Health',
        purpose: 'مواد توعوية ومعلومات أساسية عن صحة الأطفال النفسية.',
        url: 'https://www.cdc.gov/children-mental-health/',
      ),
      _LibraryLink(
        title: 'UNICEF Mental Health',
        purpose: 'مراجع دولية عن رفاه الأطفال والمراهقين.',
        url: 'https://www.unicef.org/mental-health',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'مقاييس وتقييمات',
    purpose: 'مداخل للمراجعة المهنية للمقاييس وأدوات التقييم.',
    icon: Icons.fact_check_outlined,
    tags: ['عالمي', 'مقاييس'],
    links: [
      _LibraryLink(
        title: 'APA Assessment Resources',
        purpose: 'مواد مهنية مرتبطة بالتقييم والمقاييس النفسية.',
        url: 'https://www.apa.org/depression-guideline/assessment',
      ),
      _LibraryLink(
        title: 'PHQ Screeners',
        purpose: 'مدخل معروف لمقاييس PHQ وGAD للاطلاع المهني.',
        url: 'https://www.phqscreeners.com/',
      ),
      _LibraryLink(
        title: 'Mental Health America Screening',
        purpose: 'مدخل عام للتوعية بالفحص النفسي الأولي.',
        url: 'https://screening.mhanational.org/',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'أخلاقيات المهنة',
    purpose: 'مراجع تساعد في مراجعة الحدود المهنية والمسؤولية الأخلاقية.',
    icon: Icons.verified_user_outlined,
    tags: ['عالمي', 'أخلاقيات'],
    links: [
      _LibraryLink(
        title: 'APA Ethics Code',
        purpose: 'مدونة أخلاقيات مهنية لعلماء النفس.',
        url: 'https://www.apa.org/ethics/code',
      ),
      _LibraryLink(
        title: 'ACA Code of Ethics',
        purpose: 'مدونة أخلاقيات للاستشارات والإرشاد المهني.',
        url: 'https://www.counseling.org/resources/ethics',
      ),
      _LibraryLink(
        title: 'NASW Code of Ethics',
        purpose: 'مدونة أخلاقيات للخدمة الاجتماعية المهنية.',
        url: 'https://www.socialworkers.org/About/Ethics/Code-of-Ethics',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'تدريب وتعليم مهني',
    purpose: 'مداخل تدريبية وتعليمية مناسبة للمراجعة المستمرة.',
    icon: Icons.school_outlined,
    tags: ['عالمي', 'تدريب'],
    links: [
      _LibraryLink(
        title: 'WHO mhGAP',
        purpose: 'مواد تدريبية للصحة النفسية في الرعاية العامة.',
        url:
            'https://www.who.int/teams/mental-health-and-substance-use/treatment-care/mental-health-gap-action-programme',
      ),
      _LibraryLink(
        title: 'OpenWHO',
        purpose: 'منصة تعليمية مفتوحة تابعة لمنظمة الصحة العالمية.',
        url: 'https://openwho.org/',
      ),
      _LibraryLink(
        title: 'APA Continuing Education',
        purpose: 'تعليم مستمر ومواد تطوير مهني.',
        url: 'https://www.apa.org/education-career/ce',
      ),
    ],
  ),
  _LibraryCategory(
    title: 'مؤتمرات وجمعيات مهنية',
    purpose: 'مداخل لمتابعة الجمعيات والفعاليات العلمية والمهنية.',
    icon: Icons.event_available_outlined,
    tags: ['عالمي', 'تدريب'],
    links: [
      _LibraryLink(
        title: 'World Psychiatric Association',
        purpose: 'جمعية عالمية ومؤتمرات ومراجع مهنية.',
        url: 'https://www.wpanet.org/',
      ),
      _LibraryLink(
        title: 'World Federation for Mental Health',
        purpose: 'شبكة عالمية للتوعية والصحة النفسية.',
        url: 'https://wfmh.global/',
      ),
      _LibraryLink(
        title: 'American Psychological Association Events',
        purpose: 'فعاليات ومؤتمرات ومواد تطوير مهني.',
        url: 'https://www.apa.org/events',
      ),
    ],
  ),
];
