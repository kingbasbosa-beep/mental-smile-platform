class CapsuleIdentity {
  const CapsuleIdentity({
    required this.capsuleId,
    required this.portId,
    required this.instanceId,
    required this.writeIdentity,
    required this.localStateIdentity,
  });

  final String capsuleId;
  final String portId;
  final String instanceId;
  final String writeIdentity;
  final String localStateIdentity;

  bool collidesWith(CapsuleIdentity other) {
    return writeIdentity == other.writeIdentity ||
        localStateIdentity == other.localStateIdentity ||
        instanceId == other.instanceId;
  }
}
