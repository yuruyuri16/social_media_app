import 'package:formz/formz.dart';

/// Password Form Input Validation Error.
enum PasswordValidationError {
  /// Password is invalid.
  invalid;
}

/// {@template password}
/// Reusable password form input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp('');

  @override
  PasswordValidationError? validator(String value) {
    if (_passwordRegExp.hasMatch(value)) return null;
    return PasswordValidationError.invalid;
  }
}
