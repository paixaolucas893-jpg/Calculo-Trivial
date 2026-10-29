import 'package:flutter/material.dart';

import 'package:calcquest/l10n/app_localizations.dart';
import 'package:calcquest/shared/data/localized_limits_exercise_content.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';
import 'package:calcquest/shared/domain/exercise_review_item.dart';
import 'package:calcquest/shared/domain/module_mastery_policy.dart';
import 'package:calcquest/shared/services/module_mastery_tracker.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_bottom_navigation_bar.dart';
import 'package:calcquest/shared/widgets/app_progress_bar.dart';
import 'package:calcquest/shared/widgets/exercise_answer_feedback.dart';
import 'package:calcquest/shared/widgets/exercise_practice_ui.dart';
import 'package:calcquest/shared/widgets/primary_button.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../learning_path/presentation/learning_path_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../statistics/presentation/statistics_screen.dart';
import 'limits_final_test_screen.dart';

class LimitsExercisesScreen extends StatefulWidget {
  const LimitsExercisesScreen({super.key});

  @override
  State<LimitsExercisesScreen> createState() => _LimitsExercisesScreenState();
}

class _LimitsExercisesScreenState extends State<LimitsExercisesScreen> {
  late final List<ExerciseData> sessionExercises;
  final List<ExerciseReviewItem> reviewItems = <ExerciseReviewItem>[];

  int currentExerciseIndex = 0;
  int correctAnswers = 0;
  String? selectedOptionId;
  bool isShowingFeedback = false;

  bool get _isEnglish =>
      Localizations.localeOf(context).languageCode.toLowerCase() == 'en';

  @override
  void initState() {
    super.initState();

    final selectedIds = AppProgress.selectExerciseQuestionIds(
      lessonId: AppProgress.limitsId,
      availableQuestionIds: mockLimitsExercises.map((exercise) => exercise.id),
    );

    final exercisesById = <String, ExerciseData>{
      for (final exercise in mockLimitsExercises) exercise.id: exercise,
    };

    sessionExercises = selectedIds
        .map((questionId) => exercisesById[questionId])
        .whereType<ExerciseData>()
        .toList(growable: false);
  }

  ExerciseData get currentExercise => localizeLimitsExerciseContent(
        sessionExercises[currentExerciseIndex],
        Localizations.localeOf(context),
      );

  bool get isLastExercise =>
      currentExerciseIndex == sessionExercises.length - 1;

  double get progress => (currentExerciseIndex + 1) / sessionExercises.length;

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

  String _difficultyLabel(
    ExerciseDifficulty difficulty,
    AppLocalizations l10n,
  ) {
    return switch (difficulty) {
      ExerciseDifficulty.foundation => l10n.exerciseDifficultyFoundation,
      ExerciseDifficulty.intermediate => l10n.exerciseDifficultyIntermediate,
      ExerciseDifficulty.challenge => l10n.exerciseDifficultyChallenge,
    };
  }

