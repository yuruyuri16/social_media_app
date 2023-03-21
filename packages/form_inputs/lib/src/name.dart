import 'package:form_inputs/form_inputs.dart';

///
enum NameValidationError {
  ///
  invalid;
}

/// {@template name}
/// Reusable name form input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  const Name.pure() : super.pure('');

  /// {@macro name}
  const Name.dirty([super.value = '']) : super.dirty();

  // ignore: unused_field
  static final _nameRegExp = RegExp('');

  @override
  NameValidationError? validator(String value) {
    return null;
  }
}
