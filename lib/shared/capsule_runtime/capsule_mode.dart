enum CapsuleMode { unmounted, test, active, incompatible, disabled }

enum CapsuleMountState {
  unmounted,
  validating,
  incompatible,
  ready,
  mounting,
  mountedTest,
  unmounting,
  failed,
}

enum CapsulePortActivationState {
  unmounted,
  designedNotImplemented,
  mountedTest,
}
