class ResidentialSpeechNode {
  const ResidentialSpeechNode({
    required this.sectionId,
    required this.localizationKey,
    required this.localizedText,
    this.semanticLabel,
  }) : assert(sectionId.length > 0),
       assert(localizationKey.length > 0),
       assert(localizedText.length > 0);

  final String sectionId;
  final String localizationKey;
  final String localizedText;
  final String? semanticLabel;
}

class ResidentialSpeechGroupNode {
  const ResidentialSpeechGroupNode({
    required this.sectionId,
    required this.localizationKeys,
    required this.localizedTexts,
    this.semanticLabel,
  }) : assert(sectionId.length > 0),
       assert(localizationKeys.length > 0),
       assert(localizationKeys.length == localizedTexts.length);

  final String sectionId;
  final List<String> localizationKeys;
  final List<String> localizedTexts;
  final String? semanticLabel;

  ResidentialSpeechNode toSpeechNode() {
    return ResidentialSpeechNode(
      sectionId: sectionId,
      localizationKey: localizationKeys.join('+'),
      localizedText: localizedTexts.join('\n'),
      semanticLabel: semanticLabel,
    );
  }
}
