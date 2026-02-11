import '../models/user_model.dart';

/// Абстракция для удаленного источника данных аутентификации (Firebase Auth)
/// Скрывает детали реализации работы с Firebase Authentication
abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<UserModel> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> changePassword(String currentPassword, String newPassword);
}
