class ResidentialCapsuleCanonicalLine {
  const ResidentialCapsuleCanonicalLine._();

  static const route = 'MS-LINE-ROUTE-01';
  static const signal = 'MS-LINE-SIGNAL-01';
  static const localization = 'MS-LINE-LOCALIZATION-01';
  static const asset = 'MS-LINE-ASSET-01';
  static const lifecycle = 'MS-LINE-LIFECYCLE-01';
  static const externalAction = 'MS-LINE-EXTERNAL-ACTION-01';
  static const error = 'MS-LINE-ERROR-01';

  static const used = <String>[
    lifecycle,
    route,
    signal,
    localization,
    asset,
    externalAction,
    error,
  ];
}

class ResidentialCapsuleReservedExtensionLine {
  const ResidentialCapsuleReservedExtensionLine._();

  static const extension01 = 'MS-LINE-EXT-01';
  static const extension02 = 'MS-LINE-EXT-02';
  static const extension03 = 'MS-LINE-EXT-03';

  static const reserved = <String>[extension01, extension02, extension03];
}
