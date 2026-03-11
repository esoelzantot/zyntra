import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/helpers/custom_fading_widget.dart';
import 'package:zyntra/core/routing/end_points.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/article_card/article_card_copy.dart';
import 'package:zyntra/core/widgets/buttons/custom_outlined_button.dart';

// ─── Newest Articles Section ─────────────────────────────────────────────────

class NewestArticlesLoadingListView extends StatefulWidget {
  const NewestArticlesLoadingListView({super.key});

  @override
  State<NewestArticlesLoadingListView> createState() =>
      _NewestArticlesLoadingListViewState();
}

class _NewestArticlesLoadingListViewState
    extends State<NewestArticlesLoadingListView> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  bool _isHovered = false;

  static const double _cardSpacing = 16;
  static const Duration _scrollInterval = Duration(milliseconds: 30);
  static const double _scrollStep = 1.2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(_scrollInterval, (_) {
      if (_isHovered || !_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final current = _scrollController.offset;

      if (current >= maxScroll) {
        // Jump back to start smoothly
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(current + _scrollStep);
      }
    });
  }

  void _stopAutoScroll() => _autoScrollTimer?.cancel();

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section Header ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEWEST ARTICLES',
                      style: AppStyles.styleMedium18(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CustomOutlinedButton(
                        onPress: () => _handleSeeAll(),
                        title: 'See All',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  'Research Repository',
                  style: AppStyles.styleBold36(context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // ── Slider ──────────────────────────────────────────────────
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: CustomFadingWidget(
              child: SizedBox(
                height: 400,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.separated(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    itemCount: 10,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: _cardSpacing),
                    itemBuilder: (context, index) {
                      return ArticleCardCopy();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSeeAll() {
    // Implement navigation to the full articles list page
    GoRouter.of(context).push(EndPoints.articlesView);
  }
}
