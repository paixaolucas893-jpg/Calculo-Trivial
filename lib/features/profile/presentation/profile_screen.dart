import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:calcquest/l10n/app_localizations.dart';
import 'package:calcquest/shared/services/revenuecat_service.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_bottom_navigation_bar.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../learning_path/presentation/learning_path_screen.dart';
import '../../settings/presentation/settings_screen.dart';
import '../../statistics/presentation/statistics_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  bool _isEnglish(BuildContext context) =>
      Localizations.localeOf(context).languageCode.toLowerCase() == 'en';

  String _copy(
    BuildContext context, {
    required String pt,
    required String en,
  }) {
    return _isEnglish(context) ? en : pt;
  }

  void _onMenuTap(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
      return;
    }

    if (index == 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LearningPathScreen()),
      );
      return;
    }

    if (index == 2) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const StatisticsScreen()),
      );
      return;
    }

    if (index == 3) return;
  }

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  String _displayName(User? user, AppLocalizations l10n) {
    final name = user?.displayName?.trim();

    if (name != null && name.isNotEmpty) {
      return name;
    }

    final email = user?.email?.trim();

    if (email != null && email.isNotEmpty) {
      return email.split('@').first;
    }

    return l10n.student;
  }

  String _initials(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) return 'CT';
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }

    return '${parts.first.substring(0, 1)}${parts.last.substring(0, 1)}'
        .toUpperCase();
  }

  int _levelFromXp(int xp) => (xp ~/ 250) + 1;

  int _completedModuleCount() {
    return <bool>[
      AppProgress.algebraFundamentalCompleted,
      AppProgress.equationsAndInequationsCompleted,
      AppProgress.functionsCompleted,
      AppProgress.limitsCompleted,
      AppProgress.continuityCompleted,
      AppProgress.derivativesCompleted,
    ].where((completed) => completed).length;
  }

  ({
    String title,
    String description,
    bool unlocked,
  }) _achievementData(AppLocalizations l10n) {
    if (AppProgress.derivativesCompleted) {
      return (
        title: l10n.achievementCalculusOneMastered,
        description: l10n.achievementCalculusOneMasteredDescription,
        unlocked: true,
      );
    }

    if (AppProgress.continuityCompleted) {
      return (
        title: l10n.achievementContinuityCompleted,
        description: l10n.achievementContinuityCompletedDescription,
        unlocked: true,
      );
    }

    if (AppProgress.limitsCompleted) {
      return (
        title: l10n.achievementFirstCalculusSteps,
        description: l10n.achievementFirstCalculusStepsDescription,
        unlocked: true,
      );
    }

    if (AppProgress.functionsCompleted) {
      return (
        title: l10n.achievementFoundationsMastered,
        description: l10n.achievementFoundationsMasteredDescription,
        unlocked: true,
      );
    }

    if (AppProgress.equationsAndInequationsCompleted) {
      return (
        title: l10n.achievementEquationsCompleted,
        description: l10n.achievementEquationsCompletedDescription,
        unlocked: true,
      );
    }

    if (AppProgress.algebraFundamentalCompleted) {
      return (
        title: l10n.achievementFirstLessonCompleted,
        description: l10n.achievementFirstLessonCompletedDescription,
        unlocked: true,
      );
    }

    return (
      title: l10n.achievementFirstAchievement,
      description: l10n.achievementFirstAchievementDescription,
      unlocked: false,
    );
  }

  Widget _sectionTitle(
    BuildContext context, {
    required String pt,
    required String en,
    String? subtitlePt,
    String? subtitleEn,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _copy(context, pt: pt, en: en),
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        if (subtitlePt != null && subtitleEn != null) ...[
          const SizedBox(height: AppSpacing.xxs),
          Text(
            _copy(context, pt: subtitlePt, en: subtitleEn),
            style: AppTypography.bodySmall,
          ),
        ],
      ],
    );
  }

  Widget _buildIdentityCard(
    BuildContext context, {
    required User? user,
    required String name,
    required String email,
  }) {
    final verified = user?.emailVerified ?? false;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.navy, Color(0xFF0B4F73)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusXXLarge),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.18),
                  ),
                ),
                child: Text(
                  _initials(name),
                  style: AppTypography.headingSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.headingMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(AppSpacing.radiusXLarge),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  verified
                      ? Icons.verified_user_outlined
                      : Icons.info_outline_rounded,
                  color: verified
                      ? AppColors.secondaryLight
                      : AppColors.primaryLight,
                  size: 17,
                ),
                const SizedBox(width: AppSpacing.xs),
                Flexible(
                  child: Text(
                    verified
                        ? _copy(
                            context,
                            pt: 'E-mail verificado',
                            en: 'Verified email',
                          )
                        : _copy(
                            context,
                            pt: 'E-mail ainda não verificado',
                            en: 'Email not yet verified',
                          ),
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric({
    required IconData icon,
    required String value,
    required String label,
    required Color accent,
    required Color background,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
              child: Icon(icon, color: accent, size: 20),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              value,
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(label, style: AppTypography.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildStudySnapshot(BuildContext context) {
    final xp = AppProgress.totalXp;
    final gold = AppProgress.totalGold;
    final level = _levelFromXp(xp);
    final modules = _completedModuleCount();
    final lessons = AppProgress.completedContentLessonIds.length;
    final streak = AppProgress.studyStreak;

    return Column(
      children: [
        Row(
          children: [
            _buildMetric(
              icon: Icons.school_outlined,
              value: '$modules/6',
              label: _copy(
                context,
                pt: 'Módulos concluídos',
                en: 'Modules completed',
              ),
              accent: AppColors.primary,
              background: AppColors.selectedBackground,
            ),
            const SizedBox(width: AppSpacing.sm),
            _buildMetric(
              icon: Icons.menu_book_outlined,
              value: '$lessons',
              label: _copy(
                context,
                pt: 'Aulas concluídas',
                en: 'Lessons completed',
              ),
              accent: AppColors.success,
              background: AppColors.successLight,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            _buildMetric(
              icon: Icons.local_fire_department_outlined,
              value: _copy(
                context,
                pt: '$streak dias',
                en: '$streak days',
              ),
              label: _copy(
                context,
                pt: 'Sequência',
                en: 'Streak',
              ),
              accent: AppColors.warningDark,
              background: AppColors.warningLight,
            ),
            const SizedBox(width: AppSpacing.sm),
            _buildMetric(
              icon: Icons.military_tech_outlined,
              value: _copy(
                context,
                pt: 'Nível $level',
                en: 'Level $level',
              ),
              label: '$xp XP • $gold',
              accent: AppColors.xp,
              background: AppColors.xpLight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementCard(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final achievement = _achievementData(l10n);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        color: achievement.unlocked
            ? AppColors.achievementLight
            : AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(
          color: achievement.unlocked
              ? AppColors.achievement.withValues(alpha: 0.35)
              : AppColors.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: achievement.unlocked
                  ? AppColors.white
                  : AppColors.surfaceSecondary,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            ),
            child: Icon(
              achievement.unlocked
                  ? Icons.emoji_events_outlined
                  : Icons.lock_outline_rounded,
              color: achievement.unlocked
                  ? AppColors.achievement
                  : AppColors.textMuted,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.unlocked
                      ? _copy(
                          context,
                          pt: 'Conquista mais recente',
                          en: 'Latest achievement',
                        )
                      : _copy(
                          context,
                          pt: 'Primeira conquista',
                          en: 'First achievement',
                        ),
                  style: AppTypography.labelSmall.copyWith(
                    color: achievement.unlocked
                        ? AppColors.achievement
                        : AppColors.textMuted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  achievement.title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  achievement.description,
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumCard(
    BuildContext context,
    bool isPremium,
    AppLocalizations l10n,
  ) {
    final accent = isPremium ? AppColors.success : AppColors.gold;
    final background =
        isPremium ? AppColors.successLight : AppColors.goldLight;

    return InkWell(
      onTap: () => _openSettings(context),
      borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          border: Border.all(color: accent.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
              child: Icon(
                isPremium
                    ? Icons.workspace_premium_rounded
                    : Icons.lock_outline_rounded,
                color: accent,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isPremium ? l10n.premiumActive : l10n.freePlan,
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    isPremium
                        ? l10n.premiumManageSubscription
                        : l10n.premiumDiscoverFeatures,
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    return InkWell(
      onTap: () => _openSettings(context),
      borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
      child: Container(
        width: double.infinity,
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
                color: AppColors.surfaceSecondary,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
              child: const Icon(
                Icons.settings_outlined,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.settings,
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    _copy(
                      context,
                      pt: 'Idioma, conta, assinatura, privacidade e segurança.',
                      en: 'Language, account, subscription, privacy, and security.',
                    ),
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ValueListenableBuilder<int>(
      valueListenable: AppProgress.revision,
      builder: (context, revision, child) {
        final user = FirebaseAuth.instance.currentUser;
        final name = _displayName(user, l10n);
        final email = user?.email ?? l10n.emailNotProvided;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenHorizontal,
                AppSpacing.md,
                AppSpacing.screenHorizontal,
                AppSpacing.screenBottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _copy(context, pt: 'Perfil', en: 'Profile'),
                    style: AppTypography.headingMedium.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    _copy(
                      context,
                      pt: 'Sua conta e seu histórico de aprendizagem.',
                      en: 'Your account and learning history.',
                    ),
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _buildIdentityCard(
                    context,
                    user: user,
                    name: name,
                    email: email,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                    context,
                    pt: 'Panorama de estudo',
                    en: 'Study overview',
                    subtitlePt:
                        'Indicadores registrados durante sua jornada.',
                    subtitleEn:
                        'Indicators recorded throughout your learning journey.',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildStudySnapshot(context),
                  const SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                    context,
                    pt: 'Conquistas',
                    en: 'Achievements',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildAchievementCard(context, l10n),
                  const SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                    context,
                    pt: 'Plano e conta',
                    en: 'Plan and account',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ValueListenableBuilder<bool>(
                    valueListenable: RevenueCatService.premiumAccess,
                    builder: (context, isPremium, child) {
                      return _buildPremiumCard(context, isPremium, l10n);
                    },
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildSettingsCard(context, l10n),
                ],
              ),
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: 3,
            onTap: (index) => _onMenuTap(context, index),
          ),
        );
      },
    );
  }
}
