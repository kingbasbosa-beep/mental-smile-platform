import 'package:cloud_firestore/cloud_firestore.dart';

import '../contracts/core_signal_envelope.dart';
import 'core_output_gateway.dart';

abstract class CoreFirestoreWriter {
  Future<void> write({
    required String collection,
    required String documentId,
    required Map<String, Object?> data,
  });
}

class FirebaseCoreFirestoreWriter implements CoreFirestoreWriter {
  FirebaseCoreFirestoreWriter({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> write({
    required String collection,
    required String documentId,
    required Map<String, Object?> data,
  }) {
    return _firestore.collection(collection).doc(documentId).set(data);
  }
}

class FirebaseCoreOutputGateway implements CoreOutputGateway {
  FirebaseCoreOutputGateway({required CoreFirestoreWriter writer})
      : _writer = writer;

  static const String collectionName = 'core_test_signal_events';
  static const String source = 'central_platform_core_phase_2b';

  final CoreFirestoreWriter _writer;

  @override
  Future<void> emit(CoreSignalEnvelope envelope) async {
    if (envelope.environment != 'test') {
      throw StateError('Only test envelopes are accepted in phase 2B.');
    }
    if (!_isSafeContext(envelope.context)) {
      throw StateError('Unsafe context rejected before Firestore write.');
    }

    await _writer.write(
      collection: collectionName,
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
