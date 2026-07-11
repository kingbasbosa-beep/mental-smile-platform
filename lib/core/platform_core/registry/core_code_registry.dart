class CoreCodeDefinition {
  const CoreCodeDefinition({
    required this.code,
    required this.family,
    required this.eventName,
    required this.logicalTarget,
    required this.allowedSections,
    required this.enabled,
    required this.environment,
    required this.schemaVersion,
    required this.description,
  });

  final String code;
  final String family;
  final String eventName;
  final String logicalTarget;
  final Set<String> allowedSections;
  final bool enabled;
  final String environment;
  final int schemaVersion;
  final String description;

  CoreCodeDefinition copyWith({bool? enabled}) {
    return CoreCodeDefinition(
      code: code,
      family: family,
      eventName: eventName,
      logicalTarget: logicalTarget,
      allowedSections: allowedSections,
      enabled: enabled ?? this.enabled,
      environment: environment,
      schemaVersion: schemaVersion,
      description: description,
    );
  }
}

class CoreCodeRegistry {
  CoreCodeRegistry([Iterable<CoreCodeDefinition> definitions = const []]) {
    for (final definition in definitions) {
      register(definition);
    }
  }

  factory CoreCodeRegistry.testDefaults() {
    return CoreCodeRegistry(<CoreCodeDefinition>[
      const CoreCodeDefinition(
        code: 'cl002bt',
        family: 'login',
        eventName: 'client_login_button_tap',
        logicalTarget: 'login',
        allowedSections: <String>{'RES_TEST'},
        enabled: true,
        environment: 'test',
        schemaVersion: 1,
        description: 'Client login entry tap.',
      ),
      const CoreCodeDefinition(
        code: 'cl004sb',
        family: 'feedback',
        eventName: 'client_feedback_submit',
        logicalTarget: 'feedback',
        allowedSections: <String>{'RES_TEST'},
        enabled: true,
        environment: 'test',
        schemaVersion: 1,
        description: 'Client feedback submit.',
      ),
      const CoreCodeDefinition(
        code: 'cl003sb',
        family: 'survey',
        eventName: 'client_survey_submit',
        logicalTarget: 'survey',
        allowedSections: <String>{'SURVEY_TEST'},
        enabled: false,
        environment: 'test',
        schemaVersion: 1,
        description: 'Disabled survey test code.',
      ),
    ]);
  }

  final Map<String, CoreCodeDefinition> _definitions =
      <String, CoreCodeDefinition>{};

  bool contains(String code) => _definitions.containsKey(code);

  bool register(CoreCodeDefinition definition) {
    if (_definitions.containsKey(definition.code)) return false;
    _definitions[definition.code] = definition;
    return true;
  }

  int registerAll(Iterable<CoreCodeDefinition> definitions) {
    var added = 0;
    for (final definition in definitions) {
      if (register(definition)) added++;
    }
    return added;
  }

  CoreCodeDefinition? resolve(String code) => _definitions[code];

  bool disable(String code) {
    final definition = _definitions[code];
    if (definition == null) return false;
    _definitions[code] = definition.copyWith(enabled: false);
    return true;
  }
}
