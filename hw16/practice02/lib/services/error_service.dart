import '../models/validation_error.dart';

/// Сервис для обработки и преобразования ошибок валидации
class ErrorService {
  const ErrorService();

  /// Преобразует ошибку валидации в пользовательское сообщение
  String getErrorMessage(ValidationError? error) {
    if (error == null) return '';
    return error.message;
  }

  /// Проверяет, есть ли ошибки в списке
  bool hasErrors(List<ValidationError?> errors) {
    return errors.any((error) => error != null);
  }

  /// Получает все сообщения об ошибках из списка
  List<String> getErrorMessages(List<ValidationError?> errors) {
    return errors
        .where((error) => error != null)
        .map((error) => error!.message)
        .toList();
  }

  /// Объединяет несколько ошибок в одну строку
  String combineErrors(List<ValidationError?> errors, {String separator = '\n'}) {
    final messages = getErrorMessages(errors);
    return messages.join(separator);
  }
}