import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/side_bar/resource_hint_banner.dart';

import '../../../../../app_theme.dart';
import 'resource_card.dart';
import 'sidebar_header.dart';

class AskySidebar extends StatelessWidget {
  final List<ResourceEntity> resources;

  const AskySidebar({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF).withValues(alpha: 1.0),
        border: Border(right: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SidebarHeader(),
          const Divider(color: AppColors.border, height: 0.5, thickness: 0.5),
          const SizedBox(height: 16),
          Expanded(child: _buildResources(context)),
        ],
      ),
    );
  }

  Widget _buildResources(BuildContext context) {
    if (resources.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.find_in_page_outlined,
              color: AppColors.textMuted,
              size: 32,
            ),
            const SizedBox(height: 12),
            Text(
              'No resources yet',
              style: AppStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: 4),
            Text(
              'Tap a message to see its sources',
              style: AppStyles.styleMedium14(
                context,
              ).copyWith(color: AppColors.textMuted),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'RESEARCH RESOURCES',
            style: AppStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.textMuted),
          ),
        ),
        const SizedBox(height: 10),
        ...resources.map((r) => ResourceCard(resource: r)),
        const SizedBox(height: 64),
        ResourcesHintBanner(),
      ],
    );
  }
}
