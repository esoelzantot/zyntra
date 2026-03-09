import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/article_details/presentation/widgets/summary_conclusion/article_conclusion.dart';
import 'package:zyntra/features/article_details/presentation/widgets/summary_conclusion/article_summary.dart';

// ─────────────────────────────────────────────────────────────
// Parser — extracts bullet points from the summary string
// ─────────────────────────────────────────────────────────────
class SummaryParser {
  static List<String> parseBullets(String raw) {
    // Try markdown bullets first (* or -)
    final bulletLines = raw
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.startsWith('*') || l.startsWith('-'))
        .map((l) => l.replaceFirst(RegExp(r'^[*-]\s*'), '').trim())
        .where((l) => l.isNotEmpty)
        .toList();

    if (bulletLines.isNotEmpty) return bulletLines;

    // Fallback: split on ". " and return sentences
    return raw
        .split(RegExp(r'\.\s+'))
        .map((s) => s.trim())
        .where((s) => s.length > 20)
        .take(5)
        .map((s) => s.endsWith('.') ? s : '$s.')
        .toList();
  }

  /// Extract only the concise summary paragraph (before "### 2.")
  static String parseParagraph(String raw) {
    // Take everything after "### 1. Concise Summary" (or similar)
    final parts = raw.split(RegExp(r'###\s*\d+\.'));
    if (parts.length > 1) return parts[1].trim().split('\n\n').first.trim();
    // Fallback: first non-empty paragraph
    return raw
        .split('\n\n')
        .firstWhere((p) => p.trim().length > 30, orElse: () => raw.trim());
  }
}

// ─────────────────────────────────────────────────────────────
// ArticleSummaryAndConclusion
// ─────────────────────────────────────────────────────────────
class ArticleSummaryAndConclusion extends StatefulWidget {
  final String summaryRaw;
  final String conclusionRaw;

  const ArticleSummaryAndConclusion({
    super.key,
    required this.summaryRaw,
    required this.conclusionRaw,
  });

  @override
  State<ArticleSummaryAndConclusion> createState() =>
      _ArticleSummaryAndConclusionState();
}

class _ArticleSummaryAndConclusionState
    extends State<ArticleSummaryAndConclusion> {
  late double width;
  late bool isMobile;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      width = MediaQuery.sizeOf(context).width;
      isMobile = (width <= SizeConfig.tablet) ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bullets = SummaryParser.parseBullets(widget.summaryRaw);

    // If no bullets found, fall back to paragraph mode
    final hasBullets = bullets.isNotEmpty;
    final paragraph = hasBullets
        ? null
        : SummaryParser.parseParagraph(widget.summaryRaw);

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Left: Summary ────────────────────────────────────────
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Summary', style: AppStyles.styleBold24(context)),
                  const SizedBox(height: 16),
                  if (hasBullets)
                    ...bullets.map((b) => ArticleSummary(text: b))
                  else
                    Text(
                      paragraph ?? '',
                      style: AppStyles.styleRegular18(
                        context,
                      ).copyWith(color: Color(0xFFB0BEC5)),
                    ),
                ],
              ),

              const SizedBox(height: 24),

              // ── Right: Conclusion card ────────────────────────────────
              ArticleConclusion(text: widget.conclusionRaw),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Left: Summary ────────────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Summary', style: AppStyles.styleBold24(context)),
                    const SizedBox(height: 16),
                    if (hasBullets)
                      ...bullets.map((b) => ArticleSummary(text: b))
                    else
                      Text(
                        paragraph ?? '',
                        style: AppStyles.styleRegular18(
                          context,
                        ).copyWith(color: Color(0xFFB0BEC5)),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 32),

              // ── Right: Conclusion card ────────────────────────────────
              Expanded(child: ArticleConclusion(text: widget.conclusionRaw)),
            ],
          );
  }
}
