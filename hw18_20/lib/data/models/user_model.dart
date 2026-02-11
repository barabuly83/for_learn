import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    super.createdAt,
    super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  /// Создает UserModel из Firebase User
  factory UserModel.fromFirebaseUser(firebase_auth.User firebaseUser) {
    return UserModel(
      id: firebaseUser.uid,
      name:
          firebaseUser.displayName ??
          firebaseUser.email?.split('@')[0] ??
          'User',
      email: firebaseUser.email ?? '',
      password: '', // Пароль не хранится в Firebase User
      createdAt: firebaseUser.metadata.creationTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'createdAt': createdAt?.toIso8601String(),
      'avatarUrl': avatarUrl,
    };
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      password: password,
      createdAt: createdAt,
      avatarUrl: avatarUrl,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
      avatarUrl: user.avatarUrl,
    );
  }
}
