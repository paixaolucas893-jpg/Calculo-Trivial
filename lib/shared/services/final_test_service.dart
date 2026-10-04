import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';
import 'package:calcquest/shared/domain/final_test_session_builder.dart';
import 'package:calcquest/shared/services/module_mastery_tracker.dart';
import 'package:calcquest/shared/state/app_progress.dart';

class TrustedFinalTestOption {
  final String id;
  final String text;

  const TrustedFinalTestOption({required this.id, required this.text});

  factory TrustedFinalTestOption.fromMap(Map<String, dynamic> map) {
    return TrustedFinalTestOption(
      id: _requiredString(map, 'id'),
      text: _requiredString(map, 'text'),
    );
  }
}

class TrustedFinalTestQuestion {
  final String id;
  final String statement;
  final List<TrustedFinalTestOption> options;

  const TrustedFinalTestQuestion({
    required this.id,
    required this.statement,
    required this.options,
  });

  factory TrustedFinalTestQuestion.fromMap(Map<String, dynamic> map) {
    final rawOptions = map['options'];
    if (rawOptions is! List) {
      throw const FormatException('Invalid final test options.');
    }

    final options = rawOptions
        .map(
          (option) => TrustedFinalTestOption.fromMap(
            _stringMap(option, 'Invalid final test option.'),
          ),
        )
        .toList(growable: false);

    if (options.isEmpty) {
      throw const FormatException('Final test question has no options.');
    }

    return TrustedFinalTestQuestion(
      id: _requiredString(map, 'id'),
      statement: _requiredString(map, 'statement'),
      options: options,
    );
  }
}

class TrustedFinalTestSession {
  final String sessionId;
  final String moduleId;
  final DateTime expiresAt;
  final List<TrustedFinalTestQuestion> questions;

  const TrustedFinalTestSession({
    required this.sessionId,
    required this.moduleId,
    required this.expiresAt,
    required this.questions,
  });

  factory TrustedFinalTestSession.fromMap(Map<String, dynamic> map) {
    final rawQuestions = map['questions'];
    if (rawQuestions is! List) {
      throw const FormatException('Invalid final test questions.');
    }

    final expiresAt = DateTime.tryParse(_requiredString(map, 'expiresAt'));
    if (expiresAt == null) {
      throw const FormatException('Invalid final test expiration.');
    }

    final questions = rawQuestions
        .map(
          (question) => TrustedFinalTestQuestion.fromMap(
            _stringMap(question, 'Invalid final test question.'),
          ),
        )
        .toList(growable: false);

    if (questions.length != 10) {
      throw const FormatException('Final test must contain ten questions.');
    }

    return TrustedFinalTestSession(
      sessionId: _requiredString(map, 'sessionId'),
      moduleId: _requiredString(map, 'moduleId'),
      expiresAt: expiresAt,
      questions: questions,
    );
  }
}

class TrustedFinalTestAnswer {
  final String questionId;
  final String optionId;

  const TrustedFinalTestAnswer({
    required this.questionId,
    required this.optionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'questionId': questionId, 'optionId': optionId};
  }
}

class TrustedFinalTestSubmission {
  final int totalQuestions;
  final int correctAnswers;
  final double accuracy;
  final bool approved;
  final int awardedXp;
  final int awardedGold;
  final bool rewardAlreadyAppliedByBackend;

  const TrustedFinalTestSubmission({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.accuracy,
    required this.approved,
    required this.awardedXp,
    required this.awardedGold,
    this.rewardAlreadyAppliedByBackend = true,
  });

  factory TrustedFinalTestSubmission.fromMap(Map<String, dynamic> map) {
    final submission = _stringMap(
      map['submission'],
      'Invalid final test submission.',
    );

    final rewardValue = map['reward'];
    final reward = rewardValue == null
        ? const <String, dynamic>{}
        : _stringMap(rewardValue, 'Invalid final test reward.');

    return TrustedFinalTestSubmission(
      totalQuestions: _requiredInt(submission, 'totalQuestions'),
      correctAnswers: _requiredInt(submission, 'correctAnswers'),
      accuracy: _requiredDouble(submission, 'accuracy'),
      approved: _requiredBool(submission, 'approved'),
      awardedXp: _optionalInt(reward, 'xpAwarded'),
      awardedGold: _optionalInt(reward, 'goldAwarded'),
      rewardAlreadyAppliedByBackend: true,
    );
  }
}

