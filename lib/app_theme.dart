import 'package:flutter/material.dart';

class AppColors {
  // Background layers
  static const Color bgDeep = Color(0xFF0F0B08);
  static const Color bgSidebar = Color(0xFF1A1410);
  static const Color bgCard = Color(0xff03122B);
  static const Color bgCardHover = Color(0xff03122B);
  static const Color bgMessage = Color(0xFF1C1710);
  static const Color bgMessageAlt = Color(0xFF231D14);

  // Accent
  static const Color orange = Color(0xFFFF5722);
  static const Color orangeLight = Color(0xFFFF7043);
  static const Color orangeDim = Color(0x33FF5722);
  static const Color orangeGlow = Color(0x1AFF5722);

  // Text
  static const Color textPrimary = Color(0xFFECE5D8);
  static const Color textSecondary = Color(0xFF8A7D6B);
  static const Color textMuted = Color(0xFF5A4F42);
  static const Color textLink = Color(0xFFFF7043);

  // Border
  static const Color border = Color(0xFF2A2218);
  static const Color borderActive = Color(0xff03122B);

  // Progress bar
  static const Color progressBg = Color(0xFF2A2218);
  static const Color progressFill = Color(0xFFFF5722);
}

class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgDeep,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme.dark(
      primary: AppColors.orange,
      surface: AppColors.bgCard,
    ),
  );
}
