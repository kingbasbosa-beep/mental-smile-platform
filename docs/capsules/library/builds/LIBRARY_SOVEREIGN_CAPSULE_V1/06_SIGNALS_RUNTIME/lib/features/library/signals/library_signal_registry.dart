import 'library_signal_codes.dart';
import 'library_signal_payload.dart';

class LibrarySignalRegistry {
  const LibrarySignalRegistry._();

  static const String sourceSection = 'Library';

  static LibrarySignalDefinition resolve(String signalCode) {
    final parts = signalCode.split('.');
    final prefix = parts.length > 1 ? parts[1] : '';
    switch (prefix) {
      case 'S':
        return _screen(signalCode);
      case 'C':
        return _card(signalCode);
      case 'B':
        return _navigation(signalCode);
      case 'SE':
        return _search(signalCode);
      case 'F':
        return _filter(signalCode);
      case 'SO':
        return _sorting(signalCode);
      case 'P':
        return _profile(signalCode);
      case 'E':
        return _external(signalCode);
      case 'R':
        return _registration(signalCode);
      case 'A':
        return _accessibility(signalCode);
      case 'G':
        return _suggestion(signalCode);
      case 'X':
        return _support(signalCode);
    }
    return _navigation(signalCode);
  }

  static LibrarySignalDefinition _screen(String code) => _definition(
        code,
        LibrarySignalFamily.screenPresence,
        'LB10',
        'Library Screen Signals Vault',
        'Library Screen Presence Aggregation',
        'Library Coverage Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _card(String code) => _definition(
        code,
        code == LibrarySignalCode.categoryCardOpen
            ? LibrarySignalFamily.categorySelection
            : LibrarySignalFamily.cardOpen,
        code == LibrarySignalCode.categoryCardOpen ? 'LB20' : 'LB30',
        code == LibrarySignalCode.categoryCardOpen
            ? 'Library Category Signals'
            : 'Library Card Signals',
        code == LibrarySignalCode.categoryCardOpen
            ? 'Library Category Demand Aggregation'
            : 'Library Card Engagement Aggregation',
        code == LibrarySignalCode.categoryCardOpen
            ? 'Library Category Demand Summary'
            : 'Library Feature Demand Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _navigation(String code) => _definition(
        code,
        LibrarySignalFamily.navigation,
        'LB100',
        'Library Navigation Signals',
        'Library Navigation Aggregation',
        'Library Navigation Friction Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _search(String code) => _definition(
        code,
        LibrarySignalFamily.search,
        'LB50',
        'Library Search Signals',
        'Library Search Aggregation',
        'Library Discovery Demand Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _filter(String code) => _definition(
        code,
        LibrarySignalFamily.filter,
        'LB50',
        'Library Filter Signals',
        'Library Filter Aggregation',
        'Library Discovery Refinement Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _sorting(String code) => _definition(
        code,
        LibrarySignalFamily.sorting,
        'LB50',
        'Library Sorting Signals',
        'Library Sorting Aggregation',
        'Library Discovery Ordering Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _profile(String code) => _definition(
        code,
        LibrarySignalFamily.profileOpen,
        'LB40',
        'Library Profile Signals',
        'Library Profile Opening Aggregation',
        'Library Profile Demand Summary',
        'PUBLIC_UI_COUNT',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _external(String code) => _definition(
        code,
        LibrarySignalFamily.externalResource,
        'LB60',
        'Library External Resource Signals',
        'Library External Resource Aggregation',
        'Library External Resource Demand Summary',
        'EXTERNAL_DESTINATION',
        'STANDARD_OPERATIONAL',
      );

  static LibrarySignalDefinition _registration(String code) => _definition(
        code,
        LibrarySignalFamily.registration,
        'LB70',
        'Library Registration Signals',
        'Library Registration Intent Aggregation',
        'Library Registration Demand Summary',
        'REGISTRATION_INTENT_ONLY',
        'REVIEW_REQUIRED',
      );

  static LibrarySignalDefinition _accessibility(String code) => _definition(
        code,
        LibrarySignalFamily.accessibility,
        'LB80',
        'Library Accessibility Signals',
        'Library Accessibility Aggregation',
        'Accessibility Demand Summary',
        'ACCESSIBILITY_USAGE',
        'ACCESSIBILITY_OPERATIONAL',
      );

  static LibrarySignalDefinition _suggestion(String code) => _definition(
        code,
        LibrarySignalFamily.suggestion,
        'LB90',
        'Library Suggestion Signals',
        'Library Suggestion Aggregation',
        'Library Improvement Summary',
        'SUPPORT_INTENT',
        'REVIEW_REQUIRED',
      );

  static LibrarySignalDefinition _support(String code) => _definition(
        code,
        LibrarySignalFamily.complaintSupport,
        'LB90',
        'Library Complaint Support Signals',
        'Library Complaint Support Aggregation',
        'Library Support Risk Summary',
        'SAFETY_REVIEW',
        'REVIEW_REQUIRED',
      );

  static LibrarySignalDefinition _definition(
    String code,
    LibrarySignalFamily family,
    String magnet,
    String archiveDestination,
    String aggregationDestination,
    String strategicSummaryDestination,
    String privacyClass,
    String retentionClass,
  ) {
    return LibrarySignalDefinition(
      signalCode: code,
      signalFamily: family,
      archiveMagnet: LibraryArchiveMagnet(
        code: magnet,
        destination: archiveDestination,
      ),
      aggregationDestination: LibraryAggregationDestination(
        aggregationDestination,
      ),
      strategicSummaryDestination: LibraryStrategicSummaryDestination(
        strategicSummaryDestination,
      ),
      privacyClass: privacyClass,
      retentionClass: retentionClass,
    );
  }
}
