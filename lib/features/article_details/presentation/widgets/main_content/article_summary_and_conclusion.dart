import 'package:flutter/material.dart';
import 'package:zyntra/core/config/size_config.dart';
import 'package:zyntra/core/functions/summary_parser.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/article_details/presentation/widgets/summary_conclusion/article_conclusion.dart';
import 'package:zyntra/features/article_details/presentation/widgets/summary_conclusion/article_summary.dart';

// ─────────────────────────────────────────────────────────────
// ArticleSummaryAndConclusion
// ─────────────────────────────────────────────────────────────
class ArticleSummaryAndConclusion extends StatefulWidget {
  final List<String> summaryRaw;
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
    final bullets = widget.summaryRaw;

    // If no bullets found, fall back to paragraph mode
    final hasBullets = bullets.isNotEmpty;
    final paragraph = hasBullets
        ? null
        : SummaryParser.parseParagraph(widget.summaryRaw.join());

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
