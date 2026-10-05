import 'dart:math';

class PracticeQuestionRotationSelector {
  const PracticeQuestionRotationSelector._();

  static List<String> select({
    required Iterable<String> availableQuestionIds,
    Iterable<String> previousSessionIds = const <String>[],
    Iterable<String> recentHistoryIds = const <String>[],
    int questionCount = 10,
    Random? random,
  }) {
    if (questionCount <= 0) {
      return const <String>[];
    }

    final uniqueAvailable = <String>[];
    final seenAvailable = <String>{};

    for (final id in availableQuestionIds) {
      if (seenAvailable.add(id)) {
        uniqueAvailable.add(id);
      }
    }

    if (uniqueAvailable.isEmpty) {
      return const <String>[];
    }

    final previous = previousSessionIds.toSet();
    final history = recentHistoryIds.toList(growable: false);
    final historyIndex = <String, int>{};

    for (var index = 0; index < history.length; index++) {
      historyIndex[history[index]] = index;
    }

    final randomGenerator = random ?? Random();

    final unseen = uniqueAvailable
        .where(
          (id) => !previous.contains(id) && !historyIndex.containsKey(id),
        )
        .toList()
      ..shuffle(randomGenerator);

    final olderSeen = uniqueAvailable
        .where(
          (id) => !previous.contains(id) && historyIndex.containsKey(id),
        )
        .toList()
      ..sort(
        (a, b) => historyIndex[a]!.compareTo(historyIndex[b]!),
      );

    final previousSession = uniqueAvailable
        .where(previous.contains)
        .toList()
      ..sort(
        (a, b) => (historyIndex[a] ?? -1).compareTo(
          historyIndex[b] ?? -1,
        ),
      );

    final target = min(questionCount, uniqueAvailable.length);

    return <String>[
      ...unseen,
      ...olderSeen,
      ...previousSession,
    ].take(target).toList(growable: false);
  }

  static List<String> appendToRecentHistory({
    required Iterable<String> currentHistoryIds,
    required Iterable<String> selectedQuestionIds,
    int maxHistorySize = 40,
  }) {
    if (maxHistorySize <= 0) {
      return const <String>[];
    }

    final updated = currentHistoryIds.toList(growable: true);

    for (final id in selectedQuestionIds) {
      updated.remove(id);
      updated.add(id);
    }

    if (updated.length <= maxHistorySize) {
      return List<String>.unmodifiable(updated);
    }

    return List<String>.unmodifiable(
      updated.sublist(updated.length - maxHistorySize),
    );
  }
}
