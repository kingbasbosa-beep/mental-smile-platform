import 'package:flutter/material.dart';

class AdminArchiveRoomPage extends StatelessWidget {
  const AdminArchiveRoomPage({super.key});

  static const String _desktop =
      'assets/branding/rooms/client_room/client_room_background_desktop.png';
  static const String _tablet =
      'assets/branding/rooms/client_room/client_room_background_tablet.png';
  static const String _mobile =
      'assets/branding/rooms/client_room/client_room_background_mobile.png';

  static const List<_ArchiveCategory> _categories = [
    _ArchiveCategory('الدستور والحوكمة', Icons.account_balance_outlined),
    _ArchiveCategory('السكني', Icons.home_outlined),
    _ArchiveCategory('التجاري', Icons.business_center_outlined),
    _ArchiveCategory('المكتبة', Icons.local_library_outlined),
    _ArchiveCategory('الإدارة', Icons.admin_panel_settings_outlined),
    _ArchiveCategory('الدعاية والإعلان', Icons.campaign_outlined),
    _ArchiveCategory('التطبيقات والأدوات', Icons.apps_outlined),
    _ArchiveCategory('الحسابات', Icons.account_balance_wallet_outlined),
    _ArchiveCategory('البوستات والمحتوى', Icons.article_outlined),
    _ArchiveCategory('التقارير', Icons.assessment_outlined),
    _ArchiveCategory('سجل العمليات', Icons.receipt_long_outlined),
    _ArchiveCategory('القرارات والاجتماعات', Icons.groups_2_outlined),
    _ArchiveCategory('الأصول والملفات', Icons.folder_copy_outlined),
    _ArchiveCategory('مؤجل / Pending', Icons.pending_actions_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 760;
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  _assetFor(constraints),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.62),
                        Colors.black.withValues(alpha: 0.34),
                        Colors.black.withValues(alpha: 0.66),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        top: 14,
                        start: 14,
                        child: IconButton(
                          tooltip: 'رجوع',
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xFFFFE8A3),
                          ),
                        ),
                      ),
                      Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: compact ? 18 : 36,
                            vertical: compact ? 58 : 42,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1040),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const _ArchiveHeader(),
                                SizedBox(height: compact ? 22 : 30),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: compact ? 10 : 14,
                                  runSpacing: compact ? 10 : 14,
                                  children: [
                                    for (final category in _categories)
                                      _ArchiveCategoryButton(
                                        category: category,
                                        compact: compact,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _assetFor(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isPortrait = height > width;
    if (width < 700 || (isPortrait && width < 900)) return _mobile;
    if (width < 1100) return _tablet;
    return _desktop;
  }
}

class _ArchiveHeader extends StatelessWidget {
  const _ArchiveHeader();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.58),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.55),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'الأرشيف التشغيلي',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFE8A3),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ذاكرة المشروع المنظمة حسب الأقسام.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFE0C174),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArchiveCategoryButton extends StatefulWidget {
  const _ArchiveCategoryButton({
    required this.category,
    required this.compact,
  });

  final _ArchiveCategory category;
  final bool compact;

  @override
  State<_ArchiveCategoryButton> createState() => _ArchiveCategoryButtonState();
}

class _ArchiveCategoryButtonState extends State<_ArchiveCategoryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.category.title,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () {
            debugPrint(
                'Admin archive category pending: ${widget.category.title}');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('قيد التجهيز')),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: widget.compact ? 154 : 190,
            height: widget.compact ? 92 : 106,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF120B05).withValues(
                alpha: _hovered ? 0.78 : 0.62,
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFFFD98A).withValues(
                  alpha: _hovered ? 0.88 : 0.48,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE7A94C).withValues(
                    alpha: _hovered ? 0.28 : 0.12,
                  ),
                  blurRadius: _hovered ? 24 : 14,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.category.icon,
                  color: const Color(0xFFFFD47A),
                  size: widget.compact ? 24 : 30,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.category.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFFFFE7B2),
                    fontSize: widget.compact ? 12 : 14,
                    fontWeight: FontWeight.w900,
                    height: 1.12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArchiveCategory {
  const _ArchiveCategory(this.title, this.icon);

  final String title;
  final IconData icon;
}
