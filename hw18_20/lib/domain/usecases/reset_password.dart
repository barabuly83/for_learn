import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class ResetPassword implements UseCase<void, ResetPasswordParams> {
  const ResetPassword(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(ResetPasswordParams params) async {
    return await repository.sendPasswordResetEmail(params.email);
  }
}
