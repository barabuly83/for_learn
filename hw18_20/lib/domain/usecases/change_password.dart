import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class ChangePasswordParams extends Equatable {
  const ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  List<Object?> get props => [currentPassword, newPassword];
}

class ChangePassword implements UseCase<void, ChangePasswordParams> {
  const ChangePassword(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(ChangePasswordParams params) async {
    return await repository.changePassword(
      params.currentPassword,
      params.newPassword,
    );
  }
}