import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class Register implements UseCase<User, User> {
  const Register(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(User params) async {
    return await repository.register(params);
  }
}