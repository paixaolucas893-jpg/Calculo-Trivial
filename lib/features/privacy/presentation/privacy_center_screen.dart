import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:calcquest/l10n/app_localizations.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_icon.dart';

class PrivacyCenterScreen extends StatefulWidget {
  const PrivacyCenterScreen({super.key});

  @override
  State<PrivacyCenterScreen> createState() => _PrivacyCenterScreenState();
}

class _PrivacyCenterScreenState extends State<PrivacyCenterScreen> {
  static final Uri _privacyPolicyUri = Uri.parse(
    'https://calculo-trivial-app-646bb.web.app',
  );

  bool _exporting = false;

  bool get _isPortuguese =>
      Localizations.localeOf(context).languageCode == 'pt';

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _openPrivacyPolicy() async {
    try {
      final opened = await launchUrl(
        _privacyPolicyUri,
        mode: LaunchMode.externalApplication,
      );

      if (!opened) {
        _showMessage(
          _isPortuguese
              ? 'Não foi possível abrir a Política de Privacidade.'
              : 'Unable to open the Privacy Policy.',
        );
      }
    } catch (_) {
      _showMessage(
        _isPortuguese
            ? 'Não foi possível abrir a Política de Privacidade.'
            : 'Unable to open the Privacy Policy.',
      );
    }
  }

  Future<void> _exportMyData() async {
    if (_exporting) {
      return;
    }

    setState(() {
      _exporting = true;
    });

    try {
      final callable = FirebaseFunctions.instanceFor(
        region: 'us-central1',
      ).httpsCallable(
        'exportMyData',
        options: HttpsCallableOptions(
          timeout: const Duration(seconds: 30),
        ),
      );

      final result = await callable.call<Map<String, dynamic>>(
        const <String, dynamic>{},
      );

      final encoder = const JsonEncoder.withIndent('  ');
      final jsonText = encoder.convert(result.data);
      final bytes = Uint8List.fromList(utf8.encode(jsonText));
      final date = DateTime.now().toIso8601String().split('T').first;
      final fileName = 'calculo-trivial-meus-dados-$date.json';

      await SharePlus.instance.share(
        ShareParams(
          title: _isPortuguese
              ? 'Meus dados — Cálculo Trivial'
              : 'My data — Cálculo Trivial',
          text: _isPortuguese
              ? 'Exportação dos meus dados pessoais do Cálculo Trivial.'
              : 'Export of my personal data from Cálculo Trivial.',
          files: <XFile>[
            XFile.fromData(
              bytes,
              mimeType: 'application/json',
            ),
          ],
          fileNameOverrides: <String>[fileName],
        ),
      );
    } on FirebaseFunctionsException catch (error) {
      debugPrint(
        'Centro de Privacidade: exportação falhou: '
        '${error.code} - ${error.message}',
      );

      _showMessage(
        _isPortuguese
            ? 'Não foi possível preparar seus dados agora.'
            : 'Unable to prepare your data right now.',
      );
    } catch (error) {
      debugPrint(
        'Centro de Privacidade: erro inesperado na exportação: $error',
      );

      _showMessage(
        _isPortuguese
            ? 'Não foi possível exportar seus dados.'
            : 'Unable to export your data.',
      );
    } finally {
      if (mounted) {
        setState(() {
          _exporting = false;
        });
      }
    }
  }

  Future<void> _showTutorPrivacy() async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            _isPortuguese
                ? 'Privacidade do Tutor Trivial'
                : 'Tutor Trivial privacy',
          ),
          content: Text(
            _isPortuguese
                ? 'Quando você utiliza o Tutor Trivial, o aplicativo pode enviar '
                    'ao backend a aula, a questão, a tentativa e o contexto '
                    'pedagógico necessário para gerar pistas e explicações. '
                    'Senhas e dados de pagamento não são enviados ao Tutor. '
                    'A IA não pode conceder aprovação, alterar uma resposta já '
                    'registrada ou liberar recursos Premium por decisão própria.'
                : 'When you use Tutor Trivial, the app may send the lesson, '
                    'question, attempt, and necessary learning context to the '
                    'backend to generate hints and explanations. Passwords and '
                    'payment data are not sent to the Tutor. AI cannot grant '
                    'approval, change a recorded answer, or unlock Premium '
                    'features on its own.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(_isPortuguese ? 'Entendi' : 'Got it'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        title: Text(
          l10n.settingsPrivacyAndData,
          style: AppTypography.titleLarge,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.screenHorizontal,
          AppSpacing.md,
          AppSpacing.screenHorizontal,
          AppSpacing.screenBottom,
        ),
        children: [
          Text(
            _isPortuguese
                ? 'Controle seus dados'
                : 'Control your data',
            style: AppTypography.headingMedium,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            _isPortuguese
                ? 'Consulte informações sobre privacidade, exporte uma cópia '
                    'dos dados associados à sua conta e entenda como o Tutor '
                    'Trivial utiliza contexto pedagógico.'
                : 'Review privacy information, export a copy of data associated '
                    'with your account, and understand how Tutor Trivial uses '
                    'learning context.',
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          _PrivacyActionCard(
            icon: Icons.download_rounded,
            title: _isPortuguese
                ? 'Baixar meus dados'
                : 'Download my data',
            subtitle: _isPortuguese
                ? 'Gere um arquivo JSON com seus dados de conta, progresso e '
                    'sessões armazenadas do Tutor.'
                : 'Generate a JSON file with your account data, progress, and '
                    'stored Tutor sessions.',
            trailing: _exporting
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : null,
            onTap: _exporting ? null : _exportMyData,
          ),
          const SizedBox(height: AppSpacing.md),
          _PrivacyActionCard(
            icon: Icons.privacy_tip_outlined,
            title: _isPortuguese
                ? 'Política de Privacidade'
                : 'Privacy Policy',
            subtitle: _isPortuguese
                ? 'Veja finalidades, compartilhamentos, retenção e seus direitos.'
                : 'Review purposes, sharing, retention, and your rights.',
            onTap: _openPrivacyPolicy,
          ),
          const SizedBox(height: AppSpacing.md),
          _PrivacyActionCard(
            icon: Icons.school_outlined,
            title: _isPortuguese
                ? 'Privacidade do Tutor'
                : 'Tutor privacy',
            subtitle: _isPortuguese
                ? 'Entenda quais dados pedagógicos podem ser utilizados pelo Tutor.'
                : 'Understand which learning data may be used by the Tutor.',
            onTap: _showTutorPrivacy,
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
            decoration: BoxDecoration(
              color: AppColors.surfaceSecondary,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppIcon(
                  icon: Icons.info_outline_rounded,
                  size: AppIconSize.large,
                  color: AppColors.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    _isPortuguese
                        ? 'A exportação não inclui senhas nem dados completos '
                            'de pagamento. A exclusão permanente da conta '
                            'continua disponível em Configurações.'
                        : 'The export does not include passwords or complete '
                            'payment data. Permanent account deletion remains '
                            'available in Settings.',
                    style: AppTypography.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacyActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _PrivacyActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.selectedBackground,
                  borderRadius: BorderRadius.circular(
                    AppSpacing.radiusMedium,
                  ),
                ),
                child: AppIcon(
                  icon: icon,
                  size: AppIconSize.large,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.titleMedium),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(subtitle, style: AppTypography.bodySmall),
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (onTap != null)
                const AppIcon(
                  icon: Icons.chevron_right_rounded,
                  size: AppIconSize.large,
                  color: AppColors.textMuted,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
