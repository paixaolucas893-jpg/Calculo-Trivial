import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calcquest/shared/state/app_progress.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppProgress privacy cleanup', () {
    test('clearLocalUserData removes user-scoped persisted progress', () async {
      const userId = 'privacy-test-user';

      SharedPreferences.setMockInitialValues(<String, Object>{
        '${userId}_completed_lesson_ids': <String>['funcoes'],
        '${userId}_completed_content_lesson_ids': <String>[
          'funcoes-01-conceito-dominio-imagem',
        ],
        '${userId}_total_answer_attempts': 12,
        '${userId}_correct_answer_attempts': 9,
        '${userId}_study_streak': 4,
        '${userId}_last_study_date': '2026-10-01',
        '${userId}_daily_answered_questions': 3,
        '${userId}_daily_activity_date': '2026-10-01',
        '${userId}_last_question_session_funcoes': <String>['q1', 'q2'],
        '${userId}_last_final_test_session_funcoes': <String>['q3'],
        'functions_completed': true,
        'unrelated_preference': 'keep-me',
      });

      await AppProgress.clearLocalUserData(userId);

      final preferences = await SharedPreferences.getInstance();

      expect(
        preferences.getStringList('${userId}_completed_lesson_ids'),
        isNull,
      );
      expect(
        preferences.getStringList(
          '${userId}_completed_content_lesson_ids',
        ),
        isNull,
      );
      expect(
        preferences.getInt('${userId}_total_answer_attempts'),
        isNull,
      );
      expect(
        preferences.getInt('${userId}_correct_answer_attempts'),
        isNull,
      );
      expect(
        preferences.getInt('${userId}_study_streak'),
        isNull,
      );
      expect(
        preferences.getString('${userId}_last_study_date'),
        isNull,
      );
      expect(
        preferences.getInt('${userId}_daily_answered_questions'),
        isNull,
      );
      expect(
        preferences.getString('${userId}_daily_activity_date'),
        isNull,
      );
      expect(
        preferences.getStringList(
          '${userId}_last_question_session_funcoes',
        ),
        isNull,
      );
      expect(
        preferences.getStringList(
          '${userId}_last_final_test_session_funcoes',
        ),
        isNull,
      );
      expect(
        preferences.getBool('functions_completed'),
        isNull,
      );

      expect(
        preferences.getString('unrelated_preference'),
        'keep-me',
      );
    });

    test('clearLocalUserData rejects an empty user id', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});

      expect(
        () => AppProgress.clearLocalUserData('   '),
        throwsArgumentError,
      );
    });
  });
}
