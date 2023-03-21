import 'package:form_inputs/form_inputs.dart';

/// Username Form Input Validation Error.
enum UsernameValidationError {
  /// Username is invalid.
  invalid;
}

/// {@template username}
/// Reusable username form input.
/// {@endtemplate}
class Username extends FormzInput<String, UsernameValidationError> {
  /// {@macro username}
  const Username.pure() : super.pure('');

  /// {@macro username}
  const Username.dirty([super.value = '']) : super.dirty();

  // Username consists of alphanumeric characters (a-zA-Z0-9), lowercase, or
  // uppercase.
  // Username allowed of the dot (.), underscore (_), and hyphen (-).
  // The dot (.), underscore (_), or hyphen (-) must not be the first or last
  // character.
  // The dot (.), underscore (_), or hyphen (-) does not appear consecutively,
  // e.g., java..regex
  // The number of characters must be between 5 to 20.
  static final _usernameRegExp = RegExp(
    r'^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$',
  );

  @override
  UsernameValidationError? validator(String value) {
    if (_usernameRegExp.hasMatch(value)) return null;
    return UsernameValidationError.invalid;
  }
}