  Future<void> _confirmAnswer() async {
    if (isShowingFeedback) return;

    final l10n = AppLocalizations.of(context)!;

    if (selectedOptionId == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.warning,
            content: Text(l10n.exerciseChooseAlternative),
          ),
        );
      return;
    }

    final exercise = currentExercise;
    final isCorrect = selectedOptionId == exercise.correctOptionId;
    final selectedOption = exercise.options.firstWhere(
      (option) => option.id == selectedOptionId,
    );
    final correctOption = exercise.options.firstWhere(
      (option) => option.id == exercise.correctOptionId,
    );

    setState(() => isShowingFeedback = true);
    AppProgress.recordExerciseAnswer(
      questionId: exercise.id,
      contentLessonId: exercise.contentLessonId,
      isCorrect: isCorrect,
    );

    if (isCorrect) {
      correctAnswers++;
    } else {
      reviewItems.add(
        ExerciseReviewItem(
          questionId: exercise.id,
          statement: exercise.statement,
          selectedAnswer: selectedOption.text,
          correctAnswer: correctOption.text,
          explanation: exercise.explanation,
        ),
      );
    }

    await showExerciseAnswerFeedback(
      context: context,
      exercise: exercise,
      isCorrect: isCorrect,
      selectedAnswer: selectedOption.text,
      correctAnswer: correctOption.text,
      isLastExercise: isLastExercise,
    );

    if (!mounted) return;

    if (isLastExercise) {
      _finishPractice();
      return;
    }

    setState(() {
      currentExerciseIndex++;
      selectedOptionId = null;
      isShowingFeedback = false;
    });
  }

  Future<void> _finishPractice() async {
    final practiceIds = sessionExercises.map((exercise) => exercise.id).toSet();
    final evidence = await ModuleMasteryTracker.recordPracticeResult(
      moduleId: AppProgress.limitsId,
      correctAnswers: correctAnswers,
      totalQuestions: sessionExercises.length,
      legacyCompleted: AppProgress.limitsCompleted,
    );
    final decision = ModuleMasteryPolicy.evaluate(evidence);

    if (!mounted) return;

    if (reviewItems.isEmpty && decision.canTakeFinalTest) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LimitsFinalTestScreen(
            practiceQuestionIds: practiceIds,
          ),
        ),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => _LimitsPracticeReviewScreen(
          reviewItems: List<ExerciseReviewItem>.unmodifiable(reviewItems),
          practiceQuestionIds: practiceIds,
          correctAnswers: correctAnswers,
          totalQuestions: sessionExercises.length,
          canTakeFinalTest: decision.canTakeFinalTest,
        ),
      ),
    );
  }

  Widget _buildOption(ExerciseOptionData option, int index) {
    final isSelected = selectedOptionId == option.id;
    const letters = <String>['A', 'B', 'C', 'D'];

    return ExerciseOptionTile(
      letter: letters[index],
      text: option.text,
      selected: isSelected,
      enabled: !isShowingFeedback,
      onTap: () => setState(() => selectedOptionId = option.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final exercise = currentExercise;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(_isEnglish ? 'Guided practice' : 'Prática guiada'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.md,
            AppSpacing.screenHorizontal,
            AppSpacing.screenBottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExercisePracticeHeader(
                isEnglish: _isEnglish,
                currentQuestion: currentExerciseIndex + 1,
                totalQuestions: sessionExercises.length,
                progress: progress,
              ),
              const SizedBox(height: AppSpacing.lg),
              ExerciseMetadataChips(
                skill: exercise.skill,
                difficulty: _difficultyLabel(exercise.difficulty, l10n),
              ),
              const SizedBox(height: AppSpacing.md),
              ExerciseQuestionCard(
                isEnglish: _isEnglish,
                statement: exercise.statement,
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: ListView.separated(
                  itemCount: exercise.options.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, index) =>
                      _buildOption(exercise.options[index], index),
                ),
              ),
              PrimaryButton(
                text: isLastExercise
                    ? (_isEnglish ? 'Finish practice' : 'Finalizar prática')
                    : (_isEnglish ? 'Check answer' : 'Verificar resposta'),
                icon: isLastExercise
                    ? Icons.fact_check_outlined
                    : Icons.arrow_forward_rounded,
                onPressed: isShowingFeedback ? null : _confirmAnswer,
                isLoading: isShowingFeedback,
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
  }
}

class _LimitsPracticeReviewScreen extends StatefulWidget {
  final List<ExerciseReviewItem> reviewItems;
  final Set<String> practiceQuestionIds;
  final int correctAnswers;
  final int totalQuestions;
  final bool canTakeFinalTest;

  const _LimitsPracticeReviewScreen({
    required this.reviewItems,
    required this.practiceQuestionIds,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.canTakeFinalTest,
  });

  @override
  State<_LimitsPracticeReviewScreen> createState() =>
      _LimitsPracticeReviewScreenState();
}

class _LimitsPracticeReviewScreenState
    extends State<_LimitsPracticeReviewScreen> {
  int currentIndex = 0;

  bool get _isEnglish =>
      Localizations.localeOf(context).languageCode.toLowerCase() == 'en';

  ExerciseReviewItem get currentItem => widget.reviewItems[currentIndex];

  bool get isLastItem => currentIndex == widget.reviewItems.length - 1;

  void _continue() {
    if (!isLastItem) {
      setState(() => currentIndex++);
      return;
    }

    if (!widget.canTakeFinalTest) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LimitsExercisesScreen()),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LimitsFinalTestScreen(
          practiceQuestionIds: widget.practiceQuestionIds,
        ),
      ),
    );
  }

  Widget _answerCard({
    required String title,
    required String answer,
    required Color backgroundColor,
    required Color borderColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.labelMedium),
                const SizedBox(height: AppSpacing.xxs),
                Text(answer, style: AppTypography.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reviewProgress = (currentIndex + 1) / widget.reviewItems.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(_isEnglish ? 'Practice review' : 'Revisão da prática'),
      ),
      body: SafeArea(
        child: Padding(
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
                _isEnglish
                    ? '${widget.correctAnswers}/${widget.totalQuestions} correct in practice'
                    : '${widget.correctAnswers}/${widget.totalQuestions} acertos na prática',
                style: AppTypography.headingSmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                widget.canTakeFinalTest
                    ? (_isEnglish
                        ? 'Review every mistake before starting the final test.'
                        : 'Revise cada erro antes de iniciar o teste final.')
                    : (_isEnglish
                        ? 'Review every mistake, then retry the practice. You need at least 70% before the final test.'
                        : 'Revise cada erro e refaça a prática. Você precisa de pelo menos 70% antes da prova final.'),
                style: AppTypography.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              AppProgressBar(value: reviewProgress),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        currentItem.statement,
                        style: AppTypography.titleMedium,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _answerCard(
                      title: _isEnglish ? 'Your answer' : 'Sua resposta',
                      answer: currentItem.selectedAnswer,
                      backgroundColor: AppColors.errorLight,
                      borderColor: AppColors.error,
                      icon: Icons.close_rounded,
                      iconColor: AppColors.error,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    _answerCard(
                      title: _isEnglish ? 'Correct answer' : 'Resposta correta',
                      answer: currentItem.correctAnswer,
                      backgroundColor: AppColors.successLight,
                      borderColor: AppColors.success,
                      icon: Icons.check_rounded,
                      iconColor: AppColors.success,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
                      decoration: BoxDecoration(
                        color: AppColors.selectedBackground,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isEnglish ? 'Why?' : 'Por quê?',
                            style: AppTypography.titleMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            currentItem.explanation,
                            style: AppTypography.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                text: isLastItem
                    ? widget.canTakeFinalTest
                        ? (_isEnglish ? 'Start final test' : 'Iniciar teste final')
                        : (_isEnglish ? 'Retry practice' : 'Refazer prática')
                    : (_isEnglish ? 'Next mistake' : 'Próximo erro'),
                icon: isLastItem
                    ? widget.canTakeFinalTest
                        ? Icons.quiz_outlined
                        : Icons.refresh_rounded
                    : Icons.arrow_forward_rounded,
                onPressed: _continue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}