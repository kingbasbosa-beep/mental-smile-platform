import 'package:mental_smile_os/core/platform_core/platform_core.dart';

class CommercialSectionAdapter implements PlatformSectionAdapter {
  const CommercialSectionAdapter({this.socketId = PlatformSocketIds.socket02});

  static const String sectionId = 'MS-SECTION-COMMERCIAL';
  static const String sectionCode = 'COM';
  static const String sectionName = 'Commercial';
  static const String defaultSocketId = PlatformSocketIds.socket02;
  static const int contractVersion = 1;
  static const String environment = 'test';
  static const Set<String> allowedFamilies = <String>{
    'login',
    'logout',
    'survey',
    'feedback',
    'application',
  };
  static const Set<String> allowedCodePrefixes = <String>{'sp', 'ct', 'cm'};
  static const String testCode = 'cm001bt';

  final String socketId;

  @override
  String get adapterDefaultSocketId => defaultSocketId;

  @override
  String get adapterTestCode => testCode;

  @override
  SectionSocket createSocket() {
    return SectionSocket(
      sectionId: sectionId,
      sectionCode: sectionCode,
      contractVersion: contractVersion,
      environment: environment,
      allowedGates: allowedFamilies,
      allowedCodePrefixes: allowedCodePrefixes,
      socketId: socketId,
    );
  }
}
