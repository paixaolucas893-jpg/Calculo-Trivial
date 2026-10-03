import 'package:flutter/material.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data_en.dart';
import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/localized_algebra_course_content.dart';
import 'package:calcquest/shared/data/localized_continuity_course_data.dart';
import 'package:calcquest/shared/data/localized_equations_course_data.dart';
import 'package:calcquest/shared/data/localized_limits_course_data.dart';
import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_foundations_course_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_bottom_navigation_bar.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../exercise_review/presentation/exercise_review_screen.dart';
import '../../exercises/presentation/algebra_practice_screen.dart';
import '../../exercises/presentation/continuity_exercises_screen.dart';
import '../../exercises/presentation/derivatives_exercises_screen.dart';
import '../../exercises/presentation/equations_exercises_screen.dart';
import '../../exercises/presentation/functions_exercises_screen.dart';
import '../../exercises/presentation/limits_exercises_screen.dart';
import '../../learning_path/presentation/learning_path_screen.dart';
import '../../lesson/presentation/course_lesson_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../statistics/presentation/statistics_screen.dart';

class ModuleDetailScreen extends StatefulWidget {
  final String moduleId;

  const ModuleDetailScreen({
    super.key,
    required this.moduleId,
  });

  @override
  State<ModuleDetailScreen> createState() => _ModuleDetailScreenState();
}

class _ModuleDetailScreenState extends State<ModuleDetailScreen> {
  bool get _isEnglish =>
      Localizations.localeOf(context).languageCode == 'en';

  String _copy({
    required String pt,
    required String en,
  }) {
    return _isEnglish ? en : pt;
  }

  _ModuleConfig get _module {
    final locale = Localizations.localeOf(context);

    switch (widget.moduleId) {
      case AppProgress.algebraFundamentalId:
        return _ModuleConfig(
          id: widget.moduleId,
          title: _copy(pt: 'Álgebra', en: 'Algebra'),
          eyebrow: _copy(pt: 'PRÉ-CÁLCULO', en: 'PRECALCULUS'),
          description: _copy(
            pt: 'Construa a base algébrica necessária para avançar com segurança em funções e cálculo.',
            en: 'Build the algebraic foundation required to progress confidently into functions and calculus.',
          ),
          symbol: 'Σ',
          lessons: <CourseLessonData>[
            ...localizedPrecalculusFoundationsCourseLessons(locale),
            ...localizedAlgebraCourseLessons(locale).where(
              (lesson) => lesson.id != 'algebra-04-potencias',
            ),
          ],
          isCompleted: AppProgress.algebraFundamentalCompleted,
        );
      case AppProgress.equationsAndInequationsId:
        return _ModuleConfig(
          id: widget.moduleId,
          title: _copy(pt: 'Equações', en: 'Equations'),
          eyebrow: _copy(pt: 'PRÉ-CÁLCULO', en: 'PRECALCULUS'),
          description: _copy(
            pt: 'Aprenda a modelar, resolver e verificar equações, inequações e sistemas.',
            en: 'Learn to model, solve, and verify equations, inequalities, and systems.',
          ),
          symbol: '=',
          lessons: <CourseLessonData>[
            ...localizedEquationsCourseLessons(locale),
            ...localizedPrecalculusEquationsSupplementLessons(locale),
          ],
          isCompleted: AppProgress.equationsAndInequationsCompleted,
        );
      case AppProgress.functionsId:
        return _ModuleConfig(
          id: widget.moduleId,
          title: _copy(pt: 'Funções', en: 'Functions'),
          eyebrow: _copy(pt: 'PRÉ-CÁLCULO', en: 'PRECALCULUS'),
          description: _copy(
            pt: 'Domine domínio, imagem, gráficos, famílias de funções, trigonometria e taxa média de variação.',
            en: 'Master domain, range, graphs, function families, trigonometry, and average rate of change.',
          ),
          symbol: 'f',
          lessons: localizedPrecalculusFunctionsCourseLessons(locale),
          isCompleted: AppProgress.functionsCompleted,
        );
      case AppProgress.limitsId:
        return _ModuleConfig(
          id: widget.moduleId,
          title: _copy(pt: 'Limites', en: 'Limits'),
          eyebrow: _copy(pt: 'CÁLCULO I', en: 'CALCULUS I'),
          description: _copy(
            pt: 'Estude aproximação, limites laterais, técnicas algébricas, infinito e limites trigonométricos.',
            en: 'Study approximation, one-sided limits, algebraic techniques, infinity, and trigonometric limits.',
          ),
          symbol: 'lim',
          lessons: localizedLimitsCourseLessons(locale),
          isCompleted: AppProgress.limitsCompleted,
        );
      case AppProgress.continuityId:
        return _ModuleConfig(
          id: widget.moduleId,
          title: _copy(pt: 'Continuidade', en: 'Continuity'),
          eyebrow: _copy(pt: 'CÁLCULO I', en: 'CALCULUS I'),
          description: _copy(
            pt: 'Conecte limite e valor da função para analisar continuidade, rupturas e o Teorema do Valor Intermediário.',
            en: 'Connect limits and function values to analyze continuity, discontinuities, and the Intermediate Value Theorem.',
          ),
          symbol: 'C',
          lessons: _isEnglish
              ? englishContinuityCourseLessons
              : continuityCourseLessons,
          isCompleted: AppProgress.continuityCompleted,
        );
      case AppProgress.derivativesId:
      default:
        return _ModuleConfig(
          id: AppProgress.derivativesId,
          title: _copy(pt: 'Derivadas', en: 'Derivatives'),
          eyebrow: _copy(pt: 'CÁLCULO I', en: 'CALCULUS I'),
          description: _copy(
            pt: 'Interprete taxas instantâneas, domine regras de derivação e aplique derivadas a problemas reais.',
            en: 'Interpret instantaneous rates, master differentiation rules, and apply derivatives to real problems.',
          ),
          symbol: "f′",
          lessons:
              _isEnglish ? derivativesCourseLessonsEn : derivativesCourseLessons,
          isCompleted: AppProgress.derivativesCompleted,
        );
    }
  }

