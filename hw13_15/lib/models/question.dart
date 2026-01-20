import 'package:freezed_annotation/freezed_annotation.dart';
import 'answers.dart';

part 'question.freezed.dart';
part 'question.g.dart';

/// Модель вопроса викторины
@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required String description,
    required Answers answers,
    @JsonKey(name: 'multiple_correct_answers') required String multipleCorrectAnswers,
    @JsonKey(name: 'correct_answers') required Map<String, String> correctAnswers,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    required String explanation,
    String? tip,
    required List<String> tags,
    required String category,
    required String difficulty,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
