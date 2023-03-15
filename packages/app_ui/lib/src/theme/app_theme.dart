import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// App Theme.
class AppTheme {
  /// Light theme.
  static ThemeData get theme {
    return FlexThemeData.light();
  }

  /// Dark theme.
  static ThemeData get darkTheme {
    return FlexThemeData.dark();
  }
}
