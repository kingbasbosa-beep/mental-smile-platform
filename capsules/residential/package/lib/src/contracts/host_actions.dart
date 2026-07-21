import 'package:flutter/widgets.dart';

class SafeExternalLinkLauncher {
  const SafeExternalLinkLauncher._();

  static Future<bool> open(BuildContext context, String url) async {
    return false;
  }

  static Future<bool> openUri(BuildContext context, Uri uri) async {
    return false;
  }
}

abstract class ResidentialCapsuleExternalActionContract {
  String get contractId;
  String get lineCode;
  int get version;
  Future<bool> openExternalUri(Uri uri);
}
