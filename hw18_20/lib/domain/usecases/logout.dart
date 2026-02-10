import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class Logout implements UseCase<void, NoParams> {
  const Logout(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.logout();
  }
}
