import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro app_button}
  const AppButton._({
    required this.child,
    this.onPressed,
    Size? maximumSize,
    Size? minimumSize,
    EdgeInsets? padding,
    double? elevation,
    Color? buttonColor,
    Color? disabledButtonColor,
    TextStyle? textStyle,
    BorderSide? borderSide,
    Color? disabledForegroundColor,
    Color? foregroundColor,
    super.key,
  })  : _maximumSize = maximumSize ?? _defaultMaximumSize,
        _minimumSize = minimumSize ?? _defaultMinimumSize,
        _padding = padding ?? _defaultPadding,
        _elevation = elevation ?? 0,
        _buttonColor = buttonColor ?? AppColors.white,
        _disabledButtonColor = disabledButtonColor ?? AppColors.disabledButton,
        _textStyle = textStyle,
        _borderSide = borderSide,
        _disabledForegroundColor =
            disabledForegroundColor ?? AppColors.disabledForeground,
        _foregroundColor = foregroundColor ?? AppColors.black;

  /// Outlined white button.
  const AppButton.outlinedWhite({
    required Widget child,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Key? key,
  }) : this._(
          key: key,
          child: child,
          onPressed: onPressed,
          buttonColor: AppColors.white,
          elevation: elevation,
          borderSide: const BorderSide(
            color: AppColors.pastelGrey,
          ),
          foregroundColor: AppColors.lightBlack,
          textStyle: textStyle,
        );

  /// Filled blue charcoal button.
  const AppButton.blueCharcoal({
    required Widget child,
    VoidCallback? onPressed,
    double? elevation,
    TextStyle? textStyle,
    Key? key,
  }) : this._(
          key: key,
          child: child,
          onPressed: onPressed,
          buttonColor: AppColors.blueCharcoal,
          foregroundColor: AppColors.white,
          elevation: elevation,
          textStyle: textStyle,
        );

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 56);

  /// The minimum size of the button.
  static const _defaultMinimumSize = Size(double.infinity, 56);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.symmetric(vertical: AppSpacing.lg);

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;

  /// [Widget] displayed on the button.
  final Widget child;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [_defaultMinimumSize].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets _padding;

  /// Elevation of the button.
  final double _elevation;

  /// A background color of the button.
  ///
  /// Defaults to [Colors.white].
  final Color _buttonColor;

  /// A disabled background color of the button.
  ///
  /// Defaults to [AppColors.disabledButton].
  final Color? _disabledButtonColor;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? _textStyle;

  /// A border of the button.
  final BorderSide? _borderSide;

  /// Color of the disabled text, icons etc.
  ///
  /// Defaults to [AppColors.disabledForeground].
  final Color _disabledForegroundColor;

  /// Color of the text, icons etc.
  ///
  /// Defaults to [AppColors.black].
  final Color _foregroundColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = _textStyle ?? Theme.of(context).textTheme.labelLarge;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all(_maximumSize),
        minimumSize: MaterialStateProperty.all(_minimumSize),
        padding: MaterialStateProperty.all(_padding),
        elevation: MaterialStateProperty.all(_elevation),
        backgroundColor: onPressed == null
            ? MaterialStateProperty.all(_disabledButtonColor)
            : MaterialStateProperty.all(_buttonColor),
        foregroundColor: onPressed == null
            ? MaterialStateProperty.all(_disabledForegroundColor)
            : MaterialStateProperty.all(_foregroundColor),
        textStyle: MaterialStateProperty.all(textStyle),
        side: MaterialStateProperty.all(_borderSide),
        // shape: MaterialStateProperty.all(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
      ),
      child: child,
    );
  }
}
