import 'package:formz/formz.dart';

/// Validation errors for the [Name] [FormzInput].
enum NameValidationError {
  /// Name is too short.
  tooShort,
}

/// {@template name}
/// Form input for a name input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  const Name.pure() : super.pure('');

  /// {@macro name}
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.length < 2) {
      return NameValidationError.tooShort;
    }
    return null;
  }
}
