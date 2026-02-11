import 'package:firebase_auth/firebase_auth.dart';

import 'auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw Exception('Не удалось войти в систему');
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Ошибка входа: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw Exception('Не удалось создать пользователя');
      }

      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();

      // Получаем обновленного пользователя
      final updatedUser = _auth.currentUser;
      if (updatedUser == null) {
        throw Exception('Не удалось получить данные пользователя');
      }

      return UserModel.fromFirebaseUser(updatedUser);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Ошибка регистрации: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Ошибка выхода: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      return user != null ? UserModel.fromFirebaseUser(user) : null;
    } catch (e) {
      throw Exception(
        'Ошибка получения текущего пользователя: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception(
        'Ошибка отправки email для восстановления пароля: ${e.toString()}',
      );
    }
  }

  /// Обработка исключений Firebase Auth с понятными сообщениями на русском
  Exception _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return Exception('Пароль слишком слабый');
      case 'email-already-in-use':
        return Exception('Этот email уже используется');
      case 'invalid-email':
        return Exception('Некорректный email адрес');
      case 'user-not-found':
        return Exception('Пользователь с таким email не найден');
      case 'wrong-password':
        return Exception('Неверный пароль');
      case 'user-disabled':
        return Exception('Пользователь заблокирован');
      case 'too-many-requests':
        return Exception('Слишком много запросов. Попробуйте позже');
      case 'operation-not-allowed':
        return Exception('Операция не разрешена');
      case 'missing-email':
        return Exception('Email обязателен для восстановления пароля');
      default:
        return Exception('Ошибка аутентификации: ${e.message ?? e.code}');
    }
  }
}
