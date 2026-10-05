import 'package:flutter/material.dart';

import 'package:calcquest/l10n/app_localizations.dart';
import 'package:calcquest/shared/data/localized_algebra_exercise_content.dart';
import 'package:calcquest/shared/data/localized_continuity_exercise_content.dart';
import 'package:calcquest/shared/data/localized_derivatives_exercise_content.dart';
import 'package:calcquest/shared/data/localized_equations_exercise_content.dart';
import 'package:calcquest/shared/data/localized_functions_exercise_content.dart';
import 'package:calcquest/shared/data/localized_limits_exercise_content.dart';
import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/exercise_answer_feedback.dart';
import 'package:calcquest/shared/widgets/exercise_practice_ui.dart';
import 'package:calcquest/shared/widgets/primary_button.dart';

class PersonalizedReviewScreen extends StatefulWidget {
  const PersonalizedReviewScreen({super.key});

  @override
  State<PersonalizedReviewScreen> createState() =>
      _PersonalizedReviewScreenState();
}

class _PersonalizedReviewScreenState extends State<PersonalizedReviewScreen> {
  late final List<QuestionCandidate> sessionQuestions;

  int currentIndex = 0;
  int correctAnswers = 0;
  String? selectedOptionId;
  bool isShowingFeedback = false;

  @override
  void initState() {
    super.initState();

    final candidates = <QuestionCandidate>[
      ...QuestionMetadataAdapter.fromExercises(
        moduleId: AppProgress.algebraFundamentalId,
        exercises: mockExercises,
      ),
      ...QuestionMetadataAdapter.fromExercises(
        moduleId: AppProgress.equationsAndInequationsId,
        exercises: mockEquationsExercises,
      ),
      ...QuestionMetadataAdapter.fromExercises(
        moduleId: AppProgress.functionsId,
        exercises: mockFunctionsExercises,
      ),
      ...QuestionMetadataAdapter.fromExercises(
        moduleId: AppProgress.limitsId,
        exercises: mockLimitsExercises,
      ),
      ...QuestionMetadataAdapter.fromExercises(
        moduleId: AppProgress.continuityId,
        exercises: mockContinuityExercises,
      ),
      ...QuestionMetadataAdapter.fromExercises(
        moduleId: AppProgress.derivativesId,
        exercises: mockDerivativesExercises,
      ),
    ];

    sessionQuestions = AppProgress.selectPersonalizedReviewCandidates(
      candidates: candidates,
      questionCount: 10,
    );
  }

  bool get _isEnglish =>
      Localizations.localeOf(context).languageCode.toLowerCase() == 'en';

  QuestionCandidate get currentCandidate => sessionQuestions[currentIndex];

  ExerciseData _localizedExercise(QuestionCandidate candidate) {
    final locale = Localizations.localeOf(context);
    final exercise = candidate.exercise;

    return switch (candidate.metadata.moduleId) {
      AppProgress.algebraFundamentalId =>
        localizeAlgebraExerciseContent(exercise, locale),
      AppProgress.equationsAndInequationsId =>
        localizeEquationsExerciseContent(exercise, locale),
      AppProgress.functionsId =>
        localizeFunctionsExerciseContent(exercise, locale),
      AppProgress.limitsId =>
        localizeLimitsExerciseContent(exercise, locale),
      AppProgress.continuityId =>
        localizeContinuityExerciseContent(exercise, locale),
      AppProgress.derivativesId =>
        localizeDerivativesExerciseContent(exercise, locale),
      _ => exercise,
    };
  }

