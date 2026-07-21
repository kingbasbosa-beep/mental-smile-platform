import 'package:mental_smile_residential_capsule/src/contracts/host_platform.dart';

class ResidentialSectionAdapter implements PlatformSectionAdapter {
  const ResidentialSectionAdapter({
    this.socketId = PlatformSocketIds.socket01,
    this.socketEnvironment = environment,
  });

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
  final String socketEnvironment;

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
      environment: socketEnvironment,
      allowedGates: allowedFamilies,
      allowedCodePrefixes: allowedCodePrefixes,
      socketId: socketId,
    );
  }
}
