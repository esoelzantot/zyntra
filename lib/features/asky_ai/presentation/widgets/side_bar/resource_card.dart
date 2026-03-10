import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

import '../../../../../app_theme.dart';
import '../../../../../core/data/asky_dummy_data.dart';

class ResourceCard extends StatefulWidget {
  final ResearchResource resource;

  const ResourceCard({super.key, required this.resource});

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bool active = widget.resource.isActive;

    return MouseRegion(
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
            _ResourceIcon(icon: widget.resource.icon, active: _hovered),
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
                    widget.resource.subtitle,
                    style: AppStyles.styleMedium14(
                      context,
                    ).copyWith(color: AppColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textMuted,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResourceIcon extends StatelessWidget {
  final ResourceIcon icon;
  final bool active;

  const _ResourceIcon({required this.icon, required this.active});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color bgColor;
    Color iconColor;

    iconData = Icons.storage_rounded;
    bgColor = active ? Color(0xFFFF5722) : const Color(0xff03122B);
    iconColor = active ? Colors.white : AppColors.orange;

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(iconData, color: iconColor, size: 18),
    );
  }
}
