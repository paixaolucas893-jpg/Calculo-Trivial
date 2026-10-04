import 'package:flutter/material.dart';

import 'package:calcquest/l10n/app_localizations.dart';
import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data_en.dart';
import 'package:calcquest/shared/data/localized_algebra_course_content.dart';
import 'package:calcquest/shared/data/localized_equations_course_data.dart';
import 'package:calcquest/shared/data/localized_limits_course_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_foundations_course_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/services/premium_access_guard.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_bottom_navigation_bar.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../learning_path/presentation/learning_path_screen.dart';
import '../../profile/presentation/profile_screen.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool _checkingPremiumAccess = true;

  bool get _isEnglish =>
      Localizations.localeOf(context).languageCode.toLowerCase() == 'en';

  String _copy({required String pt, required String en}) =>
      _isEnglish ? en : pt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _verifyPremiumAccess());
  }

  Future<void> _verifyPremiumAccess() async {
    final hasAccess = await PremiumAccessGuard.ensureAccess(context);

    if (!mounted) return;

    if (!hasAccess) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
      return;
    }

    setState(() => _checkingPremiumAccess = false);
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

    if (index == 2) return;

    if (index == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
    }
  }

  int _availableContentLessonCount(Locale locale) {
    final algebraCount = localizedPrecalculusFoundationsCourseLessons(locale).length +
        localizedAlgebraCourseLessons(locale)
            .where((lesson) => lesson.id != 'algebra-04-potencias')
            .length;
    final equationsCount = localizedEquationsCourseLessons(locale).length +
        localizedPrecalculusEquationsSupplementLessons(locale).length;
    final functionsCount = localizedPrecalculusFunctionsCourseLessons(locale).length;
    final limitsCount = localizedLimitsCourseLessons(locale).length;
    final continuityCount = _isEnglish
        ? englishContinuityCourseLessons.length
        : continuityCourseLessons.length;
    final derivativesCount = _isEnglish
        ? derivativesCourseLessonsEn.length
        : derivativesCourseLessons.length;

    return algebraCount +
        equationsCount +
        functionsCount +
        limitsCount +
        continuityCount +
        derivativesCount;
  }

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

  Widget _metricCard({
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
              style: AppTypography.headingSmall.copyWith(
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

  Widget _sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(subtitle, style: AppTypography.bodySmall),
      ],
    );
  }

  Widget _progressHero({
    required int completedLessons,
    required int totalLessons,
    required int completedModules,
  }) {
    final progress = totalLessons == 0
        ? 0.0
        : (completedLessons / totalLessons).clamp(0.0, 1.0).toDouble();
    final percentage = (progress * 100).round();

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
          Text(
            _copy(pt: 'PROGRESSO ACADÊMICO', en: 'ACADEMIC PROGRESS'),
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.secondaryLight,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$percentage%',
                      style: AppTypography.displayLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      _copy(
                        pt: '$completedLessons de $totalLessons aulas concluídas',
                        en: '$completedLessons of $totalLessons lessons completed',
                      ),
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primaryLight,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      _copy(
                        pt: '$completedModules de 6 módulos dominados',
                        en: '$completedModules of 6 modules mastered',
                      ),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.78),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              SizedBox(
                width: 86,
                height: 86,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox.expand(
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 9,
                        backgroundColor:
                            AppColors.white.withValues(alpha: 0.14),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.secondary,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.school_rounded,
                      color: AppColors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.white.withValues(alpha: 0.14),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dailyGoalCard() {
    final answers = AppProgress.dailyAnsweredQuestions;
    final goal = AppProgress.dailyQuestionGoal;
    final progress = AppProgress.dailyGoalProgress;
    final completed = answers >= goal;
    final remaining = (goal - answers).clamp(0, goal);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: completed
                      ? AppColors.successLight
                      : AppColors.selectedBackground,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: Icon(
                  completed ? Icons.task_alt_rounded : Icons.flag_outlined,
                  color: completed ? AppColors.success : AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  _copy(pt: 'Meta de hoje', en: 'Today’s goal'),
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                '$answers/$goal',
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.progressTrack,
              valueColor: AlwaysStoppedAnimation<Color>(
                completed ? AppColors.success : AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            completed
                ? _copy(
                    pt: 'Meta diária concluída.',
                    en: 'Daily goal completed.',
                  )
                : _copy(
                    pt: 'Faltam $remaining questões para concluir a meta.',
                    en: '$remaining questions remaining to complete the goal.',
                  ),
            style: AppTypography.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _accuracyCard() {
    final total = AppProgress.totalAnswerAttempts;
    final correct = AppProgress.correctAnswerAttempts;
    final incorrect = AppProgress.incorrectAnswerAttempts;
    final accuracy = AppProgress.accuracy;
    final percentage = (accuracy * 100).round();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _copy(pt: 'Desempenho nas questões', en: 'Question performance'),
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                '$percentage%',
                style: AppTypography.headingSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            total == 0
                ? _copy(
                    pt: 'Responda questões para começar a medir sua precisão.',
                    en: 'Answer questions to start measuring your accuracy.',
                  )
                : _copy(
                    pt: 'Precisão calculada a partir de $total respostas.',
                    en: 'Accuracy calculated from $total answers.',
                  ),
            style: AppTypography.bodySmall,
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: accuracy,
              minHeight: 8,
              backgroundColor: AppColors.progressTrack,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _metricCard(
                icon: Icons.check_circle_outline_rounded,
                value: '$correct',
                label: _copy(pt: 'Acertos', en: 'Correct'),
                accent: AppColors.success,
                background: AppColors.successLight,
              ),
              const SizedBox(width: AppSpacing.sm),
              _metricCard(
                icon: Icons.cancel_outlined,
                value: '$incorrect',
                label: _copy(pt: 'Erros', en: 'Incorrect'),
                accent: AppColors.error,
                background: AppColors.errorLight,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingScreen(AppLocalizations l10n) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: AppSpacing.md),
                Text(
                  l10n.statisticsCheckingPremium,
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_checkingPremiumAccess) {
      return _buildLoadingScreen(l10n);
    }

    return ValueListenableBuilder<int>(
      valueListenable: AppProgress.revision,
      builder: (context, revision, child) {
        final locale = Localizations.localeOf(context);
        final completedLessons = AppProgress.completedContentLessonIds.length;
        final totalLessons = _availableContentLessonCount(locale);
        final completedModules = _completedModuleCount();
        final studyStreak = AppProgress.studyStreak;
        final totalAnswers = AppProgress.totalAnswerAttempts;

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
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.navy, AppColors.secondaryDark],
                          ),
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMedium),
                        ),
                        child: const Icon(
                          Icons.insights_rounded,
                          color: AppColors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          _copy(pt: 'Progresso', en: 'Progress'),
                          style: AppTypography.headingMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.xpLight,
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMedium),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.workspace_premium_outlined,
                              size: 16,
                              color: AppColors.xp,
                            ),
                            const SizedBox(width: AppSpacing.xxs),
                            Text(
                              'Premium',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.xp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    _copy(
                      pt: 'Acompanhe evidências reais da sua evolução no Cálculo Trivial.',
                      en: 'Track real evidence of your progress in Cálculo Trivial.',
                    ),
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _progressHero(
                    completedLessons: completedLessons,
                    totalLessons: totalLessons,
                    completedModules: completedModules,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                    _copy(pt: 'Visão geral', en: 'Overview'),
                    _copy(
                      pt: 'Indicadores registrados durante seu estudo.',
                      en: 'Indicators recorded during your study.',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      _metricCard(
                        icon: Icons.local_fire_department_rounded,
                        value: _copy(
                          pt: '$studyStreak dias',
                          en: '$studyStreak days',
                        ),
                        label: _copy(pt: 'Sequência', en: 'Streak'),
                        accent: AppColors.warningDark,
                        background: AppColors.warningLight,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      _metricCard(
                        icon: Icons.quiz_outlined,
                        value: '$totalAnswers',
                        label: _copy(
                          pt: 'Questões respondidas',
                          en: 'Questions answered',
                        ),
                        accent: AppColors.secondaryDark,
                        background: AppColors.secondaryLight,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                    _copy(pt: 'Atividade de hoje', en: 'Today’s activity'),
                    _copy(
                      pt: 'Sua meta diária é baseada nas questões respondidas.',
                      en: 'Your daily goal is based on answered questions.',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _dailyGoalCard(),
                  const SizedBox(height: AppSpacing.lg),
                  _sectionTitle(
                    _copy(pt: 'Desempenho', en: 'Performance'),
                    _copy(
                      pt: 'Acertos e erros acumulados nas atividades.',
                      en: 'Accumulated correct and incorrect answers.',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _accuracyCard(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: 2,
            onTap: (index) => _onMenuTap(context, index),
          ),
        );
      },
    );
  }
}
