abstract class PasswordValidator {
  String? validate(String? password);
}

class PasswordValidatorImpl implements PasswordValidator {
  static const int minLength = 6;

  @override
  String? validate(String? password) {
    if (password == null || password.isEmpty) {
      return 'Пожалуйста, введите пароль';
    }
    if (password.length < minLength) {
      return 'Пароль должен содержать минимум $minLength символов';
    }
    return null;
  }
}

