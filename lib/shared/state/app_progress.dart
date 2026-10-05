import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/domain/exercise_question_selector.dart';
import 'package:calcquest/shared/domain/personalized_review_session_builder.dart';
import 'package:calcquest/shared/domain/question_metadata.dart';
import 'package:calcquest/shared/domain/question_performance.dart';
import 'package:calcquest/shared/domain/question_selection_engine.dart';

class AppProgress {
  static const String algebraFundamentalId = 'algebra-fundamental';
  static const String equationsAndInequationsId = 'equacoes-inequacoes';
  static const String functionsId = 'funcoes';
  static const String limitsId = 'limites';
  static const String continuityId = 'continuidade';
  static const String derivativesId = 'derivadas';

  static const int dailyQuestionGoal = 5;

  static const String _algebraFundamentalLegacyKey =
      'algebra_fundamental_completed';
  static const String _equationsAndInequationsLegacyKey =
      'equations_and_inequations_completed';
  static const String _functionsLegacyKey = 'functions_completed';
  static const String _limitsLegacyKey = 'limits_completed';

  static const String _completedLessonsKey = 'completed_lesson_ids';
  static const String _completedContentLessonsKey =
      'completed_content_lesson_ids';
  static const String _totalAnswersKey = 'total_answer_attempts';
  static const String _correctAnswersKey = 'correct_answer_attempts';
  static const String _studyStreakKey = 'study_streak';
  static const String _lastStudyDateKey = 'last_study_date';
  static const String _dailyAnsweredQuestionsKey = 'daily_answered_questions';
  static const String _dailyActivityDateKey = 'daily_activity_date';
  static const String _lastQuestionSessionKey = 'last_question_session';
  static const String _lastFinalTestSessionKey = 'last_final_test_session';
  static const String _questionPerformanceKey = 'question_performance_v1';
  static const String _lastPersonalizedReviewSessionKey =
      'last_personalized_review_session_v1';

  static const List<String> _lessonIds = <String>[
    algebraFundamentalId,
    equationsAndInequationsId,
    functionsId,
    limitsId,
    continuityId,
    derivativesId,
  ];

  static bool algebraFundamentalCompleted = false;
  static bool equationsAndInequationsCompleted = false;
  static bool functionsCompleted = false;
  static bool limitsCompleted = false;
  static bool continuityCompleted = false;
  static bool derivativesCompleted = false;

  static int totalXp = 0;
  static int totalGold = 0;

  static int totalAnswerAttempts = 0;
  static int correctAnswerAttempts = 0;
  static int studyStreak = 0;
  static int dailyAnsweredQuestions = 0;

  static String? lastStudyDate;
  static String? dailyActivityDate;
  static String? _activeUserId;

  static final Set<String> _completedLessonIds = <String>{};
  static final Set<String> _completedContentLessonIds = <String>{};
  static final Map<String, Set<String>> _lastQuestionSessionIds =
      <String, Set<String>>{};
  static final Map<String, Set<String>> _lastFinalTestSessionIds =
      <String, Set<String>>{};
  static final Map<String, QuestionPerformance> _questionPerformance =
      <String, QuestionPerformance>{};
  static final Set<String> _lastPersonalizedReviewSessionIds = <String>{};

  static Future<void> _saveQueue = Future<void>.value();

  static final ValueNotifier<int> revision = ValueNotifier<int>(0);

  static Set<String> get completedLessonIds =>
      Set<String>.unmodifiable(_completedLessonIds);

  static Set<String> get completedContentLessonIds =>
      Set<String>.unmodifiable(_completedContentLessonIds);

  static Map<String, QuestionPerformance> get questionPerformance =>
      Map<String, QuestionPerformance>.unmodifiable(_questionPerformance);

  static int get personalizedReviewQuestionCount => _questionPerformance.values
      .where((performance) => performance.needsReview)
      .length;

  static int get incorrectAnswerAttempts =>
      max(0, totalAnswerAttempts - correctAnswerAttempts);