class FinalTestLoadFailure {
  final String code;
  final String message;

  const FinalTestLoadFailure({
    required this.code,
    required this.message,
  });
}

FinalTestLoadFailure describeFinalTestLoadFailure(
  Object error, {
  required bool isEnglish,
}) {
  if (error is FirebaseFunctionsException) {
    debugPrint(
      'FinalTestService: FirebaseFunctionsException '
      '${error.code} - ${error.message} - ${error.details}',
    );

    final message = switch (error.code) {
      'not-found' => isEnglish
          ? 'The final-test service is not available on the server.'
          : 'O serviço do teste final não está disponível no servidor.',
      'permission-denied' => isEnglish
          ? 'The app security validation failed. Update the app from Google Play and try again.'
          : 'A validação de segurança do aplicativo falhou. Atualize o app pela Google Play e tente novamente.',
      'unauthenticated' => isEnglish
          ? 'Your session could not be authenticated. Sign in again and try once more.'
          : 'Sua sessão não pôde ser autenticada. Entre novamente na conta e tente outra vez.',
      'resource-exhausted' => isEnglish
          ? 'Too many final-test requests were made. Wait a moment and try again.'
          : 'Foram feitas muitas tentativas de iniciar o teste final. Aguarde um pouco e tente novamente.',
      'deadline-exceeded' => isEnglish
          ? 'The final-test service took too long to respond. Try again.'
          : 'O serviço do teste final demorou demais para responder. Tente novamente.',
      'unavailable' => isEnglish
          ? 'The final-test service is temporarily unavailable.'
          : 'O serviço do teste final está temporariamente indisponível.',
      'internal' => isEnglish
          ? 'The server could not start the final test.'
          : 'O servidor não conseguiu iniciar o teste final.',
      _ => isEnglish
          ? 'The final test could not be loaded. Error: ${error.code}.'
          : 'Não foi possível carregar o teste final. Erro: ${error.code}.',
    };

    return FinalTestLoadFailure(code: error.code, message: message);
  }

  if (error is FormatException) {
    debugPrint('FinalTestService: invalid server response: $error');
    return FinalTestLoadFailure(
      code: 'invalid-response',
      message: isEnglish
          ? 'The final-test service returned an invalid response.'
          : 'O serviço do teste final retornou uma resposta inválida.',
    );
  }

  debugPrint('FinalTestService: unexpected start failure: $error');
  return FinalTestLoadFailure(
    code: 'unexpected',
    message: isEnglish
        ? 'The final test could not be loaded. Try again.'
        : 'Não foi possível carregar o teste final. Tente novamente.',
  );
}

class _LocalFinalTestSession {
  final String moduleId;
  final List<ExerciseData> exercises;
  final DateTime expiresAt;

  const _LocalFinalTestSession({
    required this.moduleId,
    required this.exercises,
    required this.expiresAt,
  });
}

class _ModuleReward {
  final int xp;
  final int gold;

  const _ModuleReward(this.xp, this.gold);
}

class FinalTestService {
  static const String algebraModuleId = 'algebra-fundamental';
  static const String equationsModuleId = 'equacoes-inequacoes';
  static const String functionsModuleId = 'funcoes';
  static const String limitsModuleId = 'limites';
  static const String continuityModuleId = 'continuidade';
  static const String derivativesModuleId = 'derivadas';

  final FirebaseFunctions _functions;
  final Map<String, _LocalFinalTestSession> _localSessions =
      <String, _LocalFinalTestSession>{};

  FinalTestService({FirebaseFunctions? functions})
    : _functions =
          functions ?? FirebaseFunctions.instanceFor(region: 'us-central1');

