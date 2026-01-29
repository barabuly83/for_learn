import '../models/validation_error.dart';

abstract class Validator<T> {
  const Validator();

  ValidationError? validate(T? value);
}