import 'package:freezed_annotation/freezed_annotation.dart';

part 'answers.freezed.dart';
part 'answers.g.dart';

/// Модель ответов на вопрос викторины
@freezed
class Answers with _$Answers {
  const factory Answers({
    @JsonKey(name: 'answer_a') required String answerA,
    @JsonKey(name: 'answer_b') required String answerB,
    @JsonKey(name: 'answer_c') required String answerC,
    @JsonKey(name: 'answer_d') required String answerD,
    @JsonKey(name: 'answer_e') String? answerE,
    @JsonKey(name: 'answer_f') String? answerF,
  }) = _Answers;

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);
}
