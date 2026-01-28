// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
  id: (json['id'] as num).toInt(),
  question: json['question'] as String,
  description: json['description'] as String?,
  answers: Answers.fromJson(json['answers'] as Map<String, dynamic>),
  multipleCorrectAnswers: json['multiple_correct_answers'] as String,
  correctAnswers: Question._correctAnswersFromJson(json['correctAnswers']),
  correctAnswer: json['correct_answer'] as String?,
  explanation: json['explanation'] as String?,
  tip: json['tip'] as String?,
  tags: Question._tagsFromJson(json['tags']),
  category: json['category'] as String,
  difficulty: json['difficulty'] as String,
);

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'description': instance.description,
  'answers': instance.answers,
  'multiple_correct_answers': instance.multipleCorrectAnswers,
  'correctAnswers': instance.correctAnswers,
  'correct_answer': instance.correctAnswer,
  'explanation': instance.explanation,
  'tip': instance.tip,
  'tags': instance.tags,
  'category': instance.category,
  'difficulty': instance.difficulty,
};
