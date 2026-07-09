import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_sub_page_background.dart';
import 'package:url_launcher/url_launcher.dart';

class CommercialSharedAssistiveToolsPage extends StatefulWidget {
  const CommercialSharedAssistiveToolsPage({super.key});

  @override
  State<CommercialSharedAssistiveToolsPage> createState() =>
      _CommercialSharedAssistiveToolsPageState();
}

class _CommercialSharedAssistiveToolsPageState
    extends State<CommercialSharedAssistiveToolsPage> {
  static const Color _gold = Color(0xFFFFE29A);

  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _filter = 'الكل';

  static const List<String> _filters = [
    'الكل',
    'ترجمة',
    'ذكاء اصطناعي',
    'أبحاث',
    'PDF',
    'كتابة',
    'تصميم',
    'اجتماعات',
    'تنظيم',
    'أمان',
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
                _TopBar(onBack: () => Navigator.of(context).maybePop()),
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
                            const _PageTitle(),
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
                            for (final category in categories) ...[
                              _ToolCategoryAccordion(category: category),
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

  List<_AssistiveToolCategory> _filteredCategories() {
    final normalizedQuery = _query.toLowerCase();

    return _assistiveToolCategories
        .map((category) {
          final matchesFilter =
              _filter == 'الكل' || category.tags.contains(_filter);
          if (!matchesFilter) return null;

          final tools = category.tools.where((tool) {
            if (normalizedQuery.isEmpty) return true;
            return category.title.toLowerCase().contains(normalizedQuery) ||
                tool.title.toLowerCase().contains(normalizedQuery) ||
                tool.purpose.toLowerCase().contains(normalizedQuery);
          }).toList();

          if (tools.isEmpty &&
              normalizedQuery.isNotEmpty &&
              !category.title.toLowerCase().contains(normalizedQuery)) {
            return null;
          }

          return category.copyWith(tools: tools);
        })
        .whereType<_AssistiveToolCategory>()
        .toList();
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

class _PageTitle extends StatelessWidget {
  const _PageTitle();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.handyman_outlined, color: Color(0xFFFFE29A), size: 30),
            SizedBox(width: 10),
            Text(
              'أدوات مساعدة',
              textAlign: TextAlign.center,
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
          'روابط خارجية تساعد في الترجمة والفهم والتلخيص وتجهيز المواد.',
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
        hintText: 'ابحث في الأدوات',
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
      case 'ترجمة':
        return Icons.translate_outlined;
      case 'ذكاء اصطناعي':
        return Icons.auto_awesome_outlined;
      case 'أبحاث':
        return Icons.science_outlined;
      case 'PDF':
        return Icons.picture_as_pdf_outlined;
      case 'كتابة':
        return Icons.edit_note_outlined;
      case 'تصميم':
        return Icons.brush_outlined;
      case 'اجتماعات':
        return Icons.video_call_outlined;
      case 'تنظيم':
        return Icons.event_available_outlined;
      case 'أمان':
        return Icons.security_outlined;
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
                'هذه أدوات خارجية مساعدة. استخدمها بحذر، ولا ترفع بيانات حساسة أو معلومات عملاء على أدوات خارجية غير معتمدة.',
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

class _ToolCategoryAccordion extends StatelessWidget {
  const _ToolCategoryAccordion({required this.category});

  final _AssistiveToolCategory category;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        expansionTileTheme: const ExpansionTileThemeData(
          iconColor: _CommercialSharedAssistiveToolsPageState._gold,
          collapsedIconColor: _CommercialSharedAssistiveToolsPageState._gold,
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
            for (final tool in category.tools)
              _ToolRow(tool: tool, categoryIcon: category.icon),
          ],
        ),
      ),
    );
  }
}

class _ToolRow extends StatelessWidget {
  const _ToolRow({
    required this.tool,
    required this.categoryIcon,
  });

  final _AssistiveTool tool;
  final IconData categoryIcon;

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
                      tool.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFFFFE29A),
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tool.purpose,
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
                tooltip: 'فتح الأداة',
                onPressed: () => _openExternal(tool.url),
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
            'لا توجد أدوات مطابقة للبحث الحالي.',
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

class _AssistiveToolCategory {
  const _AssistiveToolCategory({
    required this.title,
    required this.icon,
    required this.tags,
    required this.tools,
    this.initiallyExpanded = false,
  });

  final String title;
  final IconData icon;
  final List<String> tags;
  final List<_AssistiveTool> tools;
  final bool initiallyExpanded;

  _AssistiveToolCategory copyWith({required List<_AssistiveTool> tools}) {
    return _AssistiveToolCategory(
      title: title,
      icon: icon,
      tags: tags,
      tools: tools,
      initiallyExpanded: initiallyExpanded,
    );
  }
}

class _AssistiveTool {
  const _AssistiveTool({
    required this.title,
    required this.url,
    required this.purpose,
  });

  final String title;
  final String url;
  final String purpose;
}

const List<_AssistiveToolCategory> _assistiveToolCategories = [
  _AssistiveToolCategory(
    title: 'الترجمة وفهم الصفحات الأجنبية',
    icon: Icons.translate_outlined,
    tags: ['ترجمة'],
    initiallyExpanded: true,
    tools: [
      _AssistiveTool(
          title: 'Google Translate',
          url: 'https://translate.google.com/',
          purpose: 'ترجمة نصوص وصفحات ومحتوى سريع.'),
      _AssistiveTool(
          title: 'DeepL Translator',
          url: 'https://www.deepl.com/translator',
          purpose: 'ترجمة دقيقة للنصوص والملفات.'),
      _AssistiveTool(
          title: 'Microsoft Translator',
          url: 'https://translator.microsoft.com/',
          purpose: 'ترجمة نصية ومحادثات متعددة اللغات.'),
      _AssistiveTool(
          title: 'Bing Translator',
          url: 'https://www.bing.com/translator',
          purpose: 'ترجمة سريعة بديلة.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'مساعدات الذكاء الاصطناعي',
    icon: Icons.auto_awesome_outlined,
    tags: ['ذكاء اصطناعي', 'كتابة'],
    tools: [
      _AssistiveTool(
          title: 'ChatGPT',
          url: 'https://chatgpt.com/',
          purpose: 'تلخيص وشرح وصياغة وتحليل وترتيب أفكار.'),
      _AssistiveTool(
          title: 'Perplexity',
          url: 'https://www.perplexity.ai/',
          purpose: 'بحث مساعد بإجابات مدعومة بالمصادر.'),
      _AssistiveTool(
          title: 'Claude',
          url: 'https://claude.ai/',
          purpose: 'قراءة نصوص طويلة وتلخيص وتحليل.'),
      _AssistiveTool(
          title: 'Gemini',
          url: 'https://gemini.google.com/',
          purpose: 'مساعد Google للشرح والكتابة والبحث.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'قراءة وتلخيص الأبحاث',
    icon: Icons.science_outlined,
    tags: ['أبحاث', 'ذكاء اصطناعي'],
    tools: [
      _AssistiveTool(
          title: 'Semantic Scholar',
          url: 'https://www.semanticscholar.org/',
          purpose: 'البحث في الأبحاث وفهم الاقتباسات.'),
      _AssistiveTool(
          title: 'Elicit',
          url: 'https://elicit.com/',
          purpose: 'مساعد بحث علمي لتلخيص الدراسات.'),
      _AssistiveTool(
          title: 'Consensus',
          url: 'https://consensus.app/',
          purpose: 'إجابات بحثية من أوراق علمية.'),
      _AssistiveTool(
          title: 'Connected Papers',
          url: 'https://www.connectedpapers.com/',
          purpose: 'اكتشاف الأبحاث المرتبطة بموضوع معين.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'PDF وملفات',
    icon: Icons.picture_as_pdf_outlined,
    tags: ['PDF'],
    tools: [
      _AssistiveTool(
          title: 'Adobe Acrobat Online',
          url: 'https://www.adobe.com/acrobat/online.html',
          purpose: 'قراءة وتعديل وتحويل ملفات PDF.'),
      _AssistiveTool(
          title: 'Smallpdf',
          url: 'https://smallpdf.com/',
          purpose: 'ضغط وتحويل ودمج ملفات PDF.'),
      _AssistiveTool(
          title: 'iLovePDF',
          url: 'https://www.ilovepdf.com/',
          purpose: 'أدوات PDF سريعة.'),
      _AssistiveTool(
          title: 'Google Drive',
          url: 'https://drive.google.com/',
          purpose: 'حفظ ومشاركة ملفات العمل.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'OCR واستخراج النصوص',
    icon: Icons.document_scanner_outlined,
    tags: ['PDF', 'كتابة'],
    tools: [
      _AssistiveTool(
          title: 'Google Lens',
          url: 'https://lens.google/',
          purpose: 'استخراج نصوص وفهم صور ومستندات.'),
      _AssistiveTool(
          title: 'Online OCR',
          url: 'https://www.onlineocr.net/',
          purpose: 'تحويل الصور والملفات إلى نصوص.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'كتابة وتنظيم محتوى',
    icon: Icons.edit_note_outlined,
    tags: ['كتابة'],
    tools: [
      _AssistiveTool(
          title: 'Google Docs',
          url: 'https://docs.google.com/',
          purpose: 'كتابة ومشاركة مستندات.'),
      _AssistiveTool(
          title: 'Microsoft Word Online',
          url: 'https://www.office.com/launch/word',
          purpose: 'كتابة وتنسيق مستندات.'),
      _AssistiveTool(
          title: 'Grammarly',
          url: 'https://www.grammarly.com/',
          purpose: 'تحسين كتابة إنجليزية.'),
      _AssistiveTool(
          title: 'QuillBot',
          url: 'https://quillbot.com/',
          purpose: 'إعادة صياغة وتلخيص.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'تصميم بسيط وتجهيز مواد',
    icon: Icons.brush_outlined,
    tags: ['تصميم'],
    tools: [
      _AssistiveTool(
          title: 'Canva',
          url: 'https://www.canva.com/',
          purpose: 'تصميم بوستات وعروض ومواد تعريفية.'),
      _AssistiveTool(
          title: 'Adobe Express',
          url: 'https://www.adobe.com/express/',
          purpose: 'تصميم سريع للمواد البصرية.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'اجتماعات وتواصل',
    icon: Icons.video_call_outlined,
    tags: ['اجتماعات'],
    tools: [
      _AssistiveTool(
          title: 'Google Meet',
          url: 'https://meet.google.com/',
          purpose: 'اجتماعات ومكالمات فيديو.'),
      _AssistiveTool(
          title: 'Zoom', url: 'https://zoom.us/', purpose: 'اجتماعات أونلاين.'),
      _AssistiveTool(
          title: 'Microsoft Teams',
          url: 'https://www.microsoft.com/microsoft-teams/',
          purpose: 'اجتماعات وفرق عمل.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'تنظيم ومواعيد',
    icon: Icons.event_available_outlined,
    tags: ['تنظيم'],
    tools: [
      _AssistiveTool(
          title: 'Google Calendar',
          url: 'https://calendar.google.com/',
          purpose: 'تنظيم المواعيد.'),
      _AssistiveTool(
          title: 'Microsoft To Do',
          url: 'https://to-do.office.com/',
          purpose: 'قوائم مهام بسيطة.'),
      _AssistiveTool(
          title: 'Notion',
          url: 'https://www.notion.so/',
          purpose: 'تنظيم ملفات وأفكار وملاحظات.'),
    ],
  ),
  _AssistiveToolCategory(
    title: 'خصوصية وأمان أساسي',
    icon: Icons.security_outlined,
    tags: ['أمان'],
    tools: [
      _AssistiveTool(
          title: 'Have I Been Pwned',
          url: 'https://haveibeenpwned.com/',
          purpose: 'فحص تسريب البريد الإلكتروني.'),
      _AssistiveTool(
          title: 'Google Password Manager',
          url: 'https://passwords.google.com/',
          purpose: 'إدارة كلمات المرور.'),
      _AssistiveTool(
          title: 'Microsoft Safety',
          url: 'https://www.microsoft.com/security',
          purpose: 'موارد أمان عامة.'),
    ],
  ),
];
