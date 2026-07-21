class PresentationCard {
  const PresentationCard({
    required this.id,
    required this.assetPath,
    this.fallbackAssetPath,
  });

  final String id;
  final String assetPath;
  final String? fallbackAssetPath;
}
