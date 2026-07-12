import 'package:mental_smile_os/core/platform_core/platform_core.dart';

class LibrarySectionAdapter {
  const LibrarySectionAdapter({this.socketId = PlatformSocketIds.socket03});

  static const String sectionId = 'MS-SECTION-LIBRARY';
  static const String sectionCode = 'LIB';
  static const String sectionName = 'Library';
  static const String defaultSocketId = PlatformSocketIds.socket03;
  static const int contractVersion = 1;
  static const String environment = 'test';
  static const Set<String> allowedFamilies = <String>{'feedback'};
  static const Set<String> allowedCodePrefixes = <String>{'lb'};
  static const String testCode = 'lb001bt';

  final String socketId;

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
