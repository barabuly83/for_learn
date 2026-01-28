import 'package:cloud_firestore/cloud_firestore.dart';

/// Модель результата викторины
class QuizResult {
  const QuizResult({
    required this.id,
    required this.userId,
    required this.category,
    required this.score,
    required this.totalQuestions,
    required this.percentage,
    required this.timeSpent,
    required this.timestamp,
  });

  final String id;
  final String userId;
  final String category;
  final int score;
  final int totalQuestions;
  final int percentage;
  final int timeSpent; // в секундах
  final DateTime timestamp;

  factory QuizResult.fromJson(Map<String, dynamic> json) => QuizResult(
        id: json['id'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        category: json['category'] as String,
        score: json['score'] as int,
        totalQuestions: json['totalQuestions'] as int,
        percentage: json['percentage'] as int,
        timeSpent: json['timeSpent'] as int,
        timestamp: json['timestamp'] is DateTime
            ? json['timestamp'] as DateTime
            : json['timestamp'] is String
                ? DateTime.parse(json['timestamp'] as String)
                : json['timestamp'] is Timestamp
                    ? (json['timestamp'] as Timestamp).toDate()
                    : json['timestamp'] is int
                    ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int)
                    : DateTime.fromMillisecondsSinceEpoch(0),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'category': category,
        'score': score,
        'totalQuestions': totalQuestions,
        'percentage': percentage,
        'timeSpent': timeSpent,
        'timestamp': timestamp.toIso8601String(),
      };

  /// Получить время в читаемом формате
  String get timeSpentFormatted {
    final duration = Duration(seconds: timeSpent);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// Получить дату в читаемом формате
  String get dateFormatted {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      return 'Сегодня';
    } else if (difference.inDays == 1) {
      return 'Вчера';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} дней назад';
    } else {
      return '${timestamp.day}.${timestamp.month}.${timestamp.year}';
    }
  }
}