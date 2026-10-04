import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import 'package:calcquest/shared/data/mock_continuity_exercise_data.dart';
import 'package:calcquest/shared/data/mock_derivatives_exercise_data.dart';
import 'package:calcquest/shared/data/mock_equations_exercise_data.dart';
import 'package:calcquest/shared/data/mock_exercise_data.dart';
import 'package:calcquest/shared/data/mock_functions_exercise_data.dart';
import 'package:calcquest/shared/data/mock_limits_exercise_data.dart';
import 'package:calcquest/shared/domain/final_test_session_builder.dart';
import 'package:calcquest/shared/domain/module_mastery_policy.dart';
import 'package:calcquest/shared/services/module_mastery_tracker.dart';

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

bool shouldUseLocalFinalTestFallback(String code) {
  return const <String>{
    'not-found',
    'unavailable',
    'deadline-exceeded',
  }.contains(code);
}

@visibleForTesting
int countCorrectLocalFinalTestAnswers({
  required Map<String, String> correctOptionByQuestionId,
  required Iterable<TrustedFinalTestAnswer> answers,
}) {
  var correctAnswers = 0;

  for (final answer in answers) {
    if (correctOptionByQuestionId[answer.questionId] == answer.optionId) {
      correctAnswers++;
    }
  }

  return correctAnswers;
}

class _LocalFinalTestSession {
  final String moduleId;
  final DateTime expiresAt;
  final Map<String, String> correctOptionByQuestionId;

  const _LocalFinalTestSession({
    required this.moduleId,
    required this.expiresAt,
    required this.correctOptionByQuestionId,
  });
}

class FinalTestService {
  static const String algebraModuleId = 'algebra-fundamental';
  static const String equationsModuleId = 'equacoes-inequacoes';
  static const String functionsModuleId = 'funcoes';
  static const String limitsModuleId = 'limites';
  static const String continuityModuleId = 'continuidade';
  static const String derivativesModuleId = 'derivadas';

  static const int _finalTestQuestionCount = 10;
  static const Duration _localSessionDuration = Duration(minutes: 30);

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
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startEquationsFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: equationsModuleId,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startFunctionsFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: functionsModuleId,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startLimitsFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: limitsModuleId,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startContinuityFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: continuityModuleId,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> startDerivativesFinalTest({
    Iterable<String> practiceQuestionIds = const <String>[],
  }) {
    return _startFinalTest(
      moduleId: derivativesModuleId,
      practiceQuestionIds: practiceQuestionIds,
    );
  }

  Future<TrustedFinalTestSession> _startFinalTest({
    required String moduleId,
    required Iterable<String> practiceQuestionIds,
  }) async {
    try {
      return await _startRemoteFinalTest(moduleId);
    } on FirebaseFunctionsException catch (error) {
      if (!shouldUseLocalFinalTestFallback(error.code)) {
        rethrow;
      }

      debugPrint(
        'FinalTestService: remote final test unavailable '
        '(${error.code}); using controlled local fallback for $moduleId.',
      );

      return _startLocalFinalTest(
        moduleId: moduleId,
        practiceQuestionIds: practiceQuestionIds,
      );
    }
  }

  Future<TrustedFinalTestSession> _startRemoteFinalTest(String moduleId) async {
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
  }

  TrustedFinalTestSession _startLocalFinalTest({
    required String moduleId,
    required Iterable<String> practiceQuestionIds,
  }) {
    final exercises = _exerciseBankForModule(moduleId);

    final selected = FinalTestSessionBuilder.build(
      lessonId: moduleId,
      exercises: exercises,
      practiceQuestionIds: practiceQuestionIds,
      questionCount: _finalTestQuestionCount,
    );

    if (selected.length != _finalTestQuestionCount) {
      throw StateError(
        'Local final test for $moduleId requires '
        '$_finalTestQuestionCount questions, but only ${selected.length} '
        'were available.',
      );
    }

    final now = DateTime.now();
    final expiresAt = now.add(_localSessionDuration);
    final sessionId =
        'local:$moduleId:${now.microsecondsSinceEpoch.toString()}';

    _localSessions[sessionId] = _LocalFinalTestSession(
      moduleId: moduleId,
      expiresAt: expiresAt,
      correctOptionByQuestionId: <String, String>{
        for (final exercise in selected)
          exercise.id: exercise.correctOptionId,
      },
    );

    return TrustedFinalTestSession(
      sessionId: sessionId,
      moduleId: moduleId,
      expiresAt: expiresAt,
      questions: selected
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
    final localSession = _localSessions[sessionId];

    if (localSession != null) {
      if (localSession.moduleId != moduleId) {
        throw StateError('Local final-test session does not match the module.');
      }

      return _submitLocalFinalTest(
        sessionId: sessionId,
        session: localSession,
        answers: answers,
      );
    }

    return _submitRemoteFinalTest(
      sessionId: sessionId,
      answers: answers,
    );
  }

  Future<TrustedFinalTestSubmission> _submitRemoteFinalTest({
    required String sessionId,
    required List<TrustedFinalTestAnswer> answers,
  }) async {
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
    required String sessionId,
    required _LocalFinalTestSession session,
    required List<TrustedFinalTestAnswer> answers,
  }) async {
    if (DateTime.now().isAfter(session.expiresAt)) {
      _localSessions.remove(sessionId);
      throw StateError('Local final-test session expired.');
    }

    final uniqueQuestionIds = answers.map((answer) => answer.questionId).toSet();

    if (answers.length != _finalTestQuestionCount ||
        uniqueQuestionIds.length != _finalTestQuestionCount ||
        !session.correctOptionByQuestionId.keys.toSet().containsAll(
          uniqueQuestionIds,
        )) {
      throw const FormatException('Invalid local final-test answers.');
    }

    final correctAnswers = countCorrectLocalFinalTestAnswers(
      correctOptionByQuestionId: session.correctOptionByQuestionId,
      answers: answers,
    );
    final accuracy = correctAnswers / _finalTestQuestionCount;
    final approved =
        accuracy >= ModuleMasteryPolicy.minimumFinalTestAccuracy;

    await ModuleMasteryTracker.recordFinalTestResult(
      moduleId: session.moduleId,
      correctAnswers: correctAnswers,
      totalQuestions: _finalTestQuestionCount,
    );

    _localSessions.remove(sessionId);

    final reward = _rewardForModule(session.moduleId);

    return TrustedFinalTestSubmission(
      totalQuestions: _finalTestQuestionCount,
      correctAnswers: correctAnswers,
      accuracy: accuracy,
      approved: approved,
      awardedXp: approved ? reward.$1 : 0,
      awardedGold: approved ? reward.$2 : 0,
      rewardAlreadyAppliedByBackend: false,
    );
  }

  List<ExerciseData> _exerciseBankForModule(String moduleId) {
    return switch (moduleId) {
      algebraModuleId => mockExercises,
      equationsModuleId => mockEquationsExercises,
      functionsModuleId => mockFunctionsExercises,
      limitsModuleId => mockLimitsExercises,
      continuityModuleId => mockContinuityExercises,
      derivativesModuleId => mockDerivativesExercises,
      _ => throw ArgumentError.value(moduleId, 'moduleId', 'Unknown module.'),
    };
  }

  (int, int) _rewardForModule(String moduleId) {
    return switch (moduleId) {
      algebraModuleId => (60, 25),
      equationsModuleId => (70, 30),
      functionsModuleId => (80, 35),
      limitsModuleId => (90, 40),
      continuityModuleId => (100, 45),
      derivativesModuleId => (110, 50),
      _ => (0, 0),
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
