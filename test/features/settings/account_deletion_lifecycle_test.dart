import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fluxo de exclusão de conta', () {
    late String source;

    setUpAll(() async {
      source = await File(
        'lib/features/settings/presentation/settings_screen.dart',
      ).readAsString();
    });

    test('não descarta controller de senha durante fechamento do diálogo', () {
      final start = source.indexOf('Future<void> _confirmDeleteAccount()');
      final end = source.indexOf('Future<void> _deleteAccount(', start);
      final flow = source.substring(start, end);

      expect(flow, isNot(contains('TextEditingController')));
      expect(flow, contains("var passwordInput = '';"));
      expect(
        RegExp(
          r'await _waitForDialogRouteToSettle\(\);',
        ).allMatches(flow),
        hasLength(2),
      );
    });

    test('estabiliza a árvore antes de remover a pilha de navegação', () {
      final start = source.indexOf('Future<void> _deleteAccount(');
      final end = source.indexOf(
        'Widget _buildSubscriptionStatus',
        start,
      );
      final flow = source.substring(start, end);

      expect(
        flow,
        contains('await WidgetsBinding.instance.endOfFrame;'),
      );
      expect(flow, contains('Navigator.of(context).pushAndRemoveUntil('));
      expect(
        flow.indexOf('await WidgetsBinding.instance.endOfFrame;'),
        lessThan(flow.indexOf('Navigator.of(context).pushAndRemoveUntil(')),
      );
    });
  });
}
