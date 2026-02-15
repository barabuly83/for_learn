import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.server({required String message}) = ServerFailure;
  const factory Failure.cache({required String message}) = CacheFailure;
  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.auth({
    required String message,
    required String code,
  }) = AuthFailure;

  const Failure._();
}

/// Create AuthFailure from Firebase Auth exception code
AuthFailure authFailureFromFirebaseCode(String code) {
  switch (code) {
    case 'user-not-found':
      return const AuthFailure(message: 'user-not-found', code: 'user-not-found');
    case 'wrong-password':
    case 'invalid-credential':
      return const AuthFailure(message: 'wrong-password', code: 'wrong-password');
    case 'email-already-in-use':
      return const AuthFailure(message: 'email-already-in-use', code: 'email-already-in-use');
    case 'weak-password':
      return const AuthFailure(message: 'weak-password', code: 'weak-password');
    case 'invalid-email':
      return const AuthFailure(message: 'invalid-email', code: 'invalid-email');
    case 'user-disabled':
      return const AuthFailure(message: 'user-disabled', code: 'user-disabled');
    case 'too-many-requests':
      return const AuthFailure(message: 'too-many-requests', code: 'too-many-requests');
    case 'operation-not-allowed':
      return const AuthFailure(message: 'operation-not-allowed', code: 'operation-not-allowed');
    case 'requires-recent-login':
      return const AuthFailure(message: 'requires-recent-login', code: 'requires-recent-login');
    default:
      return AuthFailure(message: code, code: code);
  }
}