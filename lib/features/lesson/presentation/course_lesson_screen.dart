import 'package:flutter/material.dart';

import 'package:calcquest/shared/domain/course_lesson_data.dart';
import 'package:calcquest/shared/localization/lesson_ui_text.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/guided_factoring_practice_card.dart';
import 'package:calcquest/shared/widgets/learning_content.dart';
import 'package:calcquest/shared/widgets/lesson_visualization_resolver.dart';
import 'package:calcquest/shared/widgets/limits_example_variability_card.dart';
import 'package:calcquest/shared/widgets/limits_interleaving_card.dart';
import 'package:calcquest/shared/widgets/limits_metacognition_confidence_card.dart';
import 'package:calcquest/shared/widgets/limits_multiple_representations_card.dart';
import 'package:calcquest/shared/widgets/limits_progressive_scaffolding_card.dart';
import 'package:calcquest/shared/widgets/limits_spaced_practice_card.dart';
import 'package:calcquest/shared/widgets/limits_strategy_comparison_card.dart';
import 'package:calcquest/shared/widgets/limits_transfer_card.dart';
import 'package:calcquest/shared/widgets/primary_button.dart';

class CourseLessonScreen extends StatefulWidget {
  final CourseLessonData lesson;
  final Future<void> Function() onComplete;
  final WidgetBuilder? nextDestination;
  final String actionLabel;

  const CourseLessonScreen({
    super.key,
    required this.lesson,
    required this.onComplete,
    required this.actionLabel,
    this.nextDestination,
  });

  @override
  State<CourseLessonScreen> createState() => _CourseLessonScreenState();
}