  Future<TrustedFinalTestSession> startAlgebraFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: algebraModuleId,
      exercises: mockExercises,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startEquationsFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: equationsModuleId,
      exercises: mockEquationsExercises,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startFunctionsFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: functionsModuleId,
      exercises: mockFunctionsExercises,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startLimitsFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: limitsModuleId,
      exercises: mockLimitsExercises,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startContinuityFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: continuityModuleId,
      exercises: mockContinuityExercises,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startDerivativesFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: derivativesModuleId,
      exercises: mockDerivativesExercises,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> _startFinalTest({
    required String moduleId,
    required List<ExerciseData> exercises,
    required Iterable<String> practiceQuestionIds,
  }) async {
    try {
      final callable = _functions.httpsCallable(
        'startFinalTest',
        options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
      );

      final result = await callable.call<dynamic>(<String, dynamic>{
        'moduleId': moduleId,
      });

      return TrustedFinalTestSession.fromMap(
        _stringMap(result.data, 'Invalid startFinalTest response.'),
      );
    } on FirebaseFunctionsException catch (error) {
      if (!_shouldUseLocalFallback(error.code)) {
        rethrow;
      }

      debugPrint(
        'FinalTestService: using local fallback for $moduleId '
        'because startFinalTest returned ${error.code}.',
      );

      return _startLocalFinalTest(
        moduleId: moduleId,
        exercises: exercises,
        practiceQuestionIds: practiceQuestionIds,
      );
    }
  }

  TrustedFinalTestSession _startLocalFinalTest({
    required String moduleId,
    required List<ExerciseData> exercises,
    required Iterable<String> practiceQuestionIds,
  }) {
    final selectedExercises = FinalTestSessionBuilder.build(
      lessonId: moduleId,
      exercises: exercises,
      practiceQuestionIds: practiceQuestionIds,
      questionCount: 10,
    );

    if (selectedExercises.length != 10) {
      throw const FormatException(
        'Local final test requires exactly ten questions.',
      );
    }

    final now = DateTime.now();
    final sessionId =
        'local:$moduleId:${now.microsecondsSinceEpoch.toString()}';
    final expiresAt = now.add(const Duration(hours: 1));

    _localSessions[sessionId] = _LocalFinalTestSession(
      moduleId: moduleId,
      exercises: selectedExercises,
      expiresAt: expiresAt,
    );

    return TrustedFinalTestSession(
      sessionId: sessionId,
      moduleId: moduleId,
      expiresAt: expiresAt,
      questions: selectedExercises
          .map(
            (exercise) => TrustedFinalTestQuestion(
              id: exercise.id,
              statement: exercise.statement,
              options: exercise.options
                  .map(
                    (option) => TrustedFinalTestOption(
                      id: option.id,
                      text: option.text,
                    ),
                  )
                  .toList(growable: false),
            ),
          )
          .toList(growable: false),
    );
  }

