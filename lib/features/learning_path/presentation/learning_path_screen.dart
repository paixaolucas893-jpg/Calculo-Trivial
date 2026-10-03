import 'package:flutter/material.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data.dart';
import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';
import 'package:calcquest/shared/services/premium_access_guard.dart';
import 'package:calcquest/shared/services/revenuecat_service.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_bottom_navigation_bar.dart';

import '../../calculus_one/presentation/calculus_one_detail_screen.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../module_detail/presentation/module_detail_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../statistics/presentation/statistics_screen.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  bool _isEnglish(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'en';

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
      return;
    }

    if (index == 2) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const StatisticsScreen()),
      );
      return;
    }

    if (index == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
    }
  }

  void _goToFoundations(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ModuleDetailScreen()),
    );
  }

  Future<void> _goToCalculus(BuildContext context) async {
    final hasAccess = await PremiumAccessGuard.ensureAccess(context);

    if (!context.mounted || !hasAccess) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CalculusOneDetailScreen()),
    );
  }

  List<_PathModule> _modules(BuildContext context) {
    return [
      _PathModule(
        number: 1,
        title: _copy(context, pt: 'Álgebra', en: 'Algebra'),
        subtitle: _copy(
          context,
          pt: 'Expressões, frações e manipulação algébrica',
          en: 'Expressions, fractions, and algebraic manipulation',
        ),
        symbol: 'Σ',
        lessons: algebraCourseLessons,
        isCompleted: AppProgress.algebraFundamentalCompleted,
        isUnlocked: true,
        requiresPremium: false,
      ),
      _PathModule(
        number: 2,
        title: _copy(context, pt: 'Equações', en: 'Equations'),
        subtitle: _copy(
          context,
          pt: 'Equações, inequações e sistemas',
          en: 'Equations, inequalities, and systems',
        ),
        symbol: 'x',
        lessons: <CourseLessonData>[
          ...equationsCourseLessons,
          ...precalculusEquationsSupplementLessons,
        ],
        isCompleted: AppProgress.equationsAndInequationsCompleted,
        isUnlocked: AppProgress.algebraFundamentalCompleted,
        requiresPremium: false,
      ),
      _PathModule(
        number: 3,
        title: _copy(context, pt: 'Funções', en: 'Functions'),
        subtitle: _copy(
          context,
          pt: 'Conceitos, gráficos e transformações',
          en: 'Concepts, graphs, and transformations',
        ),
        symbol: 'f',
        lessons: precalculusFunctionsCourseLessons,
        isCompleted: AppProgress.functionsCompleted,
        isUnlocked: AppProgress.equationsAndInequationsCompleted,
        requiresPremium: false,
      ),
      _PathModule(
        number: 4,
        title: _copy(context, pt: 'Limites', en: 'Limits'),
        subtitle: _copy(
          context,
          pt: 'Comportamento e aproximação de funções',
          en: 'Function behavior and approximation',
        ),
        symbol: 'lim',
        lessons: limitsCourseLessons,
        isCompleted: AppProgress.limitsCompleted,
        isUnlocked: AppProgress.functionsCompleted,
        requiresPremium: true,
      ),
      _PathModule(
        number: 5,
        title: _copy(context, pt: 'Continuidade', en: 'Continuity'),
        subtitle: _copy(
          context,
          pt: 'Funções contínuas e descontinuidades',
          en: 'Continuous functions and discontinuities',
        ),
        symbol: '∿',
        lessons: continuityCourseLessons,
        isCompleted: AppProgress.continuityCompleted,
        isUnlocked: AppProgress.limitsCompleted,
        requiresPremium: true,
      ),
      _PathModule(
        number: 6,
        title: _copy(context, pt: 'Derivadas', en: 'Derivatives'),
        subtitle: _copy(
          context,
          pt: 'Taxas, tangentes e aplicações',
          en: 'Rates, tangents, and applications',
        ),
        symbol: "f′",
        lessons: derivativesCourseLessons,
        isCompleted: AppProgress.derivativesCompleted,
        isUnlocked: AppProgress.continuityCompleted,
        requiresPremium: true,
      ),
    ];
  }

  double _lessonProgress(_PathModule module) {
    if (module.lessons.isEmpty) {
      return module.isCompleted ? 1 : 0;
    }

    final completedLessons = module.lessons.where(
      (lesson) => AppProgress.isContentLessonCompleted(lesson.id),
    );

    if (module.isCompleted) {
      return 1;
    }

    return (completedLessons.length / module.lessons.length)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  int _completedModuleCount(List<_PathModule> modules) {
    return modules.where((module) => module.isCompleted).length;
  }

  _ModuleVisualState _visualState(_PathModule module) {
    if (module.isCompleted) {
      return _ModuleVisualState.completed;
    }

    if (module.isUnlocked) {
      return _ModuleVisualState.current;
    }

    return _ModuleVisualState.locked;
  }

  Future<void> _openModule(
    BuildContext context,
    _PathModule module,
  ) async {
    if (!module.isUnlocked) {
      return;
    }

    if (module.number <= 3) {
      _goToFoundations(context);
      return;
    }

    await _goToCalculus(context);
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _copy(
            context,
            pt: 'Suas trilhas de estudo',
            en: 'Your learning path',
          ),
          style: AppTypography.headingMedium.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          _copy(
            context,
            pt: 'Uma jornada completa, do pré-cálculo às derivadas.',
            en: 'A complete journey from precalculus to derivatives.',
          ),
          style: AppTypography.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildSummary(
    BuildContext context,
    List<_PathModule> modules,
  ) {
    final completed = _completedModuleCount(modules);
    final progress = completed / modules.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.navy,
            Color(0xFF0B4F73),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusXXLarge),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    backgroundColor:
                        AppColors.white.withValues(alpha: 0.14),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.secondary,
                    ),
                  ),
                ),
                Text(
                  '${(progress * 100).round()}%',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _copy(
                    context,
                    pt: 'Jornada de Cálculo',
                    en: 'Calculus journey',
                  ),
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  _copy(
                    context,
                    pt: '$completed de ${modules.length} módulos concluídos',
                    en: '$completed of ${modules.length} modules completed',
                  ),
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(
    BuildContext context,
    _PathModule module,
    _ModuleVisualState state,
    bool isPremiumUser,
  ) {
    final isPremiumLocked =
        module.requiresPremium && !isPremiumUser && module.isUnlocked;

    final Color color;
    final String label;
    final IconData icon;

    if (state == _ModuleVisualState.completed) {
      color = AppColors.success;
      label = _copy(context, pt: 'Concluído', en: 'Completed');
      icon = Icons.check_circle_rounded;
    } else if (isPremiumLocked) {
      color = AppColors.warningDark;
      label = 'Premium';
      icon = Icons.workspace_premium_rounded;
    } else if (state == _ModuleVisualState.current) {
      color = AppColors.primary;
      label = _copy(context, pt: 'Em andamento', en: 'In progress');
      icon = Icons.play_circle_rounded;
    } else {
      color = AppColors.locked;
      label = _copy(context, pt: 'Bloqueado', en: 'Locked');
      icon = Icons.lock_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard({
    required BuildContext context,
    required _PathModule module,
    required bool isPremiumUser,
    required bool isLast,
  }) {
    final state = _visualState(module);
    final progress = _lessonProgress(module);
    final isLocked = state == _ModuleVisualState.locked;
    final isCurrent = state == _ModuleVisualState.current;

    final borderColor = state == _ModuleVisualState.completed
        ? AppColors.success.withValues(alpha: 0.35)
        : isCurrent
            ? AppColors.primaryLight
            : AppColors.border;

    final symbolColor = state == _ModuleVisualState.completed
        ? AppColors.successDark
        : isLocked
            ? AppColors.locked
            : AppColors.primary;

    final symbolBackground = state == _ModuleVisualState.completed
        ? AppColors.successLight
        : isLocked
            ? AppColors.lockedBackground
            : AppColors.selectedBackground;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 34,
            child: Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: state == _ModuleVisualState.completed
                        ? AppColors.success
                        : isCurrent
                            ? AppColors.primary
                            : AppColors.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: state == _ModuleVisualState.completed
                          ? AppColors.success
                          : isCurrent
                              ? AppColors.primary
                              : AppColors.borderStrong,
                      width: 2,
                    ),
                  ),
                  child: state == _ModuleVisualState.completed
                      ? const Icon(
                          Icons.check_rounded,
                          color: AppColors.white,
                          size: 13,
                        )
                      : isCurrent
                          ? const Center(
                              child: SizedBox(
                                width: 6,
                                height: 6,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            )
                          : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xs,
                      ),
                      color: state == _ModuleVisualState.completed
                          ? AppColors.success.withValues(alpha: 0.35)
                          : AppColors.border,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 220),
              opacity: isLocked ? 0.72 : 1,
              child: InkWell(
                onTap: module.isUnlocked
                    ? () => _openModule(context, module)
                    : null,
                borderRadius:
                    BorderRadius.circular(AppSpacing.radiusLarge),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: isLast ? 0 : AppSpacing.md,
                  ),
                  padding:
                      const EdgeInsets.all(AppSpacing.cardPadding),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusLarge),
                    border: Border.all(
                      color: borderColor,
                      width: isCurrent ? 1.5 : 1,
                    ),
                    boxShadow: isCurrent
                        ? const [
                            BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 14,
                              offset: Offset(0, 6),
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: symbolBackground,
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusMedium,
                              ),
                            ),
                            child: Text(
                              module.symbol,
                              style: AppTypography.titleLarge.copyWith(
                                color: symbolColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${module.number}. ${module.title}',
                                  style: AppTypography.titleMedium.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: isLocked
                                        ? AppColors.textMuted
                                        : AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.xxs),
                                Text(
                                  module.subtitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          if (module.isUnlocked)
                            Icon(
                              state == _ModuleVisualState.completed
                                  ? Icons.check_circle_rounded
                                  : Icons.arrow_forward_rounded,
                              color: state ==
                                      _ModuleVisualState.completed
                                  ? AppColors.success
                                  : AppColors.primary,
                            )
                          else
                            const Icon(
                              Icons.lock_outline_rounded,
                              color: AppColors.locked,
                            ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 7,
                                backgroundColor:
                                    AppColors.progressTrack,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(
                                  state ==
                                          _ModuleVisualState.completed
                                      ? AppColors.success
                                      : isLocked
                                          ? AppColors.locked
                                          : AppColors.secondaryDark,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            '${(progress * 100).round()}%',
                            style: AppTypography.labelSmall.copyWith(
                              color: isLocked
                                  ? AppColors.textMuted
                                  : AppColors.textSecondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _buildStatusBadge(
                        context,
                        module,
                        state,
                        isPremiumUser,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: AppProgress.revision,
      builder: (context, revision, child) {
        final modules = _modules(context);

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenHorizontal,
                AppSpacing.md,
                AppSpacing.screenHorizontal,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: AppSpacing.lg),
                  _buildSummary(context, modules),
                  const SizedBox(height: AppSpacing.lg),
                  Expanded(
                    child: ValueListenableBuilder<bool>(
                      valueListenable:
                          RevenueCatService.premiumAccess,
                      builder: (
                        context,
                        isPremiumUser,
                        child,
                      ) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(
                            bottom: AppSpacing.lg,
                          ),
                          itemCount: modules.length,
                          itemBuilder: (context, index) {
                            return TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: 1),
                              duration: Duration(
                                milliseconds: 320 + (index * 90),
                              ),
                              curve: Curves.easeOutCubic,
                              builder: (
                                context,
                                value,
                                child,
                              ) {
                                return Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(
                                      0,
                                      16 * (1 - value),
                                    ),
                                    child: child,
                                  ),
                                );
                              },
                              child: _buildModuleCard(
                                context: context,
                                module: modules[index],
                                isPremiumUser: isPremiumUser,
                                isLast:
                                    index == modules.length - 1,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: 1,
            onTap: (index) => _onMenuTap(context, index),
          ),
        );
      },
    );
  }
}

class _PathModule {
  final int number;
  final String title;
  final String subtitle;
  final String symbol;
  final List<CourseLessonData> lessons;
  final bool isCompleted;
  final bool isUnlocked;
  final bool requiresPremium;

  const _PathModule({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.symbol,
    required this.lessons,
    required this.isCompleted,
    required this.isUnlocked,
    required this.requiresPremium,
  });
}

enum _ModuleVisualState {
  completed,
  current,
  locked,
}
