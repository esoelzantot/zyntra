import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

import '../../../../../app_theme.dart';

class ChatTopBar extends StatelessWidget {
  const ChatTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Row(
        children: [
          // Session icon
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.chat_bubble_rounded,
              color: Colors.white,
              size: 14,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Active Session: Neural Mapping X1',
            style: AppStyles.styleSemiBold18(
              context,
            ).copyWith(color: AppColors.textPrimary),
          ),
          const Spacer(),
          // New Thread button
          _NewThreadButton(),
        ],
      ),
    );
  }
}

class _TopBarButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _TopBarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_TopBarButton> createState() => _TopBarButtonState();
}

class _TopBarButtonState extends State<_TopBarButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.bgCard : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: AppColors.textSecondary, size: 16),
              const SizedBox(width: 5),
              Text(
                widget.label,
                style: AppStyles.styleSemiBold14(
                  context,
                ).copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewThreadButton extends StatefulWidget {
  @override
  State<_NewThreadButton> createState() => _NewThreadButtonState();
}

class _NewThreadButtonState extends State<_NewThreadButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.orangeLight : AppColors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.add_rounded, color: Colors.white, size: 16),
            SizedBox(width: 5),
            Text(
              'New Thread',
              style: AppStyles.styleSemiBold14(
                context,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
