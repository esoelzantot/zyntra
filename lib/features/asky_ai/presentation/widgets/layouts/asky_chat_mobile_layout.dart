import 'package:flutter/material.dart';
import 'package:zyntra/core/data/asky_dummy_data.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/chat_panal/chat_input_bar.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/chat_panal/chat_messages_list.dart';
import 'package:zyntra/features/asky_ai/presentation/widgets/side_bar/resource_card.dart';

import '../../../../../app_theme.dart';

class AskyChatMobileLayout extends StatefulWidget {
  const AskyChatMobileLayout({super.key});

  @override
  State<AskyChatMobileLayout> createState() => _AskyChatMobileLayoutState();
}

class _AskyChatMobileLayoutState extends State<AskyChatMobileLayout>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 1; // default: Session

  // Keep pages alive while switching tabs
  final _pages = const [_ThreadsPage(), _SessionPage(), _ResourcesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // ── Top Bar ────────────────────────────────────────────────
      appBar: _MobileTopBar(selectedTab: _selectedTab),
      // ── Body: keep all pages mounted ──────────────────────────
      body: IndexedStack(index: _selectedTab, children: _pages),
      // ── Bottom Navigation ──────────────────────────────────────
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

  static const _titles = ['Threads', 'Session', 'Resources'];

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  // Logo / Brand mark
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
          ],
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
      icon: Icons.forum_outlined,
      activeIcon: Icons.forum,
      label: 'Threads',
    ),
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
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

/// Tab 0 – Threads
class _ThreadsPage extends StatelessWidget {
  const _ThreadsPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.forum_outlined, size: 48, color: AppColors.textMuted),
          SizedBox(height: 12),
          Text(
            'No threads yet',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Start a new conversation to see threads here.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Tab 1 – Session (reuses ChatPanel logic inline)
class _SessionPage extends StatefulWidget {
  const _SessionPage();

  @override
  State<_SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<_SessionPage> {
  final _scrollController = ScrollController();
  final _messages = SampleData.messages;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ChatTopBar is intentionally omitted here — the AppBar above handles it.
        // If you still want per-session actions, keep ChatTopBar:
        // const ChatTopBar(),
        Expanded(
          child: ChatMessagesList(
            messages: _messages,
            scrollController: _scrollController,
          ),
        ),
        const ChatInputBar(),
      ],
    );
  }
}

/// Tab 2 – Resources
class _ResourcesPage extends StatelessWidget {
  const _ResourcesPage();

  @override
  Widget build(BuildContext context) {
    final resources = SampleData.resources;

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
