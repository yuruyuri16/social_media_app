import 'package:form_inputs/form_inputs.dart';

///
enum LastNameValidationError {
  ///
  invalid;
}

/// {@template last_name}
/// Reusable last name form input.
/// {@endtemplate}
class LastName extends FormzInput<String, LastNameValidationError> {
  /// {@macro last_name}
  const LastName.pure() : super.pure('');

  /// {@marco last_name}
  const LastName.dirty([super.value = '']) : super.dirty();

  @override
  LastNameValidationError? validator(String value) {
    return null;
  }
}
