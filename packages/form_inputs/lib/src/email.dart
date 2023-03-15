import 'package:formz/formz.dart';

/// Email Form Input Validation Error.
enum EmailValidationError {
  /// Email is invalid.
  invalid;
}

/// {@template email}
/// Reusable email form input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp('');

  @override
  EmailValidationError? validator(String value) {
    if (_emailRegExp.hasMatch(value)) return null;
    return EmailValidationError.invalid;
  }
}