  static double get accuracy {
    if (totalAnswerAttempts == 0) {
      return 0;
    }

    return (correctAnswerAttempts / totalAnswerAttempts)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  static double get dailyGoalProgress {
    return (dailyAnsweredQuestions / dailyQuestionGoal)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  static String _scopedKey(String baseKey, String? userId) {
    final scope = userId?.trim();

    if (scope == null || scope.isEmpty) {
      return 'guest_$baseKey';
    }

    return '${scope}_$baseKey';
  }

  static String _dateKey(DateTime date) {
    final localDate = date.toLocal();

    final month = localDate.month.toString().padLeft(2, '0');
    final day = localDate.day.toString().padLeft(2, '0');

    return '${localDate.year}-$month-$day';
  }

  static DocumentReference<Map<String, dynamic>>? _progressDocument() {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return null;
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('progress')
        .doc('current');
  }

  static void _resetInMemory() {
    _completedLessonIds.clear();
    _completedContentLessonIds.clear();
    _lastQuestionSessionIds.clear();
    _lastFinalTestSessionIds.clear();
    _questionPerformance.clear();
    _lastPersonalizedReviewSessionIds.clear();

    algebraFundamentalCompleted = false;
    equationsAndInequationsCompleted = false;
    functionsCompleted = false;
    limitsCompleted = false;
    continuityCompleted = false;
    derivativesCompleted = false;

    totalXp = 0;
    totalGold = 0;

    totalAnswerAttempts = 0;
    correctAnswerAttempts = 0;
    studyStreak = 0;
    dailyAnsweredQuestions = 0;

    lastStudyDate = null;
    dailyActivityDate = null;
  }

  static Future<void> loadProgress() async {
    final user = FirebaseAuth.instance.currentUser;

    _activeUserId = user?.uid;
    _resetInMemory();

    await _loadLocalProgress(
      userId: _activeUserId,
      allowLegacyMigration: user != null,
    );

    if (user == null) {
      _normalizeDailyStatistics();
      _applyCompletedLessons();
      return;
    }

    final document = _progressDocument();

    if (document == null) {
      _normalizeDailyStatistics();
      _applyCompletedLessons();
      return;
    }

    try {
      final snapshot = await document.get();

      if (snapshot.exists) {
        final data = snapshot.data();

        if (data != null) {
          _mergeRemoteProgress(data);
        }
      }

      _normalizeDailyStatistics();
      _applyCompletedLessons();

      await _saveLocalProgress();
      await _saveRemoteProgress();
    } catch (error) {
      debugPrint(
        'AppProgress: não foi possível carregar '
        'o Firestore: $error',
      );

      _normalizeDailyStatistics();
      _applyCompletedLessons();
    }
  }

  static Future<void> _loadLocalProgress({
    required String? userId,
    required bool allowLegacyMigration,
  }) async {
    final preferences = await SharedPreferences.getInstance();

    final completedLessonsKey = _scopedKey(_completedLessonsKey, userId);

    final scopedLessons = preferences.getStringList(completedLessonsKey);

    if (scopedLessons != null) {
      _completedLessonIds.addAll(scopedLessons);
    } else if (allowLegacyMigration) {
      if (preferences.getBool(_algebraFundamentalLegacyKey) ?? false) {
        _completedLessonIds.add(algebraFundamentalId);
      }

      if (preferences.getBool(_equationsAndInequationsLegacyKey) ?? false) {
        _completedLessonIds.add(equationsAndInequationsId);
      }

      if (preferences.getBool(_functionsLegacyKey) ?? false) {
        _completedLessonIds.add(functionsId);
      }

      if (preferences.getBool(_limitsLegacyKey) ?? false) {
        _completedLessonIds.add(limitsId);
      }
    }

    final completedContentLessons = preferences.getStringList(
      _scopedKey(_completedContentLessonsKey, userId),
    );

    if (completedContentLessons != null) {
      _completedContentLessonIds.addAll(completedContentLessons);
    }

    totalAnswerAttempts =
        preferences.getInt(_scopedKey(_totalAnswersKey, userId)) ?? 0;

    correctAnswerAttempts =
        preferences.getInt(_scopedKey(_correctAnswersKey, userId)) ?? 0;

    studyStreak = preferences.getInt(_scopedKey(_studyStreakKey, userId)) ?? 0;

    lastStudyDate = preferences.getString(
      _scopedKey(_lastStudyDateKey, userId),
    );

    dailyAnsweredQuestions =
        preferences.getInt(_scopedKey(_dailyAnsweredQuestionsKey, userId)) ?? 0;

    dailyActivityDate = preferences.getString(
      _scopedKey(_dailyActivityDateKey, userId),
    );

    final encodedPerformance = preferences.getString(
      _scopedKey(_questionPerformanceKey, userId),
    );

    if (encodedPerformance != null && encodedPerformance.isNotEmpty) {
      try {
        final decoded = jsonDecode(encodedPerformance);

        if (decoded is Map) {
          for (final entry in decoded.entries) {
            final questionId = entry.key?.toString();
            final performance = QuestionPerformance.fromJson(entry.value);

            if (questionId != null &&
                questionId.isNotEmpty &&
                performance != null) {
              _questionPerformance[questionId] = performance;
            }
          }
        }
      } catch (_) {
        // Ignore malformed legacy/local data and continue safely.
      }
    }

    final previousReviewIds = preferences.getStringList(
      _scopedKey(_lastPersonalizedReviewSessionKey, userId),
    );

    if (previousReviewIds != null) {
      _lastPersonalizedReviewSessionIds.addAll(previousReviewIds);
    }

    for (final lessonId in _lessonIds) {
      final questionIds = preferences.getStringList(
        _scopedKey('${_lastQuestionSessionKey}_$lessonId', userId),
      );

      if (questionIds != null && questionIds.isNotEmpty) {
        _lastQuestionSessionIds[lessonId] = questionIds.toSet();
      }

      final finalTestQuestionIds = preferences.getStringList(
        _scopedKey('${_lastFinalTestSessionKey}_$lessonId', userId),
      );

      if (finalTestQuestionIds != null && finalTestQuestionIds.isNotEmpty) {
        _lastFinalTestSessionIds[lessonId] = finalTestQuestionIds.toSet();
      }
    }
  }

  static void _mergeRemoteProgress(Map<String, dynamic> data) {
    final remoteLessons = data['completedLessonIds'];

    if (remoteLessons is Iterable) {
      _completedLessonIds.addAll(remoteLessons.whereType<String>());
    } else {
      if (data['algebraFundamentalCompleted'] == true) {
        _completedLessonIds.add(algebraFundamentalId);
      }

      if (data['equationsAndInequationsCompleted'] == true) {
        _completedLessonIds.add(equationsAndInequationsId);
      }

      if (data['functionsCompleted'] == true) {
        _completedLessonIds.add(functionsId);
      }

      if (data['limitsCompleted'] == true) {
        _completedLessonIds.add(limitsId);
      }

      if (data['continuityCompleted'] == true) {
        _completedLessonIds.add(continuityId);
      }

      if (data['derivativesCompleted'] == true) {
        _completedLessonIds.add(derivativesId);
      }
    }

    final remoteTotalAnswers = data['totalAnswerAttempts'];

    if (remoteTotalAnswers is num) {
      totalAnswerAttempts = max(
        totalAnswerAttempts,
        remoteTotalAnswers.toInt(),
      );
    }

    final remoteCorrectAnswers = data['correctAnswerAttempts'];

    if (remoteCorrectAnswers is num) {
      correctAnswerAttempts = max(
        correctAnswerAttempts,
        remoteCorrectAnswers.toInt(),
      );
    }

    final remoteContentLessons = data['completedContentLessonIds'];

    if (remoteContentLessons is Iterable) {
      _completedContentLessonIds.addAll(
        remoteContentLessons.whereType<String>(),
      );
    }

    _mergeStudyStreak(data);
    _mergeDailyActivity(data);
    _mergeQuestionSessions(data);
    _mergeFinalTestSessions(data);
    _mergeQuestionPerformance(data);
    _mergePersonalizedReviewSession(data);
  }

  static void _mergeQuestionSessions(Map<String, dynamic> data) {
    final remoteSessions = data['lastQuestionSessionIds'];

    if (remoteSessions is! Map) {
      return;
    }

    for (final lessonId in _lessonIds) {
      final remoteQuestionIds = remoteSessions[lessonId];

      if (remoteQuestionIds is Iterable) {
        final questionIds = remoteQuestionIds.whereType<String>().toSet();

        if (questionIds.isNotEmpty) {
          _lastQuestionSessionIds[lessonId] = questionIds;
        }
      }
    }
  }

  static void _mergeFinalTestSessions(Map<String, dynamic> data) {
    final remoteSessions = data['lastFinalTestSessionIds'];

    if (remoteSessions is! Map) {
      return;
    }

    for (final lessonId in _lessonIds) {
      final remoteQuestionIds = remoteSessions[lessonId];

      if (remoteQuestionIds is Iterable) {
        final questionIds = remoteQuestionIds.whereType<String>().toSet();

        if (questionIds.isNotEmpty) {
          _lastFinalTestSessionIds[lessonId] = questionIds;
        }
      }
    }
  }


  static void _mergeQuestionPerformance(Map<String, dynamic> data) {
    final remotePerformance = data['questionPerformance'];

    if (remotePerformance is! Map) {
      return;
    }

    for (final entry in remotePerformance.entries) {
      final questionId = entry.key?.toString();
      final remote = QuestionPerformance.fromJson(entry.value);

      if (questionId == null || questionId.isEmpty || remote == null) {
        continue;
      }

      final local = _questionPerformance[questionId];
      _questionPerformance[questionId] = local == null
          ? remote
          : local.merge(remote);
    }
  }

  static void _mergePersonalizedReviewSession(Map<String, dynamic> data) {
    final remoteIds = data['lastPersonalizedReviewSessionIds'];

    if (remoteIds is Iterable) {
      _lastPersonalizedReviewSessionIds
        ..clear()
        ..addAll(remoteIds.whereType<String>());
    }
  }

  static void _mergeStudyStreak(Map<String, dynamic> data) {
    final remoteLastStudyDate = data['lastStudyDate'];

    final remoteStreakValue = data['studyStreak'];
    final remoteStreak = remoteStreakValue is num
        ? remoteStreakValue.toInt()
        : 0;

    if (remoteLastStudyDate is! String || remoteLastStudyDate.isEmpty) {
      return;
    }

    if (lastStudyDate == null ||
        remoteLastStudyDate.compareTo(lastStudyDate!) > 0) {
      lastStudyDate = remoteLastStudyDate;
      studyStreak = remoteStreak;
      return;
    }

    if (remoteLastStudyDate == lastStudyDate) {
      studyStreak = max(studyStreak, remoteStreak);
    }
  }

  static void _mergeDailyActivity(Map<String, dynamic> data) {
    final remoteDailyDate = data['dailyActivityDate'];

    final remoteDailyAnsweredValue = data['dailyAnsweredQuestions'];

    final remoteDailyAnswered = remoteDailyAnsweredValue is num
        ? remoteDailyAnsweredValue.toInt()
        : 0;

    if (remoteDailyDate is! String || remoteDailyDate.isEmpty) {
      return;
    }

    if (dailyActivityDate == null ||
        remoteDailyDate.compareTo(dailyActivityDate!) > 0) {
      dailyActivityDate = remoteDailyDate;
      dailyAnsweredQuestions = remoteDailyAnswered;
      return;
    }

    if (remoteDailyDate == dailyActivityDate) {
      dailyAnsweredQuestions = max(dailyAnsweredQuestions, remoteDailyAnswered);
    }
  }

  static void _normalizeDailyStatistics() {
    final today = _dateKey(DateTime.now());

    if (dailyActivityDate != today) {
      dailyActivityDate = today;
      dailyAnsweredQuestions = 0;
    }

    if (correctAnswerAttempts > totalAnswerAttempts) {
      correctAnswerAttempts = totalAnswerAttempts;
    }

    totalAnswerAttempts = max(0, totalAnswerAttempts);
    correctAnswerAttempts = max(0, correctAnswerAttempts);
    studyStreak = max(0, studyStreak);
    dailyAnsweredQuestions = max(0, dailyAnsweredQuestions);
  }

  static void _applyCompletedLessons() {
    algebraFundamentalCompleted = _completedLessonIds.contains(
      algebraFundamentalId,
    );

    equationsAndInequationsCompleted = _completedLessonIds.contains(
      equationsAndInequationsId,
    );

    functionsCompleted = _completedLessonIds.contains(functionsId);

    limitsCompleted = _completedLessonIds.contains(limitsId);

    continuityCompleted = _completedLessonIds.contains(continuityId);

    derivativesCompleted = _completedLessonIds.contains(derivativesId);

    totalXp = 0;
    totalGold = 0;

    if (algebraFundamentalCompleted) {
      totalXp += 60;
      totalGold += 25;
    }

    if (equationsAndInequationsCompleted) {
      totalXp += 70;
      totalGold += 30;
    }

    if (functionsCompleted) {
      totalXp += 80;
      totalGold += 35;
    }

    if (limitsCompleted) {
      totalXp += 90;
      totalGold += 40;
    }

    if (continuityCompleted) {
      totalXp += 100;
      totalGold += 45;
    }

    if (derivativesCompleted) {
      totalXp += 110;
      totalGold += 50;
    }

    revision.value++;
  }

  static void _registerStudyDay() {
    final now = DateTime.now();
    final today = _dateKey(now);
    final yesterday = _dateKey(now.subtract(const Duration(days: 1)));

    if (lastStudyDate == today) {
      return;
    }

    if (lastStudyDate == yesterday) {
      studyStreak = max(1, studyStreak + 1);
    } else {
      studyStreak = 1;
    }

    lastStudyDate = today;
  }

  static Future<void> _saveLocalProgress() async {
    final preferences = await SharedPreferences.getInstance();

    final sortedLessons = _completedLessonIds.toList()..sort();

    await preferences.setStringList(
      _scopedKey(_completedLessonsKey, _activeUserId),
      sortedLessons,
    );

    final sortedContentLessons = _completedContentLessonIds.toList()..sort();

    await preferences.setStringList(
      _scopedKey(_completedContentLessonsKey, _activeUserId),
      sortedContentLessons,
    );

    await preferences.setInt(
      _scopedKey(_totalAnswersKey, _activeUserId),
      totalAnswerAttempts,
    );

    await preferences.setInt(
      _scopedKey(_correctAnswersKey, _activeUserId),
      correctAnswerAttempts,
    );

    await preferences.setInt(
      _scopedKey(_studyStreakKey, _activeUserId),
      studyStreak,
    );

    if (lastStudyDate != null) {
      await preferences.setString(
        _scopedKey(_lastStudyDateKey, _activeUserId),
        lastStudyDate!,
      );
    }

    await preferences.setInt(
      _scopedKey(_dailyAnsweredQuestionsKey, _activeUserId),
      dailyAnsweredQuestions,
    );

    if (dailyActivityDate != null) {
      await preferences.setString(
        _scopedKey(_dailyActivityDateKey, _activeUserId),
        dailyActivityDate!,
      );
    }

    await preferences.setString(
      _scopedKey(_questionPerformanceKey, _activeUserId),
      jsonEncode(<String, dynamic>{
        for (final entry in _questionPerformance.entries)
          entry.key: entry.value.toJson(),
      }),
    );

    await preferences.setStringList(
      _scopedKey(_lastPersonalizedReviewSessionKey, _activeUserId),
      _lastPersonalizedReviewSessionIds.toList(),
    );

    for (final lessonId in _lessonIds) {
      final questionIds =
          _lastQuestionSessionIds[lessonId]?.toList() ?? <String>[];

      await preferences.setStringList(
        _scopedKey('${_lastQuestionSessionKey}_$lessonId', _activeUserId),
        questionIds,
      );

      final finalTestQuestionIds =
          _lastFinalTestSessionIds[lessonId]?.toList() ?? <String>[];

      await preferences.setStringList(
        _scopedKey('${_lastFinalTestSessionKey}_$lessonId', _activeUserId),
        finalTestQuestionIds,
      );
    }
  }

  static Future<void> _saveRemoteProgress() async {
    final document = _progressDocument();

    if (document == null) {
      return;
    }

    final sortedLessons = _completedLessonIds.toList()..sort();

    await document.set(<String, dynamic>{
      'completedLessonIds': sortedLessons,
      'completedContentLessonIds':
          (_completedContentLessonIds.toList()..sort()),
      'algebraFundamentalCompleted': algebraFundamentalCompleted,
      'equationsAndInequationsCompleted': equationsAndInequationsCompleted,
      'functionsCompleted': functionsCompleted,
      'limitsCompleted': limitsCompleted,
      'continuityCompleted': continuityCompleted,
      'derivativesCompleted': derivativesCompleted,
      'totalXp': totalXp,
      'totalGold': totalGold,
      'totalAnswerAttempts': totalAnswerAttempts,
      'correctAnswerAttempts': correctAnswerAttempts,
      'incorrectAnswerAttempts': incorrectAnswerAttempts,
      'accuracy': accuracy,
      'studyStreak': studyStreak,
      'lastStudyDate': lastStudyDate,
      'dailyAnsweredQuestions': dailyAnsweredQuestions,
      'dailyQuestionGoal': dailyQuestionGoal,
      'dailyActivityDate': dailyActivityDate,
      'lastQuestionSessionIds': <String, List<String>>{
        for (final entry in _lastQuestionSessionIds.entries)
          entry.key: entry.value.toList(),
      },
      'lastFinalTestSessionIds': <String, List<String>>{
        for (final entry in _lastFinalTestSessionIds.entries)
          entry.key: entry.value.toList(),
      },
      'questionPerformance': <String, Map<String, dynamic>>{
        for (final entry in _questionPerformance.entries)
          entry.key: entry.value.toJson(),
      },
      'lastPersonalizedReviewSessionIds':
          _lastPersonalizedReviewSessionIds.toList(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<void> _persistProgress() async {
    await _saveLocalProgress();

    try {
      await _saveRemoteProgress();
    } catch (error) {
      debugPrint(
        'AppProgress: dados salvos localmente, '
        'mas não enviados ao Firestore: $error',
      );
    }
  }

  static void _queueProgressSave() {
    _saveQueue = _saveQueue.then((_) => _persistProgress());
  }

  static List<String> selectExerciseQuestionIds({
    required String lessonId,
    required Iterable<String> availableQuestionIds,
    int questionCount = 10,
  }) {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    final previousSessionIds = _lastQuestionSessionIds[lessonId] ?? <String>{};

    final selectedQuestionIds = ExerciseQuestionSelector.select(
      availableQuestionIds: availableQuestionIds,
      previousSessionIds: previousSessionIds,
      questionCount: questionCount,
    );

    if (selectedQuestionIds.isEmpty) {
      return <String>[];
    }

    _lastQuestionSessionIds[lessonId] = selectedQuestionIds.toSet();
    _queueProgressSave();

    return selectedQuestionIds;
  }

  static List<String> selectFinalTestQuestionIds({
    required String lessonId,
    required Iterable<String> availableQuestionIds,
    Iterable<String> practiceQuestionIds = const <String>[],
    int questionCount = 10,
  }) {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    final previousFinalTestIds =
        _lastFinalTestSessionIds[lessonId] ?? <String>{};

    final selectedQuestionIds = QuestionSelectionEngine.selectQuestionIds(
      availableQuestionIds: availableQuestionIds,
      primaryAvoidIds: practiceQuestionIds,
      secondaryAvoidIds: previousFinalTestIds,
      questionCount: questionCount,
    );

    if (selectedQuestionIds.isEmpty) {
      return <String>[];
    }

    _lastFinalTestSessionIds[lessonId] = selectedQuestionIds.toSet();
    _queueProgressSave();

    return selectedQuestionIds;
  }

  static List<QuestionCandidate> selectFinalTestCandidates({
    required String lessonId,
    required Iterable<QuestionCandidate> candidates,
    Iterable<String> practiceQuestionIds = const <String>[],
    int questionCount = 10,
  }) {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    final previousFinalTestIds =
        _lastFinalTestSessionIds[lessonId] ?? <String>{};

    final selectedCandidates = QuestionSelectionEngine.selectCandidates(
      candidates: candidates,
      moduleId: lessonId,
      primaryAvoidIds: practiceQuestionIds,
      secondaryAvoidIds: previousFinalTestIds,
      questionCount: questionCount,
    );

    if (selectedCandidates.isEmpty) {
      return <QuestionCandidate>[];
    }

    _lastFinalTestSessionIds[lessonId] = selectedCandidates
        .map((candidate) => candidate.questionId)
        .toSet();
    _queueProgressSave();

    return selectedCandidates;
  }


  static List<QuestionCandidate> selectPersonalizedReviewCandidates({
    required Iterable<QuestionCandidate> candidates,
    int questionCount = 10,
  }) {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    final selected = PersonalizedReviewSessionBuilder.build(
      candidates: candidates,
      performanceByQuestionId: _questionPerformance,
      previousSessionIds: _lastPersonalizedReviewSessionIds,
      questionCount: questionCount,
    );

    _lastPersonalizedReviewSessionIds
      ..clear()
      ..addAll(selected.map((candidate) => candidate.questionId));

    if (selected.isNotEmpty) {
      _queueProgressSave();
    }

    return selected;
  }

  static void recordExerciseAnswer({
    required String questionId,
    required bool isCorrect,
  }) {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    _normalizeDailyStatistics();
    _registerStudyDay();

    totalAnswerAttempts++;

    if (isCorrect) {
      correctAnswerAttempts++;
    }

    dailyAnsweredQuestions++;

    final currentPerformance =
        _questionPerformance[questionId] ?? const QuestionPerformance();
    _questionPerformance[questionId] =
        currentPerformance.record(isCorrect: isCorrect);

    revision.value++;

    _queueProgressSave();
  }

  static Future<void> _completeLesson(String lessonId) async {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    _completedLessonIds.add(lessonId);
    _registerStudyDay();
    _applyCompletedLessons();

    _queueProgressSave();
    await _saveQueue;
  }

  static bool isContentLessonCompleted(String lessonId) {
    return _completedContentLessonIds.contains(lessonId);
  }

  static Future<void> completeContentLesson(String lessonId) async {
    _activeUserId ??= FirebaseAuth.instance.currentUser?.uid;

    _completedContentLessonIds.add(lessonId);
    _registerStudyDay();
    revision.value++;

    _queueProgressSave();
    await _saveQueue;
  }

  static Future<void> completeAlgebraFundamental() {
    return _completeLesson(algebraFundamentalId);
  }

  static Future<void> completeEquationsAndInequations() {
    return _completeLesson(equationsAndInequationsId);
  }

  static Future<void> completeFunctions() {
    return _completeLesson(functionsId);
  }

  static Future<void> completeLimits() {
    return _completeLesson(limitsId);
  }

  static Future<void> completeContinuity() {
    return _completeLesson(continuityId);
  }

  static Future<void> completeDerivatives() {
    return _completeLesson(derivativesId);
  }

  static Future<void> resetProgress() async {
    final user = FirebaseAuth.instance.currentUser;

    _activeUserId = user?.uid;
    _resetInMemory();
    dailyActivityDate = _dateKey(DateTime.now());
    _applyCompletedLessons();

    await _saveLocalProgress();

    final document = _progressDocument();

    if (document == null) {
      return;
    }

    await document.set(<String, dynamic>{
      'completedLessonIds': <String>[],
      'completedContentLessonIds': <String>[],
      'algebraFundamentalCompleted': false,
      'equationsAndInequationsCompleted': false,
      'functionsCompleted': false,
      'limitsCompleted': false,
      'continuityCompleted': false,
      'derivativesCompleted': false,
      'totalXp': 0,
      'totalGold': 0,
      'totalAnswerAttempts': 0,
      'correctAnswerAttempts': 0,
      'incorrectAnswerAttempts': 0,
      'accuracy': 0,
      'studyStreak': 0,
      'lastStudyDate': null,
      'dailyAnsweredQuestions': 0,
      'dailyQuestionGoal': dailyQuestionGoal,
      'dailyActivityDate': dailyActivityDate,
      'lastQuestionSessionIds': <String, List<String>>{},
      'lastFinalTestSessionIds': <String, List<String>>{},
      'questionPerformance': <String, Map<String, dynamic>>{},
      'lastPersonalizedReviewSessionIds': <String>[],
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> deleteCurrentUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? _activeUserId;

    if (userId == null || userId.trim().isEmpty) {
      throw StateError('Nenhum usuário autenticado para excluir os dados.');
    }

    await _saveQueue;

    final userDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(userId);

    await userDocument.collection('progress').doc('current').delete();
    await userDocument.delete();

    final preferences = await SharedPreferences.getInstance();

    final scopedKeys = <String>[
      _completedLessonsKey,
      _completedContentLessonsKey,
      _totalAnswersKey,
      _correctAnswersKey,
      _studyStreakKey,
      _lastStudyDateKey,
      _dailyAnsweredQuestionsKey,
      _dailyActivityDateKey,
      _questionPerformanceKey,
      _lastPersonalizedReviewSessionKey,
    ];

    for (final key in scopedKeys) {
      await preferences.remove(_scopedKey(key, userId));
    }

    for (final lessonId in _lessonIds) {
      await preferences.remove(
        _scopedKey('${_lastQuestionSessionKey}_$lessonId', userId),
      );
      await preferences.remove(
        _scopedKey('${_lastFinalTestSessionKey}_$lessonId', userId),
      );
    }

    await preferences.remove(_algebraFundamentalLegacyKey);
    await preferences.remove(_equationsAndInequationsLegacyKey);
    await preferences.remove(_functionsLegacyKey);
    await preferences.remove(_limitsLegacyKey);

    _activeUserId = null;
    _saveQueue = Future<void>.value();
    _resetInMemory();

    revision.value++;
  }

  static void clearSession() {
    _activeUserId = null;
    _saveQueue = Future<void>.value();
    _resetInMemory();

    revision.value++;
  }
}