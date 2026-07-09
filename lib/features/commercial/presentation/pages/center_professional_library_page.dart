import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_sub_page_background.dart';
import 'package:url_launcher/url_launcher.dart';

class CenterProfessionalLibraryPage extends StatefulWidget {
  const CenterProfessionalLibraryPage({super.key});

  @override
  State<CenterProfessionalLibraryPage> createState() =>
      _CenterProfessionalLibraryPageState();
}

class _CenterProfessionalLibraryPageState
    extends State<CenterProfessionalLibraryPage> {
  static const Color _gold = Color(0xFFFFE29A);

  final TextEditingController _searchController = TextEditingController();
  final Set<String> _favorites = <String>{};
  String _query = '';
  String _filter = 'الكل';

  static const List<String> _filters = [
    'الكل',
    'مصر',
    'عربي',
    'اعتماد',
    'سلامة',
    'إدمان',
    'جودة',
    'تشغيل',
    'طوارئ',
    'أطفال',
    'إعاقة',
    'تدريب',
    'أبحاث',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = _filteredCategories();

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
                            const _FooterNote(),
                            const SizedBox(height: 22),
                            for (final category in categories) ...[
                              _CategoryAccordion(
                                category: category,
                                favorites: _favorites,
                                onFavorite: _toggleFavorite,
                                onCopy: _copyLink,
                              ),
                              const SizedBox(height: 12),
                            ],
                            if (categories.isEmpty) const _EmptySearchState(),
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

  List<_CenterLibraryCategory> _filteredCategories() {
    final normalizedQuery = _query.toLowerCase();

    return _centerLibraryCategories
        .map((category) {
          final matchesFilter =
              _filter == 'الكل' || category.tags.contains(_filter);
          if (!matchesFilter) return null;

          final links = category.links.where((link) {
            if (normalizedQuery.isEmpty) return true;
            return category.title.toLowerCase().contains(normalizedQuery) ||
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
        .whereType<_CenterLibraryCategory>()
        .toList();
  }

  void _toggleFavorite(String url) {
    setState(() {
      if (_favorites.contains(url)) {
        _favorites.remove(url);
      } else {
        _favorites.add(url);
      }
    });
  }

  Future<void> _copyLink(BuildContext context, String url) async {
    await Clipboard.setData(ClipboardData(text: url));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم نسخ الرابط')),
    );
  }

  void _returnToRoom(BuildContext context) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    navigator.pushReplacementNamed(Routes.commercialCenterRoom);
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
            Icon(Icons.local_library_outlined,
                color: Color(0xFFFFE29A), size: 30),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                'المكتبة المهنية للمراكز',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFE29A),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.headphones, color: Color(0xFFFFE29A), size: 24),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'مراجع تشغيلية ومهنية للمراكز العلاجية والتأهيلية والتعليمية.',
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
      case 'مصر':
        return Icons.location_city_outlined;
      case 'عربي':
        return Icons.language_outlined;
      case 'اعتماد':
      case 'جودة':
        return Icons.verified_outlined;
      case 'سلامة':
        return Icons.health_and_safety_outlined;
      case 'إدمان':
        return Icons.psychology_alt_outlined;
      case 'تشغيل':
        return Icons.settings_suggest_outlined;
      case 'طوارئ':
        return Icons.emergency_outlined;
      case 'أطفال':
        return Icons.child_care_outlined;
      case 'إعاقة':
        return Icons.accessible_forward_outlined;
      case 'تدريب':
        return Icons.school_outlined;
      case 'أبحاث':
        return Icons.science_outlined;
      default:
        return Icons.tune_outlined;
    }
  }
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

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
                'هذه مكتبة مرجعية للمراكز العلاجية والتأهيلية والتعليمية.\nقد تختلف اللوائح والمتطلبات حسب الدولة وجهة الترخيص.',
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
  const _CategoryAccordion({
    required this.category,
    required this.favorites,
    required this.onFavorite,
    required this.onCopy,
  });

  final _CenterLibraryCategory category;
  final Set<String> favorites;
  final ValueChanged<String> onFavorite;
  final Future<void> Function(BuildContext context, String url) onCopy;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        expansionTileTheme: const ExpansionTileThemeData(
          iconColor: _CenterProfessionalLibraryPageState._gold,
          collapsedIconColor: _CenterProfessionalLibraryPageState._gold,
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
          children: [
            for (final link in category.links)
              _LibraryLinkRow(
                link: link,
                categoryIcon: category.icon,
                isFavorite: favorites.contains(link.url),
                onFavorite: () => onFavorite(link.url),
                onCopy: () => onCopy(context, link.url),
              ),
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
    required this.isFavorite,
    required this.onFavorite,
    required this.onCopy,
  });

  final _CenterLibraryLink link;
  final IconData categoryIcon;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.62),
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
              const SizedBox(width: 8),
              const Icon(Icons.headphones, color: Color(0xFFFFE29A), size: 18),
              IconButton(
                tooltip: isFavorite ? 'إزالة من المفضلة' : 'إضافة للمفضلة',
                onPressed: onFavorite,
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFE29A),
                ),
              ),
              IconButton(
                tooltip: 'نسخ الرابط',
                onPressed: onCopy,
                icon: const Icon(Icons.copy, color: Color(0xFFFFE29A)),
              ),
              IconButton(
                tooltip: 'فتح الرابط',
                onPressed: () => _openExternal(link.url),
                icon: const Icon(Icons.open_in_new, color: Color(0xFFFFE29A)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openExternal(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
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

class _CenterLibraryCategory {
  const _CenterLibraryCategory({
    required this.title,
    required this.icon,
    required this.tags,
    required this.links,
    this.initiallyExpanded = false,
  });

  final String title;
  final IconData icon;
  final List<String> tags;
  final List<_CenterLibraryLink> links;
  final bool initiallyExpanded;

  _CenterLibraryCategory copyWith({required List<_CenterLibraryLink> links}) {
    return _CenterLibraryCategory(
      title: title,
      icon: icon,
      tags: tags,
      links: links,
      initiallyExpanded: initiallyExpanded,
    );
  }
}

class _CenterLibraryLink {
  const _CenterLibraryLink({
    required this.title,
    required this.url,
    // ignore: unused_element_parameter
    this.purpose = 'مرجع خارجي للمراجعة المهنية والتشغيلية.',
  });

  final String title;
  final String purpose;
  final String url;
}

const List<_CenterLibraryCategory> _centerLibraryCategories = [
  _CenterLibraryCategory(
    title: 'الجهات الحكومية المصرية',
    icon: Icons.account_balance_outlined,
    tags: ['مصر', 'عربي', 'تشغيل'],
    initiallyExpanded: true,
    links: [
      _CenterLibraryLink(
          title: 'وزارة الصحة والسكان', url: 'https://www.mohp.gov.eg/'),
      _CenterLibraryLink(
          title: 'الأمانة العامة للصحة النفسية وعلاج الإدمان',
          url: 'https://www.smcegy.com/'),
      _CenterLibraryLink(
          title: 'هيئة الدواء المصرية', url: 'https://www.edaegypt.gov.eg/'),
      _CenterLibraryLink(
          title: 'هيئة الرعاية الصحية', url: 'https://www.uhia.gov.eg/'),
      _CenterLibraryLink(
          title: 'هيئة الاعتماد والرقابة الصحية GAHAR',
          url: 'https://www.gahar.gov.eg/'),
      _CenterLibraryLink(
          title: 'صندوق مكافحة وعلاج الإدمان',
          url: 'https://www.drugcontrol.org.eg/'),
      _CenterLibraryLink(
          title: 'الهلال الأحمر المصري', url: 'https://www.egyptianrc.org/'),
      _CenterLibraryLink(
          title: 'هيئة الإسعاف المصرية', url: 'https://www.eao.gov.eg/'),
      _CenterLibraryLink(
          title: 'المجلس القومي للأشخاص ذوي الإعاقة',
          url: 'https://ncpd.org.eg/'),
      _CenterLibraryLink(
          title: 'المجلس القومي للمرأة', url: 'https://ncw.gov.eg/'),
      _CenterLibraryLink(
          title: 'المجلس القومي للطفولة والأمومة',
          url: 'https://www.nccm.gov.eg/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الاعتماد والجودة',
    icon: Icons.verified_outlined,
    tags: ['اعتماد', 'جودة'],
    links: [
      _CenterLibraryLink(title: 'GAHAR', url: 'https://www.gahar.gov.eg/'),
      _CenterLibraryLink(
          title: 'Joint Commission', url: 'https://www.jointcommission.org/'),
      _CenterLibraryLink(
          title: 'Accreditation Canada', url: 'https://accreditation.ca/'),
      _CenterLibraryLink(title: 'CARF', url: 'https://carf.org/'),
      _CenterLibraryLink(
          title: 'JCI', url: 'https://www.jointcommissioninternational.org/'),
      _CenterLibraryLink(title: 'ISQua', url: 'https://isqua.org/'),
      _CenterLibraryLink(
          title: 'WHO Quality Care',
          url:
              'https://www.who.int/teams/integrated-health-services/quality-health-services'),
      _CenterLibraryLink(
          title: 'Institute for Healthcare Improvement',
          url: 'https://www.ihi.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'السلامة الطبية',
    icon: Icons.health_and_safety_outlined,
    tags: ['سلامة', 'جودة'],
    links: [
      _CenterLibraryLink(
          title: 'WHO Patient Safety',
          url:
              'https://www.who.int/teams/integrated-health-services/patient-safety'),
      _CenterLibraryLink(
          title: 'CDC Infection Control',
          url: 'https://www.cdc.gov/infection-control/'),
      _CenterLibraryLink(
          title: 'CDC Healthcare',
          url: 'https://www.cdc.gov/healthcare-associated-infections/'),
      _CenterLibraryLink(
          title: 'OSHA Healthcare', url: 'https://www.osha.gov/healthcare'),
      _CenterLibraryLink(
          title: 'WHO Safe Hospitals',
          url: 'https://www.who.int/health-topics/hospitals'),
      _CenterLibraryLink(
          title: 'Safe Surgery WHO',
          url:
              'https://www.who.int/teams/integrated-health-services/patient-safety/research/safe-surgery'),
      _CenterLibraryLink(
          title: 'Patient Safety Network', url: 'https://psnet.ahrq.gov/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'مكافحة العدوى',
    icon: Icons.sanitizer_outlined,
    tags: ['سلامة', 'جودة'],
    links: [
      _CenterLibraryLink(
          title: 'WHO IPC',
          url:
              'https://www.who.int/teams/integrated-health-services/infection-prevention-control'),
      _CenterLibraryLink(
          title: 'CDC Infection Prevention',
          url: 'https://www.cdc.gov/infection-control/'),
      _CenterLibraryLink(title: 'APIC', url: 'https://apic.org/'),
      _CenterLibraryLink(title: 'SHEA', url: 'https://shea-online.org/'),
      _CenterLibraryLink(
          title: 'Infection Control Africa Network',
          url: 'https://icanetwork.co.za/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الصحة النفسية',
    icon: Icons.psychology_outlined,
    tags: ['تشغيل', 'تدريب'],
    links: [
      _CenterLibraryLink(
          title: 'WHO Mental Health',
          url: 'https://www.who.int/health-topics/mental-health'),
      _CenterLibraryLink(title: 'WPA', url: 'https://www.wpanet.org/'),
      _CenterLibraryLink(
          title: 'Royal College', url: 'https://www.rcpsych.ac.uk/'),
      _CenterLibraryLink(title: 'APA', url: 'https://www.apa.org/'),
      _CenterLibraryLink(title: 'BPS', url: 'https://www.bps.org.uk/'),
      _CenterLibraryLink(
          title: 'NICE', url: 'https://www.nice.org.uk/guidance'),
      _CenterLibraryLink(
          title: 'WHO mhGAP',
          url:
              'https://www.who.int/teams/mental-health-and-substance-use/treatment-care/mental-health-gap-action-programme'),
      _CenterLibraryLink(
          title: 'NHS Mental Health', url: 'https://www.nhs.uk/mental-health/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'علاج الإدمان',
    icon: Icons.psychology_alt_outlined,
    tags: ['إدمان', 'تدريب'],
    links: [
      _CenterLibraryLink(title: 'SAMHSA', url: 'https://www.samhsa.gov/'),
      _CenterLibraryLink(title: 'NIDA', url: 'https://nida.nih.gov/'),
      _CenterLibraryLink(title: 'NIAAA', url: 'https://www.niaaa.nih.gov/'),
      _CenterLibraryLink(title: 'UNODC', url: 'https://www.unodc.org/'),
      _CenterLibraryLink(
          title: 'World Drug Report',
          url:
              'https://www.unodc.org/unodc/en/data-and-analysis/world-drug-report.html'),
      _CenterLibraryLink(
          title: 'Alcoholics Anonymous', url: 'https://www.aa.org/'),
      _CenterLibraryLink(title: 'Narcotics Anonymous', url: 'https://na.org/'),
      _CenterLibraryLink(
          title: 'Crystal Meth Anonymous', url: 'https://www.crystalmeth.org/'),
      _CenterLibraryLink(
          title: 'Marijuana Anonymous',
          url: 'https://marijuana-anonymous.org/'),
      _CenterLibraryLink(
          title: 'Dual Recovery', url: 'https://www.draonline.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الإدمانات السلوكية',
    icon: Icons.groups_2_outlined,
    tags: ['إدمان'],
    links: [
      _CenterLibraryLink(
          title: 'Gamblers Anonymous',
          url: 'https://www.gamblersanonymous.org/'),
      _CenterLibraryLink(title: 'Gam-Anon', url: 'https://www.gam-anon.org/'),
      _CenterLibraryLink(
          title: 'Sex Addicts Anonymous', url: 'https://saa-recovery.org/'),
      _CenterLibraryLink(
          title: 'Sexaholics Anonymous', url: 'https://www.sa.org/'),
      _CenterLibraryLink(title: 'SLAA', url: 'https://slaafws.org/'),
      _CenterLibraryLink(title: 'Overeaters Anonymous', url: 'https://oa.org/'),
      _CenterLibraryLink(
          title: 'Food Addicts', url: 'https://www.foodaddicts.org/'),
      _CenterLibraryLink(
          title: 'Adult Children', url: 'https://adultchildren.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الأطفال والمراهقين',
    icon: Icons.child_care_outlined,
    tags: ['أطفال', 'تدريب'],
    links: [
      _CenterLibraryLink(title: 'UNICEF', url: 'https://www.unicef.org/'),
      _CenterLibraryLink(
          title: 'Child Mind Institute', url: 'https://childmind.org/'),
      _CenterLibraryLink(title: 'AACAP', url: 'https://www.aacap.org/'),
      _CenterLibraryLink(
          title: 'CDC Child Development',
          url: 'https://www.cdc.gov/child-development/'),
      _CenterLibraryLink(title: 'CHADD', url: 'https://chadd.org/'),
      _CenterLibraryLink(
          title: 'Autism Speaks', url: 'https://www.autismspeaks.org/'),
      _CenterLibraryLink(
          title: 'National Autistic Society',
          url: 'https://www.autism.org.uk/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'كبار السن',
    icon: Icons.elderly_outlined,
    tags: ['تشغيل'],
    links: [
      _CenterLibraryLink(
          title: 'WHO Ageing', url: 'https://www.who.int/health-topics/ageing'),
      _CenterLibraryLink(
          title: 'Alzheimer\'s Association', url: 'https://www.alz.org/'),
      _CenterLibraryLink(
          title: 'Dementia Care', url: 'https://www.alzheimers.org.uk/'),
      _CenterLibraryLink(
          title: 'Parkinson Foundation', url: 'https://www.parkinson.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الإعاقة وإتاحة الوصول',
    icon: Icons.accessible_forward_outlined,
    tags: ['إعاقة', 'عربي'],
    links: [
      _CenterLibraryLink(
          title: 'World Federation of the Deaf', url: 'https://wfdeaf.org/'),
      _CenterLibraryLink(
          title: 'World Blind Union', url: 'https://worldblindunion.org/'),
      _CenterLibraryLink(
          title: 'International Disability Alliance',
          url: 'https://www.internationaldisabilityalliance.org/'),
      _CenterLibraryLink(
          title: 'Down Syndrome International', url: 'https://www.ds-int.org/'),
      _CenterLibraryLink(
          title: 'Autism Europe', url: 'https://www.autismeurope.org/'),
      _CenterLibraryLink(
          title: 'Hearing Loss Association',
          url: 'https://www.hearingloss.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'إدارة المراكز',
    icon: Icons.settings_suggest_outlined,
    tags: ['تشغيل', 'جودة'],
    links: [
      _CenterLibraryLink(
          title: 'Institute for Healthcare Improvement',
          url: 'https://www.ihi.org/'),
      _CenterLibraryLink(
          title: 'WHO Hospital Management',
          url: 'https://www.who.int/health-topics/hospitals'),
      _CenterLibraryLink(
          title: 'Hospital News', url: 'https://hospitalnews.com/'),
      _CenterLibraryLink(title: 'ACHE', url: 'https://www.ache.org/'),
      _CenterLibraryLink(
          title: 'Healthcare Financial Management Association',
          url: 'https://www.hfma.org/'),
      _CenterLibraryLink(
          title: 'Medical Group Management Association',
          url: 'https://www.mgma.com/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الموارد البشرية',
    icon: Icons.badge_outlined,
    tags: ['تشغيل'],
    links: [
      _CenterLibraryLink(
          title: 'SHRM Healthcare', url: 'https://www.shrm.org/'),
      _CenterLibraryLink(
          title: 'WHO Workforce',
          url: 'https://www.who.int/health-topics/health-workforce'),
      _CenterLibraryLink(
          title: 'NHS Workforce', url: 'https://www.england.nhs.uk/workforce/'),
      _CenterLibraryLink(
          title: 'Healthcare Leadership Academy',
          url: 'https://www.thehealthcareleadership.academy/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الطوارئ والكوارث',
    icon: Icons.emergency_outlined,
    tags: ['طوارئ', 'سلامة'],
    links: [
      _CenterLibraryLink(
          title: 'WHO Emergency', url: 'https://www.who.int/emergencies'),
      _CenterLibraryLink(
          title: 'WHO EMS',
          url:
              'https://www.who.int/teams/integrated-health-services/clinical-services-and-systems/emergency-and-critical-care'),
      _CenterLibraryLink(title: 'IFRC', url: 'https://www.ifrc.org/'),
      _CenterLibraryLink(title: 'Red Cross', url: 'https://www.icrc.org/'),
      _CenterLibraryLink(
          title: 'Red Crescent',
          url:
              'https://www.ifrc.org/our-network/national-societies/red-cross-red-crescent'),
      _CenterLibraryLink(
          title: 'FEMA Healthcare',
          url:
              'https://www.fema.gov/emergency-managers/practitioners/healthcare'),
      _CenterLibraryLink(
          title: 'Sphere Standards', url: 'https://spherestandards.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'القوانين والأخلاقيات',
    icon: Icons.gavel_outlined,
    tags: ['اعتماد', 'سلامة'],
    links: [
      _CenterLibraryLink(
          title: 'WHO Ethics', url: 'https://www.who.int/health-topics/ethics'),
      _CenterLibraryLink(
          title: 'APA Ethics', url: 'https://www.apa.org/ethics/code'),
      _CenterLibraryLink(
          title: 'ACA Ethics',
          url: 'https://www.counseling.org/resources/ethics'),
      _CenterLibraryLink(
          title: 'JCI Ethics',
          url: 'https://www.jointcommissioninternational.org/'),
      _CenterLibraryLink(
          title: 'Medical Ethics Manuals',
          url:
              'https://www.wma.net/what-we-do/education/medical-ethics-manual/'),
      _CenterLibraryLink(
          title: 'UN Human Rights', url: 'https://www.ohchr.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'التدريب والتعليم',
    icon: Icons.school_outlined,
    tags: ['تدريب'],
    links: [
      _CenterLibraryLink(title: 'OpenWHO', url: 'https://openwho.org/'),
      _CenterLibraryLink(
          title: 'Coursera Healthcare',
          url: 'https://www.coursera.org/browse/health'),
      _CenterLibraryLink(
          title: 'FutureLearn Healthcare',
          url:
              'https://www.futurelearn.com/subjects/healthcare-medicine-courses'),
      _CenterLibraryLink(
          title: 'edX Healthcare', url: 'https://www.edx.org/learn/healthcare'),
      _CenterLibraryLink(
          title: 'WHO Academy', url: 'https://www.who.int/about/who-academy'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الأبحاث',
    icon: Icons.science_outlined,
    tags: ['أبحاث'],
    links: [
      _CenterLibraryLink(
          title: 'PubMed', url: 'https://pubmed.ncbi.nlm.nih.gov/'),
      _CenterLibraryLink(title: 'Cochrane', url: 'https://www.cochrane.org/'),
      _CenterLibraryLink(
          title: 'Google Scholar', url: 'https://scholar.google.com/'),
      _CenterLibraryLink(title: 'Springer', url: 'https://link.springer.com/'),
      _CenterLibraryLink(
          title: 'ScienceDirect', url: 'https://www.sciencedirect.com/'),
      _CenterLibraryLink(
          title: 'JAMA Psychiatry',
          url: 'https://jamanetwork.com/journals/jamapsychiatry'),
      _CenterLibraryLink(
          title: 'Nature Mental Health',
          url: 'https://www.nature.com/natmentalhealth/'),
      _CenterLibraryLink(
          title: 'Lancet Psychiatry',
          url: 'https://www.thelancet.com/journals/lanpsy/home'),
      _CenterLibraryLink(
          title: 'Semantic Scholar', url: 'https://www.semanticscholar.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'التكنولوجيا الصحية',
    icon: Icons.medical_information_outlined,
    tags: ['تشغيل', 'جودة'],
    links: [
      _CenterLibraryLink(
          title: 'WHO Digital Health',
          url: 'https://www.who.int/health-topics/digital-health'),
      _CenterLibraryLink(title: 'HL7', url: 'https://www.hl7.org/'),
      _CenterLibraryLink(title: 'FHIR', url: 'https://www.hl7.org/fhir/'),
      _CenterLibraryLink(title: 'OpenMRS', url: 'https://openmrs.org/'),
      _CenterLibraryLink(title: 'OpenEHR', url: 'https://www.openehr.org/'),
      _CenterLibraryLink(
          title: 'Digital Health Atlas',
          url: 'https://digitalhealthatlas.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'الجمعيات والمؤسسات العربية',
    icon: Icons.language_outlined,
    tags: ['عربي'],
    links: [
      _CenterLibraryLink(title: 'WHO EMRO', url: 'https://www.emro.who.int/'),
      _CenterLibraryLink(
          title: 'Arab Board', url: 'https://www.arab-board.org/'),
      _CenterLibraryLink(
          title: 'Arab Council for Social Sciences',
          url: 'https://www.theacss.org/'),
      _CenterLibraryLink(
          title: 'الهلال الأحمر العربي', url: 'https://www.ifrc.org/'),
      _CenterLibraryLink(
          title: 'جامعة الدول العربية - الصحة',
          url: 'https://www.lasportal.org/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'المنظمات الإنسانية',
    icon: Icons.volunteer_activism_outlined,
    tags: ['طوارئ', 'أطفال'],
    links: [
      _CenterLibraryLink(title: 'UNICEF', url: 'https://www.unicef.org/'),
      _CenterLibraryLink(title: 'UNHCR', url: 'https://www.unhcr.org/'),
      _CenterLibraryLink(title: 'WHO', url: 'https://www.who.int/'),
      _CenterLibraryLink(title: 'UNODC', url: 'https://www.unodc.org/'),
      _CenterLibraryLink(title: 'MSF', url: 'https://www.msf.org/'),
      _CenterLibraryLink(title: 'IFRC', url: 'https://www.ifrc.org/'),
      _CenterLibraryLink(title: 'Red Cross', url: 'https://www.icrc.org/'),
      _CenterLibraryLink(title: 'Red Crescent', url: 'https://www.ifrc.org/'),
      _CenterLibraryLink(
          title: 'Save the Children', url: 'https://www.savethechildren.net/'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'التمويل والمنح',
    icon: Icons.payments_outlined,
    tags: ['تشغيل'],
    links: [
      _CenterLibraryLink(
          title: 'USAID Health', url: 'https://www.usaid.gov/global-health'),
      _CenterLibraryLink(title: 'UNDP', url: 'https://www.undp.org/'),
      _CenterLibraryLink(
          title: 'WHO Grants', url: 'https://www.who.int/about/funding'),
      _CenterLibraryLink(
          title: 'Global Fund', url: 'https://www.theglobalfund.org/'),
      _CenterLibraryLink(
          title: 'UNICEF Partnerships',
          url: 'https://www.unicef.org/partnerships'),
      _CenterLibraryLink(
          title: 'EU Health', url: 'https://health.ec.europa.eu/'),
      _CenterLibraryLink(
          title: 'World Bank Health',
          url: 'https://www.worldbank.org/en/topic/health'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'المؤتمرات العالمية',
    icon: Icons.event_available_outlined,
    tags: ['تدريب', 'جودة'],
    links: [
      _CenterLibraryLink(
          title: 'APA Convention', url: 'https://convention.apa.org/'),
      _CenterLibraryLink(title: 'WPA Congress', url: 'https://www.wpanet.org/'),
      _CenterLibraryLink(
          title: 'JCI Conference',
          url: 'https://www.jointcommissioninternational.org/'),
      _CenterLibraryLink(
          title: 'ISQua Conference', url: 'https://isqua.org/events.html'),
      _CenterLibraryLink(
          title: 'Healthcare Leadership Summit', url: 'https://www.ache.org/'),
      _CenterLibraryLink(
          title: 'WHO Events', url: 'https://www.who.int/news-room/events'),
    ],
  ),
  _CenterLibraryCategory(
    title: 'النماذج والسياسات',
    icon: Icons.policy_outlined,
    tags: ['تشغيل', 'جودة', 'اعتماد'],
    links: [
      _CenterLibraryLink(
          title: 'Consent Forms',
          url:
              'https://www.who.int/ethics/review-committee/informed_consent/en/'),
      _CenterLibraryLink(
          title: 'Patient Rights',
          url:
              'https://www.who.int/news-room/fact-sheets/detail/human-rights-and-health'),
      _CenterLibraryLink(
          title: 'Incident Reports', url: 'https://psnet.ahrq.gov/'),
      _CenterLibraryLink(title: 'Risk Assessment', url: 'https://www.ihi.org/'),
      _CenterLibraryLink(
          title: 'Quality Indicators', url: 'https://www.ahrq.gov/'),
      _CenterLibraryLink(
          title: 'Audit Templates', url: 'https://www.nice.org.uk/'),
      _CenterLibraryLink(
          title: 'Clinical Governance', url: 'https://www.england.nhs.uk/'),
      _CenterLibraryLink(
          title: 'Policies & Procedures',
          url: 'https://www.jointcommission.org/'),
    ],
  ),
];
