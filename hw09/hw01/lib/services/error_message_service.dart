import '../models/validation_error.dart';

class ErrorMessageService {
  static String? getErrorMessage(ValidationError? error) {
    if (error == null) return null;
    
    switch (error.type) {
      case ValidationErrorType.empty:
        return 'Пожалуйста, введите значение';
      case ValidationErrorType.invalidEmail:
        return 'Email должен содержать символ @';
      case ValidationErrorType.passwordTooShort:
        return 'Пароль должен содержать минимум 6 символов';
    }
  }
  
  static String? getEmailErrorMessage(ValidationError? error) {
    if (error == null) return null;
    
    switch (error.type) {
      case ValidationErrorType.empty:
        return 'Пожалуйста, введите email';
      case ValidationErrorType.invalidEmail:
        return 'Email должен содержать символ @';
      case ValidationErrorType.passwordTooShort:
        return null; // Не применимо для email
    }
  }
  
  static String? getPasswordErrorMessage(ValidationError? error) {
    if (error == null) return null;
    
    switch (error.type) {
      case ValidationErrorType.empty:
        return 'Пожалуйста, введите пароль';
      case ValidationErrorType.passwordTooShort:
        return 'Пароль должен содержать минимум 6 символов';
      case ValidationErrorType.invalidEmail:
        return null; // Не применимо для пароля
    }
  }
}

