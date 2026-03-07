import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/article_card/article_card.dart';

// ─── Models ───────────────────────────────────────────────────────────────────

class ResearchCategory {
  final String id;
  final String label;
  const ResearchCategory({required this.id, required this.label});
}

class ArticleModel {
  final String id;
  final String categoryId;
  final String categoryLabel;
  final String date;
  final String readTime;
  final String title;
  final String description;
  final String imageUrl;
  bool isBookmarked;

  ArticleModel({
    required this.id,
    required this.categoryId,
    required this.categoryLabel,
    required this.date,
    required this.readTime,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isBookmarked = false,
  });
}

// ─── Dummy Data ───────────────────────────────────────────────────────────────

final List<ResearchCategory> kCategories = [
  const ResearchCategory(id: 'all', label: 'All Research'),
  const ResearchCategory(id: 'astrobiology', label: 'Astrobiology'),
  const ResearchCategory(
    id: 'genetic_engineering',
    label: 'Genetic Engineering',
  ),
  const ResearchCategory(id: 'microgravity', label: 'Microgravity'),
  const ResearchCategory(id: 'life_support', label: 'Life Support'),
  const ResearchCategory(id: 'bio_informatics', label: 'Bio-Informatics'),
  const ResearchCategory(id: 'biology', label: 'Biology'),
  const ResearchCategory(id: 'botany', label: 'Botany'),
  const ResearchCategory(id: 'engineering', label: 'Engineering'),
  const ResearchCategory(id: 'health', label: 'Health'),
  const ResearchCategory(id: 'genetics', label: 'Genetics'),
];

final List<ArticleModel> kArticles = [
  ArticleModel(
    id: '1',
    categoryId: 'biology',
    categoryLabel: 'BIOLOGY',
    date: 'JAN 12, 2024',
    readTime: '8 MIN READ',
    title: 'The Impact of Microgravity on DNA',
    description:
        'Recent studies aboard the ISS reveal unexpected structural variations in human telomeres when exposed to prolonged zero-G environments.',
    imageUrl:
        'https://images.unsplash.com/photo-1628595351029-c2bf17511435?w=600',
  ),
  ArticleModel(
    id: '2',
    categoryId: 'astrobiology',
    categoryLabel: 'ASTROBIOLOGY',
    date: 'JAN 10, 2024',
    readTime: '12 MIN READ',
    title: 'Extremophiles in Martian Soil',
    description:
        'A comprehensive analysis of perchlorate-reducing bacteria and their potential for survival in simulated Martian regolith conditions.',
    imageUrl:
        'https://images.unsplash.com/photo-1614728263952-84ea256f9d4f?w=600',
  ),
  ArticleModel(
    id: '3',
    categoryId: 'botany',
    categoryLabel: 'BOTANY',
    date: 'JAN 08, 2024',
    readTime: '15 MIN READ',
    title: 'Hydroponics for Deep Space',
    description:
        'Optimizing nutrient delivery systems for sustainable crop yields in long-duration lunar and interplanetary transit missions.',
    imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600',
  ),
  ArticleModel(
    id: '4',
    categoryId: 'engineering',
    categoryLabel: 'ENGINEERING',
    date: 'JAN 05, 2024',
    readTime: '10 MIN READ',
    title: 'Synthetic Biology in Orbit',
    description:
        'Leveraging CRISPR-Cas9 for in-situ repair of radiation-damaged cellular systems during extravehicular activities.',
    imageUrl:
        'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=600',
  ),
  ArticleModel(
    id: '5',
    categoryId: 'health',
    categoryLabel: 'HEALTH',
    date: 'JAN 03, 2024',
    readTime: '7 MIN READ',
    title: 'Bone Density in Zero-G',
    description:
        'New pharmaceutical countermeasures aimed at inhibiting osteoclast activity during multi-year space voyages to Mars.',
    imageUrl: 'https://images.unsplash.com/photo-1559757175-0eb30cd8c063?w=600',
  ),
  ArticleModel(
    id: '6',
    categoryId: 'genetics',
    categoryLabel: 'GENETICS',
    date: 'JAN 01, 2024',
    readTime: '9 MIN READ',
    title: 'Radiation Resistance Mechanisms',
    description:
        'How Tardigrades encode proteins that shield DNA from ionizing radiation, and the implications for astronaut health safety.',
    imageUrl:
        'https://images.unsplash.com/photo-1507413245164-6160d8298b31?w=600',
  ),
  ArticleModel(
    id: '7',
    categoryId: 'microgravity',
    categoryLabel: 'MICROGRAVITY',
    date: 'DEC 28, 2023',
    readTime: '11 MIN READ',
    title: 'Fluid Dynamics in Zero Gravity',
    description:
        'Examining how surface tension dominates fluid behaviour in microgravity, with implications for propellant management systems.',
    imageUrl:
        'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=600',
  ),
  ArticleModel(
    id: '8',
    categoryId: 'bio_informatics',
    categoryLabel: 'BIO-INFORMATICS',
    date: 'DEC 25, 2023',
    readTime: '6 MIN READ',
    title: 'AI-Driven Genomic Sequencing',
    description:
        'Machine learning pipelines that accelerate whole-genome sequencing for astronaut health monitoring during long-duration missions.',
    imageUrl:
        'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600',
  ),
  ArticleModel(
    id: '9',
    categoryId: 'life_support',
    categoryLabel: 'LIFE SUPPORT',
    date: 'DEC 20, 2023',
    readTime: '13 MIN READ',
    title: 'Closed-Loop Life Support Systems',
    description:
        'Engineering redundant oxygen generation and CO₂ scrubbing architectures for crewed Mars transfer vehicles.',
    imageUrl:
        'https://images.unsplash.com/photo-1614728894747-a83421e2b9c9?w=600',
  ),
];

