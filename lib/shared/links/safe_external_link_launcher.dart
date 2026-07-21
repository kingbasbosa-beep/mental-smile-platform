import 'package:flutter/material.dart';
import 'package:mental_smile_os/l10n/shared/shared_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SafeExternalLinkLauncher {
  const SafeExternalLinkLauncher._();

  static const Set<String> _allowedSchemes = <String>{
    'https',
    'http',
    'mailto',
    'tel',
    'sms',
  };

  static Future<bool> open(
    BuildContext context,
    String url, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    final uri = Uri.tryParse(url.trim());
    if (!_isAllowed(uri)) {
      _showFailure(context);
      return false;
    }

    try {
      final opened = await launchUrl(uri!, mode: mode);
      if (!opened && context.mounted) {
        _showFailure(context);
      }
      return opened;
    } catch (_) {
      if (context.mounted) {
        _showFailure(context);
      }
      return false;
    }
  }

  static Future<bool> openUri(
    BuildContext context,
    Uri uri, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) {
    return open(context, uri.toString(), mode: mode);
  }

  static bool _isAllowed(Uri? uri) {
    if (uri == null || !_allowedSchemes.contains(uri.scheme.toLowerCase())) {
      return false;
    }
    if (uri.scheme == 'mailto' || uri.scheme == 'tel' || uri.scheme == 'sms') {
      return uri.path.trim().isNotEmpty;
    }

    final host = uri.host.toLowerCase();
    if (host.isEmpty ||
        host == 'localhost' ||
        host == 'example.com' ||
        host.endsWith('.example.com') ||
        host.endsWith('.test')) {
      return false;
    }
    return true;
  }

  static void _showFailure(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(SharedLocalizations.of(context).applicationLinkOpenFailed),
      ),
    );
  }
}
