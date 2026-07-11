import '../dictionary/core_dictionary_types.dart';
import '../socket/platform_socket_registry.dart';

class PlatformSectionDefinition {
  const PlatformSectionDefinition({
    required this.sectionId,
    required this.sectionCode,
    required this.sectionName,
    required this.defaultSocketId,
    required this.contractVersion,
    required this.supportedFamilies,
    required this.environment,
    this.aliasSectionCodes = const <String>{},
  });

  final String sectionId;
  final String sectionCode;
  final String sectionName;
  final String defaultSocketId;
  final int contractVersion;
  final Set<String> supportedFamilies;
  final String environment;
  final Set<String> aliasSectionCodes;

  Set<String> get allSectionCodes {
    return <String>{sectionCode, ...aliasSectionCodes};
  }

  bool matchesSectionCode(String code) => allSectionCodes.contains(code);
}

class PlatformSectionRegistry {
  PlatformSectionRegistry({
    Iterable<PlatformSectionDefinition> definitions = phase3Definitions,
  }) {
    final sectionIds = <String>{};
    final sectionCodes = <String>{};
    final defaultSockets = <String>{};

    for (final definition in definitions) {
      if (!sectionIds.add(definition.sectionId)) {
        _errors.add('duplicate_section:${definition.sectionId}');
        continue;
      }
      for (final code in definition.allSectionCodes) {
        if (!sectionCodes.add(code)) {
          _errors.add('duplicate_section_code:$code');
          continue;
        }
        _definitionsByCode[code] = definition;
      }
      if (!defaultSockets.add(definition.defaultSocketId)) {
        _errors.add('duplicate_default_socket:${definition.defaultSocketId}');
      }
      _definitionsById[definition.sectionId] = definition;
    }
  }

  static const List<PlatformSectionDefinition> phase3Definitions =
      <PlatformSectionDefinition>[
    PlatformSectionDefinition(
      sectionId: 'MS-SECTION-RESIDENTIAL',
      sectionCode: 'RES',
      sectionName: 'Residential',
      defaultSocketId: PlatformSocketIds.socket01,
      contractVersion: 1,
      supportedFamilies: <String>{
        'login',
        'logout',
        'survey',
        'feedback',
      },
      environment: 'production',
      aliasSectionCodes: <String>{'RES_TEST'},
    ),
    PlatformSectionDefinition(
      sectionId: 'MS-SECTION-COMMERCIAL',
      sectionCode: 'COM',
      sectionName: 'Commercial',
      defaultSocketId: PlatformSocketIds.socket02,
      contractVersion: 1,
      supportedFamilies: <String>{
        'login',
        'logout',
        'survey',
        'feedback',
        'application',
      },
      environment: 'production',
      aliasSectionCodes: <String>{'COM_TEST'},
    ),
    PlatformSectionDefinition(
      sectionId: 'MS-SECTION-LIBRARY',
      sectionCode: 'LIB',
      sectionName: 'Library',
      defaultSocketId: PlatformSocketIds.socket03,
      contractVersion: 1,
      supportedFamilies: <String>{
        'login',
        'feedback',
      },
      environment: 'production',
      aliasSectionCodes: <String>{'LIB_TEST'},
    ),
  ];

  final Map<String, PlatformSectionDefinition> _definitionsById =
      <String, PlatformSectionDefinition>{};
  final Map<String, PlatformSectionDefinition> _definitionsByCode =
      <String, PlatformSectionDefinition>{};
  final List<String> _errors = <String>[];

  List<String> get errors => List<String>.unmodifiable(_errors);

  bool get isValid => _errors.isEmpty;

  List<PlatformSectionDefinition> get definitions {
    return List<PlatformSectionDefinition>.unmodifiable(
        _definitionsById.values);
  }

  bool containsSectionId(String sectionId) {
    return _definitionsById.containsKey(sectionId);
  }

  bool containsSectionCode(String sectionCode) {
    return _definitionsByCode.containsKey(sectionCode);
  }

  PlatformSectionDefinition? definitionForId(String sectionId) {
    return _definitionsById[sectionId];
  }

  PlatformSectionDefinition? definitionForCode(String sectionCode) {
    return _definitionsByCode[sectionCode];
  }

  List<String> validateLanguage() {
    final errors = <String>[..._errors];
    final allowedFamilies =
        CoreSignalFamily.values.map((family) => family.value).toSet();
    final allowedEnvironments = CoreCodeEnvironment.values
        .map((environment) => environment.value)
        .toSet();

    for (final definition in definitions) {
      if (definition.contractVersion <= 0) {
        errors.add('invalid_contract_version:${definition.sectionCode}');
      }
      if (!allowedEnvironments.contains(definition.environment)) {
        errors.add('unknown_environment:${definition.sectionCode}');
      }
      for (final family in definition.supportedFamilies) {
        if (!allowedFamilies.contains(family)) {
          errors.add('unknown_family:${definition.sectionCode}:$family');
        }
      }
    }

    return errors;
  }
}
