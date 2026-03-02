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
    // Implement read more functionality
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Read Full Article tapped!')));
  }

  void _onBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    // Implement bookmark functionality
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 380 / 450,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.articleCardBG.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image + Category Badge
            Stack(
              children: [
                Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(height: 200, color: const Color(0xFF1A3A4A)),
                ),
                Positioned(
                  top: 12,
                  left: 12,
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

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date & Read Time
                  Text(
                    widget.date,
                    style: AppStyles.styleMedium14(
                      context,
                    ).copyWith(color: Color(0xFF64748B)),
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
                    ).copyWith(color: Color(0xFF64748B)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 16),

                  // Read Full Paper + Bookmark
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
                          child: isBookmarked
                              ? Icon(
                                  Icons.bookmark_add_rounded,
                                  color: AppColors.primaryColor,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.bookmark_add_outlined,
                                  color: Color(0xFF999999),
                                  size: 20,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
