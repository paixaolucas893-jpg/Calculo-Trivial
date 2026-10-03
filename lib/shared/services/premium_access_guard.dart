import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import 'revenuecat_service.dart';

class PremiumAccessGuard {
  PremiumAccessGuard._();

  static Future<bool> ensureAccess(BuildContext context) async {
    if (RevenueCatService.isPremium) {
      return true;
    }

    if (!RevenueCatService.isConfigured) {
      final configured = await RevenueCatService.ensureConfigured(
        appUserId: FirebaseAuth.instance.currentUser?.uid,
      );

      if (!configured) {
        if (context.mounted) {
          _showMessage(
            context,
            'O sistema Premium não conseguiu inicializar. Verifique a conexão e tente novamente.',
          );
        }

        return false;
      }
    }

    try {
      final alreadyPremium = await RevenueCatService.refreshPremiumStatus();

      if (alreadyPremium) {
        return true;
      }

      await RevenueCatUI.presentPaywallIfNeeded(
        RevenueCatService.entitlementPremium,
      );

      final premiumAfterPaywall =
          await RevenueCatService.refreshPremiumStatus();

      return premiumAfterPaywall;
    } catch (error) {
      debugPrint('PremiumAccessGuard: erro ao verificar acesso: $error');

      if (context.mounted) {
        _showMessage(context, 'Não foi possível verificar seu acesso Premium.');
      }

      return false;
    }
  }

  static void _showMessage(BuildContext context, String message) {
    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
