import 'package:mental_smile_os/core/platform_core/platform_core.dart';

class ResidentialSectionAdapter implements PlatformSectionAdapter {
  const ResidentialSectionAdapter({this.socketId = PlatformSocketIds.socket01});

  static const String sectionId = 'MS-SECTION-RESIDENTIAL';
  static const String sectionCode = 'RES';
  static const String sectionName = 'Residential';
  static const String defaultSocketId = PlatformSocketIds.socket01;
  static const int contractVersion = 1;
  static const String environment = 'test';
  static const Set<String> allowedFamilies = <String>{
    'login',
    'logout',
    'survey',
    'feedback',
  };
  static const Set<String> allowedCodePrefixes = <String>{'cl'};
  static const String testCode = 'cl006bt';

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
