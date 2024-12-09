import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginWithGoogle();
  bool getLoginStatus();
  Future<String?> getRole();
  Future<void> setRole(String role);
  Future<void> logout();
}
