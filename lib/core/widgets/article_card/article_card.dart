import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/buttons/custom_animated_button.dart';

class ArticleCard extends StatefulWidget {
  final String category;
  final String date;
  final String readTime;
  final String title;
  final String description;
  final String imageUrl;

  const ArticleCard({
    super.key,
    this.category = 'BIOLOGY',
    this.date = 'JAN 12, 2024',
    this.readTime = '8 MIN READ',
    this.title = 'The Impact of Microgravity on DNA',
    this.description =
        'Recent studies aboard the ISS reveal unexpected structural variations in human telomeres when exposed to prolonged zero-G environments.',
    this.imageUrl = 'https://picsum.photos/400/220?random=1',
  });

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isBookmarked = false;

  void _onReadMore() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Read Full Article tapped!')));
  }

  void _onBookmark() {
    setState(() => isBookmarked = !isBookmarked);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 370 / 450,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.articleCardBG.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image Section ──────────────────────────────────────────
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const ColoredBox(color: Color(0xFF1A3A4A)),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B00),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        widget.category,
                        style: AppStyles.styleBold12(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Content Section ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Date
                  Text(
                    widget.date,
                    style: AppStyles.styleMedium14(
                      context,
                    ).copyWith(color: const Color(0xFF64748B)),
                  ),

                  const SizedBox(height: 8),

                  // Title
                  Text(
                    widget.title,
                    style: AppStyles.styleBold20(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    widget.description,
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: const Color(0xFF64748B)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 16),

                  // Read Full Article + Bookmark
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAnimatedButton(
                        onTap: _onReadMore,
                        title: 'Read Full Article',
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: _onBookmark,
                          child: Icon(
                            isBookmarked
                                ? Icons.bookmark_add_rounded
                                : Icons.bookmark_add_outlined,
                            color: isBookmarked
                                ? AppColors.primaryColor
                                : const Color(0xFF999999),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
