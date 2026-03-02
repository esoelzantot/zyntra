import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.onPress,
    this.enabled = true,
    required this.title,
  });

  final VoidCallback? onPress;
  final Color? backgroundColor, textColor;
  final bool enabled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.search_rounded, color: Colors.white),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: DesignConstants.defaultButton_HP,
          vertical: DesignConstants.defaultButton_VP,
        ),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            DesignConstants.defaultBorderRadius,
          ),
        ),
        elevation: enabled ? DesignConstants.defaultElevation : 0,
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        disabledBackgroundColor: Colors.transparent,
      ),
      onPressed: enabled ? onPress : null,
      label: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(title, style: AppStyles.styleBold16(context)),
      ),
    );
  }
}