  void _onMenuTap(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
        (route) => false,
      );
      return;
    }

    if (index == 1) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LearningPathScreen()),
        (route) => false,
      );
      return;
    }

    if (index == 2) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const StatisticsScreen()),
        (route) => false,
      );
      return;
    }

    if (index == 3) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
        (route) => false,
      );
    }
  }

  int _completedLessonCount(_ModuleConfig module) {
    return module.lessons
        .where(
          (lesson) => AppProgress.isContentLessonCompleted(lesson.id),
        )
        .length;
  }

  bool _isLessonUnlocked(_ModuleConfig module, int index) {
    if (index == 0) {
      return true;
    }

    return AppProgress.isContentLessonCompleted(
      module.lessons[index - 1].id,
    );
  }

  Future<void> _openLesson(
    _ModuleConfig module,
    int index,
  ) async {
    if (!_isLessonUnlocked(module, index)) {
      return;
    }

    final lesson = module.lessons[index];
    final isLast = index == module.lessons.length - 1;

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CourseLessonScreen(
          lesson: lesson,
          onComplete: () =>
              AppProgress.completeContentLesson(lesson.id),
          actionLabel: isLast
              ? _copy(
                  pt: 'Concluir aula',
                  en: 'Complete lesson',
                )
              : _copy(
                  pt: 'Concluir e continuar',
                  en: 'Complete and continue',
                ),
          nextDestination: isLast
              ? null
              : (_) => _buildLessonScreen(
                  module,
                  index + 1,
                ),
        ),
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  CourseLessonScreen _buildLessonScreen(
    _ModuleConfig module,
    int index,
  ) {
    final lesson = module.lessons[index];
    final isLast = index == module.lessons.length - 1;

    return CourseLessonScreen(
      lesson: lesson,
      onComplete: () =>
          AppProgress.completeContentLesson(lesson.id),
      actionLabel: isLast
          ? _copy(
              pt: 'Concluir aula',
              en: 'Complete lesson',
            )
          : _copy(
              pt: 'Concluir e continuar',
              en: 'Complete and continue',
            ),
      nextDestination: isLast
          ? null
          : (_) => _buildLessonScreen(
              module,
              index + 1,
            ),
    );
  }

  void _openPractice(_ModuleConfig module) {
    final Widget destination;

    switch (module.id) {
      case AppProgress.algebraFundamentalId:
        destination = const AlgebraPracticeScreen();
      case AppProgress.equationsAndInequationsId:
        destination = const EquationsExercisesScreen();
      case AppProgress.functionsId:
        destination = const FunctionsExercisesScreen();
      case AppProgress.limitsId:
        destination = const LimitsExercisesScreen();
      case AppProgress.continuityId:
        destination = const ContinuityExercisesScreen();
      case AppProgress.derivativesId:
      default:
        destination = const DerivativesExercisesScreen();
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  Widget _buildHeader(_ModuleConfig module) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          tooltip: _copy(pt: 'Voltar', en: 'Back'),
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                module.eyebrow,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.secondaryDark,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                ),
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                module.title,
                style: AppTypography.headingMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHero(
    _ModuleConfig module,
    int completedCount,
  ) {
    final total = module.lessons.length;
    final progress = total == 0 ? 0.0 : completedCount / total;

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
        borderRadius:
            BorderRadius.circular(AppSpacing.radiusXXLarge),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.12),
                  borderRadius:
                      BorderRadius.circular(AppSpacing.radiusLarge),
                ),
                child: Text(
                  module.symbol,
                  style: AppTypography.headingSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  module.description,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Text(
                _copy(
                  pt: 'Progresso do módulo',
                  en: 'Module progress',
                ),
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              Text(
                '$completedCount/$total',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor:
                  AppColors.white.withValues(alpha: 0.14),
              valueColor: AlwaysStoppedAnimation<Color>(
                progress >= 1
                    ? AppColors.success
                    : AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${(progress * 100).round()}%',
            style: AppTypography.headingSmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard(
    _ModuleConfig module,
    int index,
  ) {
    final lesson = module.lessons[index];
    final isCompleted =
        AppProgress.isContentLessonCompleted(lesson.id);
    final isUnlocked = _isLessonUnlocked(module, index);

    final accent = isCompleted
        ? AppColors.success
        : isUnlocked
            ? AppColors.primary
            : AppColors.locked;

    final status = isCompleted
        ? _copy(pt: 'Concluída', en: 'Completed')
        : isUnlocked
            ? _copy(pt: 'Disponível', en: 'Available')
            : _copy(pt: 'Bloqueada', en: 'Locked');

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 220),
      opacity: isUnlocked ? 1 : 0.68,
      child: InkWell(
        onTap: isUnlocked
            ? () => _openLesson(module, index)
            : null,
        borderRadius:
            BorderRadius.circular(AppSpacing.radiusLarge),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius:
                BorderRadius.circular(AppSpacing.radiusLarge),
            border: Border.all(
              color: isCompleted
                  ? AppColors.success.withValues(alpha: 0.35)
                  : isUnlocked
                      ? AppColors.borderStrong
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
                  color: isCompleted
                      ? AppColors.successLight
                      : isUnlocked
                          ? AppColors.selectedBackground
                          : AppColors.lockedBackground,
                  borderRadius:
                      BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: Text(
                  '${index + 1}',
                  style: AppTypography.titleMedium.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      lesson.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodySmall,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule_rounded,
                          size: 15,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          lesson.duration,
                          style: AppTypography.caption,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.10),
                            borderRadius:
                                BorderRadius.circular(999),
                          ),
                          child: Text(
                            status,
                            style: AppTypography.labelSmall.copyWith(
                              color: accent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Icon(
                isCompleted
                    ? Icons.check_circle_rounded
                    : isUnlocked
                        ? Icons.chevron_right_rounded
                        : Icons.lock_outline_rounded,
                color: accent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssessmentCard(
    _ModuleConfig module,
    bool allLessonsCompleted,
  ) {
    final accent = allLessonsCompleted
        ? AppColors.success
        : AppColors.locked;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        color: allLessonsCompleted
            ? AppColors.successLight
            : AppColors.surfaceSecondary,
        borderRadius:
            BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(
          color: allLessonsCompleted
              ? AppColors.success.withValues(alpha: 0.55)
              : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                allLessonsCompleted
                    ? Icons.task_alt_rounded
                    : Icons.lock_outline_rounded,
                color: accent,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  _copy(
                    pt: 'Prática guiada e teste final',
                    en: 'Guided practice and final test',
                  ),
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            allLessonsCompleted
                ? _copy(
                    pt: 'As aulas estão concluídas. Faça a prática guiada, revise os erros e avance para o teste final do módulo.',
                    en: 'All lessons are complete. Take guided practice, review mistakes, and continue to the module final test.',
                  )
                : _copy(
                    pt: 'Conclua todas as aulas para liberar a prática guiada e, em seguida, o teste final.',
                    en: 'Complete every lesson to unlock guided practice and then the final test.',
                  ),
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: allLessonsCompleted
                  ? () => _openPractice(module)
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: AppColors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSpacing.radiusLarge),
                ),
              ),
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(
                _copy(
                  pt: 'Iniciar prática guiada',
                  en: 'Start guided practice',
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
    final module = _module;
    final completedCount = _completedLessonCount(module);
    final allLessonsCompleted =
        completedCount == module.lessons.length &&
        module.lessons.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.sm,
                AppSpacing.xs,
                AppSpacing.screenHorizontal,
                0,
              ),
              child: _buildHeader(module),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.screenHorizontal,
                  AppSpacing.md,
                  AppSpacing.screenHorizontal,
                  AppSpacing.lg,
                ),
                children: [
                  _buildHero(module, completedCount),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _copy(
                            pt: 'Aulas do módulo',
                            en: 'Module lessons',
                          ),
                          style: AppTypography.titleLarge.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        '${module.lessons.length} ${_copy(pt: 'aulas', en: 'lessons')}',
                        style: AppTypography.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    _copy(
                      pt: 'Avance em sequência. Cada aula libera a próxima.',
                      en: 'Progress in order. Each lesson unlocks the next one.',
                    ),
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  for (
                    var index = 0;
                    index < module.lessons.length;
                    index++
                  ) ...[
                    _buildLessonCard(module, index),
                    const SizedBox(height: AppSpacing.md),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  _buildAssessmentCard(
                    module,
                    allLessonsCompleted,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) => _onMenuTap(context, index),
      ),
    );
  }
}

class _ModuleConfig {
  final String id;
  final String title;
  final String eyebrow;
  final String description;
  final String symbol;
  final List<CourseLessonData> lessons;
  final bool isCompleted;

  const _ModuleConfig({
    required this.id,
    required this.title,
    required this.eyebrow,
    required this.description,
    required this.symbol,
    required this.lessons,
    required this.isCompleted,
  });
}
