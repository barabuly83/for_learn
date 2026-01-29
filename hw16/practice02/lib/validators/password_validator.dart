import 'validator.dart';
import '../models/validation_error.dart';

class PasswordValidator extends Validator<String> {
  const PasswordValidator();
  @override
  ValidationError? validate(String? value) {
    if (value == null || value.isEmpty) {
      return const ValidationError('Password is required');
    }

    if (value.length < 6) {
      return const ValidationError('Password must be at least 6 characters long');
    }

    return null;
  }
}