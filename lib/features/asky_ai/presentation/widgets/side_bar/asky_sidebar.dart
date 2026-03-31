import 'package:flutter/material.dart';
import 'package:zyntra/core/data/asky_dummy_data.dart';
import 'package:zyntra/core/utils/app_styles.dart';

import '../../../../../app_theme.dart';
import 'resource_card.dart';
import 'sidebar_header.dart';

class AskySidebar extends StatefulWidget {
  const AskySidebar({super.key});

  @override
  State<AskySidebar> createState() => _AskySidebarState();
}

class _AskySidebarState extends State<AskySidebar> {
  @override
  Widget build(BuildContext context) {
    final resources = SampleData.resources;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF).withValues(alpha: 1.0),
        border: Border(right: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SidebarHeader(),
          const Divider(color: AppColors.border, height: 0.5, thickness: 0.5),
          const SizedBox(height: 16),

          // ── Content ──────────────────────────────────────────
          Expanded(child: _buildResources(resources)),
        ],
      ),
    );
  }

  Widget _buildResources(List resources) {
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
      ],
    );
  }
}
