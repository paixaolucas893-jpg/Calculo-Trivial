import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

/// Renders lesson prose with academic mathematical typography.
///
/// Explicit TeX can be embedded with markers such as:
///   [[math:\\frac{3}{4}]]
///
/// Legacy lesson notation is also upgraded automatically, including
/// rational exponents, radicals, ordinary fractions, and Unicode powers.
class AcademicMathText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AcademicMathText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  static final RegExp _explicitMath = RegExp(r'\[\[math:(.+?)\]\]');
  static final RegExp _legacyRationalExponent = RegExp(
    r'(\([^\n()]+\)|[A-Za-z0-9]+)\^\(([+\-−]?[A-Za-z0-9]+)\/([+\-−]?[A-Za-z0-9]+)\)',
  );
  static final RegExp _indexedRoot = RegExp(
    r'√\[([^\]]+)\]\{([^{}]+)\}',
  );
  static final RegExp _parenthesizedRoot = RegExp(
    r'√\(([^()]+)\)',
  );
  static final RegExp _simpleRoot = RegExp(
    r'√([+\-−]?[A-Za-z0-9]+)',
  );
  static final RegExp _simpleFraction = RegExp(
    r'(^|[\s(=,:;])([+\-−]?[A-Za-z0-9]+)\/([A-Za-z0-9]+)(?=$|[\s),.;:<>])',
  );
  static final RegExp _unicodePower = RegExp(
    r'(\([^\n()]+\)|[A-Za-z0-9]+)([⁰¹²³⁴⁵⁶⁷⁸⁹⁻]+)',
  );

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;
    final normalized = normalizeLegacyNotation(text);
    final spans = <InlineSpan>[];
    var cursor = 0;

    for (final match in _explicitMath.allMatches(normalized)) {
      if (match.start > cursor) {
        spans.add(TextSpan(text: normalized.substring(cursor, match.start)));
      }

      final tex = match.group(1)!;
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Math.tex(
            tex,
            mathStyle: MathStyle.text,
            textStyle: TextStyle(
              fontSize: effectiveStyle.fontSize,
              color: effectiveStyle.color,
              fontWeight: effectiveStyle.fontWeight,
            ),
            onErrorFallback: (_) => Text(tex, style: effectiveStyle),
          ),
        ),
      );
      cursor = match.end;
    }

    if (cursor < normalized.length) {
      spans.add(TextSpan(text: normalized.substring(cursor)));
    }

    return Text.rich(
      TextSpan(style: effectiveStyle, children: spans),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
    );
  }

  @visibleForTesting
  static String normalizeLegacyNotation(String value) {
    var normalized = value;

    normalized = normalized.replaceAllMapped(_legacyRationalExponent, (match) {
      final base = _toTex(match.group(1)!);
      final numerator = _toTex(match.group(2)!);
      final denominator = _toTex(match.group(3)!);
      return '[[math:$base^{\\frac{$numerator}{$denominator}}]]';
    });

    normalized = normalized.replaceAllMapped(_indexedRoot, (match) {
      final index = _toTex(match.group(1)!);
      final radicand = _toTex(match.group(2)!);
      return '[[math:\\sqrt[$index]{$radicand}]]';
    });

    normalized = normalized.replaceAllMapped(_parenthesizedRoot, (match) {
      final radicand = _toTex(match.group(1)!);
      return '[[math:\\sqrt{$radicand}]]';
    });

    normalized = normalized.replaceAllMapped(_simpleRoot, (match) {
      final radicand = _toTex(match.group(1)!);
      return '[[math:\\sqrt{$radicand}]]';
    });

    normalized = normalized.replaceAllMapped(_unicodePower, (match) {
      final base = _toTex(match.group(1)!);
      final exponent = _superscriptToTex(match.group(2)!);
      return '[[math:$base^{$exponent}]]';
    });

    normalized = normalized.replaceAllMapped(_simpleFraction, (match) {
      final prefix = match.group(1)!;
      final numerator = _toTex(match.group(2)!);
      final denominator = _toTex(match.group(3)!);
      return '$prefix[[math:\\frac{$numerator}{$denominator}]]';
    });

    return normalized;
  }

  static String _superscriptToTex(String value) {
    const map = <String, String>{
      '⁰': '0',
      '¹': '1',
      '²': '2',
      '³': '3',
      '⁴': '4',
      '⁵': '5',
      '⁶': '6',
      '⁷': '7',
      '⁸': '8',
      '⁹': '9',
      '⁻': '-',
    };

    return value.split('').map((char) => map[char] ?? char).join();
  }

  static String _toTex(String value) {
    return value
        .replaceAll('−', '-')
        .replaceAll('·', r'\cdot ')
        .replaceAll('∞', r'\infty ')
        .replaceAll('≤', r'\le ')
        .replaceAll('≥', r'\ge ')
        .replaceAll('≠', r'\ne ')
        .replaceAll('≈', r'\approx ')
        .replaceAll('∈', r'\in ')
        .replaceAll('ℕ', r'\mathbb{N}')
        .replaceAll('ℤ', r'\mathbb{Z}')
        .replaceAll('ℚ', r'\mathbb{Q}')
        .replaceAll('ℝ', r'\mathbb{R}');
  }
}
