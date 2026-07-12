import '../registry/core_code_registry.dart';
import 'core_code_pattern.dart';
import 'core_dictionary_types.dart';
import 'platform_dictionary_validation_result.dart';

class PlatformDictionaryV1 {
  const PlatformDictionaryV1._();

  static const int schemaVersion = 1;
  static const int maxCodeCount = 30;

  static const List<CoreCodeDefinition> definitions = <CoreCodeDefinition>[
    CoreCodeDefinition(
      code: 'cl001bt',
      family: 'login',
      eventName: 'client_login_entry_tap',
      logicalTarget: 'login',
      allowedSections: <String>{'RES_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Client login entry tap.',
    ),
    CoreCodeDefinition(
      code: 'sp001bt',
      family: 'login',
      eventName: 'specialist_login_entry_tap',
      logicalTarget: 'login',
      allowedSections: <String>{'COM_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist login entry tap.',
    ),
    CoreCodeDefinition(
      code: 'cl002bt',
      family: 'logout',
      eventName: 'client_logout_tap',
      logicalTarget: 'logout',
      allowedSections: <String>{'RES_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Client logout tap.',
    ),
    CoreCodeDefinition(
      code: 'sp002bt',
      family: 'logout',
      eventName: 'specialist_logout_tap',
      logicalTarget: 'logout',
      allowedSections: <String>{'COM_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist logout tap.',
    ),
    CoreCodeDefinition(
      code: 'cl003sb',
      family: 'survey',
      eventName: 'client_survey_submit',
      logicalTarget: 'survey',
      allowedSections: <String>{'RES_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Client survey submit.',
    ),
    CoreCodeDefinition(
      code: 'sp003sb',
      family: 'survey',
      eventName: 'specialist_survey_submit',
      logicalTarget: 'survey',
      allowedSections: <String>{'COM_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist survey submit.',
    ),
    CoreCodeDefinition(
      code: 'cl004sb',
      family: 'feedback',
      eventName: 'client_feedback_submit',
      logicalTarget: 'feedback',
      allowedSections: <String>{'RES_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Client feedback submit.',
    ),
    CoreCodeDefinition(
      code: 'sp004sb',
      family: 'feedback',
      eventName: 'specialist_feedback_submit',
      logicalTarget: 'feedback',
      allowedSections: <String>{'COM_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist feedback submit.',
    ),
    CoreCodeDefinition(
      code: 'sp005sb',
      family: 'application',
      eventName: 'specialist_application_submit',
      logicalTarget: 'application',
      allowedSections: <String>{'COM_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist application submit.',
    ),
    CoreCodeDefinition(
      code: 'ct005sb',
      family: 'application',
      eventName: 'center_application_submit',
      logicalTarget: 'application',
      allowedSections: <String>{'COM_TEST'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Center application submit.',
    ),
    CoreCodeDefinition(
      code: 'lb001bt',
      family: 'feedback',
      eventName: 'library_test_entry_tap',
      logicalTarget: 'feedback',
      allowedSections: <String>{'LIB'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Library adapter test signal.',
    ),
    CoreCodeDefinition(
      code: 'cl006bt',
      family: 'feedback',
      eventName: 'client_residential_adapter_test_tap',
      logicalTarget: 'feedback',
      allowedSections: <String>{'RES'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Residential adapter test signal.',
    ),
    CoreCodeDefinition(
      code: 'cm001bt',
      family: 'feedback',
      eventName: 'commercial_adapter_test_tap',
      logicalTarget: 'feedback',
      allowedSections: <String>{'COM'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Commercial adapter test signal.',
    ),
    CoreCodeDefinition(
      code: 'cl012sb',
      family: 'survey',
      eventName: 'client_checkin_submit',
      logicalTarget: 'survey',
      allowedSections: <String>{'RES'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Client check-in submission signal.',
    ),
    CoreCodeDefinition(
      code: 'cl014sb',
      family: 'feedback',
      eventName: 'client_suggestion_submit',
      logicalTarget: 'feedback',
      allowedSections: <String>{'RES'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Client suggestion submission signal.',
    ),
    CoreCodeDefinition(
      code: 'sp010bt',
      family: 'login',
      eventName: 'specialist_login_submit',
      logicalTarget: 'login',
      allowedSections: <String>{'COM'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist login success signal.',
    ),
    CoreCodeDefinition(
      code: 'sp014sb',
      family: 'application',
      eventName: 'specialist_application_submit_real',
      logicalTarget: 'application',
      allowedSections: <String>{'COM'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Specialist application submission signal.',
    ),
    CoreCodeDefinition(
      code: 'ct010bt',
      family: 'login',
      eventName: 'center_login_submit',
      logicalTarget: 'login',
      allowedSections: <String>{'COM'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Center login success signal.',
    ),
    CoreCodeDefinition(
      code: 'ct014sb',
      family: 'application',
      eventName: 'center_application_submit_real',
      logicalTarget: 'application',
      allowedSections: <String>{'COM'},
      enabled: true,
      environment: 'test',
      schemaVersion: schemaVersion,
      description: 'Center application submission signal.',
    ),
  ];

  static PlatformDictionaryValidationResult validate() {
    final errors = <String>[];
    final seenCodes = <String>{};
    final eventNamesByFamily = <String, Set<String>>{};
    final families = definitions.map((definition) => definition.family).toSet();
    const allowedFamilies = <String>{
      'login',
      'logout',
      'survey',
      'feedback',
      'application',
    };
    const forbiddenFamilies = <String>{
      'owner',
      'admin',
      'archive',
      'marketing',
      'monitoring',
    };

    if (definitions.length > maxCodeCount) {
      errors.add('dictionary_must_not_exceed_30_codes');
    }

    for (final definition in definitions) {
      if (!seenCodes.add(definition.code)) {
        errors.add('duplicate_code:${definition.code}');
      }
      if (!CoreCodePattern.matches(definition.code)) {
        errors.add('invalid_code_pattern:${definition.code}');
      }
      if (definition.family != definition.logicalTarget) {
        errors.add('family_target_mismatch:${definition.code}');
      }
      if (definition.allowedSections.isEmpty) {
        errors.add('empty_allowed_sections:${definition.code}');
      }
      if (definition.schemaVersion <= 0) {
        errors.add('invalid_schema_version:${definition.code}');
      }
      if (definition.environment != CoreCodeEnvironment.test.value) {
        errors.add('non_test_environment:${definition.code}');
      }
      if (forbiddenFamilies.contains(definition.family)) {
        errors.add('forbidden_family:${definition.family}');
      }
      if (!allowedFamilies.contains(definition.family)) {
        errors.add('unknown_family:${definition.family}');
      }

      final eventNames =
          eventNamesByFamily.putIfAbsent(definition.family, () => <String>{});
      if (!eventNames.add(definition.eventName)) {
        errors.add(
          'duplicate_event_name:${definition.family}:${definition.eventName}',
        );
      }
    }

    for (final family in CoreSignalFamily.values) {
      if (!families.contains(family.value)) {
        errors.add('missing_family:${family.value}');
      }
    }

    return PlatformDictionaryValidationResult(errors: errors);
  }
}
