import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:calcquest/l10n/app_localizations.dart';
import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data.dart';
import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';
import 'package:calcquest/shared/services/play_store_feedback_service.dart';
import 'package:calcquest/shared/state/app_progress.dart';
import 'package:calcquest/shared/theme/app_colors.dart';
import 'package:calcquest/shared/theme/app_spacing.dart';
import 'package:calcquest/shared/theme/app_typography.dart';
import 'package:calcquest/shared/widgets/app_bottom_navigation_bar.dart';

import '../../learning_path/presentation/learning_path_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../statistics/presentation/statistics_screen.dart';

class DashboardScreen extends StatefulWidget {
  final bool isFirstAccess;

  const DashboardScreen({
    super.key,
    this.isFirstAccess = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  static const int _moduleCount = 6;

  late final AnimationController _entranceController;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeShowPlayStoreFeedback();
    });
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  bool get _isEnglish =>
      Localizations.localeOf(context).languageCode == 'en';

  String _copy({
    required String pt,
    required String en,
  }) {
    return _isEnglish ? en : pt;
  }

  Future<void> _maybeShowPlayStoreFeedback() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final shouldPrompt = await PlayStoreFeedbackService.shouldPrompt(
      userId: userId,
      isFirstAccess: widget.isFirstAccess,
      totalAnswerAttempts: AppProgress.totalAnswerAttempts,
      completedContentLessons: AppProgress.completedContentLessonIds.length,
    );

    if (!mounted || !shouldPrompt) {
      return;
    }

    final isEnglish =
        Localizations.localeOf(context).languageCode == 'en';

