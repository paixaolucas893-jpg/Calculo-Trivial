import 'package:flutter/material.dart';

import 'package:calcquest/shared/domain/course_lesson_data.dart';
import 'package:calcquest/shared/localization/lesson_ui_text.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/primary_button.dart';

typedef LessonPracticeAnswerCallback =
    void Function(LessonPracticeQuestionData question, bool isCorrect);

class AdaptiveLessonPracticeCard extends StatefulWidget {
  final LessonPracticeData practice;
  final LessonPracticeAnswerCallback? onAnswer;
  final VoidCallback? onCompleted;

  const AdaptiveLessonPracticeCard({
    super.key,
    required this.practice,
    this.onAnswer,
    this.onCompleted,
  });

  @override
  State<AdaptiveLessonPracticeCard> createState() =>
      _AdaptiveLessonPracticeCardState();
}

class _AdaptiveLessonPracticeCardState
    extends State<AdaptiveLessonPracticeCard> {
  late final Map<String, LessonPracticeQuestionData> _questionsById;
  late final List<String> _queue;

  final Set<String> _answeredQuestionIds = <String>{};

  int _currentIndex = 0;
  int? _selectedIndex;
  bool _completed = false;

  LessonPracticeQuestionData get _currentQuestion =>
      _questionsById[_queue[_currentIndex]]!;

  bool get _answered => _selectedIndex != null;

  bool get _isCorrect => _selectedIndex == _currentQuestion.correctIndex;

  @override
  void initState() {
    super.initState();

    _questionsById = <String, LessonPracticeQuestionData>{
      for (final question in widget.practice.questions) question.id: question,
    };

    final count = widget.practice.requiredQuestions.clamp(
      0,
      widget.practice.questions.length,
    );

    _queue = widget.practice.questions
        .take(count)
        .map((question) => question.id)
        .toList();
  }

  void _answer(int index) {
    if (_answered || _completed) {
      return;
    }

    final question = _currentQuestion;
    final isCorrect = index == question.correctIndex;

    setState(() {
      _selectedIndex = index;
      _answeredQuestionIds.add(question.id);
    });

    widget.onAnswer?.call(question, isCorrect);

    if (!isCorrect) {
      _scheduleRecovery(question);
    }
  }

  void _scheduleRecovery(LessonPracticeQuestionData question) {
    final explicitRecovery = question.recoveryQuestionIds
        .where(_questionsById.containsKey)
        .where((id) => id != question.id)
        .where((id) => !_answeredQuestionIds.contains(id))
        .where((id) => !_queue.contains(id))
        .toList();

    String? recoveryId;

    if (explicitRecovery.isNotEmpty) {
      recoveryId = explicitRecovery.first;
    } else {
      for (final candidate in widget.practice.questions) {
        if (candidate.id == question.id) {
          continue;
        }

        if (candidate.skillId != question.skillId) {
          continue;
        }

        if (_answeredQuestionIds.contains(candidate.id)) {
          continue;
        }

        if (_queue.contains(candidate.id)) {
          continue;
        }

        recoveryId = candidate.id;
        break;
      }
    }

    if (recoveryId != null) {
      _queue.insert(_currentIndex + 1, recoveryId);
    }
  }

  void _continue() {
    if (!_answered || _completed) {
      return;
    }

    if (_currentIndex + 1 >= _queue.length) {
      setState(() {
        _completed = true;
      });

      widget.onCompleted?.call();
      return;
    }

    setState(() {
      _currentIndex++;
      _selectedIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiText = LessonUiText.of(context);

    if (_queue.isEmpty) {
      return const SizedBox.shrink();
    }

    if (_completed) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
        decoration: BoxDecoration(
          color: AppColors.successLight,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          border: Border.all(color: AppColors.success),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: AppColors.success),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                uiText.practiceComplete,
                style: AppTypography.titleMedium,
              ),
            ),
          ],
        ),
      );
    }

    final question = _currentQuestion;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(
          color: _answered
              ? (_isCorrect ? AppColors.success : AppColors.warning)
              : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.school_outlined, color: AppColors.primary),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  uiText.practiceTitle,
                  style: AppTypography.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(question.question, style: AppTypography.bodyLarge),
          const SizedBox(height: AppSpacing.md),
          for (var index = 0; index < question.choices.length; index++) ...[
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _answered ? null : () => _answer(index),
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  foregroundColor: AppColors.textPrimary,
                  disabledForegroundColor: AppColors.textPrimary,
                  backgroundColor: _choiceBackground(index),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  side: BorderSide(color: _choiceBorder(index)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMedium,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        question.choices[index],
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                    if (_answered && index == question.correctIndex)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.success,
                      )
                    else if (_answered && _selectedIndex == index)
                      const Icon(
                        Icons.info_rounded,
                        color: AppColors.warningDark,
                      ),
                  ],
                ),
              ),
            ),
            if (index < question.choices.length - 1)
              const SizedBox(height: AppSpacing.xs),
          ],
          if (_answered) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: _isCorrect
                    ? AppColors.successLight
                    : AppColors.warningLight,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isCorrect ? uiText.correctPrefix : uiText.reviewTitle,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    _isCorrect ? question.explanation : question.review,
                    style: AppTypography.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            PrimaryButton(
              text: uiText.continuePractice,
              icon: Icons.arrow_forward_rounded,
              onPressed: _continue,
            ),
          ],
        ],
      ),
    );
  }

  Color _choiceBorder(int index) {
    if (!_answered) {
      return AppColors.border;
    }

    if (index == _currentQuestion.correctIndex) {
      return AppColors.success;
    }

    if (_selectedIndex == index) {
      return AppColors.warning;
    }

    return AppColors.border;
  }

  Color _choiceBackground(int index) {
    if (!_answered) {
      return AppColors.surface;
    }

    if (index == _currentQuestion.correctIndex) {
      return AppColors.successLight;
    }

    if (_selectedIndex == index) {
      return AppColors.warningLight;
    }

    return AppColors.surface;
  }
}
