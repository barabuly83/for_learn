enum ValidationErrorType {
  empty,
  invalidEmail,
  passwordTooShort,
}

class ValidationError {
  final ValidationErrorType type;
  
  const ValidationError(this.type);
  
  static const ValidationError empty = ValidationError(ValidationErrorType.empty);
  static const ValidationError invalidEmail = ValidationError(ValidationErrorType.invalidEmail);
  static const ValidationError passwordTooShort = ValidationError(ValidationErrorType.passwordTooShort);
}

