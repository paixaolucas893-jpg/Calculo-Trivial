import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/data/algebra_course_data.dart';
import 'package:calcquest/shared/data/continuity_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data.dart';
import 'package:calcquest/shared/data/derivatives_course_data_en.dart';
import 'package:calcquest/shared/data/equations_course_data.dart';
import 'package:calcquest/shared/data/limits_course_data.dart';
import 'package:calcquest/shared/data/localized_algebra_course_content.dart';
import 'package:calcquest/shared/data/localized_continuity_course_data.dart';
import 'package:calcquest/shared/data/localized_equations_course_data.dart';
import 'package:calcquest/shared/data/localized_limits_course_data.dart';
import 'package:calcquest/shared/data/precalculus_equations_supplement_data.dart';
import 'package:calcquest/shared/data/precalculus_foundations_course_data.dart';
import 'package:calcquest/shared/data/precalculus_functions_course_data.dart';
import 'package:calcquest/shared/domain/course_lesson_data.dart';

void main() {
  test('todas as aulas mantêm ao menos quatro exemplos resolvidos em PT e EN', () {
    final catalogs = <({String name, List<CourseLessonData> lessons})>[
      (
        name: 'Fundamentos PT',
        lessons: precalculusFoundationsCourseLessons,
      ),
      (
        name: 'Fundamentos EN',
        lessons: localizedPrecalculusFoundationsCourseLessons(
          const Locale('en'),
        ),
      ),
      (
        name: 'Álgebra PT',
        lessons: algebraCourseLessons,
      ),
      (
        name: 'Álgebra EN',
        lessons: localizedAlgebraCourseLessons(const Locale('en')),
      ),
      (
        name: 'Equações PT',
        lessons: equationsCourseLessons,
      ),
      (
        name: 'Equações EN',
        lessons: localizedEquationsCourseLessons(const Locale('en')),
      ),
      (
        name: 'Equações suplemento PT',
        lessons: precalculusEquationsSupplementLessons,
      ),
      (
        name: 'Equações suplemento EN',
        lessons: localizedPrecalculusEquationsSupplementLessons(
          const Locale('en'),
        ),
      ),
      (
        name: 'Funções PT',
        lessons: precalculusFunctionsCourseLessons,
      ),
      (
        name: 'Funções EN',
        lessons: localizedPrecalculusFunctionsCourseLessons(
          const Locale('en'),
        ),
      ),
      (
        name: 'Limites PT',
        lessons: limitsCourseLessons,
      ),
      (
        name: 'Limites EN',
        lessons: localizedLimitsCourseLessons(const Locale('en')),
      ),
      (
        name: 'Continuidade PT',
        lessons: continuityCourseLessons,
      ),
      (
        name: 'Continuidade EN',
        lessons: englishContinuityCourseLessons,
      ),
      (
        name: 'Derivadas PT',
        lessons: derivativesCourseLessons,
      ),
      (
        name: 'Derivadas EN',
        lessons: derivativesCourseLessonsEn,
      ),
    ];

    for (final catalog in catalogs) {
      for (final lesson in catalog.lessons) {
        final workedExamples = lesson.sections
            .expand((section) => section.blocks)
            .whereType<WorkedExampleBlockData>()
            .length;

        expect(
          workedExamples,
          greaterThanOrEqualTo(4),
          reason:
              '${catalog.name} • ${lesson.id} precisa manter ao menos quatro exemplos resolvidos.',
        );
      }
    }
  });
}
