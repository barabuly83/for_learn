import '../../models/validation_error.dart';

abstract class PasswordValidator {
  ValidationError? validate(String? password);
}

class DefaultPasswordValidator implements PasswordValidator {
  static const int minLength = 6;

  @override
  ValidationError? validate(String? password) {
    if (password == null || password.isEmpty) {
      return ValidationError.empty;
    }
    if (password.length < minLength) {
      return ValidationError.passwordTooShort;
    }
    return null;
  }
}

