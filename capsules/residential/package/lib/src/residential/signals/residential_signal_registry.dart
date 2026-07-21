import 'residential_signal_codes.dart';
import 'residential_signal_payload.dart';

class ResidentialSignalRegistry {
  const ResidentialSignalRegistry._();

  static const String sourceSection = 'Residential';

  static ResidentialSignalDefinition resolve(String signalCode) {
    final prefix = signalCode.split('.').length > 1
        ? signalCode.split('.')[1]
        : '';
    switch (prefix) {
      case 'S':
        return _screen(signalCode);
      case 'B':
        return _button(signalCode);
      case 'C':
        return _card(signalCode);
      case 'A':
        return _audio(signalCode);
      case 'T':
        return _tool(signalCode);
      case 'Q':
        return _external(signalCode);
      case 'L':
        return _link(signalCode);
      case 'N':
        return _notebook(signalCode);
      case 'I':
        return _image(signalCode);
      case 'M':
        return _motivation(signalCode);
      case 'G':
        return _suggestion(signalCode);
      case 'P':
        return _support(signalCode);
      case 'X':
        return _exit(signalCode);
      case 'E':
        return _error(signalCode);
    }
    return _button(signalCode);
  }

  static ResidentialSignalDefinition _screen(String code) => _definition(
    code,
    ResidentialSignalFamily.screenPresence,
    'RB10',
    'Residential UI Signals Vault',
    'Residential Screen Presence Aggregation',
    'Residential Experience Coverage Summary',
    'PUBLIC_UI_COUNT',
    'STANDARD_OPERATIONAL',
  );

  static ResidentialSignalDefinition _button(String code) => _definition(
    code,
    ResidentialSignalFamily.buttonIntent,
    'RB20',
    'Button Intent Signals',
    'Residential Button Intent Aggregation',
    'Residential Intent Summary',
    'PUBLIC_UI_COUNT',
    'STANDARD_OPERATIONAL',
  );

  static ResidentialSignalDefinition _card(String code) => _definition(
    code,
    ResidentialSignalFamily.cardEngagement,
    'RB30',
    'Card Engagement Signals',
    'Residential Card Engagement Aggregation',
    'Residential Feature Demand Summary',
    'PUBLIC_UI_COUNT',
    'STANDARD_OPERATIONAL',
  );

  static ResidentialSignalDefinition _audio(String code) => _definition(
    code,
    ResidentialSignalFamily.audioAccessibility,
    'RB40',
    'Audio Accessibility Signals',
    'Residential Accessibility Audio Aggregation',
    'Accessibility Demand Summary',
    'ACCESSIBILITY_USAGE',
    'ACCESSIBILITY_OPERATIONAL',
  );

  static ResidentialSignalDefinition _tool(String code) => _definition(
    code,
    ResidentialSignalFamily.toolUsage,
    'RES-MAG-TOOLS',
    'Residential Tool Signals',
    'Residential Tool Usage Aggregation',
    'Residential Tool Utility Summary',
    'anonymous_navigation_signal',
    'operational_summary',
  );

  static ResidentialSignalDefinition _external(String code) => _definition(
    code,
    ResidentialSignalFamily.externalAppOpening,
    'RB60',
    'External App Signals',
    'Residential External App Aggregation',
    'External Channel Demand Summary',
    'EXTERNAL_DESTINATION',
    'STANDARD_OPERATIONAL',
  );

  static ResidentialSignalDefinition _link(String code) => _definition(
    code,
    ResidentialSignalFamily.linkOpening,
    'RB70',
    'Links Signals',
    'Residential Link Opening Aggregation',
    'Resource Discovery Summary',
    'EXTERNAL_DESTINATION',
    'STANDARD_OPERATIONAL',
  );

  static ResidentialSignalDefinition _notebook(String code) => _definition(
    code,
    ResidentialSignalFamily.notebookReflection,
    'RB80',
    'Notebook Reflection Signals',
    'Residential Notebook Reflection Aggregation',
    'Private Support Utility Summary',
    'PRIVATE_LOCAL_UTILITY',
    'PRIVATE_MINIMAL',
  );

  static ResidentialSignalDefinition _image(String code) => _definition(
    code,
    ResidentialSignalFamily.imageAnchor,
    'RB90',
    'Image Anchor Signals',
    'Residential Image Anchor Aggregation',
    'Personalization Demand Summary',
    'PRIVATE_LOCAL_UTILITY',
    'PRIVATE_MINIMAL',
  );

  static ResidentialSignalDefinition _motivation(String code) => _definition(
    code,
    ResidentialSignalFamily.motivation,
    'RB100',
    'Motivation Signals',
    'Residential Motivation Aggregation',
    'Motivation Content Summary',
    'PUBLIC_UI_COUNT',
    'STRATEGIC_SUMMARY_ONLY',
  );

  static ResidentialSignalDefinition _suggestion(String code) => _definition(
    code,
    ResidentialSignalFamily.suggestion,
    'RB110',
    'Suggestion Signals',
    'Residential Suggestion Aggregation',
    'Improvement Request Summary',
    'SUPPORT_INTENT',
    'REVIEW_REQUIRED',
  );

  static ResidentialSignalDefinition _support(String code) => _definition(
    code,
    ResidentialSignalFamily.complaintSupport,
    'RB120',
    'Complaint Support Signals',
    'Residential Complaint Support Aggregation',
    'Support Risk Summary',
    'SAFETY_REVIEW',
    'REVIEW_REQUIRED',
  );

  static ResidentialSignalDefinition _exit(String code) => _definition(
    code,
    ResidentialSignalFamily.exitReturn,
    'RB130',
    'Exit Signals',
    'Residential Exit Aggregation',
    'Exit and Return Pattern Summary',
    'PUBLIC_UI_COUNT',
    'STANDARD_OPERATIONAL',
  );

  static ResidentialSignalDefinition _error(String code) => _definition(
    code,
    ResidentialSignalFamily.errorBlockedState,
    'RB150',
    'Error State Signals',
    'Residential Error State Aggregation',
    'Application Friction Summary',
    'SAFETY_REVIEW',
    'REVIEW_REQUIRED',
  );

  static ResidentialSignalDefinition _definition(
    String code,
    ResidentialSignalFamily family,
    String magnet,
    String archiveDestination,
    String aggregationDestination,
    String strategicSummaryDestination,
    String privacyClass,
    String retentionClass,
  ) {
    return ResidentialSignalDefinition(
      signalCode: code,
      signalFamily: family,
      archiveMagnet: ResidentialArchiveMagnet(
        code: magnet,
        destination: archiveDestination,
      ),
      aggregationDestination: ResidentialAggregationDestination(
        aggregationDestination,
      ),
      strategicSummaryDestination: ResidentialStrategicSummaryDestination(
        strategicSummaryDestination,
      ),
      privacyClass: privacyClass,
      retentionClass: retentionClass,
    );
  }
}
