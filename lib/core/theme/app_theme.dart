import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryPink = Color(0xFFE97F7F);
  static const Color softBackground = Color(0xFFF7F7F7);
  static const Color lightPinkBorder = Color(0xFFF2B3B3);

  static ThemeData light() {
    final base = ThemeData.light();

    return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: base.colorScheme.copyWith(
        primary: primaryPink,
      ),
      textTheme: GoogleFonts.comicNeueTextTheme(
        base.textTheme,
      ),
    );
  }
}