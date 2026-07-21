class LibraryCapsuleCoreSignalCode {
  const LibraryCapsuleCoreSignalCode._();

  static const adapterProbe = 'lb001bt';
  static const values = <String>[adapterProbe];
}

class LibraryCapsuleLocalSignalCode {
  const LibraryCapsuleLocalSignalCode._();

  static const values = <String>[
    'L.S.001.VIEW',
    'L.S.002.VIEW',
    'L.S.003.VIEW',
    'L.S.004.VIEW',
    'L.S.005.VIEW',
    'L.C.001.OPEN',
    'L.C.003.OPEN',
    'L.C.004.OPEN',
    'L.C.005.OPEN',
    'L.B.001.TAP',
    'L.B.002.TAP',
    'L.B.003.TAP',
    'L.B.004.TAP',
    'L.SE.001.SEARCH',
    'L.F.001.FILTER',
    'L.SO.001.SORT',
    'L.P.001.OPEN',
    'L.E.001.OPEN',
    'L.R.001.SUBMIT',
    'L.A.001.PLAY',
    'L.G.001.SUBMIT',
    'L.X.001.OPEN',
  ];
}

class LibraryCapsuleSpeechState {
  const LibraryCapsuleSpeechState._();

  static const controls = 25;
  static const connected = 2;
  static const pending = 23;
  static const capability = 'LIBRARY_GENERATOR_PENDING';
}
