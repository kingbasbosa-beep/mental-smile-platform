import 'package:flutter/material.dart';
import 'package:mental_smile_os/features/commercial_v2_web/presentation_gallery/domain/models/presentation_card.dart';

class PresentationAssetImage extends StatelessWidget {
  const PresentationAssetImage({
    super.key,
    required this.presentation,
    required this.fit,
  });

  final PresentationCard presentation;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      presentation.assetPath,
      fit: fit,
      filterQuality: FilterQuality.high,
      errorBuilder: (_, __, ___) {
        final fallback = presentation.fallbackAssetPath;
        if (fallback == null) return const SizedBox.shrink();
        return Image.asset(
          fallback,
          fit: fit,
          filterQuality: FilterQuality.high,
        );
      },
    );
  }
}
