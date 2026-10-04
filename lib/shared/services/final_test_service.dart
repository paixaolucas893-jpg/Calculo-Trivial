import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

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

  const TrustedFinalTestSubmission({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.accuracy,
    required this.approved,
    required this.awardedXp,
    required this.awardedGold,
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

class FinalTestService {
  static const String algebraModuleId = 'algebra-fundamental';
  static const String equationsModuleId = 'equacoes-inequacoes';
  static const String functionsModuleId = 'funcoes';
  static const String limitsModuleId = 'limites';
  static const String continuityModuleId = 'continuidade';
  static const String derivativesModuleId = 'derivadas';

  final FirebaseFunctions _functions;

  FinalTestService({FirebaseFunctions? functions})
    : _functions =
          functions ?? FirebaseFunctions.instanceFor(region: 'us-central1');

  Future<TrustedFinalTestSession> startAlgebraFinalTest() async {
    final callable = _functions.httpsCallable(
      'startFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(const <String, dynamic>{
      'moduleId': algebraModuleId,
    });

    return TrustedFinalTestSession.fromMap(
      _stringMap(result.data, 'Invalid startFinalTest response.'),
    );
  }

  Future<TrustedFinalTestSession> startEquationsFinalTest() async {
    final callable = _functions.httpsCallable(
      'startFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(const <String, dynamic>{
      'moduleId': equationsModuleId,
    });

    return TrustedFinalTestSession.fromMap(
      _stringMap(result.data, 'Invalid startFinalTest response.'),
    );
  }

  Future<TrustedFinalTestSession> startFunctionsFinalTest() async {
    final callable = _functions.httpsCallable(
      'startFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(const <String, dynamic>{
      'moduleId': functionsModuleId,
    });

    return TrustedFinalTestSession.fromMap(
      _stringMap(result.data, 'Invalid startFinalTest response.'),
    );
  }

  Future<TrustedFinalTestSession> startLimitsFinalTest() async {
    final callable = _functions.httpsCallable(
      'startFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(const <String, dynamic>{
      'moduleId': limitsModuleId,
    });

    return TrustedFinalTestSession.fromMap(
      Map<String, dynamic>.from(result.data as Map),
    );
  }

  Future<TrustedFinalTestSession> startContinuityFinalTest() async {
    final callable = _functions.httpsCallable(
      'startFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(const <String, dynamic>{
      'moduleId': continuityModuleId,
    });

    return TrustedFinalTestSession.fromMap(
      _stringMap(result.data, 'Invalid startFinalTest response.'),
    );
  }
  Future<TrustedFinalTestSession> startDerivativesFinalTest() async {
    final callable = _functions.httpsCallable(
      'startFinalTest',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
    );

    final result = await callable.call<dynamic>(const <String, dynamic>{
      'moduleId': derivativesModuleId,
    });

    return TrustedFinalTestSession.fromMap(
      _stringMap(result.data, 'Invalid startFinalTest response.'),
    );
  }

  Future<TrustedFinalTestSubmission> submitAlgebraFinalTest({
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

  Future<TrustedFinalTestSubmission> submitEquationsFinalTest({
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

  Future<TrustedFinalTestSubmission> submitFunctionsFinalTest({
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

  Future<TrustedFinalTestSubmission> submitLimitsFinalTest({
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
  Future<TrustedFinalTestSubmission> submitContinuityFinalTest({
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

  Future<TrustedFinalTestSubmission> submitDerivativesFinalTest({
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
