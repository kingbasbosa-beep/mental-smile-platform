import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider<Locale?>((ref) => const Locale('ar'));

class LocaleStorage {
  Future<void> write(String code) async {}
}
