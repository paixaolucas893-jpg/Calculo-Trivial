class QuestionPerformance {
  final int attempts;
  final int correct;
  final int incorrect;
  final bool? lastAnswerCorrect;

  const QuestionPerformance({
    this.attempts = 0,
    this.correct = 0,
    this.incorrect = 0,
    this.lastAnswerCorrect,
  })  : assert(attempts >= 0),
        assert(correct >= 0),
        assert(incorrect >= 0);

  bool get hasAttempts => attempts > 0;

  bool get needsReview => incorrect > 0;

  double get accuracy {
    if (attempts <= 0) return 0;
    return (correct / attempts).clamp(0.0, 1.0).toDouble();
  }

  double get errorRate {
    if (attempts <= 0) return 0;
    return (incorrect / attempts).clamp(0.0, 1.0).toDouble();
  }

  QuestionPerformance record({required bool isCorrect}) {
    return QuestionPerformance(
      attempts: attempts + 1,
      correct: correct + (isCorrect ? 1 : 0),
      incorrect: incorrect + (isCorrect ? 0 : 1),
      lastAnswerCorrect: isCorrect,
    );
  }

  QuestionPerformance merge(QuestionPerformance other) {
    final thisAttempts = attempts;
    final otherAttempts = other.attempts;

    final mergedLastAnswer = otherAttempts > thisAttempts
        ? other.lastAnswerCorrect
        : thisAttempts > otherAttempts
            ? lastAnswerCorrect
            : (other.lastAnswerCorrect ?? lastAnswerCorrect);

    return QuestionPerformance(
      attempts: attempts > other.attempts ? attempts : other.attempts,
      correct: correct > other.correct ? correct : other.correct,
      incorrect: incorrect > other.incorrect ? incorrect : other.incorrect,
      lastAnswerCorrect: mergedLastAnswer,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'attempts': attempts,
      'correct': correct,
      'incorrect': incorrect,
      'lastAnswerCorrect': lastAnswerCorrect,
    };
  }

  static QuestionPerformance? fromJson(dynamic value) {
    if (value is! Map) return null;

    final attemptsValue = value['attempts'];
    final correctValue = value['correct'];
    final incorrectValue = value['incorrect'];

    if (attemptsValue is! num ||
        correctValue is! num ||
        incorrectValue is! num) {
      return null;
    }

    final attempts = attemptsValue.toInt();
    final correct = correctValue.toInt();
    final incorrect = incorrectValue.toInt();

    if (attempts < 0 || correct < 0 || incorrect < 0) {
      return null;
    }

    final rawLastAnswer = value['lastAnswerCorrect'];

    return QuestionPerformance(
      attempts: attempts,
      correct: correct,
      incorrect: incorrect,
      lastAnswerCorrect: rawLastAnswer is bool ? rawLastAnswer : null,
    );
  }
}
