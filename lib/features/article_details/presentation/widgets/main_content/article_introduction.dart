import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ArticleIntroduction extends StatelessWidget {
  final String title;
  final String body;

  const ArticleIntroduction({
    super.key,
    required this.title,
    required this.body,
  });

  /// Parses [text] and returns a list of [TextSpan]s.
  /// Content inside () or [] is rendered orange + bold.
  List<TextSpan> _buildSpans(BuildContext context, String text) {
    final List<TextSpan> spans = [];

    // Matches either (...) or [...] including the brackets themselves
    final RegExp pattern = RegExp(r'(\([^)]*\)|\[[^\]]*\])');

    int lastEnd = 0;

    for (final match in pattern.allMatches(text)) {
      // Normal text before the match
      if (match.start > lastEnd) {
        spans.add(
          TextSpan(
            text: text.substring(lastEnd, match.start),
            style: AppStyles.styleRegular20(
              context,
            ).copyWith(color: const Color(0xFF94A3B8)),
          ),
        );
      }

      // Highlighted text inside brackets
      spans.add(
        TextSpan(
          text: match.group(0),
          style: AppStyles.styleMedium20(context).copyWith(color: Colors.white),
        ),
      );

      lastEnd = match.end;
    }

    // Remaining normal text after the last match
    if (lastEnd < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastEnd),
          style: AppStyles.styleRegular20(
            context,
          ).copyWith(color: const Color(0xFF94A3B8)),
        ),
      );
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Title ──────────────────────────────────────────────
        Row(
          children: [
            Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              title,
              style: AppStyles.styleBold30(
                context,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // ── Body with highlighted brackets ─────────────────────
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(children: _buildSpans(context, body)),
        ),
      ],
    );
  }
}
