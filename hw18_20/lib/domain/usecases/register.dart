import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}

class Register implements UseCase<User, RegisterParams> {
  const Register(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(params);
  }
}
