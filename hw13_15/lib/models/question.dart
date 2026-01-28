import 'package:json_annotation/json_annotation.dart';
import 'answers.dart';

part 'question.g.dart';

/// Модель вопроса викторины
@JsonSerializable()
class Question {
  final int id;
  final String question;
  final String? description;

  @JsonKey(name: 'answers')
  final Answers answers;

  @JsonKey(name: 'multiple_correct_answers')
  final String multipleCorrectAnswers;

  @JsonKey(fromJson: _correctAnswersFromJson)
  final Map<String, String> correctAnswers;

  @JsonKey(name: 'correct_answer')
  final String? correctAnswer;

  final String? explanation;
  final String? tip;

  @JsonKey(fromJson: _tagsFromJson)
  final List<String> tags;

  final String category;
  final String difficulty;

  const Question({
    required this.id,
    required this.question,
    this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    this.correctAnswer,
    this.explanation,
    this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  static Map<String, String> _correctAnswersFromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return json.map(
        (key, value) => MapEntry(
          key,
          value == true ? 'true' : value == false ? 'false' : value.toString(),
        ),
      );
    }
    return {};
  }

  static List<String> _tagsFromJson(dynamic json) {
    if (json is List) {
      return json.map<String>((tag) {
        if (tag is String) return tag;
        if (tag is Map && tag.containsKey('name')) {
          return tag['name'] as String;
        }
        return tag.toString();
      }).toList();
    }
    return [];
  }
}
