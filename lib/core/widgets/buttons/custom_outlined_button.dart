import 'package:flutter/material.dart';
import 'package:zyntra/core/constants/design_constants.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    required this.onPress,
    this.enabled = true,
    required this.title,
  });

  final VoidCallback? onPress;
  final Color? backgroundColor, textColor, borderColor;
  final bool enabled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignConstants.defaultButton_HP,
          vertical: DesignConstants.defaultButton_VP,
        ),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            DesignConstants.defaultBorderRadius,
          ),
        ),
        side: BorderSide(color: borderColor ?? Colors.white, width: 1.0),
        elevation: enabled ? DesignConstants.defaultElevation : 0,
        backgroundColor: Colors.transparent,
        foregroundColor: textColor ?? Colors.white,
        disabledBackgroundColor: Colors.transparent,
      ),
      onPressed: enabled ? onPress : null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: AppStyles.styleBold16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
