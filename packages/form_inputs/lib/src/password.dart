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

  // Minimum eight characters, at least one uppercase letter,
  // one lowercase letter, one number and one special character:
  static final _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  @override
  PasswordValidationError? validator(String value) {
    if (_passwordRegExp.hasMatch(value)) return null;
    return PasswordValidationError.invalid;
  }
}
