import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_argument.freezed.dart';
part 'result_argument.g.dart';

/// Аргументы для маршрута результата викторины
@freezed
class ResultArgument with _$ResultArgument {
  const factory ResultArgument({
    required String category,
    required String correctAnswers,
  }) = _ResultArgument;

  factory ResultArgument.fromJson(Map<String, dynamic> json) =>
      _$ResultArgumentFromJson(json);
}