class _CourseLessonScreenState extends State<CourseLessonScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _isCompleting = false;
  bool _lessonCheckAnswered = false;
  double _readingProgress = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateReadingProgress);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateReadingProgress)
      ..dispose();
    super.dispose();
  }

  void _updateReadingProgress() {
    if (!_scrollController.hasClients) return;

    final maxExtent = _scrollController.position.maxScrollExtent;
    final nextProgress = maxExtent <= 0
        ? 1.0
        : (_scrollController.offset / maxExtent).clamp(0.0, 1.0).toDouble();

    if ((nextProgress - _readingProgress).abs() < 0.01) return;

    setState(() => _readingProgress = nextProgress);
  }

  void _markLessonCheckAnswered() {
    if (_lessonCheckAnswered) return;
    setState(() => _lessonCheckAnswered = true);
  }

  Future<void> _completeLesson() async {
    if (_isCompleting || !_lessonCheckAnswered) return;

    setState(() => _isCompleting = true);

    try {
      await widget.onComplete();

      if (!mounted) return;

      final destination = widget.nextDestination;
      if (destination == null) {
        Navigator.of(context).pop();
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: destination),
      );
    } finally {
      if (mounted) {
        setState(() => _isCompleting = false);
      }
    }
  }

  IconData _iconFor(LessonVisual visual) {
    return switch (visual) {
      LessonVisual.route => Icons.route_outlined,
      LessonVisual.compare => Icons.compare_arrows_rounded,
      LessonVisual.notation => Icons.translate_rounded,
      LessonVisual.calculate => Icons.calculate_outlined,
      LessonVisual.transform => Icons.build_outlined,
      LessonVisual.table => Icons.table_chart_outlined,
      LessonVisual.graph => Icons.auto_graph_rounded,
      LessonVisual.warning => Icons.warning_amber_rounded,
      LessonVisual.infinity => Icons.all_inclusive_rounded,
      LessonVisual.engineering => Icons.precision_manufacturing_outlined,
      LessonVisual.checklist => Icons.checklist_rounded,
      LessonVisual.idea => Icons.lightbulb_outline_rounded,
    };
  }

  Widget _buildBlock(LessonBlockData block) {
    return switch (block) {
      ConceptBlockData concept => LessonConceptCard(
        icon: _iconFor(concept.visual),
        title: concept.title,
        content: concept.content,
        emphasis: concept.emphasis,
        tone: concept.tone,
      ),
      WorkedExampleBlockData example => WorkedExampleCard(
        title: example.title,
        problem: example.problem,
        steps: example.steps,
        result: example.result,
        interpretation: example.interpretation,
      ),
    };
  }

  List<Widget> _buildSections() {
    final widgets = <Widget>[];

    for (var sectionIndex = 0;
        sectionIndex < widget.lesson.sections.length;
        sectionIndex++) {
      final section = widget.lesson.sections[sectionIndex];

      widgets
        ..add(
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 320 + (sectionIndex * 70)),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 14 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: LessonSectionHeader(
              number: section.number,
              title: section.title,
              subtitle: section.subtitle,
            ),
          ),
        )
        ..add(const SizedBox(height: AppSpacing.md));

      for (var index = 0; index < section.blocks.length; index++) {
        widgets.add(_buildBlock(section.blocks[index]));

        if (index < section.blocks.length - 1) {
          widgets.add(const SizedBox(height: AppSpacing.md));
        }
      }

      widgets.add(const SizedBox(height: AppSpacing.xl));
    }

    return widgets;
  }

  Widget _buildReadingProgress({required bool isEnglish}) {
    final percentage = (_readingProgress * 100).round();

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenHorizontal,
        AppSpacing.xs,
        AppSpacing.screenHorizontal,
        AppSpacing.sm,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                isEnglish ? 'Reading progress' : 'Progresso da leitura',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: Text(
                  '$percentage%',
                  key: ValueKey<int>(percentage),
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: _readingProgress,
              minHeight: 6,
              backgroundColor: AppColors.progressTrack,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonRoadmap({required bool isEnglish}) {
    final lesson = widget.lesson;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXLarge),
        border: Border.all(color: AppColors.border),
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
                  color: AppColors.selectedBackground,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: const Icon(
                  Icons.route_outlined,
                  color: AppColors.primary,
                  size: AppSpacing.iconMedium,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEnglish ? 'Lesson roadmap' : 'Roteiro da aula',
                      style: AppTypography.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      isEnglish
                          ? '${lesson.sections.length} sections • ${lesson.duration}'
                          : '${lesson.sections.length} seções • ${lesson.duration}',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          for (var index = 0; index < lesson.sections.length; index++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? AppColors.primary
                        : AppColors.surfaceSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    lesson.sections[index].number,
                    style: AppTypography.labelSmall.copyWith(
                      color: index == 0
                          ? AppColors.white
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      lesson.sections[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (index < lesson.sections.length - 1)
              const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }

  Widget _buildContentHeading({required bool isEnglish}) {
    return Row(
      children: [
        const Icon(
          Icons.menu_book_rounded,
          color: AppColors.primary,
          size: AppSpacing.iconMedium,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          isEnglish ? 'Theory and examples' : 'Teoria e exemplos',
          style: AppTypography.headingSmall,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;
    final uiText = LessonUiText.of(context);
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final visualization = lessonVisualizationFor(
      lesson,
      isEnglish: isEnglish,
    );
    final showGuidedFactoringPractice = lesson.id == 'limites-04-fatoracao';
    final showStrategyComparison = lesson.id == 'limites-04-fatoracao';
    final showExampleVariability = lesson.id == 'limites-04-fatoracao';
    final showProgressiveScaffolding = lesson.id == 'limites-04-fatoracao';
    final showInterleaving = lesson.id == 'limites-08-sintese';
    final showSpacedPractice = lesson.id == 'limites-08-sintese';
    final showMetacognitionConfidence = lesson.id == 'limites-08-sintese';
    final showTransfer = lesson.id == 'limites-08-sintese';
    final showMultipleRepresentations = lesson.id == 'limites-08-sintese';

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
              child: Row(
                children: [
                  IconButton(
                    tooltip: uiText.back,
                    onPressed: _isCompleting
                        ? null
                        : () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      lesson.trailTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            _buildReadingProgress(isEnglish: isEnglish),
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.screenHorizontal,
                  AppSpacing.md,
                  AppSpacing.screenHorizontal,
                  AppSpacing.lg,
                ),
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 360),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 18 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: LessonHeroCard(
                      eyebrow: lesson.eyebrow,
                      title: lesson.title,
                      description: lesson.description,
                      duration: lesson.duration,
                      objective: lesson.objective,
                      symbol: lesson.symbol,
                    ),
                  ),
                  if (visualization != null) ...[
                    const SizedBox(height: AppSpacing.xl),
                    visualization,
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  _buildLessonRoadmap(isEnglish: isEnglish),
                  const SizedBox(height: AppSpacing.xl),
                  _buildContentHeading(isEnglish: isEnglish),
                  const SizedBox(height: AppSpacing.lg),
                  ..._buildSections(),
                  if (showGuidedFactoringPractice) ...[
                    GuidedFactoringPracticeCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showStrategyComparison) ...[
                    LimitsStrategyComparisonCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showExampleVariability) ...[
                    LimitsExampleVariabilityCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showProgressiveScaffolding) ...[
                    LimitsProgressiveScaffoldingCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showInterleaving) ...[
                    LimitsInterleavingCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showSpacedPractice) ...[
                    LimitsSpacedPracticeCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showMetacognitionConfidence) ...[
                    LimitsMetacognitionConfidenceCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showTransfer) ...[
                    LimitsTransferCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  if (showMultipleRepresentations) ...[
                    LimitsMultipleRepresentationsCard(isEnglish: isEnglish),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                  Row(
                    children: [
                      const Icon(
                        Icons.task_alt_rounded,
                        color: AppColors.primary,
                        size: AppSpacing.iconMedium,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        isEnglish ? 'Knowledge check' : 'Cheque de aprendizagem',
                        style: AppTypography.headingSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LessonCheckCard(
                    question: lesson.check.question,
                    choices: lesson.check.choices,
                    correctIndex: lesson.check.correctIndex,
                    explanation: lesson.check.explanation,
                    onAnswered: _markLessonCheckAnswered,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    children: [
                      const Icon(
                        Icons.summarize_outlined,
                        color: AppColors.primary,
                        size: AppSpacing.iconMedium,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        isEnglish ? 'Lesson summary' : 'Resumo da aula',
                        style: AppTypography.headingSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  LessonTakeawaysCard(items: lesson.takeaways),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    lesson.closing,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.background,
                border: Border(
                  top: BorderSide(color: AppColors.border),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenHorizontal,
                AppSpacing.sm,
                AppSpacing.screenHorizontal,
                AppSpacing.screenBottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_lessonCheckAnswered) ...[
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          size: AppSpacing.iconSmall,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Expanded(
                          child: Text(
                            isEnglish
                                ? 'Answer the knowledge check to complete this lesson.'
                                : 'Responda ao cheque de aprendizagem para concluir esta aula.',
                            style: AppTypography.caption,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                  ],
                  PrimaryButton(
                    text: widget.actionLabel,
                    icon: Icons.arrow_forward_rounded,
                    onPressed: _isCompleting || !_lessonCheckAnswered
                        ? null
                        : _completeLesson,
                    isLoading: _isCompleting,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
