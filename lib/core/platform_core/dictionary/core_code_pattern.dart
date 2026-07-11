import 'platform_dictionary_validation_result.dart';

class CoreCodePattern {
  const CoreCodePattern._();

  static final RegExp _pattern = RegExp(r'^[a-z]{2}[0-9]{3}[a-z]{2}$');

  static PlatformDictionaryValidationResult validate(String code) {
    final errors = <String>[];

    if (code.length != 7) {
      errors.add('code_must_be_7_characters');
    }
    if (code.trim() != code || code.contains(' ')) {
      errors.add('code_must_not_contain_spaces');
    }
    if (code.toLowerCase() != code) {
      errors.add('code_must_be_lowercase');
    }
    if (!_pattern.hasMatch(code)) {
      errors.add('code_must_match_aa999tt');
    }

    return PlatformDictionaryValidationResult(errors: errors);
  }

  static bool matches(String code) => validate(code).isValid;
}