  String _moduleLabel(String moduleId) {
    return switch (moduleId) {
      AppProgress.algebraFundamentalId => _isEnglish ? 'Algebra' : 'Álgebra',
      AppProgress.equationsAndInequationsId =>
        _isEnglish ? 'Equations' : 'Equações',
      AppProgress.functionsId => _isEnglish ? 'Functions' : 'Funções',
      AppProgress.limitsId => _isEnglish ? 'Limits' : 'Limites',
      AppProgress.continuityId =>
        _isEnglish ? 'Continuity' : 'Continuidade',
      AppProgress.derivativesId =>
        _isEnglish ? 'Derivatives' : 'Derivadas',
      _ => moduleId,
    };
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

  bool get isLastQuestion =>
      currentIndex == sessionQuestions.length - 1;

  Future<void> _confirmAnswer() async {
    if (isShowingFeedback || selectedOptionId == null) {
      if (selectedOptionId == null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                _isEnglish
                    ? 'Choose an alternative first.'
                    : 'Escolha uma alternativa primeiro.',
              ),
            ),
          );
      }
      return;
    }

    final exercise = _localizedExercise(currentCandidate);
    final isCorrect = selectedOptionId == exercise.correctOptionId;
    final selectedOption = exercise.options.firstWhere(
      (option) => option.id == selectedOptionId,
    );
    final correctOption = exercise.options.firstWhere(
      (option) => option.id == exercise.correctOptionId,
    );

    setState(() => isShowingFeedback = true);

    AppProgress.recordExerciseAnswer(
      questionId: currentCandidate.questionId,
      isCorrect: isCorrect,
    );

    if (isCorrect) {
      correctAnswers++;
    }

    await showExerciseAnswerFeedback(
      context: context,
      exercise: exercise,
      isCorrect: isCorrect,
      selectedAnswer: selectedOption.text,
      correctAnswer: correctOption.text,
      isLastExercise: isLastQuestion,
    );

    if (!mounted) return;

    if (isLastQuestion) {
      Navigator.of(context).pop();
      return;
    }

    setState(() {
      currentIndex++;
      selectedOptionId = null;
      isShowingFeedback = false;
    });
  }

  Widget _emptyState() {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(_isEnglish ? 'Personalized review' : 'Revisão personalizada'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified_rounded,
                  size: 56,
                  color: AppColors.success,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  _isEnglish ? 'Nothing to review yet' : 'Nada para revisar ainda',
                  textAlign: TextAlign.center,
                  style: AppTypography.headingSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _isEnglish
                      ? 'Questions you miss during guided practice will appear here automatically.'
                      : 'As questões que você errar nas práticas guiadas aparecerão aqui automaticamente.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  text: _isEnglish ? 'Back' : 'Voltar',
                  icon: Icons.arrow_back_rounded,
                  onPressed: () => Navigator.of(context).pop(),
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
    if (sessionQuestions.isEmpty) {
      return _emptyState();
    }

    final l10n = AppLocalizations.of(context)!;
    final candidate = currentCandidate;
    final exercise = _localizedExercise(candidate);
    final progress = (currentIndex + 1) / sessionQuestions.length;
    const letters = <String>['A', 'B', 'C', 'D'];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          _isEnglish ? 'Personalized review' : 'Revisão personalizada',
        ),
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
                currentQuestion: currentIndex + 1,
                totalQuestions: sessionQuestions.length,
                progress: progress,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                _moduleLabel(candidate.metadata.moduleId),
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
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
                  itemBuilder: (context, index) {
                    final option = exercise.options[index];
                    return ExerciseOptionTile(
                      letter: letters[index],
                      text: option.text,
                      selected: selectedOptionId == option.id,
                      enabled: !isShowingFeedback,
                      onTap: () => setState(
                        () => selectedOptionId = option.id,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                _isEnglish
                    ? '$correctAnswers correct in this review'
                    : '$correctAnswers acertos nesta revisão',
                style: AppTypography.caption,
              ),
              const SizedBox(height: AppSpacing.sm),
              PrimaryButton(
                text: isLastQuestion
                    ? (_isEnglish ? 'Finish review' : 'Finalizar revisão')
                    : (_isEnglish ? 'Check answer' : 'Verificar resposta'),
                icon: isLastQuestion
                    ? Icons.check_circle_outline_rounded
                    : Icons.arrow_forward_rounded,
                onPressed: isShowingFeedback ? null : _confirmAnswer,
                isLoading: isShowingFeedback,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
