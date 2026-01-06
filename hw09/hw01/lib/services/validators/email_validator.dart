abstract class EmailValidator {
  String? validate(String? email);
}

class EmailValidatorImpl implements EmailValidator {
  @override
  String? validate(String? email) {
    if (email == null || email.isEmpty) {
      return 'Пожалуйста, введите email';
    }
    if (!email.contains('@')) {
      return 'Email должен содержать символ @';
    }
    return null;
  }
}

