import 'package:shared_preferences/shared_preferences.dart';

class PlayStoreFeedbackService {
  static const String _neverAskAgainKey =
      'play_store_feedback_never_ask_again';

  static const String _lastPromptAtKey =
      'play_store_feedback_last_prompt_at';

  static const Duration _snoozeDuration = Duration(days: 3);

  static String _scopedKey(String baseKey, String? userId) {
    final scope = userId?.trim();

    if (scope == null || scope.isEmpty) {
      return 'guest_$baseKey';
    }

    return '${scope}_$baseKey';
  }

  static Future<bool> shouldPrompt({
    required String? userId,
    required bool isFirstAccess,
    required int totalAnswerAttempts,
    required int completedContentLessons,
  }) async {
    if (isFirstAccess) {
      return false;
    }

    final hasEnoughUsage =
        totalAnswerAttempts >= 5 ||
        completedContentLessons >= 1;

    if (!hasEnoughUsage) {
      return false;
    }

    final preferences =
        await SharedPreferences.getInstance();

    final neverAskAgain = preferences.getBool(
          _scopedKey(_neverAskAgainKey, userId),
        ) ??
        false;

    if (neverAskAgain) {
      return false;
    }

    final lastPromptValue = preferences.getString(
      _scopedKey(_lastPromptAtKey, userId),
    );

    if (lastPromptValue == null) {
      return true;
    }

    final lastPromptAt =
        DateTime.tryParse(lastPromptValue);

    if (lastPromptAt == null) {
      return true;
    }

    return DateTime.now().difference(lastPromptAt) >=
        _snoozeDuration;
  }

  static Future<void> postpone(String? userId) async {
    final preferences =
        await SharedPreferences.getInstance();

    await preferences.setString(
      _scopedKey(_lastPromptAtKey, userId),
      DateTime.now().toIso8601String(),
    );
  }

  static Future<void> neverAskAgain(String? userId) async {
    final preferences =
        await SharedPreferences.getInstance();

    await preferences.setBool(
      _scopedKey(_neverAskAgainKey, userId),
      true,
    );
  }

  static Future<void> markFeedbackOpened(
    String? userId,
  ) async {
    await neverAskAgain(userId);
  }

  static Future<void> clearForUser(String? userId) async {
    final preferences =
        await SharedPreferences.getInstance();

    await preferences.remove(
      _scopedKey(_neverAskAgainKey, userId),
    );

    await preferences.remove(
      _scopedKey(_lastPromptAtKey, userId),
    );
  }
}