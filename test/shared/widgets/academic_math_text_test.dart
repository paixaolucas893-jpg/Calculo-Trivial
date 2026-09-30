import 'package:flutter_test/flutter_test.dart';

import 'package:calcquest/shared/widgets/academic_math_text.dart';

void main() {
  group('AcademicMathText.normalizeLegacyNotation', () {
    test('renders rational exponents as TeX fractions', () {
      expect(
        AcademicMathText.normalizeLegacyNotation('16^(3/2)'),
        r'[[math:16^{\frac{3}{2}}]]',
      );

      expect(
        AcademicMathText.normalizeLegacyNotation('(−27)^(1/3)'),
        r'[[math:(-27)^{\frac{1}{3}}]]',
      );
    });

    test('renders radicals with academic notation', () {
      expect(
        AcademicMathText.normalizeLegacyNotation('√[3]{−8}'),
        r'[[math:\sqrt[3]{-8}]]',
      );

      expect(
        AcademicMathText.normalizeLegacyNotation('√(x + 1)'),
        r'[[math:\sqrt{x + 1}]]',
      );

      expect(
        AcademicMathText.normalizeLegacyNotation('√2'),
        r'[[math:\sqrt{2}]]',
      );
    });

    test('renders ordinary fractions conservatively', () {
      expect(
        AcademicMathText.normalizeLegacyNotation('3/8'),
        r'[[math:\frac{3}{8}]]',
      );

      expect(
        AcademicMathText.normalizeLegacyNotation('Use 3/8 como exemplo.'),
        r'Use [[math:\frac{3}{8}]] como exemplo.',
      );
    });

    test('does not corrupt academic course references', () {
      const reference = 'MIT OpenCourseWare 18.01/18.01SC';
      expect(
        AcademicMathText.normalizeLegacyNotation(reference),
        reference,
      );
    });

    test('converts unicode superscripts', () {
      expect(
        AcademicMathText.normalizeLegacyNotation('x²'),
        r'[[math:x^{2}]]',
      );

      expect(
        AcademicMathText.normalizeLegacyNotation('(−2)³'),
        r'[[math:(-2)^{3}]]',
      );
    });
  });
}
