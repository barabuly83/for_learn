import 'package:json_annotation/json_annotation.dart';

part 'answers.g.dart';

/// Модель ответов на вопрос викторины
@JsonSerializable()
class Answers {
  @JsonKey(name: 'answer_a')
  final String? answerA;

  @JsonKey(name: 'answer_b')
  final String? answerB;

  @JsonKey(name: 'answer_c')
  final String? answerC;

  @JsonKey(name: 'answer_d')
  final String? answerD;

  @JsonKey(name: 'answer_e')
  final String? answerE;

  @JsonKey(name: 'answer_f')
  final String? answerF;

  const Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
    this.answerE,
    this.answerF,
  });

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersToJson(this);
}
