enum CoreSignalFamily {
  login('login'),
  logout('logout'),
  survey('survey'),
  feedback('feedback'),
  application('application');

  const CoreSignalFamily(this.value);

  final String value;
}

enum CoreLogicalTarget {
  login('login'),
  logout('logout'),
  survey('survey'),
  feedback('feedback'),
  application('application');

  const CoreLogicalTarget(this.value);

  final String value;
}

enum CoreCodeEnvironment {
  test('test'),
  production('production');

  const CoreCodeEnvironment(this.value);

  final String value;
}
