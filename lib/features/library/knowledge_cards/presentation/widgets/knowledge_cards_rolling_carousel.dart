import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/domain/models/knowledge_card.dart';

class KnowledgeCardsRollingCarousel extends StatelessWidget {
  const KnowledgeCardsRollingCarousel({
    super.key,
    required this.controller,
    required this.page,
    required this.cards,
    required this.onCardPressed,
  });

  final PageController controller;
  final double page;
  final List<KnowledgeCard> cards;
  final ValueChanged<KnowledgeCard> onCardPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isCompact = size.width < 700;
    final height = math.min(size.height * (isCompact ? 0.62 : 0.66), 560.0);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1360),
        child: SizedBox(
          height: height,
          child: PageView.builder(
            controller: controller,
            itemCount: cards.length,
            padEnds: true,
            itemBuilder: (context, index) {
              final distance = (page - index).abs().clamp(0.0, 1.0);
              final scale = 1.0 - (distance * (isCompact ? 0.075 : 0.055));

              return AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isCompact ? 8 : 14),
                  child: _KnowledgeRollingCard(
                    card: cards[index],
                    compact: isCompact,
                    onPressed: () => onCardPressed(cards[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class KnowledgeCarouselControls extends StatelessWidget {
  const KnowledgeCarouselControls({
    super.key,
    required this.compact,
    required this.isRtl,
    required this.onPrevious,
    required this.onNext,
  });

  final bool compact;
  final bool isRtl;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: compact ? 14 : 22,
        right: compact ? 14 : 22,
        top: compact ? 4 : 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          _LogoNavControl(
            icon: isRtl
                ? Icons.arrow_forward_ios_rounded
                : Icons.arrow_back_ios_new_rounded,
            compact: compact,
            arrowOnLeft: false,
            tooltip: isRtl ? 'Next' : 'Previous',
            onTap: isRtl ? onNext : onPrevious,
          ),
          SizedBox(width: compact ? 18 : 26),
          _LogoNavControl(
            icon: isRtl
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_forward_ios_rounded,
            compact: compact,
            arrowOnLeft: true,
            tooltip: isRtl ? 'Previous' : 'Next',
            onTap: isRtl ? onPrevious : onNext,
          ),
        ],
      ),
    );
  }
}

class _KnowledgeRollingCard extends StatefulWidget {
  const _KnowledgeRollingCard({
    required this.card,
    required this.compact,
    required this.onPressed,
  });

  final KnowledgeCard card;
  final bool compact;
  final VoidCallback onPressed;

  @override
  State<_KnowledgeRollingCard> createState() => _KnowledgeRollingCardState();
}

class _KnowledgeRollingCardState extends State<_KnowledgeRollingCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.card.enabled && !widget.card.future;
    final radius = widget.compact ? 26.0 : 32.0;

    return Semantics(
      button: enabled,
      enabled: enabled,
      label: widget.card.title,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered && enabled ? 1.025 : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: enabled ? widget.onPressed : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: const Color(0xFF080704).withValues(alpha: 0.84),
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: const Color(0xFFFFD98A).withValues(
                    alpha: _hovered && enabled ? 0.72 : 0.36,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE7A94C).withValues(
                      alpha: _hovered && enabled ? 0.22 : 0.12,
                    ),
                    blurRadius: _hovered && enabled ? 30 : 22,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _KnowledgeCardImage(
                      card: widget.card,
                      radius: radius,
                    ),
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

class _KnowledgeCardImage extends StatelessWidget {
  const _KnowledgeCardImage({
    required this.card,
    required this.radius,
  });

  final KnowledgeCard card;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final image = card.imagePath.trim();

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              const Color(0xFFD8A13F).withValues(alpha: 0.22),
              const Color(0xFF120B05).withValues(alpha: 0.86),
            ],
          ),
        ),
        child: image.isEmpty
            ? const Center(
                child: Icon(
                  Icons.auto_stories_outlined,
                  color: Color(0xFFFFD47A),
                  size: 72,
                ),
              )
            : Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.auto_stories_outlined,
                      color: Color(0xFFFFD47A),
                      size: 72,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _LogoNavControl extends StatefulWidget {
  const _LogoNavControl({
    required this.icon,
    required this.compact,
    required this.arrowOnLeft,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final bool compact;
  final bool arrowOnLeft;
  final String tooltip;
  final VoidCallback onTap;

  @override
  State<_LogoNavControl> createState() => _LogoNavControlState();
}

class _LogoNavControlState extends State<_LogoNavControl> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final logoSize = widget.compact ? 50.0 : 60.0;
    final arrowSize = widget.compact ? 30.0 : 36.0;
    final arrow = _ArrowCircle(
      icon: widget.icon,
      size: arrowSize,
      compact: widget.compact,
    );
    final logo = _LogoCircle(
      size: logoSize,
      compact: widget.compact,
      hovered: _hovered,
    );
    final gap = SizedBox(width: widget.compact ? 6 : 8);

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered ? 1.06 : 1.0,
          duration: const Duration(milliseconds: 170),
          curve: Curves.easeOutCubic,
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: widget.onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children:
                  widget.arrowOnLeft ? [arrow, gap, logo] : [logo, gap, arrow],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowCircle extends StatelessWidget {
  const _ArrowCircle({
    required this.icon,
    required this.size,
    required this.compact,
  });

  final IconData icon;
  final double size;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1B1007).withValues(alpha: 0.42),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(alpha: 0.38),
        ),
      ),
      child: Icon(
        icon,
        color: const Color(0xFFFFE7B2),
        size: compact ? 15 : 17,
        shadows: const [
          Shadow(
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }
}

class _LogoCircle extends StatelessWidget {
  const _LogoCircle({
    required this.size,
    required this.compact,
    required this.hovered,
  });

  final double size;
  final bool compact;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1B1007).withValues(alpha: 0.48),
        border: Border.all(
          color: const Color(0xFFFFD98A).withValues(
            alpha: hovered ? 0.68 : 0.46,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE7A94C).withValues(
              alpha: hovered ? 0.20 : 0.10,
            ),
            blurRadius: hovered ? 14 : 9,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? 6 : 7),
        child: Image.asset(
          'assets/branding/shared/logo/logo_primary_dark.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
