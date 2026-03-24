import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/cubits/book_mark_cubit.dart';
import 'package:zyntra/core/cubits/book_mark_state.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/routing/end_points.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/buttons/custom_animated_button.dart';

class ArticleCard extends StatefulWidget {
  final ArticleEntity article;
  final String imageUrl;

  const ArticleCard({super.key, required this.article, required this.imageUrl});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool isBookmarked = false;

  void _onReadMore() {
    GoRouter.of(context).push(EndPoints.articleDetailsView);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Read Full Article tapped!')));
  }

  void _onBookmark() {
    context.read<BookmarkCubit>().toggleBookmark(article: widget.article);
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
                  Image.asset(
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
                        (widget.article.topics.isEmpty)
                            ? "unknown"
                            : widget.article.topics[0],
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
                    widget.article.date,
                    style: AppStyles.styleMedium14(
                      context,
                    ).copyWith(color: const Color(0xFF64748B)),
                  ),

                  const SizedBox(height: 8),

                  // Title
                  Text(
                    widget.article.title,
                    style: AppStyles.styleBold22(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    widget.article.brief,
                    style: AppStyles.styleMedium16(
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
                      BlocBuilder<BookmarkCubit, BookmarkState>(
                        buildWhen: (prev, curr) =>
                            prev.savedIds.contains(widget.article.id) !=
                            curr.savedIds.contains(widget.article.id),
                        builder: (context, state) {
                          final isBookmarked = state.savedIds.contains(
                            widget.article.id,
                          );
                          return MouseRegion(
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
                          );
                        },
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