    final action = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            isEnglish
                ? 'Enjoying Cálculo Trivial?'
                : 'Está gostando do Cálculo Trivial?',
          ),
          content: Text(
            isEnglish
                ? 'Your review on Google Play helps improve the app and helps other students discover it.'
                : 'Sua avaliação na Google Play ajuda a melhorar o app e também ajuda outros estudantes a encontrá-lo.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop('never');
              },
              child: Text(
                isEnglish
                    ? "Don't show again"
                    : 'Não mostrar novamente',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop('later');
              },
              child: Text(
                isEnglish ? 'Not now' : 'Agora não',
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop('feedback');
              },
              child: Text(
                isEnglish ? 'Give feedback' : 'Dar feedback',
              ),
            ),
          ],
        );
      },
    );

    if (!mounted || action == null) {
      return;
    }

    if (action == 'later') {
      await PlayStoreFeedbackService.postpone(userId);
      return;
    }

    if (action == 'never') {
      await PlayStoreFeedbackService.neverAskAgain(userId);
      return;
    }

    if (action != 'feedback') {
      return;
    }

    final marketUri = Uri.parse(
      'market://details?id=com.lucaszion01.calculotrivial',
    );
    final webUri = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.lucaszion01.calculotrivial',
    );

    var opened = false;

    try {
      opened = await launchUrl(
        marketUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      opened = false;
    }

    if (!opened) {
      try {
        opened = await launchUrl(
          webUri,
          mode: LaunchMode.externalApplication,
        );
      } catch (_) {
        opened = false;
      }
    }

    if (opened) {
      await PlayStoreFeedbackService.markFeedbackOpened(userId);
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? 'Unable to open Google Play.'
                : 'Não foi possível abrir a Google Play.',
          ),
        ),
      );
    }
  }

  void _openLearningPath(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LearningPathScreen()),
    );
  }

  void _onMenuTap(BuildContext context, int index) {
    if (index == 0) {
      return;
    }

    if (index == 1) {
      _openLearningPath(context);
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

  String _firstName(AppLocalizations l10n) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName?.trim();

    if (displayName != null && displayName.isNotEmpty) {
      return displayName.split(RegExp(r'\s+')).first;
    }

    final email = user?.email?.trim();

    if (email != null && email.isNotEmpty) {
      return email.split('@').first;
    }

    return l10n.student;
  }

  String _welcomeTitle(AppLocalizations l10n) {
    if (widget.isFirstAccess) {
      return _copy(
        pt: 'Olá, ${_firstName(l10n)}!',
        en: 'Hi, ${_firstName(l10n)}!',
      );
    }

    return _copy(
      pt: 'Olá, ${_firstName(l10n)}!',
      en: 'Welcome back, ${_firstName(l10n)}!',
    );
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

  _DashboardModuleState _currentModule() {
    if (!AppProgress.algebraFundamentalCompleted) {
      return _DashboardModuleState(
        title: _copy(pt: 'Álgebra', en: 'Algebra'),
        subtitle: _copy(
          pt: 'Expressões e manipulação algébrica',
          en: 'Expressions and algebraic manipulation',
        ),
        lessons: algebraCourseLessons,
      );
    }

    if (!AppProgress.equationsAndInequationsCompleted) {
      return _DashboardModuleState(
        title: _copy(pt: 'Equações', en: 'Equations'),
        subtitle: _copy(
          pt: 'Equações e inequações',
          en: 'Equations and inequalities',
        ),
        lessons: <CourseLessonData>[
          ...equationsCourseLessons,
          ...precalculusEquationsSupplementLessons,
        ],
      );
    }

    if (!AppProgress.functionsCompleted) {
      return _DashboardModuleState(
        title: _copy(pt: 'Funções', en: 'Functions'),
        subtitle: _copy(
          pt: 'Conceitos, gráficos e transformações',
          en: 'Concepts, graphs, and transformations',
        ),
        lessons: precalculusFunctionsCourseLessons,
      );
    }

    if (!AppProgress.limitsCompleted) {
      return _DashboardModuleState(
        title: _copy(pt: 'Limites', en: 'Limits'),
        subtitle: _copy(
          pt: 'Comportamento e aproximação',
          en: 'Behavior and approximation',
        ),
        lessons: limitsCourseLessons,
      );
    }

    if (!AppProgress.continuityCompleted) {
      return _DashboardModuleState(
        title: _copy(pt: 'Continuidade', en: 'Continuity'),
        subtitle: _copy(
          pt: 'Funções contínuas e descontinuidades',
          en: 'Continuous functions and discontinuities',
        ),
        lessons: continuityCourseLessons,
      );
    }

    return _DashboardModuleState(
      title: _copy(pt: 'Derivadas', en: 'Derivatives'),
      subtitle: _copy(
        pt: 'Taxas, tangentes e aplicações',
        en: 'Rates, tangents, and applications',
      ),
      lessons: derivativesCourseLessons,
    );
  }

  int _completedLessonsFor(_DashboardModuleState module) {
    return module.lessons
        .where(
          (lesson) => AppProgress.isContentLessonCompleted(lesson.id),
        )
        .length;
  }

  double _moduleProgress(_DashboardModuleState module) {
    if (module.lessons.isEmpty) {
      return 0;
    }

    return (_completedLessonsFor(module) / module.lessons.length)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  Widget _entrance({
    required Widget child,
    required double begin,
    required double end,
  }) {
    final curved = CurvedAnimation(
      parent: _entranceController,
      curve: Interval(begin, end, curve: Curves.easeOutCubic),
    );

    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.06),
          end: Offset.zero,
        ).animate(curved),
        child: child,
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.navy,
                AppColors.secondaryDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
          child: Text(
            '∫x',
            style: AppTypography.titleLarge.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            'Cálculo Trivial',
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.navy,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.selectedBackground,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
          child: Text(
            'UI 2.0',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueCard(
    BuildContext context,
    _DashboardModuleState module,
  ) {
    final completed = _completedLessonsFor(module);
    final progress = _moduleProgress(module);
    final percent = (progress * 100).round();

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
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 19,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  _copy(
                    pt: 'Continuar estudando',
                    en: 'Continue studying',
                  ),
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.white,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            _copy(pt: 'Módulo atual', en: 'Current module'),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.primaryLight,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title,
                      style: AppTypography.headingMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      module.subtitle,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primaryLight,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      _copy(
                        pt: '$completed de ${module.lessons.length} aulas concluídas',
                        en: '$completed of ${module.lessons.length} lessons completed',
                      ),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.82),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              SizedBox(
                width: 78,
                height: 78,
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
                      '$percent%',
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => _openLearningPath(context),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.navy,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSpacing.radiusLarge),
                ),
              ),
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(
                _copy(pt: 'Retomar trilha', en: 'Resume path'),
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactMetric({
    required IconData icon,
    required Color accent,
    required Color background,
    required String label,
    required String value,
    String? helper,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: background,
                borderRadius:
                    BorderRadius.circular(AppSpacing.radiusMedium),
              ),
              child: Icon(icon, color: accent, size: 20),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    value,
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (helper != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      helper,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.caption,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressOverview() {
    final accuracy = (AppProgress.accuracy * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _copy(pt: 'Seu progresso', en: 'Your progress'),
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            _buildCompactMetric(
              icon: Icons.local_fire_department_rounded,
              accent: AppColors.warningDark,
              background: AppColors.warningLight,
              label: _copy(pt: 'Sequência', en: 'Streak'),
              value: _copy(
                pt: '${AppProgress.studyStreak} dias',
                en: '${AppProgress.studyStreak} days',
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            _buildCompactMetric(
              icon: Icons.menu_book_rounded,
              accent: AppColors.primary,
              background: AppColors.selectedBackground,
              label: _copy(pt: 'Aulas concluídas', en: 'Lessons completed'),
              value: '${AppProgress.completedContentLessonIds.length}',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            _buildCompactMetric(
              icon: Icons.check_circle_outline_rounded,
              accent: AppColors.success,
              background: AppColors.successLight,
              label: _copy(pt: 'Questões respondidas', en: 'Questions answered'),
              value: '${AppProgress.totalAnswerAttempts}',
            ),
            const SizedBox(width: AppSpacing.sm),
            _buildCompactMetric(
              icon: Icons.track_changes_rounded,
              accent: AppColors.secondaryDark,
              background: AppColors.secondaryLight,
              label: _copy(pt: 'Taxa de acerto', en: 'Accuracy'),
              value: '$accuracy%',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildJourneySummary() {
    final completed = _completedModuleCount();
    final progress = completed / _moduleCount;

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
                  _copy(
                    pt: 'Jornada de Cálculo',
                    en: 'Calculus journey',
                  ),
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                '$completed/$_moduleCount',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            _copy(
              pt: 'Do pré-cálculo às derivadas, com progressão por domínio.',
              en: 'From precalculus to derivatives, with mastery-based progression.',
            ),
            style: AppTypography.bodySmall,
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.progressTrack,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.secondaryDark,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          InkWell(
            onTap: () => _openLearningPath(context),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.xs,
              ),
              child: Row(
                children: [
                  Text(
                    _copy(
                      pt: 'Ver trilha completa',
                      en: 'View full learning path',
                    ),
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPaddingLarge),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.selectedBackground,
            AppColors.secondaryLight,
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: Border.all(
          color: AppColors.primaryLight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.smart_toy_outlined,
              color: AppColors.primary,
              size: 26,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tutor Trivial',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  _copy(
                    pt: 'Peça pistas e explicações diretamente nas aulas e exercícios.',
                    en: 'Ask for hints and explanations directly inside lessons and exercises.',
                  ),
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.secondaryDark,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ValueListenableBuilder<int>(
      valueListenable: AppProgress.revision,
      builder: (context, revision, child) {
        final currentModule = _currentModule();

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
                  _entrance(
                    begin: 0,
                    end: 0.34,
                    child: _buildBrandHeader(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _entrance(
                    begin: 0.05,
                    end: 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _welcomeTitle(l10n),
                          style: AppTypography.headingMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          _copy(
                            pt: 'Vamos continuar sua jornada hoje?',
                            en: 'Ready to continue your journey today?',
                          ),
                          style: AppTypography.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _entrance(
                    begin: 0.12,
                    end: 0.56,
                    child: _buildContinueCard(
                      context,
                      currentModule,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _entrance(
                    begin: 0.24,
                    end: 0.68,
                    child: _buildProgressOverview(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _entrance(
                    begin: 0.36,
                    end: 0.82,
                    child: _buildJourneySummary(),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _entrance(
                    begin: 0.48,
                    end: 1,
                    child: _buildTutorCard(),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: 0,
            onTap: (index) {
              _onMenuTap(context, index);
            },
          ),
        );
      },
    );
  }
}

class _DashboardModuleState {
  final String title;
  final String subtitle;
  final List<CourseLessonData> lessons;

  const _DashboardModuleState({
    required this.title,
    required this.subtitle,
    required this.lessons,
  });
}
