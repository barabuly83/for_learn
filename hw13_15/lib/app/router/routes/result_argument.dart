/// Аргументы для маршрута результата викторины
class ResultArgument {
  const ResultArgument({
    required this.category,
    required this.correctAnswers,
  });

  final String category;
  final String correctAnswers;

  factory ResultArgument.fromJson(Map<String, dynamic> json) => ResultArgument(
        category: json['category'] as String,
        correctAnswers: json['correctAnswers'] as String,
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'correctAnswers': correctAnswers,
      };
}
