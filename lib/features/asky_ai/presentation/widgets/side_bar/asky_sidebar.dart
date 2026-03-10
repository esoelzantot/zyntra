import 'package:flutter/material.dart';
import 'package:zyntra/core/data/asky_dummy_data.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/side_bar/bottom_tabs.dart';

import '../../../../../app_theme.dart';
import 'resource_card.dart';
import 'sidebar_header.dart';

class AskySidebar extends StatefulWidget {
  const AskySidebar({super.key});

  @override
  State<AskySidebar> createState() => _AskySidebarState();
}

class _AskySidebarState extends State<AskySidebar> {
  int _selectedTab = 1; // 0 = Threads, 1 = Resources

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
          Expanded(
            child: _selectedTab == 0
                ? _buildThreads()
                : _buildResources(resources),
          ),

          // ── Bottom Tabs ───────────────────────────────────────
          const Divider(color: AppColors.border, height: 1),
          BottomTabs(
            selectedIndex: _selectedTab,
            onTap: (i) => setState(() => _selectedTab = i),
          ),
        ],
      ),
    );
  }

  Widget _buildThreads() {
    return const Center(
      child: Text(
        'No threads yet',
        style: TextStyle(color: AppColors.textMuted, fontSize: 13),
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
