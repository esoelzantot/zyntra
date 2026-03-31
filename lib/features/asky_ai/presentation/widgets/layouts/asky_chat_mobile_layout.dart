import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/chat_panal/chat_input_bar.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/chat_panal/chat_messages_list.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/side_bar/resource_card.dart';

import '../../../../../app_theme.dart';

class AskyChatMobileLayout extends StatefulWidget {
  const AskyChatMobileLayout({super.key});

  @override
  State<AskyChatMobileLayout> createState() => _AskyChatMobileLayoutState();
}

class _AskyChatMobileLayoutState extends State<AskyChatMobileLayout> {
  int _selectedTab = 0;
  List<ResourceEntity> _selectedResources = [];

  void _onResourcesTap(List<ResourceEntity> resources) {
    setState(() {
      _selectedResources = resources;
      _selectedTab = 1; // انتقل لتاب الـ resources تلقائياً
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _SessionPage(onResourcesTap: _onResourcesTap),
      _ResourcesPage(resources: _selectedResources),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _MobileTopBar(selectedTab: _selectedTab),
      body: IndexedStack(index: _selectedTab, children: pages),
      bottomNavigationBar: _MobileBottomNav(
        selectedIndex: _selectedTab,
        onTap: (i) => setState(() => _selectedTab = i),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// TOP BAR
// ─────────────────────────────────────────────────────────────────────────────

class _MobileTopBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedTab;
  const _MobileTopBar({required this.selectedTab});

  static const _titles = ['Session', 'Resources'];

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1.0)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _titles[selectedTab],
                style: AppStyles.styleBold24(
                  context,
                ).copyWith(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BOTTOM NAV
// ─────────────────────────────────────────────────────────────────────────────

class _MobileBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const _MobileBottomNav({required this.selectedIndex, required this.onTap});

  static const _items = [
    _NavItem(
      icon: Icons.chat_bubble_outline,
      activeIcon: Icons.chat_bubble,
      label: 'Session',
    ),
    _NavItem(
      icon: Icons.folder_outlined,
      activeIcon: Icons.folder,
      label: 'Resources',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: List.generate(_items.length, (i) {
              final item = _items[i];
              final isSelected = selectedIndex == i;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          isSelected ? item.activeIcon : item.icon,
                          key: ValueKey(isSelected),
                          size: 22,
                          color: isSelected
                              ? AppColors.orange
                              : AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? AppColors.orange
                              : AppColors.textMuted,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// TAB PAGES
// ─────────────────────────────────────────────────────────────────────────────

/// Tab 0 – Session
class _SessionPage extends StatefulWidget {
  final ValueChanged<List<ResourceEntity>> onResourcesTap;

  const _SessionPage({required this.onResourcesTap});

  @override
  State<_SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<_SessionPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ChatMessagesList(
            scrollController: _scrollController,
            onResourcesTap: widget.onResourcesTap,
          ),
        ),
        const ChatInputBar(),
      ],
    );
  }
}

/// Tab 1 – Resources
class _ResourcesPage extends StatelessWidget {
  final List<ResourceEntity> resources;

  const _ResourcesPage({required this.resources});

  @override
  Widget build(BuildContext context) {
    if (resources.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.folder_outlined, size: 48, color: AppColors.textMuted),
            SizedBox(height: 12),
            Text(
              'No resources yet',
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Tap a message to see its sources',
              style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'RESEARCH RESOURCES',
            style: AppStyles.styleBold16(
              context,
            ).copyWith(color: AppColors.textMuted, fontSize: 12),
          ),
        ),
        const SizedBox(height: 10),
        ...resources.map((r) => ResourceCard(resource: r)),
      ],
    );
  }
}
