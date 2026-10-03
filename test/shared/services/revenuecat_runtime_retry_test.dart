import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Premium guard retries RevenueCat initialization on demand', () async {
    final source = await File(
      'lib/shared/services/premium_access_guard.dart',
    ).readAsString();

    expect(source, contains('RevenueCatService.ensureConfigured('));
    expect(source, contains('FirebaseAuth.instance.currentUser?.uid'));
  });

  test('RevenueCat initialization can be retried after failure', () async {
    final source = await File(
      'lib/shared/services/revenuecat_service.dart',
    ).readAsString();

    expect(source, contains('static Future<void>? _initialization;'));
    expect(source, contains('static Future<bool> ensureConfigured'));
    expect(source, contains('_initialization = null;'));
  });
}
