import 'package:app_ui/app_ui.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Theme.
class AppTheme {
  /// Light theme.
  static ThemeData get theme {
    return FlexThemeData.light(
      scheme: FlexScheme.shark,
      useMaterial3: true,
      subThemesData: const FlexSubThemesData(
        interactionEffects: false,
        elevatedButtonRadius: 8,
        inputDecoratorRadius: 8,
        inputDecoratorIsFilled: false,
      ),
      textTheme: GoogleFonts.latoTextTheme(),
    ).copyWith(
      splashColor: AppColors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    );
  }

  /// Dark theme.
  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.shark,
      useMaterial3: true,
      subThemesData: const FlexSubThemesData(
        interactionEffects: false,
        elevatedButtonRadius: 8,
        inputDecoratorRadius: 8,
        inputDecoratorIsFilled: false,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
    );
  }
}
