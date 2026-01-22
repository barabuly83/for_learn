import 'answers.dart';

/// Модель вопроса викторины
class Question {
  const Question({
    required this.id,
    required this.question,
    required this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    this.correctAnswer,
    required this.explanation,
    this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  final int id;
  final String question;
  final String description;
  final Answers answers;
  final String multipleCorrectAnswers;
  final Map<String, String> correctAnswers;
  final String? correctAnswer;
  final String explanation;
  final String? tip;
  final List<String> tags;
  final String category;
  final String difficulty;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'] as int,
        question: json['question'] as String,
        description: json['description'] as String,
        answers: Answers.fromJson(json['answers'] as Map<String, dynamic>),
        multipleCorrectAnswers: json['multiple_correct_answers'] as String,
        correctAnswers: Map<String, String>.from(json['correct_answers'] as Map),
        correctAnswer: json['correct_answer'] as String?,
        explanation: json['explanation'] as String,
        tip: json['tip'] as String?,
        tags: List<String>.from(json['tags'] as List),
        category: json['category'] as String,
        difficulty: json['difficulty'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'description': description,
        'answers': answers.toJson(),
        'multiple_correct_answers': multipleCorrectAnswers,
        'correct_answers': correctAnswers,
        'correct_answer': correctAnswer,
        'explanation': explanation,
        'tip': tip,
        'tags': tags,
        'category': category,
        'difficulty': difficulty,
      };
}
