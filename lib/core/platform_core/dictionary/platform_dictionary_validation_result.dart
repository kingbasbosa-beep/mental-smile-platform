class PlatformDictionaryValidationResult {
  const PlatformDictionaryValidationResult({this.errors = const <String>[]});

  final List<String> errors;

  bool get isValid => errors.isEmpty;
}
