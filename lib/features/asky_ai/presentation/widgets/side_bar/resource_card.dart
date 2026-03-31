import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routing/end_points.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_analysis/get_article_analysis_cubit.dart';
import 'package:zyntra/features/article_details/presentation/cubits/get_article_data/get_article_data_cubit.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';

import '../../../../../app_theme.dart';

class ResourceCard extends StatefulWidget {
  final ResourceEntity resource;

  const ResourceCard({super.key, required this.resource});

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  bool _hovered = false;

  void _onResourceTapped() {
    context.read<GetArticleDataCubit>().getArticleData(id: widget.resource.id);
    context.read<GetArticleAnalysisCubit>().getArticleAnalysis(
      id: widget.resource.id,
    );
    GoRouter.of(context).push(EndPoints.articleDetailsView);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onResourceTapped,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.bgCard : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 0.7,
            ),
          ),
          child: Row(
            children: [
              _ResourceIcon(active: _hovered),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.resource.title,
                      style: AppStyles.styleSemiBold16(context).copyWith(
                        color: _hovered
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.resource.section,
                      style: AppStyles.styleMedium14(
                        context,
                      ).copyWith(color: AppColors.textMuted),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Score badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${(widget.resource.score * 100).toStringAsFixed(0)}%',
                  style: AppStyles.styleSemiBold14(
                    context,
                  ).copyWith(color: AppColors.orange),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.textMuted,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResourceIcon extends StatelessWidget {
  final bool active;

  const _ResourceIcon({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: active ? AppColors.orange : const Color(0xff03122B),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(
        Icons.storage_rounded,
        color: active ? Colors.white : AppColors.orange,
        size: 18,
      ),
    );
  }
}
