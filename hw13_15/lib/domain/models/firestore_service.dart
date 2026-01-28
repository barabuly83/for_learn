import 'package:cloud_firestore/cloud_firestore.dart';

/// Сервис для работы с Firestore
class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  /// Сохранить результат викторины пользователя
  Future<void> saveQuizResult({
    required String userId,
    required String category,
    required int score,
    required int totalQuestions,
    required Duration timeSpent,
  }) async {
    try {
      // print('🔄 Firestore: Saving quiz result...');
      // print('Data: userId=$userId, category=$category, score=$score/$totalQuestions');

      await _firestore.collection('quiz_results').add({
        'userId': userId,
        'category': category,
        'score': score,
        'totalQuestions': totalQuestions,
        'percentage': (score / totalQuestions * 100).round(),
        'timeSpent': timeSpent.inSeconds,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // print('❌ Firestore: Error saving quiz result: $e');
      rethrow;
    }
  }

  /// Получить результаты викторин пользователя
  Future<List<Map<String, dynamic>>> getUserQuizResults(String userId) async {
    try {
      // Временно без orderBy, чтобы проверить работу запроса
      final querySnapshot = await _firestore
          .collection('quiz_results')
          .where('userId', isEqualTo: userId)
          .get();

      final results = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return data;
      }).toList();

      // Сортируем вручную по timestamp descending
      results.sort((a, b) {
        final aTimestamp = a['timestamp'];
        final bTimestamp = b['timestamp'];

        DateTime aDate;
        DateTime bDate;

        if (aTimestamp is Timestamp) {
          aDate = aTimestamp.toDate();
        } else if (aTimestamp is DateTime) {
          aDate = aTimestamp;
        } else {
          aDate = DateTime.fromMillisecondsSinceEpoch(0);
        }

        if (bTimestamp is Timestamp) {
          bDate = bTimestamp.toDate();
        } else if (bTimestamp is DateTime) {
          bDate = bTimestamp;
        } else {
          bDate = DateTime.fromMillisecondsSinceEpoch(0);
        }

        return bDate.compareTo(aDate); // descending
      });

      return results;
    } catch (e) {
      rethrow;
    }
  }

  /// Сохранить пользовательские настройки
  Future<void> saveUserSettings(
    String userId,
    Map<String, dynamic> settings,
  ) async {
    await _firestore.collection('user_settings').doc(userId).set(settings);
  }

  /// Получить пользовательские настройки
  Future<Map<String, dynamic>?> getUserSettings(String userId) async {
    final doc = await _firestore.collection('user_settings').doc(userId).get();
    return doc.data();
  }

  /// Сохранить избранную категорию
  Future<void> saveFavoriteCategory(String userId, String category) async {
    await _firestore.collection('favorites').doc(userId).set({
      'categories': FieldValue.arrayUnion([category]),
    }, SetOptions(merge: true));
  }

  /// Получить избранные категории пользователя
  Future<List<String>> getFavoriteCategories(String userId) async {
    final doc = await _firestore.collection('favorites').doc(userId).get();
    final data = doc.data();
    final categories = data?['categories'];
    if (categories is List) {
      return List<String>.from(categories);
    }
    return [];
  }
}
