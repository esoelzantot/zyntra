import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ViewPdfButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ViewPdfButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
      label: Text('View PDF', style: AppStyles.styleSemiBold16(context)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE8621A),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}
