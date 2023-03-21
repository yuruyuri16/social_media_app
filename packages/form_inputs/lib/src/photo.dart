import 'dart:io';

import 'package:form_inputs/form_inputs.dart';

///
enum PhotoValidationError {
  ///
  empty;
}

/// {@template photo}
/// {@endtemplate}
class Photo extends FormzInput<File?, PhotoValidationError> {
  /// {@macro photo}
  const Photo.pure() : super.pure(null);

  /// {@macro photo}
  const Photo.dirty(super.value) : super.dirty();

  @override
  PhotoValidationError? validator(File? value) {
    if (value == null) return PhotoValidationError.empty;
    return null;
  }
}
