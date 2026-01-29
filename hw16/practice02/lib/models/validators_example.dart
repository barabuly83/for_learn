import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

/// Пример использования валидаторов с правильным именованием (без префикса I)
void demonstrateValidators() {
  // Создаем валидаторы
  const emailValidator = EmailValidator();
  const passwordValidator = PasswordValidator();

  // Тестируем email валидацию
  print('=== Email Validation Examples ===');
  final testEmails = ['', 'invalid-email', 'test@example.com'];

  for (final email in testEmails) {
    final error = emailValidator.validate(email);
    print('Email "$email": ${error ?? "Valid"}');
  }

  // Тестируем password валидацию
  print('\n=== Password Validation Examples ===');
  final testPasswords = ['', '123', 'password123'];

  for (final password in testPasswords) {
    final error = passwordValidator.validate(password);
    print(
      'Password "${password.length < 3 ? password : "*" * password.length}": ${error ?? "Valid"}',
    );
  }
}
