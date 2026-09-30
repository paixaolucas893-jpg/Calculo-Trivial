import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

/// Renders lesson prose while upgrading mathematical notation to proper
/// typesetting. Legacy rational exponents such as 16^(3/2) are converted
/// automatically, while explicit TeX can be embedded with [[math:...]].
///
/// This keeps lesson data readable and gives every course a single,
/// consistent mathematical typography layer.
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

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;
    final normalized = _upgradeLegacyNotation(text);
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

  String _upgradeLegacyNotation(String value) {
    return value.replaceAllMapped(_legacyRationalExponent, (match) {
      final base = _toTex(match.group(1)!);
      final numerator = _toTex(match.group(2)!);
      final denominator = _toTex(match.group(3)!);
      return '[[math:${base}^{\\frac{${numerator}}{${denominator}}}]]';
    });
  }

  String _toTex(String value) {
    return value
        .replaceAll('−', '-')
        .replaceAll('·', r'\cdot ')
        .replaceAll('∞', r'\infty ');
  }
}
