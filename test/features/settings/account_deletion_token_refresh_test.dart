import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'account deletion refreshes Firebase ID token after reauthentication',
    () async {
      final source = await File(
        'lib/features/settings/presentation/settings_screen.dart',
      ).readAsString();

      final start = source.indexOf('Future<void> _deleteAccount(');
      final end = source.indexOf('Widget _buildSubscriptionStatus', start);
      final flow = source.substring(start, end);

      const tokenRefresh = 'await refreshedUser.getIdToken(true);';
      const deleteAccountCallable = "'deleteAccount'";

      final tokenRefreshIndex = flow.indexOf(tokenRefresh);
      final deleteAccountIndex = flow.indexOf(deleteAccountCallable);

      expect(tokenRefreshIndex, greaterThanOrEqualTo(0));
      expect(deleteAccountIndex, greaterThanOrEqualTo(0));
      expect(tokenRefreshIndex, lessThan(deleteAccountIndex));
    },
  );
}