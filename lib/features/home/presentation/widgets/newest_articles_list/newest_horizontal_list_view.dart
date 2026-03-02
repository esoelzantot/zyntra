import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/core/widgets/article_card/article_card.dart';
import 'package:zyntra/core/widgets/buttons/custom_outlined_button.dart';

// ─── Newest Articles Section ─────────────────────────────────────────────────

class NewestArticles extends StatefulWidget {
  final VoidCallback? onSeeAll;
  const NewestArticles({super.key, this.onSeeAll});

  @override
  State<NewestArticles> createState() => _NewestArticlesState();
}

class _NewestArticlesState extends State<NewestArticles> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  bool _isHovered = false;

  static const double _cardSpacing = 16;
  static const Duration _scrollInterval = Duration(milliseconds: 30);
  static const double _scrollStep = 1.2;

  static final List<Map<String, String>> _articles = [
    {
      'category': 'BIOLOGY',
      'date': 'JAN 12, 2024',
      'readTime': '8 MIN READ',
      'title': 'The Impact of Microgravity on DNA',
      'description':
          'Recent studies aboard the ISS reveal unexpected structural variations in human telomeres when exposed to prolonged zero-G environments.',
      'image': 'https://picsum.photos/400/220?random=1',
    },
    {
      'category': 'MICROBIOLOGY',
      'date': 'FEB 3, 2024',
      'readTime': '5 MIN READ',
      'title': 'Microbial Behavior in Deep Space',
      'description':
          'Analyzing microbial adaptation patterns in extreme cosmic environments aboard long-duration space missions.',
      'image': 'https://picsum.photos/400/220?random=2',
    },
    {
      'category': 'GENETICS',
      'date': 'FEB 18, 2024',
      'readTime': '10 MIN READ',
      'title': 'Engineering DNA Resilience',
      'description':
          'New techniques for enhancing DNA stability against high radiation and cosmic ray exposure.',
      'image': 'https://picsum.photos/400/220?random=3',
    },
    {
      'category': 'ASTROBOTANY',
      'date': 'MAR 1, 2024',
      'readTime': '6 MIN READ',
      'title': 'Hyper-Efficient Food Production',
      'description':
          'Development of compact plant systems designed for long-haul interstellar missions and colony sustenance.',
      'image': 'https://picsum.photos/400/220?random=4',
    },
    {
      'category': 'PLANT BIOLOGY',
      'date': 'MAR 9, 2024',
      'readTime': '7 MIN READ',
      'title': 'Extraterrestrial Flora Growth',
      'description':
          'Studying genetic mutations in plant species cultivated under varied gravitational conditions.',
      'image': 'https://picsum.photos/400/220?random=5',
    },
    {
      'category': 'BIOLOGY',
      'date': 'MAR 15, 2024',
      'readTime': '9 MIN READ',
      'title': 'Telomere Degradation in Zero-G',
      'description':
          'Long-term exposure to microgravity accelerates telomere shortening, raising concerns for crew longevity.',
      'image': 'https://picsum.photos/400/220?random=6',
    },
    {
      'category': 'GENETICS',
      'date': 'APR 2, 2024',
      'readTime': '4 MIN READ',
      'title': 'Synthetic Biology Frontiers',
      'description':
          'Engineering synthetic organisms capable of surviving and thriving in Martian soil conditions.',
      'image': 'https://picsum.photos/400/220?random=7',
    },
    {
      'category': 'MICROBIOLOGY',
      'date': 'APR 11, 2024',
      'readTime': '6 MIN READ',
      'title': 'Extremophiles and Space Travel',
      'description':
          'How Earth extremophiles inform the design of biological systems for planetary colonization.',
      'image': 'https://picsum.photos/400/220?random=8',
    },
    {
      'category': 'ASTROBOTANY',
      'date': 'APR 22, 2024',
      'readTime': '5 MIN READ',
      'title': 'Closed-Loop Ecosystems',
      'description':
          'Building fully self-sustaining biological ecosystems for multi-generational interstellar vessels.',
      'image': 'https://picsum.photos/400/220?random=9',
    },
    {
      'category': 'PLANT BIOLOGY',
      'date': 'MAY 5, 2024',
      'readTime': '8 MIN READ',
      'title': 'Photosynthesis Beyond Earth',
      'description':
          'Adapting photosynthetic pathways to function under low-light and high-radiation exoplanetary conditions.',
      'image': 'https://picsum.photos/400/220?random=10',
    },
  ];

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
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEWEST ARTICLES',
                      style: AppStyles.styleMedium18(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Research Repository',
                      style: AppStyles.styleBold36(context),
                    ),
                  ],
                ),
                CustomOutlinedButton(
                  onPress: widget.onSeeAll,
                  title: 'See All',
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // ── Slider ──────────────────────────────────────────────────
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: SizedBox(
              height: 380,
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
                  itemCount: _articles.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: _cardSpacing),
                  itemBuilder: (context, index) {
                    final a = _articles[index];
                    return ArticleCard(
                      category: a['category']!,
                      date: a['date']!,
                      readTime: a['readTime']!,
                      title: a['title']!,
                      description: a['description']!,
                      imageUrl: a['image']!,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
