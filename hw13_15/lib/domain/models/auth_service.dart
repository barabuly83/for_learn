import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Интерфейс сервиса аутентификации
abstract class AuthService {
  /// Получить текущего пользователя
  User? get currentUser;

  /// Stream состояния аутентификации
  Stream<User?> get authStateChanges;

  /// Stream изменений статуса аутентификации для роутера
  Stream<bool> get authStatusChanged;

  /// Проверка, аутентифицирован ли пользователь
  bool get isAuthenticated;

  /// Регистрация с email и паролем
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Вход с email и паролем
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Выход
  Future<void> signOut();

  /// Вход через Google
  Future<UserCredential> signInWithGoogle();
}

/// Реализация сервиса аутентификации
class AuthServiceImpl implements AuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthServiceImpl({required FirebaseAuth firebaseAuth}) : _auth = firebaseAuth;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Stream<bool> get authStatusChanged =>
      _auth.authStateChanges().map((user) => user != null);

  @override
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }
}
