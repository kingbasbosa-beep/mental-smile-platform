import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('materialized copy map preserves expected runtime count', () {
    final copyMap =
        jsonDecode(File('CAPSULE_COPY_MAP.json').readAsStringSync())
            as List<dynamic>;
    expect(copyMap, hasLength(31));
  });

  test('capsule-owned asset copy count is separated from host assets', () {
    final summary =
        jsonDecode(File('CAPSULE_ASSET_COPY_SUMMARY.json').readAsStringSync())
            as Map<String, dynamic>;
    expect(summary['Copied'], 51);
    expect(summary['Contracted'], 9);
    expect(summary['Missing'], 0);
  });
}
