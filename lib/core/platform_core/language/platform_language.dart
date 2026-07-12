import '../dictionary/core_dictionary_types.dart';
import '../dictionary/platform_dictionary_v1.dart';
import '../registry/platform_section_registry.dart';
import '../socket/platform_socket_registry.dart';

class PlatformLanguage {
  const PlatformLanguage._();

  static const int contractVersion = 1;

  static const Set<String> sectionCodes = <String>{'RES', 'COM', 'LIB'};

  static const Set<String> socketCodes = <String>{
    PlatformSocketIds.socket01,
    PlatformSocketIds.socket02,
    PlatformSocketIds.socket03,
    PlatformSocketIds.socket04,
    PlatformSocketIds.socket05,
    PlatformSocketIds.socket06,
    PlatformSocketIds.socket07,
    PlatformSocketIds.socket08,
    PlatformSocketIds.socket09,
    PlatformSocketIds.socket10,
  };

  static Set<String> get signalFamilies {
    return CoreSignalFamily.values.map((family) => family.value).toSet();
  }

  static Set<String> get environments {
    return CoreCodeEnvironment.values
        .map((environment) => environment.value)
        .toSet();
  }

  static const Set<String> codePrefixes = <String>{
    'cl',
    'sp',
    'ct',
    'lb',
    'cm',
  };

  static const Set<String> adapterTestPrefixes = <String>{'cl', 'cm', 'lb'};

  static List<String> validate({
    PlatformSocketRegistry? socketRegistry,
    PlatformSectionRegistry? sectionRegistry,
  }) {
    final sockets = socketRegistry ?? PlatformSocketRegistry();
    final sections = sectionRegistry ?? PlatformSectionRegistry();
    final errors = <String>[
      ...sockets.errors,
      ...sections.validateLanguage(),
    ];

    if (sockets.definitions.length != PlatformSocketRegistry.socketCount) {
      errors.add('socket_count_mismatch');
    }
    for (final socketCode in socketCodes) {
      if (!sockets.contains(socketCode)) {
        errors.add('missing_socket:$socketCode');
      }
    }
    for (final sectionCode in sectionCodes) {
      if (!sections.containsSectionCode(sectionCode)) {
        errors.add('missing_section_code:$sectionCode');
      }
    }
    for (final section in sections.definitions) {
      if (!sockets.contains(section.defaultSocketId)) {
        errors.add('section_unknown_socket:${section.sectionCode}');
      }
    }
    for (final definition in PlatformDictionaryV1.definitions) {
      final prefix = definition.code.substring(0, 2);
      if (!codePrefixes.contains(prefix)) {
        errors.add('unknown_code_prefix:${definition.code}');
      }
      if (!signalFamilies.contains(definition.family)) {
        errors.add('unknown_signal_family:${definition.family}');
      }
      if (!environments.contains(definition.environment)) {
        errors.add('unknown_code_environment:${definition.code}');
      }
    }

    return errors;
  }
}