// ─── Colours ──────────────────────────────────────────────────────────────────

class AppColors {
  static const Color bg = Color(0xFFF3F3F3);
  static const Color navy = Color(0xFF1A2340);
  static const Color orange = Color(0xFFE8521A);
  static const Color subtitleGrey = Color(0xFF6B7280);
  static const Color border = Color(0xFFD1D5DB);
  static const Color cardBg = Colors.white;
  static const Color metaGrey = Color(0xFF9CA3AF);
  static const Color readLink = Color(0xFFE8521A);
}

// ─── Main Screen ──────────────────────────────────────────────────────────────

class LibraryWebGrid extends StatefulWidget {
  const LibraryWebGrid({
    super.key,
    required this.selectedCategories, // ✅ بيستقبل من الـ parent
  });

  final Set<String> selectedCategories;

  @override
  State<LibraryWebGrid> createState() => _LibraryWebGridState();
}

class _LibraryWebGridState extends State<LibraryWebGrid> {
  int _currentPage = 1;
  static const int _pageSize = 9;

  List<ArticleModel> get _filteredArticles {
    // ✅ بيستخدم widget.selectedCategories بدل local state
    if (widget.selectedCategories.contains('all')) return kArticles;
    return kArticles
        .where((a) => widget.selectedCategories.contains(a.categoryId))
        .toList();
  }

  // ✅ لو الـ categories اتغيرت، ارجع للـ page الأولى
  @override
  void didUpdateWidget(LibraryWebGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategories != widget.selectedCategories) {
      _currentPage = 1;
    }
  }

  List<ArticleModel> get _pagedArticles {
    final all = _filteredArticles;
    final start = (_currentPage - 1) * _pageSize;
    final end = (start + _pageSize).clamp(0, all.length);
    if (start >= all.length) return [];
    return all.sublist(start, end);
  }

  int get _totalPages =>
      (_filteredArticles.length / _pageSize).ceil().clamp(1, 999);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _pagedArticles.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Text(
                    'No articles found.',
                    style: TextStyle(color: AppColors.subtitleGrey),
                  ),
                ),
              )
            : Column(
                children: [
                  _buildGrid(), // ✅ بدون Expanded
                  _buildPagination(),
                  const SizedBox(height: 16),
                ],
              ),
      ],
    );
  }

  // ── Article Grid ─────────────────────────────────────────────────
  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: true, // ✅ ضروري
      physics: const NeverScrollableScrollPhysics(), // ✅ الـ scroll للـ parent
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.0,
      ),
      itemCount: _pagedArticles.length,
      itemBuilder: (_, i) {
        final article = _pagedArticles[i];
        return ArticleCard(
          title: article.title,
          description: article.description,
          category: article.categoryLabel,
          date: article.date,
          readTime: article.readTime,
          imageUrl: article.imageUrl,
        );
      },
    );
  }

  // ── Pagination ───────────────────────────────────────────────────

  Widget _buildPagination() {
    const maxVisible = 3;
    final pages = <int>[];

    if (_totalPages <= maxVisible + 2) {
      pages.addAll(List.generate(_totalPages, (i) => i + 1));
    } else {
      pages.add(1);
      if (_currentPage > 3) pages.add(-1); // ellipsis
      for (
        int p = (_currentPage - 1).clamp(2, _totalPages - 1);
        p <= (_currentPage + 1).clamp(2, _totalPages - 1);
        p++
      ) {
        pages.add(p);
      }
      if (_currentPage < _totalPages - 2) pages.add(-1);
      if (!pages.contains(_totalPages)) pages.add(_totalPages);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PaginationButton(
          icon: Icons.chevron_left,
          onTap: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
        ),
        const SizedBox(width: 6),
        ...pages.map((p) {
          if (p == -1) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '...',
                style: TextStyle(color: AppColors.subtitleGrey),
              ),
            );
          }
          final active = p == _currentPage;
          return _PaginationButton(
            label: '$p',
            isActive: active,
            onTap: () => setState(() => _currentPage = p),
          );
        }),
        const SizedBox(width: 6),
        _PaginationButton(
          icon: Icons.chevron_right,
          onTap: _currentPage < _totalPages
              ? () => setState(() => _currentPage++)
              : null,
        ),
      ],
    );
  }
}

// ─── Pagination Button ────────────────────────────────────────────────────────

class _PaginationButton extends StatelessWidget {
  const _PaginationButton({
    this.label,
    this.icon,
    this.isActive = false,
    this.onTap,
  });

  final String? label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? AppColors.orange : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? AppColors.orange : AppColors.border,
          ),
        ),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  size: 18,
                  color: disabled ? AppColors.border : AppColors.navy,
                )
              : Text(
                  label!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : AppColors.navy,
                  ),
                ),
        ),
      ),
    );
  }
}
