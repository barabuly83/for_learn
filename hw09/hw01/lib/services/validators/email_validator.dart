import '../../models/validation_error.dart';

abstract class EmailValidator {
  ValidationError? validate(String? email);
}

class DefaultEmailValidator implements EmailValidator {
  @override
  ValidationError? validate(String? email) {
    if (email == null || email.isEmpty) {
      return ValidationError.empty;
    }
    if (!email.contains('@')) {
      return ValidationError.invalidEmail;
    }
    return null;
  }
}

