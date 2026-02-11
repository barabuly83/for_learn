import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.createdAt,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final DateTime? createdAt;
  final String? avatarUrl;

  @override
  List<Object?> get props => [id, name, email, password, createdAt, avatarUrl];
}
