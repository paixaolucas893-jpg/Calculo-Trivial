import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('account deletion refreshes Firebase ID token after reauthentication', () async {
    final source = await File(
      'lib/features/settings/presentation/settings_screen.dart',
    ).readAsString();

    final start = source.indexOf('Future<void> _deleteAccount(');
    final end = source.indexOf('Widget _buildSubscriptionStatus', start);
    final flow = source.substring(start, end);

    expect(flow, contains('await refreshedUser.getIdToken(true);'));
    expect(
      flow.indexOf('await refreshedUser.getIdToken(true);'),
      lessThan(flow.indexOf("httpsCallable(\n        'deleteAccount'")),
    );
  });
}
