import 'package:cloud_firestore/cloud_firestore.dart';

import '../contracts/core_signal_envelope.dart';
import 'core_output_gateway.dart';
import 'firebase_core_output_gateway.dart';

class ProductionSignalCollections {
  const ProductionSignalCollections._();

  static const String login = 'core_login_signals';
  static const String logout = 'core_logout_signals';
  static const String survey = 'core_survey_signals';
  static const String feedback = 'core_feedback_signals';
  static const String application = 'core_application_signals';

  static const Map<String, String> byLogicalTarget = <String, String>{
    'login': login,
    'logout': logout,
    'survey': survey,
    'feedback': feedback,
    'application': application,
  };

  static String? resolve(String logicalTarget) {
    return byLogicalTarget[logicalTarget];
  }
}

class ProductionFirebaseCoreOutputGateway implements CoreOutputGateway {
  ProductionFirebaseCoreOutputGateway({required CoreFirestoreWriter writer})
      : _writer = writer;

  static const String source = 'central_platform_core';

  final CoreFirestoreWriter _writer;

  @override
  Future<void> emit(CoreSignalEnvelope envelope) async {
    if (envelope.environment != 'production') {
      throw StateError('Only production envelopes are accepted.');
    }
    if (envelope.family != envelope.logicalTarget) {
      throw StateError('Production family/target mismatch.');
    }
    if (!_isSafeContext(envelope.context)) {
      throw StateError('Unsafe production context rejected.');
    }

    final collection = ProductionSignalCollections.resolve(
      envelope.logicalTarget,
    );
    if (collection == null) {
      throw StateError('Unknown production logical target.');
    }

    await _writer.write(
      collection: collection,
      documentId: envelope.signalId,
      data: _toFirestoreData(envelope),
    );
  }

  Map<String, Object?> _toFirestoreData(CoreSignalEnvelope envelope) {
    return <String, Object?>{
      'signalId': envelope.signalId,
      'code': envelope.code,
      'family': envelope.family,
      'eventName': envelope.eventName,
      'logicalTarget': envelope.logicalTarget,
      'sourceSectionId': envelope.sourceSectionId,
      'environment': envelope.environment,
      'schemaVersion': envelope.schemaVersion,
      'createdAt': FieldValue.serverTimestamp(),
      'context': Map<String, Object?>.unmodifiable(envelope.context),
      'source': source,
    };
  }

  bool _isSafeContext(Map<String, Object?> context) {
    const blockedKeys = <String>{
      'password',
      'token',
      'secret',
      'uid',
      'userId',
      'email',
      'phone',
      'image',
      'note',
      'notes',
      'text',
      'message',
      'content',
      'answers',
      'answer',
      'file',
      'bytes',
      'device',
      'session',
      'personalData',
      'profileData',
      'specialistPrivateData',
      'centerPrivateData',
    };
    if (context.length > 20) return false;

    for (final entry in context.entries) {
      if (blockedKeys.contains(entry.key)) return false;
      final value = entry.value;
      if (value == null || value is String || value is num || value is bool) {
        continue;
      }
      return false;
    }
    return true;
  }
}
