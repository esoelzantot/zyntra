import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class VisitLinkButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const VisitLinkButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.open_in_new_rounded, size: 18),
      label: Text('Visit Live Link', style: AppStyles.styleSemiBold16(context)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D1B2E),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}
