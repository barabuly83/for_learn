import 'package:flutter/foundation.dart';
import '../models/login_credentials.dart';
import '../models/validation_error.dart';
import '../services/validators/email_validator.dart';
import '../services/validators/password_validator.dart';

class LoginViewModel extends ChangeNotifier {
  final EmailValidator _emailValidator;
  final PasswordValidator _passwordValidator;

  LoginViewModel({
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
  })  : _emailValidator = emailValidator ?? DefaultEmailValidator(),
        _passwordValidator = passwordValidator ?? DefaultPasswordValidator();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  ValidationError? validateEmail(String? email) {
    return _emailValidator.validate(email);
  }

  ValidationError? validatePassword(String? password) {
    return _passwordValidator.validate(password);
  }

  bool validateForm(String? email, String? password) {
    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);
    return emailError == null && passwordError == null;
  }

  LoginCredentials? createCredentials(String email, String password) {
    if (validateForm(email, password)) {
      return LoginCredentials(email: email, password: password);
    }
    return null;
  }
}