  Future<TrustedFinalTestSubmission> submitAlgebraFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) {
    return _submitFinalTest(
      moduleId: algebraModuleId,
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> submitEquationsFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) {
    return _submitFinalTest(
      moduleId: equationsModuleId,
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> submitFunctionsFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) {
    return _submitFinalTest(
      moduleId: functionsModuleId,
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> submitLimitsFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) {
    return _submitFinalTest(
      moduleId: limitsModuleId,
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> submitContinuityFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) {
    return _submitFinalTest(
      moduleId: continuityModuleId,
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> submitDerivativesFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) {
    return _submitFinalTest(
      moduleId: derivativesModuleId,
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> _submitFinalTest({
    required String moduleId,
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) async {
    if (sessionId.startsWith('local:')) {
      return _submitLocalFinalTest(
        moduleId: moduleId,
        sessionId: sessionId,
        answers: answers,
      );
    }

    final callable = _functions.httpsCallable(
      'submitFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(<String, dynamic>{
      'sessionId': sessionId,
      'answers': answers
          .map((answer) => answer.toMap())
          .toList(growable: false),
    });

    return TrustedFinalTestSubmission.fromMap(
      _stringMap(result.data, 'Invalid submitFinalTest response.'),
    );
  }

  Future<TrustedFinalTestSubmission> _submitLocalFinalTest({
    required String moduleId,
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) async {
    final localSession = _localSessions[sessionId];
    if (localSession == null || localSession.moduleId != moduleId) {
      throw StateError('Local final test session is unavailable.');
    }

    if (DateTime.now().isAfter(localSession.expiresAt)) {
      _localSessions.remove(sessionId);
      throw StateError('Local final test session has expired.');
    }

    if (answers.length != localSession.exercises.length) {
      throw const FormatException('Final test must contain ten answers.');
    }

    final answersByQuestionId = <String, String>{};
    for (final answer in answers) {
      if (answersByQuestionId.containsKey(answer.questionId)) {
        throw const FormatException('Duplicate final test answer.');
      }
      answersByQuestionId[answer.questionId] = answer.optionId;
    }

    var correctAnswers = 0;
    for (final exercise in localSession.exercises) {
      final selectedOptionId = answersByQuestionId[exercise.id];
      if (selectedOptionId == null) {
        throw const FormatException('Missing final test answer.');
      }

      final optionExists = exercise.options.any(
        (option) => option.id == selectedOptionId,
      );
      if (!optionExists) {
        throw const FormatException('Invalid final test option.');
      }

      final isCorrect = selectedOptionId == exercise.correctOptionId;
      if (isCorrect) {
        correctAnswers++;
      }
      AppProgress.recordExerciseAnswer(isCorrect: isCorrect);
    }

    final totalQuestions = localSession.exercises.length;
    final accuracy = correctAnswers / totalQuestions;
    final approved = accuracy >= 0.80;
    final reward = _rewardFor(moduleId);

    await ModuleMasteryTracker.recordFinalTestResult(
      moduleId: moduleId,
      correctAnswers: correctAnswers,
      totalQuestions: totalQuestions,
      legacyCompleted: _legacyCompletedFor(moduleId),
    );

    _localSessions.remove(sessionId);

    return TrustedFinalTestSubmission(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      accuracy: accuracy,
      approved: approved,
      awardedXp: reward.xp,
      awardedGold: reward.gold,
      rewardAlreadyAppliedByBackend: false,
    );
  }

  static bool _shouldUseLocalFallback(String code) {
    return switch (code) {
      'not-found' ||
      'unavailable' ||
      'deadline-exceeded' ||
      'internal' => true,
      _ => false,
    };
  }

  static _ModuleReward _rewardFor(String moduleId) {
    return switch (moduleId) {
      algebraModuleId => const _ModuleReward(60, 25),
      equationsModuleId => const _ModuleReward(70, 30),
      functionsModuleId => const _ModuleReward(80, 35),
      limitsModuleId => const _ModuleReward(90, 40),
      continuityModuleId => const _ModuleReward(100, 45),
      derivativesModuleId => const _ModuleReward(110, 50),
      _ => const _ModuleReward(0, 0),
    };
  }

  static bool _legacyCompletedFor(String moduleId) {
    return switch (moduleId) {
      algebraModuleId => AppProgress.algebraFundamentalCompleted,
      equationsModuleId => AppProgress.equationsAndInequationsCompleted,
      functionsModuleId => AppProgress.functionsCompleted,
      limitsModuleId => AppProgress.limitsCompleted,
      continuityModuleId => AppProgress.continuityCompleted,
      derivativesModuleId => AppProgress.derivativesCompleted,
      _ => false,
    };
  }
}

Map<String, dynamic> _stringMap(Object? value, String errorMessage) {
  if (value is! Map) {
    throw FormatException(errorMessage);
  }

  return value.map<String, dynamic>(
    (key, item) => MapEntry(key.toString(), item),
  );
}

String _requiredString(Map<String, dynamic> map, String key) {
  final value = map[key];
  if (value is! String || value.trim().isEmpty) {
    throw FormatException('Invalid $key.');
  }
  return value;
}

int _requiredInt(Map<String, dynamic> map, String key) {
  final value = map[key];
  if (value is! num || value % 1 != 0) {
    throw FormatException('Invalid $key.');
  }
  return value.toInt();
}

int _optionalInt(Map<String, dynamic> map, String key) {
  final value = map[key];
  if (value == null) {
    return 0;
  }
  if (value is! num || value % 1 != 0) {
    throw FormatException('Invalid $key.');
  }
  return value.toInt();
}

double _requiredDouble(Map<String, dynamic> map, String key) {
  final value = map[key];
  if (value is! num) {
    throw FormatException('Invalid $key.');
  }
  return value.toDouble();
}

bool _requiredBool(Map<String, dynamic> map, String key) {
  final value = map[key];
  if (value is! bool) {
    throw FormatException('Invalid $key.');
  }
  return value;
}
