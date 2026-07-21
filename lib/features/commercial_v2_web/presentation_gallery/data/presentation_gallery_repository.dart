import 'package:mental_smile_os/features/commercial_v2_web/presentation_gallery/domain/models/presentation_card.dart';

abstract class PresentationGalleryRepository {
  List<PresentationCard> loadPresentations();
}

class AssetPresentationGalleryRepository
    implements PresentationGalleryRepository {
  const AssetPresentationGalleryRepository();

  static const String _root = 'assets/presentations';

  @override
  List<PresentationCard> loadPresentations() {
    return const [
      PresentationCard(
        id: 'about_mental_smile',
        assetPath: '$_root/presentation_about_mental_smile.webp',
        fallbackAssetPath: '$_root/presentation_about_mental_smile.webp.png',
      ),
      PresentationCard(
        id: 'accessibility_services',
        assetPath: '$_root/presentation_accessibility_services.webp',
        fallbackAssetPath:
            '$_root/presentation_accessibility_services.webp.png',
      ),
      PresentationCard(
        id: 'client_services',
        assetPath: '$_root/presentation_client_services.webp',
        fallbackAssetPath: '$_root/presentation_client_services.webp.png',
      ),
      PresentationCard(
        id: 'specialist_services',
        assetPath: '$_root/presentation_specialist_services.webp',
        fallbackAssetPath: '$_root/presentation_specialist_services.webp.png',
      ),
      PresentationCard(
        id: 'center_services',
        assetPath: '$_root/presentation_center_services.webp',
        fallbackAssetPath: '$_root/presentation_center_services.webp.png',
      ),
    ];
  }
}
