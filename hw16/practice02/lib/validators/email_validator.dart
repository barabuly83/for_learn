import 'validator.dart';
import '../models/validation_error.dart';

class EmailValidator extends Validator<String> {
  const EmailValidator();
  @override
  ValidationError? validate(String? value) {
    if (value == null || value.isEmpty) {
      return const ValidationError('Email is required');
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return const ValidationError('Please enter a valid email address');
    }

    return null;
  }
}