import '../models/signal_package.dart';
import '../registries/signal_category_registry.dart';
import '../registries/signal_privacy_level.dart';
import '../registries/signal_retention_class.dart';
import '../registries/signal_routing_target.dart';
import '../registries/signal_type_registry.dart';

class SignalPackageFactory {
  const SignalPackageFactory._();

  static SignalPackage supportStarted({
    required String actorId,
    required String actorRole,
    String targetId = '',
    String signalSource = 'support_requests',
    DateTime? timestamp,
  }) {
    return _package(
      signalType: SignalTypeRegistry.supportStarted,
      signalCategory: SignalCategoryRegistry.support,
      signalDomain: 'support',
      signalSource: signalSource,
      actorId: actorId,
      actorRole: actorRole,
      targetType: 'support',
      targetId: targetId,
      timestamp: timestamp,
      routingTarget: SignalRoutingTarget.supportMonitoring,
    );
  }

  static SignalPackage libraryCategoryOpened({
    required String actorId,
    required String actorRole,
    required String targetId,
    String signalSource = 'library',
    DateTime? timestamp,
  }) {
    return _package(
      signalType: SignalTypeRegistry.libraryCategoryOpened,
      signalCategory: SignalCategoryRegistry.library,
      signalDomain: 'residential',
      signalSource: signalSource,
      actorId: actorId,
      actorRole: actorRole,
      targetType: 'library_category',
      targetId: targetId,
      timestamp: timestamp,
      routingTarget: SignalRoutingTarget.residentialMonitoring,
    );
  }

  static SignalPackage _package({
    required String signalType,
    required String signalCategory,
    required String signalDomain,
    required String signalSource,
    required String actorId,
    required String actorRole,
    required String targetType,
    required String targetId,
    required String routingTarget,
    DateTime? timestamp,
  }) {
    final occurredAt = timestamp ?? DateTime.now().toUtc();
    return SignalPackage(
      signalId: _signalId(signalType, occurredAt),
      signalType: signalType,
      signalCategory: signalCategory,
      signalDomain: signalDomain,
      signalSource: signalSource,
      actorId: actorId,
      actorRole: actorRole,
      targetType: targetType,
      targetId: targetId,
      timestamp: occurredAt,
      routingTarget: routingTarget,
      retentionClass: SignalRetentionClass.rawShortTerm,
      privacyLevel: SignalPrivacyLevel.internalAggregate,
      signalVersion: SignalPackage.currentVersion,
    );
  }

  static String _signalId(String signalType, DateTime timestamp) {
    return '${signalType}_${timestamp.microsecondsSinceEpoch}';
  }
}
